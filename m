Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D8867A113
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 19:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483679.749985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKNvs-0004Nh-UN; Tue, 24 Jan 2023 18:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483679.749985; Tue, 24 Jan 2023 18:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKNvs-0004LC-RO; Tue, 24 Jan 2023 18:22:08 +0000
Received: by outflank-mailman (input) for mailman id 483679;
 Tue, 24 Jan 2023 18:22:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKNvr-0004L5-BU
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 18:22:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKNvq-0001Qa-Sa; Tue, 24 Jan 2023 18:22:06 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKNvq-0000DU-MX; Tue, 24 Jan 2023 18:22:06 +0000
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
	bh=vVB2uH+yR7egd+Uws0JxTVET7xDa/Cfg533Zfr/q1FY=; b=FxdcLXUsoOqUFmVx+xO7pF1Qm/
	2j5YQM1QmdUPJZ+4wDiHPjO2KdPVQOGAcNREvlmEKBQxJv426JxpkyRjcnVvNufME0vVmr0/5GvLN
	iiW/cK6B02/D/ZgSv6zP2F1WI0P2spqgaS8AXlRSFMsqkD09zKi0IctOmzYAtMt/4pPA=;
Message-ID: <25264dca-acf6-7ad1-e8a5-a1b893eab30d@xen.org>
Date: Tue, 24 Jan 2023 18:22:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-4-Henry.Wang@arm.com>
 <d9861060-22ba-5fce-eef6-a7f2ef01526a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d9861060-22ba-5fce-eef6-a7f2ef01526a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/01/2023 10:23, Michal Orzel wrote:
> Hi Henry,
> 
> On 16/01/2023 02:58, Henry Wang wrote:
>>
>>
>> With the change in previous patch, the initial 16 pages in the P2M
>> pool is not necessary anymore. Drop them for code simplification.
>>
>> Also the call to p2m_teardown() from arch_domain_destroy() is not
>> necessary anymore since the movement of the P2M allocation out of
>> arch_domain_create(). Drop the code and the above in-code comment
>> mentioning it.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> I am not entirely sure if I should also drop the "TODO" on top of
>> the p2m_set_entry(). Because although we are sure there is no
>> p2m pages populated in domain_create() stage now, but we are not
>> sure if anyone will add more in the future...Any comments?
>> ---
>>   xen/arch/arm/include/asm/p2m.h |  4 ----
>>   xen/arch/arm/p2m.c             | 20 +-------------------
>>   2 files changed, 1 insertion(+), 23 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>> index bf5183e53a..cf06d3cc21 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -200,10 +200,6 @@ int p2m_init(struct domain *d);
>>    *  - p2m_final_teardown() will be called when domain struct is been
>>    *    freed. This *cannot* be preempted and therefore one small
>>    *    resources should be freed here.
>> - *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
>> - *  free the P2M when failures happen in the domain creation with P2M pages
>> - *  already in use. In this case p2m_teardown() is called non-preemptively and
>> - *  p2m_teardown() will always return 0.
>>    */
>>   int p2m_teardown(struct domain *d, bool allow_preemption);
>>   void p2m_final_teardown(struct domain *d);
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 7de7d822e9..d41a316d18 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1744,13 +1744,9 @@ void p2m_final_teardown(struct domain *d)
>>       /*
>>        * No need to call relinquish_p2m_mapping() here because
>>        * p2m_final_teardown() is called either after domain_relinquish_resources()
>> -     * where relinquish_p2m_mapping() has been called, or from failure path of
>> -     * domain_create()/arch_domain_create() where mappings that require
>> -     * p2m_put_l3_page() should never be created. For the latter case, also see
>> -     * comment on top of the p2m_set_entry() for more info.
>> +     * where relinquish_p2m_mapping() has been called.
>>        */
>>
>> -    BUG_ON(p2m_teardown(d, false));
> Because you remove this,
>>       ASSERT(page_list_empty(&p2m->pages));
> you no longer need this assert, right?
I think the ASSERT() is still useful as it at least show that the pages 
should have been freed before the call to p2m_final_teardown().

Cheers,

-- 
Julien Grall

