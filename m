Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE243DF30
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217844.378043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2xM-0002JW-Hm; Thu, 28 Oct 2021 10:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217844.378043; Thu, 28 Oct 2021 10:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2xM-0002H2-E0; Thu, 28 Oct 2021 10:48:24 +0000
Received: by outflank-mailman (input) for mailman id 217844;
 Thu, 28 Oct 2021 10:48:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg2xK-0002Gw-Rb
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:48:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg2xJ-0005Pp-E0; Thu, 28 Oct 2021 10:48:21 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg2xJ-0000FV-7M; Thu, 28 Oct 2021 10:48:21 +0000
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
	bh=eYZYMJPfUDtKec0PE+3l3jBDCoirZbSHATOkABGhIBE=; b=TuwOsuB19lNkWCSAGWuiPfTdnL
	6y4yeCWVXb/gCvXegjXiaYw7nxrzsXq+VME+yPonJKbGVrCYHYa6ptZFzJEcn1vYr41fWy0IXY7pz
	P3+aj2yDP2SsZR7UCPgnPuDJxyibWt2KiXqb8jA+LEUvHEiqlTU6UfZXsokG9jj9lExY=;
Message-ID: <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
Date: Thu, 28 Oct 2021 11:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211027083730.1406947-1-andr2000@gmail.com>
 <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
 <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/10/2021 00:57, Stefano Stabellini wrote:
> On Wed, 27 Oct 2021, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 27/10/2021 09:37, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> If a PCI host bridge device is present in the device tree, but is
>>> disabled, then its PCI host bridge driver was not instantiated.
>>> This results in the following panic during Xen start:
>>>
>>> (XEN) Device tree generation failed (-22).
>>
>> It would good to clarify in the commit message where the error is coming from.
>> I think this is from pci_get_host_bridge_segment().
>>
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Could not set up DOM0 guest OS
>>> (XEN) ****************************************
>>>
>>> Fix this by not adding linux,pci-domain property for hwdom if it is
>>> neither available nor device enabled.
>>  From my reading of the binding [1], the property should be present in all the
>> hostbridges if one specify it. IOW, I think the property should also be added
>> for hostbridges that are not available.
> 
> Just wanted to say that I think you are right:
> 
> """
> It is required to either not set this property at all or set it for all
> host bridges in the system, otherwise potentially conflicting domain numbers
> may be assigned to root buses behind different host bridges.  The domain
> number for each host bridge in the system must be unique.
> """
> 
> and I am ready to believe device trees with disabled bridges might have
> (incorrectly) ignored the rule.

Looking at linux/arch/arm64/boot/dts/, there are a few Device-Tree that 
contain the property "linux,pci-domain". All of them seems to also add 
it for disabled hostbridges.

However, I am under the impression that it is more common to have a 
Devide-Tree without any property "linux,pci-domain". When PCI support is 
enabled, Xen will generate the domain ID for the hostbridge and write it 
to the DT.

This doesn't work for disabled hostbridge and I think this is 
Oleksandr's problem. @Oleksandr can you confirm it?

> 
> 
>> AFAICT, Linux will ignore hostbridge that are not available. But it feels to
>> me we are twisting the rule. So, could we consider to allocate an unused
>> number?
> 
> I think that would be fine but it doesn't look easy from the current Xen
> code point of view because the allocation depends on the Xen driver,
> which we don't have. But I'll let others comment on it.
So what matters is Xen doesn't make things worse. We have two cases to care:
   1) Xen only has drivers for a part of the hostbriges
   2) Some hostbriges are disabled

Case 1) will definitely generate a DT that will make Linux unhappy if we 
have don't add the property consistently.

I believe that in case 2), current Linux will not check for the 
consistency. But that something, we probably should avoid to rely on.

I think in the two cases we can generate the domain ID by calling 
pci_get_new_domain_nr().

Now if we have to support inconsistent device-tree. Then we could 
collect the "linux,pci-domain" and find the maximum one. We would 
allocate a number above for any hostbridges with no property.

> Otherwise
> skipping the disabled host bridge node for Dom0 sounds OK.

At the moment, I haven't found any example of Device-Tree where 
"linux,pci-domain" will be only on part of the hostbridges (see above).

So I think we should avoid breaking the rule here at least until we have 
a "real" DT that break it.

Cheers,

-- 
Julien Grall

