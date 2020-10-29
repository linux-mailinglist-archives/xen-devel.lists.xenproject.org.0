Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF929F2C7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14402.35574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBX4-0002Oo-Bl; Thu, 29 Oct 2020 17:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14402.35574; Thu, 29 Oct 2020 17:16:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBX4-0002OS-83; Thu, 29 Oct 2020 17:16:14 +0000
Received: by outflank-mailman (input) for mailman id 14402;
 Thu, 29 Oct 2020 17:16:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYBX2-0002ON-T7
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:16:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e2c4d17-6125-47ba-baac-8ed461a1ffc8;
 Thu, 29 Oct 2020 17:16:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A88E9B30C;
 Thu, 29 Oct 2020 17:16:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYBX2-0002ON-T7
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:16:12 +0000
X-Inumbo-ID: 4e2c4d17-6125-47ba-baac-8ed461a1ffc8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e2c4d17-6125-47ba-baac-8ed461a1ffc8;
	Thu, 29 Oct 2020 17:16:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603991771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w/2obeIH7InPTqeYrlu7qYHCRBddaFdx0xM/gn1DiPc=;
	b=lOYof78SXUxDwFhrBwoNZJg1jsBI0yeTNR8+IicUoIH5LeE6bq7zEuDtOOwuRz2+iMpfkb
	bEmuPsgOPHJ8Gzf7BIPv94hrxHGyOswmFccAm2xG/U3GgmLQNkeUrJR1Q6TaMhc2EAm1cY
	0JDmTwwlJAxDXLBgwMhZ/yWVXf3hNtE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A88E9B30C;
	Thu, 29 Oct 2020 17:16:10 +0000 (UTC)
Subject: Re: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
 <b345b0d4-8045-1d5d-b3c9-498311cfb1ac@suse.com>
 <14328157-D9C5-428E-BD1C-F4A841359185@arm.com>
 <77495A6D-D1D8-4E62-B481-6AE59593CFAD@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6b24649-3621-6403-6fd7-de5814922197@suse.com>
Date: Thu, 29 Oct 2020 18:16:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <77495A6D-D1D8-4E62-B481-6AE59593CFAD@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.10.2020 17:58, Rahul Singh wrote:
>> On 28 Oct 2020, at 3:13 pm, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>> On 28 Oct 2020, at 11:56 am, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 26.10.2020 18:17, Rahul Singh wrote:
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -1419,13 +1419,15 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>>    if ( !is_iommu_enabled(d) )
>>>>        return 0;
>>>>
>>>> -    /* Prevent device assign if mem paging or mem sharing have been 
>>>> +#if defined(CONFIG_HAS_MEM_PAGING) || defined(CONFIG_MEM_SHARING)
>>>> +    /* Prevent device assign if mem paging or mem sharing have been
>>>>     * enabled for this domain */
>>>>    if ( d != dom_io &&
>>>>         unlikely(mem_sharing_enabled(d) ||
>>>>                  vm_event_check_ring(d->vm_event_paging) ||
>>>>                  p2m_get_hostp2m(d)->global_logdirty) )
>>>>        return -EXDEV;
>>>> +#endif
>>>
>>> Besides this also disabling mem-sharing and log-dirty related
>>> logic, I don't think the change is correct: Each item being
>>> checked needs individually disabling depending on its associated
>>> CONFIG_*. For this, perhaps you want to introduce something
>>> like mem_paging_enabled(d), to avoid the need for #ifdef here?
>>>
>>
>> Ok I will fix that in next version. 
> 
> I just check and found out that mem-sharing , men-paging and log-dirty is x86 specific and not implemented for ARM.
> Is that will be ok if I move above code to x86 specific directory and introduce new function arch_pcidev_is_assignable() that will test if pcidev is assignable or not ?

As an immediate workaround - perhaps (long term the individual
pieces should still be individually checked here, as they're
not inherently x86-specific). Since there's no device property
involved here, the suggested name looks misleading. Perhaps
arch_iommu_usable(d)?

Jan

