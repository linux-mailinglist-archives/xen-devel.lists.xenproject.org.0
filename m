Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623EDA87F93
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949924.1346376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IIb-0004Nb-Hv; Mon, 14 Apr 2025 11:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949924.1346376; Mon, 14 Apr 2025 11:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IIb-0004Ld-Ee; Mon, 14 Apr 2025 11:48:25 +0000
Received: by outflank-mailman (input) for mailman id 949924;
 Mon, 14 Apr 2025 11:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4IIZ-0004LX-TF
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:48:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c928cd1-1926-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:48:20 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso7889114a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:48:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb2ddasm896384766b.36.2025.04.14.04.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:48:18 -0700 (PDT)
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
X-Inumbo-ID: 5c928cd1-1926-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744631300; x=1745236100; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfZWSJnE0NE7T4QEDHs8FQo1WPSW148W0ACegppMNmU=;
        b=SopOP7he+Ah/nD4UuBl4486jZAYSET+3uhtibidx+R09SYqADufnec1jsoxG62137W
         aRdgBTGYztUujtCg7NVUf7y3SSfM5Vv5/DCjBoRBdBK0UX/VRwrid1KNOdcT9IvwK4LF
         W55iscma9vKrKBW3Q3ks1jgrGiph+D2LfT376oP2H4ynym3klgroLmglYyKd1J2VYe6H
         49hy2xiq9TK8WIc/Qm3FU9mQ6ZaATti85m0jlu8Iry7Q3NNDF7XtZ8osa5/bUT4h/0Zz
         uV919Q8z/YokrgMcMuCavFK2hsWvlJJebhiKvebRjfCAn7lilkEqjyV6/eGzLyp6T0vU
         mPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631300; x=1745236100;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JfZWSJnE0NE7T4QEDHs8FQo1WPSW148W0ACegppMNmU=;
        b=HCR/z/sAil4yo7MSo7gmnZvTiaQo6EkuvnfnRif9mEegTbNlMGya3nuE45UJRKuSo1
         uveeri5eUPSY7cab5ji5G/AN+jyuuzCntUOCB+WhbRhhCuidGqcZJgIQK9FJtSzp4A7O
         ybKBbP7KihyoO+y9XXD4RGjdhpT3KaGWRqYm7Z537TpZua2SD0xw48lAUM8/v9H7yjO0
         6s9TVD4XC2uO8IdpTaWknaNNDjV+jZcAGIB3qkdknlNskDVE+WD8B7bRDf19EnVvPaaJ
         nVSBklD4lBr7/NDbjfRn40Tux7Vtkz0bdN+CJ2Zly077Ru+PMdAsRQNWPOkZuhHeElNy
         lNTA==
X-Forwarded-Encrypted: i=1; AJvYcCUuNn5Z9QTzq2DmHBUNlcAWykcc9eoVPTctbTHXkgqDGsljM/GqEn4+RAMXS4akj6Y1mRbI9bbK/VI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXJ8QutyAQbJ8Xb/OdQJwO4k+73qzxkbkVT4nZQg54ch6IhdeH
	LZE+8jax9zHPQZjGl5CCvCQzqndhdReZkyqSYDeZXxC0m4ZmVwdj
X-Gm-Gg: ASbGnctwm7OmCGtm00E5LRQRoLQGe858gPseGDWQ7sDYwf+xb4gajX2w+bWVtLWfpN9
	2lpARjKGwVEnD96Gjj+qxTUi56+cJfEvBfX3dB7g3cRRwjNkO6b+FLyFicEWbtSJ/AH6orgm4og
	0p7BKUwpLG0OLaF6Qi/0SgHt5Ne2+XXDM1cGXeHg8CpKhCJMWm9oN90UYRsaLwy0vIhjDUpdCGt
	DAa/E+cQux65HRsfmgfcbNZppZ41K7BGUjo0YLFazHJOUMv36VEQUEbXsN30huTWTrlC/Z0p3lQ
	8WWhGLYW9xjLBE388mvmkRRj+rqZCimen69S5DNylAaQ18fqDfkCO2xwu6hNqYNcmCA2OlbTN2r
	vqC+JdXOot4Ym9m5a
X-Google-Smtp-Source: AGHT+IFEwp+ojTk1arnpufloQ9jimHCntlE37hBFlvvJSzbOHPzLG12gIkRo+EBeuoeKjxqCAiWkDQ==
X-Received: by 2002:a17:907:7b8d:b0:aca:c4d4:15a0 with SMTP id a640c23a62f3a-acad343caffmr784645066b.8.1744631299295;
        Mon, 14 Apr 2025 04:48:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------X1Dg8pzsxfI0bhLGsZfq0Npn"
Message-ID: <35a0256f-cb48-4e39-b60d-8ee698154e77@gmail.com>
Date: Mon, 14 Apr 2025 13:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: Increase XEN_VIRT_SIZE
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eb20a5730b55c1731324cc3970c3a3c9ea666a85.1744214442.git.oleksii.kurochko@gmail.com>
 <a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com>

This is a multi-part message in MIME format.
--------------X1Dg8pzsxfI0bhLGsZfq0Npn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 10:48 AM, Jan Beulich wrote:
> On 09.04.2025 21:01, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -9,6 +9,7 @@
>>   #include <xen/mm-frame.h>
>>   #include <xen/pdx.h>
>>   #include <xen/pfn.h>
>> +#include <xen/sections.h>
>>   #include <xen/types.h>
>>   
>>   #include <asm/page-bits.h>
>> @@ -35,6 +36,11 @@ static inline void *maddr_to_virt(paddr_t ma)
>>       return (void *)va;
>>   }
>>   
>> +#define is_init_section(p) ({                   \
>> +    char *p_ = (char *)(unsigned long)(p);      \
>> +    (p_ >= __init_begin) && (p_ < __init_end);  \
>> +})
> I think this wants to be put in xen/sections.h, next to where __init_{begin,end}
> are declared. But first it wants making const-correct, to eliminate the potential
> of it indirectly casting away const-ness from the incoming argument.
>
> (At some point related stuff wants moving from kernel.h to sections.h, I suppose.
> And at that point they will all want to have const added.)

Sure, I'll change to 'const char *p_ = (const char*)(unsigned long)(p)'.

>> --- a/xen/arch/riscv/mm.c
>> +++ b/xen/arch/riscv/mm.c
>> @@ -31,20 +31,24 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>   
>>   /*
>> - * It is expected that Xen won't be more then 2 MB.
>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
> Why "MB" when the macro already expands to MB(16)?

It should be really dropped, no need for MB in the comment.

>
>>    * The check in xen.lds.S guarantees that.
>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>    *
>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>> + * Root page table is shared with the initial mapping and is declared
>> + * separetely. (look at stage1_pgtbl_root)
> Nit: separately
>
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
> Nit: identity
>
> But more importantly, where's this one L0 ...
>
>>    */
>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
>> +                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)))
> .... in this calculation?

L0 for identity mapping is really missed.

Thanks.

~ Oleksii

--------------X1Dg8pzsxfI0bhLGsZfq0Npn
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
    <div class="moz-cite-prefix">On 4/10/25 10:48 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.04.2025 21:01, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -9,6 +9,7 @@
 #include &lt;xen/mm-frame.h&gt;
 #include &lt;xen/pdx.h&gt;
 #include &lt;xen/pfn.h&gt;
+#include &lt;xen/sections.h&gt;
 #include &lt;xen/types.h&gt;
 
 #include &lt;asm/page-bits.h&gt;
@@ -35,6 +36,11 @@ static inline void *maddr_to_virt(paddr_t ma)
     return (void *)va;
 }
 
+#define is_init_section(p) ({                   \
+    char *p_ = (char *)(unsigned long)(p);      \
+    (p_ &gt;= __init_begin) &amp;&amp; (p_ &lt; __init_end);  \
+})
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this wants to be put in xen/sections.h, next to where __init_{begin,end}
are declared. But first it wants making const-correct, to eliminate the potential
of it indirectly casting away const-ness from the incoming argument.

(At some point related stuff wants moving from kernel.h to sections.h, I suppose.
And at that point they will all want to have const added.)</pre>
    </blockquote>
    <pre>Sure, I'll change to 'const char *p_ = (const char*)(unsigned long)(p)'.

</pre>
    <blockquote type="cite"
      cite="mid:a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,24 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why "MB" when the macro already expands to MB(16)?</pre>
    </blockquote>
    <pre>It should be really dropped, no need for MB in the comment.

</pre>
    <blockquote type="cite"
      cite="mid:a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
- * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Root page table is shared with the initial mapping and is declared
+ * separetely. (look at stage1_pgtbl_root)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: separately

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">  *
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: identity

But more importantly, where's this one L0 ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
+                             (XEN_VIRT_SIZE &gt;&gt; XEN_PT_LEVEL_SHIFT(1)))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
.... in this calculation?</pre>
    </blockquote>
    <pre>L0 for identity mapping is really missed.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------X1Dg8pzsxfI0bhLGsZfq0Npn--

