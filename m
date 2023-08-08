Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F6D774D42
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580509.908751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTUW1-0002fD-7P; Tue, 08 Aug 2023 21:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580509.908751; Tue, 08 Aug 2023 21:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTUW1-0002cM-43; Tue, 08 Aug 2023 21:45:21 +0000
Received: by outflank-mailman (input) for mailman id 580509;
 Tue, 08 Aug 2023 21:45:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTUW0-0002cG-40
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:45:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTUVy-0000L9-Ed; Tue, 08 Aug 2023 21:45:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTUVy-0000c5-7a; Tue, 08 Aug 2023 21:45:18 +0000
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
	bh=/ptdp1jNOu3zIbj++3uF01/aR4VDNlm76f4WVZ+9cSY=; b=G3bJz5Cb8fobjInPFDhYRJsOw1
	QOIOyxws4RfIHG2YjIDhGWa/FbcvxiCCFP2O2NhviaUs0NWdr6m01/moSc0FIJxsKC0M67zWxYFey
	3K76bfWgSqUY5RrniPImJ+36T0nz+lUtN/UZRqx8VD8e6mC9aTcD4YiQyuy2e/TtXvVs=;
Message-ID: <f0c7b8cb-e5e0-40bd-951c-da732e65730a@xen.org>
Date: Tue, 8 Aug 2023 22:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <3ddab6ee-54fc-49a0-8f14-79ca258d04af@xen.org>
 <76249714-6d1d-a2ad-cfe5-d7eae0ce3a1b@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <76249714-6d1d-a2ad-cfe5-d7eae0ce3a1b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 08/08/2023 21:49, Daniel P. Smith wrote:
> On 8/4/23 05:03, Julien Grall wrote:
>> Hi Daniel,
>>
>> On 03/08/2023 11:44, Daniel P. Smith wrote:
>>> +compatible
>>> +  Identifies which hypervisors the configuration is compatible. 
>>> Required.
>>> -    hypervisor {
>>> -        compatible = “hypervisor,xen”
>>> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
>>
>> I read "e.g" as "for example". You don't explicitely say which 
>> compatible will be supported by Xen, so one could write 
>> "hypervisor,foo" and expect to work.
>>
>> Also, it is not fully clear why you need both the hypervisor and each 
>> domain node to have a compatible with the hypervisor name in it.
> 
> Ack, it should be explicit to what is expected for a Xen configuration. 
> As for compatible on the domain node, I think that was from being overly 
> cautious, it can be dropped.
> 
> This did get me reflecting that the compatibility was added there as 
> there was some initial participation in standardization efforts going on 
> at the time. I am not sure what has come of those, but the question it 
> raised is that domain is a Xen specific term, whereas generally vm is 
> accepted as the generic term. Maybe this node needs renaming?

IIRC Stefano attempted to (partially?) standardized the Device-Tree 
configuration for domains. So I will let him comment here.

> 
>>> +compatible
>>> +  Identifies the hypervisor the confiugration is intended. Required.
>>
>> Also typo: s/confiugration/configuration/
> 
> Ack.
> 
>>> -The modules that would be supplied when using the above config would 
>>> be:
>>> +  Format: "<hypervisor name>,config", e.g "xen,config"
>>> -* (the above config, compiled into hardware tree)
>>> -* CPU microcode
>>> -* XSM policy
>>> -* kernel for boot domain
>>> -* ramdisk for boot domain
>>> -* boot domain configuration file
>>> -* kernel for the classic dom0 domain
>>> -* ramdisk for the classic dom0 domain
>>> +bootargs
>>> +  This is used to provide the boot params for Xen.
>>
>> How is this different from the command line parameter chosen? And if 
>> you want to keep both, what is the expected priority if a user 
>> provides both?
> 
> A DT file for x86, there is only a need to provide the hypervisor node, 
> for which we already needed a hypervisor config section to describe XSM 
> policy and microcode, at this point at least. It was decided in an 
> effort to provide flexibility, the ability to specify command line 
> parameters to the hypervisor in DT config. It is expected these 
> parameters would function as a base parameters that would be overridden 
> by those provided via the multiboot kernel entry.
]>
> Now as you point out for Arm, this becomes a bit redundant, to a degree, 
> as the Xen command line is already under the /chosen node. But even here 
> it would be beneficial, as a hyperlaunch configuration could be 
> distributed consisting of a dtb that has core parameters set with base 
> values along with a set of kernels and ramdisks. At boot, the 
> hyperlaunch dtb could then be concatenated with the device specific dtb.

I don't have a strong opinions on how it should be done. My point is 
more that the priority should be document.

> 
> 
>>> -The hypervisor device tree would be compiled into the hardware 
>>> device tree and
>>> -provided to Xen using the standard method currently in use. The 
>>> remaining
>>> -modules would need to be loaded in the respective addresses 
>>> specified in the
>>> -`module-addr` property.
>>> +  Format: String, e.g. "flask=silo"
>>> +Child Nodes
>>> +"""""""""""
>>> -The Hypervisor node
>>> --------------------
>>> +* module
>>> -The hypervisor node is a top level container for the domains that 
>>> will be built
>>> -by hypervisor on start up. On the ``hypervisor`` node the 
>>> ``compatible``
>>> -property is used to identify the type of hypervisor node present..
>>> +Domain Node
>>> +-----------
>>> -compatible
>>> -  Identifies the type of node. Required.
>>> +A ``domain`` node is for describing the construction of a domain. 
>>> Since there
>>> +may be one or more domain nodes, each one requires a unique, DTB 
>>> compliant name
>>> +and a ``compatible`` property to identify as a domain node.
>>> -The Config node
>>> ----------------
>>> +A ``domain`` node  may provide a ``domid`` property which will be 
>>> used as the
>>> +requested domain id for the domain with a value of “0” signifying to 
>>> use the
>>> +next available domain id, which is the default behavior if omitted. 
>>> It should
>>> +be noted that a domain configuration is not able to request a domid 
>>> of “0”
>>
>> Why do you need this restriction? And more importantly how would you 
>> describe dom0 in hyperlaunch?
> 
> I would start by saying one of the goals/purposes behind hyperlaunch is 
> to remove the binding that "dom0" is identified by having domid 0. That 
> is what the roles patch recently submitted is working to achieve. "Dom0" 
> is a role in the system, which I tried calling the "unbounded role" but 
> that seems to have caused some confusion.
> 
> That aside, IMHO because of the legacy around domid 0, I don't think it 
> should be assignable through hyperlaunch.

I understand the end goal. But I am not entirely convinced this will be 
wanted for everyone. So it might be preferable to avoid using '0' as 
'assign any free domid' as this would not prevent to describe dom0 in 
hyperlaunch if needed in the future.

> Additionally, there should be 
> an identifier that signifies auto-assign the domid and that value should 
> not conflict/limit what domids are usable by the hypervisor.

Why is this requirement? Why can't we simply rely on the property is not 
present?

>  Given we 
> should not be assigning domid 0 through this interface, it makes it the 
> perfect candidate value.
To be honest, even if you don't want to allow an admin to allocate ID 0, 
  I think using it is confusing because of the legacy meaning behind it.

I would likely be confused every time I read a device-tree. Also, given 
you already have a way to say 'assign a domain ID', it is not clear to 
me why you really need a second way to do it.

[...]

>>> +
>>> +capability
>>> +  This identifies what system capabilities a domain may have beyond 
>>> the role it
>>> +  was assigned.
>>>     Optional, the default is none.
>>> -.. note::  The `functions` bits that have been selected to indicate
>>> -   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last 
>>> two bits
>>> -   (30, 31) such that should these features ever be fully retired, 
>>> the flags may
>>> -   be dropped without leaving a gap in the flag set.
>>> +  Format: Bitfield, e.g <3221225487> or <0xC0000007>
>>
>> I thik we should favor the hexadecimal version because this will be 
>> somewhat easier to read.
> 
> I too favor the hex version, but as I recall, DT/libfdt doesn't 
> care/enforce.

Indeed the device-tree compiler is able to cope with both. However, we 
don't have to mention the two. It would be ok to only mention the one we 
prefer (i.e. hexadecimal) so the reader will more naturally use it.

> 
>> Also, the Device-Tree values work in term of 32-bit cell. Also, how do 
>> you plan to handle the case where you have more than 32 capabilities?
> 
> I would add a capabalities2 field, this is how SELinux/Flask handle the 
> same problem.

You should not need to introduce a new field. Instead you can add a 
second cell. But we would need to describe the ordering because for 
backward compatibility the cell 0 would want to cover bits [0:31] and 
cell 2 bits [64:31].

[...]

>>> +
>>>   memory
>>> -  The amount of memory to assign to the domain, in KBs.
>>> +  The amount of memory to assign to the domain, in KBs. This field 
>>> uses a DTB
>>> +  Reg which contains a start and size. For memory allocation start 
>>> may or may
>>> +  not have significance but size will always be used for the amount 
>>> of memory
>>>     Required.
>>
>> The description doesn't match...
> 
> Ack, others caught that as well. Will be fixed.
> 
>>> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
>>
>> ... the format. But strings are difficult to parse. If you want to 
>> provide 3 different values (possibly optional), then it would be best 
>> to have 3 different properties.
> 
> That format comes from the command line dom0 memory parameter, in the 
> hyperlaunch series I reused that existing parser that I am fairly 
> confident will be maintained.

Fair enough. However, I am still unconvinced this is the way to go. I 
don't have a strong argument other than 'memory' is already a number for 
dom0less DT and it sounds strange to change it.

Stefano, Bertrand, any opinions?

Cheers,

-- 
Julien Grall

