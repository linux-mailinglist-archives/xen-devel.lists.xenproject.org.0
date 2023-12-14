Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D05812A74
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654320.1021101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDh94-00028i-Fi; Thu, 14 Dec 2023 08:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654320.1021101; Thu, 14 Dec 2023 08:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDh94-00026Z-Bs; Thu, 14 Dec 2023 08:32:38 +0000
Received: by outflank-mailman (input) for mailman id 654320;
 Thu, 14 Dec 2023 08:32:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDh92-00026T-AP
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:32:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDh8v-0005zu-UR; Thu, 14 Dec 2023 08:32:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDh8v-0007UL-Kb; Thu, 14 Dec 2023 08:32:29 +0000
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
	bh=mAG6MS2EG+y0rzmVJUdz8USHN0/TqwyiFdGtMbjPins=; b=unDm856o7NIKXSboWoaTrRDfO9
	BRX6AdmytVVzdXReRXbA1k2xuG4bIUBM+wkpIF0dnuMSk/WrtwbloE5PS2bDpQ2roIomS8TxDNp1v
	LUGXwBQhxtJMLM5FlZmSNEhoxIq4g697WA7U0lpC4VFtQuN/qfT53sgvk98Gh4PaF4yU=;
Message-ID: <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
Date: Thu, 14 Dec 2023 08:32:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/12/2023 07:53, Jan Beulich wrote:
> On 14.12.2023 03:05, Stefano Stabellini wrote:
>> On Wed, 13 Dec 2023, Jan Beulich wrote:
>>> On 11.12.2023 10:14, Nicola Vetrini wrote:
>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>> @@ -2,8 +2,9 @@
>>>>   #define __ARCH_ARM_NUMA_H
>>>>   
>>>>   #include <xen/mm.h>
>>>
>>> With this, ...
>>>
>>>> +#include <xen/types.h>
>>>>   
>>>> -typedef u8 nodeid_t;
>>>> +typedef uint8_t nodeid_t;
>>>>   
>>>>   #ifndef CONFIG_NUMA
>>>>   
>>>> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
>>>>   #define node_to_cpumask(node)   (cpu_online_map)
>>>>   
>>>>   /*
>>>> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>>>> - * is required because the dummy helpers are using it.
>>>> + * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
>>>> + * this is required because the dummy helpers are using it.
>>>>    */
>>>> -extern mfn_t first_valid_mfn;
>>>
>>> ... and this declaration moved to xen/mm.h, how is it going to be possible
>>> to do as the adjusted comment says? The compiler will choke on the static
>>> after having seen the extern.
>>
>> Nicola was just following a review comment by Julien. NUMA has been
>> pending for a while and I wouldn't hold this patch back because of it.
>> I suggest we go with Julien's request (this version of the patch).
>>
>> If you feel strongly about it, please suggest an alternative.
> 
> Leaving a TODO comment which cannot actually be carried out is just wrong
> imo. And I consider in unfair to ask me to suggest an alternative. The
> (imo obvious) alternative is to drop this patch, if no proper change can
> be proposed. There's nothing wrong with leaving a violation in place,
> when that violation is far from causing any kind of harm. The more that
> the place is already accompanied by a (suitable afaict) comment.

Just to clarify, are you saying you would be happy if the proposal if 
the TODO is removed?

Cheers,

-- 
Julien Grall

