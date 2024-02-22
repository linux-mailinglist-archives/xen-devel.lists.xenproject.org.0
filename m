Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FB85F610
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 11:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684323.1064094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6el-0003N5-7K; Thu, 22 Feb 2024 10:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684323.1064094; Thu, 22 Feb 2024 10:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6el-0003Jt-4G; Thu, 22 Feb 2024 10:50:23 +0000
Received: by outflank-mailman (input) for mailman id 684323;
 Thu, 22 Feb 2024 10:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd6ej-0003Jm-Kq
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 10:50:21 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b9c4f1b-d170-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 11:50:19 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512dc7b7fc2so628107e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 02:50:19 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 c11-20020ac86e8b000000b0042e033e5211sm4274506qtv.7.2024.02.22.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:50:18 -0800 (PST)
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
X-Inumbo-ID: 2b9c4f1b-d170-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708599019; x=1709203819; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsRaHjr0LZ2aX1MqEL6SY1faoWh6haTUtLtlbCJdG/Q=;
        b=pukRTSeGbwowcJOV5ToMlBBFRtoGw3gl0lQTEJZzf8qbmDMLA7xWmwuPdtagaRvR9y
         S9PKqZsgFL4rp207GHQbgin+oucb55rhHsWCvcSQQTjzDR+b6TOeCyCtBIoS7dgNie0P
         BgsyPJBrjMvBbChz8lE8XyvsuZVMgLbaG/9Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599019; x=1709203819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsRaHjr0LZ2aX1MqEL6SY1faoWh6haTUtLtlbCJdG/Q=;
        b=hvkFhPt8jqf3bgSC8fSUswpsIkxg044YRsrhEhGgh47mRI6ZH6YWlQAL8kJUHPbMzZ
         7YL9beOHXNPuPb3JFOfSU3Rhf4/jIsNAqy2cv4qWmWMEX745TKQ/sutI4TXeP3u/c7ml
         qAA295gKIIuUNvc4gtkLjM6oVm/bFxdlv7ZvSnzv7xauODugqHYautMpU/Vjf1xT4vQj
         1eelvL62L6QW+P2JW9qquoPDscnKsROHQJZIL6SIg7hYfQUrFw63SQq6RDDRfMpPh2mZ
         Nt5xNXSp2GAMHTu56UaQwklA9bOw1NQTTQpHjibMzLYzV8MYzk9iRMvlvgFEalWMtYsB
         0RHg==
X-Forwarded-Encrypted: i=1; AJvYcCXEla2aX/o/AeakLcvTKefJECchANyOFFGZnpK9atNvraaOOzu5L537kZZS4QQIzWA4aA3biSLsrLiMf1x8XdXWHBFJvpowwU00AdtdmBw=
X-Gm-Message-State: AOJu0YxPX4mbPXUzkBZiYubUvnRy3c+LDSkm/uid8lDPl1bZFBwi2b0d
	5D+Hu2w7dTH8d/JtRipZyCu5JvHHZExXO5rTP4Xf6lLaQhE9AmVkZWSxP3CP5Ew=
X-Google-Smtp-Source: AGHT+IGSQeg3RLx6Nmp4v04FR3QUyZ87agz8WzomJsB69kiHK/wFWTB62U2NlsQWxc65PztlsHNO/A==
X-Received: by 2002:ac2:4e08:0:b0:512:b935:c542 with SMTP id e8-20020ac24e08000000b00512b935c542mr8571866lfr.59.1708599018781;
        Thu, 22 Feb 2024 02:50:18 -0800 (PST)
Date: Thu, 22 Feb 2024 11:50:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: use an union as register type for function
 parameters
Message-ID: <Zdcm6CrINxGeKU1M@macbook>
References: <20240221170331.60605-1-roger.pau@citrix.com>
 <c236f02c-241b-4f1d-b037-1d66a8f87d5a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c236f02c-241b-4f1d-b037-1d66a8f87d5a@suse.com>

On Thu, Feb 22, 2024 at 11:32:14AM +0100, Jan Beulich wrote:
> On 21.02.2024 18:03, Roger Pau Monne wrote:
> > The current code for alternative calls uses the caller parameter types as the
> > types for the register variables that serve as function parameters:
> > 
> > uint8_t foo;
> > [...]
> > alternative_call(myfunc, foo);
> > 
> > Would expand roughly into:
> > 
> > register unint8_t a1_ asm("rdi") = foo;
> > register unsigned long a2_ asm("rsi");
> > [...]
> > asm volatile ("call *%c[addr](%%rip)"...);
> > 
> > However under certain circumstances clang >= 16.0.0 with -O2 can generate
> > incorrect code,
> 
> Considering that the related (wider) ABI issue looks to also be present on
> Clang5, is the more specific issue here really limited to >= 16?

No, this is wrong.  I did check clang 15.0.0 and I messed up the
output, all clang versions (on godbolt) seem to be affected.

> > given the following example:
> > 
> > unsigned int func(uint8_t t)
> > {
> >     return t;
> > }
> > 
> > static void bar(uint8_t b)
> > {
> >     int ret_;
> >     register uint8_t di asm("rdi") = b;
> >     register unsigned long si asm("rsi");
> >     register unsigned long dx asm("rdx");
> >     register unsigned long cx asm("rcx");
> >     register unsigned long r8 asm("r8");
> >     register unsigned long r9 asm("r9");
> >     register unsigned long r10 asm("r10");
> >     register unsigned long r11 asm("r11");
> > 
> >     asm volatile ( "call %c[addr]"
> >                    : "+r" (di), "=r" (si), "=r" (dx),
> >                      "=r" (cx), "=r" (r8), "=r" (r9),
> >                      "=r" (r10), "=r" (r11), "=a" (ret_)
> >                    : [addr] "i" (&(func)), "g" (func)
> >                    : "memory" );
> > }
> > 
> > void foo(unsigned int a)
> > {
> >     bar(a);
> > }
> > 
> > Clang generates the following code:
> > 
> > func:                                   # @func
> >         movl    %edi, %eax
> >         retq
> > foo:                                    # @foo
> >         callq   func
> >         retq
> > 
> > Note the truncation of the unsigned int parameter 'a' of foo() to uint8_t when
> > passed into bar() is lost.
> > 
> > The above can be worked around by using an union when defining the register
> > variables, so that `di` becomes:
> > 
> > register union {
> >     uint8_t e;
> >     unsigned long r;
> > } di asm("rdi") = { .e = b };
> > 
> > Which results in following code generated for `foo()`:
> > 
> > foo:                                    # @foo
> >         movzbl  %dil, %edi
> >         callq   func
> >         retq
> > 
> > So the truncation is not longer lost.
> 
> But how do you explain this behavior? I see absolutely no reason why filling
> the one union field should lead to zero-extension. If I'm not mistaken the
> language allows the rest of the union to retain undefined contents. So to me
> this looks like you're converting something that failed to build due to a
> (presumed) bug in Clang to something that any compiler would be permitted to
> translate to other than what we want.

Oh, right, I was expecting the compiler to zero extend it, confabulating
how unmentioned fields are initialized in structs.

However, if as mentioned in the psABI thread, the callee is required
to do any zero extension as necessary, using the union shouldn't cause
issues for compilers that implement the ABI properly.

IOW: I don't think the proposed workaround would cause issues for gcc.

Thanks, Roger.

