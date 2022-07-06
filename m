Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C15685F4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362093.591982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92Vr-0006kt-Tv; Wed, 06 Jul 2022 10:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362093.591982; Wed, 06 Jul 2022 10:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92Vr-0006hd-Qb; Wed, 06 Jul 2022 10:44:07 +0000
Received: by outflank-mailman (input) for mailman id 362093;
 Wed, 06 Jul 2022 10:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lo2B=XL=citrix.com=prvs=179813542=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o92Vq-0006hT-9k
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:44:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cffada6-fd18-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 12:44:04 +0200 (CEST)
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
X-Inumbo-ID: 8cffada6-fd18-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657104244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=66dhwcKzqHemU6p1wmUfhDtEquNljMoqjZh7U9fdIDc=;
  b=iLhWMVR4+S2cwETs5jSy3VSZEUIK8XU40KcVJ/Hg17o9MQPMwZM3MCx6
   Y9WjEJlFIPooOHs3tHMnPzIHYrOHplRNFuwiyLnTpLCzRQ4DyCcRzFGB6
   ZVNxPJCJcLLoZiFQX/xgq8eGlG1C6fjxQiy3lPNI3vFIowH6zEcwV3AQz
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75203369
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vdtuiqNm3y0Xx4jvrR3Yl8FynXyQoLVcMsEvi/4bfWQNrUp01WAFn
 TcWXW2FMqnZNzHxfNslPNjk908Hu8DVz9M1QQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZm2tAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 opss6ebSh4SH6jrt8UYU0RiOQBSFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQKyGP
 JFHOFKDajyHURt9YVwlF640nfyNqVL9cSRU8nS88P9fD2/7k1UqjemF3MDuUt6FX8JOhW6Du
 3nLuW/+B3kyK9i32TeDtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQq3eeuBkYV/JLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BL2NOtoa+Smum17KzghK3OXUvB04uTHpRJeca2OUPsL3fnzqWEIs8Sfbt3oCvcd3j6
 2vU9XZj3t3/meZOjvzmpg6f3lpAs7CTFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdwTXGY3h5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJGCxP
 BGJ41gIus870J6WgUhfOtvZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 Kp3hf2EVC5AYYw+lWLeb75EjdcDm3FlrUuOFM+T8vhS+efHDJJjYexdYAXmgyFQxP7snTg5B
 P4Gb5LbkEkEDrCiCsQVmKZKRW03wbEALcieg6RqmiSre2KKxElJ5yft/I4c
IronPort-HdrOrdr: A9a23:oONg/KxG52dVpspOQRX8KrPwFL1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPHjP+VAssRAb6LS90ca7LU80maQb3WBVB8baYOCEghrMEGgB1/qA/9SIIUSXnYQx6U
 4jSdkdNDSZNykDsS+Q2mmF+rgbruW6zA==
X-IronPort-AV: E=Sophos;i="5.92,249,1650945600"; 
   d="scan'208";a="75203369"
Date: Wed, 6 Jul 2022 11:43:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Charles Arnold <carnold@suse.com>, <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] Fix compilation error with gcc13
Message-ID: <YsVnbZrDHSVECPZl@perard.uk.xensource.com>
References: <46d17735-e96f-2eee-5d24-fc3d15526c6e@suse.com>
 <ca75ce19-7fea-68c2-f046-0bc2abb3d5d2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca75ce19-7fea-68c2-f046-0bc2abb3d5d2@suse.com>

On Wed, Jun 29, 2022 at 08:29:02AM +0200, Jan Beulich wrote:
> (Cc-ing maintainers / reviewers)
> 
> On 28.06.2022 18:09, Charles Arnold wrote:
> >  From 359f490021e69220313ca8bd2981bad4fcfea0db Mon Sep 17 00:00:00 2001
> > From: Charles Arnold <carnold@suse.com>
> > Date: Tue, 28 Jun 2022 09:55:28 -0600
> > Subject: Fix compilation error with gcc13.
> > 
> > xc_psr.c:161:5: error: conflicting types for 'xc_psr_cmt_get_data'
> > due to enum/integer mismatch;
> > 
> > Signed-off-by: Charles Arnold <carnold@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> The subject would benefit from having a "libxc: " prefix, to know at
> the first glance which component is being touched.
> 
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2520,7 +2520,7 @@ int xc_psr_cmt_get_l3_event_mask(xc_interface 
> > *xch, uint32_t *event_mask);
> >   int xc_psr_cmt_get_l3_cache_size(xc_interface *xch, uint32_t cpu,
> >                                    uint32_t *l3_cache_size);
> >   int xc_psr_cmt_get_data(xc_interface *xch, uint32_t rmid, uint32_t cpu,
> > -                        uint32_t psr_cmt_type, uint64_t *monitor_data,
> > +                        xc_psr_cmt_type type, uint64_t *monitor_data,
> >                           uint64_t *tsc);
> >   int xc_psr_cmt_enabled(xc_interface *xch);
> > 
> 
> The patch looks slightly garbled, reminding me of how things looked
> for me before I adjusted TB configuration accordingly. I'd be fine
> hand-editing the patch while committing, if no other need arises for
> a v2 (and of course once a maintainer ack has been provided).

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

