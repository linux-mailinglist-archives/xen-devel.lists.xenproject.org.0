Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C171395458
	for <lists+xen-devel@lfdr.de>; Mon, 31 May 2021 06:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134439.250118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnZEE-0002sB-9D; Mon, 31 May 2021 04:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134439.250118; Mon, 31 May 2021 04:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnZEE-0002qK-5v; Mon, 31 May 2021 04:08:38 +0000
Received: by outflank-mailman (input) for mailman id 134439;
 Mon, 31 May 2021 04:08:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHRc=K2=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnZED-0002qC-0a
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 04:08:37 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85774ad6-c798-40a0-8f16-738fcf3b111b;
 Mon, 31 May 2021 04:08:36 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id v14so7385840pgi.6
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 21:08:36 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 v4sm4275222pfn.41.2021.05.30.21.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 21:08:35 -0700 (PDT)
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
X-Inumbo-ID: 85774ad6-c798-40a0-8f16-738fcf3b111b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B5E+Z+YC3ztWK1Gz5JJ/ZjFYfV7x7WXsq6pvj4QOEV8=;
        b=qpIh0hZZdMUbO/xaXOluESyDyKh1wuXDzVMU8DbvilQdbzUAKKvtHMi2tZHdZZl6FD
         pzHWR1qJ9SA0OUooLhgYA/FHAGzMTwF85gH2zMJXOjHY8akNBlPm2ZAFPL/BsX6AECn0
         g+snaripSV02Ww2TMRpmrTPml1udHoN6L4hr2lbSznbW+9RR1UtQlYNf3WxE5hsOWUtQ
         ktECgJ1y4SLarJMnSz0M8Q7rpMoLOq1xtTjLcSnDW6jj68DsuSfsO/MEvpsp4a3+Pm5b
         T6ij0KxeYE/ElhOhht4tRwlDS7A1Bc2B1m97gM084MLnflqwYjE/MK2P0UCAVk17tm4z
         0i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B5E+Z+YC3ztWK1Gz5JJ/ZjFYfV7x7WXsq6pvj4QOEV8=;
        b=Z27qPc3OW7/POFyHrYdBF2wZtGJH9rA/9fcXrlff6NfCB20C2hxuZWyYrEYifrqfm+
         RGQWbjo1jyskLXfYF0LCsskfxnOAXJa5pRlTaz6U1fflvuvp8Ae6CnuCxz9JwzfZNTLi
         8iXu8c22I8+sikjHOhWHJ+U57XzJkDwiPsk6C6LF1ZFEy6aqiROYeZOCZPut+rwILEXr
         nfNUMx4JhVYJaJZtC+cfKlg2YK9v/xPkPlaGR5iqqVrvEJx/3lwovYvr6I+eXRTph4RO
         KbclmYJjx9vCw3HvQs1ihd/uQl+Dm0b0NY9wE75Et8fFCZRuo1M/DEKTgCqvKo8P1ilG
         It6g==
X-Gm-Message-State: AOAM5323Umc+bR0RwLhVnsPURV6woSuSEYwKqV2+nyG+4aeNevWcRIGc
	uO+V3WCB2s8UUtYAa8jcII4=
X-Google-Smtp-Source: ABdhPJx+HANXtJX9yvLkBX/HVsORb2hbS4daFpETnK5c9NyvtRnVmWON27YgYVQ2Kp8imni+2oGhjA==
X-Received: by 2002:a63:5a43:: with SMTP id k3mr21331103pgm.308.1622434115432;
        Sun, 30 May 2021 21:08:35 -0700 (PDT)
Subject: Re: [RFC PATCH V3 03/11] x86/Hyper-V: Add new hvcall guest address
 host visibility support
To: Borislav Petkov <bp@alien8.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 akpm@linux-foundation.org, kirill.shutemov@linux.intel.com, rppt@kernel.org,
 hannes@cmpxchg.org, cai@lca.pw, krish.sadhukhan@oracle.com,
 saravanand@fb.com, Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com,
 hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-4-ltykernel@gmail.com> <YLPYqxF7urDIAd9z@zn.tnic>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <3716c9e0-2508-3553-5a70-e4b3f5f4c82e@gmail.com>
Date: Mon, 31 May 2021 12:08:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLPYqxF7urDIAd9z@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Borislav:
	Thanks for your review.

On 5/31/2021 2:25 AM, Borislav Petkov wrote:
> On Sun, May 30, 2021 at 11:06:20AM -0400, Tianyu Lan wrote:
>> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
>> index 156cd235659f..a82975600107 100644
>> --- a/arch/x86/mm/pat/set_memory.c
>> +++ b/arch/x86/mm/pat/set_memory.c
>> @@ -29,6 +29,8 @@
>>   #include <asm/proto.h>
>>   #include <asm/memtype.h>
>>   #include <asm/set_memory.h>
>> +#include <asm/hyperv-tlfs.h>
>> +#include <asm/mshyperv.h>
>>   
>>   #include "../mm_internal.h"
>>   
>> @@ -1986,8 +1988,14 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
>>   	int ret;
>>   
>>   	/* Nothing to do if memory encryption is not active */
>> -	if (!mem_encrypt_active())
>> +	if (hv_is_isolation_supported()) {
>> +		return hv_set_mem_host_visibility((void *)addr,
>> +				numpages * HV_HYP_PAGE_SIZE,
>> +				enc ? VMBUS_PAGE_NOT_VISIBLE
>> +				: VMBUS_PAGE_VISIBLE_READ_WRITE);
> 
> Put all this gunk in a hv-specific function somewhere in hv-land which
> you only call from here. This way you probably won't even need to export
> hv_set_mem_host_visibility() and so on...
> 

Good idea. Will update. Thanks.



