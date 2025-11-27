Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A2C8DE4C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 12:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173760.1498764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZp5-0001lJ-Vk; Thu, 27 Nov 2025 11:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173760.1498764; Thu, 27 Nov 2025 11:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZp5-0001jL-T1; Thu, 27 Nov 2025 11:06:03 +0000
Received: by outflank-mailman (input) for mailman id 1173760;
 Thu, 27 Nov 2025 11:06:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vOZp4-0001jF-9L
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 11:06:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vOZp1-00B8WK-2r;
 Thu, 27 Nov 2025 11:05:59 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vOZp1-00GfYx-17;
 Thu, 27 Nov 2025 11:05:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=jWo4RouIkUGAKo3TiNy/BQDA9sT/YMf9uwK4Q+NpVpY=; b=BsH13XcXOHisGrYTkKM/WIFPaA
	arDFIPP0JbOmPm/6rbZgzvUGo3eGaweKCjo6ROZ3V24rPtawYw5a51pKqa7a8I7qvVCbSTPwljW1E
	yZyAA29A69yuTq+FOMsDMngC7973+RQnasUwYcrFKsAE5vHWGuYC6SS0udz3UfdPniag=;
Date: Thu, 27 Nov 2025 12:05:57 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, Michael Young <m.a.young@durham.ac.uk>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] libxl_nocpuid.c: fix build with json-c
Message-ID: <aSgwlS7js_5Tea_t@l14>
References: <94ffdeb1-6826-4c3a-a9c1-3ccc8b129a61@durham.ac.uk>
 <8c8b11c7-ba2c-440c-be2b-86a1ff250e0d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8b11c7-ba2c-440c-be2b-86a1ff250e0d@suse.com>

On Mon, Nov 24, 2025 at 10:26:34AM +0100, Jan Beulich wrote:
> On 21.11.2025 22:09, Michael Young wrote:
> > diff --git a/tools/libs/light/libxl_nocpuid.c 
> > b/tools/libs/light/libxl_nocpuid.c
> > index 0630959e76..71ab49ed61 100644
> > --- a/tools/libs/light/libxl_nocpuid.c
> > +++ b/tools/libs/light/libxl_nocpuid.c
> > @@ -40,11 +40,24 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t 
> > domid, bool restore,
> >       return 0;
> >   }
> > 
> > +#ifdef HAVE_LIBJSONC
> > +#ifndef _hidden
> > +#define _hidden
> > +#endif
> 
> Why would this be needed? libxl_internal provides a definition afaics.
> 
> > +_hidden int libxl_cpuid_policy_list_gen_jso(json_object **jso_r,
> 
> Nor should the attribute be needed here, as the function declaration ought
> to be in scope.

Yes, just mirroring the changes done to libxl_cpuid.c should be enough.

> > +                                libxl_cpuid_policy_list *pcpuid)
> > +{
> > +    return 0;
> > +}
> > +#endif
> > +
> > +#if defined(HAVE_LIBYAJL)
> >   yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
> >                                   libxl_cpuid_policy_list *pcpuid)
> >   {
> >       return 0;
> >   }
> > +#endif
> 
> Maybe unrelated to this build fix, I find it hard to believe that returning
> 0 (presumably meaning "success") here is appropriate without actually doing
> anything. In particular for the new function you add, I think upon success
> the caller can expect *jso_r to have got assigned a value. However, without
> any commentary it's hard to tell whether there's some "agreement" that the
> caller has to pre-set its variable (to, say, NULL).

For the YAJL function, this is correct, there's nothing to do with
`hand`. But for the json-c function, while the current caller does
initialise `*jso_r`, it would be best indeed to have the function set
`*jso_r` to NULL. (It's equivalent to return a NULL JSON object.)

> Also why are the libxl_..._jso() all hidden, while their libxl_..._json()
> counterparts aren't? And why would non-exported functions have their
> declarations live in a non-private header?

History, bad demission which expose libxl internals to libxl's users,
which make it impossible to use whatever json parsing/generating library that
libxl wants. The header `libxl_json.h` is only necessary if you want to
use the `*_json()` functions, and the only user (I hope) is `xl`.
I guess we could remove the installation of "libxl_json.h" header (and
"_libxl_types_json.h") when building libxl with json-c support.

Thanks,

-- 
Anthony PERARD

