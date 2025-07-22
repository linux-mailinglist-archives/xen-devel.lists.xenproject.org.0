Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B7B0DE59
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052743.1421503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDwR-0004dH-VB; Tue, 22 Jul 2025 14:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052743.1421503; Tue, 22 Jul 2025 14:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDwR-0004ai-SQ; Tue, 22 Jul 2025 14:26:03 +0000
Received: by outflank-mailman (input) for mailman id 1052743;
 Tue, 22 Jul 2025 14:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNGt=2D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ueDwQ-0004ac-K5
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:26:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca87146f-6707-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 16:26:01 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60c4521ae2cso9619820a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 07:26:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c90bb932sm6964563a12.67.2025.07.22.07.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:25:59 -0700 (PDT)
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
X-Inumbo-ID: ca87146f-6707-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753194360; x=1753799160; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s2yT4peGSvxoFlXpDUUUt3fxxelAePfLhV64HMZZj0=;
        b=lqOJfV57lQqIJaxZN6KCPvnFklrPn1d7r9XkthmEhnJwrCUQfydaEEyu6CHpVantBd
         Onnw2cvnvYAEYmHgsW4hArrV3sbKSuCNJACqlf10btXBx0w29xPps5KxzvRe0OkUJ+aQ
         ATqjH0HwL4iEHQTD+lL270aGa6ufj6ceid7Jxw4lqfbrJY3cp005lGbxtTtb1YBrFxqr
         5f6r4BZg9nLW4/HqsBEsVFB03E+JQFUzFg4Bjuq405Wo8JfWoy6btV0PLf21my9VmVpw
         RCHIMp+5Z5cLAjCNGuwlufJ/76MUv905YpzyEfSdHKyXdRUrxMSQyg8hLqDagEG5vb35
         y71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194360; x=1753799160;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0s2yT4peGSvxoFlXpDUUUt3fxxelAePfLhV64HMZZj0=;
        b=Qy0pr3y8tq4rM2/szoUxrxzLoCQDfs8200jqrw5NXMipjLwtptYlOQbrEPygVpMQhC
         fmvWmGitQON8dgCbxJPvo3e3cWs8pRJthndTxfn49ar5bmiNMxyiuOc1o50GkIKx4DHN
         lGky1fuyqDCnOtzcJ7C2tQSgsw/i2NiKEY9jdesEJHcYndCdi0yi6xaBkILGnoOPP978
         sz7xHbMqFWfLbyIBzpu3837ctQ2kEdlZaT+lPm7VaeFEHDBe/J3Oor+ODHksNFhwnKGM
         antG/vbpgRKAd4fhelT5pGqTTMdVHtNNoo68sjeQDg0zvTOlSaSx9wU6W85dGbYqpA3u
         uhRg==
X-Forwarded-Encrypted: i=1; AJvYcCVHGqgHS8XcYjh2XRBMBKMEAtKS7d31wqoee/zTFx68F1InvmTZFVbdBzZLauBFytC4mHPw0ttqdCA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwUPr2hM2W9gSkRkkb9HDGdaJKy8DxjIUHkI/raGTvA/lyg0g+
	QBjOxc0Tk3wtEKzADer3cNvTsETOneIDa0AWvWhg2G6ffz96RX+ZO4nz
X-Gm-Gg: ASbGnctnO277Yj4ZT8ntYbSQBaV+6mHnc+DNroMuAuBojd82Vsy4LOJ4p6lwMp9GCs/
	ABguwetYfhc9+Tt2lyM+I3IUQw2Zzc6VgZkowSBo0ODMxcseafvIesbrZ2RGpUjgdeOnRBzllMx
	nD4lviFD+ud7k1yZMLaPwpC4IyklFvgIZCsw59Ewbzo435ls2xmtYKsn5rN+VH223hmjJ32NisX
	2f52Lv0GeQYogn+Teq/qj4emvqHvbDSXUxl6OD9IKU9hIYZrvfMfk4toBKOmD7LSVynisc6h60D
	XnYWGs+JZb1nKxB7y72c7YIla84+wUu0fu9LXCgHM3TBJCgTjuOwLREVGCxgwb1Oj35hm5lWA8c
	DGc12F9BwUn/PFTgWlAiQw94wpB+SHA04Iiar6nXQHS0emU329LyiJeoq4qT806P1gVNNmTM=
X-Google-Smtp-Source: AGHT+IG1GtMnOT6Qesn6simRiz8DFJ37UDKxV8hjv755kRnaE8m3apdBUn1N4a+aLaCMPZnNluGafQ==
X-Received: by 2002:a05:6402:2115:b0:608:66a3:fec with SMTP id 4fb4d7f45d1cf-612c731f245mr15544664a12.2.1753194360000;
        Tue, 22 Jul 2025 07:26:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------yX8k0NUWfCf0KsaVxhwEKUja"
Message-ID: <342e8524-268c-46ae-817c-5af71254b624@gmail.com>
Date: Tue, 22 Jul 2025 16:25:58 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <25f17da6-1c82-422c-941a-b0eb57786c8f@suse.com>

This is a multi-part message in MIME format.
--------------yX8k0NUWfCf0KsaVxhwEKUja
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/22/25 2:00 PM, Jan Beulich wrote:
> On 22.07.2025 13:34, Oleksii Kurochko wrote:
>> On 7/22/25 12:41 PM, Oleksii Kurochko wrote:
>>>
>>> On 7/21/25 2:18 PM, Jan Beulich wrote:
>>>> On 18.07.2025 11:52, Oleksii Kurochko wrote:
>>>>> On 7/17/25 12:25 PM, Jan Beulich wrote:
>>>>>> On 17.07.2025 10:56, Oleksii Kurochko wrote:
>>>>>>> On 7/16/25 6:18 PM, Jan Beulich wrote:
>>>>>>>> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>>>>>>>>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>>>>>>>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>>>>>>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>>>>>>>>            return __map_domain_page(p2m->root + root_table_indx);
>>>>>>>>>>>>>        }
>>>>>>>>>>>>>        
>>>>>>>>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>>>>>>>>> See comments on the earlier patch regarding naming.
>>>>>>>>>>>>
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    int rc;
>>>>>>>>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>>>>>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>>>>>>>>>> I think I don't understand what is an issue. Could you please provide
>>>>>>>>>>> some extra details?
>>>>>>>>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>>>>>>>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>>>>>>>>> of the function, making it possible to use it here?
>>>>>>>>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>>>>>>>>> implementation.
>>>>>>>> Isn't that on overly severe limitation?
>>>>>>> I wouldn't say that it's a severe limitation, as it's just a matter of how
>>>>>>> |mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
>>>>>>> |mfn_to_gfn()| can be implemented differently, while the code where it’s called
>>>>>>> will likely remain unchanged.
>>>>>>>
>>>>>>> What I meant in my reply is that, for the current state and current limitations,
>>>>>>> this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
>>>>>>> see the value in, or the need for, non-1:1 mapped domains—it's just that this
>>>>>>> limitation simplifies development at the current stage of the RISC-V port.
>>>>>> Simplification is fine in some cases, but not supporting the "normal" way of
>>>>>> domain construction looks like a pretty odd restriction. I'm also curious
>>>>>> how you envision to implement mfn_to_gfn() then, suitable for generic use like
>>>>>> the one here. Imo, current limitation or not, you simply want to avoid use of
>>>>>> that function outside of the special gnttab case.
>>>>>>
>>>>>>>>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>>>>>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>>>>>>>>> making Xen insert very many entries?
>>>>>>>>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>>>>>>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>>>>>>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>>>>>>>>> Which would require these allocations to come from that pool.
>>>>>>>>> Yes, and it is true only for non-hardware domains with the current implementation.
>>>>>>>> ???
>>>>>>> I meant that pool is used now only for non-hardware domains at the moment.
>>>>>> And how does this matter here? The memory required for the radix tree doesn't
>>>>>> come from that pool anyway.
>>>>> I thought that is possible to do that somehow, but looking at a code of
>>>>> radix-tree.c it seems like the only one way to allocate memroy for the radix
>>>>> tree isradix_tree_node_alloc() -> xzalloc(struct rcu_node).
>>>>>
>>>>> Then it is needed to introduce radix_tree_node_allocate(domain)
>>>> That would be a possibility, but you may have seen that less than half a
>>>> year ago we got rid of something along these lines. So it would require
>>>> some pretty good justification to re-introduce.
>>>>
>>>>> or radix tree
>>>>> can't be used at all for mentioned in the previous replies security reason, no?
>>>> (Very) careful use may still be possible. But the downside of using this
>>>> (potentially long lookup times) would always remain.
>>> Could you please clarify what do you mean here by "(Very) careful"?
>>> I thought about an introduction of an amount of possible keys in radix tree and if this amount
>>> is 0 then stop domain. And it is also unclear what should be a value for this amount.
>>> Probably, you have better idea.
>>>
>>> But generally your idea below ...
>>>>>>>>>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>>>>>>>>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>>>>>>>>>> Or one domain exhausting memory would cause another domain to fail. A domain
>>>>>>>>>> impacting just itself may be tolerable. But a domain affecting other domains
>>>>>>>>>> isn't.
>>>>>>>>> But it seems like this issue could happen in any implementation. It won't happen only
>>>>>>>>> if we will have only pre-populated pool for any domain type (hardware, control, guest
>>>>>>>>> domain) without ability to extend them or allocate extra pages from domheap in runtime.
>>>>>>>>> Otherwise, if extra pages allocation is allowed then we can't really do something
>>>>>>>>> with this issue.
>>>>>>>> But that's why I brought this up: You simply have to. Or, as indicated, the
>>>>>>>> moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
>>>>>>> Why it isn't XSA for other architectures? At least, Arm then should have such
>>>>>>> XSA.
>>>>>> Does Arm use a radix tree for storing types? It uses one for mem-access, but
>>>>>> it's not clear to me whether that's actually a supported feature.
>>>>>>
>>>>>>> I don't understand why x86 won't have the same issue. Memory is the limited
>>>>>>> and shared resource, so if one of the domain will use to much memory then it could
>>>>>>> happen that other domains won't have enough memory for its purpose...
>>>>>> The question is whether allocations are bounded. With this use of a radix tree,
>>>>>> you give domains a way to have Xen allocate pretty much arbitrary amounts of
>>>>>> memory to populate that tree. That unbounded-ness is the problem, not memory
>>>>>> allocations in general.
>>>>> Isn't radix tree key bounded to an amount of GFNs given for a domain? We can't have
>>>>> more keys then a max GFN number for a domain. So a potential amount of necessary memory
>>>>> for radix tree is also bounded to an amount of GFNs.
>>>> To some degree yes, hence why I said "pretty much arbitrary amounts".
>>>> But recall that "amount of GFNs" is a fuzzy term; I think you mean to
>>>> use it to describe the amount of memory pages given to the guest. GFNs
>>>> can be used for other purposes, though. Guests could e.g. grant
>>>> themselves access to their own memory, then map those grants at
>>>> otherwise unused GFNs.
>>>>
>>>>> Anyway, IIUC I just can't use radix tree for p2m types at all, right?
>>>>> If yes, does it make sense to borrow 2 bits from struct page_info->type_info as now it
>>>>> is used 9-bits for count of a frame?
>>>> struct page_info describes MFNs, when you want to describe GFNs. As you
>>>> mentioned earlier, multiple GFNs can in principle map to the same MFN.
>>>> You would force them to all have the same properties, which would be in
>>>> direct conflict with e.g. the grant P2M types.
>>>>
>>>> Just to mention one possible alternative to using radix trees: You could
>>>> maintain a 2nd set of intermediate "page tables", just that leaf entries
>>>> would hold meta data for the respective GFN. The memory for those "page
>>>> tables" could come from the normal P2M pool (and allocation would thus
>>>> only consume domain-specific resources). Of course in any model like
>>>> this the question of lookup times (as mentioned above) would remain.
>>> ...looks like an optimal option.
>>>
>>> The only thing I worry about is that it will require some code duplication
>>> (I will think how to re-use the current one code), as for example, when
>>> setting/getting metadata, TLB flushing isn’t needed at all as we aren't
>>> working with with real P2M page tables.
>>> Agree that lookup won't be the best one, but nothing can be done with
>>> such models.
>> Probably, instead of having a second set of intermediate "page tables",
>> we could just allocate two consecutive pages within the real P2M page
>> tables for the intermediate page table. The first page would serve as
>> the actual page table to which the intermediate page table points,
>> and the second page would store metadata for each entry of the page
>> table that the intermediate page table references.
>>
>> As we are supporting only 1gb, 2mb and 4kb mappings we could do a little
>> optimization and start allocate these consecutive pages only for PT levels
>> which corresponds to 1gb, 2mb, 4kb mappings.
>>
>> Does it make sense?
> I was indeed entertaining this idea, but I couldn't conclude for myself if
> that would indeed be without any rough edges. Hence I didn't want to
> suggest such. For example, the need to have adjacent pairs of pages could
> result in a higher rate of allocation failures (while populating or
> re-sizing the P2M pool). This would be possible to avoid by still using
> entirely separate pages, and then merely linking them together via some
> unused struct page_info fields (the "normal" linking fields can't be used,
> afaict).

I think that all the fields are used, so it will be needed to introduce new
"struct page_list_entry metadata_list;".

Can't we introduce new PGT_METADATA type and then add metadata page to
struct page_info->list and when a metadata will be needed just iterate through
page_info->list and find a page with PGT_METADATA type?

~ Oleksii

--------------yX8k0NUWfCf0KsaVxhwEKUja
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
    <div class="moz-cite-prefix">On 7/22/25 2:00 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:25f17da6-1c82-422c-941a-b0eb57786c8f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 22.07.2025 13:34, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 7/22/25 12:41 PM, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

On 7/21/25 2:18 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
Probably, instead of having a second set of intermediate "page tables",
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
      <pre wrap="" class="moz-quote-pre">
I was indeed entertaining this idea, but I couldn't conclude for myself if
that would indeed be without any rough edges. Hence I didn't want to
suggest such. For example, the need to have adjacent pairs of pages could
result in a higher rate of allocation failures (while populating or
re-sizing the P2M pool). This would be possible to avoid by still using
entirely separate pages, and then merely linking them together via some
unused struct page_info fields (the "normal" linking fields can't be used,
afaict).</pre>
    </blockquote>
    <pre>I think that all the fields are used, so it will be needed to introduce new
"struct page_list_entry metadata_list;".

Can't we introduce new PGT_METADATA type and then add metadata page to
struct page_info-&gt;list and when a metadata will be needed just iterate through
page_info-&gt;list and find a page with PGT_METADATA type?

~ Oleksii
</pre>
  </body>
</html>

--------------yX8k0NUWfCf0KsaVxhwEKUja--

