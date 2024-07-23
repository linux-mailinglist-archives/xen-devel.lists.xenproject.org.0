Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7EE93A42D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 18:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763368.1173642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWI55-0001nd-Ns; Tue, 23 Jul 2024 16:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763368.1173642; Tue, 23 Jul 2024 16:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWI55-0001ky-LB; Tue, 23 Jul 2024 16:09:39 +0000
Received: by outflank-mailman (input) for mailman id 763368;
 Tue, 23 Jul 2024 16:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQdi=OX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWI54-0001ks-Ls
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 16:09:38 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3dee168-490d-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 18:09:35 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-79ef7ecc7d4so324658685a.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 09:09:35 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19907b16bsm490919385a.123.2024.07.23.09.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 09:09:33 -0700 (PDT)
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
X-Inumbo-ID: f3dee168-490d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721750974; x=1722355774; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q89dJC/DGWM1BJU0rAv3UH3szBqxTxSi37YwMuGmrsU=;
        b=SS89NGfPjw28JC4ci72Hco/Jk2CIbzxDmTapF6NvN410xTDo0FRsohBvu2w6iyVLyN
         g8Kzh9guNYdOMqyXvi4h5Qxgw5C14xv53g+Dmf28av1Nr40GFTHgeIOFEyW1C3Ykl7bn
         hqsAbNk5zO6/pvVhUjp6e2c1AsseoYsQlxKAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721750974; x=1722355774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q89dJC/DGWM1BJU0rAv3UH3szBqxTxSi37YwMuGmrsU=;
        b=p99mIeG+JmzwNzxFNEqfbeqCrV6tR1S5bB2I7BUSA+r+ZfI2moWY6GUdaycQYSgheX
         GIsz5M4hH184KN0cKomvGC7/Jlr5keNpEgJortdcbYhd0pVk5kCGVgVlPCPmtSifJtzK
         nabXy0yv8nQ1hVvnYBGNnQLMd6Q40EXcMU7TTIAH7IrSt8OcUE057eCyDYHsXPCcX1nn
         2+b2m1hZBufKeS0D+5gROit5gLmGwnsnfEUc/cRyeEEZukyRXOcY+EbRzOrjp7+OzJCO
         W9fgsOlNtY66yF6MJnu7h/h4znaofDwhVCVdUiANTDT+mBd+dpj8mngNu7AgXlRkomTx
         tqSQ==
X-Gm-Message-State: AOJu0YxlWjHyrTzfYrwbpTs4aubrjwwGgFLb+xMFhCZBBiGjXhlAmAtO
	JqutiBiT4f6sKBN9SSbLUCbEdIk7I488gCmpTgMsNNyDqhTvoGCViU4XC7P0HoQ=
X-Google-Smtp-Source: AGHT+IEwNh5dpsQpF5PXW2DA6Q8rl3CINenOqdAKd/nGPjuINZBGvchy9kKqZcLSvScjO1BZkXTXcw==
X-Received: by 2002:a05:620a:2683:b0:792:f429:9e9 with SMTP id af79cd13be357-7a1ca0ef0ccmr34260385a.22.1721750973942;
        Tue, 23 Jul 2024 09:09:33 -0700 (PDT)
Date: Tue, 23 Jul 2024 18:09:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
Message-ID: <Zp_VuwxqH3Mii8_W@macbook>
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D2X13ED477J8.25JRFH9VEW33O@cloud.com>

On Tue, Jul 23, 2024 at 04:37:12PM +0100, Alejandro Vallejo wrote:
> On Tue Jul 23, 2024 at 10:31 AM BST, Roger Pau Monne wrote:
> > Yet another clang code generation issue when using altcalls.
> >
> > The issue this time is with using loop constructs around alternative_{,v}call
> > instances using parameter types smaller than the register size.
> >
> > Given the following example code:
> >
> > static void bar(bool b)
> > {
> >     unsigned int i;
> >
> >     for ( i = 0; i < 10; i++ )
> >     {
> >         int ret_;
> >         register union {
> >             bool e;
> >             unsigned long r;
> >         } di asm("rdi") = { .e = b };
> >         register unsigned long si asm("rsi");
> >         register unsigned long dx asm("rdx");
> >         register unsigned long cx asm("rcx");
> >         register unsigned long r8 asm("r8");
> >         register unsigned long r9 asm("r9");
> >         register unsigned long r10 asm("r10");
> >         register unsigned long r11 asm("r11");
> >
> >         asm volatile ( "call %c[addr]"
> >                        : "+r" (di), "=r" (si), "=r" (dx),
> >                          "=r" (cx), "=r" (r8), "=r" (r9),
> >                          "=r" (r10), "=r" (r11), "=a" (ret_)
> >                        : [addr] "i" (&(func)), "g" (func)
> >                        : "memory" );
> >     }
> > }
> >
> > See: https://godbolt.org/z/qvxMGd84q
> >
> > Clang will generate machine code that only resets the low 8 bits of %rdi
> > between loop calls, leaving the rest of the register possibly containing
> > garbage from the use of %rdi inside the called function.  Note also that clang
> > doesn't truncate the input parameters at the callee, thus breaking the psABI.
> >
> > Fix this by turning the `e` element in the anonymous union into an array that
> > consumes the same space as an unsigned long, as this forces clang to reset the
> > whole %rdi register instead of just the low 8 bits.
> >
> > Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Adding Oleksii as to whether this could be considered for 4.19: it's strictly
> > limited to clang builds, plus will need to be backported anyway.
> > ---
> >  xen/arch/x86/include/asm/alternative.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
> > index 0d3697f1de49..e63b45927643 100644
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -185,10 +185,10 @@ extern void alternative_branches(void);
> >   */
> >  #define ALT_CALL_ARG(arg, n)                                            \
> >      register union {                                                    \
> > -        typeof(arg) e;                                                  \
> > +        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> >          unsigned long r;                                                \
> >      } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> > -        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
> > +        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> >      }
> >  #else
> >  #define ALT_CALL_ARG(arg, n) \
> 
> Don't we want BUILD_BUG_ON(sizeof(long) % sizeof(arg) == 0) instead?

I think you meant BUILD_BUG_ON(sizeof(long) % sizeof(arg) != 0)?

> Otherwise
> odd sizes will cause the wrong union size to prevail, and while I can't see
> today how those might come to happen there's Murphy's law.

The overall union size would still be fine, because it has the
unsigned long element, it's just that the array won't cover all the
space assigned to the long member?

IOW if sizeof(arg) == 7, then we would define an array with only 1
element, which won't make the size of the union change, but won't
cover the same space that's used by the long member.

However it's not possible for sizeof(arg) > 8 due to the existing
BUILD_BUG_ON(), so the union can never be bigger than a long.

Thanks, Roger.

