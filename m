Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747AA820B1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 11:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943659.1342332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ROG-0007l6-SV; Wed, 09 Apr 2025 09:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943659.1342332; Wed, 09 Apr 2025 09:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ROG-0007jV-PI; Wed, 09 Apr 2025 09:06:36 +0000
Received: by outflank-mailman (input) for mailman id 943659;
 Wed, 09 Apr 2025 09:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLOg=W3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2ROF-0007jP-UZ
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 09:06:36 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee82b6d1-1521-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 11:06:32 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so102443066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 02:06:33 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bee20asm60870866b.73.2025.04.09.02.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 02:06:31 -0700 (PDT)
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
X-Inumbo-ID: ee82b6d1-1521-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744189593; x=1744794393; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSFfbL2L6mXYxrY/TGHW3ERtOMRqs8QMomzKjfXajuo=;
        b=aMrtjWiB2ijp94zDsz9xlfEjbsFyAyRtAlGWxU738vZJXsTLVFaXuoi528W0emBxb8
         KmD2Zd30Ns4hmm+daXCRNJj6u9bnXTisKIeiAabYH+7vnVohcV+KJkSHdCxNu44p0ySB
         k5hnVFXzwAlWkKbUnNuEEFKR3OVydtgX9hVGm/Xo4UsSP2OM5dxDKhNLaM8b5xtEY2fZ
         10bedvibWijzeT3wzdaIijRO6w/u1Vbwnlf7Z3n72D9MRKQHnjEyq66pVTPlLZHfoHIH
         Ym93XICm6JtRZ0IPI7Ee6MxXr6G8OFuLV51KIinFsR4pUO3TTdkexEFy0gQqUcYjSmF+
         zOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189593; x=1744794393;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSFfbL2L6mXYxrY/TGHW3ERtOMRqs8QMomzKjfXajuo=;
        b=fJOynXGNGQ9lMCfhcCZBhVMhuTBz37DhBJFhNwtIeAVlldzVirjjZHICMV42/Pe5ZS
         NAjzh418xydi9CAFbjN1UgK/ma9lWKXmn5wr/wf6IZGX5OVJMddpekZiJbI6Gk51L8N+
         YORW7iaPu/xXTTaBweb2pqGFZorAWGmq1an/gamCC84PBwyILBF1un4IsYONgp9c9Cb/
         4sovWpkzXSIEC8IjJIENtkcftUDZYdSeyvZ42zI6Cn+usnUZwvA1T6yK/jWjjZxvH2uL
         xYF4iiQEbYqRrficM+cvyQVJavIfqfmfptq7TILG3/Vkdji7ogolUsIx5J3dLVzcN4wV
         nuDg==
X-Forwarded-Encrypted: i=1; AJvYcCWdt1aTda0Q5tM85+WjnslRfaHQGJDP8XzkGoZ77PzVUuDFsmAyXVJd7evvYH2EzrJjpEtEgWTYSN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwBy8Kgz4wozY+zWX/Q9KGcT1KePDvB5LrmbELruez/0yDavTn
	lZYKqJj4IXTEvGfJ1wEuPZIc8ks5c7JKwqVRyqaKxZQRoi6FdsKN
X-Gm-Gg: ASbGncs5zMugJ/jEFXD3d8+8at8/8Y6T1hlGY0yzwjJoKRDtv/scdoGbW9JGJiHvhta
	MNnCUM0I0r0Xk+yujxLIdL2x4rfK/q/mRB6VeWErmbi/xHnm4eBpcqkUsfEqKNXCsiCAUTLudio
	oafkRt/1FIyQcZW5mJW58dWWy7mREgNqWEdxyPQ2SKhvJoHGNENtyyDmckjYkqW6fpebCQDW3hp
	x/xevG5DvlK2kR/myjG/7pwtv+knuR82TW1vTiDUmJeRZiXqcEeybcBnroIIiVG8uIu8GfRDcJo
	/Jw3VdTUeZCffvdawqhCxRMrfCKIwx2IMQ6I/gYA7RP/J/7hxGk3IrTEKzgzX+HYNfWOwI7mxwO
	g7SxGzPdx/3hRfjPHMvfMUrB2iRw=
X-Google-Smtp-Source: AGHT+IHf28Yjg8ZUP00aNbQzM8e/DV4aunjLfvCJ+4qqbtht+pmQgVoN0fdeAsaRe+67xW1AUvO/EA==
X-Received: by 2002:a17:907:c1d:b0:ac7:b494:8c0c with SMTP id a640c23a62f3a-ac81a68be24mr598161966b.16.1744189592215;
        Wed, 09 Apr 2025 02:06:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------3VbIvQuZ34doO0coDiX8W00t"
Message-ID: <3bd6cdb7-8de0-4559-bc56-b20c52fd73db@gmail.com>
Date: Wed, 9 Apr 2025 11:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: Increase XEN_VIRT_SIZE
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <808d1b346bc90dde38fd19a6b92ab78d78e42936.1743766932.git.oleksii.kurochko@gmail.com>
 <e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com>
 <f35a9969-6154-4e9a-b997-16ca135e85ee@gmail.com>
 <8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com>
 <c3b1be9a-d5f5-4cac-a675-7485a99bf51c@gmail.com>
 <fde6c1c2-c439-4020-9301-025b7e8af804@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fde6c1c2-c439-4020-9301-025b7e8af804@suse.com>

This is a multi-part message in MIME format.
--------------3VbIvQuZ34doO0coDiX8W00t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/8/25 4:04 PM, Jan Beulich wrote:
> On 08.04.2025 15:46, Oleksii Kurochko wrote:
>> On 4/8/25 2:02 PM, Jan Beulich wrote:
>>> On 08.04.2025 13:51, Oleksii Kurochko wrote:
>>>> On 4/7/25 12:09 PM, Jan Beulich wrote:
>>>>> On 04.04.2025 18:04, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>>> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>>>>      */
>>>>>>     static inline unsigned long virt_to_maddr(unsigned long va)
>>>>>>     {
>>>>>> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
>>>>>> +    const unsigned long va_vpn = va >> vpn1_shift;
>>>>>> +    const unsigned long xen_virt_start_vpn =
>>>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>>>> +    const unsigned long xen_virt_end_vpn =
>>>>>> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>>>> +
>>>>>>         if ((va >= DIRECTMAP_VIRT_START) &&
>>>>>>             (va <= DIRECTMAP_VIRT_END))
>>>>>>             return directmapoff_to_maddr(va - directmap_virt_start);
>>>>>>     
>>>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
>>>>>> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
>>>>> Not all of the range is backed by memory, and for the excess space the
>>>>> translation is therefore (likely) wrong. Which better would be caught by
>>>>> the assertion?
>>>> Backed here means that the memory is actually mapped?
>>>>
>>>> IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
>>>> where xen_phys_size=(unsigned long)_end - (unsigned long)_start.
>>>>
>>>> Did I understand you correctly?
>>> I think so, yes. Depending on what you (intend to) do to .init.* at the
>>> end of boot, that range may later also want excluding.
>> I planned to release everything between __init_begin and __init_end in the following way:
>>     destroy_xen_mappings((unsigned long)__init_begin, (unsigned long)__init_end);
>>
>> So yes, then I think I have to come up with new ASSERT, add is_init_memory_freed variable and
>> if is_init_memory_freed=true then also check that `va` isn't from .init.* range.
>>
>> But I'm not quire sure that mapping for .got* should be destroyed after the end of boot. (now it is
>> part of [__init_begin,__init_end] range.
> Isn't this a non-issue considering
>
> ASSERT(!SIZEOF(.got),      ".got non-empty")
> ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>
> near the bottom of xen.lds.S?

I forgot about that|ASSERT()|, so it's expected that|.got*| isn't used in Xen anyway.
Therefore, it shouldn't be an issue to destroy the mapping for the|[__init_begin, __init_end]| range.

>
>>>>>> --- a/xen/arch/riscv/mm.c
>>>>>> +++ b/xen/arch/riscv/mm.c
>>>>>> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>>>>>     #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>>>>     
>>>>>>     /*
>>>>>> - * It is expected that Xen won't be more then 2 MB.
>>>>>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>>>>>>      * The check in xen.lds.S guarantees that.
>>>>>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>>>>>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>>>>>      *
>>>>>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>>>>>> + * Root page table is shared with the initial mapping and is declared
>>>>>> + * separetely. (look at stage1_pgtbl_root)
>>>>>>      *
>>>>>> - * It might be needed one more page table in case when Xen load address
>>>>>> - * isn't 2 MB aligned.
>>>>>> + * An amount of page tables between root page table and L0 page table
>>>>>> + * (in the case of Sv39 it covers L1 table):
>>>>>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>>>>>> + *   the same amount are needed for Xen.
>>>>>>      *
>>>>>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>>>>>> - * except that the root page table is shared with the initial mapping
>>>>>> + * An amount of L0 page tables:
>>>>>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>>>>>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>>>>>> + *   one L0 is needed for indenity mapping.
>>>>>> + *
>>>>>> + *   It might be needed one more page table in case when Xen load
>>>>>> + *   address isn't 2 MB aligned.
>>>>> Shouldn't we guarantee that?
>>>> I think it's sufficient to guarantee 4KB alignment.
>>>>
>>>> The only real benefit I see in enforcing larger alignment is that it likely enables
>>>> the use of superpages for mapping, which would reduce TLB pressure.
>>>> But perhaps I'm missing something?
>>> No, it's indeed mainly that.
>> But then the linker address and the load address should both be aligned to a 2MB or 1GB boundary.
>> This likely isn't an issue at all, but could it be a problem if we require 1GB alignment for the
>> load address? In that case, might it be difficult for the platform to find a suitable place in
>> memory to load Xen for some reason? (I don't think so but maybe I'm missing something)
> Why would load address need to be 1Gb aligned? That (as well as 2Mb-)alignment
> matters only once you set up paging?

Mostly yes, it matters only once during paging set up.

I was thinking that if, one day, 2MB (or larger) alignment is used and the load address isn't
properly aligned, some space in a page might be lost.
(The word "should" above wasn't entirely accurate.)

But this likely isn't a big deal and can be safely ignored.

~ Oleksii


--------------3VbIvQuZ34doO0coDiX8W00t
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
    <div class="moz-cite-prefix">On 4/8/25 4:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fde6c1c2-c439-4020-9301-025b7e8af804@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 15:46, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 4/8/25 2:02 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 08.04.2025 13:51, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 4/7/25 12:09 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 04.04.2025 18:04, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
    */
   static inline unsigned long virt_to_maddr(unsigned long va)
   {
+    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
+    const unsigned long va_vpn = va &gt;&gt; vpn1_shift;
+    const unsigned long xen_virt_start_vpn =
+        _AC(XEN_VIRT_START, UL) &gt;&gt; vpn1_shift;
+    const unsigned long xen_virt_end_vpn =
+        xen_virt_start_vpn + ((XEN_VIRT_SIZE &gt;&gt; vpn1_shift) - 1);
+
       if ((va &gt;= DIRECTMAP_VIRT_START) &amp;&amp;
           (va &lt;= DIRECTMAP_VIRT_END))
           return directmapoff_to_maddr(va - directmap_virt_start);
   
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va &gt;&gt; (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) &gt;&gt; (PAGETABLE_ORDER + PAGE_SHIFT)));
+    BUILD_BUG_ON(XEN_VIRT_SIZE &gt; GB(1));
+    ASSERT((va_vpn &gt;= xen_virt_start_vpn) &amp;&amp; (va_vpn &lt;= xen_virt_end_vpn));
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Not all of the range is backed by memory, and for the excess space the
translation is therefore (likely) wrong. Which better would be caught by
the assertion?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Backed here means that the memory is actually mapped?

IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
where xen_phys_size=(unsigned long)_end - (unsigned long)_start.

Did I understand you correctly?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I think so, yes. Depending on what you (intend to) do to .init.* at the
end of boot, that range may later also want excluding.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I planned to release everything between __init_begin and __init_end in the following way:
   destroy_xen_mappings((unsigned long)__init_begin, (unsigned long)__init_end);

So yes, then I think I have to come up with new ASSERT, add is_init_memory_freed variable and
if is_init_memory_freed=true then also check that `va` isn't from .init.* range.

But I'm not quire sure that mapping for .got* should be destroyed after the end of boot. (now it is
part of [__init_begin,__init_end] range.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Isn't this a non-issue considering

ASSERT(!SIZEOF(.got),      ".got non-empty")
ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")

near the bottom of xen.lds.S?</pre>
    </blockquote>
    <pre>I forgot about that <code data-start="82" data-end="92">ASSERT()</code>, so it's expected that <code
    data-start="116" data-end="123">.got*</code> isn't used in Xen anyway.
Therefore, it shouldn't be an issue to destroy the mapping for the <code
    data-start="217" data-end="245">[__init_begin, __init_end]</code> range.
</pre>
    <blockquote type="cite"
      cite="mid:fde6c1c2-c439-4020-9301-025b7e8af804@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
   
   /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
    * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
- * One for each page level table with PAGE_SIZE = 4 Kb.
    *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Root page table is shared with the initial mapping and is declared
+ * separetely. (look at stage1_pgtbl_root)
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
+ *   one L0 is needed for indenity mapping.
+ *
+ *   It might be needed one more page table in case when Xen load
+ *   address isn't 2 MB aligned.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Shouldn't we guarantee that?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I think it's sufficient to guarantee 4KB alignment.

The only real benefit I see in enforcing larger alignment is that it likely enables
the use of superpages for mapping, which would reduce TLB pressure.
But perhaps I'm missing something?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">No, it's indeed mainly that.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
But then the linker address and the load address should both be aligned to a 2MB or 1GB boundary.
This likely isn't an issue at all, but could it be a problem if we require 1GB alignment for the
load address? In that case, might it be difficult for the platform to find a suitable place in
memory to load Xen for some reason? (I don't think so but maybe I'm missing something)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why would load address need to be 1Gb aligned? That (as well as 2Mb-)alignment
matters only once you set up paging?
</pre>
    </blockquote>
    <pre>Mostly yes, it matters only once during paging set up.

I was thinking that if, one day, 2MB (or larger) alignment is used and the load address isn't
properly aligned, some space in a page might be lost.
(The word "should" above wasn't entirely accurate.)

But this likely isn't a big deal and can be safely ignored.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------3VbIvQuZ34doO0coDiX8W00t--

