Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6B45A96C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229825.397385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ8B-0000Rd-EW; Tue, 23 Nov 2021 16:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229825.397385; Tue, 23 Nov 2021 16:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ8B-0000On-An; Tue, 23 Nov 2021 16:58:55 +0000
Received: by outflank-mailman (input) for mailman id 229825;
 Tue, 23 Nov 2021 16:58:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpZ89-0000OO-Hf
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:58:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZ88-0008Ae-Uc; Tue, 23 Nov 2021 16:58:52 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZ88-0004Vy-OV; Tue, 23 Nov 2021 16:58:52 +0000
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
	bh=Kz4KxcnwlxT+iYz9RZvmA7qgbZq8uJw8gkLkSOB/aro=; b=hJENmxBdzQy2o42E6D4jzas89H
	7QBK9bJKRdAqAMDKhCU4+LQEKiA4vYodBFo0TKw9Gum79W9DWJ3NJRHFPOIh9rOJK1cAbBb85+eJm
	4ihrKR05dCjDDJJLYyuVNR0f5T2Nq8pnZycK5cXLiLhmW1YNk3emyYt/TA5EHu5aMbmA=;
Message-ID: <12447bb3-e3b4-c1f3-17f7-09704fd8b847@xen.org>
Date: Tue, 23 Nov 2021 16:58:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-4-andr2000@gmail.com>
 <2eb6b4e8-95e1-9566-3209-c28964b0d643@xen.org>
 <2f414e8f-67d5-d513-74d4-cc21a3a9ed28@epam.com>
 <9f712f79-9660-865a-3002-713950518819@epam.com>
 <117a57d1-aa4f-8153-8bba-2db47c234b81@xen.org>
 <c6232073-b59a-609f-3852-ddcac0859c2c@epam.com>
 <ef17fbe6-9768-9978-fa8f-6be757034234@xen.org>
 <442c853a-5554-9be0-80e4-b1f34cd6adeb@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <442c853a-5554-9be0-80e4-b1f34cd6adeb@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/11/2021 16:41, Oleksandr Andrushchenko wrote:
> On 23.11.21 18:12, Julien Grall wrote:
>> On 23/11/2021 06:58, Oleksandr Andrushchenko wrote:
>>> unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>>> {
>>>        if ( !has_vpci(d) )
>>>            return 0;
>>>
>>>        if ( is_hardware_domain(d) )
>>>        {
>>>            int ret = pci_host_iterate_bridges_and_count(d, vpci_get_num_handlers_cb);
>>>
>>>            return ret < 0 ? 0 : ret;
>>>        }
>>>
>>>        /*
>>>         * This is a guest domain:
>>>         *
>>>         * 1 for a single emulated host bridge's configuration space.
>>>         */
>>>        return 1;
>>
>> I am afraid that my question stands even with this approach. This patch is only meant to handle the hardware domain, therefore the change seems to be out of context.
>>
>> I would prefer if this change is done separately.
> While I do agree that MSI part and virtual bus topology are not belonging to this
> patch I can't agree with the rest: we already have MMIO handlers for guest domains
> and we introduce domain_vpci_get_num_mmio_handlers which must also account
> on guests and stay consistent.
> So, despite the patch has "hardware domain" in its name it doesn't mean we should
> break guests here.

We were already registering the handler for guest domain before your 
patch. So this is nothing new.

At the moment, we always allocate an extra 16 slot for IO handlers (see 
MAX_IO_HANDLER). So we are not breaking anything. Instead, this is 
simply a latent bug.

> Thus I do think the above is still correct wrt this patch.

The idea of splitting patch is to separate bug fix from new code. This 
helps backporting and review.

In this case, we don't care about backport (PCI passthrough is no 
supported) and the fix a simple enough. So I am not going to insist on 
splitting to a separate patch.

However, this change *must* be explained in the commit message.

Cheers,

-- 
Julien Grall

