Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1EC542BBC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 11:43:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343752.569248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nysCg-0002fY-LM; Wed, 08 Jun 2022 09:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343752.569248; Wed, 08 Jun 2022 09:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nysCg-0002ce-Ib; Wed, 08 Jun 2022 09:42:18 +0000
Received: by outflank-mailman (input) for mailman id 343752;
 Wed, 08 Jun 2022 09:42:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nysCe-0002cY-8W
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 09:42:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nysCd-0001ad-SD; Wed, 08 Jun 2022 09:42:15 +0000
Received: from [54.239.6.189] (helo=[192.168.10.106])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nysCd-0007Sv-Kg; Wed, 08 Jun 2022 09:42:15 +0000
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
	bh=CSO9GolwBr1UYgcGNdZNafgXrjTnSwewvwOS535JqD0=; b=oMGtuUmooWoWAXuPe3guBYe0E1
	fLad/RENSNnk2gI8ULNkFeoSrofSMfqHNRsWyBijTHt5yIYhvEMnK81BLSVj9YUZsk8vZOafPgtCE
	iclH1FwBniqoranAk+euy0IABhKO80ufbDWwBv8cg5npFiy6F0bwHeknTQUoNTcFLzHE=;
Message-ID: <f9b78205-bbc1-9675-f7fe-79cd40ce2baa@xen.org>
Date: Wed, 8 Jun 2022 10:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220507025434.1063710-1-Henry.Wang@arm.com>
 <20220507025434.1063710-3-Henry.Wang@arm.com>
 <5c0e81f1-fac4-f14f-f4a1-2a00f6d16f47@xen.org>
 <AS8PR08MB7991500E0D0127986F4D957B92D79@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991500E0D0127986F4D957B92D79@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 24/05/2022 02:53, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 2/2] xen/common: Use enhanced
>> ASSERT_ALLOC_CONTEXT in xmalloc()
>>
>> Hi,
>>
>> On 07/05/2022 03:54, Henry Wang wrote:
>>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>>> index e866e0d864..ea59cd1a4a 100644
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -162,13 +162,6 @@
>>>    static char __initdata opt_badpage[100] = "";
>>>    string_param("badpage", opt_badpage);
>>>
>>> -/*
>>> - * Heap allocations may need TLB flushes which may require IRQs to be
>>> - * enabled (except when only 1 PCPU is online).
>>> - */
>>> -#define ASSERT_ALLOC_CONTEXT() \
>>> -    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <=
>> 1))
>>> -
>> FYI, the patch introducing ASSERT_ALLOC_CONTEXT() has been reverted. I
>> intend to re-introduce it once your previous patch and the one fixing
>> the ITS (not yet formally sent) have been committed.
> 
> Thanks for the information! IIUC the patch:
> "xen/arm: gic-v3-lpi: Allocate the pending table while preparing the CPU"
> is merged. So I guess both "page_alloc: assert IRQs are enabled in heap alloc/free"
> and this patch can be re-introduced if everyone is happy with the patch?

I have re-committed David's patch and committed yours.

Cheers,

-- 
Julien Grall

