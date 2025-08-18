Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C7B29BE9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085581.1443895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv8V-0006tH-0h; Mon, 18 Aug 2025 08:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085581.1443895; Mon, 18 Aug 2025 08:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv8U-0006q9-UC; Mon, 18 Aug 2025 08:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1085581;
 Mon, 18 Aug 2025 08:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQjc=26=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1unv8T-0006q3-20
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:22:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8e38fc-7c0c-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 10:22:32 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso613063466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:22:32 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccbb7sm759512366b.79.2025.08.18.01.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:22:30 -0700 (PDT)
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
X-Inumbo-ID: 7c8e38fc-7c0c-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755505351; x=1756110151; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRtB3XWqryub4ZyYPikWvB3iVIfbkwlh8Xkj2D4+MJw=;
        b=nLEAD+tu0Kt+G9Y8FwK1B3I12PTyqxTSlBzk7A88xK9o49m/0dgysN2+JAn4RMkKQR
         eBnsYqsOqi6XU0o+I5adeiYdgB3sJijKeDnlRQrde5GIdBJAmfvLxWymQc1xGxoVYvwd
         XfSlKzZYjkGqvjeciVtYX39FEnL/43/rfnLOsXJd4+DR9e7UyZMX5Gn/+kCL08oGk4dh
         AahBYuIbQ+CsKsL6oZI4x36IIxu96CaIwU4YHmM4ApTLMRp5/put0I67NkXQV6ZIOY5+
         vFwhYZuRvXZpRdgvc7z343ra0gIZIhjV3mZzliEvV+9/CHELw6GXC3nyydmE3QkS1hy9
         +LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505351; x=1756110151;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RRtB3XWqryub4ZyYPikWvB3iVIfbkwlh8Xkj2D4+MJw=;
        b=Yh5kOVB6kRzXDPY/s9c3S91gmpLYypJIrnrQmaTdORktaZvpru4H0rcOduJB2fZ7bb
         S4k5sY4m+Pw2bXXTT5z7gOUDBKdgB/ii6GgFY5kiSndepeoxkaTHlXv/BFS+Ad8qWIE6
         Eil3IHHD5F314ovaZoZnYnRvVbkP4330VfQorWDD2Yh73IhB3MTvz/G27QekA4LIBA4R
         3ze35w+1ekfVgOUCbX1ReEE27dCJ8TrrGlpidsJTFcoBmgKDn23jTqSZHCXFssnCZqRa
         NMxcYOYoD17RPp71EK1muuASGuGP4PihQ1YnLT4cf8ZFOjV9zZ4OFMmSpenJSCJTXrZe
         nSIg==
X-Forwarded-Encrypted: i=1; AJvYcCVt+2fcWfOVTWXB3ECfmIWfjfGIR874wfmmAjSzsE7y9J1dWEPOfw5Lngg7y6XxXIQxMDotlnzFdKs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxOMKzsqjjemv/rw/zkILe+nY0B+cNZ5qxIBuG6qNeC1YD3+de
	QCuIQGC0MrTHPppMdHNdpPQ9wJkPzicDOX1pfbeo5/Vwx3IHFARFI3qE
X-Gm-Gg: ASbGncv4yWGA/7lcHSLkrZHOb+dAN8bZzzvIvukKlwYdyOwdk6l0ChOThE9/QBVJS0d
	lFyehGZWQ1FWcLJIEXr7MLvit+UbWB+umSOEHqgyFwCZFaScnUjqgDog0Dog5+TC4zwRRTszL+W
	4L/q0Z8O9ALcMh4jfoFsE+b1fxbeWrjgz9evX3Qh7caNPgW7Ce0mbjp0h5qkTyCDrty0c5q6tec
	2pIlAHAOY7S+r7mqis83824erZXFsrTn42t34oRwdaV+tBf8ycWFb1D7/l+utdRbaH01IDjFIoE
	ve7Y1bOmeMFzSTxP3yKjLXBqY0c9crJPT0ADWHqngBXOEwfA8sp+7ObaMQjt2PKG2ZXVZykEIYK
	ystDTJLhzXgjHWPA9TTBwxC3BPy835FNLv92Lv0kvLuFXYL1HuWKaim2tv3+lBfa7O9AJViA=
X-Google-Smtp-Source: AGHT+IGJV9ajKmwgyV00Kv1J/nWojG6fFn8XBu+j8FlEHR1eDFahOpm9PnJMOQxMnNYT+XStLi+qPg==
X-Received: by 2002:a17:907:d92:b0:af9:3019:6aef with SMTP id a640c23a62f3a-afcdc1c0a4fmr1125457666b.10.1755505351103;
        Mon, 18 Aug 2025 01:22:31 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FknOeCGiPYNNZXbR6X29R0Mx"
Message-ID: <3fc9f081-e358-4972-a39b-fab0494433c4@gmail.com>
Date: Mon, 18 Aug 2025 10:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 13/20] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <41845723a7b0e3efd09095d13e57aace6f7747ef.1753973161.git.oleksii.kurochko@gmail.com>
 <98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com>
 <c8a07c48-b79b-4136-a265-91c14bb96c81@gmail.com>
 <117e35e0-d23e-4527-964a-82fa2bed57fd@suse.com>
Content-Language: en-US
In-Reply-To: <117e35e0-d23e-4527-964a-82fa2bed57fd@suse.com>

This is a multi-part message in MIME format.
--------------FknOeCGiPYNNZXbR6X29R0Mx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/14/25 5:17 PM, Jan Beulich wrote:
> On 14.08.2025 17:09, Oleksii Kurochko wrote:
>> On 8/6/25 5:55 PM, Jan Beulich wrote:
>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>> +/* Put any references on the page referenced by pte. */
>>>> +static void p2m_put_page(const pte_t pte, unsigned int level)
>>>> +{
>>>> +    mfn_t mfn = pte_get_mfn(pte);
>>>> +    p2m_type_t p2m_type = p2m_get_type(pte);
>>>> +
>>>> +    ASSERT(pte_is_valid(pte));
>>>> +
>>>> +    /*
>>>> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
>>>> +     * preemptible and therefore some work is needed to handle such
>>>> +     * superpages, for which at some point Xen might end up freeing memory
>>>> +     * and therefore for such a big mapping it could end up in a very long
>>>> +     * operation.
>>>> +     */
>>>> +    switch ( level )
>>>> +    {
>>>> +    case 1:
>>>> +        return p2m_put_2m_superpage(mfn, p2m_type);
>>>> +
>>>> +    case 0:
>>>> +        return p2m_put_4k_page(mfn, p2m_type);
>>>> +    }
>>> Yet despite the comment not even an assertion for level 2 and up?
>> Not sure that an ASSERT() is needed here as a reference(s) for such page(s)
>> will be put during domain_relinquish_resources() as there we could do preemption.
>> Something like Arm does here:
>>     https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587
>>
>> I'm thinking that probably it makes sense to put only 4k page(s) and
>> all other cases postpone until domain_relinquish_resources() is called.
> How can you defer to domain cleanup? How would handling of foreign mappings
> (or e.g. ballooning? not sure) work when you don't drop references as
> necessary?

I was confused by the code in|relinquish_p2m_mapping()|, since it removes
foreign mappings from the P2M. My current understanding is that it is called
for foreign mappings that weren’t explicitly unmapped, in order to drop the
page reference taken when the mapping was created. Initially, I thought it
would be enough to just perform the (un)map in the P2M page tables to have
foreign mapping working, but that could result in a page never being fully
released, which would in turn break or confuse other logic.

So, yes, I agree that your initial suggestion to add ASSERT() is useful to
be sure that no one is using level 2 super-pages for foreign mapping.

>>>>    /* Free pte sub-tree behind an entry */
>>>>    static void p2m_free_subtree(struct p2m_domain *p2m,
>>>>                                 pte_t entry, unsigned int level)
>>>>    {
>>>> -    panic("%s: hasn't been implemented yet\n", __func__);
>>>> +    unsigned int i;
>>>> +    pte_t *table;
>>>> +    mfn_t mfn;
>>>> +    struct page_info *pg;
>>>> +
>>>> +    /* Nothing to do if the entry is invalid. */
>>>> +    if ( !pte_is_valid(entry) )
>>>> +        return;
>>>> +
>>>> +    if ( pte_is_superpage(entry, level) || (level == 0) )
>>> Perhaps swap the two conditions around?
>>>
>>>> +    {
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +        /*
>>>> +         * If this gets called then either the entry was replaced by an entry
>>>> +         * with a different base (valid case) or the shattering of a superpage
>>>> +         * has failed (error case).
>>>> +         * So, at worst, the spurious mapcache invalidation might be sent.
>>>> +         */
>>>> +        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
>>>> +             domain_has_ioreq_server(p2m->domain) )
>>>> +            ioreq_request_mapcache_invalidate(p2m->domain);
>>>> +#endif
>>>> +
>>>> +        p2m_put_page(entry, level);
>>>> +
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    table = map_domain_page(pte_get_mfn(entry));
>>>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
>>>> +        p2m_free_subtree(p2m, table[i], level - 1);
>>> In p2m_put_page() you comment towards concerns for level >= 2; no similar
>>> concerns for the resulting recursion here?
>> This function is generic enough to handle any level.
>>
>> Except that it is possible that it will be needed, for example, to split 1G mapping
>> into something smaller then p2m_free_subtree() could be called for freeing a subtree
>> of 1gb mapping.
> The question wasn't about it being generic enough, but it possibly taking
> too much time for level >= 2.

In this terms it makes sense to add such an assertion which will check that we are
working with levels <= 2.

Thanks.

~ Oleksii

--------------FknOeCGiPYNNZXbR6X29R0Mx
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
    <div class="moz-cite-prefix">On 8/14/25 5:17 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:117e35e0-d23e-4527-964a-82fa2bed57fd@suse.com">
      <pre wrap="" class="moz-quote-pre">On 14.08.2025 17:09, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 8/6/25 5:55 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(const pte_t pte, unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_get_type(pte);
+
+    ASSERT(pte_is_valid(pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
+    switch ( level )
+    {
+    case 1:
+        return p2m_put_2m_superpage(mfn, p2m_type);
+
+    case 0:
+        return p2m_put_4k_page(mfn, p2m_type);
+    }
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yet despite the comment not even an assertion for level 2 and up?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Not sure that an ASSERT() is needed here as a reference(s) for such page(s)
will be put during domain_relinquish_resources() as there we could do preemption.
Something like Arm does here:
   <a class="moz-txt-link-freetext"
href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587">https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c?ref_type=heads#L1587</a>

I'm thinking that probably it makes sense to put only 4k page(s) and
all other cases postpone until domain_relinquish_resources() is called.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">How can you defer to domain cleanup? How would handling of foreign mappings
(or e.g. ballooning? not sure) work when you don't drop references as
necessary?</pre>
    </blockquote>
    <pre>I was confused by the code in <code data-start="79"
    data-end="105">relinquish_p2m_mapping()</code>, since it removes
foreign mappings from the P2M. My current understanding is that it is called
for foreign mappings that weren’t explicitly unmapped, in order to drop the
page reference taken when the mapping was created. Initially, I thought it
would be enough to just perform the (un)map in the P2M page tables to have
foreign mapping working, but that could result in a page never being fully
released, which would in turn break or confuse other logic.

So, yes, I agree that your initial suggestion to add ASSERT() is useful to
be sure that no one is using level 2 super-pages for foreign mapping.

</pre>
    <blockquote type="cite"
      cite="mid:117e35e0-d23e-4527-964a-82fa2bed57fd@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">  /* Free pte sub-tree behind an entry */
  static void p2m_free_subtree(struct p2m_domain *p2m,
                               pte_t entry, unsigned int level)
  {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !pte_is_valid(entry) )
+        return;
+
+    if ( pte_is_superpage(entry, level) || (level == 0) )
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Perhaps swap the two conditions around?

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    {
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &amp;&amp;
+             domain_has_ioreq_server(p2m-&gt;domain) )
+            ioreq_request_mapcache_invalidate(p2m-&gt;domain);
+#endif
+
+        p2m_put_page(entry, level);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i &lt; XEN_PT_ENTRIES; i++ )
+        p2m_free_subtree(p2m, table[i], level - 1);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">In p2m_put_page() you comment towards concerns for level &gt;= 2; no similar
concerns for the resulting recursion here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This function is generic enough to handle any level.

Except that it is possible that it will be needed, for example, to split 1G mapping
into something smaller then p2m_free_subtree() could be called for freeing a subtree
of 1gb mapping.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The question wasn't about it being generic enough, but it possibly taking
too much time for level &gt;= 2.</pre>
    </blockquote>
    <pre>In this terms it makes sense to add such an assertion which will check that we are
working with levels &lt;= 2.

Thanks.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------FknOeCGiPYNNZXbR6X29R0Mx--

