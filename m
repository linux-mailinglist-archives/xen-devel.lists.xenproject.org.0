Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199AABC8D61
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 13:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140469.1475340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ouc-0006Hq-SN; Thu, 09 Oct 2025 11:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140469.1475340; Thu, 09 Oct 2025 11:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ouc-0006Fq-Oa; Thu, 09 Oct 2025 11:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1140469;
 Thu, 09 Oct 2025 11:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDLD=4S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6oua-0006Fk-UX
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 11:34:21 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e470885a-a503-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 13:34:18 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so155429666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 04:34:18 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5000eddfd9sm595835466b.0.2025.10.09.04.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 04:34:17 -0700 (PDT)
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
X-Inumbo-ID: e470885a-a503-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760009658; x=1760614458; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGuzEHFiOxBpaLR/eGzw9doCnnrqxK9+ztgOGieGKYw=;
        b=nCRKYDdJdyFxGAvLR6u0cgyp17u44ICDbTe+He4EWTE5M4z1tpVPNEQzSow9oHQ8J5
         LVJp+EIvvJWBqp6WtXyPCflSdNt+GSYVvER/arR/7k6oQT71IGZlzAF9meecLX2fdNtV
         FEFaJEwvPwl22d3UtW2fXJVyJ/PXTOv0SPF9XL9QKQ0mNjTojNUBS/rhI9tmT44yBgr9
         hUSoMXpxKqmPXo39KGC5PfbNu5ATZFzn1qo1iW+xMSFyS43JWjvTaCgRWB3SYGrLKEKt
         H027YThJrCCSmFKnuLZBNgxAlavQ6QhDZaRIuiDMfZ/uNAac0Yb1kR6rp4BxD5J6+CPu
         0OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760009658; x=1760614458;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MGuzEHFiOxBpaLR/eGzw9doCnnrqxK9+ztgOGieGKYw=;
        b=DnYFp/p6ihfb/FNxTPJDfl1h23/WgnQ3S2B2HAgKjDEp6+WJz1QTbvtnSSw8aDSnW8
         bFki8MIgfo5Ak1VTwfIFJnip5jHEK+d2ELHrIozpkepQ7dzERQ5oB6qrwPL1V6lIlcst
         G/HZ65zaj3WtOI4xYfpWPmH2BS3A4UO2DEAlJ2fwdlRATIpBhZPTxknAAdNQvQiWeOpj
         fTgDH63/1qBbqSKYYcakyh+L8OjmKkq9I2q6BnbqwzA95qgHEZSKISUxTgtpeeWf1D0O
         PeuJx72wXSdJjE1abOOEKc8wDZQYG7FORSq4sYnZjahAfY/tomjz8Ui+/vwaNUsq5C80
         Aweg==
X-Forwarded-Encrypted: i=1; AJvYcCXjqUc5tXMhqQKJY0C3AQk7GcIKJzSuGMWYEMrmaOxzUT3HuRyQQ9/XNj9LgNslpZ/u6JjZcY2QGpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqZg8tKyurWLUL+mUbeCkWOYSBQvna2id23J+FUbdOQBCnDygm
	9nECHjBDbNSGU/TYVWcugXcQkn9/WGZxbSece5gpY6LKrIkkyS9sSpHM
X-Gm-Gg: ASbGncvJhNZ2rl6UWfUNx4Eg2DQX0TayjdHkJ0/7bMCcOvhT1SWO05JtZKdPqMzHk2i
	85Ug2kTDff6300mf/zSnCGrDrE2hjxAHUlojQMKeBym+ajWcpWAMk3Cphcls4oY37LzAWgBFI/6
	xkgDAIhYzY4OWWCukno4pJVJoGOJQnNg4hkk6iH0WNV0DMPkGfynivsePFIHpDAD6MdDQa3uAVu
	cDYakmBBNhpQrHBKhPktntHJ8YdjsfVNaOQbIsZ53cnNfS24NGWfIA/AJZg1FA43BecPtVYM0Qj
	6LUbfSPA2Y4oOLgJ5oXQVR3brlkiaew8JGJw/JBg/6i8AxEm7HoodHCTy+OnPaGOscfvnF7E5L0
	2YxoadTjLNJEL4+evVDISykHnD8Tgw9QwExQLTKdHQ6Ldhe2trBStBeAZ4VxGEbPxVvWUzCi7Sb
	69AIuGl3O7L/QJeH/N5vLW0uz8lvg=
X-Google-Smtp-Source: AGHT+IGfCbtdYMO7eW0IOyI92dKyXtjfR2bsMwpsdFjgJuuEHJlR8Bxxu/W92MD+KaDV94GsVKbB1w==
X-Received: by 2002:a17:906:f5a6:b0:b3e:9818:30e0 with SMTP id a640c23a62f3a-b50ab08a127mr695765966b.29.1760009657725;
        Thu, 09 Oct 2025 04:34:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sI9YeNqJomGP1PcPi2P5NIbo"
Message-ID: <e875ffa9-28c5-4733-b079-babad3734a9c@gmail.com>
Date: Thu, 9 Oct 2025 13:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
 <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
 <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
 <4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com>

This is a multi-part message in MIME format.
--------------sI9YeNqJomGP1PcPi2P5NIbo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/7/25 3:25 PM, Jan Beulich wrote:
> On 01.10.2025 18:00, Oleksii Kurochko wrote:
>> On 9/23/25 12:41 AM, Jan Beulich wrote:
>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>
>>>> +/*
>>>> + * `pte` – PTE entry for which the type `t` will be stored.
>>>> + *
>>>> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
>>>> + * otherwise, they may be NULL.
>>>> + */
>>>> +static void p2m_set_type(pte_t *pte, const p2m_type_t t,
>>>> +                         struct p2m_pte_ctx *ctx,
>>>> +                         struct p2m_domain *p2m)
>>>>    {
>>>> -    int rc = 0;
>>>> +    /*
>>>> +    * For the root page table (16 KB in size), we need to select the correct
>>>> +    * metadata table, since allocations are 4 KB each. In total, there are
>>>> +    * 4 tables of 4 KB each.
>>>> +    * For none-root page table index of ->pt_page[] will be always 0 as
>>>> +    * index won't be higher then 511. ASSERT() below verifies that.
>>>> +    */
>>>> +    struct page_info **md_pg =
>>>> +        &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.metadata;
>>>> +    pte_t *metadata = NULL;
>>>> +
>>>> +     /* Be sure that an index correspondent to page level is passed. */
>>>> +    ASSERT(ctx->index <= P2M_PAGETABLE_ENTRIES(ctx->level));
>>> Doesn't this need to be < ?
>> Yeah, it should be <.
>>
>>>> +    if ( !*md_pg && (t >= p2m_first_external) )
>>>> +    {
>>>> +        /*
>>>> +         * Ensure that when `t` is stored outside the PTE bits
>>>> +         * (i.e. `t == p2m_ext_storage` or higher),
>>>> +         * both `ctx` and `p2m` are provided.
>>>> +         */
>>>> +        ASSERT(p2m && ctx);
>>> Imo this would want to be checked whenever t > p2m_first_external, no
>>> matter whether a metadata page was already allocated.
>> I think that|ctx| should be checked before this|if| condition, since it is
>> used to obtain the proper metadata page.
>>
>> The check for|p2m| can remain inside the|if| condition, as it is essentially
>> only needed for allocating a metadata page.
> That is, you want to allow callers to pass in NULL for the "p2m" parameter?
> Isn't this going to be risky?

With the current implementation it is not risky and initially I thought that p2m
could be passed NULL for the types which are used for types stored within PTE
as for that type p2m argument isn't really needed.
But just to be sure that something won't be broker in future changes let move
ASSERT(p2m) at the top of the function.

>
>>>> -    if ( t > p2m_first_external )
>>>> -        panic("unimplemeted\n");
>>>> -    else
>>>> +        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
>>>> +        {
>>>> +            struct domain *d = p2m->domain;
>>>> +
>>>> +            *md_pg = p2m_alloc_table(p2m);
>>>> +            if ( !*md_pg )
>>>> +            {
>>>> +                printk("%s: can't allocate extra memory for dom%d\n",
>>>> +                        __func__, d->domain_id);
>>>> +                domain_crash(d);
>>>> +            }
>>>> +        }
>>>> +        else
>>>> +            /*
>>>> +             * It is not legal to set a type for an entry which shouldn't
>>>> +             * be mapped.
>>>> +             */
>>>> +            ASSERT_UNREACHABLE();
>>> Something not being legal doesn't mean it can't happen. Imo in this case
>>> BUG_ON() (in place of the if() above) would be better.
>>>
>>>> +    }
>>>> +
>>>> +    if ( *md_pg )
>>>> +        metadata = __map_domain_page(*md_pg);
> Not this conditional assignment for ...
>
>>>> +    if ( t < p2m_first_external )
>>>> +    {
>>>>            pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>    
>>>> -    return rc;
>>>> +        if ( metadata )
>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>>>> +
>>>> +        metadata[ctx->index].pte = t;
>>> Afaict metadata can still be NULL when you get here.
>> It shouldn't be, because when this line is executed, the metadata page already
>> exists or was allocated at the start of p2m_set_type().
> ... this reply of yours. And the condition there can be false, in case you
> took the domain_crash() path.

Oh, right, for some reason, I thought we didn’t return from|domain_crash()|.
I’m curious whether calling|domain_crash()| might break something, as some useful
data could be freed and negatively affect the internals of|map_regions_p2mt()|.

It might make more sense to use|panic()| here instead.
Do you have any thoughts or suggestions on this?

>
>>>> @@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>>>        {
>>>>            /* We need to split the original page. */
>>>>            pte_t split_pte = *entry;
>>>> +        struct page_info *tbl_pg = virt_to_page(table);
>>> This isn't valid on a pointer obtained from map_domain_page().
>> Oh, sure — virt_to_page() and page_to_virt() should be used only for Xen
>> heap addresses.
>>
>> By the way, do we have any documentation, comments, or notes describing
>> what should be allocated and from where?
>>
>> Since map_domain_page() returns an address from the direct map region,
>> should we instead use maddr_to_page(virt_to_maddr(table))?
> How would that be any better? Even if right now you only build RISC-V code
> with map_domain_page() having a trivial expansion, you will want to avoid
> any assumptions along those lines. Or else you could avoid the use of that
> abstraction altogether. It exists so when you need to support memory
> amounts beyond what the directmap can cover, you can provide a suitable
> implementation of the function and be done. You (or whoever else) in
> particular shouldn't be required to go audit all the places where
> map_domain_page() (and the pointers it returns) is (are) used.

Then|domain_page_map_to_mfn()| is the appropriate function to use, and to
get a page,|mfn_to_page(domain_page_map_to_mfn(virt)) should be called.|

Thanks.

~ Oleksii

--------------sI9YeNqJomGP1PcPi2P5NIbo
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
    <div class="moz-cite-prefix">On 10/7/25 3:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com">
      <pre wrap="" class="moz-quote-pre">On 01.10.2025 18:00, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 9/23/25 12:41 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/*
+ * `pte` – PTE entry for which the type `t` will be stored.
+ *
+ * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
+ * otherwise, they may be NULL.
+ */
+static void p2m_set_type(pte_t *pte, const p2m_type_t t,
+                         struct p2m_pte_ctx *ctx,
+                         struct p2m_domain *p2m)
  {
-    int rc = 0;
+    /*
+    * For the root page table (16 KB in size), we need to select the correct
+    * metadata table, since allocations are 4 KB each. In total, there are
+    * 4 tables of 4 KB each.
+    * For none-root page table index of -&gt;pt_page[] will be always 0 as
+    * index won't be higher then 511. ASSERT() below verifies that.
+    */
+    struct page_info **md_pg =
+        &amp;ctx-&gt;pt_page[ctx-&gt;index / PAGETABLE_ENTRIES].v.md.metadata;
+    pte_t *metadata = NULL;
+
+     /* Be sure that an index correspondent to page level is passed. */
+    ASSERT(ctx-&gt;index &lt;= P2M_PAGETABLE_ENTRIES(ctx-&gt;level));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Doesn't this need to be &lt; ?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yeah, it should be &lt;.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    if ( !*md_pg &amp;&amp; (t &gt;= p2m_first_external) )
+    {
+        /*
+         * Ensure that when `t` is stored outside the PTE bits
+         * (i.e. `t == p2m_ext_storage` or higher),
+         * both `ctx` and `p2m` are provided.
+         */
+        ASSERT(p2m &amp;&amp; ctx);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Imo this would want to be checked whenever t &gt; p2m_first_external, no
matter whether a metadata page was already allocated.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that|ctx| should be checked before this|if| condition, since it is
used to obtain the proper metadata page.

The check for|p2m| can remain inside the|if| condition, as it is essentially
only needed for allocating a metadata page.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That is, you want to allow callers to pass in NULL for the "p2m" parameter?
Isn't this going to be risky?</pre>
    </blockquote>
    <pre>With the current implementation it is not risky and initially I thought that p2m
could be passed NULL for the types which are used for types stored within PTE
as for that type p2m argument isn't really needed.
But just to be sure that something won't be broker in future changes let move
ASSERT(p2m) at the top of the function.

</pre>
    <blockquote type="cite"
      cite="mid:4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">-    if ( t &gt; p2m_first_external )
-        panic("unimplemeted\n");
-    else
+        if ( ctx-&gt;level &lt;= P2M_SUPPORTED_LEVEL_MAPPING )
+        {
+            struct domain *d = p2m-&gt;domain;
+
+            *md_pg = p2m_alloc_table(p2m);
+            if ( !*md_pg )
+            {
+                printk("%s: can't allocate extra memory for dom%d\n",
+                        __func__, d-&gt;domain_id);
+                domain_crash(d);
+            }
+        }
+        else
+            /*
+             * It is not legal to set a type for an entry which shouldn't
+             * be mapped.
+             */
+            ASSERT_UNREACHABLE();
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Something not being legal doesn't mean it can't happen. Imo in this case
BUG_ON() (in place of the if() above) would be better.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    }
+
+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not this conditional assignment for ...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    if ( t &lt; p2m_first_external )
+    {
          pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
  
-    return rc;
+        if ( metadata )
+            metadata[ctx-&gt;index].pte = p2m_invalid;
+    }
+    else
+    {
+        pte-&gt;pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+
+        metadata[ctx-&gt;index].pte = t;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Afaict metadata can still be NULL when you get here.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It shouldn't be, because when this line is executed, the metadata page already
exists or was allocated at the start of p2m_set_type().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this reply of yours. And the condition there can be false, in case you
took the domain_crash() path.</pre>
    </blockquote>
    <pre>Oh, right, for some reason, I thought we didn’t return from <code
    data-start="148" data-end="164">domain_crash()</code>.
I’m curious whether calling <code data-start="194" data-end="210">domain_crash()</code> might break something, as some useful
data could be freed and negatively affect the internals of <code
    data-start="308" data-end="328">map_regions_p2mt()</code>.

It might make more sense to use <code data-start="324" data-end="333">panic()</code> here instead.
Do you have any thoughts or suggestions on this?

</pre>
    <blockquote type="cite"
      cite="mid:4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      {
          /* We need to split the original page. */
          pte_t split_pte = *entry;
+        struct page_info *tbl_pg = virt_to_page(table);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This isn't valid on a pointer obtained from map_domain_page().
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Oh, sure — virt_to_page() and page_to_virt() should be used only for Xen
heap addresses.

By the way, do we have any documentation, comments, or notes describing
what should be allocated and from where?

Since map_domain_page() returns an address from the direct map region,
should we instead use maddr_to_page(virt_to_maddr(table))?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How would that be any better? Even if right now you only build RISC-V code
with map_domain_page() having a trivial expansion, you will want to avoid
any assumptions along those lines. Or else you could avoid the use of that
abstraction altogether. It exists so when you need to support memory
amounts beyond what the directmap can cover, you can provide a suitable
implementation of the function and be done. You (or whoever else) in
particular shouldn't be required to go audit all the places where
map_domain_page() (and the pointers it returns) is (are) used.</pre>
    </blockquote>
    <pre>Then <code data-start="101" data-end="127">domain_page_map_to_mfn()</code> is the appropriate function to use, and to
get a page, <code data-start="187" data-end="230" data-is-only-node="">mfn_to_page(domain_page_map_to_mfn(virt)) should be called.</code>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------sI9YeNqJomGP1PcPi2P5NIbo--

