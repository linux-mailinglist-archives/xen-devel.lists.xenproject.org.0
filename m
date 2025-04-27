Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E7A9E461
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 21:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969917.1358769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u97VI-0004xu-VM; Sun, 27 Apr 2025 19:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969917.1358769; Sun, 27 Apr 2025 19:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u97VI-0004vS-Qm; Sun, 27 Apr 2025 19:17:28 +0000
Received: by outflank-mailman (input) for mailman id 969917;
 Sun, 27 Apr 2025 19:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsIV=XN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u97VH-0004vL-VU
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 19:17:27 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40c9a494-239c-11f0-9eb4-5ba50f476ded;
 Sun, 27 Apr 2025 21:17:25 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso2620810f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 12:17:25 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbed98sm8856912f8f.48.2025.04.27.12.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 12:17:24 -0700 (PDT)
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
X-Inumbo-ID: 40c9a494-239c-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745781445; x=1746386245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fgo1HhhwzN6JMUrp7rwymnKFHp8snUhIVeQypKZNvBA=;
        b=m24n4BVAn9CFwNDAAZFYuLtjwnilnRMGXCNRr6CA2Pkr3pyloTs6Ak4K6JYEcmBNeG
         ghRL3EK6Gv5bmFvhjqKGFcH7Y21dcABgyljFBpElh/dOEHgJDTTJ0vr0+SeubMXJhPEA
         mR0lnB4rvkKh/k7wDC1RxtpTSvXydEL9T9LfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781445; x=1746386245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgo1HhhwzN6JMUrp7rwymnKFHp8snUhIVeQypKZNvBA=;
        b=vOu1pSatCrPFNE2aMorEiRh676qTW9XXC8iXn3UOauuCjPIB/FJY+zCVj3mhTgLDhX
         pZuZHVPpPcGctO2GSIB9+qL27HW9R/9RM4VoSz+796pBd9ONAeVrQ2+eUKPGVSthCt89
         Basdih78GOlutplCCgmENxJ0xj7bbOW91oHZ5jsiUqSwspcMMbovPzfr6u5O5I1/tbz5
         qCc7rR+VVXtZebmZf7tFh7NFVE4lPqAn6LY0omw8WbZu1Mz+LBMksxXj4UU9q09xZLub
         S2TzR2LM4yfum35PE75HnUS70jxmMB77NHdoqRJ0Qa0m554pGyl2bFl81AVhOSquD6TW
         wVgw==
X-Forwarded-Encrypted: i=1; AJvYcCWgEnmCRuU9U18X92ZuleBGz3jwfS3AeojSismIP8/DLTQ5QkQcG/MlmsKjt3GAMlvyh1J7GGYDtoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIA3+q2i6nUsRECRjP/8PftqyimY4bU+QholM4XRcYwR58fyVL
	7S5Vtwo9mwykYbNKAHF0hIvUjBpNInH3TKVAYiJMTsWmtHTY/quvvu7JqGVI5cA=
X-Gm-Gg: ASbGnctuIhnCJcHJMg/LthbiAkoyKzQRKPfGxXO8s+Y1NU4tsjuyWMo9313tjubwEzm
	Gqoh60frtV3EbLnQr2i8kjp/6XDmHKTNzl2gAzEihbrnIZl0Cp93FBsXYw6nDcR0m6jQoDzopOj
	2b1hsuPlimhgWHZw4Cy4UGg5Jrb8u0fVX/UJZ5NtvohUCxl651nyu6aiFmuQ11mcaJlYU/VOMwc
	lwSdYkFd0vJDcyey4lYUdZNUBq3s8u7t3MHLoCljhlJn/5M9C+dMjvKc2pCHRLvcARSTIkN+qak
	KC/HY7A0xLF9qk1js2ja0xj4xi3XWu6nHMOruEeoCnRa8eOySSB9UboyQ1OpdAlJKzwUH6Gvpua
	2dq4m9g==
X-Google-Smtp-Source: AGHT+IEhY5ybFGwjwKL2hzuwU29xJrgD8a5nx3iWjWsIG0Ko+irFEcz15VvGRESsIA9aEaOvT884qw==
X-Received: by 2002:a05:6000:186c:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a06d6dd50fmr10870062f8f.24.1745781445304;
        Sun, 27 Apr 2025 12:17:25 -0700 (PDT)
Message-ID: <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
Date: Sun, 27 Apr 2025 20:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2025 8:55 pm, Linus Torvalds wrote:
> So I think that manual cmov pattern for x86-32 should be replaced with
>
>         bool zero;
>
>         asm("bsfl %[in],%[out]"
>             CC_SET(z)
>             : CC_OUT(z) (zero),
>               [out]"=r" (r)
>             : [in] "rm" (x));
>
>         return zero ? 0 : r+1;
>
> instead (that's ffs(), and fls() would need the same thing except with
> bsrl insteadm, of course).
>
> I bet that would actually improve code generation.

It is possible to do better still.

ffs/fls are commonly found inside loops where x is the loop condition
too.  Therefore, using statically_true() to provide a form without the
zero compatibility turns out to be a win.

> And I also bet it doesn't actually matter, of course.

Something that neither Linux nor Xen had, which makes a reasonable
difference, is a for_each_set_bit() optimised over a scalar value.  The
existing APIs make it all too easy to spill the loop condition to memory.

~Andrew

