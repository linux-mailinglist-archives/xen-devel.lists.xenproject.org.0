Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA6624BDD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 21:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442191.696249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otEEJ-00029u-Mn; Thu, 10 Nov 2022 20:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442191.696249; Thu, 10 Nov 2022 20:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otEEJ-00027d-K6; Thu, 10 Nov 2022 20:32:55 +0000
Received: by outflank-mailman (input) for mailman id 442191;
 Thu, 10 Nov 2022 20:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otEEI-00027X-NA
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 20:32:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98e308e-6136-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 21:32:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16A0361E42;
 Thu, 10 Nov 2022 20:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EB0C433C1;
 Thu, 10 Nov 2022 20:32:50 +0000 (UTC)
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
X-Inumbo-ID: d98e308e-6136-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668112371;
	bh=RSkH0eIhqO5qHX3t/JTR3U9rAH4fDPGI76TxdDGTIp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TRiSyxq60KGhCoJOYc4WFhEt89b5OkqwN7Et2vwGTPhW3up25sB8DQqLLwYIuJ/tb
	 +zzaMfwSDkEUs5zfS9+hhXTk/OFgdogeX+N3Ps2fVP4kiz8rBWsbtW6IQACTI2sKwX
	 CU9Wz/i52HBVSlN97Q9K/tqzCVZ5t1616gKGevY8xjFJQ+uopUA5f23K22EBs4jzIw
	 YYiyNuYLTb6AFIYxIyP3VkybCbc+1tbfz+8XkfV+xtRVZzBW4O3FWuqjfn2vN0uS7l
	 D8kTJT8neTj9BI4vDLwFfJVJKD6Kz2Sfhj+sY/3vcHUQ07NZSlywef75JERsgzk9Jv
	 FLgZsN9TCB7KA==
Date: Thu, 10 Nov 2022 12:32:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Jiamei Xie <Jiamei.Xie@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux
 guest
In-Reply-To: <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com> <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com> <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-861249806-1668112371=:50442"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-861249806-1668112371=:50442
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 9 Nov 2022, Michal Orzel wrote:
> Hi Jiamei,
> 
> On 09/11/2022 09:25, Jiamei Xie wrote:
> > 
> > 
> > Hi Michal，
> > 
> > Below log can be got when stating the linux guest. It says 9c09 is sbsa. And 9c09 is also output
> >  in bootlogd error message:
> > Serial: AMBA PL011 UART driver
> > 9c0b0000.uart: ttyAMA0 at MMIO 0x9c0b0000 (irq = 12, base_baud = 0) is a PL011 rev2
> > printk: console [ttyAMA0] enabled
> > 9c090000.sbsa-uart: ttyAMA1 at MMIO 0x9c090000 (irq = 15, base_baud = 0) is a SBSA
> > 
> 
> Xen behavior is correct and this would be Linux fault to try to write to DMACR for SBSA UART device.
> DMACR is just an example. If you try to program e.g. the baudrate (through LCR) for VPL011 it will
> also result in injecting abort into the guest. Should Xen support it? No. The reason why is that
> it is not spec compliant operation. SBSA specification directly specifies what registers are exposed.
> If Linux tries to write to some of the none-spec compliant registers - it is its fault.

Yeah, we need to fix Linux.

FYI this is not the first bug in Linux affecting the sbsa-uart driver:
the issue is that the pl011 driver and the sbsa-uart driver share the
same code in Linux so it happens sometimes that a pl011-only feature
creeps into the sbsa-uart driver by mistake.


> >> -----Original Message-----
> >> From: Michal Orzel <michal.orzel@amd.com>
> >> Sent: Wednesday, November 9, 2022 3:40 PM
> >> To: Jiamei Xie <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org
> >> Cc: Wei Chen <Wei.Chen@arm.com>; Bertrand Marquis
> >> <Bertrand.Marquis@arm.com>; julien@xen.org; sstabellini@kernel.org
> >> Subject: Re: Xen Arm vpl011 UART will cause segmentation fault in Linux
> >> guest
> >>
> >> Hi Jiamei,
> >>
> >> On 09/11/2022 08:20, Jiamei Xie wrote:
> >>>
> >>>
> >>> Hi all,
> >>>
> >>> When the guest kernel enables DMA engine with
> >> "CONFIG_DMA_ENGINE=y", Linux AMBA PL011 driver will access PL011
> >> DMACR register. But this register have not been supported by vpl011 of Xen.
> >> Xen will inject a data abort into guest, this will cause segmentation fault of
> >> guest with the below message:
> >> I am quite confused.
> >> VPL011 implements SBSA UART which only implements some subset of PL011
> >> operations (SBSA UART is not PL011).
> >> According to spec (SBSA ver. 6.0), the SBSA_UART does not support DMA
> >> features so Xen code is fine.
> >> When Xen exposes vpl011 device to a guest, this device has "arm,sbsa-uart"
> >> compatible and not "uart-pl011".
> >> Linux driver "amba-pl011.c" should see this compatible and assign proper
> >> operations (sbsa_uart_pops instead of amba_pl011_pops) that do not enable
> >> DMA.
> >> Maybe the issue is with your configuration?
> >>
> >> ~Michal
> >>
> >>> Unhandled fault at 0xffffffc00944d048
> >>> Mem abort info:
> >>> ESR = 0x96000000
> >>> EC = 0x25: DABT (current EL), IL = 32 bits
> >>> SET = 0, FnV = 0
> >>> EA = 0, S1PTW = 0
> >>> FSC = 0x00: ttbr address size fault
> >>> Data abort info:
> >>> ISV = 0, ISS = 0x00000000
> >>> CM = 0, WnR = 0
> >>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
> >>> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803,
> >> pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
> >>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> >>> Modules linked in:
> >>> CPU: 0 PID: 132 Comm: bootlogd Not tainted 5.15.44-yocto-standard #1
> >>> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>> pc : pl011_stop_rx+0x70/0x80
> >>> lr : uart_tty_port_shutdown+0x44/0x110
> >>> sp : ffffffc00999bba0
> >>> x29: ffffffc00999bba0 x28: ffffff80234ac380 x27: ffffff8022f5d000
> >>> x26: 0000000000000000 x25: 0000000045585401 x24: 0000000000000000
> >>> x23: ffffff8021ba4660 x22: 0000000000000001 x21: ffffff8021a0e2a0
> >>> x20: ffffff802198f880 x19: ffffff8021a0e1a0 x18: 0000000000000000
> >>> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> >>> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> >>> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffc00871ba14
> >>> x8 : ffffffc0099de260 x7 : ffffff8021a0e318 x6 : 0000000000000003
> >>> x5 : ffffffc009315f20 x4 : ffffffc00944d038 x3 : 0000000000000000
> >>> x2 : ffffffc00944d048 x1 : 0000000000000000 x0 : 0000000000000048
> >>> Call trace:
> >>> pl011_stop_rx+0x70/0x80
> >>> tty_port_shutdown+0x7c/0xb4
> >>> tty_port_close+0x60/0xcc
> >>> uart_close+0x34/0x8c
> >>> tty_release+0x144/0x4c0
> >>> __fput+0x78/0x220
> >>> ____fput+0x1c/0x30
> >>> task_work_run+0x88/0xc0
> >>> do_notify_resume+0x8d0/0x123c
> >>> el0_svc+0xa8/0xc0
> >>> el0t_64_sync_handler+0xa4/0x130
> >>> el0t_64_sync+0x1a0/0x1a4
> >>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> >>> ---[ end trace 83dd93df15c3216f ]---
> >>> note: bootlogd[132] exited with preempt_count 1
> >>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-
> >> daemon
> >>> In Xen, vpl011_mmio_write doesn't handle DMACR . And kernel doesn't
> >> check if pl011_write executes sucessfully in pl011_dma_rx_stop . So such
> >> segmentation fault occurs.
> >>> static inline void pl011_dma_rx_stop(struct uart_amba_port *uap)
> >>> {
> >>>         /* FIXME.  Just disable the DMA enable */
> >>>         uap->dmacr &= ~UART011_RXDMAE;
> >>>         pl011_write(uap->dmacr, uap, REG_DMACR);
> >>> }
> >>>
> >>> I think we should prevent such segmentation fault. We have checked the
> >> PL011 spec, it seems there is not any register bit can indicate DMA support
> >> status of PL011. We might have two options:
> >>> 1. Option#1 is to add DMA support for vpl011, but this is not trivial.
> >>> 2. Option#2 is to ignore the write to DMACR, and return 0 for DMACR read
> >> in vpl011. But this option need co-work with kernel, because current Linux
> >> PL011 driver assume the write operation will never be failed, and will not
> >> fallback to no-DMA mode, when Xen return 0 for DMA enabled bit in DMACR.
> >>>
> >>> How do you think about it?  Any suggestion about it is welcome. Thanks.
> >>>
> >>> Best wishes
> >>> Jiamei Xie
> >>>
> 
--8323329-861249806-1668112371=:50442--

