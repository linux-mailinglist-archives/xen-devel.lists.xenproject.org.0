Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCAF4B13A3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 17:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269933.464083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nICj3-0002MO-36; Thu, 10 Feb 2022 16:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269933.464083; Thu, 10 Feb 2022 16:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nICj3-0002JS-01; Thu, 10 Feb 2022 16:55:21 +0000
Received: by outflank-mailman (input) for mailman id 269933;
 Thu, 10 Feb 2022 16:55:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FaY=SZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nICj1-0002JM-4W
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 16:55:19 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 395415bc-8a92-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 17:55:17 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id d10so16776552eje.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Feb 2022 08:55:17 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n2sm7514910ejl.55.2022.02.10.08.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 08:55:16 -0800 (PST)
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
X-Inumbo-ID: 395415bc-8a92-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gx+i6h+BQnSF83taSuIXVZ+Cb8cmjT7BXaMcWANcbbA=;
        b=D+ZbobNgWusV+Fgklq5mj/FI/NOTCpt0FCeQGZ5fwHg0M70UpSuTDfutOJQAjt5MET
         yutAtkdUpK1d1IypOR6UyGwBcJLrlSRdOUS0vdYJ1CanWZwhHCrV5eLUxtsVHvT4NUFh
         F1FosPEXMhXnyd69wPNz4ToE/e4Mo11ZhY+vZf1olGP2qSdL1sU/x2Jn8dQvUMkxXZ5B
         8l0rQMacnFkDjyHGKsKyuGbVkjo1eMKQdXbIW3BH17kdHjaTIj+BXg/VVKX/t4bzj2vH
         c+UK6Mkiuic+xgRFZgrFpqBsg7anKgynjAVZA/fL1nqpILD+9IgE7ad4rYtC+sNiIkXT
         DgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gx+i6h+BQnSF83taSuIXVZ+Cb8cmjT7BXaMcWANcbbA=;
        b=h+yPfTahIvMlerfV16dtpjAsbS2Ck/N2tbosRwlW6NY9dVA7zF+HJTZSww3hcrpSr0
         tDf6s+ekAcIzxG8uyDK/lEEYV+rQ+fcd75Cj0C85j2tEHT9NCplVkXi6EqpjLW5+K7nL
         jBnFtAY19v2CTs8Xvdnokcet0bQ7ggs+FyREv7KHCqww/P8qmJxeySmf0vAbstvpRuV0
         Fo/psrviDz9t0+QeSX1ddXOv+dwBW4Hif8wRyk5wz24qkLUDztNZXvlRmMpdut7MAE9Z
         ic/39tdLtLHpq5spSQ9snS2J2KLALmkm6Ivjh73sPfSfTzriWuYVEIyUWyQ4xxjloJRG
         3mbQ==
X-Gm-Message-State: AOAM530Tn2wflh5ZFFfkft0Ikdby1OaLBnyMAP7uFto8FQEcEl/rbBn4
	++qPXp8bYzngO4z8OfpRvIw=
X-Google-Smtp-Source: ABdhPJxtN4V54vnuNXJUZ2lZubYusRvFRS+Xj1kPnIUSUHgzOi2Raj8E36WMrdMwPrkT3sueyU4EGA==
X-Received: by 2002:a17:906:72db:: with SMTP id m27mr7273218ejl.105.1644512116810;
        Thu, 10 Feb 2022 08:55:16 -0800 (PST)
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <79fbf83e-d25e-2634-9769-8e07634bfd63@epam.com>
 <a104d3ea-170e-8175-ac04-abfcebb4ae29@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f9e3ee5b-0811-8317-42c2-61c8cdbfe254@gmail.com>
Date: Thu, 10 Feb 2022 18:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a104d3ea-170e-8175-ac04-abfcebb4ae29@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.02.22 11:46, Julien Grall wrote:
>
>
> On 08/02/2022 19:50, Oleksandr Tyshchenko wrote:
>>
>> On 08.02.22 13:58, Julien Grall wrote:
>>> Hi,
>>
>> Hi Julien
>
> Hi,


Hi Julien


Thank you for the clarifications!


>
>>>
>>>
>>> (Jan please confirm) If I am not mistaken, on x86, a read to the M2P
>>> is not always protected. But they have code within the P2M lock to
>>> check any difference (see p2m_remove_page()). I think we would need
>>> the same, so we don't end up to introduce a behavior similar to what
>>> XSA-387 has fixed on x86.
>>
>>
>> ... OK, I assume you are speaking about the check in the loop that was
>> added by the following commit:
>> c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e "x86/p2m: don't assert that the
>> passed in MFN matches for a remove"
>
> Yes, this is the one I Have in mind.


good


>
>> Also, I assume we need that check in the same place on Arm (with P2M
>> lock held), which, I think, could be p2m_remove_mapping().
>
> I believe so. 


good


> Can you do some testing to check this would not break other types of 
> mapping? (Booting a guest and using PV device should be enough).


Sure, already checked and will check more thoroughly before submitting.


>
>
>>
>> I ported the check from x86 code, but this is not a verbatim copy due to
>> the difference in local P2M helpers/macro between arches, also I have
>> skipped a part of that check "|| t == p2m_mmio_direct" which was added
>> by one of the follow-up commit:
>> 753cb68e653002e89fdcd1c80e52905fdbfb78cb "x86/p2m: guard (in particular)
>> identity mapping entries"
>> since I have no idea whether we need the same on Arm.
>
> I am not entirely sure. For now, I would drop it so long the behavior 
> stay the same (i.e. it will go ahead with removing the mappings).t.


ok, will drop.


>
>
>> Below the diff I have locally:
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 5646343..90d7563 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1315,11 +1315,32 @@ static inline int p2m_remove_mapping(struct
>> domain *d,
>>                                         mfn_t mfn)
>>    {
>>        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    unsigned long i;
>>        int rc;
>>
>>        p2m_write_lock(p2m);
>> +    for ( i = 0; i < nr; )
>> +    {
>> +        unsigned int cur_order;
>> +        bool valid;
>> +        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i),
>> NULL, NULL,
>> +                                         &cur_order, &valid); > +
>> +        if ( valid &&
>
> valid is a copy of the LPAE bit valid. This may be 0 if Xen decided to 
> clear it (i.e when emulating set/way). Yet the mapping itself is 
> considered valid from Xen PoV.
>
> So you want to replace with a different check (see below).


Hmm, I got it, so ...


>
>
>> +             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), 
>> mfn_return)) )
>> +        {
>> +            rc = -EILSEQ;
>> +            goto out;
>> +        }
>> +
>> +        i += (1UL << cur_order) -
>> +             ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
>> +    }
>> +
>>        rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
>>                           p2m_invalid, p2m_access_rwx);
>> +
>> +out:
>>        p2m_write_unlock(p2m);
>>
>>        return rc;
>>
>>
>> Could you please clarify, is it close to what you had in mind? If yes, I
>> am wondering, don't we need this check to be only executed for xenheap
>> pages (and, probably, which P2M's entry type in RAM?) rather than for
>> all pages?
>
> From my understanding, for the purpose of this work, we only strictly 
> need to check that for xenheap pages.


  ... yes, but ...


>
>
> But I think it would be a good opportunity to harden the P2M code. At 
> the moment, on Arm, you can remove any mappings you want (even with 
> the wrong helpers). This lead us to a few issues when mapping were 
> overriden silently (in particular when building dom0).
> So I would say we should enforce it for every RAM mapping. 


... I think this makes sense, so the proper check in that case, I 
assume, should contain p2m_is_any_ram() macro:


diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 5646343..2b82c49 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1315,11 +1315,32 @@ static inline int p2m_remove_mapping(struct 
domain *d,
                                       mfn_t mfn)
  {
      struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned long i;
      int rc;

      p2m_write_lock(p2m);
+    for ( i = 0; i < nr; )
+    {
+        unsigned int cur_order;
+        p2m_type_t t;
+        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), 
&t, NULL,
+                                         &cur_order, NULL);
+
+        if ( p2m_is_any_ram(t) &&
+             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
+        {
+            rc = -EILSEQ;
+            goto out;
+        }
+
+        i += (1UL << cur_order) -
+             ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
+    }
+
      rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
                         p2m_invalid, p2m_access_rwx);
+
+out:
      p2m_write_unlock(p2m);

      return rc;
(END)


> Stefano, Bertrand, what do you think?
>
> Note that, I would like to see this change in a separate commit. It 
> will be easier to review.


ok, I will introduce this check by a separate patch.


>
>
>>
>>
>>>
>>>
>>> In addition to that, if p2m_get_xenheap_gfn() is going to be called
>>> locklessly. Then we need to make sure the update to type_info are
>>> atomic. This means:
>>>   - p2m_get_xenheap_gfn() should use READ_ONCE().
>>>   - p2m_set_xenheap_gfn() should use WRITE_ONCE(). We might even need
>>> to use cmpxchg() if there are other update to type_info that are not
>>> protected. I will let you have a look.
>>
>>
>> ... OK, I didn't find READ_ONCE/WRITE_ONCE in Xen. I am wondering, can
>> we use ACCESS_ONCE instead?
>
> Yes. Sorry, I keep forgetting we don't have READ_ONCE/WRITE_ONCE in Xen.


ok


>
>>
>> Below the diff I have locally:
>>
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> index 9e093a6..b18acb7 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -373,7 +373,7 @@ unsigned int arch_get_dma_bitsize(void);
>>
>>    static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
>>    {
>> -    gfn_t gfn_ = _gfn(p->u.inuse.type_info & PGT_gfn_mask);
>> +    gfn_t gfn_ = _gfn(ACCESS_ONCE(p->u.inuse.type_info) & 
>> PGT_gfn_mask);
>>
>>        ASSERT(is_xen_heap_page(p));
>>
>> @@ -383,11 +383,14 @@ static inline gfn_t page_get_xenheap_gfn(const
>> struct page_info *p)
>>    static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t 
>> gfn)
>>    {
>>        gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? 
>> PGT_INVALID_XENHEAP_GFN : gfn;
>> +    unsigned long type_info;
>>
>>        ASSERT(is_xen_heap_page(p));
>>
>> -    p->u.inuse.type_info &= ~PGT_gfn_mask;
>> -    p->u.inuse.type_info |= gfn_x(gfn_);
>> +    type_info = ACCESS_ONCE(p->u.inuse.type_info);
>> +    type_info &= ~PGT_gfn_mask;
>> +    type_info |= gfn_x(gfn_);
>> +    ACCESS_ONCE(p->u.inuse.type_info) = type_info;
>>    }
>>
>>    #endif /*  __ARCH_ARM_MM__ */
>>
>>
>> It is going to be a non-protected write to GFN portion of type_info.
>
> Well no. You are using a Read-Modify-Write operation on type_info. 
> This is not atomic and will overwrite any change (if any) done on 
> other part of the type_info.


I am confused a bit, to which my comment your comment above belongs (to 
the diff for page_set_xenheap_gfn() above or to sentence right after it)?
The "It is going to be a non-protected write to GFN portion of 
type_info." sentence is related to the diff for alloc_heap_pages() 
below. Sorry if I didn't separate the comments properly.


>
>
> If I am mistaken, there are two other places where type_info is 
> modified. One is...
>
>
>> But, at that time the page is not used yet, so I think this is harmless.
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 50334a0..97cf0d8 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1024,7 +1024,7 @@ static struct page_info *alloc_heap_pages(
>>                                     &tlbflush_timestamp);
>>
>>             /* Initialise fields which have other uses for free 
>> pages. */
>> -        pg[i].u.inuse.type_info = 0;
>> +        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
>>             page_set_owner(&pg[i], NULL);
>>
>>         }
>
> ... this one. I agree the page is not accessible at this time. So 
> page_set_xenheap_gfn() should not be used.


yes


>
>
> The other one is in share_xen_page_with_guest() which I think is still 
> fine because the caller page_set_xenheap_gfn() would need to acquire a 
> reference on the page. This is only possible after the count_info is 
> updated in share_xen_page_with_guest() *and* there a barrier between 
> the type_info and count_info.
>
> I think this behavior should be documented on top of type_info (along 
> with the locking). This would be helpful if type_info gain more use in 
> the future.


agree, will do.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


