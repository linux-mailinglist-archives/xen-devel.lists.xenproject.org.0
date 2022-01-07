Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC1487513
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 10:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254330.436070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5lx1-0005d9-LH; Fri, 07 Jan 2022 09:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254330.436070; Fri, 07 Jan 2022 09:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5lx1-0005b9-Hj; Fri, 07 Jan 2022 09:54:23 +0000
Received: by outflank-mailman (input) for mailman id 254330;
 Fri, 07 Jan 2022 09:54:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n5lwz-0005b3-JG
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 09:54:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n5lwv-0005dW-WF; Fri, 07 Jan 2022 09:54:18 +0000
Received: from [54.239.6.185] (helo=[192.168.10.54])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n5lwv-0000Qn-Ps; Fri, 07 Jan 2022 09:54:17 +0000
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
	bh=VW8CAVssjdMCq3bxN8FQiLi5p7lOnhkc3LbjoqTUS5U=; b=X+6BYIeOvIpk9qA1R819vIqTXy
	DG9ZQZ0LRIEZuqmUqMFKph7NIKMa4JBXMX735uUHQMBvm0e+sYZalqXNEsl0VZzAA7tQnengsHGBy
	qj19bijxPKDUucgpQG69MEqY2L4/GpqV2zVlUfwBqdH8Mrmoj39gvd3HrzNkLBCq4IfQ=;
Message-ID: <5978ec78-37f6-3ff1-84a4-2c39db3d3dd6@xen.org>
Date: Fri, 7 Jan 2022 09:54:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: request for feedback on a Xen/Linux compatibility issue
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
References: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>
 <4ea34f61-e72e-76c3-5c20-879fefe4c7f7@suse.com>
 <09333371-92c0-5c90-4b4c-59b2ed9ac60d@suse.com>
 <539a657a-dd79-b05b-1f4b-6d9a5a869d12@xen.org>
 <alpine.DEB.2.22.394.2201061544100.2060010@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201061544100.2060010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/01/2022 00:02, Stefano Stabellini wrote:
> On Thu, 6 Jan 2022, Julien Grall wrote:
>> On 06/01/2022 14:03, Jan Beulich wrote:
>>> On 06.01.2022 08:13, Juergen Gross wrote:
>>>> On 06.01.22 01:40, Stefano Stabellini wrote:
>>>>> Hi all,
>>>>>
>>>>> Today Xen dom0less guests are not "Xen aware": the hypervisor node
>>>>> (compatible = "xen,xen") is missing from dom0less domUs device trees and
>>>>> as a consequence Linux initializes as if Xen is not present. The reason
>>>>> is that interfaces like grant table and xenstore (xenbus in Linux) don't
>>>>> work correctly in a dom0less environment at the moment.
>>>>>
>>>>> The good news is that I have patches for Xen to implement PV drivers
>>>>> support for dom0less guests. They also add the hypervisor node to device
>>>>> tree for dom0less guests so that Linux can discover the presence of Xen
>>>>> and related interfaces.
>>>>>
>>>>> When the Linux kernel is booting as dom0less kernel, it needs to delay
>>>>> the xenbus initialization until the interface becomes ready. Attempts to
>>>>> initialize xenbus straight away lead to failure, which is fine because
>>>>> xenbus has never worked in Linux when running as dom0less guest up until
>>>>> now. It is reasonable that a user needs a newer Linux to take advantage
>>>>> of dom0less with PV drivers. So:
>>>>>
>>>>> - old Xen + old/new Linux -> Xen not detected in Linux
>>>>> - new Xen + old Linux     -> xenbus fails to initialize in Linux
>>>>> - new Xen + new Linux     -> dom0less PV drivers working in Linux
>>>>>
>>>>>
>>>>> The problem is that Linux until recently couldn't deal with any errors
>>>>> in xenbus initialization. Instead of returning error and continuing
>>>>> without xenbus, Linux would crash at boot.
>>>>>
>>>>> I upstreamed two patches for Linux xenbus_probe to be able to deal with
>>>>> initialization errors. With those two fixes, Linux can boot as a
>>>>> dom0less kernel with the hypervisor node in device tree. The two fixes
>>>>> got applied to master and were already backported to all the supported
>>>>> Linux stable trees, so as of today:
>>>>>
>>>>> - dom0less with hypervisor node + Linux 5.16+           -> works
>>>>> - dom0less with hypervisor node + stable Linux 5.10     -> works
>>>>> - dom0less with hypervisor node + unpatched Linux 5.10  -> crashes
>>>>>
>>>>>
>>>>> Is this good enough? Or for Xen/Linux compatibility we want to also be
>>>>> able to boot vanilla unpatched Linux 5.10 as dom0less kernel? If so,
>>>>> the simplest solution is to change compatible string for the hypervisor
>>>>> node, so that old Linux wouldn't recognize Xen presence and wouldn't try
>>>>> to initialize xenbus (so it wouldn't crash on failure). New Linux can of
>>>>> course learn to recognize both the old and the new compatible strings.
>>>>> (For instance it could be compatible = "xen,xen-v2".) I have prototyped
>>>>> and tested this solution successfully but I am not convinced it is the
>>>>> right way to go.
>>>>>
>>>>> Do you have any suggestion or feedback?
>>>>>
>>>>> The Linux crash on xenbus initialization failure is a Linux bug, not a
>>>>> Xen issue. For this reason, I am tempted to say that we shouldn't change
>>>>> compatible string to work-around a Linux bug, especially given that the
>>>>> Linux stable trees are already all fixed.
>>>>
>>>> What about adding an option to your Xen patches to omit the hypervisor
>>>> node in the device tree? This would enable the user to have a mode
>>>> compatible to today's behavior.
>>>
>>> While this sounds nice at the first glance, this would need to be a per-
>>> domain setting. Which wouldn't be straightforward to express via command
>>> line option (don't know how feasible it would be to express such via other
>>> means).
>>
>> For dom0less, domains are described in the Device-Tree. We have one node per
>> domain, so we could add a property to indicate whether the domain should be
>> started in compat mode (or not).
>>
>> That said, I am not sure every users will want Linux to use
>> grant-table/xenstore (possibly, some users may want one but not the other).
>>
>> So how about a more generic property "xen,enhanced" with an opional value
>> indicating whether this is disabled, enabled or the list of interface (e.g.
>> xenbus, grant-table) exposed?
> 
> Yeah, I like this idea. It would allow for maximum flexibility while not
> requiring any changes to the existing Xen/Linux interface; even the
> compatible string would remain unmodified.
> 
> I also find the ability to select individual features interesting,
> although I don't have a concrete use-case for it yet. I should say that
> I do have a concrete use-case for enabling only event-channels but they
> are actually already enabled for dom0less guests because they are just
> hypercalls.

I thought about mentioning the hypercalls yesterday. However, I think it 
would be better to use XSM as it would be a lot more flexible than a 
Device-Tree based approach for the hypercalls.

> (Nothing disables them at present for dom0less guests so
> they get them "by default".)
> 
> Let's say we go down this path, which seems nice. The remaining question
> is what do we want as default when the new "xen,enhanced" option is
> missing. I think it makes sense for the default to be "enabled" because
> I expect most people to want the enhacements and they are generally
> harmless if you don't use them (except for old unpatched Linux kernels,
> which is the main reason why we need the option).

You are probably right about the future use. However, we also need to 
make sure that the upgrade from a Xen without this feature is painless 
(I view dom0less bindings as stable). Therefore, I think this should be 
disabled by default so there are no surprise.

Cheers,

-- 
Julien Grall

