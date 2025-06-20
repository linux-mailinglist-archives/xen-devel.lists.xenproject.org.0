Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E19DAE1B62
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 15:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020960.1397075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSbN1-0007UU-P2; Fri, 20 Jun 2025 13:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020960.1397075; Fri, 20 Jun 2025 13:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSbN1-0007Rc-JQ; Fri, 20 Jun 2025 13:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1020960;
 Fri, 20 Jun 2025 13:01:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSbN0-0007Qw-Fo
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 13:01:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:200a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa253e0c-4dd6-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 15:01:24 +0200 (CEST)
Received: from MN0P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::34)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Fri, 20 Jun
 2025 13:01:18 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::26) by MN0P221CA0014.outlook.office365.com
 (2603:10b6:208:52a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 13:01:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 13:01:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 08:01:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 08:01:17 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 08:01:17 -0500
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
X-Inumbo-ID: aa253e0c-4dd6-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4Pmv9NTqGvBPZvgxRITC0B3WfJdjKrHRQeXJqSP9oZyuXjVqY/LX1xkXcOhb6OQOXDIMkY281gHCMWyETEKmnpfJOh4tv3HmufBOSRCY/Y6vvjhhbaJclvjfBl6KZ+X5sIrdK4+q9UkXXcAny6FaaVXmmSpXOl2A4Os4MjfK5XGOgmB+puG3+XlG7zZnLka76d8QP8xGN0nkm1aYGG421QWJzAeiybUOgxDezkGqT61fV7DZASKPSDcqR94NOlwzpDw9oL9PoUew5/oVJnIo9mUZfKfG28sVThoz9YXdog8NS6DIrJUvtPkcEFtrzPGWPhDfjGg3rhhhJbCtZpfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gYEWxgGIBDB1QfElst6qClQ/szbg3vVVoG0vci7qjI=;
 b=HlibnWt2sO7OGanUtXWvcq0fCICzrE8KfVaTdtzIBkzJyfXJ7VFJT8/AVwoyFiP3Kuz4jCDYfTFXTOecNtZpheJs5nKkkg/5mRq7h2q7CZz/QRTQC8eCHmXZSaYIHYkf5D8aQTRg6nJGVefVqdqaqgyJO51gWadVp83i1WFOJUlt+KnXstbxLeBKkoheIWIIVXhptbMp4MwJ4g5T9S5k2HP7hWGKUZqNH91mGc16dFiKY9B4iewBum3XHjgQp280zM3/h89Yx8X4HkRbJdE9mTvaiKz71d/GUIYXqPrinyl/oh2gcdM/EHYQBCRisD1y/adPynlaygk0BdwtgRIOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gYEWxgGIBDB1QfElst6qClQ/szbg3vVVoG0vci7qjI=;
 b=WTaxcYVmJBVz/C9vdqjY+d1bfGGkJoLUW3xaC8v9lyEeRqGgOpp8CjfJvgQWTUdz6bO6QqbKyr9SltBOz2mqwn/Yqy9jsN5SGFp01TWRd+zoigYDFkrDY8PTN2j8O/AgYBfffm1AJllASMqMF3jZ6s60u6IltCck1kv/Smlys1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3ff67738-5590-4dce-b2e5-6a627281062a@amd.com>
Date: Fri, 20 Jun 2025 09:01:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 12/12] mini-os: kexec: do the final kexec step
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250616084619.11112-1-jgross@suse.com>
 <20250616084619.11112-13-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250616084619.11112-13-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dca5c95-6085-4ea6-2423-08ddaffa8c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0Jndm5RdElseS9FR2xVQVp0VWRJNkRUZVU4czk3M1QySERRcWpickh2YTBQ?=
 =?utf-8?B?LytUSE1RbnQvMUtyZUZrYXRBWVZQd1VtTkFRMkNVS3dJTHNMYythUFRCdTd5?=
 =?utf-8?B?c1NxeGJpMkFMMzRXSUFPTTFhMGZTSmRWdjZ4OGJDTHpmcW1hSnVON3E5NUhZ?=
 =?utf-8?B?TjllazdoVVVtVWhGc2M4VmlUd3pCVThsUHNuallxSFBldGJVaFNKOWhwZTRR?=
 =?utf-8?B?a0RTdWhiNXlwa3UwcFNOSFF3SDBZcWhYL3c1UGIzK2dNR2ZodHI3M2VzOHVG?=
 =?utf-8?B?MmtnaG1MOGpIc0ljZDQ2SmZRaGhvYXEyWVNrenRhN3FSaEZVYkt0dHNuVCsz?=
 =?utf-8?B?TEJKNmF2YWVua2phSldFSkdzTHpOWXk5SUZhOW5UcEZ3ZkFYZlhnQ1lkMWd6?=
 =?utf-8?B?ZGpIL3I3MG9kTzBjV2tIZGJQSXcydnRHcDJpNUhCamM4UDloVktaWGRHQWhH?=
 =?utf-8?B?UGVlVFlFMTB1cm9GNVNJNnI2NytGVDBEOVYvZzFBb2ZLbDMvRStGbHhDcGRZ?=
 =?utf-8?B?akZGQy9XZjJ6dmFsbTFPZEZQKzdVN052aVg5Qk9hdmpjc0ptNXpqUmw2Wmhh?=
 =?utf-8?B?cDZXSjRQVy80MytVUkxwNmU2MTRLR2NFZExPQWxoNzZVR1p4K1VFUmdnczkw?=
 =?utf-8?B?OW8zbndQTWFlTGN0U2RwWXQwZG1iemlTNFVTckdLN3hYRlpINjFRUklMeG55?=
 =?utf-8?B?UzM5ZTdQdFBFeVNtVmtwemRVTzJCK3BtQ05pUUZ2KzlBUnB6UXowQXNTRGpM?=
 =?utf-8?B?SkVlYUxnNHZla2VwMzVlRVBjVXZ0SXZXM0t5cVdScWdIRXczU2EzK0RaM3p3?=
 =?utf-8?B?WGxrSldUR2NVWmdxUzRoVWt2QTNsc0padk82YU1CU1AyQXhVVXp0UmljejI4?=
 =?utf-8?B?RENUMVVLaXY1WXc1YzJJMVNIb2RWRjYraWVrVnlWVkZEWmxnTGpNY04rdUN0?=
 =?utf-8?B?MllXRFNNbnB1bEF3VzQ5NlBZbmJHT0MrcUZOeElsanhuQXFncE0yeHk4Zjhl?=
 =?utf-8?B?UThzc1l3VHZwd1d2ekpQSlFtT1dJb3ZNMEJlYTNHbmpoalMzNlZ1YnE1TUxy?=
 =?utf-8?B?Vm1OOUtEdzBvN3UyT0wzdzlmRUdyQ29jT1pEeGZueU9ZL1VuUEQ3QzhIb3I5?=
 =?utf-8?B?WThvTTNFaHBXMmNGdkprZUZDOUUveTlNaS9EWUNTZ3NoQ1o1Y1VLemI5dWZH?=
 =?utf-8?B?TVQreVRJSzVOREEzNlZTYVVjMXp6dk1HanJDWEZJdDZ0NmJ6aTB2ZDMzTnJz?=
 =?utf-8?B?dDBRLzNYeHNkNlZvdVpTTlFjNERZNHdBYXl2TUVIdWQ4MzZQck9Lc0t2d2lm?=
 =?utf-8?B?SFhxcjVNdy9ybVZzRDMrYUIwWGNaYTF1WHRVMEpXS1RZUnVoczVEYXJwTGhF?=
 =?utf-8?B?WUxpeTd2SEI3M3JNVEZ1dk05L3d6YXBOQ0VqWUpJbmora3I4SmpLQnNDOGJn?=
 =?utf-8?B?dFBkeUp4VWxkN3FwcXFDRnJaQi9rTDRWYkVmcHJZYndRdGY4RWh5U00vbFg2?=
 =?utf-8?B?dnNxSXpsbzlHSDhGNjMwazBHdFlBMlZIL0FWVUhNRjJqc2tIeWJKRkM4Qmwr?=
 =?utf-8?B?RmgyMGF1aWl2M1BRSzJMMUhXQWlWVDY4V09mbmNUckdQV0Z0bGVwMUxsUm9Y?=
 =?utf-8?B?MFp3REg1WWMxcTQ2YnJONFBHV3I2eHNmM0dyeTBFcmY2TXhyRXVDOWc5QnRh?=
 =?utf-8?B?dlRDNGFhbGg2S1BhWWJvWVJXWkcwVHZiR3JFRmJnVzMzOWY3dTFCNmJrVW03?=
 =?utf-8?B?Vzl2V211TlQ5S3ovRmFQa1UrZlZSYnlGbE94ejZZZk43QXphaGFxTzlCUWg5?=
 =?utf-8?B?dFlQV1FoTmlQTitsTjdtb3pST1lNMkpya0VBQkJPc3N2SU5ncFl5b2hkRmdY?=
 =?utf-8?B?b0NYNStIeC9Sb2tSdVAzdnpZK0diZUxwb0EybnJNY0lwN1U2T2l3aEVjSW9i?=
 =?utf-8?B?ajhYelY4dWZKdXQ0S040VnZiMmJaTnNGQzQyR280S2xWRUhROVlMVisxeGU3?=
 =?utf-8?B?a0NUTTc4c3BUbU16S0xuODdzZkM0eGMyUlg1UzBpaXZHTzJMcmpIQUk2ZEpr?=
 =?utf-8?Q?w8xrts?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:01:18.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dca5c95-6085-4ea6-2423-08ddaffa8c36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440

On 2025-06-16 04:46, Juergen Gross wrote:
> With all kexec preparations done, activate the new kernel.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

