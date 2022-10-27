Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378960FCC1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 18:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431109.683672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5W9-0002xz-2K; Thu, 27 Oct 2022 16:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431109.683672; Thu, 27 Oct 2022 16:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5W8-0002v1-Vd; Thu, 27 Oct 2022 16:14:04 +0000
Received: by outflank-mailman (input) for mailman id 431109;
 Thu, 27 Oct 2022 16:14:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oo5W7-0002uv-Gf
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 16:14:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo5W6-0006ut-Qs; Thu, 27 Oct 2022 16:14:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.29.62]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo5W6-0001sC-J8; Thu, 27 Oct 2022 16:14:02 +0000
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
	bh=p6FcUrUAjFlgLyeMzrQKMRmJMrda8ARnEbFOy76cSkI=; b=s7oCLHpYdehkH6iOmAMKTpsocq
	TYChheapaq9EjTGjRnE24IPhaHwam7PAvxHn6eDq1JOHqit7A0GMNsvhlM3EegcDsIMtI7cbHG3iu
	zc8dbVTPCwv/oLfvVOKwUtnYzVVwOl8fFfNrfmo9gFb1Gr1LhjxuSBKgZ6VNmEk4pvK8=;
Message-ID: <d9779975-9b47-bc3f-7cb0-508165ebc707@xen.org>
Date: Thu, 27 Oct 2022 17:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 Henry.Wang@arm.com
References: <20221026183004.7293-1-ayankuma@amd.com>
 <20221027104231.77c5cd28@donnerap.cambridge.arm.com>
 <da52b703-5de7-1673-f6a1-d6541f59f5cd@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <da52b703-5de7-1673-f6a1-d6541f59f5cd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27/10/2022 16:40, Ayan Kumar Halder wrote:
> 
> On 27/10/2022 10:44, Andre Przywara wrote:
>> On Wed, 26 Oct 2022 19:30:04 +0100
>> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi,
> 
> Hi Andre,

Hi,

> I need a clarification.

I am not Andre but will answer :).

[...]

>>>           /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
>>>           if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
>>>           {
>>> -            reg = v->arch.vgic.rdist_pendbase;
>>> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
>>>               vreg_reg64_update(&reg, r, info);
>>>               reg = sanitize_pendbaser(reg);
>>> -            v->arch.vgic.rdist_pendbase = reg;
>>> +            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>>>           }
>>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
> 
> Shouldn't this be "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" ?

Good catch. Yes it does. The current code will clear DAIF (even if 
irqsave touch only I). The I/O emulation is done with interrupts enabled 
usually, so now they are going to be unhandled until 
leave_hypervisor_to_guest().

This could be a "very" long time. Thankfully ITS is experimental, 
otherwise I would have considered this a potential security issue.

Can you send a separate patch for that?

Cheers,

-- 
Julien Grall

