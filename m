Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829C593A1C7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763220.1173479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFmo-0005UZ-9a; Tue, 23 Jul 2024 13:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763220.1173479; Tue, 23 Jul 2024 13:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFmo-0005T3-6I; Tue, 23 Jul 2024 13:42:38 +0000
Received: by outflank-mailman (input) for mailman id 763220;
 Tue, 23 Jul 2024 13:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWFmn-0005Sx-Lw
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:42:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2418::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ae80639-48f9-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 15:42:35 +0200 (CEST)
Received: from SJ0PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:33f::32)
 by SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 13:42:30 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:33f:cafe::5e) by SJ0PR05CA0057.outlook.office365.com
 (2603:10b6:a03:33f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Tue, 23 Jul 2024 13:42:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 13:42:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 08:42:29 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 08:42:28 -0500
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
X-Inumbo-ID: 6ae80639-48f9-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q94Z90PHb9gmPJcmkyJAfnOOMBHh4eyoudGpVOT2kyE5nXVHt5GBruiJnuZn0vkHE1djQVNArfNI9NQyLPWF2uz2XvnHaxUptU+BNFwhaleGgGhiQoRI+Y3Igpdfr7uP3EFAWUzZ8XUIvrXq+Pmq2valPOBus04uiL6unXlatMR6yGCn8VwAmsIv7eAkb0Tcs+bg42S5/Bz7T49sVEdLuQDH3k/qjZ5P/7NR5otKbft7RXdcbzVb3R73ilDddIIn9uUtNOdb43Xoi8VMxpLmnUSV9nXOH4b0UdORi09K4miTT6TZKFolVGy1/09w4fmDZaPPLKxULv/mvyx6gxsVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZOauvET1w9e7dNi8vg7Bmdrxj+nalFrRhfrFnkc3tM=;
 b=yEDyOs9ioy/kb22Hb1L1+QfmxtvxruRHIOpMWM+0TYyojmymdsea9MVASJeHwbYP0HKb2tWQdrkQFhs0rBVpUqMb1M/9WCLBAxflEOmrWy9UaDlUxy843xKIY/fxNOHlq3bQWt2iPlOjSlBe4T+Ll36AeApkT33DbDoi3xKCQk+kLfmC7dT+rmhv+3P13wKShpNyvYfVHZT3PIVKyp2gtq1qWUzmPjEsqyby2hlOQ/HmgBLHJKoQu/v2DPVBPMTsdgHCafs0HVsVZH0RWzfPDpgbunUvGar7nwTnuSwLcWGSDL6ldZXbwzIJfj7bOK4NOTyYF1vdDtF9WEl/nGtjzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZOauvET1w9e7dNi8vg7Bmdrxj+nalFrRhfrFnkc3tM=;
 b=3j1H0Kz/aFpIUjgC7yYpEYE9CZC8lzngmlY5KxQ6VzfIxaNA9J6t81P6nWxIygNKcjDuz2kQenRHxnmUHyjHY66v2lqD+YFE1h7akQVi+faftNS1a2G0UPyiLJesSXF8iAyyffDjg0C0vdX4vdxNlBem7oI2LEMCL0lvt391SpI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f1ccc312-9237-4cb2-8dc4-294d8c61ebdb@amd.com>
Date: Tue, 23 Jul 2024 09:19:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tools/libxs: Rationalise the definition of struct
 xs_handle
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240718164842.3650702-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: d318b0a9-8b91-45a0-c0a9-08dcab1d4c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTlFbFRPS0t3WUUzM0QxVWJQWlJaekJ5T1RkTkplY2l4OFVmNGFzNk5EclVh?=
 =?utf-8?B?ZktsUUM0QXNCZXMvUmhnZkpoL1ViNCtTTmMwUWdXOTVraEIrZENNeThtUjdP?=
 =?utf-8?B?ZkJNWC9YWXQxVE5PcGgwQWZTWERQRFhEeWVYMWh6T0xsM2dhOHRncVRhUjMy?=
 =?utf-8?B?TTd0YzdmU0d4K3hEV3AwS2RVbFBrUjlTb3NDMmpvMWVhai9NTS9NQmhja0sy?=
 =?utf-8?B?MnZKY2E0eE1qaEFFeXhReWwzekZDOXo4OEk0aDU0UytBSWtrczFpSFlWdWZ3?=
 =?utf-8?B?RDRIOW5nV3BiQjhubEIrc2NXRmkwUUVKS1JxNlN2RFdjYTBRZUh6bDNSdlBQ?=
 =?utf-8?B?VkpIb1pXTC8zcGlRdWpnR1diMkNLVXJIN2Y4dzlBRTdKenVCSTZQTDN6em5m?=
 =?utf-8?B?Y1hSY0R3TS9OYmk0b1N0T3RsNTErcThrVWxuazRNOHJiQlR1S09yeE1VTGpj?=
 =?utf-8?B?OWsvTVZnZlpsVjB5ckdlREFNUkVoc1p1VTlIckpJVnE2VUpQamNXd25PaE5R?=
 =?utf-8?B?OTJCMjRoeWRGc3Zrb0tPNU8vRExIRVJ2RFZTUnpPbU1SSnJ0T2phWDY1eEVE?=
 =?utf-8?B?cG5uZllaMGRVQy9lNE1VZmg1K1kvMjlSQnZRSnk5YjYxU2ZxQ2MzS2JOenIy?=
 =?utf-8?B?Q1F5bFdJZTVxM3hxK3dMRHpXdzRyalJ5UFRCVzNHamVXWVpWdlFDYloyNGNw?=
 =?utf-8?B?MzhEdHNzb0pTZzhibmNaTng2eTdtTzBqeStQL2NJNlV6TkRsOUZZb04wWE5G?=
 =?utf-8?B?R3V4MExiZTVNMnZkMHg1OW9KT3BkL2RHRGFLTHR3R3JHRmdpZHpRREVqWG42?=
 =?utf-8?B?eitwRFh5WVR2L1VxZkw1K3FWSXhmMFg5TkFBbjdYWXpheGh0bnNiYjNSWkxr?=
 =?utf-8?B?Z3RkRHZmNGlaZmhxYUZ2SFpTQnE1NS9LSTBVTW5tZjlUUTdDR282ZURWUU5W?=
 =?utf-8?B?OHJxVXNWN0I5akFDRDlzK1Y5TXZYbnVyaS9xZG5EZ2hScDFkMkg2S0pIV2Z0?=
 =?utf-8?B?QjBNZWp2WWpDMVlQdjlZemFOTEdkMGUzL0tSNVc5VzlERU52WWpaWXdHdGlC?=
 =?utf-8?B?dE1TRGRUU2JqNnZWby9vZHZFcmpuSEI2Z1BzbUUvc0JSYjhtRjlROVVmaG1S?=
 =?utf-8?B?MXdTME16OUl3VnhCWmo1ZXhyWCs0UDdVQWprVTljR0Raa1JsVlRpSUJrZS9N?=
 =?utf-8?B?QlVGeHNEYWRCMUlxWURyUFZHWldvR3VlS0Iyc3k3VjNtSU1vVG5YajZiM25z?=
 =?utf-8?B?L3YvZHM1M2QyMkZxK2x0UnNmbncrbUxOSHBRTnh1YW1JcGNFREl6UGlnSWFt?=
 =?utf-8?B?VmV1a2hBeUZzQ0ljY0NLdmRqeHphRDJ0N2tJeFJQbSs5eTNRNHVuUGZyOEx6?=
 =?utf-8?B?djdsSnRWOTdJYTRuNXd1dlpablQwVEM4Z0lzUnpzWmtTdUJzZndIU1I2UmRl?=
 =?utf-8?B?ODZsS21oM3NpTit0TzlmYUYxTUhoMXBBNE1XWWROM0IzdnYxOG1jUlgzSlJm?=
 =?utf-8?B?eGlTYXRCTTdkWGp6VkszeERYbVl0bUw5L3czTjh1UHlISzRWWmVnTU5mK0lR?=
 =?utf-8?B?SjhOL25EV3BsTVhwNXMyK0pYVFRwb2RraCtjZlhuY1NRbisyQS9xMFdsa3NC?=
 =?utf-8?B?YzZsd1ZxRkRZRFBnbkp0czBOWFM3WWVQbFUrclYrTGt4SG5yMng2MFNYUWxz?=
 =?utf-8?B?VnJaMEVBZmRpelU0YlhFYy9zYkRkOUxQZEwwQjlUL1lDenZrZkJZNjBFWUo4?=
 =?utf-8?B?T01pQjBpQUVET2RodUFTRHYvd25uVjRNYlNQelFzdTg3ZzA2QTJHRGlBUENB?=
 =?utf-8?B?LzZGckE2NVFtaDRYQ0QyL1c2aXZJRkE1WDA5T25URWZVQnhzd0pnV0h1bzkx?=
 =?utf-8?B?eU9LTStaMFlWRXpDOWQ4aXBjRmxYMkl2MWp0YUU4Q0g3bmtRWHRqREhiT1pF?=
 =?utf-8?Q?rvY76sOQwn1imA7Kinq1MBYPYDXylETy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:42:30.5675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d318b0a9-8b91-45a0-c0a9-08dcab1d4c9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082

On 2024-07-18 12:48, Andrew Cooper wrote:
> Right now there are two completely different struct xs_handle definitions,
> depend on #ifdef USE_PTHREAD.  One is especially well hidden, and often
> escapes updates.
> 
> Rework struct xs_handle using some interior ifdefary.  It's slightly longer,
> but much easier to follow.  Importanly, this makes it much harder to forget
> the !PTHREAD case when adding a "common" variable.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

