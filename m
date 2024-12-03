Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409C9E185B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847775.1262841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPd5-0006hw-BU; Tue, 03 Dec 2024 09:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847775.1262841; Tue, 03 Dec 2024 09:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPd5-0006fz-8K; Tue, 03 Dec 2024 09:55:39 +0000
Received: by outflank-mailman (input) for mailman id 847775;
 Tue, 03 Dec 2024 09:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRE5=S4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tIPd3-0006fp-8h
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:55:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2418::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdaa3dfe-b15c-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:55:35 +0100 (CET)
Received: from SN7PR04CA0007.namprd04.prod.outlook.com (2603:10b6:806:f2::12)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:55:31 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::50) by SN7PR04CA0007.outlook.office365.com
 (2603:10b6:806:f2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 09:55:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 09:55:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 03:55:30 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Dec 2024 03:55:29 -0600
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
X-Inumbo-ID: bdaa3dfe-b15c-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeAtfbsb95Z2l/LyQthoiYgbZ5IyjHfgNWRLmKj0jHQG4EmaH6+WVPqfbbkMIbJ/hd1rcXCr1fD1uacLEbnPvXao5UstdpzEVqjSz4cqCRq8TQyKmtx/wURuxRi7d15ySYNOBym5x2wOjgkwdzPfdf6YTY1qtVIjwi7HWrs3GXknbCyVRnWf8uyvMSSgItvl1caljs2j3G59S+SpoR93i9tNcZMcTF92lwmHE9TSYvBaTYgJ100uOJjWO7IT+/JlY4ECc1YvqCGkvKoHBGhOZLLM486LvYx1UJKaTQ+HhfEUictnnOfe2BQeR4wPTVLGuNen5V4JmDWkLIZ1DM+zkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhnB41Ioz2MUi+y44Vwy3ra2J8obH0cGcbZeRmuHc88=;
 b=gsE9xNfWXq09QfRDB+9lu1P+6Lgg7uQ/+pxZQrDW5QuC+f58LQKOqWnZ/kZk6RDDk+xTJ2kMIf7AOVnUWiFP3pZx5Dk2JP3GZy2aklmv29gnFvM1U/+lwvH/M8ONUyZHXuv4EYnIPTcG4/ZGbl99JN1Q69oAKTD7TT1KKCbUEaeqRVRcsaLgB/AVXrgasmNF/OHP+OP80fPDsyNWtjfznA+8lNmSJfdwI+LMQpNmec+sgYjB5yJEMu14WehiSnXHj1/k/mkh9vJQbIX04u5gX9iylDeMXix3HUciSX93L6lIqgFOUMEN2r06/i4t3l5phF8ZkXjN5D8aUwUFgFjYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhnB41Ioz2MUi+y44Vwy3ra2J8obH0cGcbZeRmuHc88=;
 b=PQKJXo4+oVulXS3wxi/0VDltxe7ziMHyEmE3CRfJc8dBvrfW4Tom66Nc2G/9NMPepr57aZ72zCXeeSdAt5oxMtyURBqPX09sDs/OVVPWJ8ECN9pv+3OBRU78b+1zqutXz0ecgXohpXKMqGWRZ69Bi956v4WpFd2Wyb1RIdjsYMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a5c7fde4-6db2-4c34-b4d2-7c5ec5a4cc0e@amd.com>
Date: Tue, 3 Dec 2024 10:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-2-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241202165921.249585-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3c66e6-aa2e-40de-85fc-08dd13809fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0YxRWp5SGZrMEViQWpSRmN5RU5HUDdhZEJ4a3NVd1BlbVoxeEdla0JiOW0w?=
 =?utf-8?B?TC93NCtqNU5GbEdYYVp0Z1E4MVhLaytUNXphOWVLZGoxaGJHU3VWMlozand6?=
 =?utf-8?B?VWVWdzc0S0tHUG1zZjFVL0wrN0puWXFTYnNhNVJWYUFKTHBNZzZTLy9QY2Zt?=
 =?utf-8?B?NXhwajEzb3RyVTBuRm9XaHYra2tsTEFwbTF5TTNKaHY4MytpZnZSaW1RMllt?=
 =?utf-8?B?QjlLNjNpNDVwU0MyZm9yMXorSC9heUh4SlowNGx0UGRxdEdhbENxRVRsbmVY?=
 =?utf-8?B?ZE9jbFZNV3FkMVMxeTgrVFVacTVIUTF6LzFObGZuQzBOQk9YemdaZlNoRGFp?=
 =?utf-8?B?bmx0RStJSE1UZ1FFaTRQd1hOZmhFcFpPZkFJYnhMMWRLQStSdjhOTlc3a0cr?=
 =?utf-8?B?RW9XT1Fsc2hyNGtqUnFGc2RWc0dBUG1HZ1h4cHdzbEtIWjhCekw3cktQUVdx?=
 =?utf-8?B?Ulo3c0xBNjN5eEx2VUE4K2U0aUdvc1RxeWx4N256cDZLbU1LREF5dXZVTnFn?=
 =?utf-8?B?OC9BWXhhM2hZU21OOWRZcWJKOG01cC84U2NsbWNZUGswbHFHUENxSUorOEtN?=
 =?utf-8?B?dXRkL0JqdGhRaW92YzNxYnF4NjhkTWtFUGZiY0RBdHFlbHZDZFJRc2hVdVpX?=
 =?utf-8?B?T2M2cURBN0dYY3MrTUtvbWI0YzExTDVtYStDYnUxOWZpNWdEejZZL1dHUG93?=
 =?utf-8?B?eTJnWWFYSElDTkdPYVJPZloybm9yMzgzWGROcXU4WUp2ZTRiOU5SdTZ2b2hP?=
 =?utf-8?B?LzhERFI2VHF2N0FhY2xQZ09qQ3pPdWtKV1FKRkRGZ09UcjI3YkJ4T3VRYU5X?=
 =?utf-8?B?WE5sNCt2bzVzMzFFZXFod2pzenNMZlN0QkVJTlM0ZHhDbHdmdmQvNWJUYUla?=
 =?utf-8?B?SGdqVnB3aVk5cXcxNm9TcTNJMHZGVlV5b0tQS091TWFWQnN6QmFYbm1LeXdv?=
 =?utf-8?B?WHNyVS9ZUlQ4UUZySGs5OFBoTktSL0txOXI4Vmd6RXNTMjBQZ1Zxb3B6M2hN?=
 =?utf-8?B?K3NuUjZwYWw3R01TRnJxd1A3YzEwdjJ0K2s1UXNDa1c5aVFrNEdUS0liVnhV?=
 =?utf-8?B?U2NXaFRkMXdQOEI1WFpjWU5mc3lHTW5UK1o5QmlOR3JVK3YzWVhzTmFCTCtq?=
 =?utf-8?B?aUJrb2svRWxiRnMyUTg0YTI1V3AwUTJ0Z09KcU5HM2NVNk9TNWF2bUVXZkRy?=
 =?utf-8?B?VnR3THVubVAwQ2pMTFZWc1VybDQ1cXNySXZrUkFsMXFIYTRweTJYSTluT0xH?=
 =?utf-8?B?ZUwwaXBkZ3V1OUVObkZFWEowLzdEOEdaclp3b1E3b05lTHQrMFRZQ1pvaDBE?=
 =?utf-8?B?WjU4NVBGdVNKQ0Y3d0syWlpQN1AybzZWRDlTYVJicTV1ZGx6NTNlcG8rclgx?=
 =?utf-8?B?YmJGUWxjVlhSMXVoQmM2Qm1DVVpDQk83dkNaTDRwSlF5dUw3WGJBMisyeE5Y?=
 =?utf-8?B?YnZ1QThkYy9ZbVN5MTBmb1B2SFQ3RENvMXlmS29oeE5sK2N5TElMdDNLN2JW?=
 =?utf-8?B?aXJYblJRVXgrZkRkMWx0Mll1TjRWaXpJUUk0RDQyMTBsWnFRMTRKZmNkdjNC?=
 =?utf-8?B?UUQwWXpMQmJNR1pObm8ydkI1bkw5cS9aSE9RTEk1b0M5a0hCRSswM3Q3cEhI?=
 =?utf-8?B?c2hlckJzWHJJdUQxdHVueXhkOUlMT0h0OGVJU3daZFJPK2VEZ1JKRDc0RzE1?=
 =?utf-8?B?U2JUc3pwOFpNVUpyVDF2UFp0aHdZUEtydk9UUnpEcXc1U1luUWtmOXlwSmRF?=
 =?utf-8?B?NkFwanNveHhXRUthSU13ODVmZE9wYjRXamRtWkEvSnF5UkRSS1k2NWlKUWpP?=
 =?utf-8?B?eEhzODgxM1VvMzBsWGFKVlhTb2tYU1hiR0xPWjB1UUtZOVE3bUlkSDdCSkpo?=
 =?utf-8?B?MEREaldXZ0NWMVNjQ1IrcWZsWDVKcFluL0dvTU1CYzZSWmhHUlc4NzNwZEgy?=
 =?utf-8?Q?MhkCK+vDLunqUunP1L5tyCB5xcsjm7LG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:55:31.4574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3c66e6-aa2e-40de-85fc-08dd13809fe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926



On 02/12/2024 17:59, Carlo Nonato wrote:
> 
> 
> Last Level Cache (LLC) coloring allows to partition the cache in smaller
> chunks called cache colors.
> 
> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
> Kconfig option.
> LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
> because that's the number of colors that fit in a 4 KiB page when integers
> are 4 bytes long.
> 
> LLC colors are a property of the domain, so struct domain has to be extended.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Acked-by: Michal Orzel <michal.orzel@amd.com>

[...]
> 
> +### llc-coloring (arm64)
> +> `= <boolean>`
> +
> +> Default: `false`
By default, it is disabled. If CONFIG_ is enabled but ...

[...]

> + * -1: not specified (disabled unless llc-size and llc-nr-ways present)
the user doesn't specify any llc-* options, LLC feature should be disabled.
In your case llc_coloring_enabled is -1 and due to 'if ( llc_coloring_enabled ... )' checks
all around the code base, the LLC will be enabled even though it should not.

You can either set it to 0 if (llc_coloring_enabled < 0) and other llc-* options have not been provided
(this would require modifying this comment to provide different meaning depending on the context) or
you could do sth like that:

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 2d6aed5fb4ac..560fe03aa86b 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -18,8 +18,10 @@
  *  0: explicitly disabled through cmdline
  *  1: explicitly enabled through cmdline
  */
-int8_t __ro_after_init llc_coloring_enabled = -1;
-boolean_param("llc-coloring", llc_coloring_enabled);
+int8_t __init opt_llc_coloring = -1;
+boolean_param("llc-coloring", opt_llc_coloring);
+
+bool __ro_after_init llc_coloring_enabled = false;

 static unsigned int __initdata llc_size;
 size_param("llc-size", llc_size);
@@ -147,15 +149,17 @@ void __init llc_coloring_init(void)
 {
     unsigned int way_size, i;

-    if ( (llc_coloring_enabled < 0) && (llc_size && llc_nr_ways) )
+    if ( (opt_llc_coloring < 0) && (llc_size && llc_nr_ways) )
     {
         llc_coloring_enabled = true;
         way_size = llc_size / llc_nr_ways;
     }
-    else if ( !llc_coloring_enabled )
+    else if ( !opt_llc_coloring )
         return;
     else
     {
+        llc_coloring_enabled = true;
+
         way_size = get_llc_way_size();
         if ( !way_size )
             panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");

I think that this would be better in terms of readability.

~Michal


