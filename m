Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FE55AD85D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 19:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399090.640135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFqG-0005TW-NZ; Mon, 05 Sep 2022 17:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399090.640135; Mon, 05 Sep 2022 17:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFqG-0005Qo-KM; Mon, 05 Sep 2022 17:25:00 +0000
Received: by outflank-mailman (input) for mailman id 399090;
 Mon, 05 Sep 2022 17:24:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVFqF-0005Qi-9M
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 17:24:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVFqE-00074q-Vo; Mon, 05 Sep 2022 17:24:58 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVFqE-0006uV-Oq; Mon, 05 Sep 2022 17:24:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=6g5RVZj9wl4AEMwIuyUZvblZsrSdcPEkv3pz/GHAHD8=; b=dFtOGVhmHoDGiIhU6UpTVbrQMk
	5La8nY6/4jOMl73c6n4w57lGU1KtwFqcOsy932BhE+SQ78s9lgvkRuezdsN4w0xo5XkX9GSH1Qa54
	ODmwzW6tAe6eqt6VX2ZCBEL9iW92op8eWgO7A2NIwgyTfGOTJQPXRLHqM6cenZ6QyelU=;
Message-ID: <8325d0ce-1fd3-d754-9eaf-d73b19f8d53e@xen.org>
Date: Mon, 5 Sep 2022 18:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/09/2022 13:04, Michal Orzel wrote:
> On 05/09/2022 09:26, Henry Wang wrote:
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 5815ccf8c5..d0cc556833 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -22,11 +22,16 @@ typedef enum {
>>       BOOTMOD_UNKNOWN
>>   }  bootmodule_kind;
>>
>> +typedef enum {
>> +    MEMBANK_MEMORY,
>> +    MEMBANK_XEN_DOMAIN, /* whether the memory bank is bound to a Xen domain. */
>> +    MEMBANK_RSVD_HEAP, /* whether the memory bank is reserved as heap. */
>> +} membank_type;
> Whereas the patch itself looks ok (it must be modified anyway given the comments for patch #2),
> MEMBANK_XEN_DOMAIN name is quite ambiguous to me, now when it is part of membank_type enum.
> Something like MEMBANK_STATIC or MEMBANK_STATICMEM would be much cleaner in my opinion
> as it would directly indicate what type of memory we are talking about.

I am not sure. Technically the reserved heap is static memory that has 
been allocated for the heap. In fact, I think thn name "staticmem" is 
now becoming quite confusing because we are referring to a very specific 
use case (i.e. memory that has been reserved for domain use).

So I would prefer if we keep "domain" in the name. Maybe 
MEMBANK_STATIC_DOMAIN or MEMBANK_RESERVED_DOMAIN.

Cheers,

-- 
Julien Grall

