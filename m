Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6862B8FFC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30565.60677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgzo-0007ME-2c; Thu, 19 Nov 2020 10:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30565.60677; Thu, 19 Nov 2020 10:16:56 +0000
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
	id 1kfgzn-0007Lp-Vm; Thu, 19 Nov 2020 10:16:55 +0000
Received: by outflank-mailman (input) for mailman id 30565;
 Thu, 19 Nov 2020 10:16:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfgzm-0007Lk-UR
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:16:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfgzl-0000AF-V9; Thu, 19 Nov 2020 10:16:53 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfgzl-0001ns-Np; Thu, 19 Nov 2020 10:16:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfgzm-0007Lk-UR
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qNJSo2G5SgZQVnKvsfBvSfQdBBs6ER1ANyOEOjh8fmM=; b=JKrERxADEAquNyH4aoXXoQZkYE
	ltunWQxlwXg7LAMMlUUQM82X+QUEFI4LzMUTY19Jy5Yx9Y9/V8p4fYEotHqeE8NqT2qBpKKxEWmfq
	BarcytXxufx1UdxqVm0tp50GGMkoiadxTrD+WjCaRWyPNNnFRBldv2T6oUbpmolcRHxc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfgzl-0000AF-V9; Thu, 19 Nov 2020 10:16:53 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfgzl-0001ns-Np; Thu, 19 Nov 2020 10:16:53 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
Date: Thu, 19 Nov 2020 10:16:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/11/2020 09:53, Jan Beulich wrote:
> On 19.11.2020 10:21, Julien Grall wrote:
>> Hi Jan,
>>
>> On 19/11/2020 09:05, Jan Beulich wrote:
>>> On 18.11.2020 16:50, Julien Grall wrote:
>>>> On 16/11/2020 12:25, Rahul Singh wrote:
>>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>>>> is enabled for ARM, compilation error is observed for ARM architecture
>>>>> because ARM platforms do not have full PCI support available.
>>>>    >
>>>>> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
>>>>> ns16550 PCI for X86.
>>>>>
>>>>> For X86 platforms it is enabled by default. For ARM platforms it is
>>>>> disabled by default, once we have proper support for NS16550 PCI for
>>>>> ARM we can enable it.
>>>>>
>>>>> No functional change.
>>>>
>>>> NIT: I would say "No functional change intended" to make clear this is
>>>> an expectation and hopefully will be correct :).
>>>>
>>>> Regarding the commit message itself, I would suggest the following to
>>>> address Jan's concern:
>>>
>>> While indeed this is a much better description, I continue to think
>>> that the proposed Kconfig option is undesirable to have.
>>
>> I am yet to see an argument into why we should keep the PCI code
>> compiled on Arm when there will be no-use....
> 
> Well, see my patch suppressing building of quite a part of it.

I will let Rahul figuring out whether your patch series is sufficient to 
fix compilation issues (this is what matters right now).

> 
>>> Either,
>>> following the patch I've just sent, truly x86-specific things (at
>>> least as far as current state goes - if any of this was to be
>>> re-used by a future port, suitable further abstraction may be
>>> needed) should be guarded by CONFIG_X86 (or abstracted into arch
>>> hooks), or the HAS_PCI_MSI proposal would at least want further
>>> investigating as to its feasibility to address the issues at hand.
>>
>> I would be happy with CONFIG_X86, despite the fact that this is only
>> deferring the problem.
>>
>> Regarding HAS_PCI_MSI, I don't really see the point of introducing given
>> that we are not going to use NS16550 PCI on Arm in the forseeable
>> future.
> 
> And I continue to fail to see what would guarantee this: As soon
> as you can plug in such a card into an Arm system, people will
> want to be able use it. That's why we had to add support for it
> on x86, after all.

Well, plug-in PCI cards on Arm has been available for quite a while... 
Yet I haven't heard anyone asking for NS16550 PCI support.

This is probably because SBSA compliant server should always provide an 
SBSA UART (a cut-down version of the PL011). So why would bother to lose 
a PCI slot for yet another UART?

> >> So why do we need a finer graine Kconfig?
> 
> Because most of the involved code is indeed MSI-related?

Possibly, yet it would not be necessary if we don't want NS16550 PCI 
support...

Cheers,

-- 
Julien Grall

