Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0F53AC0B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340680.565768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSFq-0002Ml-9u; Wed, 01 Jun 2022 17:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340680.565768; Wed, 01 Jun 2022 17:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSFq-0002KD-7H; Wed, 01 Jun 2022 17:35:34 +0000
Received: by outflank-mailman (input) for mailman id 340680;
 Wed, 01 Jun 2022 17:35:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nwSFo-0002Jz-DL
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:35:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwSFm-00064G-MY; Wed, 01 Jun 2022 17:35:30 +0000
Received: from [54.239.6.189] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwSFm-0003hZ-Er; Wed, 01 Jun 2022 17:35:30 +0000
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
	bh=J0Av9ftFQoR40bCjcL7qGxFHMTNxq1BrXuURHuR68O0=; b=rjDlUhkcEGxe8jZF7psshcx/HV
	1y3HNMHfdI7Sqhr24C0yaWx/ju+UXh2Y01HGcIGM3xddx62bLC8Ggn7DceuzeYA1e1PoEwYfFjUss
	FTWShzsmjzUTPbJ5fbJlpR+Cts17MR3hjlz+tW9r6EMtoXHzAotVTj6MIgnLbklOuPAA=;
Message-ID: <337d6dbf-e8ee-5de7-a75e-97be815f4467@xen.org>
Date: Wed, 1 Jun 2022 18:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <ab531f8b-a602-22e0-dabf-c7d073c88236@xen.org>
 <be06db4d-43c4-7d24-db0d-349c0a1e4999@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <be06db4d-43c4-7d24-db0d-349c0a1e4999@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31/05/2022 11:53, Daniel P. Smith wrote:
> On 5/31/22 05:25, Julien Grall wrote:
>> Hi,
>>
>> On 31/05/2022 03:41, Daniel P. Smith wrote:
>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>> index f16eb0df43..57b14e22c9 100644
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -17,3 +17,15 @@ config NR_CPUS
>>>          For CPU cores which support Simultaneous Multi-Threading or
>>> similar
>>>          technologies, this the number of logical threads which Xen will
>>>          support.
>>> +
>>> +config NR_BOOTMODS
>>> +    int "Maximum number of boot modules that a loader can pass"
>>> +    range 1 64
>>
>> OOI, any reason to limit the size?
> 
> I modelled this entirely after NR_CPUS, which applied a limit

The limit for NR_CPUS makes sense because there are scalability issues 
after that (although 4095 seems quite high) and/or the HW impose a limit.

> , and it
> seemed reasonable to me at the time. I choose 64 since it was double
> currently what Arm had set for MAX_MODULES. As such, I have no hard
> reason for there to be a limit. It can easily be removed or adjusted to
> whatever the reviewers feel would be appropriate.

Ok. In which case I would drop the limit beause it also prevent a users 
to create more 64 dom0less domUs (actually a bit less because some 
modules are used by Xen). I don't think there are a strong reason to 
prevent that, right?

>>> +    default "8" if X86
>>> +    default "32" if ARM
>>> +    help
>>> +      Controls the build-time size of various arrays allocated for
>>> +      parsing the boot modules passed by a loader when starting Xen.
>>> +
>>> +      This is of particular interest when using Xen's hypervisor domain
>>> +      capabilities such as dom0less.
>>> diff --git a/xen/arch/arm/include/asm/setup.h
>>> b/xen/arch/arm/include/asm/setup.h
>>> index 2bb01ecfa8..312a3e4209 100644
>>> --- a/xen/arch/arm/include/asm/setup.h
>>> +++ b/xen/arch/arm/include/asm/setup.h
>>> @@ -10,7 +10,8 @@
>>>      #define NR_MEM_BANKS 256
>>>    -#define MAX_MODULES 32 /* Current maximum useful modules */
>>> +/* Current maximum useful modules */
>>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>>
>> There are only a handful number of use of MAX_MODULES in Arm. So I would
>> prefer if we replace all the use with CONFIG_NR_BOOTMODS.
> 
> No problem, as I stated above, I mimicked what was done for NR_CPUS
> which did a similar #define for MAX_CPUS.

Thanks!

Cheers,

-- 
Julien Grall

