Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597AA8B710
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955507.1349274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50Fx-0008WB-Dn; Wed, 16 Apr 2025 10:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955507.1349274; Wed, 16 Apr 2025 10:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50Fx-0008Tv-9u; Wed, 16 Apr 2025 10:44:37 +0000
Received: by outflank-mailman (input) for mailman id 955507;
 Wed, 16 Apr 2025 10:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Wc4=XC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u50Fv-0008AX-55
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:44:35 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ab88dd-1aaf-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 12:44:33 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so113106566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 03:44:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3cdeb945sm105911866b.60.2025.04.16.03.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 03:44:32 -0700 (PDT)
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
X-Inumbo-ID: c8ab88dd-1aaf-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800273; x=1745405073; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf5fGqqQW2KSpra+Xe2WS3mkPYEaHqVkXqmbMy6oOAw=;
        b=BcoigL+gikHqVCuRFiUI4JvM0RYs2MmwP3QpA0KrQADZEkLUVHzHQAE1llzs3FNNyG
         TmqRgQiEJqoYNT5j3Um0BM3YZTsVt71ltVqiP7TFEKqee4OFKEzvpP/ycwknRdTsEY9j
         hKqJ0I75U7f82kP6HvC9shCuEFaLcVsm4c8FEnYNtWKs5VJ8ApU3YZMIPaQRmvSCrnoX
         If2oLJKrfvxKM0E118ypvCPxM/EZnuNyjpFX7b8Rk/eBAtQiVoorM4cP3r5frLWZYkSA
         rWoyCT9nYSovWZDWyALd2wY59/waTKqKBYoA/Ma3A/0DXiqsjfZ10bBBAk/EuyZHzlzK
         npyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800273; x=1745405073;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yf5fGqqQW2KSpra+Xe2WS3mkPYEaHqVkXqmbMy6oOAw=;
        b=P7drOmX4nKenCnayxQYT+MZbpSE6wUGHS6thK9akspC/wzgtV8wfc5ZwjuMAefP/D0
         3owgL2KRcql41x58RVcYV3j2S0aWhFF3J9R8dbcG6wl00c8V7bRbaqlXzJUUEIR5v49D
         tEg1y7rUUfd9HXlX1nu/Nv7Sgw8Sitcp/zCmxPYZczByGWNyiOHMF3DBtrDnOg3E4PBe
         4lFwaNTrRgETpX63Ch0SKJq6IEPqN3dkGOhfF9XpuhyThIRpRwPSM3BpxVCdjX5M+Ka7
         Dfjq0tSGwHiUS0HnvBOsaFo+x49vfWFI3eVDIfdUDX1F2WXNZMnkBYG1g9qA3uCwu8o5
         U+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBv0or3GXGMxumfpN6xTCM2ZhxtYNBE6vYYXIdhiuiGGm2ETH/Kbvs4VxYnOsm1dwEHjOGanMArM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqEoLrB9FKLU/87zL90Ctt4LTVBG/kRoR6w3E1QYonAe9/BZEb
	dA2SaaGDFAr44itTg1DiaN1HEIXepVdB0vKQQtHFNg9fQansumUb
X-Gm-Gg: ASbGnctYdB9eEwvnmhbG1xN6PExtGzvVxJ+DqUbACHcVWSMZkTl2ilMPfhY2Bpu+gd0
	TvacskOQjcnFvziec+EXsgzmNzR6deYuuybqYtZ+gb3EB6q6cVWcy8a7AKvXjuEXRlx/set71PJ
	/AJrXYuq4nWbL72oFwJhExKrIWHXOXobQx0Pw+cBRhsFuk0wKy0o9VFIwbge6tjqi4qzg12hCj1
	EiRbSj/ZYdQxlui6iwpSHz4STYj8YGMAxh/Ja1o4I6XOxJuCccsMqmiSyzX2lPavK00BriCelkS
	8kPP/5BHItzz8zERZVQVS4LtrBgDHY6KGCPvif2gnSVjDsCS5lQLxRPmgCOBTdIhxnYG2S/UoTD
	olBD4vERV10lvs+hr
X-Google-Smtp-Source: AGHT+IFKAEHXTdF42MuznV0H4bfI6Iy5j/NpBLTwyM8hVYTlOyHCWaMkFgKcwiGRZbxr2pOhx3IeRQ==
X-Received: by 2002:a17:907:9495:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-acb429434b2mr98335666b.26.1744800273101;
        Wed, 16 Apr 2025 03:44:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------J0EC1aZNiqfll1WqQ1c0czu7"
Message-ID: <91856640-1b82-4440-8a45-de56ffb57e71@gmail.com>
Date: Wed, 16 Apr 2025 12:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: Increase XEN_VIRT_SIZE
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0815b65aa0b526b85c737f5923148b119cc4104f.1744639515.git.oleksii.kurochko@gmail.com>
 <6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com>

This is a multi-part message in MIME format.
--------------J0EC1aZNiqfll1WqQ1c0czu7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/15/25 12:07 PM, Jan Beulich wrote:
> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/mm.c
>> +++ b/xen/arch/riscv/mm.c
>> @@ -31,20 +31,30 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>   
>>   /*
>> - * It is expected that Xen won't be more then 2 MB.
>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE.
>>    * The check in xen.lds.S guarantees that.
>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>    *
>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>> + * Root page table is shared with the initial mapping and is declared
>> + * separately. (look at stage1_pgtbl_root)
>>    *
>> - * It might be needed one more page table in case when Xen load address
>> - * isn't 2 MB aligned.
>> + * An amount of page tables between root page table and L0 page table
>> + * (in the case of Sv39 it covers L1 table):
>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>> + *   the same amount are needed for Xen.
>>    *
>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>> - * except that the root page table is shared with the initial mapping
>> + * An amount of L0 page tables:
>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>> + *   one L0 is needed for identity mapping.
>>    */
>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
>> +                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)) + 1)
> I'm still struggling here. In the original expression, the +1 was to cover
> the root page table, wasn't it?

|+1| was added to cover the case where the Xen address is not 2MB-aligned.

For the root page table, we use a separate variable|stage1_pgtbl_root|.
Since the root page table is shared with the identity mapping, it is not
included in|PGTBL_INITIAL_COUNT|.

> By now subtracting 2 from
> CONFIG_PAGING_LEVELS, you reduce the overall result by 2. One of these two
> is accounted for by the Xen size calculation now. Where's the other one?
> Or are you suggesting that for some (not obvious to me) reason we
> previously calculated one too many?

My calculation was as follows:
  *[a]* One shared root page table is needed for both the identity mapping and Xen itself.
  *[b]* |(CONFIG_PAGING_LEVELS - 2)| page tables are needed for identity mapping and Xen.
      The|-2| accounts for:
      - No extra root page table (since we use a separate variable for it).
      - No extra L0 page table (as those will be calculated separately in the next step).
   *[c]* We also need|(XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1))| L0s to cover Xen itself,
       plus one additional L0 page table for the identity mapping.

It might be better to calculate the total in the following way:
  ((CONFIG_PAGING_LEVELS - 1) * 2 + (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)) - 1)

Here’s the reasoning:
   -|(CONFIG_PAGING_LEVELS - 1)| excludes the root page table (provided separately via
|||stage1_pgtbl_root|), but we add back:
       - One L0 for Xen,
       - One L0 for the identity mapping.
Since the L0 used for identity mapping is now implicitly part of|(CONFIG_PAGING_LEVELS - 1)|,
we can drop the|+1| from|PGTBL_INITIAL_COUNT|.
Additionally, we need to subtract|1|, because changing from|(CONFIG_PAGING_LEVELS - 2)| to
|(CONFIG_PAGING_LEVELS - 1)| adds one extra L0 for Xen itself too.

Does it make sense?

>
>> +/* Changing these checks can require an update of PGTBL_INITIAL_COUNT */
>> +_Static_assert(IS_ALIGNED(XEN_VIRT_START, GB(1)),
>> +               "XEN_VIRT_START should be 1gb aligned");
>> +_Static_assert(IS_ALIGNED(XEN_VIRT_SIZE, MB(2)),
>> +               "XEN_VIRT_SIZE should be 2mb aligned");
> Why would you need to open-code BUILD_BUG_ON() here? See the various
> build_assertions() functions we've accumulated.

I missed build_assertions() functions. I will do in a similar way.

Thanks.

~ Oleksii

--------------J0EC1aZNiqfll1WqQ1c0czu7
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
    <div class="moz-cite-prefix">On 4/15/25 12:07 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 14.04.2025 17:56, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,30 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then XEN_VIRT_SIZE.
  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
- * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Root page table is shared with the initial mapping and is declared
+ * separately. (look at stage1_pgtbl_root)
  *
- * It might be needed one more page table in case when Xen load address
- * isn't 2 MB aligned.
+ * An amount of page tables between root page table and L0 page table
+ * (in the case of Sv39 it covers L1 table):
+ *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
+ *   the same amount are needed for Xen.
  *
- * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
- * except that the root page table is shared with the initial mapping
+ * An amount of L0 page tables:
+ *   (512 entries of one L0 page table covers 2MB == 1&lt;&lt;XEN_PT_LEVEL_SHIFT(1))
+ *   XEN_VIRT_SIZE &gt;&gt; XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
+ *   one L0 is needed for identity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
+                             (XEN_VIRT_SIZE &gt;&gt; XEN_PT_LEVEL_SHIFT(1)) + 1)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm still struggling here. In the original expression, the +1 was to cover
the root page table, wasn't it? </pre>
    </blockquote>
    <pre><code data-start="65" data-end="69">+1</code> was added to cover the case where the Xen address is not 2MB-aligned.

For the root page table, we use a separate variable <code
    data-start="199" data-end="218">stage1_pgtbl_root</code>.
Since the root page table is shared with the identity mapping, it is not
included in <code data-start="305" data-end="326">PGTBL_INITIAL_COUNT</code>.

</pre>
    <blockquote type="cite"
      cite="mid:6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com">
      <pre wrap="" class="moz-quote-pre">By now subtracting 2 from
CONFIG_PAGING_LEVELS, you reduce the overall result by 2. One of these two
is accounted for by the Xen size calculation now. Where's the other one?
Or are you suggesting that for some (not obvious to me) reason we
previously calculated one too many?</pre>
    </blockquote>
    <pre data-start="143" data-end="173" class="">My calculation was as follows:
 <strong data-start="175" data-end="182">[a]</strong> One shared root page table is needed for both the identity mapping and Xen itself.
 <strong data-start="267" data-end="274">[b]</strong> <code
    data-start="275" data-end="303">(CONFIG_PAGING_LEVELS - 2)</code> page tables are needed for identity mapping and Xen.
     The <code data-start="361" data-end="365">-2</code> accounts for:
     - No extra root page table (since we use a separate variable for it).
     - No extra L0 page table (as those will be calculated separately in the next step).
  <strong data-start="535" data-end="542">[c]</strong> We also need <code
    data-start="556" data-end="598">(XEN_VIRT_SIZE &gt;&gt; XEN_PT_LEVEL_SHIFT(1))</code> L0s to cover Xen itself,
      plus one additional L0 page table for the identity mapping.</pre>
    <pre data-start="685" data-end="748" class="">It might be better to calculate the total in the following way:
 ((CONFIG_PAGING_LEVELS - 1) * 2 + (XEN_VIRT_SIZE &gt;&gt; XEN_PT_LEVEL_SHIFT(1)) - 1)

Here’s the reasoning:
  - <code data-start="865" data-end="893">(CONFIG_PAGING_LEVELS - 1)</code> excludes the root page table (provided separately via
<code>    </code><code data-start="948" data-end="967">stage1_pgtbl_root</code>), but we add back:
      - One L0 for Xen,
      - One L0 for the identity mapping.
Since the L0 used for identity mapping is now implicitly part of <code
    data-start="1114" data-end="1142">(CONFIG_PAGING_LEVELS - 1)</code>,
we can drop the <code data-start="1160" data-end="1164">+1</code> from <code
    data-start="1170" data-end="1191">PGTBL_INITIAL_COUNT</code>.
Additionally, we need to subtract <code data-start="1228"
    data-end="1231">1</code>, because changing from <code
    data-start="1255" data-end="1283">(CONFIG_PAGING_LEVELS - 2)</code> to
<code data-start="1287" data-end="1315">(CONFIG_PAGING_LEVELS - 1)</code> adds one extra L0 for Xen itself too.

Does it make sense?

</pre>
    <blockquote type="cite"
      cite="mid:6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Changing these checks can require an update of PGTBL_INITIAL_COUNT */
+_Static_assert(IS_ALIGNED(XEN_VIRT_START, GB(1)),
+               "XEN_VIRT_START should be 1gb aligned");
+_Static_assert(IS_ALIGNED(XEN_VIRT_SIZE, MB(2)),
+               "XEN_VIRT_SIZE should be 2mb aligned");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why would you need to open-code BUILD_BUG_ON() here? See the various
build_assertions() functions we've accumulated.</pre>
    </blockquote>
    <pre>I missed build_assertions() functions. I will do in a similar way.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------J0EC1aZNiqfll1WqQ1c0czu7--

