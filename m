Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394ACA80CC2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942160.1341422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29HC-00031T-Bz; Tue, 08 Apr 2025 13:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942160.1341422; Tue, 08 Apr 2025 13:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29HC-000300-99; Tue, 08 Apr 2025 13:46:06 +0000
Received: by outflank-mailman (input) for mailman id 942160;
 Tue, 08 Apr 2025 13:46:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u29HB-0002zu-1U
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:46:05 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf9eb2d6-147f-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 15:46:02 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso8656957a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 06:46:02 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c0185726sm908930666b.137.2025.04.08.06.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 06:46:01 -0700 (PDT)
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
X-Inumbo-ID: cf9eb2d6-147f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119962; x=1744724762; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atE7JgGo/K0tbOC7QuthhawOjaJgontp98STjwk8QFc=;
        b=eqlqnu0QSFErWJRE5z7v84eUPJighnQmzb3hrP+PQg5FHsRJF0I2ZXw0MfL1r6Y//o
         yROWH3FoMMn0rD2UAXk8SluF/7grSTofAme/L3Vc++tOnTvdjRCqfOpmgRSSFevJcbi5
         VUtD/KMExVFGMXVP7Z3CMh1zDJDZ65fdxHUN8QNqhVrbhocm7KP0PNOiUQC/cdn4blI5
         jV2Oq0BMUiFDszQ+9qJpum7Rd2Zo1xPB/P/AOAiHm1yzMJLt+hF94RQ0WY1dqxX04cbm
         Zg0LkuUcMYL2xJOkjdvlF2Xxv2ptdC2aPQ8xaK8/HBqcGzFP++coJgJs78kwVT9iuLoM
         OIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119962; x=1744724762;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=atE7JgGo/K0tbOC7QuthhawOjaJgontp98STjwk8QFc=;
        b=IwyQtSH0b5Sd3x3AWBJmbCVJHLvO5s9WJgK5SxHZBjuo7FIyHRtEvdJiKjTfrVq78w
         iqt165n9KxL/7lRqYYD4T1UNYFRosMzpbKmNUInFqLCsSl6TwDHV0E7WUCuP7QfM4aze
         wrkuJVMxYwihSTZ3qJ4LsDe86XUbmF32PY6LfIAtjCC5LPh2QmB6VkUYa6LSg+edNAno
         CKagTQxpUdYPJBAWl9Tfp605RBCqrVdvq1yqU9bQj7z0uFj4OJeKwCmHoBE5spdWIpgM
         91TD4hNVvABB3D64NXY8TJzXtbLb59xthrCAI3F2DWQDZ+goGFawiIVrUmxzHhhkTMR9
         FPzg==
X-Forwarded-Encrypted: i=1; AJvYcCWjlk7qQuzwZ8Qb7LwJ3LXI01k7MaHIuJWcaEJw9vItrfaZYbRBSnA8dBOcky/OITNVFfl+oKqX+H0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG66IZk3FmWbpYeQ+3MPOIavOPvFU2+QkWdg07PigmxJVtvFa+
	ojlaN1PXzzScEfD2Ww3mN02U5WbaU19HJaz7nfBIdV6/76VvgwYI
X-Gm-Gg: ASbGnctmbU1/EPvjMPzT3/i+ntnlY+n40Y/GS/Z3cMpYkAv7ko2kArt7TukRTlhr447
	HhikJS8Au/6qNYv8NUn/jpr9Lq3etEGc4ZHEPFrZECP2jkkBF6TXqoOzGw3OIymS3aYhCBFAVlS
	ohZmEZkDjYRYfsDJlP9nLbAiC8oq7P9OIOTxCgg5yudZzbvF0j41R/FcIWQTd/StA6wTtR7Kx9i
	mfLBJdNGVI845Ct1GnU2U37ZcCRWVcVRzOg5DtI11l+uH8NeDUFMKt4n+iR/2RJhuVumSsMZ+T5
	vID/o0pf0kQgrMiQgjGLQAPeqsTNMmhCMtnrnqvXgvUHEslTwBsBJ8w1WL5Y/+eS+csGKC0NI2r
	e2LZv8g1eCFCx3RP8w7Be
X-Google-Smtp-Source: AGHT+IHgamdUI5YlQzGy+tywp2WFIt6eICFuddEACvBztvsWio9ZOGbAiBOCCMJpfYlREEW3FdCiog==
X-Received: by 2002:a17:907:9813:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-ac7d6d05fcfmr1419204366b.19.1744119961574;
        Tue, 08 Apr 2025 06:46:01 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------XvnKCZqwJdqMgXTIWtLshsvG"
Message-ID: <c3b1be9a-d5f5-4cac-a675-7485a99bf51c@gmail.com>
Date: Tue, 8 Apr 2025 15:46:00 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com>

This is a multi-part message in MIME format.
--------------XvnKCZqwJdqMgXTIWtLshsvG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/8/25 2:02 PM, Jan Beulich wrote:
> On 08.04.2025 13:51, Oleksii Kurochko wrote:
>> On 4/7/25 12:09 PM, Jan Beulich wrote:
>>> On 04.04.2025 18:04, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>>     */
>>>>    static inline unsigned long virt_to_maddr(unsigned long va)
>>>>    {
>>>> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
>>>> +    const unsigned long va_vpn = va >> vpn1_shift;
>>>> +    const unsigned long xen_virt_start_vpn =
>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>> +    const unsigned long xen_virt_end_vpn =
>>>> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>> +
>>>>        if ((va >= DIRECTMAP_VIRT_START) &&
>>>>            (va <= DIRECTMAP_VIRT_END))
>>>>            return directmapoff_to_maddr(va - directmap_virt_start);
>>>>    
>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
>>>> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
>>> Not all of the range is backed by memory, and for the excess space the
>>> translation is therefore (likely) wrong. Which better would be caught by
>>> the assertion?
>> Backed here means that the memory is actually mapped?
>>
>> IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
>> where xen_phys_size=(unsigned long)_end - (unsigned long)_start.
>>
>> Did I understand you correctly?
> I think so, yes. Depending on what you (intend to) do to .init.* at the
> end of boot, that range may later also want excluding.

I planned to release everything between __init_begin and __init_end in the following way:
   destroy_xen_mappings((unsigned long)__init_begin, (unsigned long)__init_end);

So yes, then I think I have to come up with new ASSERT, add is_init_memory_freed variable and
if is_init_memory_freed=true then also check that `va` isn't from .init.* range.

But I'm not quire sure that mapping for .got* should be destroyed after the end of boot. (now it is
part of [__init_begin,__init_end] range.

>>>> --- a/xen/arch/riscv/mm.c
>>>> +++ b/xen/arch/riscv/mm.c
>>>> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>>>    #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>>    
>>>>    /*
>>>> - * It is expected that Xen won't be more then 2 MB.
>>>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>>>>     * The check in xen.lds.S guarantees that.
>>>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>>>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>>>     *
>>>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>>>> + * Root page table is shared with the initial mapping and is declared
>>>> + * separetely. (look at stage1_pgtbl_root)
>>>>     *
>>>> - * It might be needed one more page table in case when Xen load address
>>>> - * isn't 2 MB aligned.
>>>> + * An amount of page tables between root page table and L0 page table
>>>> + * (in the case of Sv39 it covers L1 table):
>>>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>>>> + *   the same amount are needed for Xen.
>>>>     *
>>>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>>>> - * except that the root page table is shared with the initial mapping
>>>> + * An amount of L0 page tables:
>>>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>>>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>>>> + *   one L0 is needed for indenity mapping.
>>>> + *
>>>> + *   It might be needed one more page table in case when Xen load
>>>> + *   address isn't 2 MB aligned.
>>> Shouldn't we guarantee that?
>> I think it's sufficient to guarantee 4KB alignment.
>>
>> The only real benefit I see in enforcing larger alignment is that it likely enables
>> the use of superpages for mapping, which would reduce TLB pressure.
>> But perhaps I'm missing something?
> No, it's indeed mainly that.

But then the linker address and the load address should both be aligned to a 2MB or 1GB boundary.
This likely isn't an issue at all, but could it be a problem if we require 1GB alignment for the
load address? In that case, might it be difficult for the platform to find a suitable place in
memory to load Xen for some reason? (I don't think so but maybe I'm missing something)

These changes should probably be part of a separate patch, as currently,|setup_initial_mapping() |only works with 4KB mapping.
Perhaps it would make sense to add a comment around|setup_initial_mapping()| indicating that if
this function is modified, it may require updating|PGTBL_INITIAL_COUNT|.

~ Oleksii

>
>> Or did you mean that if 2MB alignment isn't guaranteed, then we might need two extra
>> page tables—one if the start address isn't 2MB aligned, and the Xen size is larger than 2MB?
>> Then yes one more page table should be added to PGTBL_INITIAL_COUNT.
> Well, of course - if alignment isn't guaranteed, crossing whatever boundaries
> of course needs accounting for.
>
> Jan
--------------XvnKCZqwJdqMgXTIWtLshsvG
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
    <div class="moz-cite-prefix">On 4/8/25 2:02 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
Backed here means that the memory is actually mapped?

IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
where xen_phys_size=(unsigned long)_end - (unsigned long)_start.

Did I understand you correctly?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think so, yes. Depending on what you (intend to) do to .init.* at the
end of boot, that range may later also want excluding.</pre>
    </blockquote>
    <pre>I planned to release everything between __init_begin and __init_end in the following way:
  destroy_xen_mappings((unsigned long)__init_begin, (unsigned long)__init_end);

So yes, then I think I have to come up with new ASSERT, add is_init_memory_freed variable and
if is_init_memory_freed=true then also check that `va` isn't from .init.* range.

But I'm not quire sure that mapping for .got* should be destroyed after the end of boot. (now it is
part of [__init_begin,__init_end] range.

</pre>
    <blockquote type="cite"
      cite="mid:8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
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
        <pre wrap="" class="moz-quote-pre">
I think it's sufficient to guarantee 4KB alignment.

The only real benefit I see in enforcing larger alignment is that it likely enables
the use of superpages for mapping, which would reduce TLB pressure.
But perhaps I'm missing something?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No, it's indeed mainly that.</pre>
    </blockquote>
    <pre>But then the linker address and the load address should both be aligned to a 2MB or 1GB boundary.
This likely isn't an issue at all, but could it be a problem if we require 1GB alignment for the
load address? In that case, might it be difficult for the platform to find a suitable place in
memory to load Xen for some reason? (I don't think so but maybe I'm missing something)

These changes should probably be part of a separate patch, as currently, <code
    data-start="120" data-end="145">setup_initial_mapping()
</code>only works with 4KB mapping.
Perhaps it would make sense to add a comment around <code
    data-start="227" data-end="252">setup_initial_mapping()</code> indicating that if
this function is modified, it may require updating <code
    data-start="323" data-end="344">PGTBL_INITIAL_COUNT</code>.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Or did you mean that if 2MB alignment isn't guaranteed, then we might need two extra
page tables—one if the start address isn't 2MB aligned, and the Xen size is larger than 2MB?
Then yes one more page table should be added to PGTBL_INITIAL_COUNT.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, of course - if alignment isn't guaranteed, crossing whatever boundaries
of course needs accounting for.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------XvnKCZqwJdqMgXTIWtLshsvG--

