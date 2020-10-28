Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D029CE8E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 08:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13336.33907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgI3-0004N4-77; Wed, 28 Oct 2020 07:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13336.33907; Wed, 28 Oct 2020 07:54:39 +0000
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
	id 1kXgI3-0004Mf-3X; Wed, 28 Oct 2020 07:54:39 +0000
Received: by outflank-mailman (input) for mailman id 13336;
 Wed, 28 Oct 2020 07:54:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXgI1-0004Ma-3Y
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:54:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c85aec63-8c13-41b3-97cb-d387e01ad98b;
 Wed, 28 Oct 2020 07:54:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0FC1ADEC;
 Wed, 28 Oct 2020 07:54:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXgI1-0004Ma-3Y
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:54:37 +0000
X-Inumbo-ID: c85aec63-8c13-41b3-97cb-d387e01ad98b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c85aec63-8c13-41b3-97cb-d387e01ad98b;
	Wed, 28 Oct 2020 07:54:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603871674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpjxqE25mEO15/L9CJ6X7OaXXiqO5bjF9MbVgEdP6Es=;
	b=vHXw7wBbeJbpOCSdrJZt25UUz3pf3mGv5md+4YnD0AGjsfElDn7mZ+h+Zvrq7cdFXY2ezf
	2G03Y17j5hbUF0xRv78X5RF2vyV65xRcNQSOdF/eb/nthQITApG0nbjFKL5BpJP3nYahf2
	6LqxylqEyYk2egjlXUdGCb5XO+y7Xx8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C0FC1ADEC;
	Wed, 28 Oct 2020 07:54:34 +0000 (UTC)
Subject: Re: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
 <Rahul.Singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
 <20201027125104.axv26kdqljqsvufn@Air-de-Roger>
 <ac342c70-8fbb-023d-00b3-4a1bc1d389a7@epam.com>
 <7f98534d-39fd-cbcb-13dd-bbbd994251f0@suse.com>
 <1e8b43e5-7d44-a061-f60a-00f75eb19b8b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <727b84e8-5018-6c5b-552c-e4d204daf6c2@suse.com>
Date: Wed, 28 Oct 2020 08:54:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1e8b43e5-7d44-a061-f60a-00f75eb19b8b@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.10.2020 18:45, Oleksandr Andrushchenko wrote:
> On 10/27/20 7:18 PM, Jan Beulich wrote:
>> On 27.10.2020 16:52, Oleksandr Andrushchenko wrote:
>>> On 10/27/20 2:55 PM, Roger Pau Monné wrote:
>>>> On Tue, Oct 27, 2020 at 09:59:05AM +0000, Oleksandr Andrushchenko wrote:
>>>>>     5. An alternative route for 3-4 could be to store that data in XenStore, e.g.
>>>>>        MMIOs, IRQ, bind sysfs path etc. This would require more code on Xen side to
>>>>>        access XenStore and won’t work if MMIOs/IRQs are passed via device tree/ACPI
>>>>>        tables by the bootloaders.
>>>> As above, I think I need more context to understand what and why you
>>>> need to save such information.
>>> Well, with pciback absence we loose a "database" which holds all the knowledge
>>>
>>> about which devices are assigned, bound etc.
>> What hasn't become clear to me (sorry if I've overlooked it) is
>> why some form of pciback is not an option on Arm.
> Yes, it is probably possible to run pciback even without running
> 
> pcifront instances in guests and only use that functionality
> 
> which is needed for the toolstack. We can even have it as is without
> 
> modifications given that pcifront won't run and that part of the pciback
> 
> related to PCI config space, MSI etc. won't simply be used, but still
> 
> present in the pciback driver. We can try that (pciback is x86
> 
> only in the kernel).
> 
>> Where it would
>> need to run in your split hardware-domain / Dom0 setup (if I got
>> that right in the first place) would be a secondary question.
> 
> This actually becomes a problem if we think about hwdom != Dom0:
> 
> Dom0/toolstack wants to read PCI bus sysfs and it also wants to access
> 
> pciback's sysfs entries. So, for Dom0's toolstack to read sysfs in this scenario
> 
> we need a bridge between Dom0 and that hwdom to access both PCI
> 
> subsystem and pciback's sysfs: this could be implemented as a back-front pair
> 
> with a ring and event channel as PV drivers do. This approach of course will
> 
> require the toolstack to work in two modes: local sysfs/pciback and remote ones.
> 
> In the remote access model the toolstack will need to create a connection to
> 
> the hwdom each time it runs and requires sysfs data which should be acceptable.

That's the price to pay for disaggregation, I think. So yes to the
outline in general, but I'd like such an abstraction to not talk in
terms of "sysfs" or in fact anything that's OS specific on either
side. Whether it indeed needs a full new pair of front/back drivers
is a different question.

> It can also be possible to have the toolstack always use the remote model even
> 
> if it runs locally which will make the toolstack's code support a single model for all
> 
> the use-cases.

That's certainly one possible way of doing the necessary abstraction,
I agree.

> (Never thought if it is possible to run both backend and frontend in the same VM though).

Why would it not be? Other back/front pairs certainly can.

Jan

