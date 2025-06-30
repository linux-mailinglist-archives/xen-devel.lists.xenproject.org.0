Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB5AEE103
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029151.1402900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFeE-0000EU-VE; Mon, 30 Jun 2025 14:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029151.1402900; Mon, 30 Jun 2025 14:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFeE-0000D3-Rr; Mon, 30 Jun 2025 14:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1029151;
 Mon, 30 Jun 2025 14:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irzh=ZN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWFeD-0000Cu-HZ
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:38:17 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab1c0fe-55bf-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 16:38:14 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso8533401a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:38:14 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35365a732sm691801866b.65.2025.06.30.07.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:38:13 -0700 (PDT)
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
X-Inumbo-ID: dab1c0fe-55bf-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751294294; x=1751899094; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdi3iO9Hhrg5CZ/M4Mb+W+1knJL9sQGgZVt6/ZxFFpU=;
        b=JqfcfHWgApQaNh+9/G8ebxRN4EOMv81obJarW/F0E+gqokQKwegN/cRWs/bgyx6KRA
         cjCcLdMfJuBu2x2O7P0Z6/Uhd6bZT9pVue+iyFUKOy2t0UJ2zEGgB8XyxC4v4aZomril
         D+T40+2Iwzb2q++JRKxhsF0XpbeFQXwJzdgyLoS8VeCkp1ZdBR0AE4JlUHnJ3PRcWsYU
         KL1rKd0ETCep+RN7B0dTMVuexh+PPn3+G4RdgzxQHzwQJZ8YAKZ0AG0xmmEU2SlxfRoM
         v8+86HmvMyXQcXHtGOXpQN1hkC2TggiXLuSK1bPLagNGK1ID+LqAAhpgJ6n4/f/Em1on
         TJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294294; x=1751899094;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kdi3iO9Hhrg5CZ/M4Mb+W+1knJL9sQGgZVt6/ZxFFpU=;
        b=txmKatKFWN2x9dtZqeKBjigU9AvN/RdHkirWhtvYIRWDqBU/MEG4Smd9Rc3Mve8Ges
         Dooe2OX60iKoB+BfH1U+GaMwAo3Dd2D2QCMtbSjp6dW2CPdPspQaLDrixNKdEOR+PiBy
         IFYKWkPcOjbhtT+UNAxUl8RSlLRQqgbXDVD3/4KJcT2SdkwaqD33z2xx1WroYi9C23qk
         T953mkKH/jVFMo2odVpgdwBWvCsLCV1tuD7Onl9KB2dI+BsD8hbMiGxvRXyv8qevgY6D
         Z/aA3AmUuLF80Y+Jlt9NDyvGkM0sxdhO+mLSTci7R8TEt8TjydtCL0KQFFmnnlfG7FDf
         /9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXIasEatkm+krTueWNeektDU+TqB7HfyxtMXHEjXvpWMXyH+1HIQV9iMaGug7IuL5k8dEFeO80ub00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZJd0GJnzgxERTBe0yEjYmKUPNA0YQQC7GGXZFX+8QzbizBlyV
	RdjjBbwXpvNPXCH84/tmjr2ppuKr4yBCM9Km+sv/xNNaO53N0mLr2cpU
X-Gm-Gg: ASbGncttcPZICLPsbbCE/ZztJI7Zy0TJ0WbY1DqSxkRuzYpkSLkIXLY7bEgIigVz0/1
	eb+tU9Ius+8VijYy8ud1yq+Xaid5XSChW+duxR66gr4lzKhzHfXAmdAr1n2pK06xQLnkUwfNYWG
	BdvFITJs2FYeK4LgYx+/btCQprX8X6VQRee+beVYSj57EM1rgIhMAX993HqMcksqHDsjsgu5hBz
	ayIL+bPn54o9uwdhFkT8iwrrlvCVj2z6DwlJVZhKQbS6mhtRoWo+t8XLcyY1ehOEKKEdusN7klj
	ilILxtLfNRR9x7ljhgqXl1IToz2CBcICkg9pxogqX03Hfhg48VlFY81NIzwVYPQ3mRJlNqcoPnm
	Gy6Gp8W5QfNxQUMXz6Ysd2B7+ps8R57o2xv0=
X-Google-Smtp-Source: AGHT+IEd5nB8VgRkFkw55I90KYrvv1ZHo/TlKndCPAPbX0gRPDBlgxqcelFKsQGHH0tVu3PTyWiZhg==
X-Received: by 2002:a17:907:96a5:b0:ade:902e:7b6b with SMTP id a640c23a62f3a-ae34fd3057cmr1329381466b.7.1751294293614;
        Mon, 30 Jun 2025 07:38:13 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------JNQ13cQHhSVgAzdZxVbg8j3M"
Message-ID: <6fafc0b4-cfea-4d67-bef6-4e40d1d3e743@gmail.com>
Date: Mon, 30 Jun 2025 16:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>

This is a multi-part message in MIME format.
--------------JNQ13cQHhSVgAzdZxVbg8j3M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
>
>
> On 6/26/25 4:59 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>   typedef enum {
>>>       p2m_invalid = 0,    /* Nothing mapped here */
>>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>> As indicated before - this type should be added when the special handling that
>> it requires is also introduced.
> Perhaps, I missed that. I will drop this type for now.
>
>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>> What's the _dev suffix indicating here?
> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>
> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.

I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())

~ Oleksii

--------------JNQ13cQHhSVgAzdZxVbg8j3M
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
    <div class="moz-cite-prefix">On 6/30/25 4:33 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/26/25 4:59 PM, Jan Beulich
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com">
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
it requires is also introduced.</pre>
      </blockquote>
      <pre>Perhaps, I missed that. I will drop this type for now.

</pre>
      <blockquote type="cite"
        cite="mid:8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">What's the _dev suffix indicating here?</pre>
      </blockquote>
      <pre>It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
<code>using PTE_PBMT_IO for </code>p2m_mmio_direct_dev.

Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.</pre>
    </blockquote>
    <pre>I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------JNQ13cQHhSVgAzdZxVbg8j3M--

