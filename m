Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBAA92008
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957924.1350925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QSX-0002eZ-4C; Thu, 17 Apr 2025 14:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957924.1350925; Thu, 17 Apr 2025 14:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QSX-0002bT-1D; Thu, 17 Apr 2025 14:43:21 +0000
Received: by outflank-mailman (input) for mailman id 957924;
 Thu, 17 Apr 2025 14:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5QSV-0002bN-Cn
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:43:19 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9f08ac-1b9a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:43:17 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac25520a289so127883666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:43:17 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6eefc685sm2357466b.96.2025.04.17.07.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:43:16 -0700 (PDT)
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
X-Inumbo-ID: 4c9f08ac-1b9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900997; x=1745505797; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YrRrS2tfMHEc5x4XSZVeQrNlakP588rEqylOEht5sA=;
        b=njkE2CY3ORsF+H8UAS0smP0A+8D0SS0IvOOAq2dOnuNlSy9zTlMWRLRCZQqH5Tn3Z7
         OAfFc5m/KzGf6TRe6KAR0EDTkysddBGnXq/E+rpqmVNC6lHcJ6bOaKQf9mLtNyzVK/8V
         z3U6yRAepILJSsv0lRExyb5ow2uPiVUJNuHsxhjk5TMhm6i28jihF/ukQPCGGLrRLwQC
         K7WBOsuVApy0VTwxyM/Loezsy4v5RfcsrJjhvyWif3hWXF9uFDQvGQ9Z2ZEsIc8d+r5T
         1W3g1tIuFUEmLvLKsAZ7BpmjZGYEBSvXI8XEJe3xhL6Ac8+HGdNA1z7cUyJDEaNWiFqW
         lN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900997; x=1745505797;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/YrRrS2tfMHEc5x4XSZVeQrNlakP588rEqylOEht5sA=;
        b=BhJkxRZeExbgCHTSJSgd+v9YIHVQmdaHQAzkO6wbYOo4OqEo18WbEM2B4K3jTA2MiF
         3VZD3tvpRfzyRPZJPHnLVAiT4HwhUSW1RHM4mw+2Fu0T8pdOwFz0xXQ3IPKFV5fREu50
         accEWyJJJ664V03X0QG939jzPBGpplOlvE4wpbY/wUP0RC8db4EzXgo4OLXA7NNB8g1Y
         plzsM5ktl/dUNf/fqxDVtRQkuovBubVTrGXLPz2F0ZIpxFzT42MrzQhZ9+b45G3r/mJT
         kEsocztBfE9/OQlFMvfnkVI3I1J2Y6Jum+YGwmkED5K+iojzSHA+HofZ+hAgOvprLVGm
         EMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvBkMDm9ta4SkIdEOOSG/EDY9LLik7nPRsdkEGpTK68812I44IOt4LFijcxz6bWuQrLbC9el8CdHE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzvxSSBXwR7YPwekMXNY5/mZ3w6tOmTpHpGV1ut3gnLmYb3EK1
	u3/f7OE/zHaEuK3G80HgJaOR4eqtPH9G1ZovCaCt1DGfZawyOGpc
X-Gm-Gg: ASbGncunT2JoehLrHlQriLtHV+r2aKXw1HoKT308FuLoEzezCHBQVbCv5xnbcXV6PVP
	Lca1/hQN30bmeHSQAwDyMSOKCzq7F6VcZ3f6KxsxGLCWAkqUh9491vEsGWHsM043cliMDMNkIMs
	yM40MdFd/TH856zJzG/7iTcFvHeXGS9nh8t41/ukdjinUeeZH1y9i9Wydy2SCiLeHDgtLd1Z8Y8
	UGyMVNfHmqz8fKGEPxhTLg39E8J+EIoGWDdxLEdCXpdYt++Hh81OpEpl6Pcke5bPI714cytd6Qo
	vtvRnTxm/XB0Sk9HP7Nw08OsoiNnyiP7485NYhzl4XvgbWIBjV/61O7234TvdomSyRwDZEF0YnA
	xmJxB/LLelG8UeS8jk3zYwOmYSK4=
X-Google-Smtp-Source: AGHT+IE0bgqGLgjpYvFcyeD1hgQ7cMXdltYUvT9ulelhbVffhJc6DIpNzxZedfldR7ZwOJWG4btFxA==
X-Received: by 2002:a17:907:3f0a:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-acb428fdb78mr463577666b.19.1744900996560;
        Thu, 17 Apr 2025 07:43:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------izDQ6ZYJOD2yrLpdDKf4c9Fk"
Message-ID: <c7f96e26-1f78-4ada-a8a5-7c387011ecc8@gmail.com>
Date: Thu, 17 Apr 2025 16:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/14] xen/riscv: introduce platform_get_irq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <6c6e7482cc3b0332f5724c80bf16931fe2d793ae.1744126720.git.oleksii.kurochko@gmail.com>
 <31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com>
 <16139d54-fc6f-4ecb-9b3e-ea1e110a1f0d@gmail.com>
 <664560b3-400d-485c-b50b-0614f0a3e49e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <664560b3-400d-485c-b50b-0614f0a3e49e@suse.com>

This is a multi-part message in MIME format.
--------------izDQ6ZYJOD2yrLpdDKf4c9Fk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 1:23 PM, Jan Beulich wrote:
> On 15.04.2025 13:11, Oleksii Kurochko wrote:
>> On 4/10/25 5:35 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> @@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
>>>>        .hw_version = INTC_APLIC,
>>>>    };
>>>>    
>>>> +static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
>>> As you start adding functions calling indirectly, please consider adding cf_check
>>> right away, even if right now this has no effect on RISC-V. That'll save you from
>>> going through the entire RISC-V subtree later on to find them all.
>> Sure. I thought that it is a feature for x86 as I haven't seen such attribute for
>> Arm and RISC-V in GCC manuals.
> And that looks to be correct. I was under the (admittedly vague) impression
> Arm64 had something equivalent in hardware, which then merely needs enabling
> in the compiler. Not sure about RISC-V, but seeing the endless flow of
> patches enabling new extensions in binutils, it would perhaps even be
> surprising if nothing along these lines was already in the works somewhere.

You are right, something is already in the work:
-https://github.com/riscv/riscv-cfi
-https://lore.kernel.org/lkml/20230213045351.3945824-1-debug@rivosinc.com/ (interesting that
   they are enabling it for U-mode)


~ Oleksii

--------------izDQ6ZYJOD2yrLpdDKf4c9Fk
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
    <div class="moz-cite-prefix">On 4/15/25 1:23 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:664560b3-400d-485c-b50b-0614f0a3e49e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.04.2025 13:11, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 4/10/25 5:35 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
      .hw_version = INTC_APLIC,
  };
  
+static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">As you start adding functions calling indirectly, please consider adding cf_check
right away, even if right now this has no effect on RISC-V. That'll save you from
going through the entire RISC-V subtree later on to find them all.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Sure. I thought that it is a feature for x86 as I haven't seen such attribute for
Arm and RISC-V in GCC manuals.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And that looks to be correct. I was under the (admittedly vague) impression
Arm64 had something equivalent in hardware, which then merely needs enabling
in the compiler. Not sure about RISC-V, but seeing the endless flow of
patches enabling new extensions in binutils, it would perhaps even be
surprising if nothing along these lines was already in the works somewhere.</pre>
    </blockquote>
    <pre>You are right, something is already in the work:
- <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-cfi">https://github.com/riscv/riscv-cfi</a>
- <a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20230213045351.3945824-1-debug@rivosinc.com/">https://lore.kernel.org/lkml/20230213045351.3945824-1-debug@rivosinc.com/</a> (interesting that
  they are enabling it for U-mode)


</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------izDQ6ZYJOD2yrLpdDKf4c9Fk--

