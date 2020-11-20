Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53482BA523
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 09:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31763.62420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Bp-0006lq-DO; Fri, 20 Nov 2020 08:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31763.62420; Fri, 20 Nov 2020 08:54:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Bp-0006lQ-9k; Fri, 20 Nov 2020 08:54:45 +0000
Received: by outflank-mailman (input) for mailman id 31763;
 Fri, 20 Nov 2020 08:54:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg2Bn-0006lL-Sj
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:54:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5216c461-8419-430e-baf4-b7372db2030d;
 Fri, 20 Nov 2020 08:54:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01C40AC0C;
 Fri, 20 Nov 2020 08:54:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg2Bn-0006lL-Sj
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:54:43 +0000
X-Inumbo-ID: 5216c461-8419-430e-baf4-b7372db2030d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5216c461-8419-430e-baf4-b7372db2030d;
	Fri, 20 Nov 2020 08:54:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605862482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kD70W5EcwNqUsQIyuK1wkz18oD2obhSJVK0u83cr1xs=;
	b=hitXLS5bF22P5N7CUPyHcgORTK04OXFp7YaSAm75JNSRBD1jPlGdV61TdUpctibRyAvQEh
	3IBesbjD+olv1oHWVwbllKkEqLkwRlKc8jD0yBf9ixvW8zFxjJ/gZ5fYAP/+AcLLkDPeG2
	htncPqHWlTG/Z0MmhQSVHKbD07L4scc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 01C40AC0C;
	Fri, 20 Nov 2020 08:54:42 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e637a72-085d-45b9-aa5c-01e138c81875@suse.com>
Date: Fri, 20 Nov 2020 09:54:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.11.2020 09:28, Roger Pau Monné wrote:
> On Fri, Nov 20, 2020 at 09:09:51AM +0100, Jan Beulich wrote:
>> On 19.11.2020 18:57, Manuel Bouyer wrote:
>>> I added an ASSERT() after the printf to ket a stack trace, and got:
>>> db{0}> call ioapic_dump_raw^M
>>> Register dump of ioapic0^M
>>> [  13.0193374] 00 08000000 00170011 08000000(XEN) vioapic.c:141:d0v0 apic_mem_readl:undefined ioregsel 3
>>> (XEN) vioapic.c:512:vioapic_irq_positive_edge: vioapic_deliver 2
>>> (XEN) Assertion '!print' failed at vioapic.c:512
>>> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
>>> (XEN) CPU:    0
>>> (XEN) RIP:    e008:[<ffff82d0402c4164>] vioapic_irq_positive_edge+0x14e/0x150
>>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
>>> (XEN) rax: ffff82d0405c806c   rbx: ffff830836650580   rcx: 0000000000000000
>>> (XEN) rdx: ffff8300688bffff   rsi: 000000000000000a   rdi: ffff82d0404b36b8
>>> (XEN) rbp: ffff8300688bfde0   rsp: ffff8300688bfdc0   r8:  0000000000000004
>>> (XEN) r9:  0000000000000032   r10: 0000000000000000   r11: 00000000fffffffd
>>> (XEN) r12: ffff8308366dc000   r13: 0000000000000022   r14: ffff8308366dc31c
>>> (XEN) r15: ffff8308366d1d80   cr0: 0000000080050033   cr4: 00000000003526e0
>>> (XEN) cr3: 00000008366c9000   cr2: 0000000000000000
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>> (XEN) Xen code around <ffff82d0402c4164> (vioapic_irq_positive_edge+0x14e/0x150):
>>> (XEN)  3d 10 be 1d 00 00 74 c2 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 53 48
>>> (XEN) Xen stack trace from rsp=ffff8300688bfdc0:
>>> (XEN)    0000000200000086 ffff8308366dc000 0000000000000022 0000000000000000
>>> (XEN)    ffff8300688bfe08 ffff82d0402bcc33 ffff8308366dc000 0000000000000022
>>> (XEN)    0000000000000001 ffff8300688bfe40 ffff82d0402bd18f ffff830835a7eb98
>>> (XEN)    ffff8308366dc000 ffff830835a7eb40 ffff8300688bfe68 0100100100100100
>>> (XEN)    ffff8300688bfea0 ffff82d04026f6e1 ffff830835a7eb30 ffff8308366dc0f4
>>> (XEN)    ffff830835a7eb40 ffff8300688bfe68 ffff8300688bfe68 ffff82d0405cec80
>>> (XEN)    ffffffffffffffff ffff82d0405cec80 0000000000000000 ffff82d0405d6c80
>>> (XEN)    ffff8300688bfed8 ffff82d04022b6fa ffff83083663f000 ffff83083663f000
>>> (XEN)    0000000000000000 0000000000000000 0000000a7c62165b ffff8300688bfee8
>>> (XEN)    ffff82d04022b798 ffff8300688bfe08 ffff82d0402a4bcb 0000000000000000
>>> (XEN)    0000000000000206 ffff8316da86e61c ffff8316da86e600 ffff938031fd47c0
>>> (XEN)    0000000000000003 0000000000000400 ff889e8da08f928a 0000000000000000
>>> (XEN)    0000000000000002 0000000000000100 000000000000b86e ffff93803237f010
>>> (XEN)    0000000000000000 ffff8316da86e61c 0000beef0000beef ffffffff80555918
>>> (XEN)    000000bf0000beef 0000000000000046 ffff938031fd4790 000000000000beef
>>> (XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
>>> (XEN)    0000e01000000000 ffff83083663f000 0000000000000000 00000000003526e0
>>> (XEN)    0000000000000000 0000000000000000 0000060100000001 0000000000000000
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d0402c4164>] R vioapic_irq_positive_edge+0x14e/0x150
>>> (XEN)    [<ffff82d0402bcc33>] F arch/x86/hvm/irq.c#assert_gsi+0x5e/0x7b
>>> (XEN)    [<ffff82d0402bd18f>] F hvm_gsi_assert+0x62/0x77
>>> (XEN)    [<ffff82d04026f6e1>] F drivers/passthrough/io.c#dpci_softirq+0x261/0x29e
>>> (XEN)    [<ffff82d04022b6fa>] F common/softirq.c#__do_softirq+0x8a/0xbf
>>> (XEN)    [<ffff82d04022b798>] F do_softirq+0x13/0x15
>>> (XEN)    [<ffff82d0402a4bcb>] F vmx_asm_do_vmentry+0x2b/0x30
>>> (XEN) 
>>> (XEN) 
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Assertion '!print' failed at vioapic.c:512
>>> (XEN) ****************************************
>>
>> Right, this was the expected path after what you've sent prior to this.
>> Which turned my attention back to the 'i' debug key output you had sent
>> the other day. There we have
>>
>> (XEN)    IRQ:  34 vec:51 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
>>
>> i.e. at that point we're waiting for Dom0 to signal it's done handling
>> the IRQ. There is, however, a timer associated with this. Yet that's
>> actually to prevent the system getting stuck, i.e. the "in-flight"
>> state ought to clear 1ms later (when that timer expires), and hence
>> ought to be pretty unlikely to catch when non-zero _and_ something's
>> actually stuck.
> 
> I somehow assumed the interrupt was in-flight because the printing to
> the Xen console caused one to be injected, and thus dom0 didn't had
> time to Ack it yet.

By "injected" you mean from Xen into Dom0, or by the hardware for Xen
to handle? (I ask because I think I saw you use the term also for the
latter case, in some context.) If the former, then something would
need to have caused Xen to inject it, while in the latter case there
would need to have been a reason that it didn't get delivered earlier.

From the stack trace above the only possibility I could derive for
now would be that we didn't run softirqs for a long time, but I don't
think that's very realistic here. Otoh, Manuel, does the NMI watchdog
work on that system? It certainly wouldn't hurt if you turned it on,
just in case.

Jan

