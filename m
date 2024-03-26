Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E188D084
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 23:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698236.1089759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpExp-0006G4-FK; Tue, 26 Mar 2024 22:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698236.1089759; Tue, 26 Mar 2024 22:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpExp-0006DL-CP; Tue, 26 Mar 2024 22:08:13 +0000
Received: by outflank-mailman (input) for mailman id 698236;
 Tue, 26 Mar 2024 22:08:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rpExn-0006CT-Ng
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 22:08:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpExn-0006em-Ds; Tue, 26 Mar 2024 22:08:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpExn-0004UE-5U; Tue, 26 Mar 2024 22:08:11 +0000
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
	bh=PmZiu6h+NRrcIPtEyj9+wBBFtJL1lfxp6eHUB76tu7s=; b=EkGie+hxr2FiA8+5a0+nvcIwzT
	oDPCvNm3OC6G1FO/4z7WdAtPmh0UAic6HlEjeypAUQA+9U2E6oxhbtONx6hRik9yLk98u8AIZmOOI
	IQO0BwaXVFJQ+kQPrdh6Pm7d8ghqv3+0gHzHBw4Noakyy//hGODj2aNmHIQdTR9mrbCk=;
Message-ID: <d3679e6c-f877-4198-8423-26e9734bdd44@xen.org>
Date: Tue, 26 Mar 2024 22:08:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com> <ZfryIBR6RECujayD@macbook>
 <815d5bd4-18af-4f5f-b6a5-6302a1d682a2@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <815d5bd4-18af-4f5f-b6a5-6302a1d682a2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 20/03/2024 14:39, Andrew Cooper wrote:
> On 20/03/2024 2:26 pm, Roger Pau Monné wrote:
>> On Wed, Mar 20, 2024 at 02:06:27PM +0000, Andrew Cooper wrote:
>>> On 20/03/2024 1:57 pm, Roger Pau Monne wrote:
>>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>>> vcpu_info.
>>>>
>>>> Restrict the check against dummy_vcpu_info to only apply to PV guests.
>>>>
>>>> Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Thanks for looking into this.  But, do we actually need to force this on
>>> PV either?
>> Possibly, having now taken a look at the users it does seem they could
>> cope with unpopulated vcpu_info_area.
>>
>> Part of my understanding was that this was some kind of courtesy to PV
>> guests in order to prevent starting them without a vcpu_info, which
>> strictly speaking is not mandatory, but otherwise the guest vCPU won't
>> be able to receive interrupts, not even IPIs.
> 
> That's more of a stick than a carrot... "you must set up the area of a
> CPU before you can bring it online". Except as we've seen, HVM has been
> fine all along without it.
>>> The only interesting user of dummy_vcpu_info now is vcpu_info_populate()
>>> which can cope with any arbitrary vCPU.
>>>
>>> I have a suspicion that we can (now) delete these two checks, delete the
>>> dummy_vcpu_info object, and use a regular NULL pointer in
>>> vcpu_info_{populate,reset}(), and in doing so, remove one of the bigger
>>> pieces of PV-absurdity from Xen.
>> I was expecting this to be something we can backport.  OTOH removing
>> the check completely (or even getting rid of dummy_vcpu_info) is not
>> something that we would want to backport.
>>
>> I would rather do the removal of dummy_vcpu_info as followup work.
> 
> I was worried about ARM with your patch, because it's spelt HVM there,
> rather than PV.
> 
> However, I'd forgotten that ARM's do_vcpu_op() filters ops down to just
> VCPUOP_register_{vcpu_info,runstate_memory_area} so VCPUOP_initialise
> isn't reachable.
> 
> Therefore, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> It also means ARM can't use any of the PHYS registration yet...

Whoops. I don't think this was intended. Jan, I don't seem to find any 
use in Linux. Do you have any patches you could share? I would like to 
give a try on Arm before sending a patch?

Cheers,

-- 
Julien Grall

