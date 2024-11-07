Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7C9C0A73
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832053.1247445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94o0-0007Zk-Oj; Thu, 07 Nov 2024 15:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832053.1247445; Thu, 07 Nov 2024 15:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94o0-0007XG-Jt; Thu, 07 Nov 2024 15:52:20 +0000
Received: by outflank-mailman (input) for mailman id 832053;
 Thu, 07 Nov 2024 15:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94nz-0007XA-Ao
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:52:19 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42346ef4-9d20-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:52:14 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so157038066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:52:14 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2e8basm107307066b.194.2024.11.07.07.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:52:13 -0800 (PST)
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
X-Inumbo-ID: 42346ef4-9d20-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyMzQ2ZWY0LTlkMjAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTk0NzM0LjkzODgyMiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730994734; x=1731599534; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y5JSaTmIdAy2Dji5JYpOds2UP0sJ27md6szUFWJuSXk=;
        b=vaVt9nOnBb3q/Cdb68WXrqXMU03XZxZZHDkJsTaW7x+GeE4YP1ZylzQucCLwokLhBL
         p8uRIj6krf/j4ZU9DuprYAzQvL6Pv8JG8Ak9Tzeo+CqN0Flhsr0ZRGyi2cVrjbDafU6S
         kqxLlXLVl50n/9hvUCynPTJYQY9AxDN0FIiLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994734; x=1731599534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5JSaTmIdAy2Dji5JYpOds2UP0sJ27md6szUFWJuSXk=;
        b=GGT4qk00BgaHZwk1WRmbkHQZE598FDERB3RdEuImgiCpQ0wwufFP8QNAdHKMUOZ9F4
         AbUGwG1KQ6Xo/prmRtH1hlgQTZ2Wa2MdpE6GG912aCTMU9mzJGpJ7BfXmnLA/QIZ7CIQ
         RcKOpH/mrWegu6i5Xu4Yp+xdfOY/AKCPyoencjcpiuy3+2tq0LXR6inmoqM3pULdy+Sf
         MAB5+YgSWNARS0CJdnqjZcGvuh4KoEipqcIS6tbSd3p5lXxLratJxh1Q0EE7+IYyZRdK
         aulHzSjh5jKQYmMDEfC168OP0ahLvqg6tYaU1SCexIskF1YqITiBoEPGfHITSsvFjeVJ
         X4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxnjxjf0fucdpAssgAjhez/IZ9PLyPHkeVAzzmtqMjEorRc2wSGLAivD3N+caD1iFtmrw94LtF6b0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIRYu89SG6JfWFvQFOklUQwZw0MnYacBo8lvlM1jpkCgSijGOc
	P6tCUouoCboguy6ELNR0JiHS83yl9hq55r42e0gmpWlhUG0eyNSoh5dubxONPVY=
X-Google-Smtp-Source: AGHT+IGFvBszqKklQqlKZPyEyWwoSZfOfSrXva4DVBLqLfNNUD9MAm1xrW4lCCIxa4iaOLKaPdKn0g==
X-Received: by 2002:a17:906:4fca:b0:a9e:c947:d5e5 with SMTP id a640c23a62f3a-a9eeaefae9cmr49999166b.28.1730994734304;
        Thu, 07 Nov 2024 07:52:14 -0800 (PST)
Date: Thu, 7 Nov 2024 16:52:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] x86/mm: special case super page alignment
 detection for INVALID_MFN
Message-ID: <ZyziLfZGLZJBSEjo@macbook>
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-3-roger.pau@citrix.com>
 <2d11d5c6-4e87-4520-af48-844c90462620@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d11d5c6-4e87-4520-af48-844c90462620@suse.com>

On Thu, Nov 07, 2024 at 12:06:41PM +0100, Jan Beulich wrote:
> On 06.11.2024 13:29, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/page.h
> > +++ b/xen/arch/x86/include/asm/page.h
> > @@ -202,7 +202,8 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
> >  
> >  /* Check if an address is aligned for a given slot level. */
> >  #define SLOT_IS_ALIGNED(v, m, s) \
> > -    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
> > +    IS_ALIGNED(PFN_DOWN(v) | (mfn_eq(m, INVALID_MFN) ? 0 : mfn_x(m)), \
> > +               (1UL << ((s) - PAGE_SHIFT)) - 1)
> >  #define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
> >  #define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
> 
> With this adjustment it feels yet more important for these macros to
> become local ones in x86/mm.c. This special property may not be what one
> wants in the general case. And m is now also evaluated twice (really:
> once or twice), which a "random" user of the macro may not like.
> 
> I'm further uncertain now that this is the way to go to address the
> original issue. Notably for the 1G-mapping case it may be better to go
> from the incoming flags having _PAGE_PRESENT clear. After all we can
> always create non-present "large" PTEs. E.g.

Hm, I don't think we want to do that in map_pages_to_xen() as part of
this change.  Doing so would possibly imply the freeing of
intermediate page-tables when Xen previously didn't free them.  If the
CPU didn't support 1GB mappings we would always keep the L2, even if
fully empty.  With your proposed change we would now free such L2.

I'm not saying it's a wrong change, but just didn't want to put this
extra change of behavior together with a bugfix for an existing issue.

> 
>         if ( (cpu_has_page1gb || !(flags & _PAGE_PRESENT)) &&
>              IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
>              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
> 
> Thoughts?

I was doing it based on mfn because that's how it worked previously
when 0 was passed instead of INVALID_MFN, and because I think it was
cleaner to hide the evaluation inside of IS_LnE_ALIGNED() instead of
open-coding it for every call to IS_LnE_ALIGNED().

If we want to do it based on flags it would be best if those are
passed to IS_LnE_ALIGNED(), but again, might be best to do it in a
followup patch and not part of this bugfix.  I fear it could have
unpredicted consequences.

Thanks, Roger.

