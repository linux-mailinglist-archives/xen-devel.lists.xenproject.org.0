Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED751559D5F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 17:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355595.583323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lHl-0000zm-US; Fri, 24 Jun 2022 15:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355595.583323; Fri, 24 Jun 2022 15:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lHl-0000wM-QK; Fri, 24 Jun 2022 15:31:53 +0000
Received: by outflank-mailman (input) for mailman id 355595;
 Fri, 24 Jun 2022 15:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3IMW=W7=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o4lHk-0000wG-Jn
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 15:31:52 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4b987af-f3d2-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 17:31:51 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id a13so5062904lfr.10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jun 2022 08:31:51 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056512104800b0047a4f18f825sm414384lfb.74.2022.06.24.08.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:31:49 -0700 (PDT)
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
X-Inumbo-ID: c4b987af-f3d2-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uOUdcW7R4AY8NQ/GHTwqoGgjVTj1aaOmB/taBQVJKMY=;
        b=g39lau4py5SIMDIqf8Zy5tcEyYu2tzCmb44KnVqBsjmrLEJYnswvm7OXflOiDQ/B2W
         iF3yUKyVsCLMSCVbz//dhVXgQ2yaBa9/haAzrGK3iw/X5GSdlgqzbQEU8Ww8Vxxol6bM
         dty9FFP1sKmQ8tIp26LuajmmKF3VkSFloslCyxZKUbuiN4sKrJbgpglmYEq12cTU/mbx
         9k5x8/IF0PAjbG0VERfXRy8ypfrvyMRW8BMUJQczPSRV9BAlKOqYlcO+W2Mtmjud6ExE
         tJ9tQmStrkcJ1+jaUr2PMFktF1ImPkeCvG9+AbfOeL4UuwPIXQe/A6bUZ7UxksBXfAOl
         LCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uOUdcW7R4AY8NQ/GHTwqoGgjVTj1aaOmB/taBQVJKMY=;
        b=dSeFwtpc8SZQR6GstyO+jFA+FtoZ1UiXUgmeFVU8h3CCkisd7YHUY3HBXCcNOPnpYj
         //pItEUcyh+c4jtEf+xdHxPOkL30RYbfUuMJdoqEjW8La4GRaKB00Gmu/N54ztku+eVR
         HOtIArqPuJJmaQer3hHvoZZEf406E6RRhWr0GApHMpXBZ6+XmN6Kqa3rvlOF+l5J404M
         lEqVtcyfSg2D6fHn4NdYjKGttH6FBFye7nYcG7GbaXj1PEHbwnPxJ4U6v0WMmgUrzljP
         Gmo7Kqsv+hN6RJyKvQ7gLevzP6Td0ZRSiXl1beZjTjTdn1WRH72ArfVfvgEe7gC/L3AA
         5ZnA==
X-Gm-Message-State: AJIora98Wxa2oxKTLxXfBL+5wCQCRFXkkZ9AOW8MLl3SsLqabpEa4LKO
	6v8kIQQrpXh1JZAYhrGwgQQ=
X-Google-Smtp-Source: AGRyM1sy0l1hQDqXf+rZiaNjpU7e8OJEfGbBriNPy6sRUWVQALdZ6fnGjw++knJ34bd7kKG8yZ9qkg==
X-Received: by 2002:a05:6512:2356:b0:47f:8756:737b with SMTP id p22-20020a056512235600b0047f8756737bmr9229551lfu.212.1656084710632;
        Fri, 24 Jun 2022 08:31:50 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <1652294845-13980-2-git-send-email-olekstysh@gmail.com>
 <42b0d343-a491-877c-3b5c-d9c95872774c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <94afe35c-627c-8aba-37ce-1d017a2e4e3c@gmail.com>
Date: Fri, 24 Jun 2022 18:31:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42b0d343-a491-877c-3b5c-d9c95872774c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.06.22 21:08, Julien Grall wrote:
> Hi Oleksandr,


Hello Julien


>
> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Borrow the x86's check from p2m_remove_page() which was added
>> by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
>> "x86/p2m: don't assert that the passed in MFN matches for a remove"
>> and adjust it to the Arm code base.
>>
>> Basically, this check is strictly needed for the xenheap pages only
>> since there are several non-protected read accesses to our simplified
>> xenheap based M2P approach on Arm (most calls to page_get_xenheap_gfn()
>> are not protected by the P2M lock).
>
> To me, this read as you introduced a bug in patch #1 and now you are 
> fixing it. So this patch should have been first.


Sounds like yes, I agree. But, in that case I propose to rewrite this 
text like the following:


Basically, this check will be strictly needed for the xenheap pages only 
*and* only after applying subsequent
commit which will introduce xenheap based M2P approach on Arm. But, it 
will be a good opportunity
to harden the P2M code for *every* RAM pages since it is possible to 
remove any GFN - MFN mapping
currently on Arm (even with the wrong helpers).


And ...


>
>>
>> But, it will be a good opportunity to harden the P2M code for *every*
>> RAM pages since it is possible to remove any GFN - MFN mapping
>> currently on Arm (even with the wrong helpers).
>
>> This can result in
>> a few issues when mapping is overridden silently (in particular when
>> building dom0).
>
> Hmmm... AFAIU, in such situation p2m_remove_mapping() wouldn't be 
> called. Instead, we would call the mapping helper twice and the 
> override would still happen.


    ... drop this one.


>
>
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> You can find the corresponding discussion at:
>> https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/ 
>>
>>
>> Changes V5 -> V6:
>>   - new patch
>> ---
>>   xen/arch/arm/p2m.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index f87b48e..635e474 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1311,11 +1311,32 @@ static inline int p2m_remove_mapping(struct 
>> domain *d,
>>                                        mfn_t mfn)
>>   {
>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    unsigned long i;
>>       int rc;
>>         p2m_write_lock(p2m);
>> +    for ( i = 0; i < nr; )
> One bit I really hate in the x86 code is the lack of in-code 
> documentation. It makes really difficult to understand the logic.
>
> I know this code was taken from x86, but I would like to avoid making 
> same mistake (this code is definitely not trivial). So can we document 
> the logic?


ok, I propose the following text right after acquiring the p2m lock:


  /*
   * Before removing the GFN - MFN mapping for any RAM pages make sure
   * that there is no difference between what is already mapped and what
   * is requested to be unmapped. If passed mapping doesn't match
   * the existing one bail out early.
   */


Could you please clarify, do you agree with both?


>
> The code itself looks good to me.

Thanks!


>
>> +    {
>> +        unsigned int cur_order;
>> +        p2m_type_t t;
>> +        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), 
>> &t, NULL,
>> +                                         &cur_order, NULL);
>> +
>> +        if ( p2m_is_any_ram(t) &&
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
>>       rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
>>                          p2m_invalid, p2m_access_rwx);
>> +
>> +out:
>>       p2m_write_unlock(p2m);
>>         return rc;
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


