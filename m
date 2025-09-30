Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D904BAC6CF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 12:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134176.1472166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3XMA-00056M-Cl; Tue, 30 Sep 2025 10:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134176.1472166; Tue, 30 Sep 2025 10:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3XMA-00054A-9f; Tue, 30 Sep 2025 10:13:14 +0000
Received: by outflank-mailman (input) for mailman id 1134176;
 Tue, 30 Sep 2025 10:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3XM8-000544-M4
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 10:13:12 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11997018-9de6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 12:13:11 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso17661535e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 03:13:11 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603365sm22687164f8f.37.2025.09.30.03.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 03:13:10 -0700 (PDT)
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
X-Inumbo-ID: 11997018-9de6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759227191; x=1759831991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Fmj4kPweqGagopkTjTJLhrAbweIQr5nzSW5aUdudZo=;
        b=zIupjAi+sQkuk41MBnZwKhtvxPy3IWjK4aF+LMZLih+98pW8IVC06qzTI9zL78X0vf
         AtV5WjEeO5y3TmbSAG8uDcX7V3gAWVeg/4GUbiS4+/aRcPt4LMLlRvCy1P+Q8aDTfi8I
         FS1TZ9g3h+z/jYlZDP0x3txDKy41qkmxFbabUOLjbzLxFCYQGuuby4KX2fc8cepOuSM1
         rdfRujs76oyPnCb5Iw9PRpGjw/ud4S3uQNfajfbsH70HsEp7n3ghWoMhekmyqKMn7bdo
         heuXKtlUw6fOQO1aQNoWTNngW82R3wdVB+hI4ICBNdcsl+sdXQhTyBykGumncv+cNyKQ
         swbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227191; x=1759831991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Fmj4kPweqGagopkTjTJLhrAbweIQr5nzSW5aUdudZo=;
        b=rsGmhgEfoXjmHXO2sevKjaCXGSGcLEPNkoXCQNky4g66nZVF7QloNTmp7wDaRz04ev
         Ho0Cybtri1Yt6WUU5+PNJUmTRRPA0i4hShTP4awNs2WCSsIqDz8aIadBhHXQ054kd/Zl
         gWV564UfpQGaN08vqpqR9b6W6ZxITDXGElRIo0XB1ddAzTgvH6wugxBlYDtmYaX9dI/v
         erSpoVzNoSQFkqjF2sWxNj6cNEvD1YUFNE5dUa6UXMM92Lis0BGrqD7xkGCqSMe7Rjjt
         3igLj9b3gKTbm97MR1ZAGBfNoeJyrtmpk9X6KpiffMBOfGPo7ILAYuxYwyEVHQcJHSuj
         Ye4g==
X-Forwarded-Encrypted: i=1; AJvYcCWs+DDm437cbLuM8pZcWuoLb9ir5+z4Ybmm1SvTaG+IkywRPszREkh407KGyw7lurqjKUgGyxL/RIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8G8QjjlaPX46bTsM5ktYo1sCn1CiT1hf2sSPPZAPuOXgEdek3
	nR7qQAhfbPhGJt1eb2XaPNDfUV3j+rNqZlYe/zHBECaU/ImKmkTwkql2u+EDK0/OY+w=
X-Gm-Gg: ASbGnctzv372SPQSJ9kYzX7XZuKNMLPnS556KbXlQV01EizCsHSKde6IFMVgNF24Lit
	LdiWpXZCrQTN0PMUAQTgvWQz1uVvK68ngvZ8YL0NUf8PI5mLlociuVlRxzenIusHVCabQEZaNWI
	dygZqQEyrQ1QdiB3TTiyQrOfYlb2HXOF3X67ag5/G+/tU6ZJvzQzr/C08qAfKyScGzZamPpOmsW
	SzH2MG2xBheEjrKo46QaF19td+Y1ibwz1RmLT9nA4hm+8Ir9zjaR198MvhWpdcYw4eUo6jm3Cw2
	hCeWFb2Kr9nvMkErModxG7WtJRZSvW4TnyEMcJ8NSbnmu1bQMW32nOMK/3MtCN5vy+YbkPQkqKz
	HIBmztbOZHNEMEKdiaPcKqH5IOY2HkSA++br8865eyut0o755aeW+EVrYvQSBmc/hv8q2fGD5/1
	UdyiT/KY4ZVXSr0hJLexCM9H8a
X-Google-Smtp-Source: AGHT+IF+rnMcicNbR48yOpulUbrNdTkYdf+ObbjrIr9iaYQ/1taKuu6ICTWxB4B00uV+sYRmcLDB+g==
X-Received: by 2002:a05:600c:444e:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-46e329f66f1mr159958645e9.21.1759227190642;
        Tue, 30 Sep 2025 03:13:10 -0700 (PDT)
Message-ID: <75cc454b-94d2-45e1-a766-71e6b2d62ac9@linaro.org>
Date: Tue, 30 Sep 2025 12:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] system/memory: Better describe @plen argument of
 flatview_translate()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Zhao Liu <zhao1.liu@intel.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Stefano Garzarella <sgarzare@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Jason Herne
 <jjherne@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20250930082126.28618-1-philmd@linaro.org>
 <20250930082126.28618-3-philmd@linaro.org>
 <525dd07f-ae64-4ba7-b3ec-b9fcd86aa8a5@redhat.com>
 <ededf937-5424-4cf7-8ea1-e07709db27f1@linaro.org>
 <9993b187-7b44-4f9b-801d-fdfa6b309362@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9993b187-7b44-4f9b-801d-fdfa6b309362@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/9/25 11:18, Thomas Huth wrote:
> On 30/09/2025 10.31, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 30/9/25 10:24, Thomas Huth wrote:
>>> On 30/09/2025 10.21, Philippe Mathieu-Daudé wrote:
>>>> flatview_translate()'s @plen argument is output-only and can be NULL.
>>>>
>>>> When Xen is enabled, only update @plen_out when non-NULL.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>   include/system/memory.h | 5 +++--
>>>>   system/physmem.c        | 9 +++++----
>>>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/include/system/memory.h b/include/system/memory.h
>>>> index aa85fc27a10..3e5bf3ef05e 100644
>>>> --- a/include/system/memory.h
>>>> +++ b/include/system/memory.h
>>>> @@ -2992,13 +2992,14 @@ IOMMUTLBEntry 
>>>> address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>>>>    * @addr: address within that address space
>>>>    * @xlat: pointer to address within the returned memory region 
>>>> section's
>>>>    * #MemoryRegion.
>>>> - * @len: pointer to length
>>>> + * @plen_out: pointer to valid read/write length of the translated 
>>>> address.
>>>> + *            It can be @NULL when we don't care about it.
>>>>    * @is_write: indicates the transfer direction
>>>>    * @attrs: memory attributes
>>>>    */
>>>>   MemoryRegion *flatview_translate(FlatView *fv,
>>>>                                    hwaddr addr, hwaddr *xlat,
>>>> -                                 hwaddr *len, bool is_write,
>>>> +                                 hwaddr *plen_out, bool is_write,
>>>>                                    MemTxAttrs attrs);
>>>>   static inline MemoryRegion *address_space_translate(AddressSpace *as,
>>>> diff --git a/system/physmem.c b/system/physmem.c
>>>> index 8a8be3a80e2..86422f294e2 100644
>>>> --- a/system/physmem.c
>>>> +++ b/system/physmem.c
>>>> @@ -566,7 +566,7 @@ iotlb_fail:
>>>>   /* Called from RCU critical section */
>>>>   MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr 
>>>> *xlat,
>>>> -                                 hwaddr *plen, bool is_write,
>>>> +                                 hwaddr *plen_out, bool is_write,
>>>>                                    MemTxAttrs attrs)
>>>>   {
>>>>       MemoryRegion *mr;
>>>> @@ -574,13 +574,14 @@ MemoryRegion *flatview_translate(FlatView *fv, 
>>>> hwaddr addr, hwaddr *xlat,
>>>>       AddressSpace *as = NULL;
>>>>       /* This can be MMIO, so setup MMIO bit. */
>>>> -    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
>>>> +    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
>>>>                                       is_write, true, &as, attrs);
>>>>       mr = section.mr;
>>>> -    if (xen_enabled() && memory_access_is_direct(mr, is_write, 
>>>> attrs)) {
>>>> +    if (xen_enabled() && plen_out && memory_access_is_direct(mr, 
>>>> is_write,
>>>> +                                                             attrs)) {
>>>>           hwaddr page = ((addr & TARGET_PAGE_MASK) + 
>>>> TARGET_PAGE_SIZE) - addr;
>>>> -        *plen = MIN(page, *plen);
>>>> +        *plen_out = MIN(page, *plen_out);
>>>>       }
>>>
>>> My question from the previous version is still unanswered:
>>>
>>> https://lore.kernel.org/qemu- 
>>> devel/22ff756a-51a2-43f4-8fe1-05f17ff4a371@redhat.com/
>>
>> This patches
>> - checks for plen not being NULL
>> - describes it as
>>    "When Xen is enabled, only update @plen_out when non-NULL."
>> - mention that in the updated flatview_translate() documentation
>>    "It can be @NULL when we don't care about it." as documented for
>>    the flatview_do_translate() callee in commit d5e5fafd11b ("exec:
>>    add page_mask for flatview_do_translate")
>>
>> before:
>>
>>    it was not clear whether we can pass plen=NULL without having
>>    to look at the code.
>>
>> after:
>>
>>    no change when plen is not NULL, we can pass plen=NULL safely
>>    (it is documented).
>>
>> I shouldn't be understanding your original question, do you mind
>> rewording it?
> 
> Ah, you've updated the patch in v3 to include a check for plen_out in 
> the if-statement! It was not there in v2. Ok, this should be fine now:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I just re-complained since you did not respond to my mail in v2, and 
> when I looked at the changelog in your v3 cover letter, you did not 
> mention the modification here, so I blindly assumed that this patch was 
> unchanged.

Ah I see... OK I'll try to be more explicit in my respins.

Thanks for your review!

Phil.

