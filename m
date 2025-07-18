Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A1B0A022
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 11:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048316.1418531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchld-0006Nf-RQ; Fri, 18 Jul 2025 09:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048316.1418531; Fri, 18 Jul 2025 09:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchld-0006Lb-Oh; Fri, 18 Jul 2025 09:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1048316;
 Fri, 18 Jul 2025 09:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPPV=Z7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uchlc-0006LV-AS
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 09:52:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed79e38e-63bc-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 11:52:35 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae401ebcbc4so317150566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 02:52:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6caf9ad7sm89375566b.164.2025.07.18.02.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 02:52:32 -0700 (PDT)
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
X-Inumbo-ID: ed79e38e-63bc-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752832353; x=1753437153; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLpCQACUbAKfqH6NEO/AHtk/YLRAJ8Ws8aLUj9tKHFQ=;
        b=C2BJpSvLPcfeeHa+gjppO3EEajMaPS9Nwzx/AQoKjJQ0KXdFWD3ohWoF89jHdu4Wja
         +VUXAs6vhMEVxa6e/61zO3V3fgFSJZOeH7uiVfBqCTaB06KFgzaB4gVtziPeSUSe+BgZ
         acv2bnmK3gsq53kVDnpOMVbJwwiIzDGLLaHLDimhmmvrvWbJR2+MwR+UqBj28ssCAV8o
         0AO+JSR6vbaro0nIigTbCxIPn6EcbJjV7HofdYNvgonyJPHwBSiu13KTFbuHZ6KDLJ8y
         FEtnVrreX3VmT0J0SYffV/im8E7RPs47/aikj66SbzTzAXQfdMVZUcAJMDtgxQcJJkyr
         ZbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752832353; x=1753437153;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLpCQACUbAKfqH6NEO/AHtk/YLRAJ8Ws8aLUj9tKHFQ=;
        b=aKz+iqOCpg/DxhSkKxnCTd77Ykys3iMxbPmCaoJUnbP5f75guisfrlMURyzJjKS//n
         kfqb8Cgn/xGBXa2pqE7Bu5pnRNBlHrE+LoW++BNnE3uXqq/3CG794QOx/hq1MQ2b8iSE
         bO/R0TBlrdB2K1OxJVYdKX0oYmIxtxa0CN0cOCGCcwIC6EPH5Y3TJ+Myw41sv86uEtwp
         y4lhDy9E/r/Le2xDM21ivZVNJcyb9rMnxuQhOF4FlC8veNCn+khS5rJjFIMT25OmLM15
         cZnsCMM6WKX8HhC3FRCLOUQqd3xCmoX0PMIJ44C0OaAi53qeiubq2GEVD6M6weCIMFex
         JQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCWI27eO6Wtfi4m+hsjvTFbp0fSyngbScJ4/whbQ/k/wknua2uvpqXZR64kDMnbu0se+9CNmrgojDTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydOp4A2sxHh+nXb/wIiJ78iyKLPKa5I49pBkiwt8Xbsm0aXb0b
	4/59eErt42FfFjHwlLgeAYCjI50+cout226esYhLXju2GiSVNr46OOcW
X-Gm-Gg: ASbGnctJEJyTnScd03JW2tmvEVayl5MC3GY/l/MEm3jvZp8guLfKc98b16vNWVKeQDa
	55ARHLtlCjetUTLJezlS/8zhdpUXW0MJa1mcZIo9Y+dVS3RgUhFg4T4loRRygMG/FqvTiprCdrS
	bbFjSFl+C3uo8V+4QSQ2TL+GrQIpfYCHncekqZmhoeVcr+R0Gjt9Gx2sQtMUxn2UNXuR/GOTuR3
	Aphy54jjLlEm3bjvclA4NqVu3PnoGnKs1ZYSRl/K5HEDsT0Cu0t7sV1B+2ZcpO2gzE9eNIolj6I
	QUupgGmTQKLUbQHBLyRmy55NvIYjLat3HJz8LCRu11COvGbH9wpYTx/pSWXERsmD0ntWiO/inrr
	B1FS4r0yhA7yiVjtasRdndTAONa7Zfk/z+KTdF0UCD5eoZ4uKcQ4muBTLth/mpv6cXPJzUsA=
X-Google-Smtp-Source: AGHT+IHPtrf0fK8rBml4r2nOfXgldRz8rTQxli+4ezEk1F1hitI3pNatm25itRWTioGcUOwBmMNptg==
X-Received: by 2002:a17:907:9406:b0:ae6:ae75:4ff6 with SMTP id a640c23a62f3a-aec6a66c837mr176960566b.52.1752832352864;
        Fri, 18 Jul 2025 02:52:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------wg4Zn43O9RBQXOGJxonvwvut"
Message-ID: <ca3467a2-c795-4709-ad92-1744b138a148@gmail.com>
Date: Fri, 18 Jul 2025 11:52:31 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>

This is a multi-part message in MIME format.
--------------wg4Zn43O9RBQXOGJxonvwvut
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/17/25 12:25 PM, Jan Beulich wrote:
> On 17.07.2025 10:56, Oleksii Kurochko wrote:
>> On 7/16/25 6:18 PM, Jan Beulich wrote:
>>> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>>>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>>>          return __map_domain_page(p2m->root + root_table_indx);
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>>>> See comments on the earlier patch regarding naming.
>>>>>>>
>>>>>>>> +{
>>>>>>>> +    int rc;
>>>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>>>>> I think I don't understand what is an issue. Could you please provide
>>>>>> some extra details?
>>>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>>>> of the function, making it possible to use it here?
>>>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>>>> implementation.
>>> Isn't that on overly severe limitation?
>> I wouldn't say that it's a severe limitation, as it's just a matter of how
>> |mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
>> |mfn_to_gfn()| can be implemented differently, while the code where it’s called
>> will likely remain unchanged.
>>
>> What I meant in my reply is that, for the current state and current limitations,
>> this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
>> see the value in, or the need for, non-1:1 mapped domains—it's just that this
>> limitation simplifies development at the current stage of the RISC-V port.
> Simplification is fine in some cases, but not supporting the "normal" way of
> domain construction looks like a pretty odd restriction. I'm also curious
> how you envision to implement mfn_to_gfn() then, suitable for generic use like
> the one here. Imo, current limitation or not, you simply want to avoid use of
> that function outside of the special gnttab case.
>
>>>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>>>> making Xen insert very many entries?
>>>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>>>> Which would require these allocations to come from that pool.
>>>> Yes, and it is true only for non-hardware domains with the current implementation.
>>> ???
>> I meant that pool is used now only for non-hardware domains at the moment.
> And how does this matter here? The memory required for the radix tree doesn't
> come from that pool anyway.

I thought that is possible to do that somehow, but looking at a code of
radix-tree.c it seems like the only one way to allocate memroy for the radix
tree isradix_tree_node_alloc() -> xzalloc(struct rcu_node).

Then it is needed to introduce radix_tree_node_allocate(domain) or radix tree
can't be used at all for mentioned in the previous replies security reason, no?


>>>>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>>>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>>>>> Or one domain exhausting memory would cause another domain to fail. A domain
>>>>> impacting just itself may be tolerable. But a domain affecting other domains
>>>>> isn't.
>>>> But it seems like this issue could happen in any implementation. It won't happen only
>>>> if we will have only pre-populated pool for any domain type (hardware, control, guest
>>>> domain) without ability to extend them or allocate extra pages from domheap in runtime.
>>>> Otherwise, if extra pages allocation is allowed then we can't really do something
>>>> with this issue.
>>> But that's why I brought this up: You simply have to. Or, as indicated, the
>>> moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
>> Why it isn't XSA for other architectures? At least, Arm then should have such
>> XSA.
> Does Arm use a radix tree for storing types? It uses one for mem-access, but
> it's not clear to me whether that's actually a supported feature.
>
>> I don't understand why x86 won't have the same issue. Memory is the limited
>> and shared resource, so if one of the domain will use to much memory then it could
>> happen that other domains won't have enough memory for its purpose...
> The question is whether allocations are bounded. With this use of a radix tree,
> you give domains a way to have Xen allocate pretty much arbitrary amounts of
> memory to populate that tree. That unbounded-ness is the problem, not memory
> allocations in general.

Isn't radix tree key bounded to an amount of GFNs given for a domain? We can't have
more keys then a max GFN number for a domain. So a potential amount of necessary memory
for radix tree is also bounded to an amount of GFNs.

Anyway, IIUC I just can't use radix tree for p2m types at all, right?
If yes, does it make sense to borrow 2 bits from struct page_info->type_info as now it
is used 9-bits for count of a frame?
So we will 7-bit reference counter, 2 bits for p2m types in type_info + 2 bits in PTE
what in general will give us 16 p2m types.

~ Oleksii

--------------wg4Zn43O9RBQXOGJxonvwvut
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
    <div class="moz-cite-prefix">On 7/17/25 12:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com">
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
              </blockquote>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
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
        <pre wrap="" class="moz-quote-pre">
I wouldn't say that it's a severe limitation, as it's just a matter of how
|mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
|mfn_to_gfn()| can be implemented differently, while the code where it’s called
will likely remain unchanged.

What I meant in my reply is that, for the current state and current limitations,
this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
see the value in, or the need for, non-1:1 mapped domains—it's just that this
limitation simplifies development at the current stage of the RISC-V port.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Simplification is fine in some cases, but not supporting the "normal" way of
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
        <pre wrap="" class="moz-quote-pre">
I meant that pool is used now only for non-hardware domains at the moment.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And how does this matter here? The memory required for the radix tree doesn't
come from that pool anyway.
</pre>
    </blockquote>
    <pre>I thought that is possible to do that somehow, but looking at a code of
radix-tree.c it seems like the only one way to allocate memroy for the radix
tree is <span
style="color: rgb(36, 41, 46); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">radix_tree_node_alloc() -&gt; </span>xzalloc(struct rcu_node).

Then it is needed to introduce radix_tree_node_allocate(domain) or radix tree
can't be used at all for mentioned in the previous replies security reason, no?


</pre>
    <blockquote type="cite"
      cite="mid:007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
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
        <pre wrap="" class="moz-quote-pre">
Why it isn't XSA for other architectures? At least, Arm then should have such
XSA.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does Arm use a radix tree for storing types? It uses one for mem-access, but
it's not clear to me whether that's actually a supported feature.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I don't understand why x86 won't have the same issue. Memory is the limited
and shared resource, so if one of the domain will use to much memory then it could
happen that other domains won't have enough memory for its purpose...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The question is whether allocations are bounded. With this use of a radix tree,
you give domains a way to have Xen allocate pretty much arbitrary amounts of
memory to populate that tree. That unbounded-ness is the problem, not memory
allocations in general.</pre>
    </blockquote>
    <pre>Isn't radix tree key bounded to an amount of GFNs given for a domain? We can't have
more keys then a max GFN number for a domain. So a potential amount of necessary memory
for radix tree is also bounded to an amount of GFNs.

Anyway, IIUC I just can't use radix tree for p2m types at all, right?
If yes, does it make sense to borrow 2 bits from struct page_info-&gt;type_info as now it
is used 9-bits for count of a frame?
So we will 7-bit reference counter, 2 bits for p2m types in type_info + 2 bits in PTE
what in general will give us 16 p2m types.

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------wg4Zn43O9RBQXOGJxonvwvut--

