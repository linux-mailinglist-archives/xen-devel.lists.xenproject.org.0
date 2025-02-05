Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1504A29824
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 18:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882269.1292432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfjcb-0002fd-3Y; Wed, 05 Feb 2025 17:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882269.1292432; Wed, 05 Feb 2025 17:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfjcb-0002do-06; Wed, 05 Feb 2025 17:55:33 +0000
Received: by outflank-mailman (input) for mailman id 882269;
 Wed, 05 Feb 2025 17:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnKU=U4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tfjcY-0002dd-T4
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 17:55:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63087be2-e3ea-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 18:55:29 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7483b9bf7so10424666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 09:55:29 -0800 (PST)
Received: from [192.168.201.60] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7e7asm1140940166b.18.2025.02.05.09.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 09:55:28 -0800 (PST)
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
X-Inumbo-ID: 63087be2-e3ea-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738778129; x=1739382929; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai7JRYF+2FQdzy4A8fqeS4rLWC3BZTdoNDZ3aAmKf3w=;
        b=CR9GWzSu4UcpU7Hl+9Qp4TkU8O+xvtCPBZ4ieACtv8Tv8+bvOnWIKk3Y0+h/ai5Wzf
         uD9ypKtLFcwIl1viYH8zEZf8WcVoImpzJ1N30jD/dJpZaA70ZXKB0rGqWvVQ+704cmuU
         NL98vxU+eHLHBRcYPpsCh9QdAIyqKKKegvnZ71PEJ4x5ccA12Magp8Y3vFZ0cgMbbYRY
         rt+AM9hABkU2ZsRX7PtX+Tfu+580OA5BspgCBf3NK+6KgrV8pQ4wuDbAYZaKZ/LioqV2
         sKpgyE5bXdtOTepcw7W1MnVZHgjX4hGSAbVBxxGN8dzwqzSxusxmaHQZkjFI0I5SC+bJ
         jqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778129; x=1739382929;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ai7JRYF+2FQdzy4A8fqeS4rLWC3BZTdoNDZ3aAmKf3w=;
        b=n0KmXw1HtA8C8BbJCN39C4cUL8F3u2WYyV+uUNw4PVhd1EPRLlPn+W9qWkAeWXbjAd
         Xe+9F1ZssiKvMOuWp8wcFlJavyWA9FXHb9KZOg+cclc8kPKt6FckueUGxDJvKnyWPaIU
         oCj2+N7TQvdqaXdWwwS7qYAp8F6eSvL40k1zk4/YwE+bdGIK9yVUu3UyTMhqcL8cegnx
         fVQzYgyfLhiQNzCh1jNWZJUVtu8ZVkrdRQSUVysWruQo5s0gz4tut8TEzPOwfW07b2yp
         q9SL5090tbimoihTMT84yw7Wlb7KxXI8ncN41TDhy8mOs9giwxXiaWutn5SY+5x1BzWf
         heYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh7WIKmx92qoVolH6LHL4cHiQAotR+w8K0Sa09RVB+stIkdwuwt6MiQLUOoDJe77KWz1rgNhjvZ2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylBY7GYhVMFG7Vnzf27vqDQgGYITi+DN8AiqKoErKUDucHjR3V
	uTTwEEbC4XoVx6jDtpz5gRQOEP+ecIiAgbf8AY0b4V8pxQxr/9dr
X-Gm-Gg: ASbGncsPHVWbEXMNepYOvGDHSTiQKuJSIO3LrZO9WoQGHca9FJSEI6DTWMIbK67H+V2
	1Qi+GaK2ChDUVmQMEvjQCbd3x9+EFhiHLBMdjdjaGr6mYDlxAbySia3fRvk5EIZl5xI6kz19UrK
	qCeBaucXzzKROBdvAbCNqI/RYojGvKgINsqqq2sEdC0WhVxdG6GnPwAez5ArlxvvDjyu6UHAx9h
	ZeRvHncIlpb1ErgpZ37/zPev4Xp9uuebQEqK6HnpFl56l90hOxvQXF7UypsjPt/VM7ZtL+GqW96
	fGyklCdQFleSs8IEpAmWxvQ8xuA=
X-Google-Smtp-Source: AGHT+IH14djPbbcFmaa8uIzAOsiYn/rJaM+plKHifwb8K10/sv9xr9uF4XjQrHFel0BuZWokQuS5ZA==
X-Received: by 2002:a17:907:6094:b0:ab6:f4e7:52f9 with SMTP id a640c23a62f3a-ab75e26494emr385875666b.25.1738778128717;
        Wed, 05 Feb 2025 09:55:28 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------HzACdg8DYyMATRW0iE30XB0v"
Message-ID: <b9d2f4d6-abc9-4aa7-92a5-b89d83ad9ba0@gmail.com>
Date: Wed, 5 Feb 2025 18:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <133526ddccc22ab39dd6841038157d48bd35da81.1738587493.git.oleksii.kurochko@gmail.com>
 <b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com>

This is a multi-part message in MIME format.
--------------HzACdg8DYyMATRW0iE30XB0v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/4/25 3:57 PM, Jan Beulich wrote:
> On 03.02.2025 14:12, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/page.h
>> +++ b/xen/arch/riscv/include/asm/page.h
>> @@ -55,6 +55,22 @@
>>   #define PTE_SMALL       BIT(10, UL)
>>   #define PTE_POPULATE    BIT(11, UL)
>>   
>> +/*
>> + * In the case when modifying or destroying a mapping, it is necessary to
>> + * search until a leaf node is found, instead of searching for a page table
>> + * entry based on the precalculated `level` and `order` (look at pt_update()).
>> + * This is because when `mfn` == INVALID_MFN, the `mask`(in pt_mapping_level())
>> + * will take into account only `vfn`, which could accidentally return an
>> + * incorrect level, leading to the discovery of an incorrect page table entry.
>> + *
>> + * For example, if `vfn` is page table level 1 aligned, but it was mapped as
>> + * page table level 0, then pt_mapping_level() will return `level` = 1,
>> + * since only `vfn` (which is page table level 1 aligned) is taken into account
>> + * when `mfn` == INVALID_MFN (look at pt_mapping_level()).
>> + */
>> +
>> +#define PTE_LEAF_SEARCH BIT(12, UL)
> Is it intended for callers outside of pt.c to make use of this? If not,
> it better wouldn't be globally exposed.
>
> Furthermore, this isn't a property of the PTE(s) to be created, so is
> likely wrong to mix with PTE_* flags. (PTE_POPULATE is on the edge of
> also falling in this category, btw.) Perhaps ...
>
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -187,11 +187,10 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>>   
>>   /* Update an entry at the level @target. */
>>   static int pt_update_entry(mfn_t root, vaddr_t virt,
>> -                           mfn_t mfn, unsigned int target,
>> +                           mfn_t mfn, unsigned int *target,
> ... you instead want to have callers of this function preset *target
> to a special value (e.g. UINT_MAX or CONFIG_PAGING_LEVELS) indicating
> the level is wanted as an output.

I thought about this way but decided to use a separate for PTE_* flag which looked to me more clearer, at
that moment. But I didn't take into account that it will be used only inside pt.c, so I agree that it should
declared locally in pt.c and used for that a special value. I will update correspondingly.

>
>> @@ -205,39 +204,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>>       bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
>>       pte_t pte, *entry;
>>   
>> -    /* convenience aliases */
>> -    DECLARE_OFFSETS(offsets, virt);
>> -
>> -    table = map_table(root);
>> -    for ( ; level > target; level-- )
>> +    if ( flags & PTE_LEAF_SEARCH )
>>       {
>> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>> -        if ( rc == XEN_TABLE_MAP_NOMEM )
>> +        entry = pt_walk(virt, target);
>> +        BUG_ON(!pte_is_mapping(*entry));
> Is this really necessarily a bug? Can't one want to determine how deep
> the (populated) page tables are for a given VA?

pt_walk() could be used in that way but PTE_LEAF_SEARCH won't be used for page table populating:
     if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
     {
         flags |= PTE_LEAF_SEARCH;
     }
so in the current version of the patch only mapped VA <-> PA is expected to be in this part of the code.


>
> Hmm, here I can see why you have pt_walk() return a pointer. As per the
> comment on the earlier patch, I don't think this is a good idea. You
> may want to have
>
> static pte_t *_pt_walk(...)
> {
>      ...
> }
>
> pte_t pt_walk(...)
> {
>      return *_pt_walk(...);
> }

It would be better to do in this way.

>
>> @@ -345,9 +353,6 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
>>           return level;
>>   
>>       /*
>> -     * Don't take into account the MFN when removing mapping (i.e
>> -     * MFN_INVALID) to calculate the correct target order.
>> -     *
>>        * `vfn` and `mfn` must be both superpage aligned.
>>        * They are or-ed together and then checked against the size of
>>        * each level.
> You drop part of the comment without altering the code being commented.
> What's the deal?

These changes are the part of v1 version of this functions. Basically I did incorrect reverting. Thanks for noticing
that, I have to return this comments back.


>
>> @@ -415,19 +420,33 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>>   
>>       spin_lock(&pt_lock);
>>   
>> -    while ( left )
>> +    /* look at the comment above the definition of PTE_LEAF_SEARCH */
>> +    if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
>>       {
>> -        unsigned int order, level;
>> +        flags |= PTE_LEAF_SEARCH;
>> +    }
> For readability I think it would be better if the figure braces were
> dropped.
>
>> -        level = pt_mapping_level(vfn, mfn, left, flags);
>> -        order = XEN_PT_LEVEL_ORDER(level);
>> +    while ( left )
>> +    {
>> +        unsigned int order = 0, level;
>>   
>> -        ASSERT(left >= BIT(order, UL));
>> +        if ( !(flags & PTE_LEAF_SEARCH) )
>> +        {
>> +            level = pt_mapping_level(vfn, mfn, left, flags);
>> +            order = XEN_PT_LEVEL_ORDER(level);
>> +            ASSERT(left >= BIT(order, UL));
> Assignment to order and assertion are ...
>
>> +        }
>>   
>> -        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level, flags);
>> +        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, &level, flags);
>>           if ( rc )
>>               break;
>>   
>> +        if ( flags & PTE_LEAF_SEARCH )
>> +        {
>> +            order = XEN_PT_LEVEL_ORDER(level);
>> +            ASSERT(left >= BIT(order, UL));
>> +        }
> ... repeated here, with neither left nor order being passed into
> pt_update_entry(). Does this really need doing twice? (I have to
> admit that I have trouble determining what the assertion is about.
> For order alone it clearly could be done centrally after the call.)

Sure, it could be done just once.

Regarding ASSERT() itself it was added to be sure that pt_mapping_level() returns proper `level`.
I am not really sure that it is needed anymore.

~ Oleksii

--------------HzACdg8DYyMATRW0iE30XB0v
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
    <div class="moz-cite-prefix">On 2/4/25 3:57 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 03.02.2025 14:12, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -55,6 +55,22 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+/*
+ * In the case when modifying or destroying a mapping, it is necessary to
+ * search until a leaf node is found, instead of searching for a page table
+ * entry based on the precalculated `level` and `order` (look at pt_update()).
+ * This is because when `mfn` == INVALID_MFN, the `mask`(in pt_mapping_level())
+ * will take into account only `vfn`, which could accidentally return an
+ * incorrect level, leading to the discovery of an incorrect page table entry.
+ *
+ * For example, if `vfn` is page table level 1 aligned, but it was mapped as
+ * page table level 0, then pt_mapping_level() will return `level` = 1,
+ * since only `vfn` (which is page table level 1 aligned) is taken into account
+ * when `mfn` == INVALID_MFN (look at pt_mapping_level()).
+ */
+
+#define PTE_LEAF_SEARCH BIT(12, UL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is it intended for callers outside of pt.c to make use of this? If not,
it better wouldn't be globally exposed.

Furthermore, this isn't a property of the PTE(s) to be created, so is
likely wrong to mix with PTE_* flags. (PTE_POPULATE is on the edge of
also falling in this category, btw.) Perhaps ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -187,11 +187,10 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
 
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
-                           mfn_t mfn, unsigned int target,
+                           mfn_t mfn, unsigned int *target,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... you instead want to have callers of this function preset *target
to a special value (e.g. UINT_MAX or CONFIG_PAGING_LEVELS) indicating
the level is wanted as an output.</pre>
    </blockquote>
    <pre>I thought about this way but decided to use a separate for PTE_* flag which looked to me more clearer, at
that moment. But I didn't take into account that it will be used only inside pt.c, so I agree that it should
declared locally in pt.c and used for that a special value. I will update correspondingly.</pre>
    <blockquote type="cite"
      cite="mid:b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -205,39 +204,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags &amp; PTE_POPULATE);
     pte_t pte, *entry;
 
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, virt);
-
-    table = map_table(root);
-    for ( ; level &gt; target; level-- )
+    if ( flags &amp; PTE_LEAF_SEARCH )
     {
-        rc = pt_next_level(alloc_tbl, &amp;table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        entry = pt_walk(virt, target);
+        BUG_ON(!pte_is_mapping(*entry));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this really necessarily a bug? Can't one want to determine how deep
the (populated) page tables are for a given VA?</pre>
    </blockquote>
    <pre>pt_walk() could be used in that way but PTE_LEAF_SEARCH won't be used for page table populating:
    if ( mfn_eq(mfn, INVALID_MFN) &amp;&amp; !(flags &amp; PTE_POPULATE) )
    {
        flags |= PTE_LEAF_SEARCH;
    }
so in the current version of the patch only mapped VA &lt;-&gt; PA is expected to be in this part of the code.


</pre>
    <blockquote type="cite"
      cite="mid:b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com">
      <pre wrap="" class="moz-quote-pre">

Hmm, here I can see why you have pt_walk() return a pointer. As per the
comment on the earlier patch, I don't think this is a good idea. You
may want to have

static pte_t *_pt_walk(...)
{
    ...
}

pte_t pt_walk(...)
{
    return *_pt_walk(...);
}</pre>
    </blockquote>
    <pre>It would be better to do in this way.

</pre>
    <blockquote type="cite"
      cite="mid:b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -345,9 +353,6 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
         return level;
 
     /*
-     * Don't take into account the MFN when removing mapping (i.e
-     * MFN_INVALID) to calculate the correct target order.
-     *
      * `vfn` and `mfn` must be both superpage aligned.
      * They are or-ed together and then checked against the size of
      * each level.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You drop part of the comment without altering the code being commented.
What's the deal?</pre>
    </blockquote>
    <pre>These changes are the part of v1 version of this functions. Basically I did incorrect reverting. Thanks for noticing
that, I have to return this comments back.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -415,19 +420,33 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 
     spin_lock(&amp;pt_lock);
 
-    while ( left )
+    /* look at the comment above the definition of PTE_LEAF_SEARCH */
+    if ( mfn_eq(mfn, INVALID_MFN) &amp;&amp; !(flags &amp; PTE_POPULATE) )
     {
-        unsigned int order, level;
+        flags |= PTE_LEAF_SEARCH;
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For readability I think it would be better if the figure braces were
dropped.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-        level = pt_mapping_level(vfn, mfn, left, flags);
-        order = XEN_PT_LEVEL_ORDER(level);
+    while ( left )
+    {
+        unsigned int order = 0, level;
 
-        ASSERT(left &gt;= BIT(order, UL));
+        if ( !(flags &amp; PTE_LEAF_SEARCH) )
+        {
+            level = pt_mapping_level(vfn, mfn, left, flags);
+            order = XEN_PT_LEVEL_ORDER(level);
+            ASSERT(left &gt;= BIT(order, UL));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Assignment to order and assertion are ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        }
 
-        rc = pt_update_entry(root, vfn &lt;&lt; PAGE_SHIFT, mfn, level, flags);
+        rc = pt_update_entry(root, vfn &lt;&lt; PAGE_SHIFT, mfn, &amp;level, flags);
         if ( rc )
             break;
 
+        if ( flags &amp; PTE_LEAF_SEARCH )
+        {
+            order = XEN_PT_LEVEL_ORDER(level);
+            ASSERT(left &gt;= BIT(order, UL));
+        }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... repeated here, with neither left nor order being passed into
pt_update_entry(). Does this really need doing twice? (I have to
admit that I have trouble determining what the assertion is about.
For order alone it clearly could be done centrally after the call.)</pre>
    </blockquote>
    <pre>Sure, it could be done just once.

Regarding ASSERT() itself it was added to be sure that pt_mapping_level() returns proper `level`.
I am not really sure that it is needed anymore.

~ Oleksii
</pre>
  </body>
</html>

--------------HzACdg8DYyMATRW0iE30XB0v--

