Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0FB20FDB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077767.1438796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUXk-0002Gc-IY; Mon, 11 Aug 2025 15:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077767.1438796; Mon, 11 Aug 2025 15:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUXk-0002Dj-FV; Mon, 11 Aug 2025 15:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1077767;
 Mon, 11 Aug 2025 15:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulUXj-0002Dd-Bg
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:34:35 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae821223-76c8-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 17:34:34 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af95525bac4so808978066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:34:34 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23ffc3sm2037851966b.124.2025.08.11.08.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:34:33 -0700 (PDT)
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
X-Inumbo-ID: ae821223-76c8-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926474; x=1755531274; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHF1L2pLFygULzgWE8B8Nqx2XDL3wvUhhXzQl/hNBSI=;
        b=mJmLYDWYmjURuifs2EWbTBwGjJdrL2rATUVxQBklNxRnrCpk02hMFJyYx3P60l8fJi
         6vCKDT/MAwXYmbwKlNJNQy7PQKuyaFgHcjVj88AglYt9YYTH51wmkYZex+wvlfY/Ge7i
         3dfOrquZnSgtVOVRzMxFMTsOH355pB2rfotyVC3JMS0UhGnEDCvLvoaludA/hkEt+tOr
         +vDoHi5q2IzfQjuWwI9O3YXWp59EjYnk/P7WEh0mwrSuqL3lkKs8OaYaM0mPP9DTze2f
         6DF7SF/LAzVWT25qzX5SIMQqvQ58hP4WVr+fAcOWUB+xZKStIG5J2Wpd+m8QiuUxc+mU
         Xodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926474; x=1755531274;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHF1L2pLFygULzgWE8B8Nqx2XDL3wvUhhXzQl/hNBSI=;
        b=DqDlGFjA4K5LmAsJZXsBkygiS5DrryaB7rlXWP5YFoqx0M7rA9/ax4z5GEvWmzA2Z/
         pHH+7Tx4L7y7tWRjo3ISXeXLp29xWucelkWfMXS7oLGie1vq7+c/Dccr4pYBmqOi3ojx
         r+3phh8d3gB6MKoB/TK565iFeIYYtcMajKD7d3GlvFU0LBXVHiX7k34Nbfi3jXhqEATs
         S1ojjg/EfLaPQL0R6tNLKXE3NFBpPLo/bda65ldBHYS0eAqiPRvh0aN3Hf7ofxCh7C6s
         0Slk+o+gOJ47Dn6I24USMrD6iKILMrRizHTKPOBZZupHnRHjGGWGqilYsJFPDiSVC0fx
         9hNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGoZTwc/GW61a3tcS+cD46JUnRyGHWad1Xm9X4lQ9V+EpioafHhvtHsP75oxSf2JuFVFpA+vqtixw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy//hjnHnwaWH4Wi4+4HMtzW9FilKdU0/S+jg6tAmgRFaWVFqpL
	VwxP/5jG/cc2MwHhZlty2bC9txQ7eDMT3t4VSji/waZfB732aithOZJm
X-Gm-Gg: ASbGncspXNZ7hlVviZ8vXAhDdrRkaZ3JjE+TzeTwdfkL5F8miUHwGw2zDM5yOUhpmRh
	iV7W59BMO7SHcXeSZC39y62h/eMw9Pgnhvnf3R80cXcSZe4O1fu9/4XzAB+Wj5jD2Xc6YezJrsv
	6I/8UFGZF27mbU77RuGYD72S+w9ssWDAK6CHKNbX3cboTEwTUZiC44W9egvgTTCdfeOykW9h2/x
	uFS56HYSxYx1KTFVd0T5tPztsZhnYCGtj5AC3ZV9D00ncMn5BFAA55JfrlQdqatjqtW/KkwerLT
	944Iu8cWUZ/dIOVk+bPX2p3O8eeatsIsBVZPhAKFoQYjJS2KCVNUa86AJ4zO6ZnkVIgEAYgjkec
	8EFjHOo7SOkWqzSLAkVdlfHVJS8AyTIqpbDW6MzCbFQ/Be5oyqtpy+6Ie9BWcZ58ZAVQFpObu
X-Google-Smtp-Source: AGHT+IHE45vxsk6aHfZzAHH75TgLGRvcL19YxVsy+G0nN60p8DjsQQaIIdIPFsqx5vJfYEsIpyLxSQ==
X-Received: by 2002:a17:907:3d55:b0:af9:613b:3055 with SMTP id a640c23a62f3a-af9c63b0941mr1136048266b.2.1754926473549;
        Mon, 11 Aug 2025 08:34:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tYbbX2m99O8kk8ixkPXHyn0C"
Message-ID: <96a48408-3a44-41b8-9ba5-1148a7e5ca6c@gmail.com>
Date: Mon, 11 Aug 2025 17:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/20] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <fe455eac54b6c874b8ddb69e94703c9a28330a4c.1753973161.git.oleksii.kurochko@gmail.com>
 <60a8be02-430b-4c37-bb4c-6285c2676c10@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <60a8be02-430b-4c37-bb4c-6285c2676c10@suse.com>

This is a multi-part message in MIME format.
--------------tYbbX2m99O8kk8ixkPXHyn0C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 2:50 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Implement the mfn_valid() macro to verify whether a given MFN is valid by
>> checking that it falls within the range [start_page, max_page).
>> These bounds are initialized based on the start and end addresses of RAM.
>>
>> As part of this patch, start_page is introduced and initialized with the
>> PFN of the first RAM page.
>> Also, initialize pdx_group_valid() by calling set_pdx_range() when
>> memory banks are being mapped.
>>
>> Also, after providing a non-stub implementation of the mfn_valid() macro,
>> the following compilation errors started to occur:
>>    riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>>    /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>>    riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>>    /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>>    riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>>    /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>>    riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>>    riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>>    /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>>    riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>>    riscv64-linux-gnu-ld: final link failed: bad value
>>    make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
>> To resolve these errors, the following functions have also been introduced,
>> based on their Arm counterparts:
>> - page_get_owner_and_reference() and its variant to safely acquire a
>>    reference to a page and retrieve its owner.
>> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>>    unreachable, as RAM type checking is not yet implemented.
> For this latter part I can only repeat that the code is reachable, and hence it
> is wrong to put ASSERT_UNREACHABLE() there. That's true for Arm's code as well.

I will drop this stuff in the next patch version.

>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> With said line dropped:
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks.

~ Oleksii

--------------tYbbX2m99O8kk8ixkPXHyn0C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/25 2:50 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:60a8be02-430b-4c37-bb4c-6285c2676c10@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implement the mfn_valid() macro to verify whether a given MFN is valid by
checking that it falls within the range [start_page, max_page).
These bounds are initialized based on the start and end addresses of RAM.

As part of this patch, start_page is introduced and initialized with the
PFN of the first RAM page.
Also, initialize pdx_group_valid() by calling set_pdx_range() when
memory banks are being mapped.

Also, after providing a non-stub implementation of the mfn_valid() macro,
the following compilation errors started to occur:
  riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
  /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
  /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
  /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
  riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
  riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
  /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
  riscv64-linux-gnu-ld: final link failed: bad value
  make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
To resolve these errors, the following functions have also been introduced,
based on their Arm counterparts:
- page_get_owner_and_reference() and its variant to safely acquire a
  reference to a page and retrieve its owner.
- A stub for page_is_ram_type() that currently always returns 0 and asserts
  unreachable, as RAM type checking is not yet implemented.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For this latter part I can only repeat that the code is reachable, and hence it
is wrong to put ASSERT_UNREACHABLE() there. That's true for Arm's code as well.</pre>
    </blockquote>
    <pre>I will drop this stuff in the next patch version.</pre>
    <blockquote type="cite"
      cite="mid:60a8be02-430b-4c37-bb4c-6285c2676c10@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With said line dropped:
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------tYbbX2m99O8kk8ixkPXHyn0C--

