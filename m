Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A214AB1D72B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072888.1435822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzIU-0003YY-SI; Thu, 07 Aug 2025 12:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072888.1435822; Thu, 07 Aug 2025 12:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzIU-0003Wl-P6; Thu, 07 Aug 2025 12:00:38 +0000
Received: by outflank-mailman (input) for mailman id 1072888;
 Thu, 07 Aug 2025 12:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujzIT-0003Vo-Dt
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:00:37 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20aac16d-7386-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 14:00:36 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6152faff57eso1400903a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 05:00:36 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm1286326766b.54.2025.08.07.05.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 05:00:27 -0700 (PDT)
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
X-Inumbo-ID: 20aac16d-7386-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754568035; x=1755172835; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7MsqmoC2sdnLWMebV8CxlWp+Z4tqLX6XdzfIRkQRHk=;
        b=SVr+sVQQxyCJl+jOeDh/Phxsc8H4XEr67MM+mZWoCtS5uiEMaIwwjIi1VcvYrvFKCG
         Bp16C3Kl0KLBGLT/VFt+IsS5tmOOwoNL3SKxPoJNhrtZ2Rj2R7Vj0yXSkXeRyWRUtraG
         AAQFo9O7kHXvdcs1UO5M5c1ESwVRnZJNg6imPX4ynnfO1j41xsgm/8fUDoMPZbyVKToR
         fL2UDfuc0FD9wpilnTcOTzy9u98HGyrBfJ9N7HH9m/59XAyqIRGQghtSuHG/xRNMJBpF
         c8WGSlaMGWxlIO3ze/n9B1laxd0y7y9TMVw1auIvNHYkTAhObS+t58sw+LQmsn+IeXCE
         R8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754568035; x=1755172835;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V7MsqmoC2sdnLWMebV8CxlWp+Z4tqLX6XdzfIRkQRHk=;
        b=DF/iBUU7rfIp8Nuanv9K14SwTQXtxQOoJjgFDsrnAeBUnyweETHgpGKE6/KzBF8ibk
         Fo5EBg2iOQDKv93kJd/ZKRqUS66ip4rqf1xAxRhZ9n8I8YD1W4JVInyR0lYsPRBbUpQl
         VsJcKr9QH0oqhyxDdhHe4TfX9cCSicgFZ0zSTU4mF41OYYAdP2L3AzS9pb2xPeNyb+Qp
         fHqCqgbEN8HGUFig03E+PTY6R3E+Tp1YvFD18IMvvuu/6e8zea9mUKa+w6jyFY3l3d9b
         oYH2Rfnhej8VgHUA+ESbfG1Em2FIvuOkrRNPnra54Mh15j6GnAvBVHTh8VABdnJtEHfj
         zs/g==
X-Forwarded-Encrypted: i=1; AJvYcCUszmWIeupHS2yXczs8CxckjFyJ1uXde0DR1Z9Y0so9TVWfXlLeOUXkVM0PILM7ZSrgw8vmtk1tHGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuDAyfXyel2GVvlUMhYVnjRBSPilBabDB0GUu+wpMsc+s/JwuD
	N0GYDks/x1Qq2qfXR1E6tjHte5JqN8HVq9Mr46OE/vDIVOKuaNwCq+h4
X-Gm-Gg: ASbGncvnQ4tITy2OCzXvdq1Klzwm++eEV3xsHwO93Aa4/My1ADr9SqyXp2IpNchOadN
	GqlT/tNu1oSjS8Yq3L/uVEQcXD8GkE7pipMh0uagwktgJ9m4l1kPbyMb40IwYp0zTWotLre1Ivw
	fLCUNipGg8ga86lI+HEqnYD6vxkZWEtuNQQqqBNNpyTOPTKopV1L5pf0oW1EG92qth7n4t+mClf
	oXWRzUuQvJE0hHD98TEEleW6b7Q4CC5AVjju8Ila31kZMZwrlR9/D46FTZtyXWdiMzopcH1Jmam
	b6gRPruJ9GAkakvb0FG4GkMPSZpAph7ZHgVlZufHq/n3m9nHgWq062EqBPZSgwVMlMJda5HkdU5
	3ZrVIGPEhu/IWtdT65fzqdDO1PeP2xKloNyJ8oBQsUcIysvpgIu0bdZqwDW8WFc/oubO8ux8=
X-Google-Smtp-Source: AGHT+IHbrtlCS0ul/a11XiV2Hs1sYrYWEuX2DRAXpRGFqTQtCLPBYKqckLFBASP7IgF9lLql2GlLeA==
X-Received: by 2002:a17:907:3f9d:b0:ae0:b7c8:d735 with SMTP id a640c23a62f3a-af9a6ac9743mr198679666b.42.1754568035014;
        Thu, 07 Aug 2025 05:00:35 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------WQs5Vkl5Q3M7mmCKOOUD9V9K"
Message-ID: <d160c6da-a4a8-44ca-9dc5-b1e3cb31bde5@gmail.com>
Date: Thu, 7 Aug 2025 14:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
 <3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com>

This is a multi-part message in MIME format.
--------------WQs5Vkl5Q3M7mmCKOOUD9V9K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/25 12:37 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Introduce support for allocating and initializing the root page table
>> required for RISC-V stage-2 address translation.
>>
>> To implement root page table allocation the following is introduced:
>> - p2m_get_clean_page() and p2m_alloc_root_table(), p2m_allocate_root()
>>    helpers to allocate and zero a 16 KiB root page table, as mandated
>>    by the RISC-V privileged specification for Sv32x4/Sv39x4/Sv48x4/Sv57x4
>>    modes.
>> - Update p2m_init() to inititialize p2m_root_order.
>> - Add maddr_to_page() and page_to_maddr() macros for easier address
>>    manipulation.
>> - Introduce paging_ret_pages_to_domheap() to return some pages before
>>    allocate 16 KiB pages for root page table.
>> - Allocate root p2m table after p2m pool is initialized.
>> - Add construct_hgatp() to construct the hgatp register value based on
>>    p2m->root, p2m->hgatp_mode and VMID.
> Imo for this to be complete, freeing of the root table also wants taking
> care of. Much like imo p2m_init() would better immediately be accompanied
> by the respective teardown function. Once you start using them, you want
> to use them in pairs, after all.

I decided to ignore freeing of the root table and tearing down p2m mapping
as it is going to be used during a domain destroy, which isn't supported
at the moment, and thereby an implementation of them could be delayed when
they really will be used.

>
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -133,11 +133,13 @@
>>   #define HGATP_MODE_SV48X4		_UL(9)
>>   
>>   #define HGATP32_MODE_SHIFT		31
>> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>>   #define HGATP32_VMID_SHIFT		22
>>   #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>>   #define HGATP32_PPN			_UL(0x003FFFFF)
>>   
>>   #define HGATP64_MODE_SHIFT		60
>> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>>   #define HGATP64_VMID_SHIFT		44
>>   #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
>>   #define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
>> @@ -170,6 +172,7 @@
>>   #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
>>   #define HGATP_VMID_MASK			HGATP64_VMID_MASK
>>   #define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
>> +#define HGATP_MODE_MASK			HGATP64_MODE_MASK
>>   #else
>>   #define MSTATUS_SD			MSTATUS32_SD
>>   #define SSTATUS_SD			SSTATUS32_SD
>> @@ -181,8 +184,11 @@
>>   #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
>>   #define HGATP_VMID_MASK			HGATP32_VMID_MASK
>>   #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
>> +#define HGATP_MODE_MASK			HGATP32_MODE_MASK
>>   #endif
>>   
>> +#define GUEST_ROOT_PAGE_TABLE_SIZE	KB(16)
> In another context I already mentioned that imo you want to be careful with
> the use of "guest" in identifiers. It's not the guest page tables which have
> an order-2 root table, but the P2M (Xen terminology) or G-stage / second
> stage (RISC-V spec terminology) ones. As long as you're only doing P2M
> work, this may not look significant. But once you actually start dealing
> with guest page tables, it easily can end up confusing.

I thought that GUEST_ROOT_PAGE_TABLE is equal to G-stage root page table.
But it is confusing even now, then I'll use GSTAGE_ROOT_PAGE_TABLE_SIZE
instead.

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1,8 +1,86 @@
>> +#include <xen/domain_page.h>
>>   #include <xen/mm.h>
>>   #include <xen/rwlock.h>
>>   #include <xen/sched.h>
>>   
>>   #include <asm/paging.h>
>> +#include <asm/p2m.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +unsigned int __read_mostly p2m_root_order;
> If this is to be a variable at all, it ought to be __ro_after_init, and
> hence it shouldn't be written every time p2m_init() is run. If you want
> to to remain as a variable, what's wrong with
>
> const unsigned int p2m_root_order = ilog2(GUEST_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT;
>
> or some such? But of course equally well you could have
>
> #define P2M_ROOT_ORDER  (ilog2(GUEST_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)

The only one reason p2m_root_order was introduced as variable it was that
I had a compilation issue when define P2M_ROOT_ORDER in such way:
   #define P2M_ROOT_ORDER  get_order_from_bytes(GUEST_ROOT_PAGE_TABLE_SIZE)
But I can't reproduce it anymore.

Anyway, your option is better as it should be faster.

>
>> +static void clear_and_clean_page(struct page_info *page)
>> +{
>> +    clear_domain_page(page_to_mfn(page));
>> +
>> +    /*
>> +     * If the IOMMU doesn't support coherent walks and the p2m tables are
>> +     * shared between the CPU and IOMMU, it is necessary to clean the
>> +     * d-cache.
>> +     */
> That is, ...
>
>> +    clean_dcache_va_range(page, PAGE_SIZE);
> ... this call really wants to be conditional?

It makes sense. I will add "if ( p2m->clean_pte )" and update clear_and_clean_page()
declaration.

>
>> +}
>> +
>> +static struct page_info *p2m_allocate_root(struct domain *d)
> With there also being p2m_alloc_root_table() and with that being the sole
> caller of the function here, I wonder: Is having this in a separate
> function really outweighing the possible confusion of which of the two
> functions to use?

p2m_allocate_root() will be also used in further patches to allocate
root's metadata page(s), but, also, in the same function p2m_alloc_root_table().

Probably, to avoid confusion it makes sense to rename p2m_allocate_root() to
p2m_allocate_root_page().


>
>> +{
>> +    struct page_info *page;
>> +
>> +    /*
>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>> +     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
>> +     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
>> +     * be aligned to a 16-KiB boundary.
>> +     */
>> +    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
>> +    if ( !page )
>> +        return NULL;
>> +
>> +    for ( unsigned int i = 0; i < P2M_ROOT_PAGES; i++ )
>> +        clear_and_clean_page(page + i);
>> +
>> +    return page;
>> +}
>> +
>> +unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid)
>> +{
>> +    unsigned long ppn;
>> +
>> +    ppn = PFN_DOWN(page_to_maddr(p2m->root)) & HGATP_PPN;
> Why not page_to_pfn() or mfn_x(page_to_mfn())? I.e. why mix different groups
> of accessors?

No specific reason, just missed such option.

>
> As to "& HGATP_PPN" - that's making an assumption that you could avoid by
> using ...
>
>> +    /* TODO: add detection of hgatp_mode instead of hard-coding it. */
>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>> +    p2m->hgatp_mode = HGATP_MODE_SV39X4;
>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>> +    p2m->hgatp_mode = HGATP_MODE_SV48X4;
>> +#else
>> +#   error "add HGATP_MODE"
>> +#endif
>> +
>> +    return ppn | MASK_INSR(p2m->hgatp_mode, HGATP_MODE_MASK) |
>> +                 MASK_INSR(vmid, HGATP_VMID_MASK);
> ... MASK_INSR() also on "ppn".
>
> As to the writing of p2m->hgatp_mode - you don't want to do this here, when
> this is the function to calculate the value to put into hgatp. This field
> needs calculating only once, perhaps in p2m_init().

Agree, it makes sense to move hgatp_mode detection to p2m_init().

>
>> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
>> +{
>> +    struct domain *d = p2m->domain;
>> +    struct page_info *page;
>> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
> Is this local variable really of any use?

It will be needed for one of the next patches and to have less change in
further patch, I've decided to introduce it here.

>
>> +    /*
>> +     * Return back nr_root_pages to assure the root table memory is also
>> +     * accounted against the P2M pool of the domain.
>> +     */
>> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
>> +        return -ENOMEM;
>> +
>> +    page = p2m_allocate_root(d);
>> +    if ( !page )
>> +        return -ENOMEM;
> Hmm, and the pool is then left shrunk by 4 pages?

Yes until they are used for root table it shouldn't be in p2m pool (freelist),
when root table will be freed then it makes sense to return them back.
Am I missing something?

Probably, you meant that it is needed to update p2m->pages?

>
>> --- a/xen/arch/riscv/paging.c
>> +++ b/xen/arch/riscv/paging.c
>> @@ -54,6 +54,36 @@ int paging_freelist_init(struct domain *d, unsigned long pages,
>>   
>>       return 0;
>>   }
>> +
>> +bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
>> +{
>> +    struct page_info *page;
>> +
>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>> +
>> +    if ( ACCESS_ONCE(d->arch.paging.total_pages) < nr_pages )
>> +        return false;
>> +
>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>> +    {
>> +        /* Return memory to domheap. */
>> +        page = page_list_remove_head(&d->arch.paging.freelist);
>> +        if( page )
>> +        {
>> +            ACCESS_ONCE(d->arch.paging.total_pages)--;
>> +            free_domheap_page(page);
>> +        }
>> +        else
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
>> +            return false;
> Looks pretty redundant with half of paging_freelist_init(), including the
> stray full stop in the log message.

I will introduce then a separate function (for a code, which is inside
for-loop) and use it here and in paging_freelist_init().

Thanks.

~ Oleksii

--------------WQs5Vkl5Q3M7mmCKOOUD9V9K
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
    <div class="moz-cite-prefix">On 8/5/25 12:37 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce support for allocating and initializing the root page table
required for RISC-V stage-2 address translation.

To implement root page table allocation the following is introduced:
- p2m_get_clean_page() and p2m_alloc_root_table(), p2m_allocate_root()
  helpers to allocate and zero a 16 KiB root page table, as mandated
  by the RISC-V privileged specification for Sv32x4/Sv39x4/Sv48x4/Sv57x4
  modes.
- Update p2m_init() to inititialize p2m_root_order.
- Add maddr_to_page() and page_to_maddr() macros for easier address
  manipulation.
- Introduce paging_ret_pages_to_domheap() to return some pages before
  allocate 16 KiB pages for root page table.
- Allocate root p2m table after p2m pool is initialized.
- Add construct_hgatp() to construct the hgatp register value based on
  p2m-&gt;root, p2m-&gt;hgatp_mode and VMID.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo for this to be complete, freeing of the root table also wants taking
care of. Much like imo p2m_init() would better immediately be accompanied
by the respective teardown function. Once you start using them, you want
to use them in pairs, after all.</pre>
    </blockquote>
    <pre>I decided to ignore freeing of the root table and tearing down p2m mapping
as it is going to be used during a domain destroy, which isn't supported
at the moment, and thereby an implementation of them could be delayed when
they really will be used.

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -133,11 +133,13 @@
 #define HGATP_MODE_SV48X4		_UL(9)
 
 #define HGATP32_MODE_SHIFT		31
+#define HGATP32_MODE_MASK		_UL(0x80000000)
 #define HGATP32_VMID_SHIFT		22
 #define HGATP32_VMID_MASK		_UL(0x1FC00000)
 #define HGATP32_PPN			_UL(0x003FFFFF)
 
 #define HGATP64_MODE_SHIFT		60
+#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
 #define HGATP64_VMID_SHIFT		44
 #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
 #define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
@@ -170,6 +172,7 @@
 #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP64_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP64_MODE_MASK
 #else
 #define MSTATUS_SD			MSTATUS32_SD
 #define SSTATUS_SD			SSTATUS32_SD
@@ -181,8 +184,11 @@
 #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP32_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP32_MODE_MASK
 #endif
 
+#define GUEST_ROOT_PAGE_TABLE_SIZE	KB(16)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In another context I already mentioned that imo you want to be careful with
the use of "guest" in identifiers. It's not the guest page tables which have
an order-2 root table, but the P2M (Xen terminology) or G-stage / second
stage (RISC-V spec terminology) ones. As long as you're only doing P2M
work, this may not look significant. But once you actually start dealing
with guest page tables, it easily can end up confusing.</pre>
    </blockquote>
    <pre>I thought that GUEST_ROOT_PAGE_TABLE is equal to G-stage root page table.
But it is confusing even now, then I'll use GSTAGE_ROOT_PAGE_TABLE_SIZE
instead.

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,8 +1,86 @@
+#include &lt;xen/domain_page.h&gt;
 #include &lt;xen/mm.h&gt;
 #include &lt;xen/rwlock.h&gt;
 #include &lt;xen/sched.h&gt;
 
 #include &lt;asm/paging.h&gt;
+#include &lt;asm/p2m.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+unsigned int __read_mostly p2m_root_order;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If this is to be a variable at all, it ought to be __ro_after_init, and
hence it shouldn't be written every time p2m_init() is run. If you want
to to remain as a variable, what's wrong with

const unsigned int p2m_root_order = ilog2(GUEST_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT;

or some such? But of course equally well you could have

#define P2M_ROOT_ORDER  (ilog2(GUEST_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)</pre>
    </blockquote>
    <pre>The only one reason p2m_root_order was introduced as variable it was that
I had a compilation issue when define P2M_ROOT_ORDER in such way:
  #define P2M_ROOT_ORDER  get_order_from_bytes(GUEST_ROOT_PAGE_TABLE_SIZE)
But I can't reproduce it anymore.

Anyway, your option is better as it should be faster.

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void clear_and_clean_page(struct page_info *page)
+{
+    clear_domain_page(page_to_mfn(page));
+
+    /*
+     * If the IOMMU doesn't support coherent walks and the p2m tables are
+     * shared between the CPU and IOMMU, it is necessary to clean the
+     * d-cache.
+     */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That is, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    clean_dcache_va_range(page, PAGE_SIZE);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this call really wants to be conditional?</pre>
    </blockquote>
    <pre>It makes sense. I will add "if ( p2m-&gt;clean_pte )" and update clear_and_clean_page()
declaration.

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static struct page_info *p2m_allocate_root(struct domain *d)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With there also being p2m_alloc_root_table() and with that being the sole
caller of the function here, I wonder: Is having this in a separate
function really outweighing the possible confusion of which of the two
functions to use?</pre>
    </blockquote>
    <pre>p2m_allocate_root() will be also used in further patches to allocate
root's metadata page(s), but, also, in the same function p2m_alloc_root_table().

Probably, to avoid confusion it makes sense to rename p2m_allocate_root() to
p2m_allocate_root_page().


</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    struct page_info *page;
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
+     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
+     * be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
+    if ( !page )
+        return NULL;
+
+    for ( unsigned int i = 0; i &lt; P2M_ROOT_PAGES; i++ )
+        clear_and_clean_page(page + i);
+
+    return page;
+}
+
+unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid)
+{
+    unsigned long ppn;
+
+    ppn = PFN_DOWN(page_to_maddr(p2m-&gt;root)) &amp; HGATP_PPN;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why not page_to_pfn() or mfn_x(page_to_mfn())? I.e. why mix different groups
of accessors?</pre>
    </blockquote>
    <pre>No specific reason, just missed such option.

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

As to "&amp; HGATP_PPN" - that's making an assumption that you could avoid by
using ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* TODO: add detection of hgatp_mode instead of hard-coding it. */
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    p2m-&gt;hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    p2m-&gt;hgatp_mode = HGATP_MODE_SV48X4;
+#else
+#   error "add HGATP_MODE"
+#endif
+
+    return ppn | MASK_INSR(p2m-&gt;hgatp_mode, HGATP_MODE_MASK) |
+                 MASK_INSR(vmid, HGATP_VMID_MASK);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... MASK_INSR() also on "ppn".

As to the writing of p2m-&gt;hgatp_mode - you don't want to do this here, when
this is the function to calculate the value to put into hgatp. This field
needs calculating only once, perhaps in p2m_init().</pre>
    </blockquote>
    <pre>Agree, it makes sense to move hgatp_mode detection to p2m_init().

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int p2m_alloc_root_table(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m-&gt;domain;
+    struct page_info *page;
+    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this local variable really of any use?</pre>
    </blockquote>
    <pre>It will be needed for one of the next patches and to have less change in
further patch, I've decided to introduce it here.
</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /*
+     * Return back nr_root_pages to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
+        return -ENOMEM;
+
+    page = p2m_allocate_root(d);
+    if ( !page )
+        return -ENOMEM;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, and the pool is then left shrunk by 4 pages?</pre>
    </blockquote>
    <pre>Yes until they are used for root table it shouldn't be in p2m pool (freelist),
when root table will be freed then it makes sense to return them back.
Am I missing something?

Probably, you meant that it is needed to update p2m-&gt;pages?

</pre>
    <blockquote type="cite"
      cite="mid:3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -54,6 +54,36 @@ int paging_freelist_init(struct domain *d, unsigned long pages,
 
     return 0;
 }
+
+bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
+{
+    struct page_info *page;
+
+    ASSERT(spin_is_locked(&amp;d-&gt;arch.paging.lock));
+
+    if ( ACCESS_ONCE(d-&gt;arch.paging.total_pages) &lt; nr_pages )
+        return false;
+
+    for ( unsigned int i = 0; i &lt; nr_pages; i++ )
+    {
+        /* Return memory to domheap. */
+        page = page_list_remove_head(&amp;d-&gt;arch.paging.freelist);
+        if( page )
+        {
+            ACCESS_ONCE(d-&gt;arch.paging.total_pages)--;
+            free_domheap_page(page);
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "Failed to free P2M pages, P2M freelist is empty.\n");
+            return false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Looks pretty redundant with half of paging_freelist_init(), including the
stray full stop in the log message.</pre>
    </blockquote>
    <pre>I will introduce then a separate function (for a code, which is inside
for-loop) and use it here and in paging_freelist_init().

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------WQs5Vkl5Q3M7mmCKOOUD9V9K--

