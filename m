Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A9A69584
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 17:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920963.1324999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwfq-0003uA-QR; Wed, 19 Mar 2025 16:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920963.1324999; Wed, 19 Mar 2025 16:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwfq-0003sh-NX; Wed, 19 Mar 2025 16:53:46 +0000
Received: by outflank-mailman (input) for mailman id 920963;
 Wed, 19 Mar 2025 16:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTXv=WG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuwfq-0003sb-6b
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 16:53:46 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7c2ac72-04e2-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 17:53:44 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so11326637a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 09:53:44 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a47f0bsm1024445666b.157.2025.03.19.09.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 09:53:42 -0700 (PDT)
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
X-Inumbo-ID: b7c2ac72-04e2-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403223; x=1743008023; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5PeJ+e9975EId6gmH/yMDfslg3LOwlUCnoQdj1JzPE=;
        b=Jp7qMo15LcTqIm/4xVy6YAPHv2/pMLwVTsyK+0ytgPLt9tM2XOYSLVshdHvJ8DOnAr
         oG9FvdP/0mPq9WhbhStU5vjJDOXagIXKN8Ap1YL7WTCYAHWNEy0l+gh3zg1jpgZ2BlXW
         8GMO17dHNKF8ykbzFV0f7l+H/9zPSLEFMM19qfylHwWqqmuk6AC3p3OyKda9xknF48L/
         YNpXxrEisGXJtoZsnKC3xPT1VFgCaHpJvbytwlfZXIsOUgFxLl18q2JWu0S1IEZaM7R8
         KOTGAaYNoW7a8MIED2H04ARhQ384KmiqYhUBUxETOIHoUjQy7fE1ZknO0giJL/HeFP1j
         TFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403223; x=1743008023;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5PeJ+e9975EId6gmH/yMDfslg3LOwlUCnoQdj1JzPE=;
        b=lGj2mmnE42szfV4BnSnenoPEoCWSxPf5dy7w9SWR2mf0OJz5BxOvQbBOeiPXEwSq9E
         zv+QV2jYFqH0BX+URFf5hbkty6LKIZPQNWkaoOJszfeeyQrFTny8eXrrNnvKPCUBDrWN
         EoRCj5DJXWJDFnCWKuhiNfpnEBaPcmxP2tLfuo0G6JxD3bXaOMReZ0m0gwU7tdq79t0D
         zS+eOaOByvhJsNQNMiuOV0mA1gtjbp6ABeG/aJrS/iDnn4uwnF8za9vltcW7Ps+IF8ox
         cAeg1kTGAXBuLKI5TCvGv2AY1TTRCS/SCS51yDiPtLwB5kOemVtAbaB3GNzwg98QcLqV
         9s0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaWiZQO2F0k52FjyW6WW3YHrTLu0+peaWs3ZrajMLY74iapPSRh2sQW7mY5tsHcesqi6tK9IprPtM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3JvOKCte3qrt5MM869M+y+p2UG0tcS/dt1r3Hj7nxrG6Oj7+4
	gnapehq4WhXIubzr9N/bJACw+MLXS8kdoYLM/P9ob1f2AFzLLgc8
X-Gm-Gg: ASbGncsIyMM2A54Kokvy/BfcBeXzGnHMUiX+rMPdB1jlyAHXDsGtLqPE5VWVg0wGbMZ
	dhDDpY+M9ALH9CqTRs1nj0RdRgCnqCObvYKhxwbr5+PdH28RZ1Nv6dby6ZmRx1OHTqBosZmBZtJ
	FLCT1GiMupmlpiOCQ5kPo/vy/2hD1w8UfR+HnO3hMI7wbd//2OT8eejI587tmYlL0dJksLU00uW
	w9TrniY0v2ePU6oNX3jPSFNpWSOK7TL2lEjkVD6GH31TCZRdozu/sF2CATZEO/3fDjhxyjHqUfF
	5RD45sWdJ0lgiLu5pwknM8+o8aPwHEBHhtDCTWNxow8w12yP0l9QL3/9H6cNcy1hzhWpANCktU3
	DnN0vSssLd6TShdNeaZuCDIot2e49apE=
X-Google-Smtp-Source: AGHT+IG9aah3rqDSaP7vAOmS9diIPIibsa2PoufhDPkEoi5O/WWup5l9gOCTB6r41mIiC/kjYkgY/g==
X-Received: by 2002:a17:907:2ce2:b0:ac1:791c:1532 with SMTP id a640c23a62f3a-ac3b7f79733mr364120566b.51.1742403222588;
        Wed, 19 Mar 2025 09:53:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------MsIy0UqQ2CQW2m000Ifuigc0"
Message-ID: <cb51a830-9db2-4543-b180-22f4c412c812@gmail.com>
Date: Wed, 19 Mar 2025 17:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] automation: select APLIC and IMSIC to handle both
 wired interrupts and MSIs
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <31ee47c8906f13869e085e442b285d7ca6202023.1741709885.git.oleksii.kurochko@gmail.com>
 <1edd3466-e999-4cfc-99e8-e701581806a2@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1edd3466-e999-4cfc-99e8-e701581806a2@citrix.com>

This is a multi-part message in MIME format.
--------------MsIy0UqQ2CQW2m000Ifuigc0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/25 8:40 PM, Andrew Cooper wrote:
> On 11/03/2025 4:19 pm, Oleksii Kurochko wrote:
>> By default, the `aia` option is set to "none" which selects the SiFive PLIC for
>> handling wired interrupts. However, since PLIC is now considered obsolete and
>> will not be supported by Xen now, APLIC and IMSIC are selected instead to manage
>> both wired interrupts and MSIs.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Andrew Cooper<andrew.cooper3@citrix.com>

Thanks!

>
> Presumably the version of QEMU we use is happy with this?

Before sending the patch series I ran the pipeline:
   https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1711201897

And based on the source code of Qemu the support of AIA should be present from 7.0.0:
```
$ git tag --contains 28d8c281200f20a060c456c81fd1564f3d119fda
staging-mjt-test
trivial-patches-pull-request
v7.0.0
v7.0.0-rc0
v7.0.0-rc1
v7.0.0-rc2
v7.0.0-rc3
v7.0.0-rc4
v7.1.0
...
```

And in Xen's GitLab CI it is used 7.2.11:
```
$ CONTAINER_NO_PULL=1 CONTAINER=bookworm-riscv64 ./automation/scripts/containerize
*** Launching container ...
user@6a1d1f0077fe:/build$ qemu-system-riscv64 --version
QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
```

~ Oleksii

--------------MsIy0UqQ2CQW2m000Ifuigc0
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
    <div class="moz-cite-prefix">On 3/17/25 8:40 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1edd3466-e999-4cfc-99e8-e701581806a2@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 11/03/2025 4:19 pm, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">By default, the `aia` option is set to "none" which selects the SiFive PLIC for
handling wired interrupts. However, since PLIC is now considered obsolete and
will not be supported by Xen now, APLIC and IMSIC are selected instead to manage
both wired interrupts and MSIs.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks!</pre>
    <blockquote type="cite"
      cite="mid:1edd3466-e999-4cfc-99e8-e701581806a2@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Presumably the version of QEMU we use is happy with this?</pre>
    </blockquote>
    <pre>Before sending the patch series I ran the pipeline:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1711201897">https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1711201897</a>

And based on the source code of Qemu the support of AIA should be present from 7.0.0:
```
$ git tag --contains 28d8c281200f20a060c456c81fd1564f3d119fda
staging-mjt-test
trivial-patches-pull-request
v7.0.0
v7.0.0-rc0
v7.0.0-rc1
v7.0.0-rc2
v7.0.0-rc3
v7.0.0-rc4
v7.1.0
...
```

And in Xen's GitLab CI it is used 7.2.11:
```
$ CONTAINER_NO_PULL=1 CONTAINER=bookworm-riscv64 ./automation/scripts/containerize 
*** Launching container ...   
user@6a1d1f0077fe:/build$ qemu-system-riscv64 --version
QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
```</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------MsIy0UqQ2CQW2m000Ifuigc0--

