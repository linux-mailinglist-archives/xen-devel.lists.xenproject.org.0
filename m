Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D7AEF3B0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 11:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029469.1403215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWXXV-0000cf-97; Tue, 01 Jul 2025 09:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029469.1403215; Tue, 01 Jul 2025 09:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWXXV-0000aT-6A; Tue, 01 Jul 2025 09:44:33 +0000
Received: by outflank-mailman (input) for mailman id 1029469;
 Tue, 01 Jul 2025 09:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqAo=ZO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWXXT-0000aL-EF
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 09:44:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb4fbc08-565f-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 11:44:28 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo5432894a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 02:44:28 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bc08sm828042166b.131.2025.07.01.02.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 02:44:27 -0700 (PDT)
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
X-Inumbo-ID: fb4fbc08-565f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751363068; x=1751967868; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+B8evVqmA7aJNEJwRfhROoEzmfkJv6+yH4kwj0ZICs=;
        b=gmH+mgijtY6XxY7M9AOWVjRPlHtLQM5WdmckHMEbpUfscVj9eYU1LqCpqianGNKJun
         ee8CDh3ZMU8TnymhT4njkM2WMCyuTEU7laaR7dj70/rdOGMQdBFQjfxozid0ieeBIVSC
         8KKhYJxeMp3zkej+Gtm1S5JzbDJHERP8fgGbqZynJJDFGW3fv2h0hCqUoSU0lelkad03
         l7XEpgD24Ol4tq0LkwBNiZdky/fPpQD7tK0DjyX6AtjRGlI2/LCghYjI17nzJrkWrsYr
         k6/DnJbSiptWhGSrSLo3sRcQYib7UXe21clJhux1cBr3+u1/x3CKDsPxHdeUoP3tfBMv
         mY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363068; x=1751967868;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+B8evVqmA7aJNEJwRfhROoEzmfkJv6+yH4kwj0ZICs=;
        b=fPIUCpUJ9J9PuD40pPseyekG7MExVDl6xc4AK9ipY+JU+AIwGGM60KyC0kHtFdWCYp
         lcPxNf9RcmwYQItEPrucEmqfT//nVNZiy5+CAReGMAnhUtD+BqjxdoKbAvkMki0Z/S+b
         9uzW+kISjiYJzd+Jujd86guuuxzSOHNWtsxDqJf2WvR8ZqgyG+/UiOxoIsveKOYqtryj
         uwlBaMpX0Pj2t9GdUB+Pd8SGyXV4II/H/JiPWHL/u1TfXcQKZRotaHrCa0+dWTYy0DEq
         iBlikcc70ZvZMtgdgTZgrwHOu/8vA/xxXCWpYFYWdaTfGAJord8rUBFPzB9n0utWQ/j2
         HNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJh56Ymk5whCXvuNRLf29LCwJcQjq0TViM4r/Zxp5OTC48m9hPrUym6+mQ7yxldnEJgSB+6ysaUVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBI4hTbUMCRHFWaObHa3qDcR9TFchv+cUNZ8207Ln8sHEgpM6s
	wFcIkswRiq5XEVm/ppzEbmUIeetFyNjAToQjUquQWnwTeAYzgSXhlQZpy5ppDw==
X-Gm-Gg: ASbGncvZ7XIhzTGPjPlTpoVig8W4bAIZqXLhemzo+1v7KMdusVOSZDX/Ce1EJAwQ0on
	Hsbks9TvWKzPJF4dPSzXknLLJaGjxvovRj8TemiQbnqFGaRlY/nUSjlAbGBPFuQ50phTSLuOVRL
	mBoD/I89/dSG9sCKndEBzQmJOXihmXlF9H+D+MLY8xEOjQZrFynyj6AVDAKBK2l6MXnxM3XPGNe
	KYN1KKJU0yxFBuhGkTpwYO4WQoc/I/f7b+SbupVjJcQO6WYlaTSTfqeIK1NpVksUz/FKp7a4kNI
	Nad8+juQzGkZrf0cej4Rlmf4nQqYNi1mngqlJS1PyeG4DK8bifriOeRCmzCZpkwV9eUzAtAip/0
	hu7YYBjRy7yJ7v7ql4Swy3H53nvhlelJ1Ef8=
X-Google-Smtp-Source: AGHT+IGTvpAEUpxon/0bLbIuGLt28D2JbHDvodvYhjSup8DEFmeFW9KWX8YYp4PqhsNvDsYJcDMZtg==
X-Received: by 2002:a17:906:c104:b0:ade:328a:95cd with SMTP id a640c23a62f3a-ae3500b8d67mr1595026666b.30.1751363067562;
        Tue, 01 Jul 2025 02:44:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------wzHL1mkqZlqiVHnoImjbVkYW"
Message-ID: <55144da9-cf8e-4b73-8817-e72d8ff91019@gmail.com>
Date: Tue, 1 Jul 2025 11:44:26 +0200
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
 <c9924195-17e5-4f47-869a-c7930a65538c@gmail.com>
 <49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com>

This is a multi-part message in MIME format.
--------------wzHL1mkqZlqiVHnoImjbVkYW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/1/25 8:29 AM, Jan Beulich wrote:
> On 30.06.2025 18:18, Oleksii Kurochko wrote:
>> On 6/30/25 5:22 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>> @@ -26,6 +26,12 @@ struct p2m_domain {
>>>>        /* Pages used to construct the p2m */
>>>>        struct page_list_head pages;
>>>>    
>>>> +    /* The root of the p2m tree. May be concatenated */
>>>> +    struct page_info *root;
>>>> +
>>>> +    /* Address Translation Table for the p2m */
>>>> +    paddr_t hgatp;
>>> Does this really need holding in a struct field? Can't is be re-created at
>>> any time from "root" above?
>> Yes, with the current one implementation, I agree it would be enough only
>> root. But as you noticed below...
>>
>>> And such re-creation is apparently infrequent,
>>> if happening at all after initial allocation. (But of course I don't know
>>> what future patches of yours will bring.) This is even more so if ...
>>>
>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> @@ -133,11 +133,13 @@
>>>>    #define HGATP_MODE_SV48X4		_UL(9)
>>>>    
>>>>    #define HGATP32_MODE_SHIFT		31
>>>> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>>>>    #define HGATP32_VMID_SHIFT		22
>>>>    #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>>>>    #define HGATP32_PPN			_UL(0x003FFFFF)
>>>>    
>>>>    #define HGATP64_MODE_SHIFT		60
>>>> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>>>>    #define HGATP64_VMID_SHIFT		44
>>>>    #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
>>> ... VMID management is going to change as previously discussed, at which
>>> point the value to put in hgatp will need (partly) re-calculating at certain
>>> points anyway.
>> ... after VMID management will changed to per-CPU base then it will be needed
>> to update re-calculate hgatp each time vCPU on pCPU is changed.
>> In this case I prefer to have partially calculated 'hgatp'.
> But why, when you need to do some recalculation anyway?

Less operations will be needed to do.
If we have partially prepared 'hgatp' then we have to only update VMID bits
instead of getting ppn for page, then calculate hgatp_mode each time.
But if you think it isn't really needed I can add vmid argument for hgatp_from_page()
and just call this function when an update of hgatp is needed.

>
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>>>>        write_unlock(&p2m->lock);
>>>>    }
>>>>    
>>>> +static void clear_and_clean_page(struct page_info *page)
>>>> +{
>>>> +    clean_dcache_va_range(page, PAGE_SIZE);
>>>> +    clear_domain_page(page_to_mfn(page));
>>>> +}
>>> A function of this name can, imo, only clear and then clean. Question is why
>>> it's the other way around, and what the underlying requirement is for the
>>> cleaning part to be there in the first place. Maybe that's obvious for a
>>> RISC-V person, but it's entirely non-obvious to me (Arm being different in
>>> this regard because of running with caches disabled at certain points in
>>> time).
>> You're right, the current name|clear_and_clean_page()| implies that clearing
>> should come before cleaning, which contradicts the current implementation.
>> The intent here is to ensure that the page contents are consistent in RAM
>> (not just in cache) before use by other entities (guests or devices).
>>
>> The clean must follow the clear — so yes, the order needs to be reversed.
> What you don't address though - why's the cleaning needed in the first place?

If we clean the data cache first, we flush the d-cache and then use the page to
perform the clear operation. As a result, the "cleared" value will be written into
the d-cache. To avoid polluting the d-cache with the "cleared" value, the correct
sequence is to clear the page first, then clean the data cache.

>>>> +    unsigned int nr_pages = _AC(1,U) << order;
>>> Nit (style): Missing blank after comma.
>> I've changed that to BIT(order, U)
>>
>>>> +    /* Return back nr_pages necessary for p2m root table. */
>>>> +
>>>> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
>>>> +        panic("Specify more xen,domain-p2m-mem-mb\n");
>>> You shouldn't panic() in anything involved in domain creation. You want to
>>> return NULL in this case.
>> It makes sense in this case just to return NULL.
>>
>>> Further, to me the use of "more" looks misleading here. Do you perhaps mean
>>> "larger" or "bigger"?
>>>
>>> This also looks to be happening without any lock held. If that's intentional,
>>> I think the "why" wants clarifying in a code comment.
>> Agree, returning back pages necessary for p2m root table should be done under
>> spin_lock(&d->arch.paging.lock).
> Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
> (As long as you mean to have that separation, that is. See the earlier discussion
> on that matter.)

Then partly p2m_set_allocation() should be moved to paging_*() too.

>>>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>>>> +    {
>>>> +        /* Return memory to domheap. */
>>>> +        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>> +        if( page )
>>>> +        {
>>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>>> +            free_domheap_page(page);
>>>> +        }
>>>> +        else
>>>> +        {
>>>> +            printk(XENLOG_ERR
>>>> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
>>>> +            return NULL;
>>>> +        }
>>>> +    }
>>> The reason for doing this may also want to be put in a comment.
>> I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */
> That describes what the code does, but not why.

I will add to the comment: "... to get the memory accounting right".

>
>>>> +{
>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +
>>>> +    p2m->root = p2m_allocate_root(d);
>>>> +    if ( !p2m->root )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    p2m->hgatp = hgatp_from_page(p2m);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>>    
>>>>    /*
>>>> @@ -228,5 +313,14 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>>            }
>>>>        }
>>>>    
>>>> +    /*
>>>> +    * First, wait for the p2m pool to be initialized. Then allocate the root
>>> Why "wait"? There's waiting here.
>> I am not really get your question.
>>
>> "wait" here is about the initialization of the pool which happens above this comment.
> But there's no "waiting" involved. What you talk about is one thing needing to
> happen after the other.

Okay, then I will just reword comment.

Thanks.

~ Oleksii

--------------wzHL1mkqZlqiVHnoImjbVkYW
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
    <div class="moz-cite-prefix">On 7/1/25 8:29 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com">
      <pre wrap="" class="moz-quote-pre">On 30.06.2025 18:18, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/30/25 5:22 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Does this really need holding in a struct field? Can't is be re-created at
any time from "root" above?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, with the current one implementation, I agree it would be enough only
root. But as you noticed below...

</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">... VMID management is going to change as previously discussed, at which
point the value to put in hgatp will need (partly) re-calculating at certain
points anyway.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
... after VMID management will changed to per-CPU base then it will be needed
to update re-calculate hgatp each time vCPU on pCPU is changed.
In this case I prefer to have partially calculated 'hgatp'.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But why, when you need to do some recalculation anyway?</pre>
    </blockquote>
    <pre>Less operations will be needed to do.
If we have partially prepared 'hgatp' then we have to only update VMID bits
instead of getting ppn for page, then calculate hgatp_mode each time.
But if you think it isn't really needed I can add vmid argument for hgatp_from_page()
and just call this function when an update of hgatp is needed.

</pre>
    <blockquote type="cite"
      cite="mid:49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">A function of this name can, imo, only clear and then clean. Question is why
it's the other way around, and what the underlying requirement is for the
cleaning part to be there in the first place. Maybe that's obvious for a
RISC-V person, but it's entirely non-obvious to me (Arm being different in
this regard because of running with caches disabled at certain points in
time).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
You're right, the current name|clear_and_clean_page()| implies that clearing
should come before cleaning, which contradicts the current implementation.
The intent here is to ensure that the page contents are consistent in RAM
(not just in cache) before use by other entities (guests or devices).

The clean must follow the clear — so yes, the order needs to be reversed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What you don't address though - why's the cleaning needed in the first place?</pre>
    </blockquote>
    <pre>If we clean the data cache first, we flush the d-cache and then use the page to
perform the clear operation. As a result, the "cleared" value will be written into
the d-cache. To avoid polluting the d-cache with the "cleared" value, the correct
sequence is to clear the page first, then clean the data cache.

</pre>
    <blockquote type="cite"
      cite="mid:49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    unsigned int nr_pages = _AC(1,U) &lt;&lt; order;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit (style): Missing blank after comma.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I've changed that to BIT(order, U)

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /* Return back nr_pages necessary for p2m root table. */
+
+    if ( ACCESS_ONCE(d-&gt;arch.paging.p2m_total_pages) &lt; nr_pages )
+        panic("Specify more xen,domain-p2m-mem-mb\n");
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">You shouldn't panic() in anything involved in domain creation. You want to
return NULL in this case.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It makes sense in this case just to return NULL.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Further, to me the use of "more" looks misleading here. Do you perhaps mean
"larger" or "bigger"?

This also looks to be happening without any lock held. If that's intentional,
I think the "why" wants clarifying in a code comment.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Agree, returning back pages necessary for p2m root table should be done under
spin_lock(&amp;d-&gt;arch.paging.lock).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
(As long as you mean to have that separation, that is. See the earlier discussion
on that matter.)</pre>
    </blockquote>
    <pre>Then partly p2m_set_allocation() should be moved to paging_*() too.

</pre>
    <blockquote type="cite"
      cite="mid:49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">The reason for doing this may also want to be put in a comment.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That describes what the code does, but not why.</pre>
    </blockquote>
    <pre>I will add to the comment: "... to get the memory accounting right".

</pre>
    <blockquote type="cite"
      cite="mid:49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Why "wait"? There's waiting here.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I am not really get your question.

"wait" here is about the initialization of the pool which happens above this comment.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But there's no "waiting" involved. What you talk about is one thing needing to
happen after the other.</pre>
    </blockquote>
    <pre>Okay, then I will just reword comment.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------wzHL1mkqZlqiVHnoImjbVkYW--

