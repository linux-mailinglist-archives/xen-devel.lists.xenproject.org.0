Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACA77CF181
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618947.963310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNfB-000688-Hn; Thu, 19 Oct 2023 07:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618947.963310; Thu, 19 Oct 2023 07:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNfB-00066H-EF; Thu, 19 Oct 2023 07:41:49 +0000
Received: by outflank-mailman (input) for mailman id 618947;
 Thu, 19 Oct 2023 07:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtNf9-00066B-Qr
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:41:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37b43d6-6e52-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 09:41:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8504.eurprd04.prod.outlook.com (2603:10a6:10:2d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.7; Thu, 19 Oct
 2023 07:41:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 07:41:43 +0000
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
X-Inumbo-ID: f37b43d6-6e52-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlPqzoBwttsBa8iM535btI0mo5dqzD9HJXd5tc7qAqb66XjsJU0EaxKkBltsktOUQ780iI6xuDSp33wry1uvLgqXOVD1rZ2FgOUH5sii3WzaAAGuHqsMaewYFMXfZBW+gSFKAcIKIiPAst17kTgVkZ6dm2ldjpIOgUJsIftkdSDLcbz7otGR1zufRELtr36z+tTf3fxHimmXDMvgrCmzZ/zZn5Yvbs7JH+nZrEcMw6vzoPFLrIQzXnuU0vklm0+gBxUONVooIqU9A/OuZVqcr5kz/O/nYZKFN5hgEX1ewkTZKuHOMCJKcNNpGCyf65Sc5PLe71RPLekj+am/6SvwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwBaS+zHgXx+cB9MCxbcfEc9WGIRvISgYv8txzGUKIM=;
 b=f36t4D+6JNmyvB9cfSTNfq+jjwhXAzAwhEZme5rg3hakHU25R9oJR+IeyF1sv10Xr5Mh4Gg4vErDJ1PES6UtQPmIMyxQtAhqdbRG5v6LWJGnOyweasadWfN6bW+PgJH1yIaEr8+T/4HZBSd5f37g74YL0xqC77z8dnH6kKM2Wu8FuosO+kZXkTtu0pVdEfxq4JDiy9BCGXCgYJt4hjsdOR5C9MdYeHiaaMBTZhrm2FT1ljAIMYg4YsW8+KK6Gatzpn1J8JkBdszicv34iDgOwCQ5tgTpa7TrqVr94MzLSPhVo3dGunCksFiF8xoa+HVqkxAHtmU08Lm5U5ljPxZ+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwBaS+zHgXx+cB9MCxbcfEc9WGIRvISgYv8txzGUKIM=;
 b=5ASI2dYVcKtTI6yOzK9woeqEWm9QLPjX0aDoB+EHLCm3f4IAuBrQ79b3ivTvaMvdEc8xCGnuTpYaZKtgBMpfGrujLKbBJCPExfseXkHBZYgIWAEw63ebuobBRsIfL41SZHOs2xfeX3ks8i3lRpVdhd5/+bcVnl2Rn/6hwKGeviBCfQyXLTNrDyDYtR7x/ffuwztb1QYnttu6eF6ogUCUcr1RbDDebLTB5mAExbq7j1B/Hdq4bYO3FJrKUjFlGZ0xUQhL83tVoQW4qvyLf/2AN2Yj2nsZLp002VTQa9JlWVBA63lX8l3LpbrOshFgxW2UW4OB2CayL2toCgDc7+hb6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com>
Date: Thu, 19 Oct 2023 09:41:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231018160733.24655-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231018160733.24655-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 420489f9-ecb1-4c8f-8bcd-08dbd076d6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+oMNAIsCoYGFW9S+qNhm+J8uGJ0JEx7TfIV5Oi+28MQXejVYguIURJ9FHILLmDxoSpfA6F7rB5CKom8p+ha2eRIjXw+AS16Qi6cEkvyXxBR/oGw5SWKvgDVFMkUXkpxwj0qyYl9XqcRLITbSZrYx2kd0Xn4d8nW1VEn56pF4IlNQ6BWu3MGi8Tj4MOsN890UeFqkP3DkTTv6HokbDJoWHBYNWWXeSWPSQGvDH+BzuC8e8tWdv0bjHVAWx3H+0A0ZiavndDwDluD17BufaTmrr0fCTs29c9YOJnFzsXvxgIfLTQxII8nL45HTzt8lKtdO78gQgVL/wO9MCeLDN72PuBm52tiIasXFxemUr4zb4Cq7PVKM0h6h96i9+OEl9Ov0LBX7OtG6ve70M87luNVjv/6NFlac5ja6wfGLHX4tJeM9G4DP9bJtg4z3ybc+fltxldUH1+4fg6BEtBsKjlBidaRseOEzuvHqVz5F3U0PvkNGpFILLJivO8q80Id2AdpMLqFWp4pC9YnKm+WO72QONz1rD/R0lp03m1gycptOcPidRrJSFVUjdvNLwDxzwR+gmCCCi+D6mpZxHT6ccjIcy0ZYwLHeA6whGEGQ/jhsv6KNTJAtlGBqmfJV7eduGn7lNK4xmaWGx6PYVFssH1s0Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(83380400001)(53546011)(31686004)(38100700002)(2616005)(26005)(86362001)(2906002)(31696002)(8936002)(8676002)(4326008)(5660300002)(6512007)(6506007)(66946007)(66556008)(6486002)(66476007)(54906003)(6916009)(316002)(36756003)(41300700001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3VSQmp5N3hxVzFkTlYxMWk2ZktsMkFDdnM0ZXgyNnZIZUYyeThvdXZneDZ3?=
 =?utf-8?B?TjZhak1ZZE9Rdk1pM051NkxFWkZmRjlMSHdubFJFTFAzZHhoTlU1SitQRHBq?=
 =?utf-8?B?K2VFRjU2L1VtRXhadUNvelN5UVFlVUd6ZVlmRWlxSHM4L3hDVXZ6WTA3cVdX?=
 =?utf-8?B?ejZ5ZGVVUDIyS0RHRW9aSktScGJRV0dNeGNacHFxMVRuUDdaMGlORDNrNUNW?=
 =?utf-8?B?cXk2T3FDR09QQkVHOCt4MGFUcUN1WUF1c014VmhXOEtGK1ptZkhNN3M1Ykh2?=
 =?utf-8?B?QU9UU0o3LzFad2MvTGNNeVEzZmdHYmR1UFVaMHVTQ2hmUU1hQ2ZMWlg1TktK?=
 =?utf-8?B?dG13RXgraWJwaUplMnN0SGVucjhYWlJvVGZpclZzc09zUlVjQVFJTGF5MFJS?=
 =?utf-8?B?RjBBTnR1YklZYWhHQzdJTTZHdWE1NnZuVkplWUlvSzU3bncyKzAwMFNPRURt?=
 =?utf-8?B?d1AvM25DdTZ1VWlhd3QxWWQzci8yU3doTjlIcElrRzF3WG9CS0VLWGtYejJw?=
 =?utf-8?B?LzhxalhmY28vR2tZNTdUWTBJYm9zakVBeWc3Q3JobkFrdm9TMmFvVmJib2Fx?=
 =?utf-8?B?UEVCZno4VEV1b2NWeEFtRlpKN1Q5NTZFN0lrWVNFNWlZUGQvNXRaTy9kRzdt?=
 =?utf-8?B?empVZmdmdkVtYzFNOGIySWpCc08zWDF6OTNCRFViQmYwMTVoYXhvOCt3ZnF6?=
 =?utf-8?B?bEFYaW43S2dGR3lkSk01cWwwNm8zQmFaWVdrNzFlY2JCdDc2TXZCQllYYnNi?=
 =?utf-8?B?dDh2TlVGS3FUSHplZXZuNnIveVpSSHNMUWdMdnM2NWZFWGsyMVpNVFZsbjBx?=
 =?utf-8?B?dThIMStQVmtGVFpYemRiYzR3VE02N2pSL0Y2T0E0aGczNElXR3AwdHMyRDRs?=
 =?utf-8?B?OTFoajFIUDVZUW9zR3RCVHg5VDFWRXk1Mkk0WlpTMHhyK2RsUjUway93RVV3?=
 =?utf-8?B?TzlmMlpYZDNXNEhCTVVGOUZTOW1DM2dCTnp5MlRxTGF0YU9vVUppY0ZuQ29J?=
 =?utf-8?B?RG5FUnRvQ2hCUW8vNUJGVGlkVEsySC8yeU5lc242Q0huU0I0aktUd3RibDMv?=
 =?utf-8?B?UnMxdldSRU41MStMbzZzNXoyN1ZIV0RVa2N4Vk4yN2VjU0dKclFjR0x6VlVU?=
 =?utf-8?B?bHdZZzNFRDcycXhDZGNpUXN3YW4zQ2ZXUW15ZTdubURtZ0VodkUvR2E2dmhN?=
 =?utf-8?B?dnVsOHhpQzhmL1RKdzFBMHpOMlNTVHdqRnJPTWs2YkZsZk9PdkptRU5yWkZ5?=
 =?utf-8?B?RnZWZGhJeUNDYnlDS3V0RjgzSUdMUlNzN1h4M2FNaVNzMnd0WnNRSVB6dGdS?=
 =?utf-8?B?Z09hZHNlV1p1TW9zc0Q1SFRYN1ZFL09XeWFPRXFHYU8xZFRVQjM2OEREYWRG?=
 =?utf-8?B?YkhUc3kvZHA5Zk5sRGV1NGdHRWZ1Tk5tbkVFYXZ5WmlCblZWdmFLekFpSVo4?=
 =?utf-8?B?VWFuSHpWUWU1aHVVcFpqd3RIVGdOUWtmNWFUeEkxWFRORFZnQ3JJSjRJNy9Q?=
 =?utf-8?B?R0diejREbFRidSsrWmp1VWRFSy9VZ1RHaWNtWkNTbEd5ay9rSEJlaVorYXB2?=
 =?utf-8?B?a1ZXYnZsMUlpM09SWTR5cXpkMlBRak9CVG1ONFBqOGZqZzZzbi9GVHA5UWFE?=
 =?utf-8?B?S244UjNad0JqUHRjUmtHTlNGSUZGbUpHM3F6ZFJQamFoV21rejZMLzJjL2F5?=
 =?utf-8?B?VWRZMUhldWtMTHRDUm1DMFF1VWt4NkJTTTRzOWE3RzdneDlUMkRNbFlKSDdO?=
 =?utf-8?B?UUd0ZnkzeUpkZUY1ZTFLV2JjbSszQzM2aGVKY0dKL0g3MFhLS1l0MmVoMnIw?=
 =?utf-8?B?R00vSEFUaElTOFdHOEtidW9YOUtDSTlienhMWXYxQ0ZQY3IvL0pQQVJ2Ulk0?=
 =?utf-8?B?VUJVOXpXYjlySzJMMmxlS25sc21hNEZkUGV0SzlKM2Y4Z3E1aWZRRkQrYUFw?=
 =?utf-8?B?MTd4c05OcHV3a2U4a1EzMk9xTTZPLzFNTVQzRmhLZ3prbnNMUEZldGVjY1U1?=
 =?utf-8?B?d1M0a3hyeUs4K3EwMDJoS2hrUTdUNzlFVDFxVk9yaDV1RXVNNFF5N25HRWlx?=
 =?utf-8?B?aEh5OTVoWkMwWSt1YTJxcHJGMitGd2tjbE42d1pPZFo5STBDUGxrY3RSM0JC?=
 =?utf-8?Q?G2hR/Tbbs40t3fh3/zWFcKQXK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420489f9-ecb1-4c8f-8bcd-08dbd076d6f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 07:41:43.5248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUna5xkUGeXPZGzaYBvfyndXZYRIUNkCZnOrnc0dvjP+5nnd7MiZy49bEDQO3aKtH3STkwxtqsvP8Li1lKGRcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8504

On 18.10.2023 18:07, Roger Pau Monne wrote:
> SAGAW is a bitmap field, with bits 1, 2 and 3 signaling support for 3, 4 and 5
> level page tables respectively.  According to the Intel VT-d specification, an
> IOMMU can report multiple SAGAW bits being set.
> 
> Commit 859d11b27912 claims to replace the open-coded find_first_set_bit(), but
> it's actually replacing an open coded implementation to find the last set bit.
> The change forces the used AGAW to the lowest supported by the IOMMU instead of
> the highest one between 1 and 2.
> 
> Restore the previous SAGAW parsing by using fls() instead of
> find_first_set_bit(), in order to get the highest (supported) AGAW to be used.
> 
> However there's a caveat related to the value the AW context entry field must
> be set to when using passthrough mode:
> 
> "When the Translation-type (TT) field indicates pass-through processing (10b),
> this field must be programmed to indicate the largest AGAW value supported by
> hardware." [0]
> 
> Newer Intel IOMMU implementations support 5 level page tables for the IOMMU,
> and signal such support in SAGAW bit 3.
> 
> Enabling 5 level paging support (AGAW 3) at this point in the release is too
> risky, so instead put a bodge to unconditionally disable passthough mode if
> SAGAW has any bits greater than 2 set.  Ignore bit 0, it's reserved in the
> specification but unlikely to have any meaning in the future.

May be worth mentioning that in earlier versions this indicated 2-level
paging support.

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1327,15 +1327,24 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>  
>      /* Calculate number of pagetable levels: 3 or 4. */
>      sagaw = cap_sagaw(iommu->cap);
> -    if ( sagaw & 6 )
> -        agaw = find_first_set_bit(sagaw & 6);
> -    if ( !agaw )
> +    agaw = fls(sagaw & 6) - 1;
> +    if ( agaw == -1 )

Would you mind making this "< 0" or even "<= 0"? The latter in particular
would already cover the likely future change of dropping the masking by 6.

>      {
>          printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
>          print_iommu_regs(drhd);
>          rc = -ENODEV;
>          goto free;
>      }
> +    if ( sagaw >> 3 )
> +    {
> +        printk_once(XENLOG_WARNING VTDPREFIX
> +                    "IOMMU: unhandled bits set in sagaw (%#x)%s\n",

I think IOMMU: is redundant with VTDPREFIX (or alternatively iommu->index
would also want logging). Also note that VTDPREFIX (bogusly) has no
trailing space. (I realize both apply to the other log message in context
as well, but still. I'd be inclined to adjust that at the same time,
including switching to %#x as you have it in the new log message.)

> +                    sagaw,
> +                    iommu_hwdom_passthrough ? " disabling passthrough" : "" );

May want a leading comma (or some other separator) in the string.

> +        if ( iommu_hwdom_passthrough )
> +            iommu_hwdom_passthrough = false;

No real need for if() here.

I'd be happy to adjust any of the mentioned items while committing, but
of course I would first need to know which ones you agree with. Since all
of them are cosmetic, either way
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

