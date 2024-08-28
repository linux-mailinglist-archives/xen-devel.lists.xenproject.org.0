Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5AA962051
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 09:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784522.1193892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjClE-00053V-Ii; Wed, 28 Aug 2024 07:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784522.1193892; Wed, 28 Aug 2024 07:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjClE-00050N-G4; Wed, 28 Aug 2024 07:06:32 +0000
Received: by outflank-mailman (input) for mailman id 784522;
 Wed, 28 Aug 2024 07:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RIMj=P3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sjClC-00050H-D5
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 07:06:30 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2e920d-650c-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 09:06:28 +0200 (CEST)
Received: from BL1PR13CA0235.namprd13.prod.outlook.com (2603:10b6:208:2bf::30)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 07:06:23 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::a3) by BL1PR13CA0235.outlook.office365.com
 (2603:10b6:208:2bf::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19 via Frontend
 Transport; Wed, 28 Aug 2024 07:06:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 07:06:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 02:06:21 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 Aug 2024 02:06:20 -0500
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
X-Inumbo-ID: 0b2e920d-650c-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZfV3ZRIigscPBHDin/nx6qzTyIbYMuKWjZVcA83/TNICfolaajhY88zcQjkEtCzAHG71N0b18/egkdoqwOh+BZ8kEWPkXX9W6NyD9LOLs2bQckSHvdLEdsZ5x0v9CF9mgyy5s0fLDPS7IDlxY8OFIXtJEBUc5EMJCssuIeQ5g1AkTZcpO7y59UYDN0rNPUr8MGnavNcgaGpSCLbyfjsYO2PCLHpOWK4VbBfTZd+83qBWlMb839pvWfVz4se/lpoqH/lzAn/K3SaLq3IQNgK5LsqmRPHpnM3SuR6NGKL2WYq8wU3TRIE6coXVayzAeRvihN6AADiBRrDlkZ7w9+r4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8Lfp2CZBbUQ8ONYYPoWKGUcOuXsHmRawUQ0jh6cAG0=;
 b=QPMOOIj3MLFJbgxzt9nMpdRxGrfPFyJu12gZI0rZXCQdLKpj/4TvauigfQDHroRC6IJAs0nZqC5FYTafNTCXJMXLgytI3fS7mhMJERWsJ8nFtU5DxSgqn1bVRjnNqIt9thoPSlYRsFWwnRUgbLKufOi7TO0THlFZy/wNsQB8J/3IpvFXl9b72Pf+YKUHcHzNtgJouRxPP/4vHMbowHU0qa/+E1Qn3A7VBdQI3Tb1j3I5RVwxT2ET4p5VWU74/pUhfSjy36bcb0A4Afi2htevQ38klMxZ4zbjVvj0h8rsAcezVrOsfa3dryvrulwGaB5fzXhoVgd19im0FKtVgwibuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8Lfp2CZBbUQ8ONYYPoWKGUcOuXsHmRawUQ0jh6cAG0=;
 b=2XvqQcMB+bSX3ATjuDkAX5p4D79jLPcJfJRV7oeTiSo0i3A6vkBJBfg41RXz3tXHC2ToxVf8E2Skq+m8jbUMBDWY+07jm8XuWwvBtsKW5jrVAfw+eJbsML/8ZUGQDpUdeNajqEuOV1bi3ltrjX8nmhimOlukBZI7sRfVDL90j+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <748f9e0d-e630-42f2-9273-95e2e85c524f@amd.com>
Date: Wed, 28 Aug 2024 09:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Fix variable shadowing in vgic_to_sgi()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <20240827234522.2237355-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240827234522.2237355-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 4816063e-36ca-40a2-ed6c-08dcc72fec7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDl5M3M5TGMxbHFYeFB1Q1A2V2JEWnJFaXBPaXIxZUE5cWRtbDNBMkxlOWow?=
 =?utf-8?B?REhFQUpTeExWZ25IdDhGelo5STQ3Sno4elRrbHRqS1JoSVB5d01HekViZnJm?=
 =?utf-8?B?ckZWWXhWdGlNMlF5V2p3VUl2YTNyM21JVy9xQzc2T2hmS0krN21rd25kc282?=
 =?utf-8?B?K2RiZWFDT1RiNVVQU3BxZUZuV1ZLS2ErZXZGQVpQejlLQ1ljODU0RS9mN0RT?=
 =?utf-8?B?d2ExRWtGZ3JZQXcyRTVVVFQ0WjlzSkNzUFRFL2VSeW1CWTVHbXpQNWJ4cGVj?=
 =?utf-8?B?c1JGL3ZRSVk1TDVqRE5TVC9sdk1sRnhWZmVEYmVRMTM2TlNLY3pxVmVnZWlP?=
 =?utf-8?B?TWkvTWF4QkV2S2VJL3NFRmU5b1ptaklNc3JMRVpvcm1YK1A0WmJrcHdtN1dU?=
 =?utf-8?B?eWFjZU81SFdJRHpBTkZLQVVrTlErUGdVdzFhb2dxdFhJZHB6NTF2NFZJNDhl?=
 =?utf-8?B?WDRjaFJndVhNVy9XMCs4Qm5Uamd2aTJ0SDFWcXg1YmNBek0rMlVPWmpXK3NL?=
 =?utf-8?B?NG13em9VZElhSFV6anJsSlNtOWpYUE4yakExQ3c5TEtXTkI4QUNpRVZxT0t5?=
 =?utf-8?B?VXhWVC8wU3BlWkExYkh1QUQyMXAxUE9uclYxSlJHTmQ0TWEzdnB0dGpzTmpo?=
 =?utf-8?B?ZUYzRGFQVmNOS0hRWkVxaFRhbU9ua2s3SlJtU0MyWDVPa3NEMTZMd09EdEtS?=
 =?utf-8?B?SkRRRGVKaUp3ZjRIZVE3RlFQOHRrajZMU3F4aUgzeEJkakVCNklka0tXazE4?=
 =?utf-8?B?MEtEbk5DRi9oTWozRDMyTTNVVVpyOFVrRmNKWVZUQmhiOUtmc2I2YTZ2akpJ?=
 =?utf-8?B?TjduaUxlRnViSzVlbkptTTB0Z1duU3VFUmFNRVdxdjhsZlA2dDJHOHg5a3dG?=
 =?utf-8?B?cS9OcmVha25hWkZNOUg5SmtvWW1yenFQaE5tTkdQUzZQNm1KVkxWYlcwTmxj?=
 =?utf-8?B?Mi9XNUtqSzhaSVJ5QXFFZnlSZEJWWnVmTE5Uc09UdDM2S09EaHNYVDV6VTUz?=
 =?utf-8?B?ZHZUcWw4RVlBNkF2b2pnZkM2L0hmYXp1ZlhWWGx3VnBJTkliNkR3TVJUZUxv?=
 =?utf-8?B?RHgwRGxCakhLVWNYbEUzWDgzOFZObURRSkZ6dnJNRUNra1k0eUhzc3lLT2lN?=
 =?utf-8?B?TjVxY1lNTWhyQy9MamhNajZHUkJSRVBSVFk4ODVIVlJPZUU5Uyt6a2JCMGFP?=
 =?utf-8?B?Uzg3c0kwZ0xFRmhJMUFJWUpJcWpZNTlYY09rd1c0NUFJQ0NGWkIxZnJtWXZV?=
 =?utf-8?B?R3JidVZGdHhSWkgveWRjaEJ0MCszSmk4aGJWT0cvNWhNcW13YzRQMWU4NjVH?=
 =?utf-8?B?TDRTNHdlOTFET0crYytLelk0RWFOaGZUZmEya2l3TW00Z05OREQ3TS9RYTV3?=
 =?utf-8?B?TDZZWTk4a0ZHUWd4dHhhc2JueE5hMWt5YzJWT1A1VFhlSjlMZEp2eEx2dWNM?=
 =?utf-8?B?aDhPdkgvQ3piVE9mRlVKV0U4amhlcS9zMnV1bjNYa2ZiV2lMb3lVV2lNVC9r?=
 =?utf-8?B?KzlEUktFNk5hckZqUDJJOU9HVll6RWxPS2pnRld6ZmlSSTZqTTM1ems0NHRW?=
 =?utf-8?B?SDIrTDl6OXI4RkcvM0hleEQzU2JtblV1d0VwVHlqcGM3OVk0VG9IeWJTV1Yr?=
 =?utf-8?B?RTRBeDQ5Um9WWVQ2aVlUZkFwWERJL2lwbUVJWUVrUFU5eW5FKzV3Ym90Umli?=
 =?utf-8?B?WjgrVjl3YjZZYkVxaEZiZi9nWFYzZFIwOW9Qa1dUUnZ6N1drMmNqbkttK2U2?=
 =?utf-8?B?UTdmemNnSUpGNTFuKzJCd1RMVC96bTh0OE9WS2pyMENDNEpOa2I3RG1qS1Nr?=
 =?utf-8?B?YnhqYmpyb2JBN0J1alpCR3ZqcVNVK2RaTVNXRjdWbHNhd2ZyZ3o0WlJPYWxO?=
 =?utf-8?B?cUMyQzRKbXY0Rko0SnJtSFR2WTlHNXQweVU4S3ZtVFRFemVVajlXQjFtcGp3?=
 =?utf-8?Q?HT8epxQmN31+rflOaRLlG/n94wX6bQ3m?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 07:06:22.4012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4816063e-36ca-40a2-ed6c-08dcc72fec7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162



On 28/08/2024 01:45, Andrew Cooper wrote:
> 
> 
> for_each_set_bit() allocates its own variable intentionally as loop-scope
> only.  Unfortunately, this causes the inner 'i' to shadow the outer 'i'.
NIT: I'd mention it violates MISRA R5.3

> 
> Drop the outermost 'i' and 'vcpuid' variables, moving them into a more narrow
> scope and correcting them to be unsigned which they should have been all
> along.
> 
> Fixes: 9429f1a6c475 ("ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/vgic.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 8ffe099bcb5f..6ecd9146511c 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -468,8 +468,6 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>                   int virq, const struct sgi_target *target)
>  {
>      struct domain *d = v->domain;
> -    int vcpuid;
> -    int i;
>      unsigned int base, bitmap;
> 
>      ASSERT( virq < 16 );
> @@ -483,7 +481,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
> 
>          for_each_set_bit ( i, bitmap )
>          {
> -            vcpuid = base + i;
> +            unsigned int vcpuid = base + i;
With this change you should replace the printk specifier from %d to %u for vcpuid.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

