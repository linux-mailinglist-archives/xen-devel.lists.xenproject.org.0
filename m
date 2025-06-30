Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C39AEE41A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 18:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029258.1403034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWHCu-0003X4-LJ; Mon, 30 Jun 2025 16:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029258.1403034; Mon, 30 Jun 2025 16:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWHCu-0003Um-II; Mon, 30 Jun 2025 16:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1029258;
 Mon, 30 Jun 2025 16:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irzh=ZN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWHCs-0003Ug-NZ
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 16:18:10 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6555e7-55cd-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 18:18:05 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae35c447234so654164866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 09:18:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35363aecdsm705640166b.16.2025.06.30.09.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 09:18:03 -0700 (PDT)
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
X-Inumbo-ID: cd6555e7-55cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751300284; x=1751905084; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDm1mQqcyBUZokPVAMRm4victrDQ+kORMVXoQtNWF4Q=;
        b=Hx29C7rD4YO3lO/x5kduqIK5K6/FxvcgrN7SgZAiadzacHk0lelRrIwzcqdCNg88bf
         5EWqFC4vnze1ZWaeevrVdYLUA3SZVEzCFjR0XM4HBEbwIkvGZinB1H7Qi5v7qZZWTXNI
         0HdI1npN5rIMgq43fVIeq2if+Q5D4LS9nfDb7VkolUvewGka4ZEIaEZLy8z/lyCRWueZ
         ysUmPVynk7fCU4/jGKo/5DKdxoSHe6Rs9ZVPihxkar2H/6kEERmhZddHHsSCA2IBb/Na
         kHFvfCPJstmSyxEutw/BwwQcrWXXuHHeF1WU1SOylIL0FcWiSKD7q9K5/GNxtn0z2/1w
         Rkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300285; x=1751905085;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDm1mQqcyBUZokPVAMRm4victrDQ+kORMVXoQtNWF4Q=;
        b=smC0+97V8aeDhFItmFmY2k4oxxWk/fYog3KJYRBinl4WCpimPaj9bf1oI50/rhzk1P
         d5OPmdD3bus0DYmCRDzO6ukD+o9SDSKdQX/mJTCvGRNpjzWZPDZ3hzRLNbZXm6Bf/fvZ
         6/+7Qc08VRA57tATgbJlQWFswDGiEV73ZgPfTDK41DiYAb0ueQ5EmX/FwrqIj875F/Il
         A8HcSDQRC+WR83U9bRNXojhumqLBdtnb1EPKctcJqaQAVyQoIeqlVcPVQtAR+4XmQrnn
         RgV/+bMcVRQ2JZnWklEnGjbl71sD3eh9OPnpr5s0+yQA0Lz9RWCOMwcXlcBekKM+/VNy
         7Gsg==
X-Forwarded-Encrypted: i=1; AJvYcCVjI1g6rh21QWVuOHXjwOqwV2jghYua0cNa1yBu13xQP+xGUbMHSUBET7asX16iGBmozgNwZpdvER4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNEQIwc7ZFPO9Yr7TZq/JsWAvMmCs1Zj7QfQMDFRB1QBpBP9Bw
	ZY6J16Jh+ggHsYYggdFaIz3cfN3MeXKhjcJ5SDysPxCrMG1XdP2lCAHx
X-Gm-Gg: ASbGncvW8ZW2lo9LqAA8ogUfRSjeQ5KvzfzMe7AMMWtnPAT6DXZBdk6+OGlShwZ5sG1
	Z1d65PgI2wWQv5E5Z2E+BspWq/Z1qsqZySOvIMBnUqV0FC0qPnAJiaU/HBgCBbP6B4JkSFVy6fm
	H4a0PSVbewc+zE2WLobz0zzvwsKdsMcMdwIOQNrP4de8pS09J7zQ5krbvhiSb+mxdIrh285zEOF
	e+33faj0VlXDo3L0qFhrQeR8TjPZ9Divt/Nub4RtODYH3l+GMRhDy+0MYh4zc5YkHe/P/98sGH+
	UAaNr35WGDp30SfuK244oygaqdI6M0m+XXGGU9RJ0aPH4NmIIY8/nCpt0KkdAKuN98bA1DOI6Ff
	Jv8eCk3pjuLPEduWunj8NQ1sZvk1HGpTSpzE=
X-Google-Smtp-Source: AGHT+IHQj3JjTcUwTZ+LnUcHvB4bjjSs89yS9p85V8i579qXl5fQpwz/zPvMyvOVt0/hGSnc27hwxg==
X-Received: by 2002:a17:907:c25:b0:ae3:6e5c:1c05 with SMTP id a640c23a62f3a-ae3aa365f57mr16828466b.30.1751300284110;
        Mon, 30 Jun 2025 09:18:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------2FTHIQhiOa3ZrNfgfpkwc2a0"
Message-ID: <c9924195-17e5-4f47-869a-c7930a65538c@gmail.com>
Date: Mon, 30 Jun 2025 18:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
 <9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com>

This is a multi-part message in MIME format.
--------------2FTHIQhiOa3ZrNfgfpkwc2a0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/30/25 5:22 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -26,6 +26,12 @@ struct p2m_domain {
>>       /* Pages used to construct the p2m */
>>       struct page_list_head pages;
>>   
>> +    /* The root of the p2m tree. May be concatenated */
>> +    struct page_info *root;
>> +
>> +    /* Address Translation Table for the p2m */
>> +    paddr_t hgatp;
> Does this really need holding in a struct field? Can't is be re-created at
> any time from "root" above?

Yes, with the current one implementation, I agree it would be enough only
root. But as you noticed below...

> And such re-creation is apparently infrequent,
> if happening at all after initial allocation. (But of course I don't know
> what future patches of yours will bring.) This is even more so if ...
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
> ... VMID management is going to change as previously discussed, at which
> point the value to put in hgatp will need (partly) re-calculating at certain
> points anyway.

... after VMID management will changed to per-CPU base then it will be needed
to update re-calculate hgatp each time vCPU on pCPU is changed.
In this case I prefer to have partially calculated 'hgatp'.

>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>>       write_unlock(&p2m->lock);
>>   }
>>   
>> +static void clear_and_clean_page(struct page_info *page)
>> +{
>> +    clean_dcache_va_range(page, PAGE_SIZE);
>> +    clear_domain_page(page_to_mfn(page));
>> +}
> A function of this name can, imo, only clear and then clean. Question is why
> it's the other way around, and what the underlying requirement is for the
> cleaning part to be there in the first place. Maybe that's obvious for a
> RISC-V person, but it's entirely non-obvious to me (Arm being different in
> this regard because of running with caches disabled at certain points in
> time).

You're right, the current name|clear_and_clean_page()| implies that clearing
should come before cleaning, which contradicts the current implementation.
The intent here is to ensure that the page contents are consistent in RAM
(not just in cache) before use by other entities (guests or devices).

The clean must follow the clear — so yes, the order needs to be reversed.

>
>> +static struct page_info *p2m_allocate_root(struct domain *d)
>> +{
>> +    struct page_info *page;
>> +    unsigned int order = get_order_from_bytes(KB(16));
> While better than a hard-coded order of 2, this still is lacking. Is there
> a reason there can't be a suitable manifest constant in the header?

No any specific reason, I just decided not to introduce new definition as
it is going to be used only inside this function.

I think it will make sense to have in p2m.c:
  #define P2M_ROOT_PT_SIZE KB(16)
If it isn't the best one option, then what about to move this defintion
to config.h or asm/p2m.h.

>
>> +    unsigned int nr_pages = _AC(1,U) << order;
> Nit (style): Missing blank after comma.

I've changed that to BIT(order, U)

>
>> +    /* Return back nr_pages necessary for p2m root table. */
>> +
>> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
>> +        panic("Specify more xen,domain-p2m-mem-mb\n");
> You shouldn't panic() in anything involved in domain creation. You want to
> return NULL in this case.

It makes sense in this case just to return NULL.

>
> Further, to me the use of "more" looks misleading here. Do you perhaps mean
> "larger" or "bigger"?
>
> This also looks to be happening without any lock held. If that's intentional,
> I think the "why" wants clarifying in a code comment.

Agree, returning back pages necessary for p2m root table should be done under
spin_lock(&d->arch.paging.lock).

>
>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>> +    {
>> +        /* Return memory to domheap. */
>> +        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
>> +        if( page )
>> +        {
>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>> +            free_domheap_page(page);
>> +        }
>> +        else
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
>> +            return NULL;
>> +        }
>> +    }
> The reason for doing this may also want to be put in a comment.

I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */

>
>> +    /* Allocate memory for p2m root table. */
>> +
>> +    /*
>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
> The first sentence didn't finish when the 2nd starts. Is there a piece missing?
> Do the two sentences want to be joined together?

Nothing is missed, just bad wording. I will update to:
   As mentioned in the Priviliged Architecture Spec (version 20240411) in Section 18.5.1, ...

>
>> +static unsigned long hgatp_from_page(struct p2m_domain *p2m)
> Function name and parameter type/name don't fit together.

I'll update an argument to struct page_info *root.

>
>> +{
>> +    struct page_info *p2m_root_page = p2m->root;
> As always: pointer-to-const wherever possible, please. But: Is this local
> variable really useful to have?

No, it will be just passed as an argument.

>
>> +    unsigned long ppn;
>> +    unsigned long hgatp_mode;
>> +
>> +    ppn = PFN_DOWN(page_to_maddr(p2m_root_page)) & HGATP_PPN;
>> +
>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>> +    hgatp_mode = HGATP_MODE_SV39X4;
>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>> +    hgatp_mode = HGATP_MODE_SV48X4;
>> +#else
>> +#   error "add HGATP_MODE"
>> +#endif
>> +
>> +    return ppn | MASK_INSR(p2m->vmid, HGATP_VMID_MASK) |
>> +           MASK_INSR(hgatp_mode, HGATP_MODE_MASK);
>> +}
>> +
>> +static int p2m_alloc_root_table(struct domain *d)
> As indicated earlier, in a wider context - this is a good candidate where
> the caller rather wants to pass struct p2m_domain *. Once you get variations
> on P2Ms (like x86'es altp2m or nestedp2m, the domain won't be meaningful
> here to know which P2M to allocate the root for.

Good point. I will re-work that.

>
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +    p2m->root = p2m_allocate_root(d);
>> +    if ( !p2m->root )
>> +        return -ENOMEM;
>> +
>> +    p2m->hgatp = hgatp_from_page(p2m);
>> +
>> +    return 0;
>> +}
>> +
>>   static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>   
>>   /*
>> @@ -228,5 +313,14 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>           }
>>       }
>>   
>> +    /*
>> +    * First, wait for the p2m pool to be initialized. Then allocate the root
> Why "wait"? There's waiting here.

I am not really get your question.

"wait" here is about the initialization of the pool which happens above this comment.

>
>> +    * table so that the necessary pages can be returned from the p2m pool,
>> +    * since the root table must be allocated using alloc_domheap_pages(...)
>> +    * to meet its specific requirements.
>> +    */
>> +    if ( !d->arch.p2m.root )
> Aren't you open-coding p2m_get_hostp2m() here?

Yes, p2m_get_hostp2m()  should be used here.

~ Oleksii

--------------2FTHIQhiOa3ZrNfgfpkwc2a0
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
    <div class="moz-cite-prefix">On 6/30/25 5:22 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -26,6 +26,12 @@ struct p2m_domain {
     /* Pages used to construct the p2m */
     struct page_list_head pages;
 
+    /* The root of the p2m tree. May be concatenated */
+    struct page_info *root;
+
+    /* Address Translation Table for the p2m */
+    paddr_t hgatp;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does this really need holding in a struct field? Can't is be re-created at
any time from "root" above? </pre>
    </blockquote>
    <pre>Yes, with the current one implementation, I agree it would be enough only
root. But as you noticed below...
</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">And such re-creation is apparently infrequent,
if happening at all after initial allocation. (But of course I don't know
what future patches of yours will bring.) This is even more so if ...

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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... VMID management is going to change as previously discussed, at which
point the value to put in hgatp will need (partly) re-calculating at certain
points anyway.
</pre>
    </blockquote>
    <pre>... after VMID management will changed to per-CPU base then it will be needed
to update re-calculate hgatp each time vCPU on pCPU is changed.
In this case I prefer to have partially calculated 'hgatp'.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
     write_unlock(&amp;p2m-&gt;lock);
 }
 
+static void clear_and_clean_page(struct page_info *page)
+{
+    clean_dcache_va_range(page, PAGE_SIZE);
+    clear_domain_page(page_to_mfn(page));
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
A function of this name can, imo, only clear and then clean. Question is why
it's the other way around, and what the underlying requirement is for the
cleaning part to be there in the first place. Maybe that's obvious for a
RISC-V person, but it's entirely non-obvious to me (Arm being different in
this regard because of running with caches disabled at certain points in
time).</pre>
    </blockquote>
    <pre data-start="1739" data-end="2190">You're right, the current name <code
    data-start="1770" data-end="1794">clear_and_clean_page()</code> implies that clearing
should come before cleaning, which contradicts the current implementation.
The intent here is to ensure that the page contents are consistent in RAM
(not just in cache) before use by other entities (guests or devices).
</pre>
    <pre data-start="2197" data-end="2343">The clean must follow the clear — so yes, the order needs to be reversed.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct page_info *p2m_allocate_root(struct domain *d)
+{
+    struct page_info *page;
+    unsigned int order = get_order_from_bytes(KB(16));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While better than a hard-coded order of 2, this still is lacking. Is there
a reason there can't be a suitable manifest constant in the header?</pre>
    </blockquote>
    <pre>No any specific reason, I just decided not to introduce new definition as
it is going to be used only inside this function.

I think it will make sense to have in p2m.c:
 #define P2M_ROOT_PT_SIZE KB(16)
If it isn't the best one option, then what about to move this defintion
to config.h or asm/p2m.h.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unsigned int nr_pages = _AC(1,U) &lt;&lt; order;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit (style): Missing blank after comma.</pre>
    </blockquote>
    <pre>I've changed that to BIT(order, U)
</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Return back nr_pages necessary for p2m root table. */
+
+    if ( ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) &lt; nr_pages )
+        panic("Specify more xen,domain-p2m-mem-mb\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You shouldn't panic() in anything involved in domain creation. You want to
return NULL in this case.</pre>
    </blockquote>
    <pre>It makes sense in this case just to return NULL.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

Further, to me the use of "more" looks misleading here. Do you perhaps mean
"larger" or "bigger"?

This also looks to be happening without any lock held. If that's intentional,
I think the "why" wants clarifying in a code comment.</pre>
    </blockquote>
    <pre>Agree, returning back pages necessary for p2m root table should be done under
spin_lock(&amp;d-&gt;arch.paging.lock).
</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    for ( unsigned int i = 0; i &lt; nr_pages; i++ )
+    {
+        /* Return memory to domheap. */
+        page = page_list_remove_head(&amp;d-&gt;arch.paging.p2m_freelist);
+        if( page )
+        {
+            ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages)--;
+            free_domheap_page(page);
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "Failed to free P2M pages, P2M freelist is empty.\n");
+            return NULL;
+        }
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The reason for doing this may also want to be put in a comment.</pre>
    </blockquote>
    <pre>I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */
</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Allocate memory for p2m root table. */
+
+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * As explained in Section 18.5.1, for the paged virtual-memory schemes
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The first sentence didn't finish when the 2nd starts. Is there a piece missing?
Do the two sentences want to be joined together?</pre>
    </blockquote>
    <pre>Nothing is missed, just bad wording. I will update to:
  As mentioned in the Priviliged Architecture Spec (version 20240411) in Section 18.5.1, ...

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static unsigned long hgatp_from_page(struct p2m_domain *p2m)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Function name and parameter type/name don't fit together.</pre>
    </blockquote>
    <pre>I'll update an argument to struct page_info *root.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    struct page_info *p2m_root_page = p2m-&gt;root;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As always: pointer-to-const wherever possible, please. But: Is this local
variable really useful to have?</pre>
    </blockquote>
    <pre>No, it will be just passed as an argument.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unsigned long ppn;
+    unsigned long hgatp_mode;
+
+    ppn = PFN_DOWN(page_to_maddr(p2m_root_page)) &amp; HGATP_PPN;
+
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    hgatp_mode = HGATP_MODE_SV39X4;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    hgatp_mode = HGATP_MODE_SV48X4;
+#else
+#   error "add HGATP_MODE"
+#endif
+
+    return ppn | MASK_INSR(p2m-&gt;vmid, HGATP_VMID_MASK) |
+           MASK_INSR(hgatp_mode, HGATP_MODE_MASK);
+}
+
+static int p2m_alloc_root_table(struct domain *d)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As indicated earlier, in a wider context - this is a good candidate where
the caller rather wants to pass struct p2m_domain *. Once you get variations
on P2Ms (like x86'es altp2m or nestedp2m, the domain won't be meaningful
here to know which P2M to allocate the root for.</pre>
    </blockquote>
    <pre>Good point. I will re-work that.

</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m-&gt;root = p2m_allocate_root(d);
+    if ( !p2m-&gt;root )
+        return -ENOMEM;
+
+    p2m-&gt;hgatp = hgatp_from_page(p2m);
+
+    return 0;
+}
+
 static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
 
 /*
@@ -228,5 +313,14 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
         }
     }
 
+    /*
+    * First, wait for the p2m pool to be initialized. Then allocate the root
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why "wait"? There's waiting here.</pre>
    </blockquote>
    <pre>I am not really get your question.

"wait" here is about the initialization of the pool which happens above this comment.
</pre>
    <blockquote type="cite"
      cite="mid:9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    * table so that the necessary pages can be returned from the p2m pool,
+    * since the root table must be allocated using alloc_domheap_pages(...)
+    * to meet its specific requirements.
+    */
+    if ( !d-&gt;arch.p2m.root )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Aren't you open-coding p2m_get_hostp2m() here?</pre>
    </blockquote>
    <pre>Yes, p2m_get_hostp2m()  should be used here.

~ Oleksii</pre>
  </body>
</html>

--------------2FTHIQhiOa3ZrNfgfpkwc2a0--

