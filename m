Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2929EBDD4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 23:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853357.1266863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8gb-0000f2-1C; Tue, 10 Dec 2024 22:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853357.1266863; Tue, 10 Dec 2024 22:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8ga-0000cD-UK; Tue, 10 Dec 2024 22:26:32 +0000
Received: by outflank-mailman (input) for mailman id 853357;
 Tue, 10 Dec 2024 22:26:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/ZW=TD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tL8Sl-0003Bb-By
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 22:12:15 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2407::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6d69c0-b743-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 23:12:14 +0100 (CET)
Received: from CY8P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::17)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 22:12:06 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::e6) by CY8P220CA0017.outlook.office365.com
 (2603:10b6:930:46::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.14 via Frontend Transport; Tue,
 10 Dec 2024 22:12:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 22:12:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 16:12:02 -0600
Received: from [172.28.102.118] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 16:12:01 -0600
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
X-Inumbo-ID: ce6d69c0-b743-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srkl9rnBGopXD1t21xpZfu8b4RzuZkleS+9X7nM2UriTWZ41p50MhlmpfFO5YODgxQ0ppUPnjjdw/ahaLijIQRUbG24RZBjYNFmPCtUaMkaMZ5BwYKVMehvpJJHKGgr+/8ELggj2rrXWgGQcfa76DGVAFiw0qpTHz0OWvkIN+KOu9MlJRz2RkcY+C4dwpY6YWo124tdP1FTR4mYsEj5ymf8Ch/5QaXhn9C5MdQCqmdMpwxWVmoYQOrzrpZRP8l2evh8yxq78Z/qopyksQuu6cdtEe/1UVoGOKhOHQfkDfoEEwucu6b5EnXaZZRWfdzW5HjnxVonkDJ9NmQdivTqaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTwujxVMXCGU4xDb47YM76dAP1HfsbXuTjoKxljROnE=;
 b=aXgOwny9yfRoFnFF+pFfcuSyVojwA2DCFefmNBI60ONqDf1Gpe4jYkU5qLePM0YvuoEu6kRE1Dx77F7IamaUteHPP0lIewaw9LNwhVWCqKur+U7lESXlgUvUdN1cJBIx9zjhyUyi0q4L7L5KSJcD+Lu5QT1qB/5YgBlkoIsbHvHjb37of7YoPy1b9oFLFgyWf/9TSqqQYydFRrKb25IZel+ocdqDUiYTyeh4YxqYsHFY5MrrWYje2UvJ6x7TjQl6uJ6vFSIBCqesyAv/LNuuTcgQEpYX0V7iJgTv+u8krc0YHP27OnMNpV6lIqDSA527S0/N9Y5NJwc5j8mdXaSWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTwujxVMXCGU4xDb47YM76dAP1HfsbXuTjoKxljROnE=;
 b=V7gdBmRJOybIdMDmcxsGwJfEtxzHvM5JURwVyDD7uxjlLf4SIqdRcRn43jKzyUFdwQYC/492RlUlPfdTfMaYGRDMDfyEp9ubsW0FqxEnpb8exeW3FOjd4ksI+bAYNRMpp5YbHoAtnx0ItJQY7p5Big3fh85qC8zAqHayL1Hn6D8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9be0addc-d4cf-47c4-937d-e1937898c010@amd.com>
Date: Tue, 10 Dec 2024 17:11:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ba0afd-78d7-42c6-7903-08dd1967adb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUY1cm1jNUdPWFpvMVVCS1IvMzhWV2hLTzFMSHlkWEoyY1g0Y0c2SjRhVFFy?=
 =?utf-8?B?ODdEd3d2emNUcGZuZjZ4L3Q1UGlTenJWcXNKd0ZnUGhXa0NhTlhYS0F6dEtP?=
 =?utf-8?B?eHdQKytsT2RqWGh0eUhhK0o5MFVxYkFKbGNwYUhDZVpnL1RyNXlyU3dmczNN?=
 =?utf-8?B?ZXdMTDlGN3o1ZXBwVTU0TVBSejBnTXI2ZTNMSjVNZ2g2N1Z0UkppYVNsaUM0?=
 =?utf-8?B?V0l5ckpwZ1pzc0JGMXBXRmU3VlJnaUpSQU5QaE5rV25NU0I3NE44THQxb2kr?=
 =?utf-8?B?eWxDUWI0NndEL09MTkpYRDBYR3pLWkViTFd5aUNJZnI3QzVjVnVwZ3lGSXp4?=
 =?utf-8?B?ZXFWZC9IWXVENHF2eFVxak1LUVF2N2FRTmhEd3dBNDBoSEVpM1R4NDN4dnRk?=
 =?utf-8?B?czJUOXE0eHZmU1RKZGNpNytlMFFPc0FkZDRNUHYxWU5YL1doZStjSWJMS3Vl?=
 =?utf-8?B?aDBTbWdBbEx3NFlrODEzbkl4QkRwU3RNUU42OVE1ZzhGRnNiQWpxaHpkb3Za?=
 =?utf-8?B?WG5vS2JlWFZITWF6bW5kTjM0Nm9LL1dCQzY3VzUzSnMxR2dzbUFtUXViMi9L?=
 =?utf-8?B?eWZPVHUzNFYySW5OOTQ2L0psbDgzTi9SUEdEU2NqbitPNkgxR3g2TlJWZWNa?=
 =?utf-8?B?aGVLWW9qVWFRWHpMMVA0TFJURmdmaXdKelh2eVRhbE0xUU9iVTY4am4wLzFR?=
 =?utf-8?B?VldTcm1IYXYybFJXdXRnNjNzc1M0TXVYUG8wYnJxc2JPaVNHTDRRVi82MC9a?=
 =?utf-8?B?VkJYMXFTS3BrTm9rS25JNzhuNFpjVFRUS2k4eWtzQkk2c3dZeWtsRlUrM2ky?=
 =?utf-8?B?N0dMSkJpQ0V5S0lYVGpNSU9XdzFjRGp4a2VYWlVQSDlieWQzcHg0am4waEo1?=
 =?utf-8?B?SUtXSURmK0N1VkJGZ0pSTkxJUHNHa3Zkc1N0a0gwbTZFT3IzdnZsRjdnNUFy?=
 =?utf-8?B?RmpzOThnM21RYTIyMGdQOTRVUnRGY05qR0dFdzNLeTJCTDQya1FTWXJpM0xX?=
 =?utf-8?B?aE9SQXpFVzVkcHFjanhGdFgxTWNpa2dCazVxKzZndWZ6UGxpaWFmOEZjR293?=
 =?utf-8?B?V3JwRnVqeDJ5UFN5L2NvdUFzWXljdmtVbXJSUTV0aGhKSHNVWUtnaE9VTlJD?=
 =?utf-8?B?M1RGYXdyK2JqQWRmU3cxU3ppUUNXVFBEWWxNNml4cmNldFd3OXdQa1MyM2Nl?=
 =?utf-8?B?YldBS0JiYmJOZXkzWHdua3YvT1NUbVJoMTluQnhwTVJETXJEUEhSRzVaWkh0?=
 =?utf-8?B?aUtKRXRmdTZNSjRWeUNjNTBIazlEdlJYdldlVUxzY1MxNEZKdFRZRlFyNjNr?=
 =?utf-8?B?SU91UXlodXdkTnRoU2RwUXIyaForUGN1YkY4VVI2bkZDOXFxYzFOT1RoeDNk?=
 =?utf-8?B?NllzMEd4N1JqWUZHN0t4Y1N0dmNCSTFtcG1UYzBDUy9PNEdMem96N3JKc1hs?=
 =?utf-8?B?MnRjMkVUKzhUdzlWbXZxNWdvQU1yOGZkajRPL3N5eUY0RGxpUFlXNy9vOWI2?=
 =?utf-8?B?Yy96azZ2dlh6U25jYlc3SnQ3cVIxTmdPanZLLzIveEtuZis1UmdLaTV5dkp3?=
 =?utf-8?B?cmNVL2pvL01EVWNYeTFzeUNubTJoeXJkaGx5QTRCSG1jemszZzlsUysvNUdX?=
 =?utf-8?B?Z2hxZXhWdmtETjdia1hXdVdPcFpHTVhOU3dpRyttVU1tUWlIZXo1dGlkaURF?=
 =?utf-8?B?dGFYZWw5NVUwYzRJdStoTmRmOUwxQzU2WXpOK0FSaHJKa0U0NlhvYzBJUUhU?=
 =?utf-8?B?RHc3Y1IyMEJoYlhZOGdqckpreFNpN1lIUDJTS1g0Nyt4YjRiQWQ4U0ZRZ0lh?=
 =?utf-8?B?d0tMTktQK2pXV1QrdEFCbDQxcFkxdGFhMnd1NUQ1Q2Q5N2VGcjJKVUN0L05C?=
 =?utf-8?B?MzhtY2xHMG1SQWM5czBJbFQ5YjRscnZLRjdoMm9MMUZ4TE45dHF4NHlrNlZk?=
 =?utf-8?Q?Q2gC+0BEZGV+DesPACvPemNZI1KqrTsK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:12:04.1699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ba0afd-78d7-42c6-7903-08dd1967adb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520

On 2024-12-05 23:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> 
> The call is used in NS8250 emulator to identify the case when physical xen
> console focus is owned by the domain w/ NS8250 emulator, in which case,
> messages from guest OS are formatted w/o '(XEN)' prefix.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I expected this to be used immediately by patch 21, but it is not.  You 
might want to re-order it directly before its first use is introduced. 
I haven't gotten far enough to know when that is.

Regards,
Jason

