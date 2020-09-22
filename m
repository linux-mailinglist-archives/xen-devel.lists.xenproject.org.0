Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6BC27485C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:40:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKnCg-000281-G8; Tue, 22 Sep 2020 18:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKnCf-00027u-5j
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:39:49 +0000
X-Inumbo-ID: 2c064c75-547c-422b-a888-8c919a81bbf4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c064c75-547c-422b-a888-8c919a81bbf4;
 Tue, 22 Sep 2020 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=AXl/+IYMD9MtGVFiYVEwxrW2+qdHJRqrvo91dSaX39I=; b=QaSm8L+fwveEcWbgxO69P1SAJr
 hhOF+H9BRBgRDU+cg2zO7S8bQr7QpJAcBAQt6wdWt5v9eANq+vH048no2YF9iXeuGHwMxxiu+EJ3R
 McuM/zhyw5rEUdk0X2pA3qts5KVt6vK5m4GIJ7rseL2sYlo4767k23M+C1UON/Dqj8WQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKnCV-0005mC-4u; Tue, 22 Sep 2020 18:39:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKnCU-0006XA-Rg; Tue, 22 Sep 2020 18:39:38 +0000
Subject: Re: [PATCH v4 4/4] xen/mm: Provide dummy M2P-related helpers when
 !CONFIG_HAVE_M2P
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.lengyel@intel.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-5-julien@xen.org>
 <26387b5d-97f7-3c6a-ad40-94b144a3b0ae@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e0a73d9b-5c68-9b57-dfe4-34e91b0972bd@xen.org>
Date: Tue, 22 Sep 2020 19:39:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <26387b5d-97f7-3c6a-ad40-94b144a3b0ae@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 22/09/2020 09:02, Jan Beulich wrote:
> On 21.09.2020 20:02, Julien Grall wrote:
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -685,4 +685,17 @@ static inline void put_page_alloc_ref(struct page_info *page)
>>       }
>>   }
>>   
>> +/*
>> + * Dummy implementation of M2P-related helpers for common code when
>> + * the architecture doesn't have an M2P.
>> + */
>> +#ifndef CONFIG_HAS_M2P
>> +
>> +#define INVALID_M2P_ENTRY        (~0UL)
>> +#define SHARED_M2P(_e)           false
>> +
>> +static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn) {}
> 
> While I think this would better BUG() or at least ASSERT_UNREACHABLE(),
> I realize its use in page_alloc.c prevents this. However, if this was a
> macro, I think the need for having INVALID_P2M_ENTRY would vanish, as
> long as the stub macro didn't evaluate its 2nd argument.
This is not very future proof... The cost of defining INVALID_M2P_ENTRY 
is very minimal compare to the damage that may result from this choice.

> I'm feeling somewhat uneasy with the SHARED_M2P() definition: This
> would seem to better be tied to CONFIG_MEM_SHARING rather than M2P
> existence.

I can see pros and cons in both solution. To me it contains the word 
"M2P" so it makes sense to be protected by HAS_M2P.

If someone else think that it should be protected by CONFIG_MEM_SHARING, 
then I will do the change.

I have added Tamas to give him an opportunity to share his view.

Cheers,

-- 
Julien Grall

