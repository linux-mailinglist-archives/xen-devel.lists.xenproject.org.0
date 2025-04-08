Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B549A802F9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 13:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941809.1341197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27Ur-0008Fw-HN; Tue, 08 Apr 2025 11:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941809.1341197; Tue, 08 Apr 2025 11:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27Ur-0008Co-Dm; Tue, 08 Apr 2025 11:52:05 +0000
Received: by outflank-mailman (input) for mailman id 941809;
 Tue, 08 Apr 2025 11:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u27Up-0008Ci-Gs
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 11:52:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1dc7095-146f-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 13:52:01 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so7010635a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 04:52:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f088084e61sm7825401a12.63.2025.04.08.04.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 04:51:59 -0700 (PDT)
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
X-Inumbo-ID: e1dc7095-146f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744113121; x=1744717921; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TKV7MD+x6OvmFKHdUyku1PXQCyW6OuqKXs1hOLzwBo=;
        b=AQST+xzGkXyuEe3EmaYQPj08pgQbvktDEVIjWdaK2+RoIRJe0VKFWubba28tciejUG
         VV5lDiGf3ap0j1jJjcCSvmklCH466ijY/gcBWBrI6wyOiaUFNReGX+y2QNpBrJwQ8Xhx
         egju0UNHjAU3fEYGz+VBOTTn4Hmr69lMPue9RiiBIwHN5o4ZxU2t/A8WTcyhF2Wy8B2l
         gRztB25ZT4oRtMmYeWkBIcGT6u4sHxPT1jejEpoQGPn/YJMTDpGQ7swWftpD4qfpueAT
         ll/xIhVXALr32jdXG4LWitA1ncbERMXbdOKsYCHgS3YSkhOvV7T404Dv+tBiT5K5vVaU
         HrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113121; x=1744717921;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0TKV7MD+x6OvmFKHdUyku1PXQCyW6OuqKXs1hOLzwBo=;
        b=Sq/ev9xSwEs41s1PeaNJc2dBYnvpXdWEp7SXujUtonOTpfTPQGPIX3227TNDu/yEng
         kwBOmvu/T+JTiU5tw485obvwViPuOIHfHALXiNUn1fvbbyOifdLJdNLnyJumv9uKhrRl
         sET2bGX8wTuKJFfJWgduF0AmA0EEChefWNgR5D2acYWueXFsbKnmT7yDnw8GlA5Nyr+n
         jfis0sTdxwca2gqgm2I6i+CYfdm3YopVNhjLIukE68AJLKi2xfVnz+MvkCHPQV+uWWgg
         WhsPNm+XbSdeuOyxh4iUMg52UbyZ8gOs3dhj6twB7jS3ZhRB/vzWB64OR6jzgJWfAjY+
         8THQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5/tuoX5orAHA03LGSk4w2NRT9knGEvTr6atnylezI6pXCYCT4umd+Zgr9r8AUQj02nSuE5/m9VGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6SEWfIKE23vX2A0fCve0MUPT5W6fyV9sX0WFMy84MW5oyxWM8
	4MQbHRZoxIoxrYQLdlhHcBSzKfzjbz3n50gHP9ZgHeRAVoHUyKLY
X-Gm-Gg: ASbGnctmPgiz1WwyMvXptgqX3vxnrGsQ/c/Lh1U4twawShWr/ZhYfhjyJxEa0HveJ72
	kJSoD1VBoVG04uXbQZ+/Ed5xAKXKTbDrBxsPj5oe164mXw94sEvviyh7AhjSCv+7xQNSqK5Ggdp
	cXACll1Q1eqL9goR17FRlzOmHtr+j7QLzOUPOuYi3DbRg7EOeJ+VQbpCGAsuCfLDqUIBsQljKSO
	/INiiRDx7kpwQ5s0O6lCjs3ya+eLnQjDAbzp8/WowuFISUUyUMRoaVWhvSgGOq5deLRS46G6pQt
	EQCFvHCdIglkDXdv9lxb7185KlgI8yY6l8NUbycpQ0lqKhyMXqIQx0JCZb9/0szyaH9o3q445KI
	EUzSv+FMsIRhd2IEBRrDEftKPmAytI+c=
X-Google-Smtp-Source: AGHT+IFbyYjYEFpDW783FFnkiEIDNUGCo0ZKTn/qyv9tMVYlnHVrqWsYPR8PiaOq61SlAUBX3WvtAQ==
X-Received: by 2002:a05:6402:5cb:b0:5ee:497:67d6 with SMTP id 4fb4d7f45d1cf-5f0b66417f0mr13405047a12.33.1744113120349;
        Tue, 08 Apr 2025 04:52:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------bAMtNFY87y0kSSAMPceiNG8a"
Message-ID: <f35a9969-6154-4e9a-b997-16ca135e85ee@gmail.com>
Date: Tue, 8 Apr 2025 13:51:58 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com>

This is a multi-part message in MIME format.
--------------bAMtNFY87y0kSSAMPceiNG8a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/7/25 12:09 PM, Jan Beulich wrote:
> On 04.04.2025 18:04, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/config.h
>> +++ b/xen/arch/riscv/include/asm/config.h
>> @@ -41,11 +41,11 @@
>>    * Start addr          | End addr         | Slot       | area description
>>    * ============================================================================
>>    *                   .....                 L2 511          Unused
>> - *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
>> + *  0xffffffffc1800000  0xffffffffc1afffff L2 511          Fixmap
> Isn't the upper bound 0xffffffffc19fffff now?

Yes, it should be updated to 0xffffffffc19fffff.

>
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>>    */
>>   static inline unsigned long virt_to_maddr(unsigned long va)
>>   {
>> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
>> +    const unsigned long va_vpn = va >> vpn1_shift;
>> +    const unsigned long xen_virt_start_vpn =
>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>> +    const unsigned long xen_virt_end_vpn =
>> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>> +
>>       if ((va >= DIRECTMAP_VIRT_START) &&
>>           (va <= DIRECTMAP_VIRT_END))
>>           return directmapoff_to_maddr(va - directmap_virt_start);
>>   
>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>> +    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
>> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
> Not all of the range is backed by memory, and for the excess space the
> translation is therefore (likely) wrong. Which better would be caught by
> the assertion?

Backed here means that the memory is actually mapped?

IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
where xen_phys_size=(unsigned long)_end - (unsigned long)_start.

Did I understand you correctly?

>
>> --- a/xen/arch/riscv/mm.c
>> +++ b/xen/arch/riscv/mm.c
>> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>   
>>   /*
>> - * It is expected that Xen won't be more then 2 MB.
>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>>    * The check in xen.lds.S guarantees that.
>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>    *
>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>> + * Root page table is shared with the initial mapping and is declared
>> + * separetely. (look at stage1_pgtbl_root)
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
>> + *   one L0 is needed for indenity mapping.
>> + *
>> + *   It might be needed one more page table in case when Xen load
>> + *   address isn't 2 MB aligned.
> Shouldn't we guarantee that?

I think it's sufficient to guarantee 4KB alignment.

The only real benefit I see in enforcing larger alignment is that it likely enables
the use of superpages for mapping, which would reduce TLB pressure.
But perhaps I'm missing something?

Or did you mean that if 2MB alignment isn't guaranteed, then we might need two extra
page tables—one if the start address isn't 2MB aligned, and the Xen size is larger than 2MB?
Then yes one more page table should be added to PGTBL_INITIAL_COUNT.

> What may require an extra page table is when Xen
> crosses a 1Gb boundary (unless we also guaranteed that it won't).

You're right—I also need to add an extra page table if Xen crosses a 1GB boundary.

Thanks!

~ Oleksii

--------------bAMtNFY87y0kSSAMPceiNG8a
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
    <div class="moz-cite-prefix">On 4/7/25 12:09 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.04.2025 18:04, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,11 +41,11 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
+ *  0xffffffffc1800000  0xffffffffc1afffff L2 511          Fixmap
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Isn't the upper bound 0xffffffffc19fffff now?</pre>
    </blockquote>
    <pre>Yes, it should be updated to 0xffffffffc19fffff.
</pre>
    <blockquote type="cite"
      cite="mid:e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com">
      <pre wrap="" class="moz-quote-pre">

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
      <pre wrap="" class="moz-quote-pre">
Not all of the range is backed by memory, and for the excess space the
translation is therefore (likely) wrong. Which better would be caught by
the assertion?</pre>
    </blockquote>
    <pre>Backed here means that the memory is actually mapped?

IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
where xen_phys_size=(unsigned long)_end - (unsigned long)_start.

Did I understand you correctly?</pre>
    <blockquote type="cite"
      cite="mid:e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
Shouldn't we guarantee that? 
</pre>
    </blockquote>
    <pre data-start="126" data-end="177" class="">I think it's sufficient to guarantee 4KB alignment.</pre>
    <pre data-start="179" data-end="365" class="">The only real benefit I see in enforcing larger alignment is that it likely enables
the use of superpages for mapping, which would reduce TLB pressure.
But perhaps I'm missing something?</pre>
    <pre data-start="367" data-end="595" class="">Or did you mean that if 2MB alignment isn't guaranteed, then we might need two extra
page tables—one if the start address isn't 2MB aligned, and the Xen size is larger than 2MB?
Then yes one more page table should be added to PGTBL_INITIAL_COUNT.</pre>
    <pre></pre>
    <p></p>
    <blockquote type="cite"
      cite="mid:e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com">
      <pre wrap="" class="moz-quote-pre">What may require an extra page table is when Xen
crosses a 1Gb boundary (unless we also guaranteed that it won't).
</pre>
    </blockquote>
    <pre>You're right—I also need to add an extra page table if Xen crosses a 1GB boundary.

Thanks!

~ Oleksii
</pre>
  </body>
</html>

--------------bAMtNFY87y0kSSAMPceiNG8a--

