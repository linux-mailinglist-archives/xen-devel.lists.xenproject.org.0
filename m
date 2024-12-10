Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C449EB49C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852723.1266441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL21y-0001HD-I1; Tue, 10 Dec 2024 15:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852723.1266441; Tue, 10 Dec 2024 15:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL21y-0001Em-FN; Tue, 10 Dec 2024 15:20:10 +0000
Received: by outflank-mailman (input) for mailman id 852723;
 Tue, 10 Dec 2024 15:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tL21x-0001Eg-63
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:20:09 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb4d10d-b70a-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 16:20:06 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so7484029a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:20:06 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a25cc5sm7769797a12.7.2024.12.10.07.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:20:05 -0800 (PST)
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
X-Inumbo-ID: 3cb4d10d-b70a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844006; x=1734448806; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxPWbcyQkXK3DbcOT5Txw9CYnYS9nNlgk/VKoJT2ke8=;
        b=Z+4Yq7oI74GKsaMS3t0nT6oj9ZAdqzcTP6xG2CVCxxJkZycDA+z4sRCiMJcLiDjAGd
         7cdDFFwYs7CqA5czj/tp8iVs/PsTnz+wDjE4DRZ/ni7tFHi6fhHfBtn1UF5Q+w51Fkda
         SqltyySWg2Gey3p7b6x/JT9aVsr6sxqoihnlXyQOnLYYNVzSAU8h2ezmroyj5+/gFKXx
         njwvGlz9xuvrWAHhsfoE8fvB3tmWZivz1x1xKR5V8rKRiHchsYzjA2fjQ2yFy5lQb6W8
         T7n7TWnYTEuA2t5GHKCvcjMpVMM0mkyuovZLpE9j7wRjQYebvcZcC2bgejvvhjN4N5Rr
         Fuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844006; x=1734448806;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxPWbcyQkXK3DbcOT5Txw9CYnYS9nNlgk/VKoJT2ke8=;
        b=RR+TX5sUWdFCAMiGCmb/SWga0iFcU8YEH0/dIdn6IIXWMO0bxDw/Xgf3/R7SrPRIlU
         BA0pzFjFVmG5sS+3r//VSmOzCYAeLl4PfDPJ3PmkW3CPvidq0y+bSVRASz0RvAqyJ88S
         UpGArRFqoxzlM/WohNPyZ6Di6F36gMwyKesJrmgQMAhoqnAPMpKGnD2s9hOh2SVvywJR
         asGRFMitC43sfNZHbfa7/5dTLFE/WbcCiqfyGqIplx/n+2hlvrQkhVZQ/NSmfdOYNTvH
         AjFJn8hEXcmYQ4zyypAxjDMtoOvEw4v5EASgWd/MBZQDgqIrSNthKaApK1TJ2CNU1/8B
         /KgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3CNZBPehQzugPknxzRiOiXaa7KXMYOye8+YO5eOWpECOSUyBiydSByzJ8BOIefHHP13bBwbgHLy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySHnhWMENG3IOV0+/mq/hM6R4AH0a7ivWs1AUvVqF3PhV/S67Q
	8/FGBT0APzanHqhz15cYgPAvNs5JKC34Nsx6IdtWDM/FK3NkgVz4
X-Gm-Gg: ASbGnctaHfIHL77b8l09OYmgMXpg2TqlXSPJQIm4xh8LhOVKgI1JRnG1Dd3lpE6IAtA
	9qxkJnx0wut73PzW5+qkuJnD/NysciN8OW1YZOF/XQvzx7iR1Pq55ZsvAG+dcWO9Iq/XEHo7SoH
	t+VXSZKy3fGNktQHYKdhG4IxyfH2M1e4DDFHTuK+Z96vnKjorQcqh/MZfSOJpPkHwdMhLhWHLaK
	4ZtJDIRMwevSuYYOET/VZmEhas6U69CCH8i3Zgf1REyzsLuljiWp9aj8FIpDbxhcks=
X-Google-Smtp-Source: AGHT+IFzQTMEUufvLhW9qAKJc2lYfIlmMwY2roIuqVqsjlbrhPCtygbEpyiGybwfIUo+gSBaG+2XIQ==
X-Received: by 2002:a05:6402:4408:b0:5d3:cf08:d64d with SMTP id 4fb4d7f45d1cf-5d41863c2a7mr5482664a12.32.1733844006124;
        Tue, 10 Dec 2024 07:20:06 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------8KaSZ7d0SlsDntNHQ88047u1"
Message-ID: <4dd6a2e9-d2b9-4402-907b-b9314d2346f7@gmail.com>
Date: Tue, 10 Dec 2024 16:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: implement relocate_fdt()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
 <d9fddba7-8364-45a6-addd-004dbde366a5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d9fddba7-8364-45a6-addd-004dbde366a5@suse.com>

This is a multi-part message in MIME format.
--------------8KaSZ7d0SlsDntNHQ88047u1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/24 4:00 PM, Jan Beulich wrote:
> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>> relocate_fdt() relocates FDT to Xen heap instead of using early mapping
>> as it is expected that discard_initial_modules() ( is supposed to call
>> in the future ) discards the FDT boot module and remove_early_mappings()
>> destroys the early mapping.
>>
>> To implement that the following things are introduced as they are called
>> by internals of xmalloc_bytes() which is used in relocate_fdt():
>> 1. As RISC-V may have non-coherent access for RAM ( f.e., in case
>>     of non-coherent IO devices ) flush_page_to_ram() is implemented
>>     to ensure that cache and RAM are consistent for such platforms.
> This is a detail of the page allocator, yes. It can then be viewed as also
> a detail of xmalloc() et al, but I consider the wording a little misleading.
>
>> 2. copy_from_paddr() to copy FDT from a physical address to allocated
>>     by xmalloc_bytes() in Xen heap.
> This doesn't look to be related to the internals of xmalloc() et al.
>
>> 3. virt_to_page() to convert virtual address to page. Also introduce
>>     directmap_virt_end to check that VA argument of virt_to_page() is
>>     inside directmap region.
> This is a need of free_xenheap_pages(), yes; see remark on point 1.

Actually I faced the usage of virt_to_page() in xmalloc_whole_page():
```
   static void *xmalloc_whole_pages(unsigned long size, unsigned long align)
   {
     ...
     PFN_ORDER(virt_to_page(res)) = PFN_UP(size);
     /* Check that there was no truncation: */
     ASSERT(PFN_ORDER(virt_to_page(res)) == PFN_UP(size));

     return res;
   }
```
which is called from xmalloc().

Do we need a second paragraph of the commit message at all? Or it is just obvious if
flush_page_to_ram(), virt_to_page() and copy_from_paddr() are introduces that they are needed for
relocate_fdt()?

Or perhaps rephrasing in the following way would be enough?
```
For internal use of|xmalloc|, the functions|flush_page_to_ram()| and|virt_to_page()| are introduced.
|virt_to_page()| is also required for|free_xenheap_pages()|. These additions are used to support
|xmalloc|, which is utilized within|relocate_fdt()|. Additionally,|copy_from_paddr()| is introduced
for use in|relocate_fdt()|.
```

>> @@ -148,8 +150,12 @@ static inline void *page_to_virt(const struct page_info *pg)
>>   /* Convert between Xen-heap virtual addresses and page-info structures. */
>>   static inline struct page_info *virt_to_page(const void *v)
>>   {
>> -    BUG_ON("unimplemented");
>> -    return NULL;
>> +    unsigned long va = (unsigned long)v;
>> +
>> +    ASSERT(va >= DIRECTMAP_VIRT_START);
>> +    ASSERT(va <= directmap_virt_end);
> Why the difference compared to virt_to_maddr()?

It is just a mistake as `directmap_virt_end` is directmap_virt_start-relative but `v` is DIRECTMAP_VIRT_START-relative.
The check should be following:
   ASSERT((va >= DIRECTMAP_VIRT_START) && (va <= DIRECTMAP_VIRT_END));
and then directmap_virt_end should be dropped at all.

>
> Also recall my comment on one of your earlier series, regarding inclusive
> vs exclusive ranges. Can that please be sorted properly as a prereq, to
> avoid extending the inconsistency?

Yes, I remember that and at the moment everything ( DIRECTMAP_VIRT_END, FRAMETABLE_VIRT_END )
is following "inclusive" way. Considering that you remind me that could you please tell me more time
what I am missing?

>> +        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
>> +        memcpy(dst, src + s, l);
>> +        clean_dcache_va_range(dst, l);
> Why is this necessary here? You're copying to plain RAM that Xen alone
> is using.

It is Arm specific:
```
commit c60209d77e2c02de110ca0fdaa2582ef4e53d8fd
Author: Stefano Stabellini<stefano.stabellini@eu.citrix.com>
Date:   Mon Jan 21 12:40:31 2013 +0000

     xen/arm: flush dcache after memcpy'ing the kernel image
     
     After memcpy'ing the kernel in guest memory we need to flush the dcache
     to make sure that the data actually reaches the memory before we start
     executing guest code with caches disabled.
     
     copy_from_paddr is the function that does the copy, so add a
     flush_xen_dcache_va_range there.
```
I wanted to put copy_from_paddr() to some common place at the end but in RISC-V cache is always enabled
( I don't see an instruction in the spec for disable/enable cache ) so this issue isn't present for RISC-V
and clean_dcache_va_range() should/could be dropped.

>> +/* Relocate the FDT in Xen heap */
>> +static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
> This function having no caller will - aiui - mean build breakage at
> this point of the series.

Yes, it should be a problem, missed that. Then I have to merge it with the next one patch.

Thanks.

~ Oleksii

--------------8KaSZ7d0SlsDntNHQ88047u1
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
    <div class="moz-cite-prefix">On 12/9/24 4:00 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d9fddba7-8364-45a6-addd-004dbde366a5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.11.2024 13:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">relocate_fdt() relocates FDT to Xen heap instead of using early mapping
as it is expected that discard_initial_modules() ( is supposed to call
in the future ) discards the FDT boot module and remove_early_mappings()
destroys the early mapping.

To implement that the following things are introduced as they are called
by internals of xmalloc_bytes() which is used in relocate_fdt():
1. As RISC-V may have non-coherent access for RAM ( f.e., in case
   of non-coherent IO devices ) flush_page_to_ram() is implemented
   to ensure that cache and RAM are consistent for such platforms.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is a detail of the page allocator, yes. It can then be viewed as also
a detail of xmalloc() et al, but I consider the wording a little misleading.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">2. copy_from_paddr() to copy FDT from a physical address to allocated
   by xmalloc_bytes() in Xen heap.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This doesn't look to be related to the internals of xmalloc() et al.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">3. virt_to_page() to convert virtual address to page. Also introduce
   directmap_virt_end to check that VA argument of virt_to_page() is
   inside directmap region.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is a need of free_xenheap_pages(), yes; see remark on point 1.</pre>
    </blockquote>
    <pre>Actually I faced the usage of virt_to_page() in xmalloc_whole_page():
```
  static void *xmalloc_whole_pages(unsigned long size, unsigned long align)
  {
    ...
    PFN_ORDER(virt_to_page(res)) = PFN_UP(size);
    /* Check that there was no truncation: */
    ASSERT(PFN_ORDER(virt_to_page(res)) == PFN_UP(size));

    return res;
  }
```
which is called from xmalloc().
</pre>
    <pre>
Do we need a second paragraph of the commit message at all? Or it is just obvious if 
flush_page_to_ram(), virt_to_page() and copy_from_paddr() are introduces that they are needed for
relocate_fdt()?
</pre>
    <pre>
Or perhaps rephrasing in the following way would be enough?
```
For internal use of <code>xmalloc</code>, the functions <code>flush_page_to_ram()</code> and <code>virt_to_page()</code> are introduced.
<code>virt_to_page()</code> is also required for <code>free_xenheap_pages()</code>. These additions are used to support
<code>xmalloc</code>, which is utilized within <code>relocate_fdt()</code>. Additionally, <code>copy_from_paddr()</code> is introduced
for use in <code>relocate_fdt()</code>.
```

</pre>
    <blockquote type="cite"
      cite="mid:d9fddba7-8364-45a6-addd-004dbde366a5@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -148,8 +150,12 @@ static inline void *page_to_virt(const struct page_info *pg)
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    unsigned long va = (unsigned long)v;
+
+    ASSERT(va &gt;= DIRECTMAP_VIRT_START);
+    ASSERT(va &lt;= directmap_virt_end);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why the difference compared to virt_to_maddr()?</pre>
    </blockquote>
    <pre>It is just a mistake as `directmap_virt_end` is directmap_virt_start-relative but `v` is DIRECTMAP_VIRT_START-relative.
The check should be following:
  ASSERT((va &gt;= DIRECTMAP_VIRT_START) &amp;&amp; (va &lt;= DIRECTMAP_VIRT_END));
and then directmap_virt_end should be dropped at all.

</pre>
    <blockquote type="cite"
      cite="mid:d9fddba7-8364-45a6-addd-004dbde366a5@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also recall my comment on one of your earlier series, regarding inclusive
vs exclusive ranges. Can that please be sorted properly as a prereq, to
avoid extending the inconsistency?</pre>
    </blockquote>
    <pre>Yes, I remember that and at the moment everything ( DIRECTMAP_VIRT_END, FRAMETABLE_VIRT_END )
is following "inclusive" way. Considering that you remind me that could you please tell me more time
what I am missing?

</pre>
    <blockquote type="cite"
      cite="mid:d9fddba7-8364-45a6-addd-004dbde366a5@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
+        memcpy(dst, src + s, l);
+        clean_dcache_va_range(dst, l);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why is this necessary here? You're copying to plain RAM that Xen alone
is using.
</pre>
    </blockquote>
    <pre>It is Arm specific:
```
commit c60209d77e2c02de110ca0fdaa2582ef4e53d8fd
Author: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@eu.citrix.com">&lt;stefano.stabellini@eu.citrix.com&gt;</a>
Date:   Mon Jan 21 12:40:31 2013 +0000

    xen/arm: flush dcache after memcpy'ing the kernel image
    
    After memcpy'ing the kernel in guest memory we need to flush the dcache
    to make sure that the data actually reaches the memory before we start
    executing guest code with caches disabled.
    
    copy_from_paddr is the function that does the copy, so add a
    flush_xen_dcache_va_range there.
```
I wanted to put copy_from_paddr() to some common place at the end but in RISC-V cache is always enabled
( I don't see an instruction in the spec for disable/enable cache ) so this issue isn't present for RISC-V
and clean_dcache_va_range() should/could be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:d9fddba7-8364-45a6-addd-004dbde366a5@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Relocate the FDT in Xen heap */
+static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This function having no caller will - aiui - mean build breakage at
this point of the series.</pre>
    </blockquote>
    <pre>Yes, it should be a problem, missed that. Then I have to merge it with the next one patch.</pre>
    <pre>Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------8KaSZ7d0SlsDntNHQ88047u1--

