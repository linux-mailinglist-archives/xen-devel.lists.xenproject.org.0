Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD70324F9B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 13:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89690.169149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFL6-0000OH-Uu; Thu, 25 Feb 2021 12:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89690.169149; Thu, 25 Feb 2021 12:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFL6-0000Ns-Rf; Thu, 25 Feb 2021 12:01:52 +0000
Received: by outflank-mailman (input) for mailman id 89690;
 Thu, 25 Feb 2021 12:01:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFFL5-0000Nn-Qa
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 12:01:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFFL3-0007vn-Uo; Thu, 25 Feb 2021 12:01:49 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFFL3-0006Ma-Gf; Thu, 25 Feb 2021 12:01:49 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Mqi/1JbhpxxRrGMz3QOl6MCMfKt2wbruj2tscyWMBPk=; b=MsSvr32ifGC4bhRU9N1/8RpTSO
	VawjC1qIV6bCdPQrDVquSXvVdeqyfy1PL6BdNT3nNHMt6S0vGKeyued454cJVpbDpdk59QGMDNxpj
	LaS32qT4+E/SQGSD/jfTGbHAwaeLZyvLf3nwv0LkQ40vbLHNTEz1HoglCBORRen2FDkM=;
Subject: Re: [for-4.15][RESEND PATCH v4 2/2] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-3-julien@xen.org>
 <c666bf75-451d-fbc1-7fb1-600c4f014f05@suse.com>
 <64de5c8f-83ed-23af-b24f-3c8dde50e226@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <95800b2b-1412-ee65-33b9-d3e2702b1c88@xen.org>
Date: Thu, 25 Feb 2021 12:01:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <64de5c8f-83ed-23af-b24f-3c8dde50e226@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/02/2021 16:00, Jan Beulich wrote:
> On 24.02.2021 16:58, Jan Beulich wrote:
>> On 24.02.2021 10:43, Julien Grall wrote:
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
>>>   
>>>   void arch_iommu_domain_destroy(struct domain *d)
>>>   {
>>> +    /*
>>> +     * There should be not page-tables left allocated by the time the
>>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>>> +     * called unconditionally, so pgtables may be unitialized.
>>> +     */
>>> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
>>
>> Since you've used the preferred ! instead of "== 0" /
>> "== NULL" in the ASSERT()s you add further up, may I ask that
>> you do so here as well?
> 
> Oh, and I meant to provide
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> preferably with that cosmetic adjustment (and ideally also with
> "uninitialized" in the comment, as I notice only now).

I don't seem to find your original answer in my inbox and on lore [1]. 
Could you confirm if the two comments visible in this thread are the 
only one you made on this patch?

Thanks for the review!

Cheers,

[1] https://lore.kernel.org/xen-devel/20210224094356.7606-3-julien@xen.org/

> 
> Jan
> 

-- 
Julien Grall

