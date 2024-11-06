Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212749BF9B1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 00:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831420.1246723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8p6Y-0007dK-9A; Wed, 06 Nov 2024 23:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831420.1246723; Wed, 06 Nov 2024 23:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8p6Y-0007bc-6I; Wed, 06 Nov 2024 23:06:26 +0000
Received: by outflank-mailman (input) for mailman id 831420;
 Wed, 06 Nov 2024 23:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEZf=SB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t8p6W-0007bW-QI
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 23:06:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2412::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94eed8a-9c93-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 00:06:17 +0100 (CET)
Received: from BN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:e4::22)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Wed, 6 Nov
 2024 23:06:11 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::e9) by BN0PR02CA0017.outlook.office365.com
 (2603:10b6:408:e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 23:06:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 23:06:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 17:06:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 17:06:10 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 17:06:10 -0600
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
X-Inumbo-ID: b94eed8a-9c93-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjIyIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImI5NGVlZDhhLTljOTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTM0Mzc3LjA4MzcwMywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPqMr8a8aTIOI7c9yE9zclxFMDHi0+ELA0rKhku7osgNuOmPYhLwMVTiuiN3R907kUczwEH8/W99cVXAI91GT7Vi+t7lpYGrIeHzf0JdlsT9h6Qy2aURktF3pMWXAMbk85q8i07x1xOo7AqTnv6IS9kg6zrU7+tp8T+a/jz+DAnCXZDm3Nup/lcTvHKOP/Nee0xKLEv4THrnWYftQl27w+PwfuDO7foMZoiPGID52mHfeTb2XoSnuFdshw+6fgDlDYjqkIRq7OViLBT9l31KlkUGXdlzcxK4Kr6QVanSLWcbhLa62wv9vqHOKPcUMlYlRsQlwTVGxpZUORfP5U0Jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iai/JAWZ6mHE2y4PmwDHPIH979Wi3idCSHmAzSPwNQ=;
 b=Xv+ItW+HZI2b+Ppf8c8uxNJbmrP6hjeGkNHTJtyvtvS2d7b7UhM0D3GCbDzl6yCCNzs398tP2DCcR8coRbrJwXjV1K54CPZ16b0qbzTbd0lg2toDIa3jlrJwOr6MhB+1Vwvk28EHOQu7K6DfW9LsaylTJU0DKYI66HZA6C4406eP5uYndnYTYB3JS7BWAAUak8rxzXnE3N0o7O0kJV8fMscCT4XcZoEDPuXHhnqLlAwXus2D7GnMUlxKxAmw5ZedYzG8xXSfeyt4LU73xi9TRWbT/4HfsbBGaVl4Bry08T9MfFS7evaTicoB7EcX5QWHX25JcKd6o0NCxrU9tT9Piw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iai/JAWZ6mHE2y4PmwDHPIH979Wi3idCSHmAzSPwNQ=;
 b=wzv3XplC2Xrjg3+OgHooTDV4+TfVYfRdsD2jcc4ADAHfjuZ6JmZIu+QO7moYw6wvnjD0t74hdJ905sCfZts+5jrlABwVHb7sKqcQlIaArsp5VWtLphmHkFcm9M1xfPp1Y2XBAyYfmvKkGw/BTEgZB74XQkkMavD60fB5GGOBTAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <990c8955-ae4a-449f-a40c-7c15faf61154@amd.com>
Date: Wed, 6 Nov 2024 18:06:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/boot: convert domain construction to use boot
 info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-9-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241102172551.17233-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 643767e3-8d77-48f0-5b42-08dcfeb79b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFlJWHNDS1lZeXcwVVFHbStQeWViTE9tcGl1MlJYVlJxR1c3QkhBOFhMTHZK?=
 =?utf-8?B?dkR2ZFFGTURJUjc2blY5b0NESmdXQTlvMjJTa0FGQ0ZUVFVQWDZ4WkZiRkxV?=
 =?utf-8?B?and4YVkrWFBwRUtYbVZ6SysvUHNrTHNnbXpUeHZtZlZDRVpoR1NxVFJWTDV1?=
 =?utf-8?B?U3JSZGF4Z2JYcTgvdno4OTNVd3FZdHhIVU4rdFdseUJTT0JVY0toYlFWUWxB?=
 =?utf-8?B?VFE2MUdTZTMyczRSUWIxdU9CdFFJT1h4ZXJHN3VldWlMczJKM0ZBczVXTVFF?=
 =?utf-8?B?QWJTdzZBV1htb3ZuQ1VoWmpZNndMMlBoSHdwL2F2TDQ4N1hkTW9oa2JGWHZw?=
 =?utf-8?B?ays0NzZzbkxBUFNKODZYT2c5d1NuK2pDanpjQ1RlN2xNeUpIR1BTeEFlVitL?=
 =?utf-8?B?RExweWhTNXRXbUpXdzRWcEx1VWY5R2o1REdwd0UrMzBjWVd5S0pENkd4QTNW?=
 =?utf-8?B?L2hZdGxzdDI0TW54aG5FTHdmQzFWaFNpbUpxSmlsVXE3ekEzSWtnUjk0eEtp?=
 =?utf-8?B?dEJLQ1kwS3laK05NTWptSEI2eWpCVm54bEdWTzdrU1lxUmExRk9EWUFJWlhP?=
 =?utf-8?B?ZU1jWW5SbVVwbUhqVVRZemVnYzRvd0ZVTHBEdkRzSVRjVXZ0MmFvQlFlbmNT?=
 =?utf-8?B?UjBYL05WVzJlUjZnRTViOWljMFczRHNTZGdXL3UzV3BkK3U3bm9FZExhT2gr?=
 =?utf-8?B?SVVHZHNvV2NoOTgrM0JsUjAwdk91QmJzRHdhYjZkeFk1VVQ3cStuVlNFQW5M?=
 =?utf-8?B?WHdVRHFKVnA5UUlXVkJ1N2xzZlBqYTljeHFPV0J6bmltcHhaRm1jbGpFWWZt?=
 =?utf-8?B?SUpJT3U5djlCWXl1R1VTUWQ2K2h6aTZzM1lxRWlhelNSNkdQOHVja0VXRGNk?=
 =?utf-8?B?c0pSVDR5cDM4WEQvZ1ZXVXN1UlNac3NXMVJaQTFHVnQ5MktCSE9YZHlaQTBr?=
 =?utf-8?B?RjBKK1FjTitOMjdSd2UvLzVpVEhLUFovR0Rad1ZIR3dvOXdkS3RpclpWeElE?=
 =?utf-8?B?NnB6eUYzWFdPYWVHM2ZBRWt4TFQxR2g0VjVIaXNVRk93MXJoU3M4TXUwTmdZ?=
 =?utf-8?B?Q2FrL3ZLRmFVK0txM2RpR0dKOEJ1MFJGTlBwdnlYcHh3TjBxWE90aVQ2azNE?=
 =?utf-8?B?dTdhcUh5c0ZJWTZHaVMvNG1lajZncnQwckZEQWRJaERwRkNVVFZoYVV0ZExJ?=
 =?utf-8?B?Mm8yc3BOQzY0Q0JCaGpxeFJnSEYxQlViMlhSMmQ5SEdHRDVTc2sxNTUwOGxh?=
 =?utf-8?B?VHd1TWhjSTFkK1l5dmJnNE1BMmVXN2dKWWZkWkVOVkl6cWNENWNzamFtY29z?=
 =?utf-8?B?dVBiRVJ1QTF2UjVnYThRNmJZeG5JejlHalZ6Skkza05nSTloNDdNV2g5dkNY?=
 =?utf-8?B?eUsrK2lSanI3R2tybC94SGFHdGpUb0xhSVptYnQwZ0lXRjZOckdCZ3g3Z1d3?=
 =?utf-8?B?dldlVDdhUm1pUjBnOWc1SEk3ckk3WVUxTzVMaHhxQXBXTGg5YUw0RHd6V0pR?=
 =?utf-8?B?UHA2Q2lSUUVad3dkZHJXWGZjQTYwTnRwS210VkJINFRhZUN6RkJqYWI2NGlq?=
 =?utf-8?B?QlAzMU1ZUnRoY0hGSkNvMTZKNUpGZituQllkUnVwZVQ0RGtuOFNiRERPWDJX?=
 =?utf-8?B?M2k3VXZEcWE0UElQOHZEYzdsWFF1YVd5OE03V0I3aHY5dGZqb1lGbXBpUkNh?=
 =?utf-8?B?U0JsV1JVaG5JMGtRQTY1SGlZU1F1ajZwVFpoZHIvR2FpQ3Z2YXJuMWFZWmpI?=
 =?utf-8?B?OTFrcC94MGgwSFdYY1VualRoZXEwQXhVdVZvOGNvUVVONHdza2lTZVpPbEVI?=
 =?utf-8?B?UnlndjJFSG5BNko2M2Mrek1ieUg4aElFVnh6ODdMRWRNTk4xV0tDV2JMOStM?=
 =?utf-8?B?UXQ5a084N0ZtMmxQUFVnOHNWeVduOVFFQ3k0bzY2ZG5Db1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 23:06:11.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643767e3-8d77-48f0-5b42-08dcfeb79b2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819

On 2024-11-02 13:25, Daniel P. Smith wrote:
> With all the components used to construct dom0 encapsulated in struct boot_info
> and struct boot_module, it is no longer necessary to pass all them as
> parameters down the domain construction call chain. Change the parameter list
> to pass the struct boot_info instance and the struct domain reference.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v5:
> - renamed from "x86/boot: convert create_dom0 to use boot info"
> 
> Changes since v5:
> - change headroom back to unsigned long
> - make mod_idx unsigned int
> ---
>   xen/arch/x86/dom0_build.c             |  9 ++--
>   xen/arch/x86/hvm/dom0_build.c         | 49 +++++++++++++---------
>   xen/arch/x86/include/asm/dom0_build.h | 13 ++----
>   xen/arch/x86/include/asm/setup.h      |  7 ++--
>   xen/arch/x86/pv/dom0_build.c          | 59 ++++++++++++++++-----------
>   xen/arch/x86/setup.c                  | 33 ++++++++-------
>   6 files changed, 95 insertions(+), 75 deletions(-)
> 

> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index a4ac262db463..cd97f94a168a 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c

> @@ -1301,16 +1302,25 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>       }
>   }
>   
> -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
> -                              unsigned long image_headroom,
> -                              module_t *initrd,
> -                              const char *cmdline)
> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>   {
>       paddr_t entry, start_info;
> +    struct boot_module *image;
> +    struct boot_module *initrd = NULL;
>       int rc;
>   
>       printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>   
> +    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( unlikely(rc < 0 || rc > bi->nr_modules) )

Here and ...

> +        panic("Missing kernel boot module for %pd construction\n", d);
> +
> +    image = &bi->mods[rc];
> +
> +    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
> +    if ( rc > 0 || rc < bi->nr_modules )

... here.  Can we just check rc < bi->nr_modules for validity?  Valid 
modules are 0...nr_modules and not found is MAX_NR_BOOTMODS + 1.  It 
eliminates these unecessary double checks.  This would apply to 04/12 
"x86/boot: introduce module release" as well.

> +        initrd = &bi->mods[rc];
> +
>       if ( is_hardware_domain(d) )
>       {
>           /*


> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index c1f44502a1ac..594874cd8d85 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c

> @@ -374,10 +371,13 @@ static int __init dom0_construct(struct domain *d,
>       unsigned int flush_flags = 0;
>       start_info_t *si;
>       struct vcpu *v = d->vcpu[0];
> -    void *image_base = bootstrap_map(image);
> -    unsigned long image_len = image->mod_end;
> -    void *image_start = image_base + image_headroom;
> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
> +    struct boot_module *image;
> +    struct boot_module *initrd = NULL;
> +    void *image_base;
> +    unsigned long image_len;
> +    void *image_start;
> +    unsigned long initrd_len = 0;
> +    const char *cmdline;
>       l4_pgentry_t *l4tab = NULL, *l4start = NULL;
>       l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>       l2_pgentry_t *l2tab = NULL, *l2start = NULL;
> @@ -414,6 +414,23 @@ static int __init dom0_construct(struct domain *d,
>   
>       printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
>   
> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( unlikely(i < 0 || i > bi->nr_modules) )

Single check here.

> +        panic("Missing kernel boot module for %pd construction\n", d);
> +
> +    image = &bi->mods[i];
> +    image_base = bootstrap_map_bm(image);
> +    image_len = image->mod->mod_end;
> +    image_start = image_base + image->headroom;
> +    cmdline = __va(image->cmdline_pa);
> +
> +    i = first_boot_module_index(bi, BOOTMOD_RAMDISK);
> +    if ( i > 0 || i < bi->nr_modules )
> +    {
> +        initrd = &bi->mods[i];
> +        initrd_len = initrd->mod->mod_end;
> +    }
> +
>       d->max_pages = ~0U;
>   
>       if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
> @@ -613,7 +630,7 @@ static int __init dom0_construct(struct domain *d,
>           initrd_pfn = vinitrd_start ?
>                        (vinitrd_start - v_start) >> PAGE_SHIFT :
>                        domain_tot_pages(d);
> -        initrd_mfn = mfn = initrd->mod_start;
> +        initrd_mfn = mfn = initrd->mod->mod_start;

MISRA doesn't like these assignment chains?

>           count = PFN_UP(initrd_len);
>           if ( d->arch.physaddr_bitsize &&
>                ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
> @@ -628,17 +645,17 @@ static int __init dom0_construct(struct domain *d,
>                       free_domheap_pages(page, order);
>                       page += 1UL << order;
>                   }
> -            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
> +            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod->mod_start),
>                      initrd_len);
> -            release_module(initrd, true);
> -            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
> +            release_boot_module(initrd, true);
> +            initrd->mod->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));

Assignment chain here.

>           }
>           else
>           {
>               while ( count-- )
>                   if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
>                       BUG();
> -            release_module(initrd, false);
> +            release_boot_module(initrd, false);
>           }
>   
>           iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index aba9df8620ef..d9785acf89b6 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -977,10 +977,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>       return n;
>   }
>   
> -static struct domain *__init create_dom0(const module_t *image,
> -                                         unsigned long headroom,
> -                                         module_t *initrd, const char *kextra,
> -                                         const char *loader)
> +static struct domain *__init create_dom0(struct boot_info *bi)
>   {
>       static char __initdata cmdline[MAX_GUEST_CMDLINE];
>   
> @@ -997,6 +994,14 @@ static struct domain *__init create_dom0(const module_t *image,
>       };
>       struct domain *d;
>       domid_t domid;
> +    struct boot_module *image;
> +    unsigned int idx;
> +
> +    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( unlikely(idx < 0 || idx > bi->nr_modules) )

Single check here please.

Regards,
Jason

> +        panic("Missing kernel boot module for building Dom0\n");
> +
> +    image = &bi->mods[idx];
>   
>       if ( opt_dom0_pvh )
>       {

