Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D995B4FA625
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 11:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302119.515672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd78D-0007qv-Hr; Sat, 09 Apr 2022 09:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302119.515672; Sat, 09 Apr 2022 09:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd78D-0007o7-Eo; Sat, 09 Apr 2022 09:11:45 +0000
Received: by outflank-mailman (input) for mailman id 302119;
 Sat, 09 Apr 2022 09:11:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nd78C-0007o1-Dg
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 09:11:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd787-0001Nv-Sv; Sat, 09 Apr 2022 09:11:39 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd787-0003JL-LR; Sat, 09 Apr 2022 09:11:39 +0000
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
	bh=NyjRqjcjAzTV7LrhXX19rU681YKP+XHrm9dw2xBFycQ=; b=ZvU/ewVkm9qx8j9zc5vISGa6i4
	CsBLL96nA5+faz2nHEMkbWqtXSUYATFObuHUAPYSefFtnG0w3hvyOOhzP8F/bkX0RFCU4SKubfPjL
	hEd4RMkWTJ6evzJfFnFH8r/2SJYEeyRK5yUCP0XqmvOLeqJwiTkccUX4yLICnfrW3FoA=;
Message-ID: <f8627956-8b01-6a5d-d69a-d2da16d74726@xen.org>
Date: Sat, 9 Apr 2022 10:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>, nd@arm.com,
 Penny Zheng <penzhe01@a011292.shanghai.arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
 <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
 <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com>
 <alpine.DEB.2.22.394.2203211256370.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203211256370.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/03/2022 20:03, Stefano Stabellini wrote:
> On Mon, 21 Mar 2022, Jan Beulich wrote:
>> On 18.03.2022 22:50, Stefano Stabellini wrote:
>>> On Fri, 18 Mar 2022, Jan Beulich wrote:
>>>> On 11.03.2022 07:11, Penny Zheng wrote:
>>>>> In case to own statically shared pages when owner domain is not
>>>>> explicitly defined, this commits propose a special domain DOMID_SHARED,
>>>>> and we assign it 0x7FF5, as one of the system domains.
>>>>>
>>>>> Statically shared memory reuses the same way of initialization with static
>>>>> memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
>>>>> related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).
>>>>>
>>>>> We intends to do shared domain creation after setup_virt_paging so shared
>>>>> domain could successfully do p2m initialization.
>>>>
>>>> There's nothing said here, in the earlier patch, or in the cover letter
>>>> about the security aspects of this. There is a reason we haven't been
>>>> allowing arbitrary, un-supervised sharing of memory between domains. It
>>>> wants clarifying why e.g. grants aren't an option to achieve what you
>>>> need, and how you mean to establish which domains are / aren't permitted
>>>> to access any individual page owned by this domain.
>>>
>>>
>>> I'll let Penny write a full reply but I'll chime in to try to help with
>>> the explanation.
>>>
>>> This is not arbitrary un-supervised sharing of memory between domains,
>>> which indeed is concerning.
>>>
>>> This is statically-configured, supervised by the system configurator,
>>> sharing of memory between domains.
>>>
>>> And in fact safety (which is just a different aspect of security) is one
>>> of the primary goals for this work.
>>>
>>> In safety-critical environments, it is not considered safe to
>>> dynamically change important configurations at runtime. Everything
>>> should be statically defined and statically verified.
>>>
>>> In this case, if the system configuration knows a priori that there are
>>> only 2 VM and they need to communication over shared memory, it is safer
>>> to pre-configure the shared memory at build time rather than let the VMs
>>> attempt to share memory at runtime. It is faster too.
>>>
>>> The only way to trigger this static shared memory configuration should
>>> be via device tree, which is at the same level as the XSM rules
>>> themselves.
>>>
>>> Hopefully I made things clearer and not murkier :-)
>>
>> It adds some helpful background, yes, but at the same time it doesn't
>> address the security concern at all: How are access permissions
>> managed when the owning domain is a special one? I haven't spotted
>> any recording of the domains which are actually permitted to map /
>> access the pages in questions. (But of course I also only looked at
>> non-Arm-specific code. I'd expect such code not to live in arch-
>> specific files.)
> 
> All this static memory sharing is statically done at __init time only.
> It should not be possible to trigger any further memory sharing at
> runtime (if there is, that would be a bug). 

Looking at the code, get_pg_owner() will be able to handle DOMID_SHARED. 
So anyone that is permitted to access DOMID_SHARED will be able to map 
any memory region at runtime.

> There are no new interfaces for the guest to map this memory because it
> is already "pre-mapped".

It can via XENMAPSPACE_gmfn_foreign (assuming proper permission).

Cheers,

-- 
Julien Grall

