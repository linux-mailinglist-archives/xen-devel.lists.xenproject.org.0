Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043CEAF115E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030873.1404551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuSx-0002M8-HB; Wed, 02 Jul 2025 10:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030873.1404551; Wed, 02 Jul 2025 10:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuSx-0002K4-E6; Wed, 02 Jul 2025 10:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1030873;
 Wed, 02 Jul 2025 10:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWaS=ZP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWuSv-0002Jy-Ef
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:13:21 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dcce33f-572d-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:13:20 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so10159271a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:13:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353659de4sm1029707066b.42.2025.07.02.03.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:13:18 -0700 (PDT)
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
X-Inumbo-ID: 2dcce33f-572d-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751451200; x=1752056000; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yrk+oTnR9/QROg/fu6KcHnroxW3AACJ+QVBSCvY8ALo=;
        b=ErbySs/TFiBVmA6ZelLaieSZsCo0M3kSUH7toD7Wg6GYI+U1LOBeLaUjjp9pqiis0+
         Z7c3cUfnnGhs1ZPToaYbg2GIz+IWSd3X2mcvssN0nrV8Js3D6dPruCh6bRKAHblO3krH
         jx81F6hhLm3Qog+7r0jYyqX4b8uMxT8yfp0nEskA9SJwwLJfq7cLIt22hhZK7LC1vzIZ
         5GoVXvsSvJd7rQTov3MWoEaptchGyGnJdGNT9GcIHOTr55TjjAbl50N/4eQi1/s0JKZR
         l0kQ8OCvOekgWSfZEYpybkwNVsLR5IpgVPVNT4XNrhhUPSMUviNYUVwJclFDx6NVeZZw
         g6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451200; x=1752056000;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yrk+oTnR9/QROg/fu6KcHnroxW3AACJ+QVBSCvY8ALo=;
        b=Vy9Wk8jMrGDHo2x2HZvGv1YOB3OKBtXvWDl5iAlTo/dQD/iISJbMTzOpFvZ+MZChN4
         4r8LZCJCtCyA3LKLKSigBFj97GUurYI5x1JhfkNHt98DvFps+gVuvSRSOS6fHw2YMDTV
         IQYpqq8ynn6MqsJKp6e5EOsbInRpEPgSzdnJ0tpUzTJd+Xky40/7qUDx1N3H4oqPOd6h
         asYIAnXtTXM4KUgua8N6+w4INQXAlmV235Ff4DAr9UFANM+CGj058nEq63ZtzHETSpke
         K0RD8Mno6GcowrXtV4w/IcuAmLWFm0AVwj5VwOkYslW03ByVYiymX5q7HUQ167GB1QcW
         Dstw==
X-Forwarded-Encrypted: i=1; AJvYcCVAmSqRNc0xuJZ7Yn1pwGFq9HEqzN66UnJcRqFNVMoK1qiP361bGrvlfVh/z2fPPoHwZmWbKkBReY0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8O1D1aeEnJ59d2Hijy8YtW8d74COIYJ7rXkGAdk3+QDPRPG7m
	TsbhUKlGiiC2Vu2UNLVyjdw0tXadjvoIk8in5FwppJvF+wrbKlFE7vNX
X-Gm-Gg: ASbGnctrKDW2aPnYT8XlhRMs2QtUmnpGDczh0WxOGsqZovZMl62EM8H6cAXZ6zTnYXS
	VR+d4wD7jDbplJXIeAMqVcAZ7YaSN1Q03GQlhO/CiEz3ryYke3mIZXLjALOtornWFpuA71AWiek
	l6szBWujjLSqFC3OLRHEegKtZOtoRuyRDy1Eyx3p2CJ/yPPNsoMBQJ2cKBsxcDLkzNDzcXoRnPQ
	G1KYk/lofGyMWnPM/+aKQTSIrLwZ61b7UxZCnF9Abzc8x8G/LINObJj8mK4m6wKjBPvZTzr4nmF
	xawR/MKxwqVwWuZtXKOKZ9/zXqYGJDcjjCMw4XlXrB3OfnLzgIltwkQcWSKonzVIKqFGQRKij/v
	yXkUGSo65qfTy8g49ZbcwF7F46dRQjG+Fjs8=
X-Google-Smtp-Source: AGHT+IFMv6IXUSRsI2j2QOqGvLnik9Hm1dB4He2qO4/PfUu+uodySzqA6JA8GKayPvnFuLxnVy06sA==
X-Received: by 2002:a17:907:3d06:b0:ae3:6f35:36fe with SMTP id a640c23a62f3a-ae3c2d60c64mr192096966b.47.1751451199148;
        Wed, 02 Jul 2025 03:13:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ER0ObPJSe0a0irlhV488bg8D"
Message-ID: <e9ca6d09-2bf2-453d-9fcb-f837f8fda4db@gmail.com>
Date: Wed, 2 Jul 2025 12:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
 <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
 <6fafc0b4-cfea-4d67-bef6-4e40d1d3e743@gmail.com>
 <f373045d-4479-4c55-b6cd-3c955e456428@suse.com>
 <f5fc8d66-cb90-4064-a215-8a2ea3705272@gmail.com>
 <2a7515a4-0e86-428f-8239-ae97b976f3f2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2a7515a4-0e86-428f-8239-ae97b976f3f2@suse.com>

This is a multi-part message in MIME format.
--------------ER0ObPJSe0a0irlhV488bg8D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 5:50 PM, Jan Beulich wrote:
> On 30.06.2025 17:27, Oleksii Kurochko wrote:
>> On 6/30/25 4:45 PM, Jan Beulich wrote:
>>> On 30.06.2025 16:38, Oleksii Kurochko wrote:
>>>> On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
>>>>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>>>>     typedef enum {
>>>>>>>         p2m_invalid = 0,    /* Nothing mapped here */
>>>>>>>         p2m_ram_rw,         /* Normal read/write domain RAM */
>>>>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>>>>> As indicated before - this type should be added when the special handling that
>>>>>> it requires is also introduced.
>>>>> Perhaps, I missed that. I will drop this type for now.
>>>>>
>>>>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>>>>> What's the _dev suffix indicating here?
>>>>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>>>>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>>>>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>>>>
>>>>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
>>>> I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())
>>> That'll want abstracting out, I think. I don't view it as helpful to clutter
>>> RISC-V (and later perhaps also PPC) with Arm-specific terminology.
>> Would it be better then just rename it to p2m_device? Then it won't clear for Arm which type of MMIO p2m's
>> types is used as Arm has there MMIO types: *_dev, *_nc, *_c.
> I don't understand why Arm matters here. P2M types want naming in a way that makes
> sense for RISC-V.

It doesn't matter.
But if we want to change the type name from p2m_mmio_direct_dev to p2m_mmio_direct or p2m_device then it will
affect Arm too as p2m_mmio_direct_dev is used in dom0less code which is also used by Arm.
I just re-used p2m_mmio_direct_dev as it looked for me pretty generic and clear for what this type is.

>> As an option (which I don't really like) it could be "#define p2m_mmio_direct_dev ARCH_specific_name" in
>> asm/p2m.h to not touch common code.
> A #define may be needed, but not one to _still_ introduce Arm naming into non-Arm
> code.

As I mentioned above that p2m_mmio_direct_dev sounds pretty generic to me and I am okay to use it for
RISC-V. But if you have better suggestions I will be happy to consider it.

~ Oleksii

--------------ER0ObPJSe0a0irlhV488bg8D
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
    <div class="moz-cite-prefix">On 6/30/25 5:50 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2a7515a4-0e86-428f-8239-ae97b976f3f2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 30.06.2025 17:27, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 6/30/25 4:45 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 30.06.2025 16:38, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 6/26/25 4:59 PM, Jan Beulich wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -61,8 +61,28 @@ struct p2m_domain {
   typedef enum {
       p2m_invalid = 0,    /* Nothing mapped here */
       p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">As indicated before - this type should be added when the special handling that
it requires is also introduced.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Perhaps, I missed that. I will drop this type for now.

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">What's the _dev suffix indicating here?
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
|using PTE_PBMT_IO for |p2m_mmio_direct_dev.

Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That'll want abstracting out, I think. I don't view it as helpful to clutter
RISC-V (and later perhaps also PPC) with Arm-specific terminology.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Would it be better then just rename it to p2m_device? Then it won't clear for Arm which type of MMIO p2m's
types is used as Arm has there MMIO types: *_dev, *_nc, *_c.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't understand why Arm matters here. P2M types want naming in a way that makes
sense for RISC-V.</pre>
    </blockquote>
    <pre>It doesn't matter.
But if we want to change the type name from p2m_mmio_direct_dev to p2m_mmio_direct or p2m_device then it will
affect Arm too as p2m_mmio_direct_dev is used in dom0less code which is also used by Arm.
I just re-used p2m_mmio_direct_dev as it looked for me pretty generic and clear for what this type is.

</pre>
    <blockquote type="cite"
      cite="mid:2a7515a4-0e86-428f-8239-ae97b976f3f2@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">As an option (which I don't really like) it could be "#define p2m_mmio_direct_dev ARCH_specific_name" in
asm/p2m.h to not touch common code.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
A #define may be needed, but not one to _still_ introduce Arm naming into non-Arm
code.</pre>
    </blockquote>
    <pre>As I mentioned above that p2m_mmio_direct_dev sounds pretty generic to me and I am okay to use it for
RISC-V. But if you have better suggestions I will be happy to consider it.

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------ER0ObPJSe0a0irlhV488bg8D--

