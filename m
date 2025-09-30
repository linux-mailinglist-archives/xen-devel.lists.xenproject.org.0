Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C439BAC0F4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134024.1472078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vm2-0002Rd-G9; Tue, 30 Sep 2025 08:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134024.1472078; Tue, 30 Sep 2025 08:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vm2-0002PW-DW; Tue, 30 Sep 2025 08:31:50 +0000
Received: by outflank-mailman (input) for mailman id 1134024;
 Tue, 30 Sep 2025 08:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vm0-0002PQ-Em
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:31:48 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1087660-9dd7-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:31:36 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso35954915e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:31:36 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc749b8f9sm21268471f8f.50.2025.09.30.01.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 01:31:35 -0700 (PDT)
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
X-Inumbo-ID: e1087660-9dd7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759221096; x=1759825896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPblYzRdSvAbjbwbh03+CbSDEcFIuNHCFm6Gcm76lBw=;
        b=QKJt49tYg51cPQwlczJeIUMj0IhdqXMc8ysLHdfast/7ojucV7ZkTMCqr0OiriZ4z1
         SDWz1+Fpt3n+nnwMpjxmUktL61c2Yq90biClOtEQv6CiKc+pWAbUfEUyjuYrodRjR6Dg
         6IInt8qp8A4G9iAfYbOCzQz93w9eYe6Lp37dtKTvW669WkUXyxdXTZxEnaOwZecPzeyK
         lPMG0If2RRXf9id2RuGyKXVs2tWUyoWz0q/kV8HmzlFOiDiIShS8V/racjr41ni+W4pN
         UWQZxURvX0rwgS2VbUCOYR3kzufEEq1u3WNcQehcjCuZTUjtfPoQ1mtsgTuGi5/TP3rj
         IygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221096; x=1759825896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPblYzRdSvAbjbwbh03+CbSDEcFIuNHCFm6Gcm76lBw=;
        b=PuvAssfas3diFpWWF+/8LCUvSxfNUCQryLUR3TjcNPvCR3tgyJcuyKTkluXgzQv33H
         ueqIncoDLK1dUNy628VAo6XHawCbGcUAFoZsH7y0YDgK+corKClq4Q2gXOJBCytGeAA5
         vJkzKWpd/41wg20pkpU+cuxrWjK6uyxfcMSAROVe5Mea5K3GpVJdI0SS3orDl1reu6SS
         +F8jK6ukAfuCaXv4ggoI+NkO5P+b0vXQFdC9poGykyL/q8ljW1dwcS02AVxh+QEWFOdD
         UgCCBVF5ff37KkeaaGXEMhijGO1dJb78TgA2RWGfPtr7zgFacdULQS6CMOn6xduYGik5
         w83g==
X-Forwarded-Encrypted: i=1; AJvYcCWPu8ZbJfTKamDjTuZNLrHGrCThO32hbcpIGHBAe7Z/+Fhn1hacpPf59ddOXLslifhXGW87yMDwp38=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yywle6BrqmRMLL3Wm5JTwjGzWE1svFaNwhpdv5mKmotyoZrgs81
	jyQRvRba+XBORri6lDSMQIeDfuSl3xO9MY7xYMBsQjt2TWTd7FPvdN8kWhMlpvBGRdQ=
X-Gm-Gg: ASbGncsP0QA1FJJav2vuVT90Vu/N7CL0Pa4pr5OIF0Ni2STit/IgAze4MXVdUscO5KP
	sc2Og609upMbH07zcE6eQQRWd65xhkQ+06tCdTZQSE3WNyLXv2ko2uuXXgKNyfO7w0XYAlZKMF7
	gKKorpdVFbMV9Wws68BKDxczH6P/7HE4U3FGQKxQ2iu8BSnFjI5jOQzqedipIE0U8XcmykIFDN/
	cf+C2TRQRJ6JCYOlMQSFCRUdsGjITwkVgAUkVmJCHSKkWuQSOWFapVX7VgJYFs5mKa2U3IhIsYv
	6HCkQrVjLeR9rZWL4pvWgmNXh6ZwosXDTnucv3Zln5/WUVvRvWe0qSTu1fxlXRB34/acZEbenwa
	UTO7rxbDLAvKB7YSiN33o5XjKm8Q7OetOCymh9EF9E1cxiPrcrqOWkOztGsWfV0wgQex2OJE+vk
	OiitPcunfnJPsDyQ==
X-Google-Smtp-Source: AGHT+IF0LgtI7pDkBA/eYAeHLSMtAuwN7D6X/YI2HPPLpuFu6atvuEp5p5mznrjKdUvD2ZsGu34EiA==
X-Received: by 2002:a05:6000:2385:b0:405:8ef9:ee6e with SMTP id ffacd0b85a97d-40e4a8f9b38mr19131448f8f.25.1759221095990;
        Tue, 30 Sep 2025 01:31:35 -0700 (PDT)
Message-ID: <ededf937-5424-4cf7-8ea1-e07709db27f1@linaro.org>
Date: Tue, 30 Sep 2025 10:31:33 +0200
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <525dd07f-ae64-4ba7-b3ec-b9fcd86aa8a5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 30/9/25 10:24, Thomas Huth wrote:
> On 30/09/2025 10.21, Philippe Mathieu-Daudé wrote:
>> flatview_translate()'s @plen argument is output-only and can be NULL.
>>
>> When Xen is enabled, only update @plen_out when non-NULL.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/system/memory.h | 5 +++--
>>   system/physmem.c        | 9 +++++----
>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/system/memory.h b/include/system/memory.h
>> index aa85fc27a10..3e5bf3ef05e 100644
>> --- a/include/system/memory.h
>> +++ b/include/system/memory.h
>> @@ -2992,13 +2992,14 @@ IOMMUTLBEntry 
>> address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>>    * @addr: address within that address space
>>    * @xlat: pointer to address within the returned memory region 
>> section's
>>    * #MemoryRegion.
>> - * @len: pointer to length
>> + * @plen_out: pointer to valid read/write length of the translated 
>> address.
>> + *            It can be @NULL when we don't care about it.
>>    * @is_write: indicates the transfer direction
>>    * @attrs: memory attributes
>>    */
>>   MemoryRegion *flatview_translate(FlatView *fv,
>>                                    hwaddr addr, hwaddr *xlat,
>> -                                 hwaddr *len, bool is_write,
>> +                                 hwaddr *plen_out, bool is_write,
>>                                    MemTxAttrs attrs);
>>   static inline MemoryRegion *address_space_translate(AddressSpace *as,
>> diff --git a/system/physmem.c b/system/physmem.c
>> index 8a8be3a80e2..86422f294e2 100644
>> --- a/system/physmem.c
>> +++ b/system/physmem.c
>> @@ -566,7 +566,7 @@ iotlb_fail:
>>   /* Called from RCU critical section */
>>   MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr 
>> *xlat,
>> -                                 hwaddr *plen, bool is_write,
>> +                                 hwaddr *plen_out, bool is_write,
>>                                    MemTxAttrs attrs)
>>   {
>>       MemoryRegion *mr;
>> @@ -574,13 +574,14 @@ MemoryRegion *flatview_translate(FlatView *fv, 
>> hwaddr addr, hwaddr *xlat,
>>       AddressSpace *as = NULL;
>>       /* This can be MMIO, so setup MMIO bit. */
>> -    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
>> +    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
>>                                       is_write, true, &as, attrs);
>>       mr = section.mr;
>> -    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
>> +    if (xen_enabled() && plen_out && memory_access_is_direct(mr, 
>> is_write,
>> +                                                             attrs)) {
>>           hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) 
>> - addr;
>> -        *plen = MIN(page, *plen);
>> +        *plen_out = MIN(page, *plen_out);
>>       }
> 
> My question from the previous version is still unanswered:
> 
> https://lore.kernel.org/qemu- 
> devel/22ff756a-51a2-43f4-8fe1-05f17ff4a371@redhat.com/

This patches
- checks for plen not being NULL
- describes it as
   "When Xen is enabled, only update @plen_out when non-NULL."
- mention that in the updated flatview_translate() documentation
   "It can be @NULL when we don't care about it." as documented for
   the flatview_do_translate() callee in commit d5e5fafd11b ("exec:
   add page_mask for flatview_do_translate")

before:

   it was not clear whether we can pass plen=NULL without having
   to look at the code.

after:

   no change when plen is not NULL, we can pass plen=NULL safely
   (it is documented).

I shouldn't be understanding your original question, do you mind
rewording it?

Thanks,

Phil.

