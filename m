Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D8AB683B
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 11:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984150.1370332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF8sC-0000j0-Jr; Wed, 14 May 2025 09:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984150.1370332; Wed, 14 May 2025 09:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF8sC-0000hW-H0; Wed, 14 May 2025 09:58:00 +0000
Received: by outflank-mailman (input) for mailman id 984150;
 Wed, 14 May 2025 09:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7agW=X6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uF8sB-0000hK-12
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 09:57:59 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9c4c630-30a9-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 11:57:57 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54fd1650afdso4222286e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 02:57:57 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bf27bsm2196622e87.165.2025.05.14.02.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 02:57:56 -0700 (PDT)
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
X-Inumbo-ID: e9c4c630-30a9-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747216677; x=1747821477; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXniUx/KT412fF1BPzq5BCIASDQb+3bIl9LzRcy84aw=;
        b=eml7vPScIEFDg/63eECUDZV1LSheq4Hg8Nvp1FaBQlS1atzs+FLMJsyMiot/4DLlLL
         RsoNLxxJxYnjErwSYnM7T4c/WKNLYy9dhBpsVpZmo9azA10fjMGIFQ9U3CwLTv2U3xRO
         LCgKI78sr08WJkxOaWZ4aDFpKfTpqcvLqBKfp2I8SO1SHcpeJFG2nTdU5yv+c/h7iGpF
         vN6XQLMJJyWBQPJoxDA1sCCPMfYiPBtXU3lD9pYy85cJQuQhyThIB0MDF8fNph+pPvg1
         0H5BYOgF2hb9imCSX+fzvzf3S7eUwTmyz9cp2KOhHbwy0/SASbrAFBfpi1SV4yottMSm
         yrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747216677; x=1747821477;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AXniUx/KT412fF1BPzq5BCIASDQb+3bIl9LzRcy84aw=;
        b=TEBmLhuJlaSE3tSLh4mXCv1D/giQaDjSt3x2ZYx5PcO5JW41f91E/A+YWM2KnDexrF
         qo/qo2Eir1O0Vgmkf5CCFaM81wMwbTPeZdErFk60LjTd8PDFFq1jyK1TxdlI8yiHT4iN
         77mMZcHfrANfNsqul8Z1ZpnfZnBmGWe8GQOiyuCpkEErw5NJb4aX9lFI493YlwO9Gjuo
         T/VbTi74funuqDP2mGSHE2hSGrMcU4d0A+ffdUqjCbh6/mGee8ElpuBXRgLgqUW2PlM8
         gUkkde1ryYX5ap+n+4lyrmlIIaCGSFyAlziBmzY8NnOmpqemVehd6CvqkMll9AiAcyix
         Ifww==
X-Forwarded-Encrypted: i=1; AJvYcCWGyQAQAB6PPEHTJFjyiqqgdmrWIGr9U1UYrH/eeUiGVqHbMH3Ilbo8b77T1OodLaZxgQ01YhATwgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6GJYNluBbqFRqGntd0USLewK7lQh0x7FfMZGWF6qLvU0W5Cc6
	PO16jQCxhHJSihlnYolvlD6Ns1OjrwJ8ZeKht4ymhOiU3LAaS7JL
X-Gm-Gg: ASbGncuGdgp0RnwetM3vd2fRCbxxUnlftdgFUu8Yta9KY8I8+7F206kICKiM0lNuNWE
	jkNWheZKw6eW+o11hYYCKbiLFWexG5B54moekuA4h5TpsMFDXeUEOJFJVAtCraP8VXTQreid4UE
	q2fJ7mku6hC16YauSyBKLl6S93hc62bDvqt/KYEHV7y54uF5kCjVV7rMsu7JXVVQLZUibJTvCrD
	htZBl/aOPr2UlKpadEcwaW4eLwt+4bWds3fu2dfN9AG3XZu72SNHASW9G25lPlYmdoLvFtk2ED4
	FQhl87VsqYF5W2F8e15vblaqRXkcAgIf0tTP9znt3+s1mStZCO+ZqJqUSv0GIyLsXwYcpnFnGgn
	a8OudTjppt5tZgzsjb1fzxSFr
X-Google-Smtp-Source: AGHT+IH+WQlUdnU4tRN8t69VgUcXLhmjnMQFLwvZLwhO5DUYYWSEX4x8qPowyYNp/EPUP90qGtKJKA==
X-Received: by 2002:a05:6512:6514:b0:54f:c616:ee28 with SMTP id 2adb3069b0e04-550d61ee326mr832264e87.47.1747216676927;
        Wed, 14 May 2025 02:57:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------X0mI5EF3kOEh06vj711U0VIw"
Message-ID: <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
Date: Wed, 14 May 2025 11:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>

This is a multi-part message in MIME format.
--------------X0mI5EF3kOEh06vj711U0VIw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/14/25 9:25 AM, Julien Grall wrote:
> Hi Oleksii,
>
> On 13/05/2025 15:29, Oleksii Kurochko wrote:
>> Refactor construct_domU() to improve architecture separation and reduce
>> reliance on ARM-specific logic in common code:
>> - Drop set_domain_type() from generic code. This function is specific
>>    to ARM and serves no purpose on other architectures like RISC-V,
>>    which lack the arch.type field in kernel_info.
>
> So you will only ever boot one type of domain on RISC-V? IOW, no 32-bit
> or else?

The bitness of the guest and host should match. So, an RV32 host should run
RV32 guests, and an RV64 host should run RV64 guests and so on.
(I'm not really sure that on RISC-V it is possible to run with RV64 host
an RV32 guest, but need to double-check)

Therefore, my plan for RISC-V is to have the following:
   #ifdef CONFIG_RISCV_64
   #define is_32bit_domain(d) (0)
   #define is_64bit_domain(d) (1)
   #else
   #define is_32bit_domain(d) (1)
   #define is_64bit_domain(d) (0)
   #endif

With this definition, there's no need to use|(d)->arch.type| for RISC-V.

>
>> - Introduce arch_construct_domU() to encapsulate architecture-specific
>>    DomU construction steps.
>> - Implement arch_construct_domU() for ARM. This includes:
>>    - Setting the domain type for CONFIG_ARM64.
>>    - Handling static memory allocation if xen,static-mem is present in
>>      the device tree.
>>    - Processing static shared memory.
>> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>>    this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>>    at least, now.
>
> This looks shortsighted. If there is a plan to use CONFIG_STATIC_SHM 
> on RISC-V (I don't see why not today), then
> I think the code should stick in common/ even if it is not fully usable
> yet (that's the whole point of have CONFIG_* options).

We don't use this feature in the downstream repo, but I can imagine some cases where it could be useful. So, for now, its
use is purely theoretical and it is a reason why I agreed with Michal and returned back these changes to Arm.

~ Oleksii

--------------X0mI5EF3kOEh06vj711U0VIw
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
    <div class="moz-cite-prefix">On 5/14/25 9:25 AM, Julien Grall wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org">Hi
      Oleksii,
      <br>
      <br>
      On 13/05/2025 15:29, Oleksii Kurochko wrote:
      <br>
      <blockquote type="cite">Refactor construct_domU() to improve
        architecture separation and reduce
        <br>
        reliance on ARM-specific logic in common code:
        <br>
        - Drop set_domain_type() from generic code. This function is
        specific
        <br>
           to ARM and serves no purpose on other architectures like
        RISC-V,
        <br>
           which lack the arch.type field in kernel_info.
        <br>
      </blockquote>
      <br>
      So you will only ever boot one type of domain on RISC-V? IOW, no
      32-bit
      <br>
      or else?
      <br>
    </blockquote>
    <pre data-start="59" data-end="186" class="">The bitness of the guest and host should match. So, an RV32 host should run
RV32 guests, and an RV64 host should run RV64 guests and so on.
(I'm not really sure that on RISC-V it is possible to run with RV64 host
an RV32 guest, but need to double-check)
</pre>
    <pre data-start="188" data-end="232" class="">Therefore, my plan for RISC-V is to have the following:
  #ifdef CONFIG_RISCV_64
  #define is_32bit_domain(d) (0)
  #define is_64bit_domain(d) (1)
  #else
  #define is_32bit_domain(d) (1)
  #define is_64bit_domain(d) (0)
  #endif

With this definition, there's no need to use <code data-start="449"
    data-end="465">(d)-&gt;arch.type</code> for RISC-V.</pre>
    <blockquote type="cite"
      cite="mid:0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org">
      <br>
      <blockquote type="cite">- Introduce arch_construct_domU() to
        encapsulate architecture-specific
        <br>
           DomU construction steps.
        <br>
        - Implement arch_construct_domU() for ARM. This includes:
        <br>
           - Setting the domain type for CONFIG_ARM64.
        <br>
           - Handling static memory allocation if xen,static-mem is
        present in
        <br>
             the device tree.
        <br>
           - Processing static shared memory.
        <br>
        - Move call of make_resv_memory_node() to Arm's
        make_arch_nodes() as
        <br>
           this call is specific to CONFIG_STATIC_SHM which is ARM
        specific,
        <br>
           at least, now.
        <br>
      </blockquote>
      <br>
      This looks shortsighted. If there is a plan to use
      CONFIG_STATIC_SHM on RISC-V (I don't see why not today), then
      <br>
      I think the code should stick in common/ even if it is not fully
      usable
      <br>
      yet (that's the whole point of have CONFIG_* options).
      <br>
    </blockquote>
    <pre>We don't use this feature in the downstream repo, but I can imagine some cases where it could be useful. So, for now, its
use is purely theoretical and it is a reason why I agreed with Michal and returned back these changes to Arm.

~ Oleksii
</pre>
  </body>
</html>

--------------X0mI5EF3kOEh06vj711U0VIw--

