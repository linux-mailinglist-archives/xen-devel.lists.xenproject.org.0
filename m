Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE49A3C6D2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 18:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893343.1302241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoJ1-0006yQ-8n; Wed, 19 Feb 2025 17:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893343.1302241; Wed, 19 Feb 2025 17:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoJ1-0006wx-5M; Wed, 19 Feb 2025 17:56:19 +0000
Received: by outflank-mailman (input) for mailman id 893343;
 Wed, 19 Feb 2025 17:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkoIy-0006wc-V7
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 17:56:17 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d008f6f1-eeea-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 18:56:15 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso128091e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 09:56:15 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452848ed13sm1885093e87.255.2025.02.19.09.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 09:56:14 -0800 (PST)
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
X-Inumbo-ID: d008f6f1-eeea-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739987775; x=1740592575; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TCJngYPCt32rN3+ve2RNQb49TUKwXGkPRnsKd2KM6I=;
        b=aPpm4INhclSwRQRXuuJ/Kymi9OrhZRyGCYWEKE7Y2ohgBsIWEShlc6JXUAB7bfBJII
         fT1/6kvfAfJFZ3MKsI8F6JGlKrI6Cnr2PWzewnxCgCwbvh3dyFTXQ2VZftAsDqIZhUQE
         8bj0jA0dHK9iMMbobIAqcQSwZXcU3jfzPE0OOrF/OKvd4ri9176W0mDdOXC1KqFk+xSb
         IZjkm1oTWG3+c0KVXGfsdPc/ofECbLS3Q56olYIqPDoSV6zB3JL9J6bsDAugt0DgSQwe
         sVAsov+sAIMBAWY0YWQ59chQ/Cselz9R7SXJ9ntBIcuK/tdLKIVHgrv1hbQywTWP/dEw
         aSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739987775; x=1740592575;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TCJngYPCt32rN3+ve2RNQb49TUKwXGkPRnsKd2KM6I=;
        b=cy1dOE3dU9yjnTsO+QU2bcgft55hcQTazJtz3MbD1Y8YtddrLi+Ag057fl+y10PTu/
         M5ZthZfojiF1U5T47SUaDW4UaTKJUN/zDoPIVvIeABNOMCfNizOSaTrzMWX0S5EihFes
         5TO1NIqNMus+e1MiexE5tKU/zvVnE6uKyyTuncR13ShghKfCe2kvm+WKpd+yHTgXwrX7
         /NGgmf1G+XCsEQA2aBo1WgFt3JWTTH/bTzI/CZXMsiT+cUJdelasIulVLBOAOvdQofZd
         vxw1OjpxPDNhG/VqlR9W6n8No+xm+2oZHTwcx+dOwuFyXkvYlSXERwDdZxQg1P9EVsV3
         SGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqN6PAo5IpzI7Kusl0BzNeYdRJ8vB9kfOl3MDpUkQDKopgmUuLtfx4045qkujbBThJZ+edJm/ttAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeZSyqhvlya5NR76w8P9JdN77F4Z/POgtaUejmMbjfKpkDH4oe
	uDoA845OXTiVVtbBGVMqfcWTNtODI8ImQStLLvyZZyS0+dHVANdI
X-Gm-Gg: ASbGncutHhwJyyuunJAyOzGe4Es7wjPrziGOkkLYYErwXMKdMiFSnKy95+e/I9q+l0o
	ZvdPLphlZzdtQ2B6uSYzD/Yrq/JQPNfJgeEjCGnxqRkK0BHGtVeiaoQltiyEpIwu5rFPHqOMgj8
	OuOKS8+9C8IMhxej4p/McG+iXwJeqFu4rvd/3da41a+F5WTxXcDeN8dKY5uH+brXklapvq9GGmF
	jcB25SRHWXPfLjDMaHnsv1O3g3IlmQpgmSeOKYT7zF7eZdn78MQybZUvVdf0MzNGvPOBfEcybAc
	Qc9X09pRz/YXvafEOcpUgp/g
X-Google-Smtp-Source: AGHT+IGgrOk/g3Ca1Ze3Up4LqbYR39RRmnO+uL9MdM/2Rr3wN/UUJgJO0rjgoCGPUMJoNAAN+XOoJQ==
X-Received: by 2002:a05:6512:110b:b0:545:5d:a5ea with SMTP id 2adb3069b0e04-5452fe271a7mr7730744e87.3.1739987774390;
        Wed, 19 Feb 2025 09:56:14 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------iEH7QAfmDSZYAvNd5KXXS9Zw"
Message-ID: <bc198221-7a98-4f61-af75-01decaebbdb7@gmail.com>
Date: Wed, 19 Feb 2025 18:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 1/2] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
 <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>

This is a multi-part message in MIME format.
--------------iEH7QAfmDSZYAvNd5KXXS9Zw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/18/25 6:03 PM, Jan Beulich wrote:
>> --- a/xen/arch/riscv/arch.mk
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>   riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
>>   riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>>   
>> -riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>> -riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>> +riscv-march-$(CONFIG_RISCV_64) := rv64
>> +
>> +riscv-march-y := $(riscv-march-y)ima
>> +
>> +riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
>> +
>> +riscv-march-y := $(riscv-march-y)_zicsr_zifencei
> The repeated use of := makes this longer than necessary, and hence harder to
> read. I understand using += isn't exactly ideal either, because then on the rhs
> no blanks may appear (aiui), being kind of against our style and potentially
> hampering readability. Still maybe:
>
> riscv-march-$(CONFIG_RISCV_64) := rv64
> riscv-march-y+=ima
> riscv-march-$(CONFIG_RISCV_ISA_C)+=c
> riscv-march-y+=_zicsr_zifencei
>
> ?

Btw, I think that we will still anyway strip spaces added by '+='. So it will also need to do something like:
   [1] riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))

As without this I expect that -march will look like:
   -march=rv64 ima c _zicsr_zifencei

With the change [1] we could have spaces around "+=":
   riscv-march-y += ima
   riscv-march-$(CONFIG_RISCV_ISA_C) += c
   riscv-march-y += _zicsr_zifencei

   riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))

~ Oleksii

--------------iEH7QAfmDSZYAvNd5KXXS9Zw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/18/25 6:03 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
 riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
-riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
-riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_64) := rv64
+
+riscv-march-y := $(riscv-march-y)ima
+
+riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
+
+riscv-march-y := $(riscv-march-y)_zicsr_zifencei
</pre></blockquote><pre wrap="" class="moz-quote-pre">The repeated use of := makes this longer than necessary, and hence harder to
read. I understand using += isn't exactly ideal either, because then on the rhs
no blanks may appear (aiui), being kind of against our style and potentially
hampering readability. Still maybe:

riscv-march-$(CONFIG_RISCV_64) := rv64
riscv-march-y+=ima
riscv-march-$(CONFIG_RISCV_ISA_C)+=c
riscv-march-y+=_zicsr_zifencei

?</pre></pre>
    </blockquote>
    <pre>Btw, I think that we will still anyway strip spaces added by '+='. So it will also need to do something like:
  [1] riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))</pre>
    <pre>As without this I expect that -march will look like:
  -march=rv64 ima c _zicsr_zifencei

With the change [1] we could have spaces around "+=":
  riscv-march-y += ima
  riscv-march-$(CONFIG_RISCV_ISA_C) += c
  riscv-march-y += _zicsr_zifencei

  riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))

~ Oleksii

</pre>
  </body>
</html>

--------------iEH7QAfmDSZYAvNd5KXXS9Zw--

