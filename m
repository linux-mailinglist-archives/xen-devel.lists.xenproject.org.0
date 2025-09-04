Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C10EB43E61
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110273.1459546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAlh-0004JW-50; Thu, 04 Sep 2025 14:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110273.1459546; Thu, 04 Sep 2025 14:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAlh-0004HM-21; Thu, 04 Sep 2025 14:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1110273;
 Thu, 04 Sep 2025 14:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04yg=3P=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uuAlf-0004HE-VP
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:16:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2413::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb6e2d02-8999-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 16:16:49 +0200 (CEST)
Received: from BN0PR04CA0127.namprd04.prod.outlook.com (2603:10b6:408:ed::12)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 14:16:46 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::f6) by BN0PR04CA0127.outlook.office365.com
 (2603:10b6:408:ed::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 14:16:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 14:16:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 09:16:44 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 09:16:43 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cb6e2d02-8999-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nihkuabmQ+XtHsDCqljTS4KKPKFK4wssaudbcIFIH2BMscQ9wxk4l2d7x46R1UudcYzjdYnsL4/gwzqm2V76eXV3ocz9r2PXpNSpAaZ6+79eoEdDpRMtAEORMqirrPSL5dSZbtKMpAa0j7lgKie4p6rlm5lI/i5htU0KNbkEJhPRmJG53HAaL6CTphVL0JuIXt+GiXoPkUsfYxxrNBI1LowaWq+kIt50/qq/e5yTU1qFEnb0Uzj5IucHV0hxBmC3DAALVAN0Rr97U6YctASsUIYDgA19nqjgh/WYMvQwgmdvVu9khmFGQyk1VwmTTHU0EjSvzM219Qgq1Q/3VCkXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73SUVBZ6nW9unotFUaNLknrnE+H2gSnoW980g2+MLUM=;
 b=atAC4rVRKOclXywpus7TbO86BOnlHoQy0CS4R2Q2sczsJWSjEcGpkJzlHpSCEdRljkCUs/UAyAixoXdyKGLMzmt+ZF3mcnNa9l/FrB6g1qwyc+m2gKSoT2gTPmr4R3XrEC3UibI/piKsLItOtT1sNgDh6Qatb/JtVOIA7iQNgk4PgcTssxDBqKk5fGysxtiDowOi+ps5mLQ+5tfyi8U9mdLTms/Hh288xXs9Mja/JLchhtT7IvQfFmapQuG3NwGkozJNL5c0nJzrVUX6LU5Tbh00wM0araFgsh9lVSkOa0S+RcVsXW0H8zOFcNJHwgboj+52PKaU5ae08aIHkEWW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73SUVBZ6nW9unotFUaNLknrnE+H2gSnoW980g2+MLUM=;
 b=CF3P7myL7nMAL8DWVO71YwI0XY5z/ZGvXiotMSLeaz1LyxpY9yT3YRBcvnzZtKY3YYwQK5uuK0GwvvMgUcEzVWFbU5wII4rlnqYp+fnC/WdaP5+Ijf+UDl69ivS5xF54rt7IAgdVUI7o+VfpshaDNJzZj49L2CDFQMi+v0JMV/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <587d2566-b451-4385-ba49-062eca1d2acd@amd.com>
Date: Thu, 4 Sep 2025 15:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] imagebuilder: Add a script to check the sanity of
 device tree
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, <mark.brown@parrylabs.com>,
	<matthew.l.weber3@boeing.com>, <sookyung.ahn@boeing.com>
References: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
 <20f5b553-75a6-43b3-9b2f-1cf73b9589c3@amd.com>
 <ce4c05ed-6fb0-4735-b0d5-ab264c5f946e@amd.com>
In-Reply-To: <ce4c05ed-6fb0-4735-b0d5-ab264c5f946e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 164fba5b-e25a-4082-a8e1-08ddebbdade0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUpveUQzTzBDWHFkbWdUcVZXdlVWZEEwNStOTkRvdmNncHViTFV5YitLSFlZ?=
 =?utf-8?B?QTVYcXdoYUtBdHJ1emtVVjFUcGdOa291WkpJNlh1UW9CYUdsa2drQ1dvNmtu?=
 =?utf-8?B?QkNDL1lVbHN0WVNqWUtsN2QxZDN4a3dkeEt1ZkpWZ2Y1VnRGTWtzcmhCOTQv?=
 =?utf-8?B?bnZNV1pCSUJ6NlRaTWFydFRORUNNQTJtTkNCL1ZiRWNUMW5NUG5hSEFab2Q1?=
 =?utf-8?B?S3FXUURsLzNQZjJnUDhZdmtVVHlpMDlJdUI5dkRHc21tbmk4Q1RydHh2MlFE?=
 =?utf-8?B?ejhtMDRFcXNYSkdRbmpRUW1rTTN2eFBldHBLa0EyVC9Xc0xmWnhnQUxjMnRR?=
 =?utf-8?B?THZnampDRHdWU1dzNzlnOFJRMnBSeGpUc3BoSkdjM3RWV0VmWjZhR29FTEtm?=
 =?utf-8?B?WVR0OWVGSVJSZnJJSHlpYTZXQUVLamE0YmdGTStvSk1ESHFoWVNDUGRmM2xF?=
 =?utf-8?B?TFlkcHRvaW9LT2ltODhWRW5IQ1p4eGRWeTdEVHZ4VnRYaDViTzNCTCt0UkIy?=
 =?utf-8?B?RUJhOTdrVlljN1J3NXdWc05ZWElCRFFweHViMFNTeEtrSUR3OUp4d2RFb2ZD?=
 =?utf-8?B?SzJzdDZPMmFzb2M2UksxbjhnL1phd2JueXAya1BWZ0V1eU9ZUzh2NG5SUUdq?=
 =?utf-8?B?RVNPZ2lkeFNSeDF2VEQ2WTJ0UHhTY1ZHbmIyck9GOXQ3RGdPb01rOERVNit6?=
 =?utf-8?B?L24vZVYyOGQ1QllkelNXWHV3cFFuWXV3aG1vRDF0Q1ZlM3ZDVERSaHhHL0tm?=
 =?utf-8?B?VDlwZmVCRnhhQkJqZE9XcXJqSTBpWUhydDZkb3I4enppZ0RrZEhvcUxzejd6?=
 =?utf-8?B?RXppNk9senVCT0dwQnZYcjZvc1B0dnJHUGw1ckRHMHlGVGdBNWJMdG9yTE1J?=
 =?utf-8?B?QWk2RmMxY25ndjFEcUtpSHVsNzY2aUVWU2hUVEI2SzZkYys1TjdEeWxxT2Nw?=
 =?utf-8?B?UVl0dmNLMlhzL2FrOVRIbCswZ3lFU1BxeTM1TFZMMWxpWG5lYmRFMmw3TUJZ?=
 =?utf-8?B?UGpTcEgrMWxob0hWajd4RzkySGgyVXVobjgwN24xMFFOMWYvWkpPVWdBN0dI?=
 =?utf-8?B?TGxjVVkvTExuU3lEUVdvQzFYVGQ2R25MaGZTcW5UT3IrcHg2anIxa01qSGty?=
 =?utf-8?B?Y2dTS0FYTjlVT2I2dllUZEQ4bU5xYjlJbmJwaGhwcXUwaGJkeTR3bnJ1RGox?=
 =?utf-8?B?KzE3TTNnMjVOczJBMDBaRklwcFgrMkVCZ21DQlJXZnkwdUVRR3ZSNVNvQ3N4?=
 =?utf-8?B?M1d0ZGxRSnloMkxEM1hCeVE2L0dDS0h5TklBR1lOUmYwSVlkNUFobkJNTDdm?=
 =?utf-8?B?NjAvQVJsa09uRk9tZFAwVXVSZ0J4ZDdPMFk3QnRnYUs0SjV4NzZ0R2IxaGJW?=
 =?utf-8?B?M3BJc0Y0RzJZazcrYlgxeWRpSkJEUFY4SS9NcmtKZGNpT1RqVWZrRTYrNS9M?=
 =?utf-8?B?N2NZZVp5SnVWNGdDQlc2WWtkdmV1SE1za24zNyt0UWU4bzNYdkNTRXZpQ1Zq?=
 =?utf-8?B?UE9DWUV1Um5Id3d1eFdGajQ5cmExQkRPZGhSVmxOV3kvY0p4MFIyenUraUR4?=
 =?utf-8?B?dHZzVFFGb3pTUEhzQzRrR3pBM1ZmT2JYYnpURTRxTk1qcDc1NlhSYlJnSkI5?=
 =?utf-8?B?UnJNdjhrZW44bFFwNk1vVmV0STZMdzd3b2h4VC95WVkzUnNhVGZNYWxYT0ll?=
 =?utf-8?B?UWJ2dmsvMEdhZjNML3hoT2Z4TU84MGJqdEtIQmYyRzlxNVEzUHlkelZJWlBI?=
 =?utf-8?B?eTQ4aTJxVDIvU1Vrbk9rMlZQRWUvcE5naERjMDhnbGFlQmwydE9jbmJlV3kx?=
 =?utf-8?B?aldFNFBaYnVjZnZoeXIzUDk1Nmh2SHBMS0NMUzVWc3c3Q0NkMkU2d3VncHR3?=
 =?utf-8?B?RDlGd2lFUTl4VTI3R1NzS09vMThHNUsvWkd0M2NNUVQ3MTR2b3Exc0JnTldj?=
 =?utf-8?B?cGkvaXlETDI2YnIxeDlUWG5wRXA3dGNFR1d3eW4wekVrdXNWSUZHWlY2SDZl?=
 =?utf-8?B?V05GeHZFWk96NFlJUDVvSGZUcGZ4ZCtOdE8wMWlmVm51c25KVzlRNExzRTBS?=
 =?utf-8?Q?bxasQz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:16:45.4573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164fba5b-e25a-4082-a8e1-08ddebbdade0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980

Hi,

On 01/09/2025 14:51, Ayan Kumar Halder wrote:
> Hi Michal,
>
> On 01/09/2025 14:17, Orzel, Michal wrote:
>>
>> On 01/09/2025 14:31, Ayan Kumar Halder wrote:
>>> Xen gives a panic if certain nodes are not present in the device 
>>> tree. In order
>>> to prevent this panic, scripts/dt_sanity.py is written so that it 
>>> checks if the
>>> node/s are present. If the node/s are not present, the script gives 
>>> an error.
>>>
>>> User is expected to run the script against the device tree before 
>>> booting Xen
>>> with dtb.
>>
One thing I forgot to mention is that as part of safety certification, 
we do need to do "Failure mode and error analysis". This means 
describing the scenarios in which Xen can fail to perform its regular 
functionality and coming up with prevention, detection and mitigation 
measures.

One can argue that the panics caused by system misconfiguration, are the 
most straightforward of all the errors. However, we do need to define 
prevention mechanisms to avoid these panics. For this particular 
failure, the prevention mechanism can be described as manually looking 
into the device tree to ensure that the nodes expected by Xen, are 
present. The script aims to provide a better alternative.

This script is not meant to catch all possible panics. However we do 
want to have such scripts and utilities wherever possible, and document 
them as part of our FMEA.

May be a safety expert can comment if the approach makes sense.

- Ayan



