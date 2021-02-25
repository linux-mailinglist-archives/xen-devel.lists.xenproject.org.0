Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D106325046
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89764.169363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGZW-0001io-EI; Thu, 25 Feb 2021 13:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89764.169363; Thu, 25 Feb 2021 13:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGZW-0001iI-AX; Thu, 25 Feb 2021 13:20:50 +0000
Received: by outflank-mailman (input) for mailman id 89764;
 Thu, 25 Feb 2021 13:20:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGZU-0001hQ-C1
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:20:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47cf0385-c67d-4ffb-9f18-3ea188a90d17;
 Thu, 25 Feb 2021 13:20:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53766AFB5;
 Thu, 25 Feb 2021 13:20:46 +0000 (UTC)
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
X-Inumbo-ID: 47cf0385-c67d-4ffb-9f18-3ea188a90d17
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614259246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlQJeW38LJ3RN4gJA/jlMu+eQ6c9R5XnU5CKjyoFUQk=;
	b=baf3xJywOmsyGfDtFJfCQY1yybuxufnhULqK4rQzruryU9BiFUJixnB7lG0+fISJ7lZod9
	bMVz5KScIWREGmgoZKPYys/CPpS0DVF6qoRVKIysMkZP9ojb4RC4CDYpstKFCiTZiIPMWT
	/bMYrXr2irf6EkkfS4Z8Z5IswWljPHE=
Subject: Re: [for-4.15][RESEND PATCH v4 2/2] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-3-julien@xen.org>
 <c666bf75-451d-fbc1-7fb1-600c4f014f05@suse.com>
 <64de5c8f-83ed-23af-b24f-3c8dde50e226@suse.com>
 <95800b2b-1412-ee65-33b9-d3e2702b1c88@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0eca9cf-4b8d-3e8a-faad-b2e447345bc1@suse.com>
Date: Thu, 25 Feb 2021 14:20:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <95800b2b-1412-ee65-33b9-d3e2702b1c88@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 13:01, Julien Grall wrote:
> On 24/02/2021 16:00, Jan Beulich wrote:
>> On 24.02.2021 16:58, Jan Beulich wrote:
>>> On 24.02.2021 10:43, Julien Grall wrote:
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
>>>>   
>>>>   void arch_iommu_domain_destroy(struct domain *d)
>>>>   {
>>>> +    /*
>>>> +     * There should be not page-tables left allocated by the time the
>>>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>>>> +     * called unconditionally, so pgtables may be unitialized.
>>>> +     */
>>>> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
>>>
>>> Since you've used the preferred ! instead of "== 0" /
>>> "== NULL" in the ASSERT()s you add further up, may I ask that
>>> you do so here as well?
>>
>> Oh, and I meant to provide
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> preferably with that cosmetic adjustment (and ideally also with
>> "uninitialized" in the comment, as I notice only now).
> 
> I don't seem to find your original answer in my inbox and on lore [1]. 
> Could you confirm if the two comments visible in this thread are the 
> only one you made on this patch?

Oh, yes - what I look to have done is to reply to a draft that was
never sent. There indeed was just what's visible above - thanks for
double checking.

Jan

