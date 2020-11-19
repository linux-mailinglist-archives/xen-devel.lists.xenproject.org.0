Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74B2B8F68
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 10:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30533.60617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgdK-0004n7-2s; Thu, 19 Nov 2020 09:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30533.60617; Thu, 19 Nov 2020 09:53:42 +0000
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
	id 1kfgdJ-0004mh-VZ; Thu, 19 Nov 2020 09:53:41 +0000
Received: by outflank-mailman (input) for mailman id 30533;
 Thu, 19 Nov 2020 09:53:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfgdI-0004mc-Tr
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:53:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af2f9386-1538-4890-82bc-a306b3508381;
 Thu, 19 Nov 2020 09:53:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 098EDAC22;
 Thu, 19 Nov 2020 09:53:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfgdI-0004mc-Tr
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:53:40 +0000
X-Inumbo-ID: af2f9386-1538-4890-82bc-a306b3508381
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id af2f9386-1538-4890-82bc-a306b3508381;
	Thu, 19 Nov 2020 09:53:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605779619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bjy5eM5ZfYpFLRU6q1VKG0ulPw7tPJ6XYm6IdPsRa9U=;
	b=phhjnAijCOClhWX53Vaw4V21SriBCtEP6X8p78JJ7xlDn3ZAHdRHGePDfk5apMtdfXsVFj
	hCFKn1zvFrMvjDVxu7wp2mPypA+m3lUHRsR302UqJgZjRskJXD2iNp3VSM3d7ELz0vK/DZ
	FM13lZap0zCPrhDlLt4IYgb7aVoIFjE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 098EDAC22;
	Thu, 19 Nov 2020 09:53:39 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
Date: Thu, 19 Nov 2020 10:53:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 10:21, Julien Grall wrote:
> Hi Jan,
> 
> On 19/11/2020 09:05, Jan Beulich wrote:
>> On 18.11.2020 16:50, Julien Grall wrote:
>>> On 16/11/2020 12:25, Rahul Singh wrote:
>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>>> is enabled for ARM, compilation error is observed for ARM architecture
>>>> because ARM platforms do not have full PCI support available.
>>>   >
>>>> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
>>>> ns16550 PCI for X86.
>>>>
>>>> For X86 platforms it is enabled by default. For ARM platforms it is
>>>> disabled by default, once we have proper support for NS16550 PCI for
>>>> ARM we can enable it.
>>>>
>>>> No functional change.
>>>
>>> NIT: I would say "No functional change intended" to make clear this is
>>> an expectation and hopefully will be correct :).
>>>
>>> Regarding the commit message itself, I would suggest the following to
>>> address Jan's concern:
>>
>> While indeed this is a much better description, I continue to think
>> that the proposed Kconfig option is undesirable to have.
> 
> I am yet to see an argument into why we should keep the PCI code 
> compiled on Arm when there will be no-use....

Well, see my patch suppressing building of quite a part of it.

>> Either,
>> following the patch I've just sent, truly x86-specific things (at
>> least as far as current state goes - if any of this was to be
>> re-used by a future port, suitable further abstraction may be
>> needed) should be guarded by CONFIG_X86 (or abstracted into arch
>> hooks), or the HAS_PCI_MSI proposal would at least want further
>> investigating as to its feasibility to address the issues at hand.
> 
> I would be happy with CONFIG_X86, despite the fact that this is only 
> deferring the problem.
> 
> Regarding HAS_PCI_MSI, I don't really see the point of introducing given 
> that we are not going to use NS16550 PCI on Arm in the forseeable 
> future.

And I continue to fail to see what would guarantee this: As soon
as you can plug in such a card into an Arm system, people will
want to be able use it. That's why we had to add support for it
on x86, after all.

> So why do we need a finer graine Kconfig?

Because most of the involved code is indeed MSI-related?

Jan

