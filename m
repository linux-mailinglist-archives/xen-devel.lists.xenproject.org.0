Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBB2E9751
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61275.107669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQve-0000K8-E5; Mon, 04 Jan 2021 14:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61275.107669; Mon, 04 Jan 2021 14:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQve-0000Jj-Ax; Mon, 04 Jan 2021 14:33:50 +0000
Received: by outflank-mailman (input) for mailman id 61275;
 Mon, 04 Jan 2021 14:33:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwQvc-0000JO-PO
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:33:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwQva-00033Y-Tf; Mon, 04 Jan 2021 14:33:46 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwQva-0007nz-N8; Mon, 04 Jan 2021 14:33:46 +0000
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
	bh=BesCYGbECSWzOCPtjf2/rRCO08kcjVAxgwox1cz2siY=; b=adTK3KX6lln8gwrKx3Zu2jS2Ob
	0zVoGo7iaSE48dvKvEUefbrjPtQh2jHdLxTX5kTH6grrY/Ypo2KLWK4+2L0gAVDhXqmTfg0d92bH+
	r402s3Rgcu21CRNcUyxu+eIkmXDC0GBCxaI8vfvJCYDer6/wMyCovz/XUg+9HgANBHjs=;
Subject: Re: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was
 initialized before tearing down
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk, 'Julien Grall' <jgrall@amazon.com>,
 'Jan Beulich' <jbeulich@suse.com>
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-2-julien@xen.org>
 <002301d6e27b$f9eaae90$edc00bb0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c0d64023-ab07-d368-cb32-ff5b1f391c61@xen.org>
Date: Mon, 4 Jan 2021 14:33:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <002301d6e27b$f9eaae90$edc00bb0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 04/01/2021 09:28, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 22 December 2020 15:44
>> To: xen-devel@lists.xenproject.org
>> Cc: hongyxia@amazon.co.uk; Julien Grall <jgrall@amazon.com>; Jan Beulich <jbeulich@suse.com>; Paul
>> Durrant <paul@xen.org>
>> Subject: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was initialized before tearing down
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> is_iommu_enabled() will return true even if the IOMMU has not been
>> initialized (e.g. the ops are not set).
>>
>> In the case of an early failure in arch_domain_init(), the function
>> iommu_destroy_domain() will be called even if the IOMMU is initialized.
>>
>> This will result to dereference the ops which will be NULL and an host
>> crash.
>>
>> Fix the issue by checking that ops has been set before accessing it.
>> Note that we are assuming that arch_iommu_domain_init() will cleanup an
>> intermediate failure if it failed.
>>
>> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/drivers/passthrough/iommu.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
>> index 2358b6eb09f4..f976d5a0b0a5 100644
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -226,7 +226,15 @@ static void iommu_teardown(struct domain *d)
>>
>>   void iommu_domain_destroy(struct domain *d)
>>   {
>> -    if ( !is_iommu_enabled(d) )
>> +    struct domain_iommu *hd = dom_iommu(d);
>> +
>> +    /*
>> +     * In case of failure during the domain construction, it would be
>> +     * possible to reach this function with the IOMMU enabled but not
>> +     * yet initialized. We assume that hd->platforms will be non-NULL as
>> +     * soon as we start to initialize the IOMMU.
>> +     */
>> +    if ( !is_iommu_enabled(d) || !hd->platform_ops )
>>           return;
> 
> TBH, this seems like the wrong way to fix it. The ops dereference is done in iommu_teardown() so that ought to be doing the check,
> but given it is single line function then it could be inlined at the same time. That said, I think arch_iommu_domain_destroy() needs
> to be call unconditionally as it arch_iommu_domain_init() is called before the ops pointer is set.

I originally resolved this way to avoid arch_iommu_domain_init() and 
iommu_teardown() to be called when the failure may happen before 
iommu_domain_init() is called. IOW, the lists/locks would be unitialized.

After discussing with Jan, it turns out that we could check whether the 
list was initialized or not. So I have reworked the code to now call 
arch_iommu_domain_init() unconditionally and move the ops check in 
iommu_teardown().

Cheers,

-- 
Julien Grall

