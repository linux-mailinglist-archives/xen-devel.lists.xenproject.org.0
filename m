Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38B2B9A39
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31268.61619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfoBs-0005ba-32; Thu, 19 Nov 2020 17:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31268.61619; Thu, 19 Nov 2020 17:57:52 +0000
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
	id 1kfoBr-0005bB-VN; Thu, 19 Nov 2020 17:57:51 +0000
Received: by outflank-mailman (input) for mailman id 31268;
 Thu, 19 Nov 2020 17:57:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdOd=EZ=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kfoBp-0005b6-Sq
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:57:49 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f78bed2c-2f26-46d2-aeed-59c4fa4293f2;
 Thu, 19 Nov 2020 17:57:47 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AJHvcWQ024042
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 18:57:39 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 35A302E9CA8; Thu, 19 Nov 2020 18:57:33 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kdOd=EZ=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kfoBp-0005b6-Sq
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:57:49 +0000
X-Inumbo-ID: f78bed2c-2f26-46d2-aeed-59c4fa4293f2
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f78bed2c-2f26-46d2-aeed-59c4fa4293f2;
	Thu, 19 Nov 2020 17:57:47 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AJHvcWQ024042
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2020 18:57:39 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 35A302E9CA8; Thu, 19 Nov 2020 18:57:33 +0100 (MET)
Date: Thu, 19 Nov 2020 18:57:33 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201119175733.GA6067@antioche.eu.org>
References: <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201119165734.GA4903@antioche.eu.org>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 19 Nov 2020 18:57:39 +0100 (MET)

On Thu, Nov 19, 2020 at 05:57:34PM +0100, Manuel Bouyer wrote:
> On Thu, Nov 19, 2020 at 04:57:18PM +0100, Manuel Bouyer wrote:
> > On Thu, Nov 19, 2020 at 03:19:15PM +0100, Roger Pau Monné wrote:
> > > I've got two different debug patches for you to try. I'm attaching both
> > > to this email but I think we should start with Jan's suggestion
> > > (conditional_print.patch). That patch will only print extra messages
> > > between the ioregsel 3 ... ioregsel f existing debug messages, you
> > > will have to trigger this from NetBSD by using ioapic_dump_raw AFAICT.
> > 
> > thanks. I didn't see any change in behavior or XEN output with this
> > patch (especially the vioapic_deliver string doesn't show up in the
> > logs).
> 
> I tried forcing print to 1, and I still don't see "vioapic_deliver" on the
> console. I changed the patch to:
> #define vioapic_deliver(vioapic, irq) ({\ 
>     if ( /* print && irq == 34 */ 1 ) \
>         printk("%s:%d:%s: vioapic_deliver %d\n", __FILE__, __LINE__, __func__, i
> rq); \
>     _vioapic_deliver(vioapic, irq); })
> 
> and got:
> [  13.8853432] ioapic2: pin2 0x0000a067 0x00000000^M
> [  13.8853432] mfii0: cmd timeout ccb 0xffff9780023b7d60 status 0x40000008^M
> (XEN) *** Serial input to Xen (type 'CTRL-a' three times to switch input)
> (XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
> [  17.0001093] mfii0: cmd aborted ccb 0xffff9780023b7d60^M
> (XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
> [  17.0217772] config_pending_decr: scsibus0 0^M
> (XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
> [  17.(XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
> 0417095] config_finalize 2185^M
> 
> So I guess that the interrupt delivery on XEN output is
> vioapic.c:511

I added an ASSERT() after the printf to ket a stack trace, and got:
db{0}> call ioapic_dump_raw^M
Register dump of ioapic0^M
[  13.0193374] 00 08000000 00170011 08000000(XEN) vioapic.c:141:d0v0 apic_mem_readl:undefined ioregsel 3
(XEN) vioapic.c:512:vioapic_irq_positive_edge: vioapic_deliver 2
(XEN) Assertion '!print' failed at vioapic.c:512
(XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d0402c4164>] vioapic_irq_positive_edge+0x14e/0x150
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
(XEN) rax: ffff82d0405c806c   rbx: ffff830836650580   rcx: 0000000000000000
(XEN) rdx: ffff8300688bffff   rsi: 000000000000000a   rdi: ffff82d0404b36b8
(XEN) rbp: ffff8300688bfde0   rsp: ffff8300688bfdc0   r8:  0000000000000004
(XEN) r9:  0000000000000032   r10: 0000000000000000   r11: 00000000fffffffd
(XEN) r12: ffff8308366dc000   r13: 0000000000000022   r14: ffff8308366dc31c
(XEN) r15: ffff8308366d1d80   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 00000008366c9000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0402c4164> (vioapic_irq_positive_edge+0x14e/0x150):
(XEN)  3d 10 be 1d 00 00 74 c2 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 53 48
(XEN) Xen stack trace from rsp=ffff8300688bfdc0:
(XEN)    0000000200000086 ffff8308366dc000 0000000000000022 0000000000000000
(XEN)    ffff8300688bfe08 ffff82d0402bcc33 ffff8308366dc000 0000000000000022
(XEN)    0000000000000001 ffff8300688bfe40 ffff82d0402bd18f ffff830835a7eb98
(XEN)    ffff8308366dc000 ffff830835a7eb40 ffff8300688bfe68 0100100100100100
(XEN)    ffff8300688bfea0 ffff82d04026f6e1 ffff830835a7eb30 ffff8308366dc0f4
(XEN)    ffff830835a7eb40 ffff8300688bfe68 ffff8300688bfe68 ffff82d0405cec80
(XEN)    ffffffffffffffff ffff82d0405cec80 0000000000000000 ffff82d0405d6c80
(XEN)    ffff8300688bfed8 ffff82d04022b6fa ffff83083663f000 ffff83083663f000
(XEN)    0000000000000000 0000000000000000 0000000a7c62165b ffff8300688bfee8
(XEN)    ffff82d04022b798 ffff8300688bfe08 ffff82d0402a4bcb 0000000000000000
(XEN)    0000000000000206 ffff8316da86e61c ffff8316da86e600 ffff938031fd47c0
(XEN)    0000000000000003 0000000000000400 ff889e8da08f928a 0000000000000000
(XEN)    0000000000000002 0000000000000100 000000000000b86e ffff93803237f010
(XEN)    0000000000000000 ffff8316da86e61c 0000beef0000beef ffffffff80555918
(XEN)    000000bf0000beef 0000000000000046 ffff938031fd4790 000000000000beef
(XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
(XEN)    0000e01000000000 ffff83083663f000 0000000000000000 00000000003526e0
(XEN)    0000000000000000 0000000000000000 0000060100000001 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d0402c4164>] R vioapic_irq_positive_edge+0x14e/0x150
(XEN)    [<ffff82d0402bcc33>] F arch/x86/hvm/irq.c#assert_gsi+0x5e/0x7b
(XEN)    [<ffff82d0402bd18f>] F hvm_gsi_assert+0x62/0x77
(XEN)    [<ffff82d04026f6e1>] F drivers/passthrough/io.c#dpci_softirq+0x261/0x29e
(XEN)    [<ffff82d04022b6fa>] F common/softirq.c#__do_softirq+0x8a/0xbf
(XEN)    [<ffff82d04022b798>] F do_softirq+0x13/0x15
(XEN)    [<ffff82d0402a4bcb>] F vmx_asm_do_vmentry+0x2b/0x30
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion '!print' failed at vioapic.c:512
(XEN) ****************************************


hope this helps ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

