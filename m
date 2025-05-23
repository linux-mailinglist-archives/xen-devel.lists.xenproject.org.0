Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0DFAC2005
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 11:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995521.1377888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIOxH-0007cv-Ku; Fri, 23 May 2025 09:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995521.1377888; Fri, 23 May 2025 09:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIOxH-0007Zn-Gr; Fri, 23 May 2025 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 995521;
 Fri, 23 May 2025 09:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Zg=YH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uIOxG-0007Zh-Fj
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 09:44:42 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bd4f348-37ba-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 11:44:39 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30bf7d0c15eso83550811fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 02:44:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d50364dsm11641844a12.32.2025.05.23.02.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 02:44:28 -0700 (PDT)
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
X-Inumbo-ID: 8bd4f348-37ba-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993479; x=1748598279; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihhV+WqyW2bpvcZYh20Nass9MEvkKP4sCuZ/GLVGPI4=;
        b=j7m1sXXU2wFDEUcwuyCfoH6400P6aBvuY35nBB32m771cJMj+f+nWz/xAYMykezj90
         7tBrk0mbfIyGbjM6UFfFt7wNfs7xlea8obRd4iPtY0tPlSEBlqVa1+pmRQIYsPzOybS+
         38nJ6XgE6+OAxgWjJf/NzYVHC850ZXHFywIx2R7d9+KSxp9rXXkmu0tLlXbDtBXgHgUJ
         kCftjHnEq2gNif7fT5ZzbmXc6VDoaS9u/v56w2IQz8Ihr99/5OU6cUAh7lipDe+1IfXw
         9TVSlr3oITmZsskm0cxoNwc9ahJ164pslje0K7fmTKO7y1L8fTrab3WSgPs6uTOEXdeL
         UCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993479; x=1748598279;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ihhV+WqyW2bpvcZYh20Nass9MEvkKP4sCuZ/GLVGPI4=;
        b=AmkVstSLu6WSnJlUZsYCPOmUROo4ELEIy9/l6tUR0HQKOGpxbV1N8Uzi24jBhIpebE
         K8QOMvohD3E5na1pd+j0MUOuqKyJSK76tv18WaR3kFFhUt3Woz6tArIjliZ5lt4ERZ01
         XqV20DAhSt4K69MCF9Z0pnhxqkjGGW+TJgEi8x9FVuVSuEcpAAfgr/VqY4pkExjoPzDS
         7LwyLcOQmf/tmaueTSPQ7CKMo3D8nInGC912egmjLdJU5gAKBz0mNID6G7wEB2DjSK50
         y0IRKICHrj4MPMYSr7rMWOA9kAleN4O2VPTjlQuezG3ke/7BDjDXB0QU/b+CDSuF3aUv
         dDeg==
X-Forwarded-Encrypted: i=1; AJvYcCWVJUeUKb5YtOvXclpKznv+Sh8qy8ETCOZDefmQ6sMhtK2LNvdz9g25wpMCR8frhQ4rAFl0jheQZZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLmZ09Pa1QSRp9hzAz0Da5eN0vbFVIdiTn4Ppe+uRQwxWXnaPh
	L88XTRDKeSU3WyzFcQ0rtwjzypMpXeAUb0f2oB8DWzWyNKyI+vCacdwcZ13t6w==
X-Gm-Gg: ASbGncssVyixnErs0iO3vBnjUHh/2wfnbyCUZWyheq6x48y/0SIaEMm44rNaFiLD3oW
	frNOF2aJELBrVLLC4khSN7tCSv+L16GdzHFOUJvQCWeXrzBl4xAcz21kVjskg/7YtKLRMyDRb3N
	gEr1bBe3Fnu9C9bIqcHXUj29DJEyNqB0WzoVNklEh25hpJeWdUzjS4hys5JwMejCEEYmKQGegA/
	GIHHbK78t80JfOhWuIx0SeLzggzZa1rs3T7mZzxkbc3wvGzWNNpblzH2MzmXkf/JW1Sx8OjbRzh
	GiJrPGenBQ8TeXcWHSqSaYEupN7f5FMUoQxaGFTm/uubZlm6Dx9tSWjq39Di0lVgpN2KDs5AKt7
	1oXYkPZ8wtJjILqeORlmN8W91
X-Google-Smtp-Source: AGHT+IHAfiPdpprb5QW/qb/pAbK1qdtfyHv7zhyAzyhbhiut5Y+NPaiXZlIIHjF6MMYjAWUN7/5dRQ==
X-Received: by 2002:a05:6402:90b:b0:5ff:addb:653e with SMTP id 4fb4d7f45d1cf-6011411aa27mr21622109a12.23.1747993468343;
        Fri, 23 May 2025 02:44:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------csSNPe6BUR10LVf3d2LeJe3N"
Message-ID: <b9ea4b4c-c21d-4414-8c37-9447821ece8d@gmail.com>
Date: Fri, 23 May 2025 11:44:26 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com>

This is a multi-part message in MIME format.
--------------csSNPe6BUR10LVf3d2LeJe3N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/25 6:09 PM, Jan Beulich wrote:
> On 22.05.2025 17:53, Oleksii Kurochko wrote:
>> On 5/20/25 3:37 PM, Jan Beulich wrote:
>>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>>> +static struct page_info *p2m_get_clean_page(struct domain *d)
>>>> +{
>>>> +    struct page_info *page;
>>>> +
>>>> +    /*
>>>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
>>>> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>>>> +     * and must be aligned to a 16-KiB boundary.
>>>> +     */
>>>> +    page = alloc_domheap_pages(NULL, 2, 0);
>>> Shouldn't this allocation come from the domain's P2M pool (which is yet
>>> to be introduced)?
>> First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
>> table allocation.
>>
>> p2m_init() is called by domain_create() [->arch_domain_create()->p2m_init()] from create_domUs():
>> [https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984].
>>
>> When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
>> is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
>> using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
>> so domain should be created first.
> Yet that is part of my point: This allocation should be against the domain,
> so it is properly accounted. What's the problem with allocating the root
> table when the pools is being created / filled?

I can't use pages from pool for root table as they aren't properly aligned.

At the moment, creation of p2m pool looks like:
  int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
  {
      struct page_info *pg;

      ASSERT(spin_is_locked(&d->arch.paging.lock));

      for ( ; ; )
      {
          if ( d->arch.paging.p2m_total_pages < pages )
          {
              /* Need to allocate more memory from domheap */
              pg = alloc_domheap_page(d, MEMF_no_owner);
              if ( pg == NULL )
              {
                  printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
                  return -ENOMEM;
              }
              ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
                  d->arch.paging.p2m_total_pages + 1;
              page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
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
  
      ASSERT(spin_is_locked(&d->arch.paging.lock));
  
+    if ( !d->arch.p2m.root )
+    {
+        unsigned int order = get_order_from_bytes(KB(16));
+        unsigned int nr_pages = _AC(1,U) << order;
+        /*
+        * As mentioned in the Priviliged Architecture Spec (version 20240411)
+        * As explained in Section 18.5.1, for the paged virtual-memory schemes
+        * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
+        * and must be aligned to a 16-KiB boundary.
+        */
+        d->arch.p2m.root = alloc_domheap_pages(d, order, MEMF_no_owner);
+        if ( d->arch.p2m.root == NULL )
+            panic("root page table hasn't been allocated\n");
+
+        clear_and_clean_page(d->arch.p2m.root);
+
+        /* TODO: do I need TLB flush here? */
+
+        ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
+            d->arch.paging.p2m_total_pages + nr_pages;
+    }
+
...
}
(I will the current version of p2m_alloc_table() instead of open-coding.)


>>>> +{
>>>> +    unsigned long ppn;
>>>> +    unsigned long hgatp_mode;
>>>> +
>>>> +    ppn = PFN_DOWN(page_to_maddr(page_info)) & HGATP_PPN;
>>>> +
>>>> +    /* ASID (VMID) not supported yet */
>>>> +
>>>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>>>> +    hgatp_mode = HGATP_MODE_SV39X4;
>>>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>>>> +    hgatp_mode = HGATP_MODE_SV48X4;
>>>> +#else
>>>> +    #error "add HGATP_MODE"
>>> As before, please have the # of pre-processor directives in the first column.
>>>
>>>> +#endif
>>>> +
>>>> +    return ppn | (hgatp_mode << HGATP_MODE_SHIFT);
>>> Use MASK_INSR()?
>> Do you mean MASK_INSR(hgatp_mode, HGATP_MODE_MASK)?
>> If yes, then I didn't get what is the point then?
> The point is that generally ..._SHIFT is redundant when you also have
> ..._MASK; that's what MASK_EXTR() and MASK_INSR() leverage.

At the moment, there is no mask for HGATP_MODE so if to use *_MASK then I
have to introduce it if it better to have *_MASK instead of *_SHIFT.

>
>>>> +static int p2m_alloc_table(struct domain *d)
>>>> +{
>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +
>>>> +    p2m->root = p2m_allocate_root(d);
>>>> +    if ( !p2m->root )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
>>>> +
>>>> +    /*
>>>> +     * Make sure that all TLBs corresponding to the new VMID are flushed
>>>> +     * before using it.
>>>> +     */
>>>> +    p2m_write_lock(p2m);
>>>> +    p2m_force_tlb_flush_sync(p2m);
>>>> +    p2m_write_unlock(p2m);
>>> While Andrew directed you towards a better model in general, it won't be
>>> usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
>>> want to do a single global flush e.g. when VMIDs wrap around. That'll be
>>> fewer global flushes than one per VM creation.
>> I am not sure that I get a phrase 'VMIDs wrap around'.
> You have to allocate them somehow. Typically you'll use the next one available.
> At some point you will need to start over, searching from the beginning. Prior
> to that now allocation of a new one will require any flush, as none of them
> had be in use before (after boot or the last such flush).

Thanks. Now I get your point.

Won't be better to do TLB flushing during destroying of a domain so then we will
be sure that TLBs connected to freed VMID aren't present in TLB anymore?

IIUC, it will work only if VMID is used, right?
In case if VMID isn't used, probably we can drop flushing here and do a flush
during booting, right?
Won't be enough to flushing of guest TLB only during context switch?

>
>> I am going to implement, p2m_force_tlb_flush_sync() as:
>>    static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>    {
>>      ...
>>        sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>>      ...
>>    }
>>
>> With such implementation if the guest didn't run on any pCPU(s) yet
>> then d->dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
>> as hmask will be NULL (https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238).
>> I am not sure that it is a good idea as I can't find a guarantee in the spec
>> that TLB will be empty during boot time.
> If in doubt, do one global flush while booting.

By booting you mean somewhere in continue_new_vcpu()?

~ Oleksii


--------------csSNPe6BUR10LVf3d2LeJe3N
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
    <div class="moz-cite-prefix">On 5/22/25 6:09 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
table allocation.

p2m_init() is called by domain_create() [-&gt;arch_domain_create()-&gt;p2m_init()] from create_domUs():
[<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984">https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984</a>].

When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
so domain should be created first.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yet that is part of my point: This allocation should be against the domain,
so it is properly accounted. What's the problem with allocating the root
table when the pools is being created / filled?</pre>
    </blockquote>
    <pre>I can't use pages from pool for root table as they aren't properly aligned.

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
(I will the current version of p2m_alloc_table() instead of open-coding.)


</pre>
    <blockquote type="cite"
      cite="mid:ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+{
+    unsigned long ppn;
+    unsigned long hgatp_mode;
+
+    ppn = PFN_DOWN(page_to_maddr(page_info)) &amp; HGATP_PPN;
+
+    /* ASID (VMID) not supported yet */
+
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    hgatp_mode = HGATP_MODE_SV48X4;
+#else
+    #error "add HGATP_MODE"
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">As before, please have the # of pre-processor directives in the first column.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+#endif
+
+    return ppn | (hgatp_mode &lt;&lt; HGATP_MODE_SHIFT);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Use MASK_INSR()?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Do you mean MASK_INSR(hgatp_mode, HGATP_MODE_MASK)?
If yes, then I didn't get what is the point then?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The point is that generally ..._SHIFT is redundant when you also have
..._MASK; that's what MASK_EXTR() and MASK_INSR() leverage.</pre>
    </blockquote>
    <pre>At the moment, there is no mask for HGATP_MODE so if to use *_MASK then I
have to introduce it if it better to have *_MASK instead of *_SHIFT.

</pre>
    <blockquote type="cite"
      cite="mid:ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
        <pre wrap="" class="moz-quote-pre">
I am not sure that I get a phrase 'VMIDs wrap around'.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You have to allocate them somehow. Typically you'll use the next one available.
At some point you will need to start over, searching from the beginning. Prior
to that now allocation of a new one will require any flush, as none of them
had be in use before (after boot or the last such flush).</pre>
    </blockquote>
    <pre>Thanks. Now I get your point.

Won't be better to do TLB flushing during destroying of a domain so then we will
be sure that TLBs connected to freed VMID aren't present in TLB anymore?

IIUC, it will work only if VMID is used, right?
In case if VMID isn't used, probably we can drop flushing here and do a flush
during booting, right?
Won't be enough to flushing of guest TLB only during context switch?

</pre>
    <blockquote type="cite"
      cite="mid:ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
If in doubt, do one global flush while booting.</pre>
    </blockquote>
    <pre>By booting you mean somewhere in continue_new_vcpu()?

~ Oleksii
</pre>
    <br>
  </body>
</html>

--------------csSNPe6BUR10LVf3d2LeJe3N--

