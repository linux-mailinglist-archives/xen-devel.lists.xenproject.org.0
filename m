Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AAA77F59
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934592.1336252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdou-0002hS-Sf; Tue, 01 Apr 2025 15:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934592.1336252; Tue, 01 Apr 2025 15:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdou-0002fE-Pn; Tue, 01 Apr 2025 15:46:32 +0000
Received: by outflank-mailman (input) for mailman id 934592;
 Tue, 01 Apr 2025 15:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pMn=WT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tzdos-0002f8-Id
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:46:30 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ad3066-0f10-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 17:46:28 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so9702359a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 08:46:28 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17dfd41sm7408007a12.73.2025.04.01.08.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 08:46:27 -0700 (PDT)
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
X-Inumbo-ID: 79ad3066-0f10-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522388; x=1744127188; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIKjI1V1t2FTxepIuuZaGA4R4FaYVcgDVUe45kanUdQ=;
        b=NLPN8pgbz7W5me3YaqkdfmCAEZiC/IdJylkUrOmDx3lklIqx2jxYuiajlsUhRPo403
         yzuRvqsglu+2U49dYtdx/WddwiFpp8qUd2z0nnrAOdeKHL/MsYsMVYIfwNPgU5p5bYJn
         5/8P7Bo15WrUc0x10yFnAZcfItuMt3U/y12pTfBpVq9Lw36RSgRnPL+paqdQOeD+A9/L
         jJyKIcXEx2S2Ps34YXCLRsQhzBwRO2vTvudF6v9nGisTok4hhC137+Wmfc+CvpPAPtFt
         24C9PsVjr2q+XnGh11JMMqGlMExyt7ViRF2EY0comdZKKd4kDeWHskdwFvtHKvYp5ATe
         okCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522388; x=1744127188;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vIKjI1V1t2FTxepIuuZaGA4R4FaYVcgDVUe45kanUdQ=;
        b=jRPyZjX2PpVwR3TMc+6wb0CL7Lhlw4e1tfTKIRLqL2D4z8E6wb0jT03zlQihKWVEYj
         lSo9m1UZE3K56R9ACgqO1aT+Tu0khljvLXIZ4r1H4/pMX9Uizt7JTCXAQJ63q45aMVrC
         FhGxHWxEQvJOrOBI+siHwoFN45BkFyHmmQ++UwjTx4SqNCFAsnO5cFofDVE5+21h8jEL
         grmCzSDBJxcSYCO+vh4xUman7aPovAw+vBuOmQqsYH7WZosZPiYgTASTYSONS2fOfswP
         ZNCGjKX+qxQHU44s2mGXVRj3pup9g2BiznTjMP17tC0WyB5AqWxTdo6ND72dEuZTXcCb
         paPg==
X-Forwarded-Encrypted: i=1; AJvYcCX71ibs3IQPjKli/oM9i/CWjN5poVzz5iDQ5xgRWZ4uqf/wdcutV7/mpMSK/EG0py1MDEJbyJWjYVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkfhxtZQGYM9WKtgx9DPkstuxI4wJCvNyhUGAt174YT4M/LMmR
	jDi8xZ1eDDqrTRYxMtrr46EPUel+VgBsyttZoXH7o7Boz8uPLmTL
X-Gm-Gg: ASbGncuo50dlgDnhcYDp/nbZRk3EYeDu583kgDY0dZXV4HlisF8K1779do/frAutzOM
	MLh4RucDzEk0Webaq1g3dG8VPVvQIfUfVNvAmv17D0YH3CojY9XlUv5tq+C8gnDWkPVNc9qMAfK
	alaTl78hQBn/HDnWjlvNHZBKYRZdBFixglN188M5iB5yEoUGy7z3zz3uyk3/6wFgSClHDBkXwSE
	7K3HGgoGKMGe5V03rwrcqjdzESYiw5/kEE6TGg0rQu+97QjXYuGDpGAOVyUfM56DgqiR2FnctBs
	NypWcs30GJ3oN3zKxYYDveeHncuB/yHZi2O+qxGzrCOzRM1I8tPuPG8n4U4K4d8vG4JhHI/lEaX
	C5z+hhsyN8JLxImRIwA9h
X-Google-Smtp-Source: AGHT+IGswNjWHPim6Ff1BZlJg9zBC287liKJLXY/6h9+2XymHc1KQz4Oqb+Z9Ay2TVOm2eEuWXOXYg==
X-Received: by 2002:a05:6402:320e:b0:5ee:497:91f0 with SMTP id 4fb4d7f45d1cf-5ee049794d5mr11889465a12.34.1743522387498;
        Tue, 01 Apr 2025 08:46:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UOzkySSbTXraRu17i4Ezn956"
Message-ID: <ceec6a5b-89ba-45a9-a023-08f07bcce614@gmail.com>
Date: Tue, 1 Apr 2025 17:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <6f0efa9a-876e-4ae1-9367-ccd89f51bab0@xen.org>
 <c8a786f0-cc78-41f4-8323-dabde70a7c91@suse.com>
 <33786f0b-eefa-4f1f-ac57-7f1b2c74715e@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <33786f0b-eefa-4f1f-ac57-7f1b2c74715e@xen.org>

This is a multi-part message in MIME format.
--------------UOzkySSbTXraRu17i4Ezn956
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/1/25 1:59 PM, Julien Grall wrote:
>
>
> On 01/04/2025 07:24, Jan Beulich wrote:
>> On 31.03.2025 18:17, Julien Grall wrote:
>>> On 31/03/2025 17:14, Jan Beulich wrote:
>>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>>> A randconfig job failed with the following issue:
>>>>>     riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
>>>>>
>>>>> The reason is that enabling the UBSAN config increased the size of
>>>>> the Xen binary.
>>>>>
>>>>> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
>>>>> and GCOV to be enabled together, with some slack for future growth.
>>>>
>>>> At some point you may want to use 2M mappings for .text (rx), .rodata
>>>> (r), and .data (rw).
>>>
>>> OOI, why would we want to switch to 2MB? At least on Arm, Xen is tiny
>>> enough that it can fit in less than a couple of MB. I would expect the
>>> same for RISC-V.
>>
>> For TLB efficiency reasons for example. On x86 we switched to using 2Mb
>> pages quite some time back, just to find that (at least) one of the
>> bootloaders choked on the then larger binary. Hence we ended up with
>> the XEN_ALIGN_2M Kconfig symbol plus the unconditional use of 2Mb
>> mappings for xen.efi. For the original change see cf393624eec3 ("x86:
>> use 2M superpages for text/data/bss mappings").
>
> For Arm, we can using the contiguous bit (it allows to combine a few 
> entries into one TLB on some CPUs) to reduce the TLB usage. Not sure 
> if RISC-V has a similar feature.

Unfortunately, RISC-V doesn't have such option.

~ Oleksii

--------------UOzkySSbTXraRu17i4Ezn956
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
    <div class="moz-cite-prefix">On 4/1/25 1:59 PM, Julien Grall wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:33786f0b-eefa-4f1f-ac57-7f1b2c74715e@xen.org">
      <br>
      <br>
      On 01/04/2025 07:24, Jan Beulich wrote:
      <br>
      <blockquote type="cite">On 31.03.2025 18:17, Julien Grall wrote:
        <br>
        <blockquote type="cite">On 31/03/2025 17:14, Jan Beulich wrote:
          <br>
          <blockquote type="cite">On 31.03.2025 17:20, Oleksii Kurochko
            wrote:
            <br>
            <blockquote type="cite">A randconfig job failed with the
              following issue:
              <br>
                  riscv64-linux-gnu-ld: Xen too large for early-boot
              assumptions
              <br>
              <br>
              The reason is that enabling the UBSAN config increased the
              size of
              <br>
              the Xen binary.
              <br>
              <br>
              Increase XEN_VIRT_SIZE to reserve enough space, allowing
              both UBSAN
              <br>
              and GCOV to be enabled together, with some slack for
              future growth.
              <br>
            </blockquote>
            <br>
            At some point you may want to use 2M mappings for .text
            (rx), .rodata
            <br>
            (r), and .data (rw).
            <br>
          </blockquote>
          <br>
          OOI, why would we want to switch to 2MB? At least on Arm, Xen
          is tiny
          <br>
          enough that it can fit in less than a couple of MB. I would
          expect the
          <br>
          same for RISC-V.
          <br>
        </blockquote>
        <br>
        For TLB efficiency reasons for example. On x86 we switched to
        using 2Mb
        <br>
        pages quite some time back, just to find that (at least) one of
        the
        <br>
        bootloaders choked on the then larger binary. Hence we ended up
        with
        <br>
        the XEN_ALIGN_2M Kconfig symbol plus the unconditional use of
        2Mb
        <br>
        mappings for xen.efi. For the original change see cf393624eec3
        ("x86:
        <br>
        use 2M superpages for text/data/bss mappings").
        <br>
      </blockquote>
      <br>
      For Arm, we can using the contiguous bit (it allows to combine a
      few entries into one TLB on some CPUs) to reduce the TLB usage.
      Not sure if RISC-V has a similar feature.
      <br>
    </blockquote>
    <pre>Unfortunately, RISC-V doesn't have such option.

~ Oleksii
</pre>
  </body>
</html>

--------------UOzkySSbTXraRu17i4Ezn956--

