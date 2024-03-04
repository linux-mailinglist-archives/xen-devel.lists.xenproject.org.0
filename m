Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D867B870FEE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 23:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688535.1072770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhGau-0003Jc-Uj; Mon, 04 Mar 2024 22:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688535.1072770; Mon, 04 Mar 2024 22:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhGau-0003I6-Rt; Mon, 04 Mar 2024 22:15:36 +0000
Received: by outflank-mailman (input) for mailman id 688535;
 Mon, 04 Mar 2024 22:15:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhGat-0003Hz-B9
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 22:15:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhGas-0001Y4-W0; Mon, 04 Mar 2024 22:15:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhGas-0007eb-Np; Mon, 04 Mar 2024 22:15:34 +0000
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
	bh=4SIzGA5dhCL6/TFze2sr+Z62EdHV7hyf9qgQqs3tcuA=; b=vDXvUAadIGLN8s8OVY2OVNclLC
	HDXXWEG1CRl2pY5LZB0/8YHlSCL2uF9t2xZooOjMOzpq1zBe4WpMW9HHmXfcAUoU8Vni3w8gVAi2d
	sQmWNtojYj436VXDLtDsLKCCKKQS2xl+ZLNfFaJ4pqiizWkL4K0lVoZRXpJIJfRFyDzI=;
Message-ID: <1aa294ec-704c-4370-94c5-54573ed82af6@xen.org>
Date: Mon, 4 Mar 2024 22:15:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-GB
To: Paul Leiber <paul@onlineschubla.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.dunlap@cloud.com,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <4d7dbce9-ef20-4702-8056-9d5ab8152721@onlineschubla.de>
 <a5ad8772-01eb-4a84-93e2-c96c3b72fa48@xen.org>
 <d99853d8-fae4-4710-87cb-d74fd1377a03@onlineschubla.de>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d99853d8-fae4-4710-87cb-d74fd1377a03@onlineschubla.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 01/03/2024 19:37, Paul Leiber wrote:
> Stopping xen-watchdog prevents the reboot. However, when triggering 
> traffic on the VLAN, Dom0 and DomU become completely unresponsive. No 
> error or kernel message is printed in the serial console.

Thanks for providing some logs. See some comments below. How long did 
you wait before confirming dom0 is stucked?

IIRC, Linux may print some RCU stall logs after a few minutes.

> 
> Switching to Xen console works. Pressing '0' produces the following output:
> 
> (XEN) '0' pressed -> dumping Dom0's registers
> (XEN) *** Dumping Dom0 vcpu#0 state: ***
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
> (XEN) CPU:    0
> (XEN) PC:     ffff800008027e50
> (XEN) LR:     ffff800008027e44
> (XEN) SP_EL0: ffff800009c78f80
> (XEN) SP_EL1: ffff800008003b60
> (XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)

[...]

> (XEN) *** Dumping Dom0 vcpu#1 state: ***
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
> (XEN) CPU:    0
> (XEN) PC:     ffff800008c5dc80
> (XEN) LR:     ffff800008c5dc88
> (XEN) SP_EL0: ffff000042272080
> (XEN) SP_EL1: ffff80000800b0e0
> (XEN) CPSR:   0000000080000305 MODE:64-bit EL1h (Guest Kernel, handler)

[...]

> (XEN) *** Dumping Dom0 vcpu#2 state: ***
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
> (XEN) CPU:    0
> (XEN) PC:     ffff800008027e50
> (XEN) LR:     ffff800008027e44
> (XEN) SP_EL0: ffff000042271040
> (XEN) SP_EL1: ffff800009fcbf20
> (XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)

[...]

> (XEN) *** Dumping Dom0 vcpu#3 state: ***
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
> (XEN) CPU:    0
> (XEN) PC:     ffff800008027e50
> (XEN) LR:     ffff800008027e44
> (XEN) SP_EL0: ffff0000422730c0
> (XEN) SP_EL1: ffff800009fd3f20
> (XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)

All the PCs but one (vcpu#1) are the same.

> (XEN) 'q' pressed -> dumping domain info (now = 727929105981)
> (XEN) General information for domain 0:
> (XEN)     refcnt=3 dying=0 pause_count=0
> (XEN)     nr_pages=262144 xenheap_pages=2 dirty_cpus={} max_pages=262144
> (XEN)     handle=00000000-0000-0000-0000-000000000000 vm_assist=00000020
> (XEN) p2m mappings for domain 0 (vmid 1):
> (XEN)   1G mappings: 0 (shattered 1)
> (XEN)   2M mappings: 422 (shattered 90)
> (XEN)   4K mappings: 45372
> (XEN) Rangesets belonging to domain 0:
> (XEN)     Interrupts { 32-152, 154-255 }
> (XEN)     I/O Memory { 0-fe200, fe203-ff841, ff849-ffffffffffffffff }
> (XEN) NODE affinity for domain 0: [0]
> (XEN) VCPU information and callbacks for domain 0:
> (XEN)   UNIT0 affinities: hard={0-3} soft={0-3}
> (XEN)     VCPU0: CPU3 [has=F] poll=0 upcall_pend=01 upcall_mask=01
> (XEN)     pause_count=0 pause_flags=1

The vCPU is blocked. But...

> (XEN) GICH_LRs (vcpu 0) mask=f
> (XEN)    VCPU_LR[0]=2a000002
> (XEN)    VCPU_LR[1]=1a00001b
> (XEN)    VCPU_LR[2]=1a000001
> (XEN)    VCPU_LR[3]=1a000010

... it loosk like multiple IRQs are inflights. LR0 (holding IRQ2) is 
active but the others are pending. This is the same for vCPU #2, #3. 
vCPU #1 still seems to "work".

AFAICT, Linux is using IRQ2 for the IPI CPU_STOP. So it sounds like dom0 
may have panicked.

Looking at the initial logs you posted. I see some messages from Xen but 
no messages at all from dom0 (including boot). Can you check if you have 
console=hvc0 on the Linux command line?

If not, please add it and retry.

Cheers,

-- 
Julien Grall

