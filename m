Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE4BA987E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 16:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132934.1471140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3EnK-00066e-D4; Mon, 29 Sep 2025 14:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132934.1471140; Mon, 29 Sep 2025 14:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3EnK-00065C-AS; Mon, 29 Sep 2025 14:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1132934;
 Mon, 29 Sep 2025 14:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4Dr=4I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3EnJ-000656-2b
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 14:24:01 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef9ad754-9d3f-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 16:23:57 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-634cdb5ed4bso5116940a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 07:23:57 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3af53basm8153889a12.41.2025.09.29.07.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 07:23:56 -0700 (PDT)
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
X-Inumbo-ID: ef9ad754-9d3f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155837; x=1759760637; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U04Z7yzzaE6hIKAJsqBSoKWQhf5uESKV5oZ4D+OVpmY=;
        b=NypgUortlsXONT1N5R2Iytb4Q7LZdqPrPho94pF6+7SV9hivFAoNuwgORXCAiuRYWN
         /xjqqLSXA5pdxW2HZoFeUBK48qY9K3qTKPquloKgnJP+W0MfFWqSXDFIsU7TKaT1zmHs
         Xmz6iaTY8Ay9YrALO2uyT+jaLvxDFR4V/TWrttYsMyMMtkroNT2gGVbQchxcaVkWoMbn
         5UuE6b6ZRQtyAJjfcr9/lHaA7LEULA2JiLwlFVyVmUeITB+pKrgPT8PC9WiYlX/evoN5
         0hTQCUZuW7kEyE+kyZcMoC1ZR/D0ha78g5GxOXjqvznJfBbZMRpkO2lnsaNuSIQwu7LQ
         o74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155837; x=1759760637;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U04Z7yzzaE6hIKAJsqBSoKWQhf5uESKV5oZ4D+OVpmY=;
        b=RpVw+vXwD+Z1xtObNvixEEzQzuAN6suD70GzkwiAT3CJ3CZNk4zKSGkaIhAICOLoqU
         z80Eb4mXQJU4/wxJY5AfHoGTn7IHqPGvCCYFtmDLH6p06G7fzsNJDNYiDJVRmtXof2c+
         yh3Q0KDOD1d1z0j0p3vTfMB/fDXroWOjNYAEtBZE0b7Yjcsj9xJgYsN6rn9AO8v11w+z
         qsQcM1n8u8KzMlgX4teyvKIPSTL/vFDuaaDZjcn4B1cmIwKAhy4eVps2SiyWzAMqFz2f
         9+oVOHQ4NsdpSZeS8B5VFcT3BZVVq5VgLyRrMfF2OAFZXPvoTOaf30rqbxYB23E804to
         xrXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+vNtoNCbimU7dDjD+lKyRIQc2qnfLi+m23d3PsffzIjNFjdoNiQ+EW8qWPz7QqGB6IQbdcK5s6Mg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzkhns5TEPFN22566oeFP/8418SNqft8VSaNnAwBCtJhF+ywkWa
	Sdn1OmpWzikEWyuoe746dagPRASiITVwthJQop7e/GRoK8BRAX+ml0IT
X-Gm-Gg: ASbGncu3Z5qy0lovXFOn0o9YUYfbTPRFfJgY0/OxawOS2sSlAQRo7xy2RzfdfEMJjRF
	yOI3C+pZpSk0FpYGbN1cVaiuEo6cuvpmIaBPFQiBNr4mbdv4vjGMKMF3oSyP+bRU/rL/MUHhwvW
	uIXm9ky8WV+LZ1HXItSJOZ5znrivlcoG0fSpNLoEExrpXvZx10D5oIB7GxSTd0xVTz1VMI6RInf
	dPdqjzGp0Xo0tI5qfajHXYOTy48YzR2lfQpMnKY2EtY3kbb2qaCyLf+yLwPuxMe/FI1bXxXiANv
	kUyNz5WffEkLOyyBxM/JhHlfdLY1VeQU//2WSo/NeeEKZihEW+C2iO/DPuHuurTrHFbF2JjE6P5
	b5haR8/u3OfBr0IGNswC8O4d3Z43q4OkGzKHR9nQ62HFiLozh9ed4V/p4Aml9myJrU8x5mOFLzl
	uRQJ3OJis=
X-Google-Smtp-Source: AGHT+IGrCzC4MIiHGk4+i5jfy2zEh41CwxYsegV9UEKySlDJ1A776Ip8nj4jZYBFbqrip13b5jydrg==
X-Received: by 2002:a17:907:9815:b0:b30:ea06:af29 with SMTP id a640c23a62f3a-b34b7fbb555mr2030666566b.16.1759155836945;
        Mon, 29 Sep 2025 07:23:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8H0VGdflyirX1eYzMJ7CUBH0"
Message-ID: <98699f1b-0cc5-4e73-9d2e-865f2e3d0b0f@gmail.com>
Date: Mon, 29 Sep 2025 16:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] xen/riscv: implement p2m_next_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <30a203de44b04a06613aa1f873a072a4594c5bb4.1758145428.git.oleksii.kurochko@gmail.com>
 <0cf7a47f-f852-479a-bfb2-2f723f66c72e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0cf7a47f-f852-479a-bfb2-2f723f66c72e@suse.com>

This is a multi-part message in MIME format.
--------------8H0VGdflyirX1eYzMJ7CUBH0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/22/25 7:35 PM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> Implement the p2m_next_level() function, which enables traversal and dynamic
>> allocation of intermediate levels (if necessary) in the RISC-V
>> p2m (physical-to-machine) page table hierarchy.
>>
>> To support this, the following helpers are introduced:
>> - page_to_p2m_table(): Constructs non-leaf PTEs pointing to next-level page
>>    tables with correct attributes.
>> - p2m_alloc_page(): Allocates page table pages, supporting both hardware and
>>    guest domains.
>> - p2m_create_table(): Allocates and initializes a new page table page and
>>    installs it into the hierarchy.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V4:
>>   - make `page` argument of page_to_p2m_table pointer-to-const.
>>   - Move p2m_next_level()'s local variable `ret` to the more narrow space where
>>     it is really used.
>>   - Drop stale ASSERT() in p2m_next_level().
>>   - Stray blank after * in declaration of paging_alloc_page().
> When you deal with comments like this, can you please make sure you
> apply them to at least a patch as a whole, if not the entire series?
> I notice ...
>
>> --- a/xen/arch/riscv/include/asm/paging.h
>> +++ b/xen/arch/riscv/include/asm/paging.h
>> @@ -15,4 +15,6 @@ int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages);
>>   
>>   void paging_free_page(struct domain *d, struct page_info *pg);
>>   
>> +struct page_info * paging_alloc_page(struct domain *d);
> ... there's still a stray blank here. With this dropped:
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks.

> I have one other question, though:
>
>> +/*
>> + * Allocate a new page table page with an extra metadata page and hook it
>> + * in via the given entry.
>> + */
>> +static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
>> +{
>> +    struct page_info *page;
>> +
>> +    ASSERT(!pte_is_valid(*entry));
> Isn't this going to get in the way of splitting superpages? The caller
> will need to initialize *entry just for this assertion to not trigger.

The superpage splitting function doesn’t use|p2m_create_table()|. It calls
|p2m_alloc_table()|, then fills the table, and finally updates the entry
using|p2m_write_pte()|. So this shouldn’t be an issue.

Ohh, I just noticed, the comment should be updated, since an extra metadata
page is no longer allocated here.

~ Oleksii

--------------8H0VGdflyirX1eYzMJ7CUBH0
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
    <div class="moz-cite-prefix">On 9/22/25 7:35 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0cf7a47f-f852-479a-bfb2-2f723f66c72e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implement the p2m_next_level() function, which enables traversal and dynamic
allocation of intermediate levels (if necessary) in the RISC-V
p2m (physical-to-machine) page table hierarchy.

To support this, the following helpers are introduced:
- page_to_p2m_table(): Constructs non-leaf PTEs pointing to next-level page
  tables with correct attributes.
- p2m_alloc_page(): Allocates page table pages, supporting both hardware and
  guest domains.
- p2m_create_table(): Allocates and initializes a new page table page and
  installs it into the hierarchy.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V4:
 - make `page` argument of page_to_p2m_table pointer-to-const.
 - Move p2m_next_level()'s local variable `ret` to the more narrow space where
   it is really used.
 - Drop stale ASSERT() in p2m_next_level().
 - Stray blank after * in declaration of paging_alloc_page().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
When you deal with comments like this, can you please make sure you
apply them to at least a patch as a whole, if not the entire series?
I notice ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -15,4 +15,6 @@ int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages);
 
 void paging_free_page(struct domain *d, struct page_info *pg);
 
+struct page_info * paging_alloc_page(struct domain *d);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... there's still a stray blank here. With this dropped:
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.
</pre>
    <blockquote type="cite"
      cite="mid:0cf7a47f-f852-479a-bfb2-2f723f66c72e@suse.com">
      <pre wrap="" class="moz-quote-pre">I have one other question, though:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Allocate a new page table page with an extra metadata page and hook it
+ * in via the given entry.
+ */
+static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
+{
+    struct page_info *page;
+
+    ASSERT(!pte_is_valid(*entry));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Isn't this going to get in the way of splitting superpages? The caller
will need to initialize *entry just for this assertion to not trigger.</pre>
    </blockquote>
    <pre data-start="62" data-end="268">The superpage splitting function doesn’t use <code
    data-start="107" data-end="127">p2m_create_table()</code>. It calls
<code data-start="138" data-end="157">p2m_alloc_table()</code>, then fills the table, and finally updates the entry
using <code data-start="217" data-end="234">p2m_write_pte()</code>. So this shouldn’t be an issue.</pre>
    <pre data-start="270" data-end="366">Ohh, I just noticed, the comment should be updated, since an extra metadata
page is no longer allocated here.</pre>
    <pre>
~ Oleksii</pre>
  </body>
</html>

--------------8H0VGdflyirX1eYzMJ7CUBH0--

