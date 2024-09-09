Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF69724B2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 23:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794899.1203929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snmL9-0003ex-HI; Mon, 09 Sep 2024 21:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794899.1203929; Mon, 09 Sep 2024 21:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snmL9-0003ca-E5; Mon, 09 Sep 2024 21:54:31 +0000
Received: by outflank-mailman (input) for mailman id 794899;
 Mon, 09 Sep 2024 21:54:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snmL7-0003cU-TS
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 21:54:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snmL6-0008Lr-PV; Mon, 09 Sep 2024 21:54:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snmL6-0008GA-JN; Mon, 09 Sep 2024 21:54:28 +0000
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
	bh=pyaskIcghDCJA0nbYHLLAMbkbu9cV4Q4iBQKHk2E97c=; b=X+Neu0nC7JrLL9w6kimfG/3lwI
	1h3RwkKGF49iSViqiTKZYYrhEgZRRl20aLcpp6y/8ho65qEg3S1KC0deNiyI5XytINsti2bcM4+gG
	Yf/RP3iRgCrZRCiBqoPQUI/c4PHsJ2VaIs+1UZRqoK90E6PkrYn0/P0VP9ps8h88VgvY=;
Message-ID: <fecef960-ea6f-48fd-977c-9456f703a31f@xen.org>
Date: Mon, 9 Sep 2024 22:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM/vgic: Use for_each_set_bit() in vgic-mmio*
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
 <20240902100355.3032079-5-andrew.cooper3@citrix.com>
 <c33b1051-2a51-4843-8fb5-6710d0e4ba91@amd.com>
 <47679a69-660b-49d9-a8c5-4d7ddb2bfbe5@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <47679a69-660b-49d9-a8c5-4d7ddb2bfbe5@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/09/2024 14:19, Andrew Cooper wrote:
> On 03/09/2024 11:30 am, Michal Orzel wrote:
>>
>> On 02/09/2024 12:03, Andrew Cooper wrote:
>>>
>>> These are all loops over a scalar value, and don't need to call general bitop
>>> helpers behind the scenes.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Slighly RFC.  It's unclear whether len is the size of the register, or the
>>> size of the access.  For sub-GPR accesses, won't the upper bits be clear
>>> anyway?  If so, this can be simplified further.
>> See dispatch_mmio_write(). "len" refers to access size (i.e. 1/4/8 bytes). Each register is defined
>> with a region access i.e. VGIC_ACCESS_32bit that is compared with the actual access. In the current code
>> there is no register with 8B access. If there is a mismatch, there will be a data abort injected.
>> Also, the top 32-bits are not cleared anywhere, so I don't think we can drop masking. @Julien?

That's correct, there are no masking in the I/O dispatch helpers.

> 
> Ok, so it is necessary right now to have the clamping logic in every
> callback.
> 
> However, given that the size is validated before dispatching, clamping
> once in dispatch_mmio_write() would save a lot of repeated code in the
> callbacks.
> 
> i.e., I think this:
> 
> diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
> index bd4caf7fc326..e8b9805a0b2c 100644
> --- a/xen/arch/arm/vgic/vgic-mmio.c
> +++ b/xen/arch/arm/vgic/vgic-mmio.c
> @@ -590,6 +590,9 @@ static int dispatch_mmio_write(struct vcpu *vcpu,
> mmio_info_t *info,
>       if ( !region )
>           return 0;
>   
> +    if ( len < sizeof(data) )
> +        data &= ~((1UL << (len * 8)) - 1);
> +

I think it would make sense to move the masking one level higher in 
handle_write() (arch/arm/io.c). So this would cover all the emulation 
helpers.

Cheers,

-- 
Julien Grall

