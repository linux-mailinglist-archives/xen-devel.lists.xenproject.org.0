Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9580C4C0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651557.1017266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcfr-0000H4-6G; Mon, 11 Dec 2023 09:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651557.1017266; Mon, 11 Dec 2023 09:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcfr-0000Di-08; Mon, 11 Dec 2023 09:34:03 +0000
Received: by outflank-mailman (input) for mailman id 651557;
 Mon, 11 Dec 2023 09:34:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCcfp-0000Dc-9Y
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:34:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCcfl-0000mh-Gj; Mon, 11 Dec 2023 09:33:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCcfl-000131-9P; Mon, 11 Dec 2023 09:33:57 +0000
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
	bh=HQ7msSemChyrIoKJclH+vwHG6LUuD8fEckKYIUxfJiU=; b=l0MuMKX23X439guHBtCDZB0Mui
	PpNculdRbRZgVEMPlN51MNTk6CXpL/mnUXxiutePEQBmAcCxFo4OSI/hCeEjmCLb++rCAXDaIvkH5
	gVvLwOAYiL4utVE9BwZq3lQ+ZbQwZpuwr21FG98Wn15rGaWMvw13nQOKOhreh65fmtAA=;
Message-ID: <797e8621-e12e-4d5e-9c8c-4e3ece08009b@xen.org>
Date: Mon, 11 Dec 2023 09:33:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 stefano.stabellini@amd.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
 <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
 <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
 <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
 <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
 <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
 <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org>
 <alpine.DEB.2.22.394.2312051503060.110490@ubuntu-linux-20-04-desktop>
 <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org>
 <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/12/2023 21:41, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 05/12/2023 23:21, Stefano Stabellini wrote:
>>> On Tue, 5 Dec 2023, Julien Grall wrote:
>>>> I agree that crashing a guest is bad, but is lying to the domain really
>>>> better? The consequence here is not that bad and hopefully it would be
>>>> fairly
>>>> easy to find. But this is not always the case. So I definitely would place
>>>> a
>>>> half-backed emulation more severe than a guest crash.
>>>
>>>
>>> I see where Julien is coming from, but I would go with option two:
>>> "emulate DCC the same way as KVM". That's because I don't think we can
>>> get away with crashing the guest in all cases. Although the issue came
>>> up with a Linux guest, it could have been triggered by a proprietary
>>> operating system that we cannot change, and I think Xen should support
>>> running unmodified operating systems.
>>>
>>> If we go with a "half-backed emulation" solution, as Julien wrote, then
>>> it is better to be more similar to other hypervisors, that's why I chose
>>> option two instead of option three.
>>>
>>> But at the same time I recognize the validity of Julien's words and it
>>> makes me wonder if we should have a KCONFIG option or command line
>>> option to switch the Xen behavior. We could use it to gate all the
>>> "half-backed emulation" we do for compatibility.  Something like:
>>>
>>> config PARTIAL_EMULATION
>>>       bool "Partial Emulation"
>>>       ---help---
>>>             Enables partial, not spec compliant, emulation of certain
>>> register
>>>       interfaces (e.g DCC UART) for guest compatibility. If you disable
>>>       this option, Xen will crash the guest if the guest tries to access
>>>       interfaces not fully emulated or virtualized.
>>>
>>>       If you enable this option, the guest might misbehave due to non-spec
>>>       compliant emulation done by Xen.
>>
>> As I wrote to Ayan on Matrix today, I am not in favor of the emulation. Yet, I
>> am not going to oppose (as in Nack it) if the other maintainers agree with it.
> 
> Thanks for being flexible
> 
> 
>> The KConfig would be nice, the question is whether we want to (security)
>> support such configuration? E.g. could this potentially introduce a security
>> issue in the guest?
> 
> The important question is whether it could introduce a security issue in
> Xen. If we think it wouldn't increase the attack surface significantly
> then I would security support it otherwise not.

For this specific emulation, it is unlikely. But I can't make a generic 
statement here. So we would need to do a case by case basis.

Furthermore, our security statement is also covering a guest userspace 
attacking a guest OS. We would issue an XSA if this is feasible because 
of an issue in the hypervisor.

With half-backed emulation, it becomes more difficult to know whether we 
are not opening a hole and replacing a guest crashes at boot by 
something worse.

Again unlikely here. But those kind of bugs are no unheard. So this is 
something to take into account when you want to claim security support 
for half-backed emulation.

Cheers,

-- 
Julien Grall

