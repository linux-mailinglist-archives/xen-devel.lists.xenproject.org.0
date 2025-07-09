Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD1AFE1CE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037802.1410329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZPn3-0003Rd-M0; Wed, 09 Jul 2025 08:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037802.1410329; Wed, 09 Jul 2025 08:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZPn3-0003QC-JB; Wed, 09 Jul 2025 08:04:29 +0000
Received: by outflank-mailman (input) for mailman id 1037802;
 Wed, 09 Jul 2025 08:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjof=ZW=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uZPn1-0003GC-I3
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:04:28 +0000
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c405::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53cf073b-5c9b-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 10:04:26 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYYP286MB4973.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 08:04:18 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%4]) with mapi id 15.20.8922.017; Wed, 9 Jul 2025
 08:04:18 +0000
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
X-Inumbo-ID: 53cf073b-5c9b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUVZLCczkcastHVdCFYhKfOHY3ZRsbGMNQO1dKdOABpMyksiSJzLG0W/uzsvpAK9zKGpHdQpePugIDNcfEnio9BPxN4+DHhWcbnctGXu9dqc1/k0yp6DjxX7aGig0s9ZZ+E9N75DsoPCgdznfK5dpsImAr7vWBA+FPygn0xOKf9+z20Ae/0O/DcZtjRL3TvxTWBrrHISkcG/lpDqWwICvw3RO/AyLDwzehDbOqZ6Zu970Kx0iB3jSQ4gfLBkUXzzuNd5QQ3yYWdFEidpBxmu17QiRV9IqYd44SlkF11NB3UvZOSm/sw1lZLV45OAjFGwgIiuwKlhjJZJQYYn2ZCqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfP7CC/JxIt9m+JVWBk7zPJB3UkSUYo3PR2K9A+WYvg=;
 b=g65RYGgyhZftNRMzW2Ik08RGliaYAp0LbyAnC7acFHPW3B77eF/u2i35Z4NiyuNjhKUJAvvOXA9YD96gSkNx16zqbCQZYllXFErohPXxSXjermiBjxYxYmWWow4C4vRq3eyBidNXvTLPqK04DcHV+PPohPGJdO3g1ZMWtAAvNql8RsUaDsZNpS0JuFhh3i1cp0PWIdv8lMA/FHIE/EZDMgDcb8N31PqamrfKW7b4vVoEN0njbx7opP53YcWz6xvN1gf4ULZmJmcWRjtEmJjnU6RSQcSwaaDCm5Y02+Ef065NZ5+BBnuYC+WR63/JNhj4KPgXDhN4lnuNIVYCIgTIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfP7CC/JxIt9m+JVWBk7zPJB3UkSUYo3PR2K9A+WYvg=;
 b=rY9Schez1iRvAqEke4Khq4Nf0UVFjWbMtdU6EqKJB3k9CAWCMH/rtJ3FRoIGOd//wizD5xn/c1RYPGYZdqdVY2cWhxIv/Vy7JI28soCCcpcRIFuVaz+NfG27LqvTH2FdRSoUSU6646RmO2DmACUnjHRIm5t4ARzhZ92lMG7DcOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Wed, 9 Jul 2025 17:04:17 +0900
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
Message-ID: <csgkv2lsyinwlmffu5sdr7tivhkd5zfykk6wyadon4cdncedmd@bulrngfqh6qj>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
 <fd8ce200-320a-406f-85b1-8087b9cc90a2@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd8ce200-320a-406f-85b1-8087b9cc90a2@suse.com>
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYYP286MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c660e11-d514-4d81-2318-08ddbebf342a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3YFel39GMVjccUvPFu9fIGUjN4rvzOQmnzvK4dZy9Y3XGYoIHWjOMUus6PHZ?=
 =?us-ascii?Q?WV5E6EZkV6VWwVAuDc+PpfC22WiG9JnyASboChb3gYNfrvC/WGMlgx0r1FNO?=
 =?us-ascii?Q?Xm2kyR0iC7ncNG8F0ojsRQSMDCeGLld9rLmYFpVAllQz7keBDBP7O4DekpNL?=
 =?us-ascii?Q?vTs2cP6oOvjVnWCO+7BOTnsr7W/9xhLFeB7wHli74wWhQ0LTAJmnGBPjESct?=
 =?us-ascii?Q?z0MmMY2MjuhxoUn7ioQPzy2gsIg4wVYk3TnEMiVUSzbqkYDrPbiTelbLuwy7?=
 =?us-ascii?Q?/ZKgFoDLnRA6QJL+ct9kJoAJ+Wy9UO35GdFvPUZOczi9ZinMUsyozsK8ruEN?=
 =?us-ascii?Q?Nt97GPervSJ0RO7J9xePSR7FhPtt82Yj/ppgyRQ1M+wR6peBTJKFJBCET7RE?=
 =?us-ascii?Q?QUGrABWPJFx6nwXcj9kLyiyo8ikAmEbXT1LMHXJsbOBee0rf7aQrNR3UFdq5?=
 =?us-ascii?Q?LXaNag/DNsPOKKPyacVO99owxM9tm+1UXT7uwFrA6Zlek2fl91yAssKNIEGj?=
 =?us-ascii?Q?wlnSF/WnX2wMdqXxkP31ZIvz8bqTo1atNoJ65ANiI8iykGTYZCHKbW9JtBc7?=
 =?us-ascii?Q?+6bYLClGu5aWcxRJ5WBlhMQS6LWO06zhpkDA5NVZJJ06qIpfor3LCgcb7nDs?=
 =?us-ascii?Q?jXLzKAQ6GiDVSsy1EI29sImBpO/X1j9rqMmwpDIyjch4M5vXNaalDU/4H+ra?=
 =?us-ascii?Q?4c3kBq/LLNVFUhudRPtIQVFX8mKpC3Df15RJEHzwuJymGIPUjbzXFaTUJ5W2?=
 =?us-ascii?Q?XdiGVe++gb0w7YwA2lLx3U83PeDAn/gkt1CnBgeIoowxGvEAYoPKLFMVXrlx?=
 =?us-ascii?Q?CoTL6GRuNthn5vgbpTEYDUdjO0HB5AKb15XrakatSsCfDwENC+loQwhFI/0C?=
 =?us-ascii?Q?Ef245jsaaOT1Sg7NxHuiVoJKjyZBrygi4KL6Gq3BwoICgfNv6OrImm0lN9pV?=
 =?us-ascii?Q?igKdKuxGjJXpYJew1dnhALq4IqggSTFyvlkNTKLeaGlTbCKlyn5irZ42YmMI?=
 =?us-ascii?Q?ecDFoOj44J7rKmRtsrIcq0xa59y02LdjpHmsXS0WDBt3lhaf321z4nNrq/nB?=
 =?us-ascii?Q?hiI7TPZ3I2p/c5kdTx9pMi4l2uv8JWtpz6OZFyGiCZtJpocYZm5inQVZ+TXD?=
 =?us-ascii?Q?vJU+h28oY0Rr8gePNfA2/N4hm5H7WlNqRrfL76Ph9+moAN2spw58Y3ZnhLW6?=
 =?us-ascii?Q?mlrqtFMtNiAjmOKIJRF+/gTgHpJuhc4+ufvLk0Onb+NZIgt61kKchhHjmTdM?=
 =?us-ascii?Q?Dq/7efbPTGNUKYT75oRG6xm3VbASazgUQ/zeO9gvXXF79YfGLkuYsXxryjfG?=
 =?us-ascii?Q?LDbtxUpY1p42P6CkNkvi8ePDD7QMVxhfb8rC4keE0rWXNjegjfP4SMrNnzpl?=
 =?us-ascii?Q?skPKvEv5Qt/bYiiVAlh2q7iD4w37UaXoP+fqY4Er/TSvHaVgAx8vZOUtBpPH?=
 =?us-ascii?Q?Y9mboy9ffJ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lHEhffUnoGajE5FFq7UDdnYH/ITXgpj01FFLJkDJATV2qiL6onLFrXHvjVHP?=
 =?us-ascii?Q?fUDMSu3l/bYIzeQ7+eYrC0dpDRXtALnGSZ20vEtE4yoIB6IMIkik2ShNH4Ww?=
 =?us-ascii?Q?z3PsszrN3y7PhXw6mVGhNruQn6prPZJ6H9GW29f2mJzlEQlGi7e+v29zktsR?=
 =?us-ascii?Q?HypPYxqEBrId24orge43x17VfLo+dGjl1t7b7JnDNXLdbXktwOx6xZcFAEE6?=
 =?us-ascii?Q?IhUeYitbEnlepBO6o015Ox/CgI3zOEtx5jHMoqcfqDW3jiMOd7Ndw55RrXBZ?=
 =?us-ascii?Q?x7jqwNCYq2UyXFf45sbEIHu7K3G0Ws43PTdvv7gjSBPQe6O5fbGnCsjRdHpE?=
 =?us-ascii?Q?g5koUnVty5wew8+nqwVm18InYw3WeV60WDPDk6XDDZkjDHNDxLTIDjqIG9+F?=
 =?us-ascii?Q?fTuNY0GCdx3tEBPTxgmMxR8qMwbvylIM+CPsbSUsepHUlysbvJeMQXzbn0ZH?=
 =?us-ascii?Q?H6stGsWiBWtfgJzEApJpUeTMKi7aI9rPf3YKRGUoBJIZ6yLlHSsU38pXt7ur?=
 =?us-ascii?Q?olZtDkwnpgUn4tsBVo9/ntRqDpdF/MsFm0te2TKysGqp8fjabgT38zfTYFec?=
 =?us-ascii?Q?ibfO6h/5tdwgkgAhMyhjJsBqbKAY+XwPyuFdWvouuKC7i5kN9EvOA6LC8Gl9?=
 =?us-ascii?Q?iuJ9hLZmnOnegt+jlseSwwCZRJqmh8nRAWRwMST+aKd1tocRvbZontlbU5Cg?=
 =?us-ascii?Q?j9qo+/1jzPJVF3ODDfwdlNVwg72KlYu1T3+65aHJzB9m6y/V/eKbafw+JsHl?=
 =?us-ascii?Q?1FTBZOVQfY8If+q0Wxbw4L20blKIteTZHY5UZboKXL15hKWujeKx+sr9Hnqi?=
 =?us-ascii?Q?8sOmbyidxRY9em8Ez+qcqSQa++7xechwA1Pim55TH5B/ApiiSsnRJ+Ii3aEt?=
 =?us-ascii?Q?Utel9nPHbXGGR4g4XIv36FvvPrYvf1En5EO0gGs/ZpqEHh14bJsGpPSeetja?=
 =?us-ascii?Q?Y1ryvoCmFHlC8G3upYCGZFLBsDwUKscodR2/K9spIGcUoSBWtsm/cNA9ecDE?=
 =?us-ascii?Q?8U+uaaoFxy7ZypQejjtejL6uaxgsbi8te8JGAUwV2239i4Gy4iDzhhtlGGeT?=
 =?us-ascii?Q?jxyl6iHWRZKBy1njhZzd/VBVOBxDturxkccwzdiBN1bO+PQ6/nqcf1uXDQtb?=
 =?us-ascii?Q?zvBJRpFej0Ll/vGt6ACHlwH2wVDG1lHA4GAn1QjN8sUopz2P2CsGYK4yguQs?=
 =?us-ascii?Q?70K96r4KwpeK1Pn9/lUb+tK/zVe1tYfVlR/0Wygbdyt+zWURufQOlx6WtGRV?=
 =?us-ascii?Q?4IfN+xLGArNKsvv2mfJc8VYxd0od2UXzlO9tz4l7hJXCB1ivuAO30YwPjOW5?=
 =?us-ascii?Q?pNV/1bBh9Rf1YIRFeJm0OHGcFpS4D7WMWFaSznygZW+FCa3cNhVNiVVcFzzR?=
 =?us-ascii?Q?gY20bKxboXxKOrLN/2osTeuwx6NTCHLcq17Z6r17kUzi5A7e3FFtvAv+Eoy+?=
 =?us-ascii?Q?TdF/usQKiptdycSE9aAIsEze16IaeNYuXOTlER94CDAROHNZ7snDKmukicdJ?=
 =?us-ascii?Q?DY5tR2taLjZRzJ567xd9iqNqkzwQ+A2E5lWLbCRqwV5IfzgLvkH5qwmvyIxj?=
 =?us-ascii?Q?TT66ar2nvXVKnbeZQWZ2MxBMmoIqlNtTAB6A/P6KvrZVyrMyFmQcGLDfeMVC?=
 =?us-ascii?Q?bZnC44PZht/KH0x8KC5UOIs=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c660e11-d514-4d81-2318-08ddbebf342a
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:04:18.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf5sGMJVMzG/QsyJpEhTSP4GIfXKoC7XH8pzpphVrSl5RAFpL10OXVm+SWlxFq7i9Y58tWGPi6tBnYWMc+aFfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4973

On Mon, Jul 07, 2025 at 10:01:47AM +0200, Jan Beulich wrote:
> On 05.07.2025 16:27, Koichiro Den wrote:
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -180,7 +180,21 @@ int xenmem_add_to_physmap_one(
> >      case XENMAPSPACE_dev_mmio:
> >          rc = map_dev_mmio_page(d, gfn, _mfn(idx));
> >          return rc;
> > +    case XENMAPSPACE_pv_time:
> > +#ifdef CONFIG_ARM_64
> 
> These two lines want to change places, I think.

Will fix it, thank you.

> 
> > +        ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
> 
> BUILD_BUG_ON() please, so that an issue here can be spotted at build time
> rather than only at runtime.
> 
> > +        if ( idx >= DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region),
> > +                                 PAGE_SIZE) )
> > +            return -EINVAL;
> > +
> > +        if ( idx == 0 )
> > +            d->arch.pv_time_regions_gfn = gfn;
> 
> This looks fragile, as it'll break once d->max_vcpus can grow large enough to
> permit a non-zero idx by way of the earlier if() falling through. Imo you'll
> need at least one further BUILD_BUG_ON() here.

get_pv_region() can legitimately call xc_domain_add_to_physmap(..,
XENMAPSPACE_pv_time, ..) with idx > 0, but only if the preceding call with
idx == 0 succeeded. So while this may look odd at first glance, I think
this is not broken. What do you think?

> 
> >  
> > +        mfn = virt_to_mfn(d->arch.pv_time_regions[idx]);
> > +        t = p2m_ram_ro;
> 
> Is this the correct type to use here? That is, do you really mean guest write
> attempts to be silently dropped, rather than being reported to the guest as a
> fault? Then again I can't see such behavior being implemented on Arm, despite
> the comment on the enumerator saying so (likely inherited from x86).

No I didn't intend the "silently drop" behavior. IIUC, we may as well
correct the comment on the enum for Arm:

    diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
    index 2d53bf9b6177..927c588dbcb0 100644
    --- a/xen/arch/arm/include/asm/p2m.h
    +++ b/xen/arch/arm/include/asm/p2m.h
    @@ -123,7 +123,7 @@ struct p2m_domain {
     typedef enum {
         p2m_invalid = 0,    /* Nothing mapped here */
         p2m_ram_rw,         /* Normal read/write guest RAM */
    -    p2m_ram_ro,         /* Read-only; writes are silently dropped */
    +    p2m_ram_ro,         /* Read-only */

> 
> > +        break;
> > +#endif
> >      default:
> >          return -ENOSYS;
> >      }
> 
> As to style: Please, rather than absorbing the blank line that was there, make
> sure non-fall-through case blocks are separated from adjacent ones by a blank
> line.

Will do so in the next take.

> 
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -217,6 +217,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
> >                                        Stage-2 using the Normal Memory
> >                                        Inner/Outer Write-Back Cacheable
> >                                        memory attribute. */
> > +#define XENMAPSPACE_pv_time      6 /* PV time shared region (ARM64 only) */
> 
> The comment isn't specific enough. As per the struct declaration in patch 4,
> this interface is solely about stolen time. There's a wider PV interface,
> which at least x86 Linux also uses, and which has been adopted by KVM as
> well iirc. Hence this new type wants to clarify what exactly it's used for
> right now, while leaving open other uses on other architectures.

That sounds reasonable, I'll update it in the next iteration.

Thanks for the review.
-Koichiro

> 
> Jan

