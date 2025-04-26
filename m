Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF79EA9DCEC
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 21:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969389.1358509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8l95-0001jb-SR; Sat, 26 Apr 2025 19:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969389.1358509; Sat, 26 Apr 2025 19:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8l95-0001h6-Pn; Sat, 26 Apr 2025 19:25:03 +0000
Received: by outflank-mailman (input) for mailman id 969389;
 Sat, 26 Apr 2025 19:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGdt=XM=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u8l94-0001h0-C6
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 19:25:02 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 234806ef-22d4-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 21:24:57 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so6253569a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 26 Apr 2025 12:24:57 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7013ff81dsm3179676a12.24.2025.04.26.12.24.54
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 12:24:54 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so650351366b.1
 for <xen-devel@lists.xenproject.org>; Sat, 26 Apr 2025 12:24:54 -0700 (PDT)
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
X-Inumbo-ID: 234806ef-22d4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745695496; x=1746300296; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SAmZJnkixm3evgqXXEJgAXtv6B9uAHmojpNR8VdWt0M=;
        b=guXSM9aH6XdjH9VPD5I4t4YcCHK+15lR/MOTdaG8Lco0DECr9IIAIdL76tsHqewqQs
         MBJCMAcLbYFX9HerjKkBZm/nU2wDFk59hQnDIojKfRg3jBfFH3FdOX/uiiG2hbqX6lPf
         bc5MYNqIaApyel9pS50MX0bWnpPlILGh/Uxhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745695496; x=1746300296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAmZJnkixm3evgqXXEJgAXtv6B9uAHmojpNR8VdWt0M=;
        b=JAMuloTqI+LJPa1KHI454g6qrng7pgznZQ61EcasQ8zQxDaAIVHV/7sOOAM01w8uwl
         xDMueYWNeY7Uxu6RUw/B/U+AJnLjpe6X0x2l1FRAYwJjPcD99W84rfTO964GSC9L1pti
         cncqlWFC74k4+MDtcquBhg6Pdxm8Ay6ytc1ZKS76sPo5l8qR3Uo348tyOy6eoK932SeL
         N0eTsBbpB0CZ2rqjZw0OuX7vmJkaYXztPgXw42S2rZVYaAcRWk+G6ELVrAL5poJPvrRr
         KnYDmCDRZ7wK5lOCwA/dNrhWm9bzj8GiW7RAhaSSeF3ynmcpIJWG1TWQeuIvaJg/Kfir
         3cCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxywhJ1sj7wdvy0GWNo3JcgsSAEks1sAYdU4C26bgHV+iZix/0BvYcIhk660DCiKj5236NUgLsmBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0urkr5mhEXkBzA/WFGHU56ijVeoqNSm2cKQf6WBGslcV7DO/u
	+N805JvWQTG/zs5WLYwCUwlT4jq61J740Bqhu16GjFHjSBg0e4/dxN6Hn1EfOvbFlRL30ySxQ9N
	sb7g=
X-Gm-Gg: ASbGncuNLL8rud0/oL1L1oSGAqgTpx/42okFVlj3eQHVqNwdUgASU+PmCXQhOvSVZ22
	A8fFovJw5tyUKpxQcvCyi1CeRHiZ/Irlh3m2NSZT4j0dXy7ZCK0bVA/CGwjVmPPT7zxRwuVvZLi
	P3XbGtr7W9kLg5lnOnH5qpkFmygcJBielBuzfWy12F+/5vH3UAzBtrDMtLr0YzI6OA2RGNohwIS
	rpLCoMtkQijCWu/AJ+wgxY2hSXV59awY4qOS59FjCrJVSeBXMgj963u4yAgusRwNeXIEhNHDz9J
	qOS6zdmQAveST+XKO87gCnYPVR/uvGeCcsJ/5ywvpGBcC2c5X279HXnEJvW4tUwUEtJLOPG9D4S
	Z02ODganV2p5awIg=
X-Google-Smtp-Source: AGHT+IFOFPmelcPrfwpNsqoB9v+sKlD49/af72bM2dtGumQ7ZrmcO5B/pczB/L82m1ESdFI27Y4h3g==
X-Received: by 2002:a05:6402:5112:b0:5e6:14ac:30f with SMTP id 4fb4d7f45d1cf-5f739596703mr2868784a12.2.1745695496289;
        Sat, 26 Apr 2025 12:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgM+1jPyD21T/NQFOStqfgIvg/24ahqncSVInpI/hqrP4r4sE+7EQ/j4foaiPJBbtHavJkHsY5Rz0=@lists.xenproject.org
X-Received: by 2002:a17:907:7e95:b0:aca:a1d8:981f with SMTP id
 a640c23a62f3a-ace848c02e9mr293296866b.12.1745695493835; Sat, 26 Apr 2025
 12:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
In-Reply-To: <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 12:24:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
X-Gm-Features: ATxdqUEWPVpzwOGKhxkHhMGljegHuR82-vkbdZlf8siCRhETy-JGPbqLh9g70WQ
Message-ID: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 11:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Right. With the current set of features, CMOV is almost the
> same as 686. My reasoning was that support for CMOV has a
> very clear definition, with the instruction either being
> available or not.

Yeah, I don't think there's any reason to make CMOV a reason to drop support.

It has questionable performance impact - I doubt anybody can measure
it - and the "maintenance burden" is basically a single compiler flag.

(And yes, one use in a x86 header file that is pretty questionable
too: I think the reason for the cmov is actually i486-only behavior
and we could probably unify the 32-bit and 64-bit implementation)

Let's not drop Pentium support due to something as insignificant as that.

Particularly as the only half-way "modern" use of the Pentium core is
actually the embedded cores (ie old atoms and clones).

We have good reasons to drop i486 (and the "fake Pentium" cores that
weren't). We _don't_ have good reason to drop Pentium support, I
think.

>  An easy answer here would be
> to not have X86_PAE depend on anything, but instead make it
> force X86_MINIMUM_CPU_FAMILY=6.

Make it so.

          Linus

