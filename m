Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F6446797
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 18:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222572.384842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj2ji-00006f-3T; Fri, 05 Nov 2021 17:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222572.384842; Fri, 05 Nov 2021 17:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj2ji-0008VJ-07; Fri, 05 Nov 2021 17:10:42 +0000
Received: by outflank-mailman (input) for mailman id 222572;
 Fri, 05 Nov 2021 17:10:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mj2jg-0008VD-Dq
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 17:10:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mj2jf-0003oD-D7; Fri, 05 Nov 2021 17:10:39 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.21.75]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mj2jf-0006yz-6y; Fri, 05 Nov 2021 17:10:39 +0000
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
	bh=yoGmwQcWiJ4vvjPUYyJAGe7uaoLX0/CU8LEhU+h7OD8=; b=MX8Z/K5ZgpNqLVkyMeoeGN79pC
	qAJSpLIdDIcJaCleqLxSAudWd6JrM3o/dqf2pj/nopvxtnG2y+CqaSW3Atbgor6ah3QOOVBjeHdqu
	Ib86HpzTKD9I5VY6VdCfyt1vN5JeUTSKBdLHkwc0t4TVf/0YBvATf351rKKbetCMQ3qc=;
Message-ID: <15331d70-9610-be3a-640f-621774d6f093@xen.org>
Date: Fri, 5 Nov 2021 17:10:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: Arm EFI boot issue for Dom0 module listed inside subnode of
 chosen
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8A60FA62-2BAA-400B-BB53-AB3E8CCA67F1@arm.com>
 <alpine.DEB.2.21.2111021625160.18170@sstabellini-ThinkPad-T480s>
 <f4daf916-06bd-e002-8b74-be6fb45ef257@xen.org>
 <alpine.DEB.2.22.394.2111031457540.267621@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111031457540.267621@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 03/11/2021 21:57, Stefano Stabellini wrote:
> On Wed, 3 Nov 2021, Julien Grall wrote:
>> On 02/11/2021 23:36, Stefano Stabellini wrote:
>>> On Tue, 2 Nov 2021, Luca Fancellu wrote:
>>>> Hi all,
>>>>
>>>> We recently discovered that there is a way to list Dom0 modules that is
>>>> not supported by the EFI boot,
>>>> It’s happened browsing some Wiki pages like this one:
>>>> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Lager
>>>>
>>>> In that page the Dom0 modules are listed inside a subnode of the /chosen
>>>> node:
>>>>
>>>> chosen {
>>>>
>>>>       modules {
>>>>           #address-cells = <1>;
>>>>           #size-cells = <1>;
>>>>
>>>>           module@0x72000000 {
>>>>               compatible = "multiboot,kernel", "multiboot,module";
>>>>               reg = <0x72000000 0x2fd158>;
>>>>           };
>>>>
>>>>           module@0x74000000 {
>>>>               compatible = "xen,xsm-policy", "multiboot,module";
>>>>               reg = <0x74000000 0x2559>;
>>>>           };
>>>>       };
>>>> };
>>>>
>>>> Instead for how it is implemented now in the EFI code and described in:
>>>> 1) https://xenbits.xen.org/docs/unstable/misc/arm/device-tree/booting.txt
>>>> 2) https://xenbits.xen.org/docs/unstable/misc/efi.html
>>>>
>>>> Only the following approach is supported, so Dom0 modules must be a direct
>>>> child of /chosen:
>>
>> Do you mean this is not supported after your changes or this was never
>> supported? (see more below).
>>
>>>>
>>>> chosen {
>>>>       #address-cells = <1>;
>>>>       #size-cells = <1>;
>>>>
>>>>       module@0x72000000 {
>>>>           compatible = "multiboot,kernel", "multiboot,module";
>>>>           reg = <0x72000000 0x2fd158>;
>>>>       };
>>>>
>>>>       module@0x74000000 {
>>>>           compatible = "xen,xsm-policy", "multiboot,module";
>>>>           reg = <0x74000000 0x2559>;
>>>>       };
>>>> };
>>>>
>>>> Is this a problem that needs a fix?
>>>
>>>
>>> Let me start by saying that I don't feel strongly either way, so I am
>>> happy to go with other people's opinion on this one.
>>>
>>> In this kind of situations I usually look at two things:
>>> - what the specification says
>>> - what the existing code actually does
>>>
>>> In general, I try to follow the specification unless obviously
>>> production code relies on something that contradicts the spec, in which
>>> case I'd say to update the spec.
>>>
>>> In this case, although it is true that "modules" could be nice to have,
>>> it is missing a compatible string,
>>
>> There are a few nodes in the DT without compatible (e.g. cpus, memory, chosen,
>> soc). So I am a bit confused why this is a problem.
> 
> They tend to be "exceptions". Node names are usually not meaningful
> except for few top-level nodes without a compatible string. 

I think you misundertood my point here. I wasn't necessarily saying that 
the name "modules" was meaningful. Instead, I was pointing out there was 
various nodes without compatible property. I can see how this is useful 
to group nodes.

In fact, I couldn't find a section in the Device-Tree suggesting that 
the compatible property was mandatory. Do you have one pointer in hand?

> Cpus, memory
> and chosen are all top level nodes. I don't know about "soc", that one
> should probably be compatible = "simple-bus". If you have a pointer to
> an "soc" node without a compatible I'd be interested in taking a look.

See above, I wasn't suggesting that the name "soc" is meaningful.

> No worries if you don't have it handy, I was just curious.
Nothing in hand sorry. I vaguely recall we had that discussion when 
introducing the partial device-tree a few years ago.

>>> and it is only rarely used.
>>
>> Hmmm... We have quite a few examples on the wiki that create 'module' under
>> 'modules'. In fact, we have provided U-boot script [2] that can be easily
>> re-used. So I would not call it rare.
>>
>>>
>>> For these reasons, I don't think it is a problem that we need to fix.
>>> Especially considering that the EFI case is the only case not working
>>> and it was never supported until now.
>>
>> Hmmm... Looking at the implementation of efi_arch_use_config_file() in 4.12,
>> we are looking for the compatible "mutiboot,module". So I would say this is
>> supported.
>>
>>> If we want to add support for "modules", that could be fine, but I think
>>> we should describe it in arm/device-tree/booting.txt and also add a
>>> compatible string for it. For 4.16
>>
>> I think the first question we need to resolved is whether this has ever been
>> supported in EFI. I think it was and therefore this is technically a
>> regression.
>>
>> That said, outside of the dom0less case, I don't expect any UEFI users will
>> bother to create the nodes manually and instead rely on GRUB to create them.
>> So I think breaking it would be OK.
>>
>> I am less convinced about breaking it for non-UEFI case.
>>
>> That said, I think the documentation should be updated either way for
>> 4.16 (the more if this has been broken as part of recent changes).
> 
> It would be good to clarify. If we decide to go with making it clear
> that "modules" is not supported then from a device tree point of view I
> think we should say that "multiboot,module" nodes for Dom0 and Xen (xsm)
> are children of /chosen. I prefer this option because I think that if
> we wanted to group the dom0 and/or Xen modules together (which could be
> good) we could come up with something better than "modules", more
> aligned with dom0less.

To expand what I wrote above, I viewed "modules" as just a way to group 
nodes rather than a meaningful name.

In the current implementation in Xen doesn't care of the name. It just 
looks for any node in chosen up to depth 3. So anyone could create a 
node "bar" to group everything together.

> 
> Otherwise we could try to add a "modules" node to the description with a
> compatible string and a comment saying certain legacy versions might not
> have a compatible string.

I am not really in favor of introducing a new compatible because it will 
never be used by Xen (or anyone else).

So if the compatible is mandatory, then I would prefer to deprecate the 
use in the next release (we could add a warning).

Cheers,

-- 
Julien Grall

