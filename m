Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865FAB0E146
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 18:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052925.1421708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFWH-0003Uy-6g; Tue, 22 Jul 2025 16:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052925.1421708; Tue, 22 Jul 2025 16:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFWH-0003TH-39; Tue, 22 Jul 2025 16:07:09 +0000
Received: by outflank-mailman (input) for mailman id 1052925;
 Tue, 22 Jul 2025 16:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNGt=2D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ueFWF-0003TB-Bt
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 16:07:07 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9005102-6715-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 18:07:05 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ae3cd8fdd77so1077508666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 09:07:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79ae67sm889777366b.11.2025.07.22.09.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 09:07:03 -0700 (PDT)
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
X-Inumbo-ID: e9005102-6715-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753200424; x=1753805224; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Hm/xoBLRAaVt04pVM5xTtjsYX/kTKnKGb1s+6nnSYg=;
        b=Lx/Jirj8mU9rkQh9uiW9B9Z6szjvvUJQu/TPm9g0SEM4l4nTUgOIz2oV25dp58YffU
         MUC8lwqBTVtsmWzG3W91vcI9k2eftjDmZQ+TLG0zr9VD3oYG0ilAYvpViyopqj5VTzuu
         nvD5SVpwfnKNQYIppj2XSK8H/znTB6/J382IHZa6Az9b6VK4GeepEcRe527TIdhjUmgC
         aLfOINRq5yyU7ey72x53h5UXihTqTgzVBYqCftqHfe3XFDhLozbvrXPKzdk0siZb0OLw
         gJfBXX1UH9/CAl9S1f82nGtKHptUQHQv/gQY2VnjDACEBDTzD68q54WhgG4tDg2Ei/BK
         kjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200424; x=1753805224;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Hm/xoBLRAaVt04pVM5xTtjsYX/kTKnKGb1s+6nnSYg=;
        b=wWMFTCsyyuCyJlumCqg9ETYQImjdSSWp3uTu/a92J4elf5it1nzt/F6FlyY0JoxTbg
         m42Ib5v0ZxS/HWiyNU12UWKQN5nUowemUBBA6JKHvkyKKJnV1gTz/ljXD00Sm/6GH6Wy
         ZlqeaL+lz0tH5ivG5DHKsdJ+HfxAPU3fI9crgHAuSGriGVPtUDCyDk2teNGl1BmC4IIW
         4LRo8uWkeWvIyM8ToDeRqta4vuLknw+97hd0ln1L3esp4GM4Psq590QYNrshgz8ZH2GB
         ElT8pc0JN7/I3Nr21MpiKQqP4ajUnX+JX4YcuMq+EAfMY+PJr+pjT7KVDVvTYlfWhpc9
         1v8g==
X-Forwarded-Encrypted: i=1; AJvYcCXKTE8LL6ukl06m5CEKtsaDPNR9pQywrrKXbNKIu/otdKFmdv4dEKweP1s8TYXbgl/vtaddUVX+Sgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZmJu71kZwk5i1CRYIOnzksQ4xc7kJvWINhtOVQDs0Ew8v557p
	56phiMddtvRtFFaftHI+0hqIxhIRC+LRS2DudRmv78hRmtC/Xkv1RDTu
X-Gm-Gg: ASbGncvqwuYpfkVCvTiWs7QTcmjVPMKp698EufF6Kky/bzCD+pPAxOVlHtv1hm2R52S
	60HUX3zoxG5JhjMegOCBM0DB+R7wJoGsFTuHZUTVqvfSh/VwIjrwHGLa4Im6zvSVfbmHST3kbY5
	DbKNNjmumJp89u6x0Hfy5aRr+XpjhZl4qx0vWk6M2Q1oGcQIUscvrHO5CZTWvcf+cqkp4RO4FBb
	P35v9A+/Yyxoj76DiZ+qWiaKUTApEs52yqc3h1m6AH4dnV1+hWEvbwj0zX0cZgu5nj+TFlfFyrV
	Y1T5D3p7W1PZ6eJf4WyCcrKPD8TBV7lDDrCm9tJN+WhWDMdmqVFCPsn+BoZIc3a6LnNMCjUSlE1
	LyBfK9ULcrUtoyexWgQPyAJYq0Q3Zq1Jggv19/qY56UWRHjKCSK3AlYd+tI95Ff4XyOOLqyA=
X-Google-Smtp-Source: AGHT+IECKDEEixHlmKryNYt9VVfxdHc6cxRSB0QaWIaHNVdRDoQctkfwGhhajy/u37eqazzeFjX3/w==
X-Received: by 2002:a17:906:6a0a:b0:ae0:34d4:28a5 with SMTP id a640c23a62f3a-ae9cdaf527dmr2381326266b.0.1753200424061;
        Tue, 22 Jul 2025 09:07:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ti6dDCntqxKXlmFZh0OFarQQ"
Message-ID: <dabc1c47-f392-4fc1-9f84-36c880c6dd63@gmail.com>
Date: Tue, 22 Jul 2025 18:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
 <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
 <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>
 <ca3467a2-c795-4709-ad92-1744b138a148@gmail.com>
 <9e9c1943-b2af-471f-b8c9-f7179073ef99@suse.com>
 <fb7176a2-740e-4773-b1cb-3cd430d6f838@gmail.com>
 <f110cd42-d34b-44fc-bd76-85cb0bfc2357@gmail.com>
 <25f17da6-1c82-422c-941a-b0eb57786c8f@suse.com>
 <342e8524-268c-46ae-817c-5af71254b624@gmail.com>
 <7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com>

This is a multi-part message in MIME format.
--------------Ti6dDCntqxKXlmFZh0OFarQQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/22/25 4:35 PM, Jan Beulich wrote:
> On 22.07.2025 16:25, Oleksii Kurochko wrote:
>> On 7/22/25 2:00 PM, Jan Beulich wrote:
>>> On 22.07.2025 13:34, Oleksii Kurochko wrote:
>>>> On 7/22/25 12:41 PM, Oleksii Kurochko wrote:
>>>>> On 7/21/25 2:18 PM, Jan Beulich wrote:
>>>>>> On 18.07.2025 11:52, Oleksii Kurochko wrote:
>>>>>>> On 7/17/25 12:25 PM, Jan Beulich wrote:
>>>>>>>> On 17.07.2025 10:56, Oleksii Kurochko wrote:
>>>>>>>>> On 7/16/25 6:18 PM, Jan Beulich wrote:
>>>>>>>>>> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>>>>>>>>>>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>>>>>>>>>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>>>>>>>>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>>>>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>>>>>>>>>>             return __map_domain_page(p2m->root + root_table_indx);
>>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>>         
>>>>>>>>>>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>>>>>>>>>>> See comments on the earlier patch regarding naming.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +    int rc;
>>>>>>>>>>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>>>>>>>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>>>>>>>>>>>> I think I don't understand what is an issue. Could you please provide
>>>>>>>>>>>>> some extra details?
>>>>>>>>>>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>>>>>>>>>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>>>>>>>>>>> of the function, making it possible to use it here?
>>>>>>>>>>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>>>>>>>>>>> implementation.
>>>>>>>>>> Isn't that on overly severe limitation?
>>>>>>>>> I wouldn't say that it's a severe limitation, as it's just a matter of how
>>>>>>>>> |mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
>>>>>>>>> |mfn_to_gfn()| can be implemented differently, while the code where it’s called
>>>>>>>>> will likely remain unchanged.
>>>>>>>>>
>>>>>>>>> What I meant in my reply is that, for the current state and current limitations,
>>>>>>>>> this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
>>>>>>>>> see the value in, or the need for, non-1:1 mapped domains—it's just that this
>>>>>>>>> limitation simplifies development at the current stage of the RISC-V port.
>>>>>>>> Simplification is fine in some cases, but not supporting the "normal" way of
>>>>>>>> domain construction looks like a pretty odd restriction. I'm also curious
>>>>>>>> how you envision to implement mfn_to_gfn() then, suitable for generic use like
>>>>>>>> the one here. Imo, current limitation or not, you simply want to avoid use of
>>>>>>>> that function outside of the special gnttab case.
>>>>>>>>
>>>>>>>>>>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>>>>>>>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>>>>>>>>>>> making Xen insert very many entries?
>>>>>>>>>>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>>>>>>>>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>>>>>>>>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>>>>>>>>>>> Which would require these allocations to come from that pool.
>>>>>>>>>>> Yes, and it is true only for non-hardware domains with the current implementation.
>>>>>>>>>> ???
>>>>>>>>> I meant that pool is used now only for non-hardware domains at the moment.
>>>>>>>> And how does this matter here? The memory required for the radix tree doesn't
>>>>>>>> come from that pool anyway.
>>>>>>> I thought that is possible to do that somehow, but looking at a code of
>>>>>>> radix-tree.c it seems like the only one way to allocate memroy for the radix
>>>>>>> tree isradix_tree_node_alloc() -> xzalloc(struct rcu_node).
>>>>>>>
>>>>>>> Then it is needed to introduce radix_tree_node_allocate(domain)
>>>>>> That would be a possibility, but you may have seen that less than half a
>>>>>> year ago we got rid of something along these lines. So it would require
>>>>>> some pretty good justification to re-introduce.
>>>>>>
>>>>>>> or radix tree
>>>>>>> can't be used at all for mentioned in the previous replies security reason, no?
>>>>>> (Very) careful use may still be possible. But the downside of using this
>>>>>> (potentially long lookup times) would always remain.
>>>>> Could you please clarify what do you mean here by "(Very) careful"?
>>>>> I thought about an introduction of an amount of possible keys in radix tree and if this amount
>>>>> is 0 then stop domain. And it is also unclear what should be a value for this amount.
>>>>> Probably, you have better idea.
>>>>>
>>>>> But generally your idea below ...
>>>>>>>>>>>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>>>>>>>>>>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>>>>>>>>>>>> Or one domain exhausting memory would cause another domain to fail. A domain
>>>>>>>>>>>> impacting just itself may be tolerable. But a domain affecting other domains
>>>>>>>>>>>> isn't.
>>>>>>>>>>> But it seems like this issue could happen in any implementation. It won't happen only
>>>>>>>>>>> if we will have only pre-populated pool for any domain type (hardware, control, guest
>>>>>>>>>>> domain) without ability to extend them or allocate extra pages from domheap in runtime.
>>>>>>>>>>> Otherwise, if extra pages allocation is allowed then we can't really do something
>>>>>>>>>>> with this issue.
>>>>>>>>>> But that's why I brought this up: You simply have to. Or, as indicated, the
>>>>>>>>>> moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
>>>>>>>>> Why it isn't XSA for other architectures? At least, Arm then should have such
>>>>>>>>> XSA.
>>>>>>>> Does Arm use a radix tree for storing types? It uses one for mem-access, but
>>>>>>>> it's not clear to me whether that's actually a supported feature.
>>>>>>>>
>>>>>>>>> I don't understand why x86 won't have the same issue. Memory is the limited
>>>>>>>>> and shared resource, so if one of the domain will use to much memory then it could
>>>>>>>>> happen that other domains won't have enough memory for its purpose...
>>>>>>>> The question is whether allocations are bounded. With this use of a radix tree,
>>>>>>>> you give domains a way to have Xen allocate pretty much arbitrary amounts of
>>>>>>>> memory to populate that tree. That unbounded-ness is the problem, not memory
>>>>>>>> allocations in general.
>>>>>>> Isn't radix tree key bounded to an amount of GFNs given for a domain? We can't have
>>>>>>> more keys then a max GFN number for a domain. So a potential amount of necessary memory
>>>>>>> for radix tree is also bounded to an amount of GFNs.
>>>>>> To some degree yes, hence why I said "pretty much arbitrary amounts".
>>>>>> But recall that "amount of GFNs" is a fuzzy term; I think you mean to
>>>>>> use it to describe the amount of memory pages given to the guest. GFNs
>>>>>> can be used for other purposes, though. Guests could e.g. grant
>>>>>> themselves access to their own memory, then map those grants at
>>>>>> otherwise unused GFNs.
>>>>>>
>>>>>>> Anyway, IIUC I just can't use radix tree for p2m types at all, right?
>>>>>>> If yes, does it make sense to borrow 2 bits from struct page_info->type_info as now it
>>>>>>> is used 9-bits for count of a frame?
>>>>>> struct page_info describes MFNs, when you want to describe GFNs. As you
>>>>>> mentioned earlier, multiple GFNs can in principle map to the same MFN.
>>>>>> You would force them to all have the same properties, which would be in
>>>>>> direct conflict with e.g. the grant P2M types.
>>>>>>
>>>>>> Just to mention one possible alternative to using radix trees: You could
>>>>>> maintain a 2nd set of intermediate "page tables", just that leaf entries
>>>>>> would hold meta data for the respective GFN. The memory for those "page
>>>>>> tables" could come from the normal P2M pool (and allocation would thus
>>>>>> only consume domain-specific resources). Of course in any model like
>>>>>> this the question of lookup times (as mentioned above) would remain.
>>>>> ...looks like an optimal option.
>>>>>
>>>>> The only thing I worry about is that it will require some code duplication
>>>>> (I will think how to re-use the current one code), as for example, when
>>>>> setting/getting metadata, TLB flushing isn’t needed at all as we aren't
>>>>> working with with real P2M page tables.
>>>>> Agree that lookup won't be the best one, but nothing can be done with
>>>>> such models.
>>>> Probably, instead of having a second set of intermediate "page tables",
>>>> we could just allocate two consecutive pages within the real P2M page
>>>> tables for the intermediate page table. The first page would serve as
>>>> the actual page table to which the intermediate page table points,
>>>> and the second page would store metadata for each entry of the page
>>>> table that the intermediate page table references.
>>>>
>>>> As we are supporting only 1gb, 2mb and 4kb mappings we could do a little
>>>> optimization and start allocate these consecutive pages only for PT levels
>>>> which corresponds to 1gb, 2mb, 4kb mappings.
>>>>
>>>> Does it make sense?
>>> I was indeed entertaining this idea, but I couldn't conclude for myself if
>>> that would indeed be without any rough edges. Hence I didn't want to
>>> suggest such. For example, the need to have adjacent pairs of pages could
>>> result in a higher rate of allocation failures (while populating or
>>> re-sizing the P2M pool). This would be possible to avoid by still using
>>> entirely separate pages, and then merely linking them together via some
>>> unused struct page_info fields (the "normal" linking fields can't be used,
>>> afaict).
>> I think that all the fields are used, so it will be needed to introduce new
>> "struct page_list_entry metadata_list;".
> All the fields are used _somewhere_, sure. But once you have allocated a
> page (and that page isn't assigned to a domain), you control what the
> fields are used for.

I thought that the whole idea is to use domain's pages from P2M pool freelist,
pages for which is allocated by alloc_domheap_page(d, MEMF_no_owner), so an
allocated page is assigned to a domain.

I assume that I have in this case to take some pages for an intermediate page
table from freelist P2M pool, set an owner domain to NULL (pg->inuse.domain = NULL).

Then in this case it isn't clear why pg->list can't be re-used to link several pages
for intermediate page table purposes + metadata? Is it because pg->list can be not
empty? In this case it isn't clear if I could use a page, which has threaded pages.

page_info->count_info can't be re-used as it will break put_page_*() connected stuff.
And for similar reason page_info->v.{...} can't be re-used as then page_get_owner()
will be broken.
And page_info->tlbflush_timestamp still need for a common alloc algo to handle when
to do TLB flush.

So if I will add something to page_info->v.{...} or page_info->u.{...} then mentioned
above functions can't be used anymore for such pages which are used for intermediate
page tables.

>   Or else enlisting pages on private lists wouldn't be
> legitimate either.

Hmm, but I still should have link several pages somehow.
Or you meant just to have a field which just store a physical address to metadata?
(what still looks like a list)


>
>> Can't we introduce new PGT_METADATA type and then add metadata page to
>> struct page_info->list and when a metadata will be needed just iterate through
>> page_info->list and find a page with PGT_METADATA type?
> I'd be careful with the introduction of new page types. All handling of
> page types everywhere in the (affected part of the) code base would then
> need auditing.

~ Oleksii

--------------Ti6dDCntqxKXlmFZh0OFarQQ
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
    <div class="moz-cite-prefix">On 7/22/25 4:35 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 22.07.2025 16:25, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/22/25 2:00 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 22.07.2025 13:34, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 7/22/25 12:41 PM, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 7/21/25 2:18 PM, Jan Beulich wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 18.07.2025 11:52, Oleksii Kurochko wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 7/17/25 12:25 PM, Jan Beulich wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">On 17.07.2025 10:56, Oleksii Kurochko wrote:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">On 7/16/25 6:18 PM, Jan Beulich wrote:
</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">On 16.07.2025 18:07, Oleksii Kurochko wrote:
</pre>
                        <blockquote type="cite">
                          <pre wrap="" class="moz-quote-pre">On 7/16/25 1:31 PM, Jan Beulich wrote:
</pre>
                          <blockquote type="cite">
                            <pre wrap="" class="moz-quote-pre">On 15.07.2025 16:47, Oleksii Kurochko wrote:
</pre>
                            <blockquote type="cite">
                              <pre wrap="" class="moz-quote-pre">On 7/1/25 5:08 PM, Jan Beulich wrote:
</pre>
                              <blockquote type="cite">
                                <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
                                <blockquote type="cite">
                                  <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
           return __map_domain_page(p2m-&gt;root + root_table_indx);
       }
       
+static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
</pre>
                                </blockquote>
                                <pre wrap="" class="moz-quote-pre">See comments on the earlier patch regarding naming.

</pre>
                                <blockquote type="cite">
                                  <pre wrap="" class="moz-quote-pre">+{
+    int rc;
+    gfn_t gfn = mfn_to_gfn(p2m-&gt;domain, mfn_from_pte(pte));
</pre>
                                </blockquote>
                                <pre wrap="" class="moz-quote-pre">How does this work, when you record GFNs only for Xenheap pages?
</pre>
                              </blockquote>
                              <pre wrap="" class="moz-quote-pre">I think I don't understand what is an issue. Could you please provide
some extra details?
</pre>
                            </blockquote>
                            <pre wrap="" class="moz-quote-pre">Counter question: The mfn_to_gfn() you currently have is only a stub. It only
works for 1:1 mapped domains. Can you show me the eventual final implementation
of the function, making it possible to use it here?
</pre>
                          </blockquote>
                          <pre wrap="" class="moz-quote-pre">At the moment, I planned to support only 1:1 mapped domains, so it is final
implementation.
</pre>
                        </blockquote>
                        <pre wrap="" class="moz-quote-pre">Isn't that on overly severe limitation?
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">I wouldn't say that it's a severe limitation, as it's just a matter of how
|mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
|mfn_to_gfn()| can be implemented differently, while the code where it’s called
will likely remain unchanged.

What I meant in my reply is that, for the current state and current limitations,
this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
see the value in, or the need for, non-1:1 mapped domains—it's just that this
limitation simplifies development at the current stage of the RISC-V port.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Simplification is fine in some cases, but not supporting the "normal" way of
domain construction looks like a pretty odd restriction. I'm also curious
how you envision to implement mfn_to_gfn() then, suitable for generic use like
the one here. Imo, current limitation or not, you simply want to avoid use of
that function outside of the special gnttab case.

</pre>
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <blockquote type="cite">
                          <blockquote type="cite">
                            <blockquote type="cite">
                              <blockquote type="cite">
                                <pre wrap="" class="moz-quote-pre">In this context (not sure if I asked before): With this use of a radix tree,
how do you intend to bound the amount of memory that a domain can use, by
making Xen insert very many entries?
</pre>
                              </blockquote>
                              <pre wrap="" class="moz-quote-pre">I didn’t think about that. I assumed it would be enough to set the amount of
memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
</pre>
                            </blockquote>
                            <pre wrap="" class="moz-quote-pre">Which would require these allocations to come from that pool.
</pre>
                          </blockquote>
                          <pre wrap="" class="moz-quote-pre">Yes, and it is true only for non-hardware domains with the current implementation.
</pre>
                        </blockquote>
                        <pre wrap="" class="moz-quote-pre">???
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">I meant that pool is used now only for non-hardware domains at the moment.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">And how does this matter here? The memory required for the radix tree doesn't
come from that pool anyway.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">I thought that is possible to do that somehow, but looking at a code of
radix-tree.c it seems like the only one way to allocate memroy for the radix
tree isradix_tree_node_alloc() -&gt; xzalloc(struct rcu_node).

Then it is needed to introduce radix_tree_node_allocate(domain)
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">That would be a possibility, but you may have seen that less than half a
year ago we got rid of something along these lines. So it would require
some pretty good justification to re-introduce.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">or radix tree
can't be used at all for mentioned in the previous replies security reason, no?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">(Very) careful use may still be possible. But the downside of using this
(potentially long lookup times) would always remain.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Could you please clarify what do you mean here by "(Very) careful"?
I thought about an introduction of an amount of possible keys in radix tree and if this amount
is 0 then stop domain. And it is also unclear what should be a value for this amount.
Probably, you have better idea.

But generally your idea below ...
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <blockquote type="cite">
                          <blockquote type="cite">
                            <blockquote type="cite">
                              <pre wrap="" class="moz-quote-pre">Also, it seems this would just lead to the issue you mentioned earlier: when
the memory runs out,|domain_crash()| will be called or PTE will be zapped.
</pre>
                            </blockquote>
                            <pre wrap="" class="moz-quote-pre">Or one domain exhausting memory would cause another domain to fail. A domain
impacting just itself may be tolerable. But a domain affecting other domains
isn't.
</pre>
                          </blockquote>
                          <pre wrap="" class="moz-quote-pre">But it seems like this issue could happen in any implementation. It won't happen only
if we will have only pre-populated pool for any domain type (hardware, control, guest
domain) without ability to extend them or allocate extra pages from domheap in runtime.
Otherwise, if extra pages allocation is allowed then we can't really do something
with this issue.
</pre>
                        </blockquote>
                        <pre wrap="" class="moz-quote-pre">But that's why I brought this up: You simply have to. Or, as indicated, the
moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">Why it isn't XSA for other architectures? At least, Arm then should have such
XSA.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Does Arm use a radix tree for storing types? It uses one for mem-access, but
it's not clear to me whether that's actually a supported feature.

</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">I don't understand why x86 won't have the same issue. Memory is the limited
and shared resource, so if one of the domain will use to much memory then it could
happen that other domains won't have enough memory for its purpose...
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">The question is whether allocations are bounded. With this use of a radix tree,
you give domains a way to have Xen allocate pretty much arbitrary amounts of
memory to populate that tree. That unbounded-ness is the problem, not memory
allocations in general.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Isn't radix tree key bounded to an amount of GFNs given for a domain? We can't have
more keys then a max GFN number for a domain. So a potential amount of necessary memory
for radix tree is also bounded to an amount of GFNs.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">To some degree yes, hence why I said "pretty much arbitrary amounts".
But recall that "amount of GFNs" is a fuzzy term; I think you mean to
use it to describe the amount of memory pages given to the guest. GFNs
can be used for other purposes, though. Guests could e.g. grant
themselves access to their own memory, then map those grants at
otherwise unused GFNs.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">Anyway, IIUC I just can't use radix tree for p2m types at all, right?
If yes, does it make sense to borrow 2 bits from struct page_info-&gt;type_info as now it
is used 9-bits for count of a frame?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">struct page_info describes MFNs, when you want to describe GFNs. As you
mentioned earlier, multiple GFNs can in principle map to the same MFN.
You would force them to all have the same properties, which would be in
direct conflict with e.g. the grant P2M types.

Just to mention one possible alternative to using radix trees: You could
maintain a 2nd set of intermediate "page tables", just that leaf entries
would hold meta data for the respective GFN. The memory for those "page
tables" could come from the normal P2M pool (and allocation would thus
only consume domain-specific resources). Of course in any model like
this the question of lookup times (as mentioned above) would remain.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">...looks like an optimal option.

The only thing I worry about is that it will require some code duplication
(I will think how to re-use the current one code), as for example, when
setting/getting metadata, TLB flushing isn’t needed at all as we aren't
working with with real P2M page tables.
Agree that lookup won't be the best one, but nothing can be done with
such models.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Probably, instead of having a second set of intermediate "page tables",
we could just allocate two consecutive pages within the real P2M page
tables for the intermediate page table. The first page would serve as
the actual page table to which the intermediate page table points,
and the second page would store metadata for each entry of the page
table that the intermediate page table references.

As we are supporting only 1gb, 2mb and 4kb mappings we could do a little
optimization and start allocate these consecutive pages only for PT levels
which corresponds to 1gb, 2mb, 4kb mappings.

Does it make sense?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I was indeed entertaining this idea, but I couldn't conclude for myself if
that would indeed be without any rough edges. Hence I didn't want to
suggest such. For example, the need to have adjacent pairs of pages could
result in a higher rate of allocation failures (while populating or
re-sizing the P2M pool). This would be possible to avoid by still using
entirely separate pages, and then merely linking them together via some
unused struct page_info fields (the "normal" linking fields can't be used,
afaict).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that all the fields are used, so it will be needed to introduce new
"struct page_list_entry metadata_list;".
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
All the fields are used _somewhere_, sure. But once you have allocated a
page (and that page isn't assigned to a domain), you control what the
fields are used for.</pre>
    </blockquote>
    <pre>I thought that the whole idea is to use domain's pages from P2M pool freelist,
pages for which is allocated by alloc_domheap_page(d, MEMF_no_owner), so an
allocated page is assigned to a domain.

I assume that I have in this case to take some pages for an intermediate page
table from freelist P2M pool, set an owner domain to NULL (pg-&gt;inuse.domain = NULL).

Then in this case it isn't clear why pg-&gt;list can't be re-used to link several pages
for intermediate page table purposes + metadata? Is it because pg-&gt;list can be not
empty? In this case it isn't clear if I could use a page, which has threaded pages.

page_info-&gt;count_info can't be re-used as it will break put_page_*() connected stuff.
And for similar reason page_info-&gt;v.{...} can't be re-used as then page_get_owner()
will be broken.
And page_info-&gt;tlbflush_timestamp still need for a common alloc algo to handle when
to do TLB flush.

So if I will add something to page_info-&gt;v.{...} or page_info-&gt;u.{...} then mentioned
above functions can't be used anymore for such pages which are used for intermediate
page tables.

</pre>
    <p></p>
    <blockquote type="cite"
      cite="mid:7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com">
      <pre wrap="" class="moz-quote-pre"> Or else enlisting pages on private lists wouldn't be
legitimate either.</pre>
    </blockquote>
    <pre>Hmm, but I still should have link several pages somehow.
Or you meant just to have a field which just store a physical address to metadata?
(what still looks like a list)


</pre>
    <blockquote type="cite"
      cite="mid:7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Can't we introduce new PGT_METADATA type and then add metadata page to
struct page_info-&gt;list and when a metadata will be needed just iterate through
page_info-&gt;list and find a page with PGT_METADATA type?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'd be careful with the introduction of new page types. All handling of
page types everywhere in the (affected part of the) code base would then
need auditing.
</pre>
    </blockquote>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------Ti6dDCntqxKXlmFZh0OFarQQ--

