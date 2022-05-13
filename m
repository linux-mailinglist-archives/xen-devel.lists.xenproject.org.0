Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709645268A6
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 19:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328660.551736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZHy-0001qo-9L; Fri, 13 May 2022 17:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328660.551736; Fri, 13 May 2022 17:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZHy-0001od-6P; Fri, 13 May 2022 17:41:18 +0000
Received: by outflank-mailman (input) for mailman id 328660;
 Fri, 13 May 2022 17:41:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npZHw-0001oX-QZ
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 17:41:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npZHw-0005ek-68; Fri, 13 May 2022 17:41:16 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.8.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npZHv-0005vq-Va; Fri, 13 May 2022 17:41:16 +0000
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
	bh=8fOpbeIsstYvBhgFsEZL6GowsKX0Tmj2mfCTkzGSJEU=; b=1aVAUmYQoR+blZC+fD5+aEZ94Y
	h6iNF8l8oVcPKJCZ6gYqYAOv6YPCOLeevDB6AsBLA1uW3989FhOPymYOUejWf3hHX05MJqXME/nfR
	sfy13Zr9lUCIsrYIq2wvAz8R2L72zv/6BYCFFGtgFg4nk0XiODeh5TDjwquiBqBU7+Uw=;
Message-ID: <d2825078-fa8c-4c08-b8f5-f98853cff4e2@xen.org>
Date: Fri, 13 May 2022 18:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 04/36] xen/arm: add parsing function for cache coloring
 configuration
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-5-marco.solieri@minervasys.tech>
 <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
 <7acb1709-344d-6995-ee9d-df6652d505b5@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7acb1709-344d-6995-ee9d-df6652d505b5@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/05/2022 15:22, Carlo Nonato wrote:
> Hi Julien,

Hi Carlo,

> I'm Carlo, the new developer that will work on this patch set and on the 
> review.
> 
> Thanks for all the comments. I'll try to answer to all the open points 
> and also
> ask for feedback.
> 
> On 09/03/22 20:09, Julien Grall wrote:
>>> - way_size: The size of a LLC way in bytes. This value is mainly used
>>>    to calculate the maximum available colors on the platform.
>>
>> We should only add command line option when they are a strong use 
>> case. In documentation, you wrote that someone may want to overwrite 
>> the way size for "specific needs".
>>
>> Can you explain what would be those needs?
> This parameter is here mainly to support QEMU on which the automatic 
> probing
> of the LLC size doesn't work properly.

I am not in favor of adding command line option just for QEMU. But...

> 
> Also, since from this value we compute the maximum number of colors
> the architecture supports, you may want to fix the way size so as to 
> simulate
> a different use case for debugging purposes.

... this reason is more compelling to me.

> 
> Should I add those notes somewhere (doc, commit messages, etc.)?

So I would mention it in the commit message and also the doc description 
the options.

> 
>>> A cache coloring configuration consists of a selection of colors to be
>>> assigned to a VM or to the hypervisor. It is represented by a set of
>>> ranges. Add a common function that parses a string with a
>>> comma-separated set of hyphen-separated ranges like "0-7,15-16" and
>>> returns both: the number of chosen colors, and an array containing their
>>> ids.
>>> Currently we support platforms with up to 128 colors.
>>
>> Is there any reason this value is hardcoded in Xen rather than part of 
>> the Kconfig?
> Having another parameter to configure can complicate things from
> the user perspective. 

I don't think it would be more complicated. The default would still be 
128 and would help the user to easily modify the value if...

> Also 128 is more than enough for the current ARM
> processors we tested.

... they are using a processor you didn't tested on.

>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> ---
>>>   xen/arch/arm/Kconfig                |   5 ++
>>>   xen/arch/arm/Makefile               |   2 +-
>>>   xen/arch/arm/coloring.c             | 131 ++++++++++++++++++++++++++++
>>>   xen/arch/arm/include/asm/coloring.h |  28 ++++++
>>>   4 files changed, 165 insertions(+), 1 deletion(-)
>>>   create mode 100644 xen/arch/arm/coloring.c
>>>   create mode 100644 xen/arch/arm/include/asm/coloring.h
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index ecfa6822e4..f0f999d172 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -97,6 +97,11 @@ config HARDEN_BRANCH_PREDICTOR
>>>           If unsure, say Y.
>>>   +config COLORING
>>> +    bool "L2 cache coloring"
>>> +    default n
>>
>> This wants to be gated with EXPERT for time-being. SUPPORT.MD woudl
>> Furthermore, I think this wants to be gated with EXPERT for the 
>> time-being.
>>
>>> +    depends on ARM_64
>>
>> Why is this limited to arm64?
> Because arm32 isn't an "interesting" architecture where to have coloring
> since there are locking primitives that provides sufficient isolation 
> and so
> the problem is not common.

I am afraid I don't understand this rationale. What sort of locking are 
you talking about?

That said,I am not asking to implement the 32-bit side. I am more 
interested to know what's the effort required here. IOW, is it disabled 
because you haven't tested?

Cheers,

-- 
Julien Grall

