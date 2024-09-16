Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06180979BB9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799204.1209086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5i8-0001Cb-NY; Mon, 16 Sep 2024 06:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799204.1209086; Mon, 16 Sep 2024 06:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5i8-0001Ax-Jr; Mon, 16 Sep 2024 06:59:48 +0000
Received: by outflank-mailman (input) for mailman id 799204;
 Mon, 16 Sep 2024 06:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5i7-0001Am-5y
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:59:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41e9d407-73f9-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 08:59:46 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so715382466b.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:59:46 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4375sm272050366b.73.2024.09.15.23.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:59:45 -0700 (PDT)
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
X-Inumbo-ID: 41e9d407-73f9-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726469986; x=1727074786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hoxc2xLo27czaSJSdH1lZge3rHpm9JVblpGZxZKH8tM=;
        b=Q92MbFvx+EjVQoRmT3ruHFbEh/Ba1qKjpRREzp5eFrTSEBWE7PIdBveMFScVsrdmoR
         caAFFcj1qBMD/YO5sDy3KDfYebqLxON73Nr49UbX07DgnGJgM+06JMTaCsBHWS41W155
         rUo+OlbiDOE3cV/M8uZr8gqqEMecOWIokoJq/1srDWiVTBGAYNpgG1YoJqehDlxwXC5p
         W4c2gJ+YbtfHJOZyA8GVMUHHO3z/cQzVoeyUq71bllSelZo87VViEkp/QE+22eyJOE3l
         +2vUrcUKE6Dcw7Q3T1VJigPanIeBEEav5xG791ZcNntFsqDbN5xPK4MoEX66Ijv08diz
         lh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726469986; x=1727074786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hoxc2xLo27czaSJSdH1lZge3rHpm9JVblpGZxZKH8tM=;
        b=R/AUEsqc0D6bQUaitS3OyJf3IZElWF+bA65aKmOYwJwCeY0945kLi98rvodhq2frF5
         jDMMW8Z1J97rdZRBDYkqBRl+y3CtPA0A7/ucnkUpITBK9l2aNYyoiKIKz4w/na24SM6i
         IXepD9y5bXD1tR1cbYqQmuu3PaJ+E9t68M/Ah4Y9YpIGixySI96zYTUOXk5hl0YUW4L1
         Jt1HcHJvAe3WHMLYcXQGqO3pPorTDaa4olLMjPS7EebULsFFUpk7rE2NJNtyB0cG+WGq
         LS0fxzbbbKZC96FqTK4X84bOptRzWphV2lMdH7cyDCk/MJb3QpKrj2KD4riYXXcwM6Ol
         bSOw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJtD0sP1lqm7OshDBeJbnX9NF0o7wIsd3LIIbQPwfxSICarCQtfH8Y+Jh6IckJc5f8K4Cwx7Fe2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxF3VmgXXatJh3wC+bG0jFISNsFIVe4yQCLdChY4PdI0d62tMa9
	SUfhfvf2gh8gclMzBZ5QhcI5cLQ2b7POJ6tRzYwjUMUlwdelq0L16POR7tJPEGuSjCVH8om4OpU
	=
X-Google-Smtp-Source: AGHT+IGEE+x4myqxVpsG+4wlTw+uLRt/VgS3sL49Fo+T3MUgbxgZNUqjr+4TTGSrsMaNaZ7JrXeu3w==
X-Received: by 2002:a17:907:d3cf:b0:a86:8285:24a0 with SMTP id a640c23a62f3a-a9029434c42mr1485582266b.23.1726469985553;
        Sun, 15 Sep 2024 23:59:45 -0700 (PDT)
Message-ID: <c97450a0-6ddd-49c5-a8e4-0cd2cf9d1635@suse.com>
Date: Mon, 16 Sep 2024 08:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma buffers
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-2-jgross@suse.com>
 <d23c9af4-4a79-4300-891a-fba3ea9cbb1c@suse.com>
 <c2dd89b4-46c7-4a0a-a47b-70862294176b@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c2dd89b4-46c7-4a0a-a47b-70862294176b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 08:56, Juergen Gross wrote:
> On 16.09.24 08:50, Jan Beulich wrote:
>> On 16.09.2024 08:47, Juergen Gross wrote:
>>> --- a/drivers/xen/swiotlb-xen.c
>>> +++ b/drivers/xen/swiotlb-xen.c
>>> @@ -78,9 +78,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>>>   {
>>>   	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>>>   	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
>>> +	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
>>>   
>>>   	next_bfn = pfn_to_bfn(xen_pfn);
>>>   
>>> +	/* If buffer is physically aligned, ensure DMA alignment. */
>>> +	if (IS_ALIGNED(p, algn) &&
>>> +	    !IS_ALIGNED(next_bfn << XEN_PAGE_SHIFT, algn))
>>
>> And this shift is not at risk of losing bits on Arm LPAE?
> 
> For alignment check this just doesn't matter (assuming XEN_PAGE_SIZE is
> smaller than 4G).

Oh, yes - of course. A (hypothetical?) strict no-overflow checking
mode of the kernel may take issue though, so maybe better to right-
shift "algn"?

Jan

