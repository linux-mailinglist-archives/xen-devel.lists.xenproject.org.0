Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0EAEC780
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 16:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028315.1402340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVW4z-0003D7-7F; Sat, 28 Jun 2025 13:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028315.1402340; Sat, 28 Jun 2025 13:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVW4z-0003BF-0a; Sat, 28 Jun 2025 13:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1028315;
 Sat, 28 Jun 2025 13:58:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XT7f=ZL=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uVW4w-0003B9-Sk
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 13:58:51 +0000
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c405::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 029eb6b4-5428-11f0-a310-13f23c93f187;
 Sat, 28 Jun 2025 15:58:47 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYCP286MB3800.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:37b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.13; Sat, 28 Jun
 2025 13:58:40 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.012; Sat, 28 Jun 2025
 13:58:39 +0000
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
X-Inumbo-ID: 029eb6b4-5428-11f0-a310-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clGb2SASBlSBqUaLuNbv7zKndzd741hiJUHFJ/ldJ5G0UCiyiBFlZlFa7fcJGl1KlSPwuU1MR21jfi/e4SVFBivCf4I8yOzen0RfVTIyZo7o14Z7WAFCGcbBMFB9fMAo/na/G66kOIrPHXxE1WypGqtPoRQ7by0Z0Btx79jO1d/ZQ3uSPcVOXkXDiznrWkI8MkcxLujE3/qZwCZXRqeyXaOO1KEeHrP22AxLCxTnmBTVFv4orJWyyWv4Ycdn3G/3PqsG3jvZKIh9Dlh8WMsMtvRALSwnL/RgNHynzu6imv8FBi+3eeCVGP9a5mPUbU1HFbPNW/T6nyfs7JykzsBUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/w82UJ/CGkxr4brX5JsZdPrGEpt4QFGjYiEd6ZryFM=;
 b=EZOFykZbm5z2SETIF1p4mGydLwm9VmVZSgi3qs7+5SGiraV4dKrXxVwxA4D173JsiK+uCGQJlTA/0+pGXd2eRkYaWtG2SSh+d3yf/OhUZbZI0qjrAQz0bgNd7QkWrCq1z9W1rfmaA63eNXnpFSb3wrPttPKfdM3X2xZ5k+wXqDAfV0HIK96zGvhBt6snIJGR/LoDAGXDxMZqjBziCs6cRqzQ87+SPKmejAMBb5j18I/SJiy4RA41DjgOo7PEah6kgmTHhNIU7FmoSfpN7QcTpB//lzw0pbPu8CF54T9kpckLfC0I/hUrsOGtZYZp9DiBrc1MxKlpJmItBZYRWo+Avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/w82UJ/CGkxr4brX5JsZdPrGEpt4QFGjYiEd6ZryFM=;
 b=GSIAvUgiBv6HosIyfEZ617aLNa+mCGjIPFCIH4KqFAZPIdY6T3mw1N3N6YJLa2Vv4Mfng4+hO8zvmSzWzNXjNWLIHvvQE/8g/35uxx+TDBNyiW/XLZN66CyUkxJq/uVUVxtRNFQ2eu2/2L8JCMalqP03oA8DOlXOVEmlBpULKKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sat, 28 Jun 2025 22:58:37 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface as
 per ARM DEN 0057A
Message-ID: <zyuhfqsecyt3upsj3lrixgakn4bevbofdaylgqfwkukss5l54p@j5wvfn3545a6>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-5-den@valinux.co.jp>
 <21cbc79b-2209-42ef-8085-81c41e8e697b@xen.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21cbc79b-2209-42ef-8085-81c41e8e697b@xen.org>
X-ClientProxiedBy: TYBP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::31) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYCP286MB3800:EE_
X-MS-Office365-Filtering-Correlation-Id: 4919abce-dcfe-4b47-c718-08ddb64be26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S6zw9UJFLE1VEaiZUKDYrvXOvn0AGZ+iz9usXVX4EVHlUHiYRIf6K2KFzUK8?=
 =?us-ascii?Q?Zkk0kaXvVXfuyZREpCSqBuoQthbgI9T9QK86Q+ga7aa5vW1P+S9chFiSkkgo?=
 =?us-ascii?Q?2D3PvPpppi+0FolNelt+UumN4XfwB6Of0QlubjH7Wmf38t1+PhdBla06vmyF?=
 =?us-ascii?Q?tb7XUI74OdXjTuR6B/u5KZR0Ucd5IuWfxLuPEHTHs8pb+evANht8Hxe9lzzI?=
 =?us-ascii?Q?TrpLOfa+wMz60aXo5iuQxnCJZInSoqFSpNfQVjt2XkBE3+1XXSfslMIHAVtr?=
 =?us-ascii?Q?d/kpSyNeSKMJSFcDqB4LFywwRySCeUDIlTkSbOqUgWa+6kGJxF8j+jNQlc5t?=
 =?us-ascii?Q?sCbMYwFMnbVv44vkwXms2uvsJe5PsJvoXnWsn9P3u9yr4tR88RCfGCY9S5L7?=
 =?us-ascii?Q?7LuZ7U6FD4mbBBEoChafn44vg7hlals0O8geb3qYzu5EVP/fLJ6+qBfshZ3J?=
 =?us-ascii?Q?eiZ+zGiYjq1BPK9ZVL9u2ubsHafKsIjDQrgTCl5YHBQMbBONMeQyHDzkRY5r?=
 =?us-ascii?Q?2DWFMVSKxelIb7QRHJaO3AO8/SxWVqzQzDF4l7ZPXxRF787uSI5f+qqqQkhe?=
 =?us-ascii?Q?gQfx/30MR2Z0w3OgWYsP2fsYfxMMjbdaeqyDZc+0ARi+/by/hc5C4HnMNpYW?=
 =?us-ascii?Q?smvMwVd93FZvy24PI1rWdbBlpplH2Chgv+R92Y9CdlB0AfAVI07qkffKIRIj?=
 =?us-ascii?Q?3Ltj5MYdqj6URuOpUkBNQHOrQmxZbaQvb23A3ZvqvU73IpqaRbeoH2HhQXfL?=
 =?us-ascii?Q?ngIPyCQ6ChZks9OI5YycEA3KHPEomAlVMxpg3xs40kPoOmJ1bwH2U8GtaeIa?=
 =?us-ascii?Q?pxt2l4Dy/vwxkijz7umYKvz2EJZgKiIKc4U+ynpruKaVF/cWF5zaHEFaN/xu?=
 =?us-ascii?Q?10IhtZmnrEbz1/0aW3889N5QjeSNEtNXIAO1gfjZXMEpmLoXY7Vb0qQUIHtc?=
 =?us-ascii?Q?yw3uGKOS2l101pg6+FAaMvoqqLAO9HMIPabZoS2vrIJCdbRSc6naox2oHAdS?=
 =?us-ascii?Q?sOwfR0DuIOy4NJTK4x2mvy5CxGvz5zv9iZAwO5uesEd1jN215rcD/SMOLs3o?=
 =?us-ascii?Q?ItDLmMTronYq4K/fKD5w+r0QT2R1/hniPGD+9HVe+LiCDzNOZqFM/PkSRNGJ?=
 =?us-ascii?Q?2G5tlgvXbTJn557pqxSjrSXZj9E3bkyvzp8Qm/UW/Bb6vBC7VbsbDBQU5pNW?=
 =?us-ascii?Q?G7e32/8J2QgCHGhh7zfPUubWpjyUpzgAf/uFMGRrGkkfCBC6GJ1rQYqiF9MY?=
 =?us-ascii?Q?4e/0rlTGDe1n/u1EUCWVd0uq9gwp2SCGR3KjPJyx5W1AR9NriY1Q+90/Ap8V?=
 =?us-ascii?Q?mF8IXSmdVVF6MxZ2p6cvhhRaPyiEhNwOGXY9n0YM4kyUhmBNMsOhexMDnQqj?=
 =?us-ascii?Q?d/129rriXfqOH95BhHxROARPMPRCTB/0xayJeq1XGgZfkAyXWdFqxLywIjmH?=
 =?us-ascii?Q?I7fLc/p3OYU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HWL0mjviVKVw6GxGfIY0mfYxSM/LA22GuDe1JSthiC7+CVHvP4n2JGbQ7Tl1?=
 =?us-ascii?Q?tKMyUVVcCUCbS+PF0409tK9ZOkX3sd3CJm5y5TRGzUn5FW9nwErgNrdiXmWX?=
 =?us-ascii?Q?P8gdx9yVnAyXLjy4BKkXqnu49wgruHkVYCi1CGtGfAbPXne3oAGxhKzIkRzG?=
 =?us-ascii?Q?1ZMh/rLjqcWO4GkJGncSulZceGE4wGYtnCFvjMcIl/sWCaDKyNWjgJsuXFIZ?=
 =?us-ascii?Q?f7m29Vu94P3bEnl2OclZgU4KXVVS3id6KUFpJ/S/xN/OKSyDdlJs0uuTIlwf?=
 =?us-ascii?Q?Da7j4E8cR+Hu/gsfn83aVYnFQGHAXfpOzP0DU8c4d1U6Oh7LPqmatshfffne?=
 =?us-ascii?Q?pbTKQfo5ZpY4dPzagLE1+3jPh0OQ/YF8YOKJmozs3lG3uDFMii4uXXM14xlx?=
 =?us-ascii?Q?QGadqb9ZbTR+2urfQwkHCKMYA9QqueQcS+HkAkMxBL+rUngJvQihPQcnP08R?=
 =?us-ascii?Q?dxklCWWNz/pZa2FzMibfGNi/zwNQIXax0sUIVo10VTFXk5yJhdsmD7NDsv4n?=
 =?us-ascii?Q?UuxJCGOjnkgoTgvIHFkZK4zSg3lgzuzOL+4cX3Ph/lLiPhqq1fbp+UHKXHym?=
 =?us-ascii?Q?lw+6LEpR0oCS8pdkieAKJvPJnY+g05lG9h7g2XuJeOI2LGnwHABBRa6ZVNNX?=
 =?us-ascii?Q?6fnj0+O2jxJHqmBvZ5MtPs9hOloQqMwQRpzHoDACvaQjJSFH0BLD7DetLbGH?=
 =?us-ascii?Q?0SQzZUZjT5CgNWKpqdiSR0H8TB2hvoo+zI9T0T0d3662NY6pfkjn7KfOGFFI?=
 =?us-ascii?Q?V60XgBVwbpwJFrO46YTWsvvN6HLvxs30oeQ6rzenBrktssbdZjuZG5ct9rcq?=
 =?us-ascii?Q?cJVVCYwepwPOK9GwjgANu7d9DUNm0ixRL7WR/AHkWSVSM1KO7fbgsO07Z5/d?=
 =?us-ascii?Q?1wpUPqs3oNMz00XQ7U3GqxDR8hKb+8euO5oP3nqFZOO5pDS4ufMh9/zK+JKy?=
 =?us-ascii?Q?L3JfmDZQLclDVOXjHjppTnNEX1VU3Xsk0Qxk/U87KSx3jKeuZShX3lRqmBPN?=
 =?us-ascii?Q?5Y455bPQwMhf3+bswIztE0GT8En35rgzcCCe0lLwCGlJNB8jU/QP87Or5QJm?=
 =?us-ascii?Q?ZnyJEi+PZR0VAbMC/Wgjp2jNCu1AueMlwSW4q+OtuAHvCz/zipIaNRpjN3Ov?=
 =?us-ascii?Q?V+xRfT0I88W0XWTeeQ7pVhQ+ACorl7C23k/J6i063AXAk3eFFtJzM8YEoEiv?=
 =?us-ascii?Q?L3TMLr279lA4KTcLVa8YN3PI3D9eCfX6n46zaFAUmU/8KbGy+3NBJHAW0/Xi?=
 =?us-ascii?Q?tHdqoUvXv1Dr7ShRWmsQQ6Sx6NX+C5BTgl8ZIrD3BjctxmxUbCc+7g+s8qs8?=
 =?us-ascii?Q?Fks2x3FbfLLaZ7LzUf+nqv4w9aZDtE5jhlSBeY4YHd6qIpRvzI8ghVqzGeeI?=
 =?us-ascii?Q?o/zZxt1Abhy6vMbWICNbog1okdzW9/+TEMiQwzL/EziUoZFMGDqQcMsq0Cx0?=
 =?us-ascii?Q?HOw9HbqOytlgNB+exMiD9Yqei5E3YmgXUCDYWU3MTTRbC2P7BOzkAn/6/ep0?=
 =?us-ascii?Q?x80ntGrsNKoVFMsQwtXWIIbVvxxJOfI1NnpLEE9Zqx/iNh3l0GOOO+eUuqMr?=
 =?us-ascii?Q?s53B/2TJKCHtusWJ4z5xPYy9qhFoEz0Qg5bZSvcZTzB1IWJv2mw9PhPcW/Jd?=
 =?us-ascii?Q?C4csznaWJnqX/avBKouTDNE=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4919abce-dcfe-4b47-c718-08ddb64be26f
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 13:58:39.6820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25oWMTFkvfnNl06o3pp7koYbqUvm3PXwpmzzf5/6+D1vmXy6f3hyRMP0EIf5Z2EpQABb1Sbr3n/HWX4hxKVS/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3800

On Mon, Jun 23, 2025 at 09:41:47AM +0100, Julien Grall wrote:
> Hi Koichiro,
> 
> I haven't checked all the details. I will mainly comment on the Xen
> internals.

Hi Julien,

Thank you for the review, and apologies for my late response.

> 
---(snip)---
> > @@ -707,6 +723,7 @@ int arch_domain_create(struct domain *d,
> >                          unsigned int flags)
> >   {
> >       unsigned int count = 0;
> > +    int order;
> >       int rc;
> >       BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
> > @@ -791,6 +808,19 @@ int arch_domain_create(struct domain *d,
> >       d->arch.sve_vl = config->arch.sve_vl;
> >   #endif
> > +    /*
> > +     * Preallocate the stolen time shared memory regions for all the
> > +     * possible vCPUs.
> > +     */
> > +    order = get_order_from_bytes(d->max_vcpus * sizeof(struct pv_time_region));
> 
> As this is an order, we could end up to waste memory fairly quickly. So we
> should try to free the unused pages from the order. That said, the maximum
> number of virtual CPUs we currently support is 128. If I am not mistaken,
> this could fit in 2 4KB pages. So I would also be ok with a
> BUILD_BUG_ON(MAX_VIRT_CPUS <= 128) and we defer this work.

I'll go with the former in the next iteration. Thanks!

> 
> > +    d->arch.pv_time_regions_gfn = INVALID_GFN;
> 
> Does this mean PV time is optional? If so, shouldn't we allocate the memory
> conditionally?
> 
> Also, looking at the code below, you seem to cater domains created via
> dom0less but not from the toolstack. I think both should be supported for
> the PV time.

Yes, that was intentional. I should've mentioned that this RFC series only
caters the dom0less case. For domains created dynamically via xl create, the
only viable solution I've found so far is to reserve PFN range(s) large enough
to cover the maximum possible number of toolstack-created domains on boot,
which I think would be too wasteful. Do you have any recommendations how to
reliably and dynamically allocating the shared region PFN(s) when using xl?

In any case, I agree that conditional allocation would be preferable.

> 
> Lastly, you probably only want to allocate the memory for 64-bit domain as
> this is unusable for 32-bit domains.
> 
> > +    d->arch.pv_time_regions = alloc_xenheap_pages(order, 0);
> > +    if ( !d->arch.pv_time_regions ) {> +        rc = -ENOMEM;
> > +        goto fail;
> > +    }
> > +    memset(d->arch.pv_time_regions, 0, PAGE_SIZE << order);
> > +>       return 0;
> >   fail:
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 85b6909e2b0e..1c51b53d9c6b 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1561,8 +1561,80 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
> >       return res;
> >   }
> > -int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
> > -                                 int sizecells)
> > +int __init make_pv_time_resv_memory_node(struct domain *d,
> > +                                         const struct kernel_info *kinfo,
> > +                                         int addrcells, int sizecells)
> > +{
> > +    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
> > +    unsigned int len = (addrcells + sizecells) * sizeof(__be32);
> > +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> > +    struct membanks *unused_banks = NULL;
> > +    void *fdt = kinfo->fdt;
> > +    unsigned regions_len;
> > +    gfn_t pv_time_gfn;
> > +    mfn_t pv_time_mfn;
> > +    paddr_t aligned;
> > +    paddr_t avail;
> > +    __be32 *cells;
> > +    int res;
> > +    int i;
> > +
> > +    /* Find unused regions */
> > +    regions_len = PAGE_ALIGN(d->max_vcpus * 64);
> 
> I would be best to avoid hardcoding the size of the region and use the size
> of struct pv_time_region.

Thanks for catching it, I'll fix this in v2.

> 
> > +    unused_banks = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
> > +    if ( !unused_banks )
> > +        return -ENOMEM;
> > +
> > +    res = find_unused_regions(d, kinfo, unused_banks);
> > +    if ( res ) {
> > +        printk(XENLOG_WARNING "%pd: failed to find unused regions\n", d);
> > +        goto fail;
> > +    }
> > +    for ( i = 0; i < unused_banks->nr_banks; i++ ) {
> > +        const struct membank *bank = &unused_banks->bank[i];
> > +        aligned = PAGE_ALIGN(bank->start);
> > +        avail = bank->size - (aligned - bank->start);
> > +        if ( avail >= regions_len )
> > +            break;
> > +    }
> > +    if ( i == unused_banks->nr_banks ) {
> > +        res = -ENOSPC;
> > +        goto fail;
> > +    }
> > +
> > +    /* Insert P2M entry */
> > +    pv_time_mfn = virt_to_mfn(d->arch.pv_time_regions);
> > +    pv_time_gfn = gaddr_to_gfn(aligned);
> > +    p2m_write_lock(p2m);
> > +    res = p2m_set_entry(p2m, pv_time_gfn, regions_len / PAGE_SIZE,
> > +                        pv_time_mfn, p2m_ram_rw, p2m_access_r);
> 
> p2m_access_* are used for restricting temporarily permission by memaccess.
> So on a data abort, we will call p2m_mem_access_check() which will then
> forward the fault to the memaccess agent.
> 
> If you want to restrict permission forever, then you need to use a different
> p2m_type_t. In this case, I am guessing you want p2m_ram_ro.

Thanks for pointing that out, I'll fix this in v2.

> 
> [...]
> 
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > index a3487ca71303..c231c45fe40f 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -59,6 +59,18 @@ struct paging_domain {
> >       unsigned long p2m_total_pages;
> >   };
> > +/* Stolen time shared memory region (ARM DEN 0057A.b) */
> > +struct pv_time_region {
> > +    /* This field must be 0 as per ARM DEN 0057A.b */
> > +    uint32_t revision;
> > +
> > +    /* This field must be 0 as per ARM DEN 0057A.b */
> > +    uint32_t attribute;
> > +
> > +    /* Total stolen time in nanoseconds */
> > +    uint64_t stolen_time;
> > +} __aligned(64);
> > +
> >   struct arch_domain
> >   {
> >   #ifdef CONFIG_ARM_64
> > @@ -121,6 +133,9 @@ struct arch_domain
> >       void *tee;
> >   #endif
> > +    struct pv_time_region *pv_time_regions;
> > +    gfn_t pv_time_regions_gfn;
> 
> Given the feature is 32-bit specific, shouldn't the field be protected with
> #define CONFIG_ARM_32?

Is this typo s/32/64/? Assuming so, I'll do so (=protect them with #ifdef
CONFIG_ARM_64) in the next iteration. Thanks!

> 
> Cheers,
> 
> -- 
> Julien Grall
> 

