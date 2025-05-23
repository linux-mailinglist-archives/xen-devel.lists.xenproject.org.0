Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C925AC222B
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 13:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995661.1377938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIQsX-0008Ml-Sq; Fri, 23 May 2025 11:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995661.1377938; Fri, 23 May 2025 11:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIQsX-0008Je-PC; Fri, 23 May 2025 11:47:57 +0000
Received: by outflank-mailman (input) for mailman id 995661;
 Fri, 23 May 2025 11:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Zg=YH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uIQsW-0008JY-AP
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 11:47:56 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23b1cf7-37cb-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 13:47:52 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3105ef2a08dso81711781fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 04:47:52 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084caa90sm35702521fa.43.2025.05.23.04.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 04:47:51 -0700 (PDT)
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
X-Inumbo-ID: c23b1cf7-37cb-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748000872; x=1748605672; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6GYp5639k1wRrhYrb3T+vDFQxM4wMPkfHBk6H9Ink0=;
        b=D0Ok5Eh2naTBnZzcakFItsJg9F4UmSnU36raTgll140EAdfBJq6Z2jX6JVlPH7u4Un
         rpItsdS/7X9I1Q6aS/zrIZBKM8BPy2b1e0N4qf5xU6T/zgo1VXIqL0/LMljgAA32NKSK
         CZSXOvECbxpUlDwPsHmhBFj5praabHfFtY0v/IYqbVzNkCCASak3JSXOjj3ubFYZhBgB
         JHoPUIgaAZEb2THiXQ9T7Nydvtidlo4R/u8LS7lT2ll5+RNEmTrR2rJ/Wd/oSvx9z7Hs
         Jw3Aoed6z1YLLzTp8OH+fIXCEdGni8+0z2mQl+xil9s4k+ySaWlQ0brWbunb6z3nEXpk
         BXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000872; x=1748605672;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6GYp5639k1wRrhYrb3T+vDFQxM4wMPkfHBk6H9Ink0=;
        b=syp9FBj/LdjACx4k4wc52PvP2PGcm2LKGU5WQLX32IMyjf/Dlk0KqcB96FMy+BKTbz
         4+2pQuDrMwD6rAIhnXxv+xQBCItOu4K6KocPszesVXxaeSfWnKcieThzz7WBAKG8HUrw
         wIKbMf4/BiuDI4+sjmGeOJTZke/T7oFqSIqqArrnda3zmaxlrKrscRNuKXXjUKKCngJY
         R8FPkGTEF/mmj9Kr273jRR9BsCQC5DVzsVWrQT6oQCYSEAt1dFDWnh/b6aBvWZh/4sOB
         8M4XsMmn5DogwqNM1wfTvdJSIMCNzreWjNaIvdUQP6tkfUjHtguGZi3ICK5GM1Iz7XgE
         QG8w==
X-Forwarded-Encrypted: i=1; AJvYcCVEx1RhCqPeFSWLdibXvkhlEWerbJ4kQ8ORn5wPIjM2PywLKcs7LJ71NibiMiajEpei3+SFGasqT+M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFms5ms8FwaWfF/U7zA1WdrB71moB8GYOvq9vcX2kJOiJpm8Rk
	mM2TdZZQdfK1fGenFkuJm9vfDSUqUfs58b219k55NidX5WxmpwE1fz7Q
X-Gm-Gg: ASbGncuYlEvIRBNWa6uN7qv3OPYrMBvKfSDFlaEITRY9ZrAPas9XGYUIVhPGsHOJRPS
	YqkxSAFL9j9l6bXuMQUckr4C2Ud/rn6f+r8bJqRFR9LzukbYVqYKiyJepPThRzsZ1v4gx4y7Asv
	2O+UnG4hytEYu/FaE8vhtHuZt5elnoeitPWEE2ix5zXBbYo/BYXJwiotdDD+KO9H6fOE2q1PtY/
	r+x5LffurO+9v9+nojtHE7wgYqZPM1HoHCP0KSmMiK81wYp/abvU8BsDvhykcwyhSM9LCfpRlIg
	HVmEOFHjqvE5Iv7aGy/NRxB99CwxAzRDV6+dWpGxmrphjxMOl9bFMNE35UafUg7dh+E4BwtqOwZ
	5Sj6V3eRsEXpwOH2X3OyUIiRJWAP/GOXAgMA=
X-Google-Smtp-Source: AGHT+IG19HrYp4DTtFLsYl8KAJfQ1k6OQaPVubRcmjzn2rNzWs/LFdBxiFj/dHZQ+8veSym8KOv6hA==
X-Received: by 2002:a2e:ae10:0:b0:328:d9f:5ae7 with SMTP id 38308e7fff4ca-32950b95cffmr5897261fa.23.1748000871636;
        Fri, 23 May 2025 04:47:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------CzanOoIozGJjy35Mu0ppKWop"
Message-ID: <e877a21d-a5f1-4988-8082-cb87d914e2b8@gmail.com>
Date: Fri, 23 May 2025 13:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: implement p2m mapping functionality
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <c6324b268bf985e8a5e7254a4b181842a860dd94.1746805907.git.oleksii.kurochko@gmail.com>
 <701620bf-b76f-4f21-8703-4a6d172eb812@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <701620bf-b76f-4f21-8703-4a6d172eb812@suse.com>

This is a multi-part message in MIME format.
--------------CzanOoIozGJjy35Mu0ppKWop
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/25 5:16 PM, Jan Beulich wrote:
> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>> These utilities are needed for building and managing RISC-V guest page
>> tables and MMIO mappings by using functions map_regions_p2mt() and
>> guest_physmap_add_entry().
>>
>> To implement p2m mapping functionality the following is introduced:
>> - Define P2M root level/order and entry count.
>> - Introdude radix type for p2m types as it isn't enough free bits in pte
>>    and the helpers (p2m_type_radix_{get,set}()) to deal with them.
>> - Introduce p2m_is_*() helpers() as  pte_is_*() helpers are checking
>>    the valid bit set in the PTE but we have to check p2m_type instead
>>    (look at the comment above p2m_is_valid() for some details).
> May I suggest to name them at least p2me_is_*() then, as they check entries
> rather than entire P2Ms? Same perhaps elsewhere.

Sure, I will handle that during a work on v2.

>
>> - Introduce helper to set p2m's pte permission: p2m_set_permissions().
>> - Introduce helper to create p2m entry based on mfn, p2m_type_t and
>>    p2m_access_t.
>> - Introduce helper to generate table entry with correct attributes:
>>    page_to_p2m_table().
>> - Introduce p2m page allocation function: p2m_alloc_page().
>> - Introduce functions to write/remove p2m's entries: p2m_{write,remove}_pte().
>> - Introduce function to allocate p2m table: p2m_create_table().
>> - Introduce functions used to free p2m entry.
>> - Introduce function for table walking: p2m_next_level().
>> - Introduce function to insert an entry in the p2m (p2m_set_entry()).
>> - Introduce superpage splitting: p2m_split_superpage()).
>> - Introduce page table type defines (PGT_{none,writable_page}, etc).
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/riscv/include/asm/mm.h   |  32 +-
>>   xen/arch/riscv/include/asm/p2m.h  |  17 +-
>>   xen/arch/riscv/include/asm/page.h |  11 +
>>   xen/arch/riscv/p2m.c              | 780 ++++++++++++++++++++++++++++++
>>   4 files changed, 829 insertions(+), 11 deletions(-)
> It's imo too many things you do in one go here.

I will split to smaller patches.

Thanks.

~ Oleksii


--------------CzanOoIozGJjy35Mu0ppKWop
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
    <div class="moz-cite-prefix">On 5/20/25 5:16 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:701620bf-b76f-4f21-8703-4a6d172eb812@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">These utilities are needed for building and managing RISC-V guest page
tables and MMIO mappings by using functions map_regions_p2mt() and
guest_physmap_add_entry().

To implement p2m mapping functionality the following is introduced:
- Define P2M root level/order and entry count.
- Introdude radix type for p2m types as it isn't enough free bits in pte
  and the helpers (p2m_type_radix_{get,set}()) to deal with them.
- Introduce p2m_is_*() helpers() as  pte_is_*() helpers are checking
  the valid bit set in the PTE but we have to check p2m_type instead
  (look at the comment above p2m_is_valid() for some details).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
May I suggest to name them at least p2me_is_*() then, as they check entries
rather than entire P2Ms? Same perhaps elsewhere.</pre>
    </blockquote>
    <pre>Sure, I will handle that during a work on v2.

</pre>
    <blockquote type="cite"
      cite="mid:701620bf-b76f-4f21-8703-4a6d172eb812@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">- Introduce helper to set p2m's pte permission: p2m_set_permissions().
- Introduce helper to create p2m entry based on mfn, p2m_type_t and
  p2m_access_t.
- Introduce helper to generate table entry with correct attributes:
  page_to_p2m_table().
- Introduce p2m page allocation function: p2m_alloc_page().
- Introduce functions to write/remove p2m's entries: p2m_{write,remove}_pte().
- Introduce function to allocate p2m table: p2m_create_table().
- Introduce functions used to free p2m entry.
- Introduce function for table walking: p2m_next_level().
- Introduce function to insert an entry in the p2m (p2m_set_entry()).
- Introduce superpage splitting: p2m_split_superpage()).
- Introduce page table type defines (PGT_{none,writable_page}, etc).

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 xen/arch/riscv/include/asm/mm.h   |  32 +-
 xen/arch/riscv/include/asm/p2m.h  |  17 +-
 xen/arch/riscv/include/asm/page.h |  11 +
 xen/arch/riscv/p2m.c              | 780 ++++++++++++++++++++++++++++++
 4 files changed, 829 insertions(+), 11 deletions(-)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It's imo too many things you do in one go here.</pre>
    </blockquote>
    <pre>I will split to smaller patches.

Thanks.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------CzanOoIozGJjy35Mu0ppKWop--

