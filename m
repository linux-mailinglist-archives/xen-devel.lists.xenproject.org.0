Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5702598825F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 12:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806211.1217558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su87l-0007f8-Dc; Fri, 27 Sep 2024 10:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806211.1217558; Fri, 27 Sep 2024 10:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su87l-0007bi-AN; Fri, 27 Sep 2024 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 806211;
 Fri, 27 Sep 2024 10:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYFD=QZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1su87j-0007bc-BY
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 10:22:55 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7482ffcd-7cba-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 12:22:54 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f74e468aa8so23109751fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 03:22:53 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57dec11bsm22327275e9.23.2024.09.27.03.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 03:22:52 -0700 (PDT)
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
X-Inumbo-ID: 7482ffcd-7cba-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727432573; x=1728037373; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jvvj1kRGC7Zazd7SEenAz8gtbbzLtIxIf8e9rNpShjs=;
        b=IfhbgJFue+faSCPuc80i24U+ttahm8KtXRs01r1L8HJAMdnFY3UbEwTmyGewdT3iz6
         /+2ZHqbLPrb14RVkg5HuNWVelCboNYQ+HQJ0HkVqthfQXh0gJIdyvMBIN8Z0jGcjHELO
         CArgowkTR+RB6mAlSDXmTKhgaJdaYo2ef0SAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727432573; x=1728037373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvvj1kRGC7Zazd7SEenAz8gtbbzLtIxIf8e9rNpShjs=;
        b=e8E304Q1QGXOegSZZBEe/dB4MAfwaWSsI9aVDYp11DHl6PfzVuIJ1kYQEWSvH3yMaR
         dxLGd7VO8K0riYP3NFAVIwsTe9884YJpDvkZrmopr4ujysoChd0ScJMTJ8cY90CbEpb2
         ROsnIpy1dA+on1mslEpip/7SHm3wXqq86HU6rhZVfxqY1x3Aps+CKP0NwqJGreuz4C45
         jFUSnG7IUx8CCxeMgt/5FN2zqR+hBkKmlf7eMmYmST7AkwF2HXbmFluurLrMeFHhRIY/
         ys1/e61zgy964DfgzoilrwRd7owI4oqXAxdBUZN+8VB1BnM5171LBDqWsRdVqx3g2rc4
         OjdA==
X-Forwarded-Encrypted: i=1; AJvYcCWdL9sjzVOdOqrrXHhjlhMmTb301oL756pPNyiEIfvcayBpVZKmkablc6qvU41D1SuQiDd8Fn5PyB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2p0Y+O6ek4LkdRG4aC22IuSGMDxi5ANmCke/Dvct5GtzAkBq1
	NKmC4ePdQSiUgcBBIjRVK8vnX8y4aEPEgjEMHUpW4wzbKCQCQB1cx66PdXXoBHQ=
X-Google-Smtp-Source: AGHT+IE7gMX4ARspWVquYFCBKAewMhbSdu9dURHUiUv7psgfKn8LfxwqeqWTHTHnSpqviLGYeQcm6w==
X-Received: by 2002:a2e:f12:0:b0:2f7:51e3:fe2f with SMTP id 38308e7fff4ca-2f9d3e61683mr13338441fa.13.1727432572704;
        Fri, 27 Sep 2024 03:22:52 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:22:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 22/22] x86/mm: zero stack on stack switch or reset
Message-ID: <ZvaCTjjVMF9MjxxR@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-23-roger.pau@citrix.com>
 <e442389f-a1f7-4719-9486-ebbf51225a89@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e442389f-a1f7-4719-9486-ebbf51225a89@suse.com>

On Tue, Aug 13, 2024 at 03:16:42PM +0200, Jan Beulich wrote:
> On 26.07.2024 17:22, Roger Pau Monne wrote:
> > With the stack mapped on a per-CPU basis there's no risk of other CPUs being
> > able to read the stack contents, but vCPUs running on the current pCPU could
> > read stack rubble from operations of previous vCPUs.
> > 
> > The #DF stack is not zeroed because handling of #DF results in a panic.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/include/asm/current.h | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
> > index 75b9a341f814..02b4118b03ef 100644
> > --- a/xen/arch/x86/include/asm/current.h
> > +++ b/xen/arch/x86/include/asm/current.h
> > @@ -177,6 +177,14 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
> >  # define SHADOW_STACK_WORK ""
> >  #endif
> >  
> > +#define ZERO_STACK                                              \
> > +    "test %[stk_size], %[stk_size];"                            \
> > +    "jz .L_skip_zeroing.%=;"                                    \
> > +    "std;"                                                      \
> > +    "rep stosb;"                                                \
> > +    "cld;"                                                      \
> 
> Is ERMS actually helping with backwards copies? I didn't think so, and hence
> it may be that REP STOSQ might be more efficient here?

Possibly, Intel optimization guide says:

"However, setting the DF to force REP MOVSB to copy bytes from high
towards low addresses will experience significant performance
degradation."

I will see what I can do.

Thanks, Roger.

