Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B399548C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813356.1226260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDCC-0008FO-0J; Tue, 08 Oct 2024 16:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813356.1226260; Tue, 08 Oct 2024 16:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDCB-0008CJ-TT; Tue, 08 Oct 2024 16:36:23 +0000
Received: by outflank-mailman (input) for mailman id 813356;
 Tue, 08 Oct 2024 16:36:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syDC9-0008CD-SW
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:36:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2415::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71cd1d73-8593-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 18:36:20 +0200 (CEST)
Received: from PH8PR07CA0023.namprd07.prod.outlook.com (2603:10b6:510:2cd::11)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 16:36:16 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::f5) by PH8PR07CA0023.outlook.office365.com
 (2603:10b6:510:2cd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 16:36:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:36:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:36:14 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:36:13 -0500
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
X-Inumbo-ID: 71cd1d73-8593-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyZTRG4dfYsrUdfsfuQ7ZrzwcYeTbpPwfBct7CEztZCpwoOspfE9TF1joGTw0o5A+tFfhlDxms3CPxQSXbo4UPyNZ1m+F4Ri8xB5jBqWaWdbxakf+0JjKYoc56W+kGhVVUyHBMqoJqA5vjpjK7Z7yb4j03Bf1KQMhjtia7MDaFL+zgbeCktiMWyi05FTwz0bI5i3saOrp615ymzhsJAdlx87StO6yj1vuKGfjlu/B5L8ZxuP/i3x3w6F3jADsE94OKNa2Ejz5srqcXc3rbpWgQTgTkJ9RoicsK91Re2CKpzeWSKFTO9aGHiixMvHHKkSVpQB+rkKnHwxyKHD/KQ2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXk+5KIqlCX29ckY5PaWaypBYZsl6Lpz0dLtxesMdLc=;
 b=Le0o7d/OjI0Yr7IO4xU9z7tTILAd7Ln1105zAvDGJUJL6P200ztoxdRE/gyP8DYMwP/IK71WpbhLlX5oPhDf79StOyOCYCDkJ5u+hgOZoifJYJM1frW6rHxwvuDg4aNbYhKLfudGfRs62hwCbMt+E4Tq5+dWce0VtB5g6CFUXLvkMZ9eW6lDQPl8H1mPISGielY8GtM7AgdBBnfkUpvKHeGHA0eKr+hwMfmjkSdWsU6T6m3hJLYYBqJqCfJ2jROJj822ugFGA3HKATjJHkleVZKFIQL68DvV6t9hMKXFTChIfFLoZEAAw276yZz7/BUCVW8ASp45r7mqTuXLYndFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXk+5KIqlCX29ckY5PaWaypBYZsl6Lpz0dLtxesMdLc=;
 b=ga7RW62ixsSYQ4hSJqBtY0HW/2e0DJ1zEf3ODSSOkKj1nWaK9hkfsOwI3v6a3brOVmZx4sAw3OflDkdPvw2r2XiNKmWDRB1Q6GRNeSCm3eOldSoF3xsBljIrzVQ1EAff5AtVStxR8Eq0OXPuOI6LQJTj4lsEAgbLcRadXUUPleg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fc316f55-4f4e-4292-9b3f-90f4b0750b2b@amd.com>
Date: Tue, 8 Oct 2024 12:36:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/44] x86/boot: remove module_map usage from xsm
 policy loading
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-24-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-24-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 967f2901-24ec-4e87-acd5-08dce7b7548b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVU4RzBWdUdDWHgzbnoyWWxlNmpUb2FJRkRQK0hITDFMSVcvRGMyWld3T3dz?=
 =?utf-8?B?TTJsYU5Iemc1Sm81K3JSMlo2akx5bE1jaGd5WVNSa1F1MXNZUHljL1ZPWGdn?=
 =?utf-8?B?ZTVrekFvTUhzMkt2cmlHeDMrWFgzSnRlOHY2NjQ0TGxvVEJKRklUREVWdG1i?=
 =?utf-8?B?RmJBRk9zN3hiN3lvUVlVMG9qa1dKYzU4UU95L0JvY3hZdGo0QUlYQUFGVGhJ?=
 =?utf-8?B?UzdmVTVOYjlIQk55bW1aaFVEeTN0dm1SbGF4VldoRFhIdjdxU0tPYXhFZjkw?=
 =?utf-8?B?UksvRmJjdHdtcUhHMmUwTnlVQWY5cTlkeW9sa3hvYzAvMm9zQjRwRjNKRG8y?=
 =?utf-8?B?RHkyT1NNeWtCY2NXc3kvWHNBREo4U0RvZCthZWNpMFBIbzNpZmZVYTZqRUp3?=
 =?utf-8?B?OHgraGpXYmJ1KzBCRnRpd2tqVjNUanlrVnZ0QVlBN0RkYzF6S21mb2VCQmhH?=
 =?utf-8?B?b1dJT0EySWZHZklkOE95RnRUbWJuQXc0cGtQWnYvaTBnUW1tdjhHdk5ncnZm?=
 =?utf-8?B?RG5LKzFwWmYvY1QwVzRzM0xONE5KSGQ0dng0L09DV1N3U0Nsak52MityUW90?=
 =?utf-8?B?K0NTN1MzczFhWHdNeTc0bVFYTWo2NjVRK1VFYVdyVjg2S0E0MGFNdCtrMlBi?=
 =?utf-8?B?SCtVM1dwWWpGNGpQdmJ6UlA3VUxVZ250ZUthVVM2dXBNTVNxVHpNQ2JmYzk4?=
 =?utf-8?B?WEpqNkU5UUJFK1FzQ0JEaXhISVhWbi9iazdTdmkyeW1lT2lXNFhuamJBQU5q?=
 =?utf-8?B?eGJmQlRJRDFmVEtrTlJhc09WZ1NkZ0dyZ2hPWVloN0kzVENvNjFZRXVDUU5C?=
 =?utf-8?B?cGlSUjlDSWhvVytvM3NxMFlMdlc4RUczM3NvL3ZRRjdTc1RIdE1UcGZ3Q21B?=
 =?utf-8?B?Z29FZDloaUdjb1FVdHAyWENKYzlnQ3daa1RWK3JaTDZTRkdTQ2FvVjgyL2hy?=
 =?utf-8?B?VVEzeGZ5MjVDeWttOUg0emhCM3RqVFd6SWJWT2ZLL0w0ajZaSjN3UlREQ3Nv?=
 =?utf-8?B?OUYzaHFJak1kRllOOUt1dExQMm9hUnQzNFpCZmw0bXZLZ2FYdEpGdnNneng0?=
 =?utf-8?B?U3d3VHlZREluYWVSaGJXUFVaa3Vhc2hwMEJ2djFIQXdUenBGNUtkcWZOemZS?=
 =?utf-8?B?TnJGVHRFTjAxWGlkeE5kMStMbGNJZENQRnFTVmVabXpHSVd3eDhjQjEyYTFj?=
 =?utf-8?B?bmdKcmJ2WFYvc1JULzVQM1Y1OUFKak95emozTW5NUEVvK3FrUFJEbzlsZnN0?=
 =?utf-8?B?Mm9aYjRiVnFHL3pNbzlXMHRLckt4NVNUTy8yWFloRWNkeVJGK2xROWV5Unkx?=
 =?utf-8?B?OTBCUjRLdmhoYUhWa25kLzY4Wk0rMUNycm5aZnZPRzdrbTVHQXpubnZsbVRC?=
 =?utf-8?B?YldIanRSbXUwelEvME5lL3J5UCs3QWsvYzVzcGNWdXpqWjRtbVNSU3NoQ2RX?=
 =?utf-8?B?Ym9UdzVIQk01azQ5OWtCMjRQSG12eWtaaWRCMFhFL1ZDVU94NzhTdmxNWDVi?=
 =?utf-8?B?MnYxWnRWY0ZQQ1JRTGNQR0cvTVpXUHFhNHpQT3U4RnRsWjlvVitGUUloZjhE?=
 =?utf-8?B?dHJJRThaOEpDTDZ2ZDZsQnhzeUthaXRnMVlKWUtueU5TRHFTMEhHZ1lnQi9w?=
 =?utf-8?B?dGJtRncrNG52M1d5MUxWSVZ3ZldyQTUwSW54NVAzRlBJOW9MSm9sRWYyT3Nt?=
 =?utf-8?B?M2NBUVFwcnlRL1pWaC9mR0Q5VFd1dlFqc0dFTHBkKytweHBDeWxsWHROdGp5?=
 =?utf-8?B?SWpzeUMxbG81bU53by9LVktZVXlPUGYwcHhzUVhuVkpReDFCTEwrV0tpNzlN?=
 =?utf-8?Q?N1eUp2RqViFhxvPNo3mu7hpeCe9mvSHKWIcS8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:36:16.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967f2901-24ec-4e87-acd5-08dce7b7548b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c  | 2 +-
>   xen/include/xsm/xsm.h | 9 +++------
>   xen/xsm/xsm_core.c    | 6 ++----
>   xen/xsm/xsm_policy.c  | 5 +----
>   4 files changed, 7 insertions(+), 15 deletions(-)
> 

> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 921bb254b9d1..a22367a62e93 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c

> @@ -42,7 +41,6 @@ int __init xsm_multiboot_policy_init(
>   
>       /*
>        * Try all modules and see whichever could be the binary policy.
> -     * Adjust module_map for the module that is the binary policy.
>        */

You can collapse to a single line comment /* ... */

With that:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

>       for ( i = bi->nr_modules-1; i >= 1; i-- )
>       {

