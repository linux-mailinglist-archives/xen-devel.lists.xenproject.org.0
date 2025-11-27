Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A380C8D96A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173647.1498665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYTH-0001eG-K3; Thu, 27 Nov 2025 09:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173647.1498665; Thu, 27 Nov 2025 09:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYTH-0001bt-HI; Thu, 27 Nov 2025 09:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1173647;
 Thu, 27 Nov 2025 09:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOYTF-0001bn-Ot
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:39:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4893f83-cb74-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 10:39:23 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b7291af7190so104644866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:39:22 -0800 (PST)
Received: from [192.168.1.17] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f51721b6sm117039266b.5.2025.11.27.01.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:39:21 -0800 (PST)
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
X-Inumbo-ID: f4893f83-cb74-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236362; x=1764841162; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yVMVRAiVG/hWWcMT5pD3VgwNRv8cRoyXGSfp8S9PR0=;
        b=mxk6eKvc1DxgpPgqki2z1cid8g/tjZImPJ9GZP18aZ/2PSaCKYu1qBJVCYYO9aHCCr
         hOWXU4WswDaHBiVo+lefia+Mzgeb641TLRPxMsPld44EyaDEwNgZUKHxsiwQqD7UBrPu
         fI6S4o9nfOlWKJPmxbqp0yAmHtsntMP78hD/GPxA1QeTAqWqJ1w/6zPZOmed+8IrrsWU
         Nr+uE9MOpND7oZ14z8soXg847gkdJu3fkkyLbFxE4e1qRVPfjkcPh3/36gYBa++hpVZs
         Wa8yhyduRdkKbUY4BNSQFdhSqAXNsbG9jHkjBvT9hSE3AvPJjlVxJ4sAfPXv+QetLNfx
         DYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236362; x=1764841162;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yVMVRAiVG/hWWcMT5pD3VgwNRv8cRoyXGSfp8S9PR0=;
        b=SVomzOW/f8x0vaV1q+90WNYHKuUyQ0dw7dZaX3dONSpzGx+NIkiAHTCdHIZdHB8R8v
         7rnMwTX6+R/MFS9W9OTdR/sRO2BN8wEucaTcS2Du0zcrjX6G1Sf6Ck1rKMPHtE62P2ao
         fJKHmN9uftCsJl2r0MK+9Pk5pZNp5pVX8nmYv3HhLKfj9hLSh838JNjB4Wdjft7pxAVd
         s+QWoPV5RPT2BSoFlJDtvOGt1OIGZ7CecKmnol3Dcxib5x8+PS0j7eQQWTHWP26Cw1fr
         p1PL4kFCOnJ8yXSAvSSd916/h+bbYcta6WLbu1cqBcJlbeCTEjbgRC1EWV8UljtmkJwd
         6cjA==
X-Forwarded-Encrypted: i=1; AJvYcCWrYP087rJQxujv5KYK7GpjXTYYrQ1NsoWBOP/kiBMDAAP3wJZMe4Q3aPr7ayUk9R2azAAWlqEBozY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYbEcH7UWz9NCYWCoMZLL1PMLvfjaoGkfKHDrmrzYw54Fd+2k9
	C7oxREqbzKMWjox57rSKhTie2LL/tjs+7RqMaR1TF7LhO72wPbDbBfcw
X-Gm-Gg: ASbGncvkWlsnZU54pqIjanny65mQmncXUrF2dA+ePywr+04aBKl7kXpIvjEbqrDs6O2
	WlPYSFdYxIAaYOJp0Jkpig5rZg56MZ7F+r32msipa/T1iBomXN5lehWRo/gQA1oyQf5EUSaa8l6
	XfG/SsyucOt/lHCo5OuZNgoPQySJrVe30UBh39KpEFzynz1JbilpTbWv+JcbxzeJj7MQlIY1HTN
	dKSBtF82FQQIhky5W7YfHG2RprudnJubNn0VIEdyXF10BdBXD+Ni4Xk5Y1QuZxq1qKtnUC+7h+b
	XPWr95axTovKMHpPYdZgyqjUgFPGodq3QsoNRa9bvpyZ8Tt+PKwUlprLlN/+dLLUlRCUzcCWdoM
	X0quBpNYDKpRjAKtiuTnZW33fuOe93wCI6aYsr8VMyNFnm+XfhVewDm2LKnwHWdzbD7jN/Lxe7v
	cSbDqrBogILp1O7QMm02KnTj/3O3404NtQdFFqOGSAZr/dDUgOBf9jTnaGyMyDf9Un7g==
X-Google-Smtp-Source: AGHT+IHcLaOeRlgOd/bEpK6z8xCCxplKxTL3kSSfTBX4N6xBujKWA06cSnskpvdSJoFxSpbQmqznLg==
X-Received: by 2002:a17:906:eec1:b0:b72:70e7:5b62 with SMTP id a640c23a62f3a-b7671549c62mr2323576666b.23.1764236361921;
        Thu, 27 Nov 2025 01:39:21 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------FcZCR6CkEaay57TfyIzLQ394"
Message-ID: <cea72f67-df63-4aa1-a116-efd731732c5b@gmail.com>
Date: Thu, 27 Nov 2025 10:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
 <dabea7a8-121a-4b10-ba86-2b33cbc3e3c8@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dabea7a8-121a-4b10-ba86-2b33cbc3e3c8@epam.com>

This is a multi-part message in MIME format.
--------------FcZCR6CkEaay57TfyIzLQ394
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 9:35 PM, Grygorii Strashko wrote:
>
>
> On 26.11.25 16:32, Oleksii Kurochko wrote:
>> From: Roger Pau Monne <roger.pau@citrix.com>
>>
>> Move x86's free_domain_struct() to common code since it is shared 
>> between
>> architectures.
>>
>> Move the x86 version of alloc_domain_struct() to common code as most 
>> of the
>> logic is architecture-independent. To handle the remaining architectural
>> differences, introduce arch_alloc_domain_struct_bits() for x86-specific
>> allocation requirements.
>>
>> No functional change.
>>
>> Suggested-By: Jan Beulich <jbeulich@suse.com>
>> [Introduce an arch-specific function instead of using a weak function]
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>> - CI test results: 
>> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2180836457
>> - Introduce an arch-specific function to handle differences between 
>> arch-es
>>    in domain structure allocation requirements, instead of relying on 
>> a weak
>>    function.
>> - Add Suggested-by: Jan Beulich <jbeulich@suse.com>.
>> - Move free_domain_struct() to common code.
>> - Update the commit message.
>> ---
>>   xen/arch/arm/domain.c                | 17 -----------------
>>   xen/arch/ppc/stubs.c                 | 10 ----------
>>   xen/arch/riscv/stubs.c               | 10 ----------
>>   xen/arch/x86/domain.c                | 15 ++-------------
>>   xen/arch/x86/include/asm/pv/domain.h |  3 +++
>>   xen/common/domain.c                  | 23 +++++++++++++++++++++++
>>   6 files changed, 28 insertions(+), 50 deletions(-)
>>
>
> [...]
>
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index 3a21e035f4..34a02f089e 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -463,10 +463,8 @@ void domain_cpu_policy_changed(struct domain *d)
>>       }
>>   }
>>   -struct domain *alloc_domain_struct(void)
>> +unsigned int arch_alloc_domain_struct_bits(void)
>>   {
>> -    struct domain *d;
>> -
>>       /*
>>        * Without CONFIG_BIGMEM, we pack the PDX of the domain 
>> structure into
>>        * a 32-bit field within the page_info structure. Hence the 
>> MEMF_bits()
>> @@ -492,16 +490,7 @@ struct domain *alloc_domain_struct(void)
>>                   - 1;
>>   #endif
>>   -    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
>> -    d = alloc_xenheap_pages(0, MEMF_bits(bits));
>> -    if ( d != NULL )
>> -        clear_page(d);
>> -    return d;
>> -}
>> -
>> -void free_domain_struct(struct domain *d)
>> -{
>> -    free_xenheap_page(d);
>> +    return bits;
>>   }
>>     struct vcpu *alloc_vcpu_struct(const struct domain *d)
>> diff --git a/xen/arch/x86/include/asm/pv/domain.h 
>> b/xen/arch/x86/include/asm/pv/domain.h
>> index 582d004051..6e65bc22fc 100644
>> --- a/xen/arch/x86/include/asm/pv/domain.h
>> +++ b/xen/arch/x86/include/asm/pv/domain.h
>> @@ -18,6 +18,9 @@ extern int8_t opt_pv32;
>>   # define opt_pv32 false
>>   #endif
>>   +unsigned int arch_alloc_domain_struct_bits(void);
>> +#define arch_alloc_domin_struct_bits arch_alloc_domain_struct_bits
>
> Is it intentionally placed in PV header x86/include/asm/pv/domain.h?

Oh, I missed that it is inside PV header. It should be in asm/domain.h, thanks for noticing that!

~ Oleksii

--------------FcZCR6CkEaay57TfyIzLQ394
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
    <div class="moz-cite-prefix">On 11/26/25 9:35 PM, Grygorii Strashko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dabea7a8-121a-4b10-ba86-2b33cbc3e3c8@epam.com">
      <br>
      <br>
      On 26.11.25 16:32, Oleksii Kurochko wrote:
      <br>
      <blockquote type="cite">From: Roger Pau Monne
        <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
        <br>
        <br>
        Move x86's free_domain_struct() to common code since it is
        shared between
        <br>
        architectures.
        <br>
        <br>
        Move the x86 version of alloc_domain_struct() to common code as
        most of the
        <br>
        logic is architecture-independent. To handle the remaining
        architectural
        <br>
        differences, introduce arch_alloc_domain_struct_bits() for
        x86-specific
        <br>
        allocation requirements.
        <br>
        <br>
        No functional change.
        <br>
        <br>
        Suggested-By: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
        <br>
        [Introduce an arch-specific function instead of using a weak
        function]
        <br>
        Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
        <br>
        Signed-off-by: Oleksii Kurochko
        <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
        <br>
        ---
        <br>
        Changes in v2:
        <br>
        - CI test results:
        <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2180836457">https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2180836457</a>
        <br>
        - Introduce an arch-specific function to handle differences
        between arch-es
        <br>
           in domain structure allocation requirements, instead of
        relying on a weak
        <br>
           function.
        <br>
        - Add Suggested-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>.
        <br>
        - Move free_domain_struct() to common code.
        <br>
        - Update the commit message.
        <br>
        ---
        <br>
          xen/arch/arm/domain.c                | 17 -----------------
        <br>
          xen/arch/ppc/stubs.c                 | 10 ----------
        <br>
          xen/arch/riscv/stubs.c               | 10 ----------
        <br>
          xen/arch/x86/domain.c                | 15 ++-------------
        <br>
          xen/arch/x86/include/asm/pv/domain.h |  3 +++
        <br>
          xen/common/domain.c                  | 23
        +++++++++++++++++++++++
        <br>
          6 files changed, 28 insertions(+), 50 deletions(-)
        <br>
        <br>
      </blockquote>
      <br>
      [...]
      <br>
      <br>
      <blockquote type="cite">diff --git a/xen/arch/x86/domain.c
        b/xen/arch/x86/domain.c
        <br>
        index 3a21e035f4..34a02f089e 100644
        <br>
        --- a/xen/arch/x86/domain.c
        <br>
        +++ b/xen/arch/x86/domain.c
        <br>
        @@ -463,10 +463,8 @@ void domain_cpu_policy_changed(struct
        domain *d)
        <br>
              }
        <br>
          }
        <br>
          -struct domain *alloc_domain_struct(void)
        <br>
        +unsigned int arch_alloc_domain_struct_bits(void)
        <br>
          {
        <br>
        -    struct domain *d;
        <br>
        -
        <br>
              /*
        <br>
               * Without CONFIG_BIGMEM, we pack the PDX of the domain
        structure into
        <br>
               * a 32-bit field within the page_info structure. Hence
        the MEMF_bits()
        <br>
        @@ -492,16 +490,7 @@ struct domain *alloc_domain_struct(void)
        <br>
                          - 1;
        <br>
          #endif
        <br>
          -    BUILD_BUG_ON(sizeof(*d) &gt; PAGE_SIZE);
        <br>
        -    d = alloc_xenheap_pages(0, MEMF_bits(bits));
        <br>
        -    if ( d != NULL )
        <br>
        -        clear_page(d);
        <br>
        -    return d;
        <br>
        -}
        <br>
        -
        <br>
        -void free_domain_struct(struct domain *d)
        <br>
        -{
        <br>
        -    free_xenheap_page(d);
        <br>
        +    return bits;
        <br>
          }
        <br>
            struct vcpu *alloc_vcpu_struct(const struct domain *d)
        <br>
        diff --git a/xen/arch/x86/include/asm/pv/domain.h
        b/xen/arch/x86/include/asm/pv/domain.h
        <br>
        index 582d004051..6e65bc22fc 100644
        <br>
        --- a/xen/arch/x86/include/asm/pv/domain.h
        <br>
        +++ b/xen/arch/x86/include/asm/pv/domain.h
        <br>
        @@ -18,6 +18,9 @@ extern int8_t opt_pv32;
        <br>
          # define opt_pv32 false
        <br>
          #endif
        <br>
          +unsigned int arch_alloc_domain_struct_bits(void);
        <br>
        +#define arch_alloc_domin_struct_bits
        arch_alloc_domain_struct_bits
        <br>
      </blockquote>
      <br>
      Is it intentionally placed in PV header
      x86/include/asm/pv/domain.h? <br>
    </blockquote>
    <pre>Oh, I missed that it is inside PV header. It should be in asm/domain.h, thanks for noticing that!

~ Oleksii</pre>
    <pre>
</pre>
  </body>
</html>

--------------FcZCR6CkEaay57TfyIzLQ394--

