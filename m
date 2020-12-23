Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4E2E1CE9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 15:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58384.102600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4fU-0000E7-C0; Wed, 23 Dec 2020 13:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58384.102600; Wed, 23 Dec 2020 13:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4fU-0000Di-8F; Wed, 23 Dec 2020 13:59:08 +0000
Received: by outflank-mailman (input) for mailman id 58384;
 Wed, 23 Dec 2020 13:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks4fS-0000Dd-EG
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 13:59:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03637795-3d54-4c34-a369-52e2333f27cc;
 Wed, 23 Dec 2020 13:59:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11AD0ACBA;
 Wed, 23 Dec 2020 13:59:04 +0000 (UTC)
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
X-Inumbo-ID: 03637795-3d54-4c34-a369-52e2333f27cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608731944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHL45RndAjKydUITui6TRqulsX1ckfeLI7Rxk2EKUVI=;
	b=cLEYiNQukOdxxI9JTNmF16+1A7tCYjjeG9DhV/IzYRsfI6gbiGveRNFC2CDdU69U+9tAzP
	shMyzV3mgbjkkq7qSp0c8prR6ZsYmWdM9bKdYwj6NKbcSvcdSoaVsjO6QF2nUH+KZ7gRnn
	GkXheHQl1wr54AA3QWrdFEIbNgbfdcc=
Subject: Re: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was
 initialized before tearing down
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-2-julien@xen.org>
 <d9dd2fbc-d4bb-6b12-73e7-52a4fdda9020@suse.com>
 <eaba5e4c-91c9-9341-cc8f-d58aa08358a2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6339b4ab-9be3-0b70-a474-14213e8609c0@suse.com>
Date: Wed, 23 Dec 2020 14:59:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eaba5e4c-91c9-9341-cc8f-d58aa08358a2@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 14:50, Julien Grall wrote:
> On 23/12/2020 13:27, Jan Beulich wrote:
>> On 22.12.2020 16:43, Julien Grall wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -226,7 +226,15 @@ static void iommu_teardown(struct domain *d)
>>>   
>>>   void iommu_domain_destroy(struct domain *d)
>>>   {
>>> -    if ( !is_iommu_enabled(d) )
>>> +    struct domain_iommu *hd = dom_iommu(d);
>>> +
>>> +    /*
>>> +     * In case of failure during the domain construction, it would be
>>> +     * possible to reach this function with the IOMMU enabled but not
>>> +     * yet initialized. We assume that hd->platforms will be non-NULL as
>>> +     * soon as we start to initialize the IOMMU.
>>> +     */
>>> +    if ( !is_iommu_enabled(d) || !hd->platform_ops )
>>>           return;
>>
>>  From your description I'd rather say is_iommu_enabled() is the
>> wrong predicate to use here. IOW I'd rather see it be replaced.
> 
> !hd->platform_ops should be sufficient. So, I think we can drop 
> !is_iommu_enabled(d). Would that be fine with you?

Well, that's what I was trying to suggest.

>> A couple of additional nits: "hd" isn't really necessary to
>> have as a local variable, but if you insist on introducing it
>> despite being used just once, it should be pointer-to-const.
>> Plus the comment would better spell correctly the field it
>> talks about. But I consider this comment excessive anyway, as
>> the check of ->platform_ops is quite clear by itself.
> 
> Well, I added the comment because I think check hd->platform_ops may not 
> be that obvious (see more below).
> 
>> And finally "we assume" is in at least latent conflict with
>> ->platform_ops getting set only after arch_iommu_domain_init()
>> was called. Right now neither x86'es nor Arm's do anything
>> that would need undoing, but I'd still suggest to replace
>> "assume" here (if you want to keep the comment in the first
>> place) and move the assignment up a few lines (right after the
>> is_iommu_enabled() check there).
> My initial implementation of this patch moved the initialization of 
> hd->platform_ops before arch_iommu_domain_init().
> 
> However, this is going to lead to some issues with Paul's series which 
> add an IOMMU page-table pool ([1]).
> 
> The function arch_iommu_domain_init() may now fail. If we initialize 
> hd->platform_ops earlier on, then the ->teardown() will be called before 
> ->init().
> 
> This may be an issue if ->teardown() expects some list pointer to be 
> initialized by ->init(). I am not aware of any today, but this seems 
> quite risky to me.

In such a case the obvious thing is to make the teardown handler
check whether its init counterpart has run before. This will then
fit our apparently much wider goal of making cleanup functions
idempotent.

Jan

> So I think it is better if we initialize hd->platform_ops after 
> arch_iommu_domain_init() and expect the function to clean-up nything 
> that was allocated before the error.
> 
> The alternative is we set hd->platform_ops if both 
> arch_iommu_domain_init() and ->init() have succeeded. This means they 
> will both have to clean-up in case of an error.
> 
> Any thoughts?
> 
> Cheers,
> 
> [1] <20201005094905.2929-6-paul@xen.org>
> 


