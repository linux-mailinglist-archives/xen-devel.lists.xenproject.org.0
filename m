Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1388AFDA12
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037370.1410029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZG3Q-0001se-B2; Tue, 08 Jul 2025 21:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037370.1410029; Tue, 08 Jul 2025 21:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZG3Q-0001qH-8R; Tue, 08 Jul 2025 21:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1037370;
 Tue, 08 Jul 2025 21:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFuU-0007OX-Gk
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:31:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70ab064-5c42-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 23:31:27 +0200 (CEST)
Received: from MW4PR03CA0065.namprd03.prod.outlook.com (2603:10b6:303:b6::10)
 by MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 8 Jul
 2025 21:31:20 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::e9) by MW4PR03CA0065.outlook.office365.com
 (2603:10b6:303:b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Tue,
 8 Jul 2025 21:31:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:31:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:31:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:31:17 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:31:17 -0500
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
X-Inumbo-ID: e70ab064-5c42-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpA23pOrE0b7VRqMmBTEdSAFh3rr76pYBst52EoZMpDIES26CUc0wHn5DfonYTXe1GBRsweE4ncdv6d+VMwcOG3KpaJstQ+KUi9Ycct+zjcnyRfjyPzbTLEjkq3vHYLeNeFNYpvTiMDlxTONBpMsxBoad6eB60zEzrlqG0l8h+2h7zBQhSkmN+I4oDP0GEjNUGhMtKdS8DFRQM7s2PDqF/Jw1JXI2QEeUsBnfCVQLNSNyV9eoxY1MQDEtjZpMJadCwqA5e85DVDs3nyxdSrE8nAq3bhjZzF0RohSkIVsKANU9K21wqWXAUfRaQGqZwvyhPEQoBpv+PbnITpq4f2umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apP++kaO3lDa0Iv6b2qLuBRntp0Si4dYDZEtcW+qpc0=;
 b=tz19f71Sqntx88z74Z25NZ+r18D2csIEqaNv4MqNh2NTorqX9ZlvCGIshu6k9iSqClsrsbTcMeANoaqUmUKOfRU3a+T05wl4D3O3D0v3iVflSCGflG2EPD8bRtMdm/MO7sfbT7EJRCP+Nu6e0tqlHmulpUEQoyeoQjnmqGnIw3oTRJpi+UtY8StKfb3aAJyebXYj8JCb0h1t1G9hYfv9NBf6mjNJUsdJG1HTCxefQVjGLDzr6zN1tjIJH28X4PEuWRbEXUL6cZKkNPXU62KjFBE8AAAaewsyK7e/JlnHiMj8qNtq6OSmZNQusvhNz8uI53KYI1o3Y3U8kZup2GVitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apP++kaO3lDa0Iv6b2qLuBRntp0Si4dYDZEtcW+qpc0=;
 b=YsCpkhNcKW+MN9sE7h7JVHGJpKdiqQiS3x9I237C15GJRs0Yn861jKhxvLhLOkz4msFXUIM2gMs70h/7OIQ7FAj3vF340KnfXfXe/6F3Z+pqDrwEuDZ926pmmZqyhV45JvRI8GDwuaQTqo528N4P6H8c3sWgxUJex301YViYvhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <41abf7c9-9d71-4c29-90cf-c19863d6b789@amd.com>
Date: Tue, 8 Jul 2025 17:14:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 08/19] e820: don't count lapic page as initially
 reserved
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-9-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-9-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|MN6PR12MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: d42a24bb-e267-4430-2b3c-08ddbe66c6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEFIcHZGaDdlU1BnVVFuc25zS2hRQktlYmhSVndBUUk3cllHWXdBVWMrZDQz?=
 =?utf-8?B?OGtPTUJnVWxnUWFmQ1VETVVSdmJpRi9UbDVnUU4vYUdCYW1PdVRMNVE1aGlN?=
 =?utf-8?B?WXFpMUYvbmM3cDN1STJhM1FpTHcxWmtLaHNLaG5tRUVpdXpkYlZLeXJaRFVh?=
 =?utf-8?B?LzVwRUV2bTdGOVFOMGZFeWxYZXdhUEZSOFlIQTh0dHdNOVY0dFlDLzZHcEdn?=
 =?utf-8?B?d3BBMnloeXVuSGdEZVRyVHl0N1QyeDhKbmw4MC90SkdtUkppUHo1d1luQVFz?=
 =?utf-8?B?TVJ2cS9MdVllK0NqRWpMMGkyR3hGR0VWOVhsNFUvSXFvM3hOTzB3WnpnUzhh?=
 =?utf-8?B?dkJnRG4zUWlTQVRzMGNuWCt3N1lwYkFpRlBwSnU1OWhiVzdzR0hLa2gxV0dS?=
 =?utf-8?B?ZjVGck1GK2JQZ0RaS0t0eHJiYjI3RTBtZ1pLUnI5VW13K3hNR0hGZjM3RmdP?=
 =?utf-8?B?OGhDRnV5c2JmN2h1cVVMK3pUNWI1ZjF1WXhPSktJb1dOV2c4VGZVK0FpeWcw?=
 =?utf-8?B?Mk96eU80MmNtKzYvQnRONzNUU2VXZ250R2x6eWVoR0h0YkV5S0t4Mm5xNXZs?=
 =?utf-8?B?V3Q3S2JMMGxRbUJlMUthRVU0ZGxMTEc1M012Sjd5YnluUzcrZkpEZUd0NlQ4?=
 =?utf-8?B?SnRQQU8yVlc2VHRwM1Fxdzd4Uy94UmFCbmtlMTBsVFJCRVdPM0hFZzJLdDhC?=
 =?utf-8?B?bTBwVE9iaHk4WU5URjJKTk83MVoreFlURG91Mlh1SXZpR2dVeThDeDAxUHBC?=
 =?utf-8?B?NEFZYTJyY01DdmdXNElpd1owRUNPeUJPRUFvditzamdvQ2I5V2ZnNVpKd3o4?=
 =?utf-8?B?NVM0LzAzMjZDS1E2dXZtbDArSnNlcndlQlUzOWtKKy9VY01zbjEyZjcrSFBt?=
 =?utf-8?B?NHBDUVRqRzBUbkNGTWJEeGlHRXBJRktXMlJUMXpVbkRxZzdiTTFMQm1MN3Ri?=
 =?utf-8?B?ZFU4UkUyaEIyeUJWUmdiNHZ0dFE1VXBLdm9vOW4vcjFOYk5rMm1ZTnFTdW02?=
 =?utf-8?B?WEpXcVFCMDJNSWh4aG9jbTExdms4TWQzc1pUb2R6L3RUSkpIT1d2WE5jemtn?=
 =?utf-8?B?aXpzaUtiVTE2K1V6ekUvQXJOU3R6cDIwNWw0dU5TWHpDaEJaSkpqejhRdlF2?=
 =?utf-8?B?QnhSY0krSXl3T2E2MDNFSFBSTUJzcmEyMGRXTjZWTk5kdUkyc2Z0MnZmMkEy?=
 =?utf-8?B?L3IySCtlVEZ4OVlGSUs2bEhmd3gwUlhiWEI0dWpBU2NQMGlLMXkxMStyeGUx?=
 =?utf-8?B?MFNJYW5ZSzdlY0Y5cWVaZ2ZITVd6Q1YxZExoVkFHZTZScFZ2NnQ2L3NxS1gv?=
 =?utf-8?B?N0RyS0JtWXp2RWppLy9iSEVWREJtTmVZTjgrUmozSXdROHlsZ3hNdWdjdTNY?=
 =?utf-8?B?MGNWdVpieUZKTiszMFVDRHoyKzU4VjdDUVNnS1RqOXVSM2luSU9rS29qWFla?=
 =?utf-8?B?cVVYTnhzM2FGd0hienZKSHVxVDRlcmJ1L0dpT3lDQVBSc1lGcWlpSkQ4cm9X?=
 =?utf-8?B?WWNTb3ZnajA0NUNyWGtPdzh6K1lOZmFzT3UyOXlONG45T3RRUm0xOFdacHBi?=
 =?utf-8?B?UGxaS1lYeXdIcGtHa3BuL2VkdHQ3b2MwUDI3L0gyeW9sY09YZkdnVXk1L0JF?=
 =?utf-8?B?RGhHc2xmTCtOUmxxM1NXMm5XOTgzd0s5NnFLWk1nb0xpZG9NbE14RnNoSHpH?=
 =?utf-8?B?Y1ZBQlF3Ryswbkh0MFRTRnFoWHdzS0FGbXVWWm5OWGNZbm8zbGV2RXg5em5m?=
 =?utf-8?B?dXJjMFFtTGZINmtRWmNTLzVzNXMyMG1oSnd1cDVDaDMza3FRcENPOE5qUVFH?=
 =?utf-8?B?RmdVcGQ2VXhmcFd1UzFpN204R0trdlNQNGhlczUrb05QSC9pS01VVUc2QWhr?=
 =?utf-8?B?NS9nZ0tPaStzdDRmdmM2NmNoQjdEQ280YWRydUNTUWF3ZFJiMkduVDVQQkpj?=
 =?utf-8?B?dWpZSXp2M3duclJPbGdoZlZkcDdqUU1LUVZKZkVQb1RzY2ozUU9GVTk0SEc4?=
 =?utf-8?B?Mi8vZzZFYStWRjZQK2syNG00TFRleDJWODlFYUtOWnRwaitjOFBVYlU4OE1a?=
 =?utf-8?Q?0bRntJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:31:18.8131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d42a24bb-e267-4430-2b3c-08ddbe66c6e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544

On 2025-07-02 04:12, Juergen Gross wrote:
> The number of pages marked initially as reserved in the memory map
> are counted to be allocated, as they are normally populated by Xen
> tools for e.g. xenbus and console ring pages.
> 
> This is wrong in case the lapic page is marked as reserved in the
> memory map, as there is never memory allocated for a lapic.
> 
> So when finding the lapic page to be marked as reserved, don't add
> it to the number of reserved pages.
> 
> Fixes: 9b87429d2864 ("mini-os: fix number of pages for PVH")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


