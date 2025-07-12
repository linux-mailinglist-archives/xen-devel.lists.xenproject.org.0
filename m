Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B05B02A1E
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 10:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041735.1412335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaVdv-0007wC-Vm; Sat, 12 Jul 2025 08:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041735.1412335; Sat, 12 Jul 2025 08:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaVdv-0007ts-S1; Sat, 12 Jul 2025 08:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1041735;
 Sat, 12 Jul 2025 08:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=STbM=ZZ=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uaVdu-0007tk-3R
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 08:31:34 +0000
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c407::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c21ba1d-5efa-11f0-b894-0df219b8e170;
 Sat, 12 Jul 2025 10:31:32 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OS7P286MB3760.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:23b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.22; Sat, 12 Jul
 2025 08:31:26 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%4]) with mapi id 15.20.8922.017; Sat, 12 Jul 2025
 08:31:26 +0000
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
X-Inumbo-ID: 9c21ba1d-5efa-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoRdqFqsVG6c4s7WSM6YNwlBDOqKW5u4vmEx2iW/k0/lgcdyaKxnCBh3+PyDiCyJ54zZoHo/ee0ZMbZCE2ZKaF8sAgGde58NBlAm6mgMEWERynumvGlbbNOMn9LYasGOVw/yW/c1X5osw5P4CV+TtpSwlDxDLaHoiGUow8mhuARCfcVFdsKOjkHbE8uWNCEVIjTLPiQOLGI2OoMpt/oUaIH87e+HEn8mtJ+gV0YQcJ1UI3hDXu8a4CjvjYYBy2lrGlRuHdgb6A5bA1E1JUQQZiIOHOHH2bLI9YiQ9ZRoUGFCmO2w2DK87oepdcgSuuDbTry3yASI3bcITBGDGCIXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xh30YV8Eo4f0KidNyw1OWApSe6DT2libV/9ZdVa7WJo=;
 b=e23+ATa0g1qRuZNFpFd8JWJ4quluTIoqfj8piI8t7247LDayy35YXJe1pVNA8IqOGsmuB2++sIDVSIJSVrp8XfxPFsfEeQrOAYe+Czsn2B6atiQy7dmPqMrZdQlgOiv/Q1nzbjj4xKmSlmaM31+vPdjWyC/9Ydn+/nJWacdGnqmQQayBvQgV/6PgtpyZDnMg4cvosA1BV7QjbSiaRcqwShc0KajCEhyBrIzpicRBkPnxSxE/sOvrjp0fjOfAnogLdOEh7X6ReY97YxHVrOSRNzSQoxsXWCtulDAIzYg8LXEkQJF95So3fVHoTmiEAaS4MFLdZngD01eN44enZPLz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xh30YV8Eo4f0KidNyw1OWApSe6DT2libV/9ZdVa7WJo=;
 b=jmSKS5v/WRfue3rBa3qy1dgKNotcYpuDdVsmUYmH8cOY4xJCWefrPnDh9K6TDkm0e/d8/VXgMnijdg3lGQwahAr8913m0mXMCeL9Accwf5t2wsRYqOcHhChnXjK/dbeOys1Q5hNbSfySmsbBIMNqw0goglYwzC8V8uewCiGvsUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sat, 12 Jul 2025 17:31:25 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains
 created via toolstack
Message-ID: <cfmt745ekbvxrbvnp2hoadf7vz5drpzbbf2n2s3zgkj4dadinb@2abe5g3bb25o>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
 <fd8ce200-320a-406f-85b1-8087b9cc90a2@suse.com>
 <csgkv2lsyinwlmffu5sdr7tivhkd5zfykk6wyadon4cdncedmd@bulrngfqh6qj>
 <db37fd37-0896-4570-8002-834f0760353b@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db37fd37-0896-4570-8002-834f0760353b@suse.com>
X-ClientProxiedBy: TYAPR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:404:14::16) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OS7P286MB3760:EE_
X-MS-Office365-Filtering-Correlation-Id: 957cc67b-0ac7-4e5e-ba67-08ddc11e7e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LM3ce0TP3HpUxKmWI5WSv1BR+GwkgHMy2bmX7DkGBoIJnqf6h4Nye2dVCgnT?=
 =?us-ascii?Q?5tk5Fmxkpiy+7rWjdCL/+j6av5UEwaMTJGyunynUyVtFZRf4eUDygKIr6NvZ?=
 =?us-ascii?Q?GKk/pSNuGTWkg7mDH/fcCRbwoB77PJnwYCp5omJlU7z5Bu4lqs7G/ZmQ2IwY?=
 =?us-ascii?Q?ZFVPVt6ITG60bIrXX85qiUGY+h6f/dVKYUbB3xIWGVGuVNwUpRak6I1dvHMv?=
 =?us-ascii?Q?s+Q2XpYL8yx7IJged7HZRV/EutpWpYMmv2KzdDpzh4K7pI17trN5Hwda5HOF?=
 =?us-ascii?Q?BcS3lNg9gyeD54Nbtd7iS3oaaiiuUUS6QYO2ow743lTDiaP8FcYbmRgkhtVO?=
 =?us-ascii?Q?2akncuooTeP2Vfh+4bKz5/9IbyvIMeY/5cTWOiY2WX9Pi9Q0VUySh2Gp4rTH?=
 =?us-ascii?Q?ciCHjCeHD7Quru5oQrolhkv5xEPQ331Px75Sj6zeL81AEdw+8Lo7nP5kljPT?=
 =?us-ascii?Q?RbPCb9kv9i9Q89pcgNY4c+HurNHtRb31J3EiZLF9r0nguLHuOZAQUJlOKItc?=
 =?us-ascii?Q?XPgHWh4rI1Pfpq/W5G6wZ7SgPmtTE14OFnRRjJrMIjJRk/NZwCCXKDNnXoR8?=
 =?us-ascii?Q?IE2wtjTwYYz70tgNYoo8VD22c9g4nPhug7eRHLGwj6xx4utlIxu3tj6lmCop?=
 =?us-ascii?Q?rQWaddxmbOUxRfH4ux0Fxfg3N5YVF8buUC313j8oB2wNdZre9n4c4k6n0p/H?=
 =?us-ascii?Q?s68PQAwR5jsKpXPgQS2zWJ2UYukMcKjXBGGwcjOd18KKLR51ZUQP6fCtsxjs?=
 =?us-ascii?Q?RjU8gHGrlj4gzE0FpJNQcG2uIfW09pt7UAPY9bCTkL3ei2wVOZ6c9yuiqzs3?=
 =?us-ascii?Q?QdfIKZAPIoqfYFrSGep9dxXdTQlFRo3n6YWUppG22+iR8REVUMQVHRW5/oyd?=
 =?us-ascii?Q?zGU/m6rOgZnIj7QSkJ9epWo+8bsnw2BSiZP47ED1Wt1fVbk9ZJlcf1hla672?=
 =?us-ascii?Q?iZ7UaikQdHgvANrYMxzDHBrGrBGFUwC3pi5lWu+obKTAuLaAfiUiMEv5mVOd?=
 =?us-ascii?Q?5jeay+tE4zBkviFobUbPx3yQnvDAGNmtUhml3A3JmUoPCp3CQQLapRVQmHQY?=
 =?us-ascii?Q?1tCtpuPwEKVIRXTsocKEDKzHu7csbS+ACFvUJHIsqyINls4HQLRTY8QHRPyl?=
 =?us-ascii?Q?kRGZTpZdzQYo6FNBRwxDa3XtM8EN6Z3qdwFjSAuU+QnPUUUx9LAAElBlyOrV?=
 =?us-ascii?Q?fA18YL/loIVzNPtzOUW7uY1xUZsH1qOgHmIYrl9znApxcOsVLxl2GQBW0rDX?=
 =?us-ascii?Q?AF7Htej/XOI4kl06OOdkD6ohMqOx3Pnw+VUxrXaY5WSOWVcwA8UPq8j8amI+?=
 =?us-ascii?Q?PE0qr/kmWoxzgq5Jj+hVVDBcCJwZE8+yVIlpcwD9TzYCPuZLRhhcUkswZsYy?=
 =?us-ascii?Q?qzs4R+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XH+Ec42QNpN8+e+UG1zBV7gn9gKikb1E0H+4l3LIdxk0Dbyy1JGY1MKnYMXq?=
 =?us-ascii?Q?FSw2qTzcB2OGy5vuZqAhaf2uoDfyT60N3aVywzegPmZesyToUKXfHcGlSiof?=
 =?us-ascii?Q?ZOCfZG5olvaS3idExanqrQMDhWsLclfom3B0We3VUrLQPRBkV8hijt+/93KA?=
 =?us-ascii?Q?1OALtY8qI8EWIxz6Uq7Jo8iaokJIS6z/WKtbLjvLyM8GU1Sn/xkMbiZ45eJx?=
 =?us-ascii?Q?DkBWD486m5++igXH8id+2mJcKc1iRGCsTEoGPhszzpG8IGICbgZRmxn36aDh?=
 =?us-ascii?Q?J8CpQKXSU4ui5n+HplWYudeJhIBr3+PfzQHu5tdBiMD7vSldWuD+/r/mL0yM?=
 =?us-ascii?Q?UTWNQEXbp0JMHlHI5YKykiG7CwXvc57othxKVnrdinrvwG7EKUf4FpXwySk+?=
 =?us-ascii?Q?KBosKXw7zGH5JO5Gjp6TzX1m+vzJ8hnIRsr3bPsXLP+2B4HaSzWRLxeJczoo?=
 =?us-ascii?Q?t+jq/RYAZO8PutPV2NcbFKl8yD7/m7KqgvPwRqAJPmHGiyY7GCZp7pEGjAi4?=
 =?us-ascii?Q?2cl/ylTGxIkc7SD8uxDEupRfMKUoVrPfexVhKK+dvZKon/PS4qB66mp9fSlb?=
 =?us-ascii?Q?YJV7ucFZt3v4xdMin+HV1M9qeP7AcT0/4VVjR/beI/090H0UjO9QB18PAHfn?=
 =?us-ascii?Q?R7LstiYGCHq3sRi4M+yOaGB2i8N/JVoLK02r4vOhKEVxunnsc7Y4TsoZogGc?=
 =?us-ascii?Q?KFLlXsF2uLa2bcYjWz5NHO5DdmN2EHbQ/zflvT1FXr939Xt16ZUPu34Sn8LT?=
 =?us-ascii?Q?RYqA3ieg1yfu8+WTXoKcyHH8uxImW6nNP+us3dJPBPYXM211jMGbeTK+pKsj?=
 =?us-ascii?Q?vrKx/B76V0Hk/ElZHtZKSXhYRs09yRY/hlsYbutbV8Pdsqivlbf3eH2SvLzu?=
 =?us-ascii?Q?pjOgPAVWdwtbQi8kq9CanGfm4KephbKmMnhEZWU+Y1MtIYFTW3/e9F1NIKEe?=
 =?us-ascii?Q?se/jkbFik+qlGQL7Q6TXM907yuXYL1AeYUHlspO9fx8GwaMVLaTkbA2AhxFh?=
 =?us-ascii?Q?wOmxUXtbfmMdGjoCDoe/39F4KIDq/1sY2rt2Myolxrt0ewskOg6Hqbl3C9hU?=
 =?us-ascii?Q?N2ylWTxqK0E36YZkgnhjHLUn/Hx4FYJN0JWor3R6QLlk4q/EzghEDoigSu9z?=
 =?us-ascii?Q?c8guSOtbNCkH+akzjW4tlhiyhSH1p/WWVnqa1x6KolCxMpL1OXyItdnBP/VG?=
 =?us-ascii?Q?MYT99IEqeXCVaTfcdlnxOr/dZ12uLE0+L87Qeh6bfPKbzEMIxR1UE4vU58tW?=
 =?us-ascii?Q?jPPHiwZCqec51k4zHTsVjmCO+oR0vLDDURDEK+Jfo3p+DqSRQ92NlxPoRyvn?=
 =?us-ascii?Q?zcCm4CafC/r5sAp+mvEuZHSahQehVLx+r3ZlzxwL1MsGqyrEYIp7rSOKLksj?=
 =?us-ascii?Q?pRh9/i5gIVNVpy9wcf/7LPm4inAbU6WxHDKfPycLFlq1fNVXy+jRvAqI8Vr4?=
 =?us-ascii?Q?srI3WiFlm2u4L1qdVQ1Kyg2eTLJb73J5pEBzkn//wDHbVbhASdkx6DhUPoWv?=
 =?us-ascii?Q?cw1upyZ75NVXz5Ji3O67rGFv+Qf2FJicxHnlJVAXpFEtPFbivG08ScKcTop/?=
 =?us-ascii?Q?nFKgpE1w2o87ASzVYnpHTBcn2tH5mk/PdcK2Pp3ijpXZVgTQTVTKpAFGiHKo?=
 =?us-ascii?Q?vZ+PxmF5pqijsemW/LV2e1A=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 957cc67b-0ac7-4e5e-ba67-08ddc11e7e1d
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 08:31:26.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMhkpBfTzTj5w0hOmFmzNYPB80ntW4TAr4tLm7ijpXZvFVwIsUuse3fGYzrZuxTtlynaLFlTMmEU6QViSajd9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB3760

On Wed, Jul 09, 2025 at 11:16:02AM +0200, Jan Beulich wrote:
> On 09.07.2025 10:04, Koichiro Den wrote:
> > On Mon, Jul 07, 2025 at 10:01:47AM +0200, Jan Beulich wrote:
> >> On 05.07.2025 16:27, Koichiro Den wrote:
> >>> --- a/xen/arch/arm/mm.c
> >>> +++ b/xen/arch/arm/mm.c
> >>> @@ -180,7 +180,21 @@ int xenmem_add_to_physmap_one(
> >>>      case XENMAPSPACE_dev_mmio:
> >>>          rc = map_dev_mmio_page(d, gfn, _mfn(idx));
> >>>          return rc;
> >>> +    case XENMAPSPACE_pv_time:
> >>> +#ifdef CONFIG_ARM_64
> >>
> >> These two lines want to change places, I think.
> > 
> > Will fix it, thank you.
> > 
> >>
> >>> +        ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
> >>
> >> BUILD_BUG_ON() please, so that an issue here can be spotted at build time
> >> rather than only at runtime.
> >>
> >>> +        if ( idx >= DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region),
> >>> +                                 PAGE_SIZE) )
> >>> +            return -EINVAL;
> >>> +
> >>> +        if ( idx == 0 )
> >>> +            d->arch.pv_time_regions_gfn = gfn;
> >>
> >> This looks fragile, as it'll break once d->max_vcpus can grow large enough to
> >> permit a non-zero idx by way of the earlier if() falling through. Imo you'll
> >> need at least one further BUILD_BUG_ON() here.
> > 
> > get_pv_region() can legitimately call xc_domain_add_to_physmap(..,
> > XENMAPSPACE_pv_time, ..) with idx > 0, but only if the preceding call with
> > idx == 0 succeeded.
> 
> Can it? What's the intended effect then, when only the idx == 0 case is fully
> handled here?

GFNs are made always contiguous in this implementation (while MFNs might
not) so it can register the whole range in one go when recognizing the
starting GFN (when idx == 0). It's ugly indeed, as it implicitly requires
the caller firstly invokes it with idx == 0 and aborts when it fails.

That said, after reading another feedback, I'm thinking of simplifying
the whole patch series (as I just said in [1]) and I believe this
unnecessarily complicated/confusing stuff will disappear.

[1] https://lore.kernel.org/xen-devel/20250705142703.2769819-1-den@valinux.co.jp/T/#medaa074cd863c05606bfdb6280cd4ccb88803bc7

> 
> > So while this may look odd at first glance, I think
> > this is not broken. What do you think?
> 
> The GFN not being recorded anywhere means the call has no effect, while giving
> the caller the impression that there was one (by way of returning success).
> 
> >>> +        mfn = virt_to_mfn(d->arch.pv_time_regions[idx]);
> >>> +        t = p2m_ram_ro;
> >>
> >> Is this the correct type to use here? That is, do you really mean guest write
> >> attempts to be silently dropped, rather than being reported to the guest as a
> >> fault? Then again I can't see such behavior being implemented on Arm, despite
> >> the comment on the enumerator saying so (likely inherited from x86).
> > 
> > No I didn't intend the "silently drop" behavior. IIUC, we may as well
> > correct the comment on the enum for Arm:
> > 
> >     diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> >     index 2d53bf9b6177..927c588dbcb0 100644
> >     --- a/xen/arch/arm/include/asm/p2m.h
> >     +++ b/xen/arch/arm/include/asm/p2m.h
> >     @@ -123,7 +123,7 @@ struct p2m_domain {
> >      typedef enum {
> >          p2m_invalid = 0,    /* Nothing mapped here */
> >          p2m_ram_rw,         /* Normal read/write guest RAM */
> >     -    p2m_ram_ro,         /* Read-only; writes are silently dropped */
> >     +    p2m_ram_ro,         /* Read-only */
> 
> Don't know whether that's a good idea, as it'll diverge Arm from the same-
> name P2M type that x86 has. (Arguably x86'es type may better be named
> p2m_ram_write_ignore or some such.)

Thanks for sharing your thought. Incidentally, there seems to be the same
comment in ppc's p2m.h as well. I'm not sure at all but I'm guessing that
"writes are silently dropped" line would make sense only when PoD and/or VM
forking is to be supported by arm/ppc, and leaving it as it is for arm/ppc
might be acceptable at the moment.

> 
> Jan

