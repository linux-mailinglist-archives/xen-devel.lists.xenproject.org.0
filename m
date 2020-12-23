Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3C2E1DD1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 16:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58446.102792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5sN-0000Ln-8O; Wed, 23 Dec 2020 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58446.102792; Wed, 23 Dec 2020 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5sN-0000LJ-4a; Wed, 23 Dec 2020 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 58446;
 Wed, 23 Dec 2020 15:16:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks5sL-0000Kz-SG
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:16:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks5sL-0000hy-CR; Wed, 23 Dec 2020 15:16:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks5sL-0003L7-3X; Wed, 23 Dec 2020 15:16:29 +0000
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
	bh=c31ZVpZuYw6FZc1yugj2Tp6Yz1OI6OYjHMuor1fy1sw=; b=DroT8KAWSUUA3zdxadjslA025D
	5fXNPgQfb91sNp7y3wYSdAe3w8xl8y0VQP8TXHGvCpUifJTRTnDoXHC4lzmzqvwO7q/NAXMcRi33Z
	FEG5FczGXVskTWDefMxAQHu34qVtn170VEmoQ3UK+XZyhM8wd6uIZ/7bTJcz95wKTnEk=;
Subject: Re: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-4-julien@xen.org>
 <499e6d5a-e8ac-56db-1af9-70469b6a06b9@suse.com>
 <8b394c44-5bdb-9d82-b211-5a4ee3473568@xen.org>
 <19e92d90-ed9a-4bd6-79f4-b761b5a039c6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <96ce1b10-9764-b71e-ac26-982ba8dcc34d@xen.org>
Date: Wed, 23 Dec 2020 15:16:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <19e92d90-ed9a-4bd6-79f4-b761b5a039c6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 15:00, Jan Beulich wrote:
> On 23.12.2020 15:56, Julien Grall wrote:
>> On 23/12/2020 14:12, Jan Beulich wrote:
>>> On 22.12.2020 16:43, Julien Grall wrote:
>>>> This is an RFC because it would break AMD IOMMU driver. One option would
>>>> be to move the call to the teardown callback earlier on. Any opinions?
>>>
>>> We already have
>>>
>>> static void amd_iommu_domain_destroy(struct domain *d)
>>> {
>>>       dom_iommu(d)->arch.amd.root_table = NULL;
>>> }
>>>
>>> and this function is AMD's teardown handler. Hence I suppose
>>> doing the same for VT-d would be quite reasonable. And really
>>> VT-d's iommu_domain_teardown() also already has
>>>
>>>       hd->arch.vtd.pgd_maddr = 0;
>>
>> Let me have a look if that works.
>>
>>>
>>> I guess what's missing is prevention of the root table
>>> getting re-setup.
>>
>> This is taken care in the follow-up patch by forbidding page-table
>> allocation. I can mention it in the commit message.
> 
> My expectation is that with that subsequent change the change here
> (or any variant of it) would become unnecessary.

I am not be sure. iommu_unmap() would still get called from put_page(). 
Are you suggesting to gate the code if d->is_dying as well?

Even if this patch is deemed to be unecessary to fix the issue.
This issue was quite hard to chase/reproduce.

I think it would still be good to harden the code by zeroing 
hd->arch.vtd.pgd_maddr to avoid anyone else wasting 2 days because the 
pointer was still "valid".

Cheers,

-- 
Julien Grall

