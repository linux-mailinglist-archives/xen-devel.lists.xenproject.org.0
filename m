Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A795960C8F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784052.1193408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwbt-0001K0-1B; Tue, 27 Aug 2024 13:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784052.1193408; Tue, 27 Aug 2024 13:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwbs-0001I2-Ur; Tue, 27 Aug 2024 13:51:48 +0000
Received: by outflank-mailman (input) for mailman id 784052;
 Tue, 27 Aug 2024 13:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYmO=P2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1siwbr-0001Hc-AC
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:51:47 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc10c35-647b-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:51:46 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-44fee8813c3so32556381cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:51:46 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db079csm56160046d6.78.2024.08.27.06.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:51:44 -0700 (PDT)
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
X-Inumbo-ID: 7fc10c35-647b-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724766705; x=1725371505; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNkVTkiYHeWx5t2DtRjUJMHLVLJFiiLeULy2l250Rbs=;
        b=Nd+y6Vu3RZZKhGWiePWa6JJyL6a6Q1LEb2zRMP28LUUQ05Fd2r2klK93ik9xQVVDCu
         NfaXCqUMMbQTc73ayVpP5Gu2Vy/jvtbFiIP4VysYadFoGxC0H6zWKsyqcBz418kjsJJo
         wNcZCxOuWOBXkO5s9Qjo1BbsqwKy5eD2V43zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766705; x=1725371505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNkVTkiYHeWx5t2DtRjUJMHLVLJFiiLeULy2l250Rbs=;
        b=F+jWKVQvoYyEGB33TGte3wH2/LlBo2rRYvm5AgvFXnTbVVxalGHPKKSSyd3eBeeS4q
         gBNdkDljuIk6KG8wXzlSIuCYWLbMXD0EKoA0bJOnRm3D4ooLsgmQdu1wNRh8bxwAzisY
         Gn6P1TgM3BHNKBswZYxmuTnQx+Fj+zhcdVChx4e8h6UpFHPTdifm37eE2JgUnKGfdhS2
         3z5OnAyCJiiugn1L1MpqC0lWRhrAl2tp6BuBd8EFP0FvDuSDEzFokHKyivlvw52aIVdL
         Phu1nQbp/FKt4o+n62su5vIk823VnBxlkRE0VsSi9JZQhnig42wjHxnXcJpetZ7aUls6
         F54Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSphoTK6a4qIByK+Ge58+UMwX9v8DgBZRzgB+/poDt9TZaAaV6hNzbcED7BdyDIM3Oac/eLXqkBgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoygZioQMlR0xBY6xNIEdhhJ2A3SzRSBgh1bopGYgekJR4Jjx6
	SWYgPr0/PYP5Vdc3xP2jPhkvoh7J6BChM9nvBI1gY96OTi5IBaI1xK0Q9aHi9Yic6VtxU16X3+l
	1
X-Google-Smtp-Source: AGHT+IFjc1FDOm46yfne36hpVK7kWWmzedxbghps7WX/UV5i6H7RqJk7zl7dgihGC/jue9cVWcXq9w==
X-Received: by 2002:a05:6214:2f0c:b0:6c3:2a41:cc14 with SMTP id 6a1803df08f44-6c32a41cc79mr38785486d6.0.1724766705193;
        Tue, 27 Aug 2024 06:51:45 -0700 (PDT)
Date: Tue, 27 Aug 2024 15:51:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
Message-ID: <Zs3Z7quUyCi4OuYb@macbook.local>
References: <20240827123949.24400-1-roger.pau@citrix.com>
 <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
 <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>
 <4822571d-efe9-4cab-a016-70ee5f21c256@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4822571d-efe9-4cab-a016-70ee5f21c256@citrix.com>

On Tue, Aug 27, 2024 at 02:07:07PM +0100, Andrew Cooper wrote:
> On 27/08/2024 2:04 pm, Jan Beulich wrote:
> > On 27.08.2024 14:59, Andrew Cooper wrote:
> >> On 27/08/2024 1:39 pm, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/dom0_build.c
> >>> +++ b/xen/arch/x86/dom0_build.c
> >>> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
> >>>      if ( is_hvm_domain(d) )
> >>>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
> >>>      else if ( is_pv_domain(d) )
> >>> +    {
> >>> +        /*
> >>> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
> >>> +         * construct_dom0().  This saves a large number of corner cases
> >>> +         * interactions with copy_from_user().
> >>> +         */
> >>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> >>> +        {
> >>> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
> >>> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
> >>> +        }
> >>>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
> >>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> >>> +        {
> >>> +            write_cr4(read_cr4() | X86_CR4_SMAP);
> >>> +            cr4_pv32_mask |= X86_CR4_SMAP;
> >>> +        }
> >>> +    }
> >> I hate to drag this on further still, but can this logic be move it into
> >> dom0_construct_pv() itself, rather than here?
> > Just to mention it: I'm fine with this in principle, as long as this won't
> > mean a pile of new goto-s in dom0_construct_pv(). If a new wrapper was
> > introduced (with the present function becoming static), I'd be okay.
> 
> I'd be happy with that too.
> 
> In fact, static helpers are probably best, seeing as we'll eventually
> need real #ifdefary around the cr4_pv32_mask accesses.

Do you mean a static helper in dom0_build.c for enabling/disabling
SMAP?

Because my plan would be to also add a wrapper for dom0_construct_pv()
so that I don't need to adjust the returns path in dom0_construct_pv()
itself.

Thanks, Roger.

