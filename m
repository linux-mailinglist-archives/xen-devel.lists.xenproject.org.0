Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3989847B3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803005.1213392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Yw-00076y-Mv; Tue, 24 Sep 2024 14:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803005.1213392; Tue, 24 Sep 2024 14:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Yw-00073p-KM; Tue, 24 Sep 2024 14:30:46 +0000
Received: by outflank-mailman (input) for mailman id 803005;
 Tue, 24 Sep 2024 14:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZSf=QW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1st6Yv-00073j-Kn
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:30:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a5417d-7a81-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 16:30:43 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so663755466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:30:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34076sm90734766b.7.2024.09.24.07.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 07:30:42 -0700 (PDT)
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
X-Inumbo-ID: 94a5417d-7a81-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727188243; x=1727793043; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq151un+njjj3tGEmBCqTBqc9F1dcs/ZvFOGBJPsjLM=;
        b=nDtAIZLLEE3xqIRd/j9hMeSJX1zqGu/0HQPq64UmjtCwe2q9AUTM4hsfBgAZbyb71L
         +OmElBcKUAbziaSu3+PiOrWtKMjygx0Hknrari6SSCWVNr6oabOwj4vh+NAl1fMQI/gF
         5sohEz/i0N5LDhaK2n4lFQ5bp4EFDMzeoZ8iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188243; x=1727793043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq151un+njjj3tGEmBCqTBqc9F1dcs/ZvFOGBJPsjLM=;
        b=OlSwqiIJ3RxXey/gPH/Ijh7jZkuv4Tdp0EyqzW6KjqKhNLkzpScPCiCFYOhrwZ+4wQ
         dNfnjIK/1wTlDKGKCh814MFFJSDQBLCuYfpgjcMV4eQ80gJUu7+mxS8Dh6Yk4okcgjb2
         frLZekiP9hoC7BzZy8O2rTmme3B9Rts7ER8/8MY9DLIOBc0njBX8ec2t87wdYk/6YQKy
         W/ySRK0DAbi/VsZqpaQwhxfNLgGzzLdRa/JeeFIFRdD2AhqXB23jDz0aUFV+r0Tgkxti
         VFFGK/h6JNFZWL67eT4Qfzg/NEVdN4O8Kcb87BA/zfOf7syA5myRns0LkUBWiDeO3bUv
         yj9w==
X-Forwarded-Encrypted: i=1; AJvYcCVLu3xGqZjGXKPTSmhHGwcEwOp3T8629iM8RKRvGDY7TDS7L4fz+81PCeR2WFpJZP6mBwcw8HrN280=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMmBo298qolmJD3eWJDt5oi0bn8kof6jx7HrMCUbbxzF9y3lNA
	mpbStqWARt84WoWfiiaSlmwdwigP7z5nluGUb6Qq6SbVlCRi00yCSUTEmY9ylDg=
X-Google-Smtp-Source: AGHT+IHPj/zXfggjAms8HbROaBbpKJQS8l+av+fKJn/K9opNmP0645OPpUorNVHOla6GF7CmZmW49A==
X-Received: by 2002:a17:907:e6ce:b0:a90:41a7:ea8a with SMTP id a640c23a62f3a-a90d4fc9076mr1432113066b.8.1727188242876;
        Tue, 24 Sep 2024 07:30:42 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:30:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
Message-ID: <ZvLNEUzn7NVMou73@macbook.local>
References: <20240924112343.193506-1-andrew.cooper3@citrix.com>
 <86f05490-92d7-4146-a665-a4ef8732cbe8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86f05490-92d7-4146-a665-a4ef8732cbe8@suse.com>

On Tue, Sep 24, 2024 at 03:44:07PM +0200, Jan Beulich wrote:
> On 24.09.2024 13:23, Andrew Cooper wrote:
> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -1057,29 +1057,31 @@ int __init dom0_construct_pv(struct domain *d,
> >                               module_t *initrd,
> >                               const char *cmdline)
> >  {
> > +    unsigned long cr4 = read_cr4();
> > +    unsigned long mask = X86_CR4_SMAP | X86_CR4_LASS;
> >      int rc;
> >  
> >      /*
> > -     * Clear SMAP in CR4 to allow user-accesses in construct_dom0().  This
> > -     * prevents us needing to write construct_dom0() in terms of
> > +     * Clear SMAP/LASS in CR4 to allow user-accesses in construct_dom0().
> > +     * This prevents us needing to write construct_dom0() in terms of
> >       * copy_{to,from}_user().
> >       */
> > -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> > +    if ( cr4 & mask )
> >      {
> >          if ( IS_ENABLED(CONFIG_PV32) )
> > -            cr4_pv32_mask &= ~X86_CR4_SMAP;
> > +            cr4_pv32_mask &= ~mask;
> >  
> > -        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> > +        write_cr4(cr4 & ~mask);
> >      }
> >  
> >      rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
> >  
> > -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> > +    if ( cr4 & mask )
> >      {
> > -        write_cr4(read_cr4() | X86_CR4_SMAP);
> > +        write_cr4(cr4);
> >  
> >          if ( IS_ENABLED(CONFIG_PV32) )
> > -            cr4_pv32_mask |= X86_CR4_SMAP;
> > +            cr4_pv32_mask |= mask;
> 
> You may end up setting a bit here which wasn't previously set, and which
> might then fault when cr4_pv32_restore tries to OR this into %cr4. Aiui
> you must have tested this on LASS-capable hardware, for it to have worked.

Possibly also needs X86_CR4_LASS adding to the XEN_CR4_PV32_BITS
define, as otherwise it won't end up in cr4_pv32_mask in the first
place AFAICT.

Thanks, Roger.

