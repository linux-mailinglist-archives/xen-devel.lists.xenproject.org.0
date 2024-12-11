Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3139ECA4A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854444.1267659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJvO-0005u3-O1; Wed, 11 Dec 2024 10:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854444.1267659; Wed, 11 Dec 2024 10:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJvO-0005rg-K1; Wed, 11 Dec 2024 10:26:34 +0000
Received: by outflank-mailman (input) for mailman id 854444;
 Wed, 11 Dec 2024 10:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLJvN-0005k1-OD
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:26:33 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648bc4bd-b7aa-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:26:33 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso71087231fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:26:33 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3021de5c435sm10205201fa.9.2024.12.11.02.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:26:31 -0800 (PST)
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
X-Inumbo-ID: 648bc4bd-b7aa-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733912793; x=1734517593; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNBfv73uiEz1X8g9TbVw7Zgoo8BUPUn9uAQLa0yatfE=;
        b=PnNH/hk3+oEwZGRB7GLfAvDxc2jLhEVDfoQa7xPK8KfeBOfQmkY17dfh/ydzhVYMcQ
         VwOOZI7zYnKOYR0kjQ+HdJYJpBOM8b2bm65qnXLg98s5/u1zEt1f90/LIAVuHen14Gdh
         7RFCLqQ9/ePeDJWtsSUegof8O58FTQYEnFLoQaLtMlBf4jwAiW4dqXHSJ4RcDCg5C70y
         dO3A0CsH1Y1qg1vgSSXYtKg69han/jfaq6xb5TuNkcZ0daMo7W4tPYF399ZQe8INg7FQ
         LyhbbiVRYp4lAFQODhZ+XKCTL2MqwqfzbT/BwFDb66LKM6Uy0OjSWeZmmBv0RrC28BEf
         Q5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912793; x=1734517593;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eNBfv73uiEz1X8g9TbVw7Zgoo8BUPUn9uAQLa0yatfE=;
        b=bh6JVRz+UK+YoJWNFSBh1n8IpdJ6JwSaU+RSoDgu5e+UqIA2/E9uyoJvZ+i/Na6IQt
         hnoeJFxQP72p28BT6UH4vOYAThWeuKeYLGHB54jano7vv79b8vRAv33DaNyCYc51NWMs
         Y3lQeTA43n5E55R8jMt4HOG8su/nCcdKoCOLaRirFu0fYssjwqpzb8PnRasK3M4aHA4R
         SWqDA1HMSEZ9X/JKxLJ2khzpz9Z3cKbo19fRbsKfMlnrEm6SXp3ETTsGwJ1F0xA6Dkic
         /cmFnUMFQt8KEH6wB8rSDN/9vkhOhPjjRdykTl2/HqMhh2peDI94ZlFWXY53Qh3dBJI1
         GSTA==
X-Forwarded-Encrypted: i=1; AJvYcCXCPmMZWTQMI/VrczCwQxRm/y1rVrZv0xl5T84mgwNv++bwLg7y9JyZBphwhozi05O/7uip6ftVlm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNozOkDACoyt9xz0cYxYbGxzhQUwBdMoQRZJU2eCM/2iqiDXOO
	PMQEhBuyR7omMzUZ9Mf4EZrXWpg5f6PrBhlikEN0mmhZhaYdM62l
X-Gm-Gg: ASbGncuVIluQwjanUTKnV7km4E8sCPvNNvewEpY0EcnSatK1/vMSLE0utPpaMZo2Gzy
	BwFJON+E1ZChbDZDfNHp9QJIEWoKlk5XixkCE9bYRmt3y0ZMEJAt604f7KwzwrLRFappmDYgl4D
	WIoHgIlOIzLZ0KSH8HBnvRvIaaOSoQy2A5HdSmI5Ka3ttYtAp6z2AKkhQP/gc6JOn6WffXB5pCd
	kaceaDqqPrdsv2LfQU4DhkOR+vneHvDSev4Jd/mYQcXqCw6PNfvYKQZZpiCH9S+3Ls=
X-Google-Smtp-Source: AGHT+IHmpm6wMs9vI8yQJhSjHFPvzcpGTGZFbDnnObopqUanpQiHPjRUKrVVBkGkfCGecGzmC+wwUg==
X-Received: by 2002:a05:651c:b06:b0:302:18fa:3be0 with SMTP id 38308e7fff4ca-30240d64e8cmr8474311fa.22.1733912792237;
        Wed, 11 Dec 2024 02:26:32 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------HpJlsZP4b9kDAnNiqGYz1zoG"
Message-ID: <b9bcd015-330b-44a0-8660-c157369b4c96@gmail.com>
Date: Wed, 11 Dec 2024 11:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: implement relocate_fdt()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
 <d9fddba7-8364-45a6-addd-004dbde366a5@suse.com>
 <4dd6a2e9-d2b9-4402-907b-b9314d2346f7@gmail.com>
 <929d657d-ffe8-4243-ba01-fffa20b26205@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <929d657d-ffe8-4243-ba01-fffa20b26205@suse.com>

This is a multi-part message in MIME format.
--------------HpJlsZP4b9kDAnNiqGYz1zoG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/24 5:20 PM, Jan Beulich wrote:
>>> Also recall my comment on one of your earlier series, regarding inclusive
>>> vs exclusive ranges. Can that please be sorted properly as a prereq, to
>>> avoid extending the inconsistency?
>> Yes, I remember that and at the moment everything ( DIRECTMAP_VIRT_END, FRAMETABLE_VIRT_END )
>> is following "inclusive" way. Considering that you remind me that could you please tell me more time
>> what I am missing?
> First the table azt the top of config.h uses all exclusive upper bounds.
> And then DIRECTMAP_SIZE's definition assumes DIRECTMAP_SLOT_END would be
> exclusive, when it's inclusive.

Really missed to update the tale on the top of config.h.

But it seems to me like any *_SIZE will be defined in exclusive way by its nature, doesn't it?
For example, size of directmap is (509-200+1)<<30 = 0x7F80000000 and it is not really (
0x7F80000000 - 1 ) = 7F7FFFFFFF.

I prefer to have DIRECTMAP_{SIZE,VIRT_END} defined as now:
   #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END + 1) - SLOTN(DIRECTMAP_SLOT_START))
   #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
( of course with making upper bounds inclusive in the table on the top of config.h )

>
>>>> +        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
>>>> +        memcpy(dst, src + s, l);
>>>> +        clean_dcache_va_range(dst, l);
>>> Why is this necessary here? You're copying to plain RAM that Xen alone
>>> is using.
>> It is Arm specific:
>> ```
>> commit c60209d77e2c02de110ca0fdaa2582ef4e53d8fd
>> Author: Stefano Stabellini<stefano.stabellini@eu.citrix.com>
>> Date:   Mon Jan 21 12:40:31 2013 +0000
>>
>>       xen/arm: flush dcache after memcpy'ing the kernel image
>>       
>>       After memcpy'ing the kernel in guest memory we need to flush the dcache
>>       to make sure that the data actually reaches the memory before we start
>>       executing guest code with caches disabled.
>>       
>>       copy_from_paddr is the function that does the copy, so add a
>>       flush_xen_dcache_va_range there.
>> ```
>> I wanted to put copy_from_paddr() to some common place at the end but in RISC-V cache is always enabled
>> ( I don't see an instruction in the spec for disable/enable cache ) so this issue isn't present for RISC-V
>> and clean_dcache_va_range() should/could be dropped.
> That plus there's no kernel in sight just yet.

( clarification ) will it change something if kernel will be loaded now? It seems even if we are copying kernel in guest
memory we still don't need to flush the dcache as cache is enabled and cache coherence protocol will do a work automatically.

~ Oleksii

--------------HpJlsZP4b9kDAnNiqGYz1zoG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/10/24 5:20 PM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:929d657d-ffe8-4243-ba01-fffa20b26205@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Also recall my comment on one of your earlier series, regarding inclusive
vs exclusive ranges. Can that please be sorted properly as a prereq, to
avoid extending the inconsistency?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, I remember that and at the moment everything ( DIRECTMAP_VIRT_END, FRAMETABLE_VIRT_END )
is following "inclusive" way. Considering that you remind me that could you please tell me more time
what I am missing?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
First the table azt the top of config.h uses all exclusive upper bounds.
And then DIRECTMAP_SIZE's definition assumes DIRECTMAP_SLOT_END would be
exclusive, when it's inclusive.</pre>
    </blockquote>
    <pre>Really missed to update the tale on the top of config.h.

But it seems to me like any *_SIZE will be defined in exclusive way by its nature, doesn't it?
For example, size of directmap is (509-200+1)&lt;&lt;30 = 0x7F80000000 and it is not really (
0x7F80000000 - 1 ) = 7F7FFFFFFF.

I prefer to have DIRECTMAP_{SIZE,VIRT_END} defined as now:
  #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END + 1) - SLOTN(DIRECTMAP_SLOT_START))
  #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
( of course with making upper bounds inclusive in the table on the top of config.h )

</pre>
    <blockquote type="cite"
      cite="mid:929d657d-ffe8-4243-ba01-fffa20b26205@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
+        memcpy(dst, src + s, l);
+        clean_dcache_va_range(dst, l);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why is this necessary here? You're copying to plain RAM that Xen alone
is using.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is Arm specific:
```
commit c60209d77e2c02de110ca0fdaa2582ef4e53d8fd
Author: Stefano Stabellini<a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@eu.citrix.com">&lt;stefano.stabellini@eu.citrix.com&gt;</a>
Date:   Mon Jan 21 12:40:31 2013 +0000

     xen/arm: flush dcache after memcpy'ing the kernel image
     
     After memcpy'ing the kernel in guest memory we need to flush the dcache
     to make sure that the data actually reaches the memory before we start
     executing guest code with caches disabled.
     
     copy_from_paddr is the function that does the copy, so add a
     flush_xen_dcache_va_range there.
```
I wanted to put copy_from_paddr() to some common place at the end but in RISC-V cache is always enabled
( I don't see an instruction in the spec for disable/enable cache ) so this issue isn't present for RISC-V
and clean_dcache_va_range() should/could be dropped.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That plus there's no kernel in sight just yet.</pre>
    </blockquote>
    <pre>( clarification ) will it change something if kernel will be loaded now? It seems even if we are copying kernel in guest
memory we still don't need to flush the dcache as cache is enabled and cache coherence protocol will do a work automatically.

~ Oleksii</pre>
  </body>
</html>

--------------HpJlsZP4b9kDAnNiqGYz1zoG--

