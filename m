Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59360A32476
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886318.1295988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAg5-00039G-QY; Wed, 12 Feb 2025 11:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886318.1295988; Wed, 12 Feb 2025 11:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAg5-00037o-Nv; Wed, 12 Feb 2025 11:13:13 +0000
Received: by outflank-mailman (input) for mailman id 886318;
 Wed, 12 Feb 2025 11:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiAg4-000369-Lo
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:13:12 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b350bc-e932-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 12:13:08 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30613802a59so64633781fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:13:08 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308fbe19d00sm5305711fa.90.2025.02.12.03.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:13:07 -0800 (PST)
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
X-Inumbo-ID: 56b350bc-e932-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739358788; x=1739963588; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdfvwGaW7V3itSTPHu7uNUlm54qy4GOHVs3HSdNgu1c=;
        b=XkxP2upY98HQrluc8kdTfVMe1plxqI8/o/zdfraNCvMMKDMcaDCT1NpY7m6d8oSDSa
         WG+BzOH/PduUfXoBa6zVaUn5bZ2YuLAx/+RZiPobeoOqgVBXY7FjyOt8Ac/XqYrOoQIP
         hi0eIaa4fCQZIJais+DpadcEyQanFS7HaydoO+TGygVjiJhQav0OeN5gBfwYMoVxFsaT
         p17gLHVqAOhM/+bkg10rp1CiAkYdk55i7vewBO+7VspJGgBng+b1b4DJ7oqtH0mxS8IF
         Z2s1s/dZCU3M/oGaDDPNtJeWy6ExvElF0sZv1YWxsMpV1wzZ5PniqV4w4NGXS/LLsCYn
         l+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358788; x=1739963588;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdfvwGaW7V3itSTPHu7uNUlm54qy4GOHVs3HSdNgu1c=;
        b=B+sR4RiDHCmJ7xpwUgJc+i6F0zZQNM9XL6M69Hrikp+GUV07nfpRz2Ys1tbb5nUaSE
         b01wevJ+cBNFQObf7qJQ1FdpNxFJ1oalVluLXHSskglPyz4n+z4ucZxFH17JmPGUq1oP
         2l/AU9Rn8H/KyCKJDAKrYBEwlZxRidCRE3XxMoAE5JGBqGcFXbYRIRtg9nwY0xAFdaMp
         grK7DD552d6h9WCImw2e33y6kSPak2MTVA+gz1r7RdtQHgvsODcWc7fCO/YhSERef4yg
         5KinBXX+uBcWOTxtio21lQmFIRcyAglCHbwXNRBqjnrRml/43mI0Iky5J1JN31PQ6RWw
         I70Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9LnUazgyAbgqwPIdZ7wYtuSFfStWUGlmBkoqNSykw8qSsdRpXIMKIFV52t5/ChZRNy/F94utFEyU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtn56So/0KX+yyrSmMYo4IdOQfUp5Pqy7zt1EAe9/yCiQOuB3A
	VY8Kr+hBz00uWB1QhDzULv+kBT3RtCuXk9ZCnJLejvjePVx523eP
X-Gm-Gg: ASbGncv1lsGuRse736nQzHXmT8t2/Nbo4JPLIUQFTZEoHX7ggWV/cx2mu298HFKKIdn
	mtQc1ufQx0hSVNfgRoqJN+OfwG4aIwfUWszM/bPur7aHkq0d62mjqeSn+8N94lJcw6ecE9fcrE8
	qEhHv0rxF9r6+BBZhylo1XZbRD2cNrs2Gl01Mw6UsmaK5+M5OVXvIIWK0rW/Qrnbel91av/zlC1
	D2EId5sWtQM0Ad4qwjbvThyDipNnxggldC25BS9yG9uxCxU+cffh5nqW0NB1pBXVJ7UDvW0jxLd
	t/2mHx1uxP7CA4jjyZAi6UmWZoY=
X-Google-Smtp-Source: AGHT+IH2y3o3mTN0othTEzaQi1t/qRQzA5b3zWt1wmXVXzE0feVwkHiWdJX9Dzmd+Ft4JqRvosy/5A==
X-Received: by 2002:a2e:be20:0:b0:302:29a5:6e21 with SMTP id 38308e7fff4ca-30903630782mr9828391fa.3.1739358787463;
        Wed, 12 Feb 2025 03:13:07 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------jD2o2gxx7UgQYkxS2VO5zifk"
Message-ID: <78b67cb7-5bc0-4292-987f-d22e199d83ae@gmail.com>
Date: Wed, 12 Feb 2025 12:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 1/3] xen/riscv: implement software page table
 walking
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
 <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>

This is a multi-part message in MIME format.
--------------jD2o2gxx7UgQYkxS2VO5zifk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/10/25 5:32 PM, Jan Beulich wrote:
> On 07.02.2025 14:13, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>>       return XEN_TABLE_NORMAL;
>>   }
>>   
>> +/*
>> + * _pt_walk() performs software page table walking and returns the pte_t of
>> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
>> + * for further analysis.
>> + * Additionally, _pt_walk() returns the level of the found pte.
> That's optional, which I think wants expressing here.
>
>> + */
>> +static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
>> +{
>> +    const mfn_t root = get_root_page();
>> +    unsigned int level;
>> +    pte_t *table;
>> +
>> +    DECLARE_OFFSETS(offsets, va);
>> +
>> +    table = map_table(root);
> This mapping operation doesn't look to have a counterpart. Aiui ...
>
>> +    /*
>> +     * Find `table` of an entry which corresponds to `va` by iterating for each
>> +     * page level and checking if the entry points to a next page table or
>> +     * to a page.
>> +     *
>> +     * Two cases are possible:
>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
>> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
>> +     *   pt_next_level() is called for page table level 0, it results in the
>> +     *   entry being a pointer to a leaf node, thereby returning
>> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>> +     *   mapped.
>> +     */
>> +    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
>> +    {
>> +        int ret = pt_next_level(false, &table, offsets[level]);
> ... the mapping may be replaced here, but a new mapping will then still
> be held by this function and ...
>
>> +        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
>> +            break;
>> +
>> +        ASSERT(level);
>> +    }
>> +
>> +    if ( pte_level )
>> +        *pte_level = level;
>> +
>> +    return table + offsets[level];
>> +}
> ... the final one then be transferred to the caller.
>
>> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>> +{
>> +    return *_pt_walk(va, pte_level);
>> +}
> Hence aiui there needs to be an unmap operation here.

As _pt_walk() returns page table entry, it is needed to transform entry to table.

Do we have any function in Xen for that?

Or the best I can do is:
   pte_t *table = *_pt_walk(va, pte_level) - TABLE_OFFSET(pt_linear_offset(*pte_level, va)
(of course, it is needed to check if pte_level isn't null and do some extra actions if it is NULL)

As an option, as all page tables are PAGE_SIZE aligned, we could use PAGE_OFFSET():
  pte_t *entry = _pt_walk(va, pte_level);
  pte_t *table = PAGE_OFFSET(entry);

~ Oleksii


--------------jD2o2gxx7UgQYkxS2VO5zifk
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
    <div class="moz-cite-prefix">On 2/10/25 5:32 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.02.2025 14:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
     return XEN_TABLE_NORMAL;
 }
 
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ * Additionally, _pt_walk() returns the level of the found pte.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's optional, which I think wants expressing here.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    const mfn_t root = get_root_page();
+    unsigned int level;
+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This mapping operation doesn't look to have a counterpart. Aiui ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /*
+     * Find `table` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
+     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
+     *   pt_next_level() is called for page table level 0, it results in the
+     *   entry being a pointer to a leaf node, thereby returning
+     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
+    {
+        int ret = pt_next_level(false, &amp;table, offsets[level]);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the mapping may be replaced here, but a new mapping will then still
be held by this function and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
+            break;
+
+        ASSERT(level);
+    }
+
+    if ( pte_level )
+        *pte_level = level;
+
+    return table + offsets[level];
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the final one then be transferred to the caller.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    return *_pt_walk(va, pte_level);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hence aiui there needs to be an unmap operation here.</pre>
    </blockquote>
    <pre>As _pt_walk() returns page table entry, it is needed to transform entry to table.

Do we have any function in Xen for that?

Or the best I can do is:
  pte_t *table = *_pt_walk(va, pte_level) - TABLE_OFFSET(pt_linear_offset(*pte_level, va)
(of course, it is needed to check if pte_level isn't null and do some extra actions if it is NULL)

As an option, as all page tables are PAGE_SIZE aligned, we could use PAGE_OFFSET():
 pte_t *entry = _pt_walk(va, pte_level);
 pte_t *table = PAGE_OFFSET(entry);

~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------jD2o2gxx7UgQYkxS2VO5zifk--

