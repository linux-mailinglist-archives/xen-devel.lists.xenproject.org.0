Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50185F30C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 09:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684240.1063959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd4WV-0002vX-Kd; Thu, 22 Feb 2024 08:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684240.1063959; Thu, 22 Feb 2024 08:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd4WV-0002tO-Hb; Thu, 22 Feb 2024 08:33:43 +0000
Received: by outflank-mailman (input) for mailman id 684240;
 Thu, 22 Feb 2024 08:33:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd4WT-0002tE-PT
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 08:33:41 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140fbabf-d15d-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 09:33:39 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d1094b5568so97689831fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 00:33:39 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ka7-20020a05600c584700b004101543e843sm5273202wmb.10.2024.02.22.00.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 00:33:38 -0800 (PST)
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
X-Inumbo-ID: 140fbabf-d15d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708590818; x=1709195618; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8K4AzAt7zREk2uoZWOW/KP6G4e1UyXKQkZ20gvIn3I=;
        b=ULp4KoD/Rx+S2u95vxvPopbo87/xihSPPWwMPxOAdqxiRUkj55vuyGIO0VjjZ3KorG
         7cGCeKDuAi8jbQ8HAksd5t5FIJJ+k5lRXRvFbaW8TnZXcwROOegVTrlvgTIwWJCIaoZA
         /B1EJ5WAXXT2sRqLykUurPDayBQ7+Mc+Tunx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708590818; x=1709195618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8K4AzAt7zREk2uoZWOW/KP6G4e1UyXKQkZ20gvIn3I=;
        b=Ay7VfeHEsNXdpGn9HYsgSc3DJyO0jg0UyiQQZVUcxlP+/tncJvNRZD84wWIeiW6Ddj
         8l9k4Htf1vHA3SXboySMQI5rKd3qfHL5aGNfZsbVOcg44Y6fIrNpL1hNsYEWUgbacw9W
         D54YgVVe7k5Ns+FIV1k+xOPvY5+IuYgINQdKng4+l2Z25sPg1iZn7Hfne58/VhUwqCR5
         yLP7jOTEzLEavBbYOqvA9Sx2djQ0qFdxx4oPI3wKnjh/bkoYa7tVIiqhU+yQGxZf8IRv
         THOgJKBrDBkGwJKzVKdQk8cqZakVrlo/VTQCx0I3fNiuyOdEciopM/Mf5YB37AzfTslk
         /FrA==
X-Gm-Message-State: AOJu0Yx+2cAZ9Od+nsjGgSDbixau5v9+NV1bza3bEINFJwnfUQTG48tT
	KAA+//jvFtYHi3tlprlFP1J5IIpCdScwSklxECBomaqHSRR9C5+CKtRP0L04Bj/o/KH67K4hdbP
	U
X-Google-Smtp-Source: AGHT+IHkHxwPgrYdJRUoW/hybj9DTiquKRcIf5cOXAiHWArerCXkARgUbJ6ngE5V2a+ePQZ8ARjT3w==
X-Received: by 2002:a2e:a49a:0:b0:2d2:4315:4d8b with SMTP id h26-20020a2ea49a000000b002d243154d8bmr5646080lji.2.1708590818324;
        Thu, 22 Feb 2024 00:33:38 -0800 (PST)
Date: Thu, 22 Feb 2024 09:33:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/altcall: use an union as register type for function
 parameters
Message-ID: <ZdcG4bSMael4aunD@macbook>
References: <20240221170331.60605-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240221170331.60605-1-roger.pau@citrix.com>

On Wed, Feb 21, 2024 at 06:03:31PM +0100, Roger Pau Monne wrote:
> The current code for alternative calls uses the caller parameter types as the
> types for the register variables that serve as function parameters:
> 
> uint8_t foo;
> [...]
> alternative_call(myfunc, foo);
> 
> Would expand roughly into:
> 
> register unint8_t a1_ asm("rdi") = foo;
> register unsigned long a2_ asm("rsi");
> [...]
> asm volatile ("call *%c[addr](%%rip)"...);
> 
> However under certain circumstances clang >= 16.0.0 with -O2 can generate
> incorrect code, given the following example:
> 
> unsigned int func(uint8_t t)
> {
>     return t;
> }
> 
> static void bar(uint8_t b)
> {
>     int ret_;
>     register uint8_t di asm("rdi") = b;
>     register unsigned long si asm("rsi");
>     register unsigned long dx asm("rdx");
>     register unsigned long cx asm("rcx");
>     register unsigned long r8 asm("r8");
>     register unsigned long r9 asm("r9");
>     register unsigned long r10 asm("r10");
>     register unsigned long r11 asm("r11");
> 
>     asm volatile ( "call %c[addr]"
>                    : "+r" (di), "=r" (si), "=r" (dx),
>                      "=r" (cx), "=r" (r8), "=r" (r9),
>                      "=r" (r10), "=r" (r11), "=a" (ret_)
>                    : [addr] "i" (&(func)), "g" (func)
>                    : "memory" );
> }
> 
> void foo(unsigned int a)
> {
>     bar(a);
> }
> 
> Clang generates the following code:
> 
> func:                                   # @func
>         movl    %edi, %eax
>         retq
> foo:                                    # @foo
>         callq   func
>         retq
> 
> Note the truncation of the unsigned int parameter 'a' of foo() to uint8_t when
> passed into bar() is lost.
> 
> The above can be worked around by using an union when defining the register
> variables, so that `di` becomes:
> 
> register union {
>     uint8_t e;
>     unsigned long r;
> } di asm("rdi") = { .e = b };
> 
> Which results in following code generated for `foo()`:
> 
> foo:                                    # @foo
>         movzbl  %dil, %edi
>         callq   func
>         retq
> 
> So the truncation is not longer lost.
> 

This is missing:

Reported-by: Matthew Grooms <mgrooms@shrew.net>
Link: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=277200
Link: https://github.com/llvm/llvm-project/issues/82598

Last one is the bug report against llvm.

Thanks, Roger.

