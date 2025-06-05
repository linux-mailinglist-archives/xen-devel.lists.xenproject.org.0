Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E124CACF18C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:11:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006915.1386173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBIX-00007v-Tv; Thu, 05 Jun 2025 14:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006915.1386173; Thu, 05 Jun 2025 14:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBIX-00005E-Qf; Thu, 05 Jun 2025 14:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1006915;
 Thu, 05 Jun 2025 14:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNBIW-000058-6V
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:10:24 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1ad19e8-4216-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:10:22 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad883afdf0cso197013466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:10:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e2bf051sm1256969566b.122.2025.06.05.07.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:10:20 -0700 (PDT)
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
X-Inumbo-ID: d1ad19e8-4216-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749132622; x=1749737422; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MPcf/gXrO/twwLlDjHtT51ZHXLOI2tdCuqem5hsrwY=;
        b=Fy8vh2RZb8n5d/F+KinoFI2MeOJ9rDj3XhzS2zqw3PKoFbcCPTSYfG+8bvPtwHlZWu
         Ne0/lKd5ZXnO1iN7DVP+nU4xiMTlOeb4nnfQv0HyYcCV4ocdW9mxLTPPAFBD0duQ6E2s
         BV4K/8SDQHoZxYOYGTYF5aHklVfY3W5QrnDEKG6UkMVryN+e3l2x1z0ilWEunx0AcQMc
         2NjnQLeK05Qm1regYmEyRiS/O3vploE9hBESjw6PWvslhWVMvuM9itGUXFkxA3WqjEtC
         z17hm0NMz6zEWQ8ymoF9Phx7MJH6QyBJCx2Sn20mHVkeZOdL60U2tKs9ejxvQMVM25N6
         jAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749132622; x=1749737422;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7MPcf/gXrO/twwLlDjHtT51ZHXLOI2tdCuqem5hsrwY=;
        b=w2a6ozypDsd8BvJeGkye/C6oCDu2HbnlBN46/jLBNRo0K0gL4+uhe/Jd6mF+Dt1XZq
         kgT048iE1kqSzHD4LF2ZGfiv7Idq6Rn0CfPjtl8JdnDYFHh748NfFou5ilfJZcj88hgB
         3wWW4BR7feo3A+mG1iBD4fV6S/OAzXI+DSdllEfjXWZxixycakzZPhj1aOa2dMEsNjII
         JpUbIeoc4CEXnQ92n0NIcZvYYk3OXfhhTSRag2lfp7MRrwHS2DbJ2ZUbdWg2Rq+zio2O
         YjmjCn0FQtZzZeHWmHziWSjy+r+1fu6J2+f52LIaGrBejt7aRmYyXmW1Vmu8cYYh5eh3
         WRAg==
X-Forwarded-Encrypted: i=1; AJvYcCWQSYRR0cZagRK3wN+O6Jmqz5bxTiyexkNHVkX1L6LPHpMtyGAWRDL6TI7NwUs+4t4szWJ3Ti90E1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpPgaBoDu/W8bwOyeqRzo9vOSdrdDnk8/PzgJJxZX97EHLwiO1
	wOetMgakMGKhZbY84lmPInGFQKLo6CWFxVATTZ6A4tu8aFaR/vjmgWEb
X-Gm-Gg: ASbGncuYf9TpI0QTn14HtSD/W7f8zqr4gPWbgGPXOCpoJ9b8qCBeQ51X3zhbHtO36bv
	FKZS24PoKIM2//NJHIA46GwYoCHN9cZo2YI3kQ7iOHVjcG/4WHXts7pA4nx9sbIvbHhvXXP5rkQ
	3h/p/xHhSCKj7+/EwoetSwNvW4AaFfO/iDHofWMFNn3YdxqcNJXp4SNNIhUeDbP09x9vM3EKUAa
	xDmHsHhpd1DYKwHEMQV5eQBc8xX+gUtkzqoRap+6J5Q/hxQFgBwwsCpahdgVV/6Diwmc2hiHaqG
	s7X50frGCvrvT+/J6JPDXbgNX+s1qVzz5L9SmMEVmOalj4cuk/+et0FyeZ5C8/6qTVLISGSmGGR
	0poMp+Aetv3drK+atSrFUcCol
X-Google-Smtp-Source: AGHT+IGo6LVkTkiyO++lkjpqFUXwv8r2+vctKJJ8ggd9kdBI1TjGhZS5Do8GPvVTnNdnp9TDFwPOsA==
X-Received: by 2002:a17:907:94d0:b0:ad9:f54f:70a2 with SMTP id a640c23a62f3a-addf8d5c680mr573239266b.22.1749132621309;
        Thu, 05 Jun 2025 07:10:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------mlVo7cmWF8Yv0Ul1J0VE0lb0"
Message-ID: <a91e8f71-5793-4c27-92fe-a4c1707ea6dc@gmail.com>
Date: Thu, 5 Jun 2025 16:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>
 <1a0d3084-9e77-4df5-936a-c1a1317c0f18@gmail.com>
 <ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com>
 <b9ea4b4c-c21d-4414-8c37-9447821ece8d@gmail.com>
 <0175c281-b669-4412-971a-545e29077b34@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0175c281-b669-4412-971a-545e29077b34@suse.com>

This is a multi-part message in MIME format.
--------------mlVo7cmWF8Yv0Ul1J0VE0lb0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/2/25 1:04 PM, Jan Beulich wrote:
> On 23.05.2025 11:44, Oleksii Kurochko wrote:
>> On 5/22/25 6:09 PM, Jan Beulich wrote:
>>> On 22.05.2025 17:53, Oleksii Kurochko wrote:
>>>> On 5/20/25 3:37 PM, Jan Beulich wrote:
>>>>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>>>>> +static struct page_info *p2m_get_clean_page(struct domain *d)
>>>>>> +{
>>>>>> +    struct page_info *page;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>>>>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
>>>>>> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>>>>>> +     * and must be aligned to a 16-KiB boundary.
>>>>>> +     */
>>>>>> +    page = alloc_domheap_pages(NULL, 2, 0);
>>>>> Shouldn't this allocation come from the domain's P2M pool (which is yet
>>>>> to be introduced)?
>>>> First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
>>>> table allocation.
>>>>
>>>> p2m_init() is called by domain_create() [->arch_domain_create()->p2m_init()] from create_domUs():
>>>> [https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984].
>>>>
>>>> When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
>>>> is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
>>>> using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
>>>> so domain should be created first.
>>> Yet that is part of my point: This allocation should be against the domain,
>>> so it is properly accounted. What's the problem with allocating the root
>>> table when the pools is being created / filled?
>> I can't use pages from pool for root table as they aren't properly aligned.
>>
>> At the moment, creation of p2m pool looks like:
>>    int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>    {
>>        struct page_info *pg;
>>
>>        ASSERT(spin_is_locked(&d->arch.paging.lock));
>>
>>        for ( ; ; )
>>        {
>>            if ( d->arch.paging.p2m_total_pages < pages )
>>            {
>>                /* Need to allocate more memory from domheap */
>>                pg = alloc_domheap_page(d, MEMF_no_owner);
>>                if ( pg == NULL )
>>                {
>>                    printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>                    return -ENOMEM;
>>                }
>>                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>                    d->arch.paging.p2m_total_pages + 1;
>>                page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>            }
>>            ...
>>        }
>>
>>        return 0;
>>    }
>> alloc_domheap_page(d, MEMF_no_owner) allocates page table with order 0, so 4k-aligned page table.
>> But if I needed 16k for root table and it should be 16k-aligned then I still have to use
>> alloc_domheap_pages(NULL, 2, 0);
>>
>> Or do you mean that I have to something like:
>>    int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>    {
>>        struct page_info *pg;
>>    
>>        ASSERT(spin_is_locked(&d->arch.paging.lock));
>>    
>> +    if ( !d->arch.p2m.root )
>> +    {
>> +        unsigned int order = get_order_from_bytes(KB(16));
>> +        unsigned int nr_pages = _AC(1,U) << order;
>> +        /*
>> +        * As mentioned in the Priviliged Architecture Spec (version 20240411)
>> +        * As explained in Section 18.5.1, for the paged virtual-memory schemes
>> +        * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>> +        * and must be aligned to a 16-KiB boundary.
>> +        */
>> +        d->arch.p2m.root = alloc_domheap_pages(d, order, MEMF_no_owner);
>> +        if ( d->arch.p2m.root == NULL )
>> +            panic("root page table hasn't been allocated\n");
>> +
>> +        clear_and_clean_page(d->arch.p2m.root);
>> +
>> +        /* TODO: do I need TLB flush here? */
>> +
>> +        ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>> +            d->arch.paging.p2m_total_pages + nr_pages;
>> +    }
>> +
>> ...
>> }
> Neither. I was thinking of you taking 4 pages off the pool in exchange for the
> order-2 allocation. Primarily to get the memory accounting right (or at least
> closer to reality).

Do you mean that I have to call 4 times page_list_remove_head(), something like
that:
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -215,6 +215,44 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
          }
      }
  
+    if ( !d->arch.p2m.root )
+    {
+        unsigned int order = get_order_from_bytes(KB(16));
+        unsigned int nr_pages = _AC(1,U) << order;
+
+        if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
+            panic("Specify more xen,domain-p2m-mem-mb\n");
+
+        /*
+         * As mentioned in the Priviliged Architecture Spec (version 20240411)
+         * As explained in Section 18.5.1, for the paged virtual-memory schemes
+         * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+         * and must be aligned to a 16-KiB boundary.
+         */
+        d->arch.p2m.root = alloc_domheap_pages(NULL, order, 0);
+        if (  d->arch.p2m.root == NULL )
+            panic("failed to allocate p2m root page table\n");
+
+        for ( unsigned int i = 0; i < nr_pages; i++ )
+        {
+            clear_and_clean_page(d->arch.p2m.root + i);
+
+            /* Return memory to domheap */
+            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
+            if( pg )
+            {
+                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
+                free_domheap_page(pg);
+            }
+            else
+            {
+                printk(XENLOG_ERR
+                       "Failed to free P2M pages, P2M freelist is empty.\n");
+                return -ENOMEM;
+            }
+        }
+    }
+
      return 0;
  }

>>>>>> +static int p2m_alloc_table(struct domain *d)
>>>>>> +{
>>>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>>>> +
>>>>>> +    p2m->root = p2m_allocate_root(d);
>>>>>> +    if ( !p2m->root )
>>>>>> +        return -ENOMEM;
>>>>>> +
>>>>>> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Make sure that all TLBs corresponding to the new VMID are flushed
>>>>>> +     * before using it.
>>>>>> +     */
>>>>>> +    p2m_write_lock(p2m);
>>>>>> +    p2m_force_tlb_flush_sync(p2m);
>>>>>> +    p2m_write_unlock(p2m);
>>>>> While Andrew directed you towards a better model in general, it won't be
>>>>> usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
>>>>> want to do a single global flush e.g. when VMIDs wrap around. That'll be
>>>>> fewer global flushes than one per VM creation.
>>>> I am not sure that I get a phrase 'VMIDs wrap around'.
>>> You have to allocate them somehow. Typically you'll use the next one available.
>>> At some point you will need to start over, searching from the beginning. Prior
>>> to that now allocation of a new one will require any flush, as none of them
>>> had be in use before (after boot or the last such flush).
>> Thanks. Now I get your point.
>>
>> Won't be better to do TLB flushing during destroying of a domain so then we will
>> be sure that TLBs connected to freed VMID aren't present in TLB anymore?
> That's an option, but will result in more flushes. Furthermore there may be
> reasons to change the VMID for a domain while it's running.
>
>> IIUC, it will work only if VMID is used, right?
> Well, anything VMID related is of course only relevant when VMIDs are in use.
>
>> In case if VMID isn't used, probably we can drop flushing here and do a flush
>> during booting, right?
> That'll be too little flushing?

I meant that instead of having TLB flush in p2m_alloc_table() we could have a one flush
during booting. And of course, we still should have flush on each context switch.

>
>> Won't be enough to flushing of guest TLB only during context switch?
> "only" is interesting here. Context switches are a relatively frequent
> operation, which in addition you want to be fast. If a flush is necessary
> there for correctness (e.g. when VMIDs aren't in use), you have to do it
> there. But if you can flush less frequently without violating correctness,
> you'd almost always want to use such an opportunity.

Then it is better to introduce VMID now, it seems it's only one place where
it should be set, when hgatp is initialized.

Does Xen have some framework to work with VMID?

>
>>>> I am going to implement, p2m_force_tlb_flush_sync() as:
>>>>     static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>>>     {
>>>>       ...
>>>>         sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>>>>       ...
>>>>     }
>>>>
>>>> With such implementation if the guest didn't run on any pCPU(s) yet
>>>> then d->dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
>>>> as hmask will be NULL (https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238).
>>>> I am not sure that it is a good idea as I can't find a guarantee in the spec
>>>> that TLB will be empty during boot time.
>>> If in doubt, do one global flush while booting.
>> By booting you mean somewhere in continue_new_vcpu()?
> I don't particularly mean any specific place. However, continue_new_vcpu()
> (by its name) isn't involved in bringing up Xen, is it?
>
No, it isn't. By booting here I meant a boot of a guest domain, not Xen itself.

~ Oleksii

--------------mlVo7cmWF8Yv0Ul1J0VE0lb0
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
    <div class="moz-cite-prefix">On 6/2/25 1:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0175c281-b669-4412-971a-545e29077b34@suse.com">
      <pre wrap="" class="moz-quote-pre">On 23.05.2025 11:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 5/22/25 6:09 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 22.05.2025 17:53, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 5/20/25 3:37 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+static struct page_info *p2m_get_clean_page(struct domain *d)
+{
+    struct page_info *page;
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * As explained in Section 18.5.1, for the paged virtual-memory schemes
+     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+     * and must be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(NULL, 2, 0);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Shouldn't this allocation come from the domain's P2M pool (which is yet
to be introduced)?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
table allocation.

p2m_init() is called by domain_create() [-&gt;arch_domain_create()-&gt;p2m_init()] from create_domUs():
[<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984">https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984</a>].

When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
so domain should be created first.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yet that is part of my point: This allocation should be against the domain,
so it is properly accounted. What's the problem with allocating the root
table when the pools is being created / filled?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I can't use pages from pool for root table as they aren't properly aligned.

At the moment, creation of p2m pool looks like:
  int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
  {
      struct page_info *pg;

      ASSERT(spin_is_locked(&amp;d-&gt;arch.paging.lock));

      for ( ; ; )
      {
          if ( d-&gt;arch.paging.p2m_total_pages &lt; pages )
          {
              /* Need to allocate more memory from domheap */
              pg = alloc_domheap_page(d, MEMF_no_owner);
              if ( pg == NULL )
              {
                  printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
                  return -ENOMEM;
              }
              ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) =
                  d-&gt;arch.paging.p2m_total_pages + 1;
              page_list_add_tail(pg, &amp;d-&gt;arch.paging.p2m_freelist);
          }
          ...
      }

      return 0;
  }
alloc_domheap_page(d, MEMF_no_owner) allocates page table with order 0, so 4k-aligned page table.
But if I needed 16k for root table and it should be 16k-aligned then I still have to use
alloc_domheap_pages(NULL, 2, 0);

Or do you mean that I have to something like:
  int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
  {
      struct page_info *pg;
  
      ASSERT(spin_is_locked(&amp;d-&gt;arch.paging.lock));
  
+    if ( !d-&gt;arch.p2m.root )
+    {
+        unsigned int order = get_order_from_bytes(KB(16));
+        unsigned int nr_pages = _AC(1,U) &lt;&lt; order;
+        /*
+        * As mentioned in the Priviliged Architecture Spec (version 20240411)
+        * As explained in Section 18.5.1, for the paged virtual-memory schemes
+        * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+        * and must be aligned to a 16-KiB boundary.
+        */
+        d-&gt;arch.p2m.root = alloc_domheap_pages(d, order, MEMF_no_owner);
+        if ( d-&gt;arch.p2m.root == NULL )
+            panic("root page table hasn't been allocated\n");
+
+        clear_and_clean_page(d-&gt;arch.p2m.root);
+
+        /* TODO: do I need TLB flush here? */
+
+        ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) =
+            d-&gt;arch.paging.p2m_total_pages + nr_pages;
+    }
+
...
}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Neither. I was thinking of you taking 4 pages off the pool in exchange for the
order-2 allocation. Primarily to get the memory accounting right (or at least
closer to reality).</pre>
    </blockquote>
    <pre>Do you mean that I have to call 4 times page_list_remove_head(), something like
that:
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -215,6 +215,44 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
         }
     }
 
+    if ( !d-&gt;arch.p2m.root )
+    {
+        unsigned int order = get_order_from_bytes(KB(16));
+        unsigned int nr_pages = _AC(1,U) &lt;&lt; order;
+
+        if ( ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) &lt; nr_pages )
+            panic("Specify more xen,domain-p2m-mem-mb\n");
+
+        /*
+         * As mentioned in the Priviliged Architecture Spec (version 20240411)
+         * As explained in Section 18.5.1, for the paged virtual-memory schemes
+         * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+         * and must be aligned to a 16-KiB boundary.
+         */
+        d-&gt;arch.p2m.root = alloc_domheap_pages(NULL, order, 0);
+        if (  d-&gt;arch.p2m.root == NULL )
+            panic("failed to allocate p2m root page table\n");
+
+        for ( unsigned int i = 0; i &lt; nr_pages; i++ )
+        {
+            clear_and_clean_page(d-&gt;arch.p2m.root + i);
+
+            /* Return memory to domheap */
+            pg = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+            if( pg )
+            {
+                ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages)--;
+                free_domheap_page(pg);
+            }
+            else
+            {
+                printk(XENLOG_ERR
+                       "Failed to free P2M pages, P2M freelist is empty.\n");
+                return -ENOMEM;
+            }
+        }
+    }
+
     return 0;
 }

</pre>
    <blockquote type="cite"
      cite="mid:0175c281-b669-4412-971a-545e29077b34@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+static int p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m-&gt;root = p2m_allocate_root(d);
+    if ( !p2m-&gt;root )
+        return -ENOMEM;
+
+    p2m-&gt;hgatp = hgatp_from_page_info(p2m-&gt;root);
+
+    /*
+     * Make sure that all TLBs corresponding to the new VMID are flushed
+     * before using it.
+     */
+    p2m_write_lock(p2m);
+    p2m_force_tlb_flush_sync(p2m);
+    p2m_write_unlock(p2m);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">While Andrew directed you towards a better model in general, it won't be
usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
want to do a single global flush e.g. when VMIDs wrap around. That'll be
fewer global flushes than one per VM creation.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I am not sure that I get a phrase 'VMIDs wrap around'.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">You have to allocate them somehow. Typically you'll use the next one available.
At some point you will need to start over, searching from the beginning. Prior
to that now allocation of a new one will require any flush, as none of them
had be in use before (after boot or the last such flush).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Thanks. Now I get your point.

Won't be better to do TLB flushing during destroying of a domain so then we will
be sure that TLBs connected to freed VMID aren't present in TLB anymore?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's an option, but will result in more flushes. Furthermore there may be
reasons to change the VMID for a domain while it's running.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">IIUC, it will work only if VMID is used, right?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, anything VMID related is of course only relevant when VMIDs are in use.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In case if VMID isn't used, probably we can drop flushing here and do a flush
during booting, right?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That'll be too little flushing?</pre>
    </blockquote>
    <pre>I meant that instead of having TLB flush in p2m_alloc_table() we could have a one flush
during booting. And of course, we still should have flush on each context switch.

</pre>
    <blockquote type="cite"
      cite="mid:0175c281-b669-4412-971a-545e29077b34@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Won't be enough to flushing of guest TLB only during context switch?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"only" is interesting here. Context switches are a relatively frequent
operation, which in addition you want to be fast. If a flush is necessary
there for correctness (e.g. when VMIDs aren't in use), you have to do it
there. But if you can flush less frequently without violating correctness,
you'd almost always want to use such an opportunity.</pre>
    </blockquote>
    <pre>Then it is better to introduce VMID now, it seems it's only one place where
it should be set, when hgatp is initialized.

Does Xen have some framework to work with VMID?
</pre>
    <blockquote type="cite"
      cite="mid:0175c281-b669-4412-971a-545e29077b34@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I am going to implement, p2m_force_tlb_flush_sync() as:
   static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
   {
     ...
       sbi_remote_hfence_gvma(d-&gt;dirty_cpumask, 0, 0);
     ...
   }

With such implementation if the guest didn't run on any pCPU(s) yet
then d-&gt;dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
as hmask will be NULL (<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238">https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238</a>).
I am not sure that it is a good idea as I can't find a guarantee in the spec
that TLB will be empty during boot time.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">If in doubt, do one global flush while booting.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
By booting you mean somewhere in continue_new_vcpu()?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't particularly mean any specific place. However, continue_new_vcpu()
(by its name) isn't involved in bringing up Xen, is it?

</pre>
    </blockquote>
    <pre>No, it isn't. By booting here I meant a boot of a guest domain, not Xen itself.

~ Oleksii
</pre>
  </body>
</html>

--------------mlVo7cmWF8Yv0Ul1J0VE0lb0--

