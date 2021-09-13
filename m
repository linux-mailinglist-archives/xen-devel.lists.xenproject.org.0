Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE6409A62
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 19:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185859.334622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPpST-0000LV-AE; Mon, 13 Sep 2021 17:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185859.334622; Mon, 13 Sep 2021 17:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPpST-0000Ip-6l; Mon, 13 Sep 2021 17:09:29 +0000
Received: by outflank-mailman (input) for mailman id 185859;
 Mon, 13 Sep 2021 17:09:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cPWG=OD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mPpSR-0000F2-M6
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 17:09:27 +0000
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e689f226-86f1-4e66-aff0-eae49c29e68a;
 Mon, 13 Sep 2021 17:09:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qq21so16685881ejb.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Sep 2021 10:09:25 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l11sm1185043edv.67.2021.09.13.10.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 10:09:24 -0700 (PDT)
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
X-Inumbo-ID: e689f226-86f1-4e66-aff0-eae49c29e68a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=d/3P8gEjVO3pe7G/EMj7p3kp3t/iMclNRIETUDSO4og=;
        b=mn1T8nhsy4IFGX+lMfiNFugnU4UGkcZ4s5HmpeedcnDxhxL7qtm9+PC19MK88hXo8c
         WbnKilKUaaAxtilsBZmncT/emwvR/zhwPuQ77/eKFFoW3LPjaZpe3JbxvxOm52d7iOc7
         cC0zvIi/n79IdAPM8/ev372YaESl39J3QrQelzqu/Ykn5aU7bkhb6hTP3VLHPY2PgywI
         uVETW6QHUEIuDPGEDO7vlGdApprcETtsYgqAZSMn03VZOKFfvsdQSuo2i08T2oKldRqb
         h5VCbhe5mFqkAIj8xv3A6Q0AmNOpJvFX/3nxrhpwWxl5pCo+I3XoRWCuuaX2yHJFx6RB
         ++zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=d/3P8gEjVO3pe7G/EMj7p3kp3t/iMclNRIETUDSO4og=;
        b=Nh8RNFi448m0g3A9tLeIuy1CYQ7ICf25tFpAI4+XRkHFJDsSPDsRyMt1OG2BRw1YMq
         NFm/QxKnCvpBbIHLn/1jFfdBF4mGnVzwLwVLeSav9g2HT8akW+b/ELWRDRZ+xFvj0N09
         rwzEoWNfE/Pck6mP395wHRZOdYQ01jeu4fSs3cYbp9/1Vd3//SPD90N0f5ZRsRC9XASb
         WD+VpRRI3/DrVAW8IdkPZGr/UySQ2I6MAYA6sQyJeoRCWnvCs31GpvTgsDVVt2rE+mTj
         ltcB+QLX3SB6XSKNBjI/6pCY+YmAA/Gdi5JX5XIBD/UlIVDxsYU/vvxbidXlk36A9DG1
         p/Ng==
X-Gm-Message-State: AOAM533T5p8OGaGb6v1FFdvZ4EndMI7j2jocAvYX4axELpXnHttt8AlU
	lVi59qBodA2vifsfle/BUfBxKnZF4SA=
X-Google-Smtp-Source: ABdhPJzxcBD2PkQkiN+zJ/ToPvj7UwMOeoENIJikRbgYqWs0A/R00fl8WEcZ96WRVeoYpheQ/8aaFw==
X-Received: by 2002:a17:906:c205:: with SMTP id d5mr13875465ejz.74.1631552964818;
        Mon, 13 Sep 2021 10:09:24 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
 <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c286febc-b7b4-5aa4-5331-f0c2f6a17000@gmail.com>
Date: Mon, 13 Sep 2021 20:09:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.09.21 10:52, Jan Beulich wrote:


Hi Jan

> On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
>> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>>        */
>>       if ( p2m_is_foreign(pte.p2m.type) )
>>       {
>> -        mfn_t mfn = lpae_get_mfn(pte);
>> -
>>           ASSERT(mfn_valid(mfn));
>>           put_page(mfn_to_page(mfn));
>>       }
>> +
>> +#ifdef CONFIG_GRANT_TABLE
>> +    /*
>> +     * Check whether we deal with grant table page. As the grant table page
>> +     * is xen_heap page and its entry has known p2m type, detect it and mark
>> +     * the stored GFN as invalid.
>> +     */
>> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>> +#endif
> I take it the write done is benign for other Xen heap pages? I suppose
> this would want making very explicit, as such an assumption is easy to
> go stale by entirely unrelated changes.

Yes, I don't see what bad could happen if we would clear this field for 
non grant table pages. Except grant table pages I could detect only one 
page passed this check here which is, I assume, shared_info page. All 
pages have this field initialized with INVALID_GFN. But *only* grant 
table pages have this field in use. So, I think, no one will suffer. I 
will add a comment. Or you meant something more than just a comment?


>
> I also wonder whether you really mean to include p2m_ram_ro pages here
> as well.

You are right, only p2m_ram_rw is our target.


>
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1021,6 +1021,7 @@ static struct page_info *alloc_heap_pages(
>>   
>>           /* Initialise fields which have other uses for free pages. */
>>           pg[i].u.inuse.type_info = 0;
>> +        page_arch_init(&pg[i]);
> u.type_info's count portion also gets checked upon freeing a page.
> Don't you want to have an arch-custom check for your new use of the
> field as well? Or do you consider it not a problem (bug) if a page
> was freed which still has a GFN set on it?

Hmm, I didn't think about it. Good point. I can't say for sure, but I 
don't think it would be a normal behavior.
The valid GFN field for the page to be freed would mean that something 
doesn't work as expected (the corresponding page table entry wasn't 
freed, or it was, but
we couldn't detect the grant table page, etc). I will probably add 
corresponding page_arch_free() which triggers BUG if GFN is still valid.

But, there is a moment with that. The u.type_info's count portion is 
checked in free_domheap_pages(). So, I think we need to have arch-custom 
check in code path for xenheap_page.

Something like that:

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0c..bb359ca 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2204,7 +2204,10 @@ void *alloc_xenheap_pages(unsigned int order, 
unsigned int memflags)
          return NULL;

      for ( i = 0; i < (1u << order); i++ )
+    {
          pg[i].count_info |= PGC_xen_heap;
+        arch_init_xenheap_page(&pg[i]);
+    }

      return page_to_virt(pg);
  }
@@ -2222,7 +2225,10 @@ void free_xenheap_pages(void *v, unsigned int order)
      pg = virt_to_page(v);

      for ( i = 0; i < (1u << order); i++ )
+    {
          pg[i].count_info &= ~PGC_xen_heap;
+        arch_free_xenheap_page(&pg[i]);
+    }

      free_heap_pages(pg, order, true);
  }


Where on Arm, these are:

+#define arch_init_xenheap_page(_p)   page_set_frame_gfn(_p, INVALID_GFN)
+#define arch_free_xenheap_page(_p) \
+    BUG_ON(!gfn_eq(page_get_frame_gfn(_p), INVALID_GFN))

And just stubs on x86.

Please let me know if you think otherwise.


>
>> @@ -82,11 +53,21 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>           : gnttab_shared_gfn(NULL, gt, idx);                              \
>>   })
>>   
>> -#define gnttab_shared_gfn(d, t, i)                                       \
>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>> +#define gnttab_shared_page(t, i)    \
>> +    mfn_to_page(_mfn(__virt_to_mfn((t)->shared_raw[i])))
>> +
>> +#define gnttab_status_page(t, i)    \
>> +    mfn_to_page(_mfn(__virt_to_mfn((t)->status[i])))
> I wonder whether you wouldn't want to at least ASSERT() here that
> the virtual address you start from is actually non-NULL.

Agree, will add.


>
>> --- a/xen/include/asm-arm/mm.h
>> +++ b/xen/include/asm-arm/mm.h
>> @@ -39,7 +39,15 @@ struct page_info
>>           /* Page is in use: ((count_info & PGC_count_mask) != 0). */
>>           struct {
>>               /* Type reference count and various PGT_xxx flags and fields. */
>> -            unsigned long type_info;
>> +            unsigned long type_info:4;
>> +
>> +            /*
>> +             * Stored GFN if page is used for grant table frame
>> +             * (bits 59(27)-0).
> Are these bit numbers correct? I thought Arm, like x86, counted bits
> from low to high (unlike PPC, for example)?

I think, these are correct.  Yes, Little Endian is used.


>
>> +             */
>> +#define PGT_FRAME_GFN_WIDTH      (BITS_PER_LONG - 4)
>> +#define PGT_INVALID_FRAME_GFN    _gfn((1UL << PGT_FRAME_GFN_WIDTH) - 1)
>> +            unsigned long frame_gfn:PGT_FRAME_GFN_WIDTH;
>>           } inuse;
>>           /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
>>           union {
>> @@ -94,12 +102,12 @@ struct page_info
>>   #define PG_shift(idx)   (BITS_PER_LONG - (idx))
>>   #define PG_mask(x, idx) (x ## UL << PG_shift(idx))
>>   
>> -#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
>> -#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>> -#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>> +#define PGT_none          (0UL << 3)  /* no special uses of this page   */
>> +#define PGT_writable_page (1UL << 3)  /* has writable mappings?         */
>> +#define PGT_type_mask     (1UL << 3)
>>   
>>    /* Count of uses of this frame as its current type. */
>> -#define PGT_count_width   PG_shift(2)
>> +#define PGT_count_width   1
>>   #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> Leaving just a single bit seems pretty risky to me, and I can't see
> why you do so. You need 52 bits on Arm64. Which means you have 12
> bits left. Why not use them in full? Even on Arm32 you have 3 bits
> available for the count afaict.

Only 1 bit in the type_info field is really used on Arm, but anyway ...


>
> Also there's a disconnect here: If anyone wanted to change the number
> of bits used for the various fields, each such change should require
> an adjustment in as few independent places as possible. That is, there
> shouldn't be multiple uses of literal 4 further up, and there also
> shouldn't be a hidden connection between that 4 and the PGT_* values
> here. I think you'd better express the GFN as such a PGT_* construct
> as well. And you better would keep using PG_mask() and PG_shift().

... I think, this indeed makes sense. If got your request correctly, we 
can avoid disconnect here
and reserve 3-bit field for count for both Arm32 and Arm64. The struct 
page_info's type_info field remains untouched.


diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d2..8b73e1c 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -99,8 +99,14 @@ struct page_info
  #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 
63.                 */

   /* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
+#define PGT_count_base    PG_shift(4)
+#define PGT_count_mask    PG_mask(7, 4)
+
+/* Stored in bits [27:0] or [59:0] GFN if page is used for grant table 
frame */
+#define PGT_gfn_width     PG_shift(4)
+#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
+
+#define PGT_INVALID_FRAME_GFN   _gfn(PGT_gfn_mask)

   /* Cleared when the owning guest 'frees' this page. */
  #define _PGC_allocated    PG_shift(1)
@@ -163,6 +169,22 @@ extern unsigned long xenheap_base_pdx;

  #define maddr_get_owner(ma) (page_get_owner(maddr_to_page((ma))))

+#define page_get_frame_gfn(_p) ({                               \
+    gfn_t gfn_ = _gfn((_p)->u.inuse.type_info & PGT_gfn_mask);  \
+    gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : gfn_;   \
+})
+
+#define page_set_frame_gfn(_p, _gfn) ({                         \
+    gfn_t gfn_ = gfn_eq(_gfn, INVALID_GFN) ?                    \
+                 PGT_INVALID_FRAME_GFN : _gfn;                  \
+    (_p)->u.inuse.type_info &= ~PGT_gfn_mask;                   \
+    (_p)->u.inuse.type_info |= gfn_x(gfn_);                     \
+})

[snip]

Is it close to what you keep in mind?


The single use of type_info on Arm needs updating:

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0e07335..f306a93 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1376,14 +1376,18 @@ unsigned long domain_get_maximum_gpfn(struct 
domain *d)
  void share_xen_page_with_guest(struct page_info *page, struct domain *d,
                                 enum XENSHARE_flags flags)
  {
+    unsigned long type_info;
+
      if ( page_get_owner(page) == d )
          return;

      spin_lock(&d->page_alloc_lock);

      /* The incremented type count pins as writable or read-only. */
-    page->u.inuse.type_info =
-        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
+    type_info = page->u.inuse.type_info & ~(PGT_type_mask | 
PGT_count_mask);
+    page->u.inuse.type_info = type_info |
+        (flags == SHARE_ro ? PGT_none : PGT_writable_page) |
+        (1UL << PGT_count_base);

      page_set_owner(page, d);
      smp_wmb(); /* install valid domain ptr before updating refcnt. */


>
>> @@ -163,6 +171,15 @@ extern unsigned long xenheap_base_pdx;
>>   
>>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>>   
>> +#define page_get_frame_gfn(_p) ({                               \
>> +    gfn_t gfn_ = _gfn((_p)->u.inuse.frame_gfn);                 \
>> +    gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : gfn_;   \
>> +})
>> +
>> +#define page_set_frame_gfn(_p, _gfn) ((_p)->u.inuse.frame_gfn = gfn_x(_gfn))
>> +
>> +#define page_arch_init(_p)   page_set_frame_gfn(_p, INVALID_GFN)
> What's the purpose of the leading underscore in the macro parameter
> names? They're not in line with the C standard's designation of sub-
> namespaces for identifiers. (At least for the x86 counterpart please
> read this as a request to drop the underscore there.)

ok


Thank you.


-- 
Regards,

Oleksandr Tyshchenko


