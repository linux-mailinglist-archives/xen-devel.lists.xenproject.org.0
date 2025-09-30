Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD5BAC3DC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 11:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134144.1472148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WVO-00053Z-AT; Tue, 30 Sep 2025 09:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134144.1472148; Tue, 30 Sep 2025 09:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WVO-00051A-6l; Tue, 30 Sep 2025 09:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1134144;
 Tue, 30 Sep 2025 09:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3WVN-00050o-Fd
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 09:18:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 726c5a50-9dde-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 11:18:38 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-eGh-4caqPFyvt59zP3-dFQ-1; Tue, 30 Sep 2025 05:18:35 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e36f9c651so45041005e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 02:18:35 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab6a514sm260322475e9.22.2025.09.30.02.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 02:18:33 -0700 (PDT)
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
X-Inumbo-ID: 726c5a50-9dde-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759223917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d3jiynPnEzxxv2oRAoAk1Ku5mtXrOi1sVDTTsgV+r60=;
	b=a+dyQP0nYTMjk/34CFtYyx990HGPl3Af7YYZrHacBxLB+NrpatnBtbl6vsXw8qndG7sQtx
	QZzIC4ak1s4aSapyyx0+lPffTT7ryKiSchkgdW6ulyG0o+UiUXo/itjgdKas7hCgiU8LWq
	85bK5uucRALykBOJj14ZumsRSuHnRXs=
X-MC-Unique: eGh-4caqPFyvt59zP3-dFQ-1
X-Mimecast-MFC-AGG-ID: eGh-4caqPFyvt59zP3-dFQ_1759223914
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223914; x=1759828714;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3jiynPnEzxxv2oRAoAk1Ku5mtXrOi1sVDTTsgV+r60=;
        b=RSmM/uu6VgFMJD1y7EwzT6DFGMlfpjsNNJqO/XD6FsmnDqQLTm1hVITWCaqy5ztn2M
         99ZlGekyps3LCcvL+blSaUMA7JIUFAVuKRMq304xJrZGwDJYffUzcMvFZiMOxjGsy8hG
         FgnyrqkYTIXL9UqezpMcAi3XBcCajb13Ew8ona5CODU0QJI3thOs9M984zwmcEXQTKSa
         2eq/DbN3uy1mhnSkwODJ3OusOacv8Ov1cKlb0KVEly0N5D8Gt5kiy+OgindPGqA41xot
         icmn/1bzaCcENmGbLlufUiMz0ZkqZesWUEb5TCeeZsC9t5d2mMEZ2+N2CtLNirIRqg+d
         PhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkUWWIAUOLZTJJUCS5FpX0FAbz09phT7nMSeGeZR2D7w0xzvtTfYIN+YxnT6N0voPbdq1gtxJqLN4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmaZ7ch1msJvc6mi3gL7ULTP+8aBC1hxHW2INB8KQ+jzHW5wjt
	ZXF3dX4pji8WOC3JtuiLnUftuooEG93b7CZWx1CyPkEtvqDKmDGjS47ifZLvLMeTjOxcHCwWTFt
	UjR2LHcsTuH/byFVVFAYuwvPs21Iack0ELvA8NhqDX3xvuFyseBJlStIwvj+hYiZQfnHe
X-Gm-Gg: ASbGncsvOGL7BqRSO6ym7mwuINpKYvFmI2ZuF9fJjBrJC0zSgXjmWDkpRFHZ/Fy7C5M
	QSppFKdgQB8IK1o2apDMGfPcwdmMtJBsftnUoaP74OtmjVLlY0c6CZmGn//oJUV3tQJuecEvH9U
	/7NUYmX/jlcSWtYMewpO4WIxjsQntUNVH5VE/6MtYkCotITpvA0zENS+vXkIvjnAFVwDOfVLsBf
	3E3gFIEdHOv30EaegL2fmrA8wVYuUCtvzXjsdg02Wre5nq1Nll+uryA6efOiqaFI7fw5U7M1vbg
	+UieQO9u76Ko3OSEwRUag4U8oaVZz8Ybsykq1678yLp4Bzq5kd2IFcdWdFwthz3jBHTsPiTrW6S
	AO3ys5U6AtQ==
X-Received: by 2002:a05:600c:4e52:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-46e51fa6a03mr62469345e9.30.1759223913932;
        Tue, 30 Sep 2025 02:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHA7zZRePx4N9OF9Phbhrr1b0KhGDD1FpkIOIr+WZAiVdK6e9WSFSf5gyO0we3QGfFVloHyA==
X-Received: by 2002:a05:600c:4e52:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-46e51fa6a03mr62468955e9.30.1759223913515;
        Tue, 30 Sep 2025 02:18:33 -0700 (PDT)
Message-ID: <9993b187-7b44-4f9b-801d-fdfa6b309362@redhat.com>
Date: Tue, 30 Sep 2025 11:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] system/memory: Better describe @plen argument of
 flatview_translate()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Xu <peterx@redhat.com>
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ededf937-5424-4cf7-8ea1-e07709db27f1@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vzGkMg7xoheZQoPNFNuEVq2eNJ3mHW3xrR1KYgYQulo_1759223914
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 10.31, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 30/9/25 10:24, Thomas Huth wrote:
>> On 30/09/2025 10.21, Philippe Mathieu-Daudé wrote:
>>> flatview_translate()'s @plen argument is output-only and can be NULL.
>>>
>>> When Xen is enabled, only update @plen_out when non-NULL.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/system/memory.h | 5 +++--
>>>   system/physmem.c        | 9 +++++----
>>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/include/system/memory.h b/include/system/memory.h
>>> index aa85fc27a10..3e5bf3ef05e 100644
>>> --- a/include/system/memory.h
>>> +++ b/include/system/memory.h
>>> @@ -2992,13 +2992,14 @@ IOMMUTLBEntry 
>>> address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>>>    * @addr: address within that address space
>>>    * @xlat: pointer to address within the returned memory region section's
>>>    * #MemoryRegion.
>>> - * @len: pointer to length
>>> + * @plen_out: pointer to valid read/write length of the translated address.
>>> + *            It can be @NULL when we don't care about it.
>>>    * @is_write: indicates the transfer direction
>>>    * @attrs: memory attributes
>>>    */
>>>   MemoryRegion *flatview_translate(FlatView *fv,
>>>                                    hwaddr addr, hwaddr *xlat,
>>> -                                 hwaddr *len, bool is_write,
>>> +                                 hwaddr *plen_out, bool is_write,
>>>                                    MemTxAttrs attrs);
>>>   static inline MemoryRegion *address_space_translate(AddressSpace *as,
>>> diff --git a/system/physmem.c b/system/physmem.c
>>> index 8a8be3a80e2..86422f294e2 100644
>>> --- a/system/physmem.c
>>> +++ b/system/physmem.c
>>> @@ -566,7 +566,7 @@ iotlb_fail:
>>>   /* Called from RCU critical section */
>>>   MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
>>> -                                 hwaddr *plen, bool is_write,
>>> +                                 hwaddr *plen_out, bool is_write,
>>>                                    MemTxAttrs attrs)
>>>   {
>>>       MemoryRegion *mr;
>>> @@ -574,13 +574,14 @@ MemoryRegion *flatview_translate(FlatView *fv, 
>>> hwaddr addr, hwaddr *xlat,
>>>       AddressSpace *as = NULL;
>>>       /* This can be MMIO, so setup MMIO bit. */
>>> -    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
>>> +    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
>>>                                       is_write, true, &as, attrs);
>>>       mr = section.mr;
>>> -    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
>>> +    if (xen_enabled() && plen_out && memory_access_is_direct(mr, is_write,
>>> +                                                             attrs)) {
>>>           hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - 
>>> addr;
>>> -        *plen = MIN(page, *plen);
>>> +        *plen_out = MIN(page, *plen_out);
>>>       }
>>
>> My question from the previous version is still unanswered:
>>
>> https://lore.kernel.org/qemu- 
>> devel/22ff756a-51a2-43f4-8fe1-05f17ff4a371@redhat.com/
> 
> This patches
> - checks for plen not being NULL
> - describes it as
>    "When Xen is enabled, only update @plen_out when non-NULL."
> - mention that in the updated flatview_translate() documentation
>    "It can be @NULL when we don't care about it." as documented for
>    the flatview_do_translate() callee in commit d5e5fafd11b ("exec:
>    add page_mask for flatview_do_translate")
> 
> before:
> 
>    it was not clear whether we can pass plen=NULL without having
>    to look at the code.
> 
> after:
> 
>    no change when plen is not NULL, we can pass plen=NULL safely
>    (it is documented).
> 
> I shouldn't be understanding your original question, do you mind
> rewording it?

Ah, you've updated the patch in v3 to include a check for plen_out in the 
if-statement! It was not there in v2. Ok, this should be fine now:

Reviewed-by: Thomas Huth <thuth@redhat.com>

I just re-complained since you did not respond to my mail in v2, and when I 
looked at the changelog in your v3 cover letter, you did not mention the 
modification here, so I blindly assumed that this patch was unchanged.

  Thomas


