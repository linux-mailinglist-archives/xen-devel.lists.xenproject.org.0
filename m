Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508448C303B
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 10:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720239.1123319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5i0J-0002hM-Uu; Sat, 11 May 2024 08:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720239.1123319; Sat, 11 May 2024 08:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5i0J-0002ey-Rh; Sat, 11 May 2024 08:22:51 +0000
Received: by outflank-mailman (input) for mailman id 720239;
 Sat, 11 May 2024 08:22:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5i0I-0002es-Ma
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 08:22:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5i0I-00037b-Bs; Sat, 11 May 2024 08:22:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5i0I-0004cu-2P; Sat, 11 May 2024 08:22:50 +0000
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
	bh=w7+1Ax8sDLaEv0ZjTTR00m0X/003BDMxt3SFxsvnG1E=; b=GdJvMwFeO6pA6GpggeOCDw0iYF
	orfv7BsPjDQzyUu6vKJlhGdWYm8+hDpE6YWRKB+RBEB2gkWu0Cn/baNTvzqfxTFaBGuZRcwALrwf+
	VkbbUAHmWHPKiYmg4id+HHto7E4+6iEynggqOyoI/7YaN49ptqfwnMB3ta8ds7HLqptc=;
Message-ID: <f2580cb8-c391-43c7-9696-200f9633dd4a@xen.org>
Date: Sat, 11 May 2024 09:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
 <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
 <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
 <ff5e2477-ed5a-40cd-a592-5ceb3bc8f1f1@amd.com>
 <1ad2c873-219c-4d96-82d6-e1bc58216f2d@xen.org>
 <1e9c6513-8e45-4202-a25e-bc342072d6cd@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <1e9c6513-8e45-4202-a25e-bc342072d6cd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 11/05/2024 08:29, Henry Wang wrote:
>>> +        /*
>>> +         * Handle the LR where the physical interrupt is de-assigned 
>>> from the
>>> +         * guest before it was EOIed
>>> +         */
>>> +        struct vcpu *v_target = vgic_get_target_vcpu(d->vcpu[0], virq);
>>
>> This will return a vCPU from the current affinity. This may not be 
>> where the interrupt was injected. From a brief look, I can't tell 
>> whether we have an easy way to know where the interrupt was injected 
>> (other than the pending_irq is in the list lr_queue/inflight)
> 
> I doubt if we need to handle more than this - I think if the pending_irq 
> is not in the lr_queue/inflight list, it would not belong to the corner 
> case we are talking about (?).

I didn't suggest we would need to handle the case where the pending_irq 
is not any of the queues. I was pointing out that I think we don't 
directly store the vCPU ID where we injected the IRQ. Instead, the 
pending_irq is just in list, so we will possibly need to store the vCPU 
ID for convenience.

Cheers,

-- 
Julien Grall

