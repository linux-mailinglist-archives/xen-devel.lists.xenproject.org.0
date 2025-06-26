Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CCAE9CEA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 13:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026206.1401427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlCm-0006cB-Kl; Thu, 26 Jun 2025 11:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026206.1401427; Thu, 26 Jun 2025 11:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlCm-0006ZP-HS; Thu, 26 Jun 2025 11:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1026206;
 Thu, 26 Jun 2025 11:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Scu=ZJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uUlCk-0006Z0-Sa
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 11:55:46 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e3e4233-5284-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 13:55:45 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0a0cd709bso400753366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 04:55:45 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f1ae7basm3756934a12.25.2025.06.26.04.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 04:55:44 -0700 (PDT)
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
X-Inumbo-ID: 7e3e4233-5284-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750938945; x=1751543745; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBJ7rmajfjnZp6vc+/rsIwGpNupfVLjB2hWKyfaFwZU=;
        b=XB1p+v1f5Iwvtuz4681VHBs3kVL6ojR9EQlNOa7nwe88htXtwEfdB04IVwKvnOzUSG
         4aiW8pLfY7w7svo/bWM5O0uBmw3cCMKoiqzkeMWIxX4d6DJpdMknTp+8h9E3rhLObKpz
         unpUbQVgekQ4tu0Ce7wUkmy+K7LAZ0cfY+M/TUBKYp48lLWVxRE6eAs2KszJtQYQpoxy
         22nkcakh4Fh9pje+rpcaSteh9u1nKgNzcw3sf+JfJM5uxaNEF9tTa/++ZZSvd0CZOmFS
         PaEsdU/eukjeTF+ziD8TgqUbEpXhok3hmqLKiZLLNkcqfjJR7p+BkYMWWPByZ/1kyksw
         vj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938945; x=1751543745;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBJ7rmajfjnZp6vc+/rsIwGpNupfVLjB2hWKyfaFwZU=;
        b=c6d87ZsMh4UAU7G4NPSsX5IwPGO6KBPZJuC3RUWW52Az0+8aAAMsGEk3AfO55fHccB
         RWD8KVv0GFQQ3EolHPlnNDs23DcLgpbBMXDQdl+2EAIp7a9t9c6icItE515pl3vQZqD2
         mMwQNtxERDtjZRxYXBxS029F4DQ+oQjF3qRW+UvCTEHFh0Np7syaAFh3kdpFtk+4gNdW
         pectELgdaoXTxxdz/WjgcPwn4aFTf1KcTb4WqIrJgF3nliQ/hrgXzcSSW6XVM7b2s/A+
         Ezntt9rX3AzLW2407EdQLQScSEwWhVuzL5ay/02yuSb/Fwb3Ctgcq185s9gpPpHAObxj
         a8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV93RNPRUaKe0hryejSSJGSH1eiZHH6tsRuBP3+xImubhptJxPsHlUdqc899dSaAnaUS3dpd65jphI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFJye81CTpCiBUPP92HSQ37MTXF8yz9Exw58VUOtXG7cEznLrF
	S5x8XiSwafJaj5T1Kq6ytAhcB1R87MJPBAjbcnwBSOLRALduxbVnxy9n
X-Gm-Gg: ASbGnctFBac5zx04DhJ/WXx6nscWzSswHYyzQtmS5lFXJYQOeRLxwmkn+5E9AKRMiFz
	7n/0X6GzZ7TmXz7EGQYZq3j8/UKI3ikMzFFQxyqtKLR5tDnS0TLYnXe+kmCf+F16ndzen9HNErI
	qAPDKcobM4JuVcBqxDJpxsz6rkTlakk46TG4VRAdBJ4LXoJyQYG4kD70y7IyTlnBIcWfM8m+tbc
	CPFxYmGSL9ChdwPVc6o2zVj9njY3a1l3NOPMSOjZ0PTLr8XqhTD0UcZtYgo+fWsTixuOPMJ/R4x
	7/pB5YwNCN+H8xf9J9rua2VZiGse9Y0a5IakZkr0d/o+se4+AJ9nfXaXNvc+uQyG/n1wM2pWQko
	ERBN6XRzdtP6JEXcLvyPTlVjOcv8KwrAZPh8=
X-Google-Smtp-Source: AGHT+IGWWtesavkwF3KKfw1lMHY2khY0fHRHnHtOTWHw0mu4oBONNtgf6/XtlWaKIV6tS2wO+kwE4w==
X-Received: by 2002:a17:906:c148:b0:ae0:dc9e:2f8f with SMTP id a640c23a62f3a-ae0dc9e3079mr121264366b.23.1750938944684;
        Thu, 26 Jun 2025 04:55:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xFqQBfbcP2sKFIYGmL6NCh0X"
Message-ID: <a265a1f9-07e5-437b-a608-d66aacc43672@gmail.com>
Date: Thu, 26 Jun 2025 13:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] xen/riscv: introduce things necessary for p2m
 initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
 <5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com>
 <0b3c403b-0f24-4fc6-ba5b-fb4df62d7057@gmail.com>
 <7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com>
 <8741800f-b40b-4c42-b435-91e2f9375f6c@gmail.com>
 <1bb7c808-9383-4c51-880e-a12984d544c4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1bb7c808-9383-4c51-880e-a12984d544c4@suse.com>

This is a multi-part message in MIME format.
--------------xFqQBfbcP2sKFIYGmL6NCh0X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/25 1:01 PM, Jan Beulich wrote:
> On 26.06.2025 10:40, Oleksii Kurochko wrote:
>> On 6/25/25 5:53 PM, Jan Beulich wrote:
>>> On 25.06.2025 17:31, Oleksii Kurochko wrote:
>>>> On 6/18/25 6:08 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> @@ -14,6 +18,29 @@
>>>>>>     
>>>>>>     /* Per-p2m-table state */
>>>>>>     struct p2m_domain {
>>>>>> +    /*
>>>>>> +     * Lock that protects updates to the p2m.
>>>>>> +     */
>>>>>> +    rwlock_t lock;
>>>>>> +
>>>>>> +    /* Pages used to construct the p2m */
>>>>>> +    struct page_list_head pages;
>>>>>> +
>>>>>> +    /* Indicate if it is required to clean the cache when writing an entry */
>>>>>> +    bool clean_pte;
>>>>>> +
>>>>>> +    struct radix_tree_root p2m_type;
>>>>> A field with a p2m_ prefix in a p2m struct?
>>>> p2m_ prefix could be really dropped.
>>>>
>>>>>     And is this tree really about
>>>>> just a single "type"?
>>>> Yes, we don't have enough bits in PTE so we need some extra storage to store type.
>>> My question wasn't about that, though. My question was whether in the name
>>> "type" (singular) is appropriate. I didn't think you need a tree to store just
>>> a single type.
>> I need tree to store a pair of <gfn, p2m_type>, where gfn is an index. And it seems
>> to me a tree is a good structure for fast insert/search.
> Hmm, I'm increasingly puzzled. I tried to emphasize that my question was towards
> the singular "type" in the variable name. I can't see any relationship between
> that and your reply. (And yes, using a tree here may be appropriate. There is a
> concern towards memory consumption, but that's a separate topic.)

Oh, I got your initial intention. For sure, it should be "types".

>
> Having said that, aiui you don't use the two RSW bits in the PTE. Do you have
> any plans there? If not, can't they be used to at least represent the most
> commonly used types, such that the number of entries in that tree can be kept
> (relatively) low?

It could be really an option for optimization.

In this case I have to p2m_type_t by adding a new type p2m_tree_type:
typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
     p2m_ram_ro,         /* Read-only */
     
     + p2m_tree_type,    /* The types below p2m_free_type will be stored outside PTE's bits */

     p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
     p2m_grant_map_rw,   /* Read/write grant mapping */
     p2m_grant_map_ro,   /* Read-only grant mapping */
} p2m_type_t;

Probably, it make sense to switch p2m_ram_ro and p2m_mmio_direct_dev. I think device mapping
is more often operations.

>
>>>>>> +    /*
>>>>>> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
>>>>>> +     * shared with the CPU, Xen has to make sure that the PT changes have
>>>>>> +     * reached the memory
>>>>>> +     */
>>>>>> +    p2m->clean_pte = is_iommu_enabled(d) &&
>>>>>> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
>>>>> The comment talks about shared page tables, yet you don't check whether
>>>>> page table sharing is actually enabled for the domain.
>>>> Do we have such function/macros?
>>> We have iommu_hap_pt_share, and we have the per-domain hap_pt_share flag.
>>>
>>>> It is shared by implementation now.
>>> I don't understand. There's no IOMMU support yet for RISC-V. Hence it's in
>>> neither state - not shared, but also not not shared.
>> In downstream there is a support of IOMMU for RISC-V.
> And there page tables are unconditionally shared? I'll be surprised if no
> want/need for non-shared page tables would ever appear.

At the moment, yes, but it isn't strict limitation. So yes, it should be page
tables should be conditionally shared.

~ Oleksii

--------------xFqQBfbcP2sKFIYGmL6NCh0X
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
    <div class="moz-cite-prefix">On 6/26/25 1:01 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1bb7c808-9383-4c51-880e-a12984d544c4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.06.2025 10:40, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/25/25 5:53 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 25.06.2025 17:31, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/18/25 6:08 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">@@ -14,6 +18,29 @@
   
   /* Per-p2m-table state */
   struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Indicate if it is required to clean the cache when writing an entry */
+    bool clean_pte;
+
+    struct radix_tree_root p2m_type;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">A field with a p2m_ prefix in a p2m struct?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">p2m_ prefix could be really dropped.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">   And is this tree really about
just a single "type"?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Yes, we don't have enough bits in PTE so we need some extra storage to store type.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">My question wasn't about that, though. My question was whether in the name
"type" (singular) is appropriate. I didn't think you need a tree to store just
a single type.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I need tree to store a pair of &lt;gfn, p2m_type&gt;, where gfn is an index. And it seems
to me a tree is a good structure for fast insert/search.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, I'm increasingly puzzled. I tried to emphasize that my question was towards
the singular "type" in the variable name. I can't see any relationship between
that and your reply. (And yes, using a tree here may be appropriate. There is a
concern towards memory consumption, but that's a separate topic.)</pre>
    </blockquote>
    <pre>Oh, I got your initial intention. For sure, it should be "types".

</pre>
    <blockquote type="cite"
      cite="mid:1bb7c808-9383-4c51-880e-a12984d544c4@suse.com">
      <pre wrap="" class="moz-quote-pre">

Having said that, aiui you don't use the two RSW bits in the PTE. Do you have
any plans there? If not, can't they be used to at least represent the most
commonly used types, such that the number of entries in that tree can be kept
(relatively) low?</pre>
    </blockquote>
    <pre>It could be really an option for optimization.

In this case I have to p2m_type_t by adding a new type p2m_tree_type:
typedef enum {
    p2m_invalid = 0,    /* Nothing mapped here */
    p2m_ram_rw,         /* Normal read/write domain RAM */
    p2m_ram_ro,         /* Read-only */
    
    + p2m_tree_type,    /* The types below p2m_free_type will be stored outside PTE's bits */

    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
    p2m_grant_map_rw,   /* Read/write grant mapping */
    p2m_grant_map_ro,   /* Read-only grant mapping */
} p2m_type_t;

Probably, it make sense to switch p2m_ram_ro and p2m_mmio_direct_dev. I think device mapping
is more often operations.

</pre>
    <blockquote type="cite"
      cite="mid:1bb7c808-9383-4c51-880e-a12984d544c4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    /*
+     * Some IOMMUs don't support coherent PT walk. When the p2m is
+     * shared with the CPU, Xen has to make sure that the PT changes have
+     * reached the memory
+     */
+    p2m-&gt;clean_pte = is_iommu_enabled(d) &amp;&amp;
+        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">The comment talks about shared page tables, yet you don't check whether
page table sharing is actually enabled for the domain.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Do we have such function/macros?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">We have iommu_hap_pt_share, and we have the per-domain hap_pt_share flag.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">It is shared by implementation now.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I don't understand. There's no IOMMU support yet for RISC-V. Hence it's in
neither state - not shared, but also not not shared.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
In downstream there is a support of IOMMU for RISC-V.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And there page tables are unconditionally shared? I'll be surprised if no
want/need for non-shared page tables would ever appear.</pre>
    </blockquote>
    <pre>At the moment, yes, but it isn't strict limitation. So yes, it should be page
tables should be conditionally shared.

~ Oleksii</pre>
  </body>
</html>

--------------xFqQBfbcP2sKFIYGmL6NCh0X--

