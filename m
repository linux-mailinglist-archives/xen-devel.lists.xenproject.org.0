Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B14AB47EA
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 01:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982246.1368792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEccj-0007BY-DS; Mon, 12 May 2025 23:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982246.1368792; Mon, 12 May 2025 23:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEccj-00078c-AD; Mon, 12 May 2025 23:31:53 +0000
Received: by outflank-mailman (input) for mailman id 982246;
 Mon, 12 May 2025 23:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEcci-00078W-1y
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 23:31:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46c116e8-2f89-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 01:31:49 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a0b933f214so2199518f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 16:31:49 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddd2dsm14027409f8f.9.2025.05.12.16.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 16:31:47 -0700 (PDT)
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
X-Inumbo-ID: 46c116e8-2f89-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747092709; x=1747697509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+btDOojkAlbFtzcpa3KzqDOzCKQ2qfLl/63heWYuPdE=;
        b=R5s2sZXX0M465t3I31Uzd9zza8YtE938eSA3XIv815E/8is3Dg4CS6dOvWZDVkYhEr
         irtVa8oyzUPizDEcTWkLPU/k96WkyjWoKP+bbFqyRef9bPKPmtOJ90RurTjA5GTHAXrM
         vjYDSCHqrfCBRdHS6wtWxqykiGSyhkPV0TCf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747092709; x=1747697509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+btDOojkAlbFtzcpa3KzqDOzCKQ2qfLl/63heWYuPdE=;
        b=QKUlrDZ1RzZgrUlU5dWgRnbk+EJtOA8DRlxSRM19ktEku+6Ya5NcvCTzMGbtwyTLsq
         XN+1MC6bZBT8kiT9FCa0GbgwV0kE6bJztWy/E8h2JtaIWTvY3RugyMX/atRlg5tuKsXi
         j1XLz7vmmZLwYKJLDT0CKjTfQB1i9VgjmFjtDIA0D8MeQkX9a1qTYMF8RZ6hfSs9x51f
         eI1mXtbQUH7ZCwYryM2wO+cbbXsdAtwd3RKfobDDf+m4RSOQVzjw+PrsuHbf04rOgrd+
         QklXzpNKN1iH2d4/FTfNVhUBCOxz7b4ZJSkogR67eAx4SO3M6xaSQjdERf+0JcUDJYcR
         6jQg==
X-Gm-Message-State: AOJu0Yyowk7c/BOQLIdNg0LxUz9MuzzwTW0UXKkqGqUhk4UsmOnl6rh8
	N4ZNPG/vofQtWNSuf+QevXnegJOHo9rGJVPLcSUCy0sE/V2VlFfaygNylwKKYHg=
X-Gm-Gg: ASbGncuSEsjPC2CxGigr4yfrOKiapMOilBBHR3wWrkrK2fhaHwllp0CzhKkE0jn9UiV
	luXaXbFlNb6KvARhYd9nwXmhiEWNhkwNGwgQBOi2/5nrN9Z1cxj/hiRHdJ9QKREazYMdONnvVkN
	g/Bfq7y0sMnUs4VEAZzC9dp0OAZFSKvMWNzxQwRdf2/iju0WTRjC794ssmNMssrl7txTM0o/JWA
	CU0EIqS+biGAzuXa88OA+mAmN+hKo0tY/HKiMWo0FdYenEhdf6ykuU8VCLRV7RDwPOLMniq/Lmb
	BYy82/xCBD8Hw00ail3gVoTAr5CPhWZyreh7FVU4fYnZH+G/pyOuQaBSg/E6crTe/yd5RVqdFIH
	MSEGwt8NN/XddLSqU
X-Google-Smtp-Source: AGHT+IEvE1q9G3IJPP49pmVWuZgYrLbp37azE5xeqKZ8DTYLKd8N2w6fKE2ZbVu4DD6h8MsSp5+zdg==
X-Received: by 2002:a05:6000:186e:b0:39d:724f:a8f1 with SMTP id ffacd0b85a97d-3a1f64279e0mr12271078f8f.10.1747092708726;
        Mon, 12 May 2025 16:31:48 -0700 (PDT)
Message-ID: <1b6a07cf-497a-4d35-8836-5011537f1110@citrix.com>
Date: Tue, 13 May 2025 00:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __auto_type
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Elliott Mitchell <ehem+xen@m5p.com>, Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
 <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
 <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
 <35826c2a-4266-49d2-b1b8-1248aac227b5@suse.com>
 <aCI9MZRN1A753Nw9@mattapan.m5p.com>
 <b7e112db-6e41-401d-9486-eb561c4786b7@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b7e112db-6e41-401d-9486-eb561c4786b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2025 12:04 am, Demi Marie Obenour wrote:
> On 5/12/25 2:25 PM, Elliott Mitchell wrote:
>> On Mon, May 12, 2025 at 03:00:18PM +0200, Jan Beulich wrote:
>>> On 12.05.2025 14:09, Andrew Cooper wrote:
>>>> Now for the (new) controversial part.  Since sending this, Linux has
>>>> decided to just #define auto __auto_type for C < 23, in order to start
>>>> writing C23 compatible code from now.  It's more succinct, and has
>>>> better longevity.
>>>>
>>>> We might want to consider the same, although it will introduce a new
>>>> example of defining a keyword, which we'd have to call out in the
>>>> MISRA/Eclair config.
>>> I'm not outright opposed, as I don't think we use "auto" with its
>>> original semantics, but it feels somewhat odd.
>> Problem is "auto" already has a defined meaning in C.Having this will
>> subtly break contributions from authors who weren't familiar with
>> everything in Xen's headers.  For anyone who does anything with projects
>> besides Xen this will encourage bad habits.
>>
>> I believe many projects have a rule of *never* #define C keywords.  I'm
>> surprised such made it into the Linux kernel.  I expect it will be ripped
>> out in the near future.
>>
>> MISRA *doesn't* absolutely forbid this?
> I'm no expert on the C standard, but my understanding is that "auto" was
> redundant starting in C89, so it is almost entirely unused.  C++11 and later
> *do* heavily use "auto", and they use it for roughly the same purpose as C23
> does, so I suspect that contributors are far more likely to be familiar with
> the C23 "auto" than they are with the pre-C23 version, 

auto in older versions of C is a storage classifier, so grouped with
static, extern and register.

It is inherited from B, and along with K&R's having implicit int types,
was there for familiarity of code to existing programmers.  e.g. "auto
a, b, c;" was B's way of saying "I'd like 3 ints on the stack please". 
It is very rare to see in C these days.

C++11 repurposed 'auto' as a type, and C23 has followed suit.  This is
compatible with the prior meaning, and 'auto' can still be used as a
storage classifier in C23.  You can't however use 'auto auto'.  In
GCC/Clang prior to C23, the same behaviour is available from __auto_type.


So.  auto as a type inference keyword will be commonplace C in few
years, just like it is already commonplace C++ for a decade.

Right now in Xen, we can choose to either use something that is on the
brink of becoming normal, or we can use the older form which will get
changed at some point in the future.

One of these makes far more sense than the other, considering that it is
already standardised C23.

~Andrew

