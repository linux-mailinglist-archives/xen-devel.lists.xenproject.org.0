Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F546C696
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241971.418599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhrd-0005Rn-Bm; Tue, 07 Dec 2021 21:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241971.418599; Tue, 07 Dec 2021 21:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhrd-0005PQ-8a; Tue, 07 Dec 2021 21:19:05 +0000
Received: by outflank-mailman (input) for mailman id 241971;
 Tue, 07 Dec 2021 21:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuaW=QY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muhrc-0005PE-2K
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:19:04 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb5c801-57a3-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 22:19:02 +0100 (CET)
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
X-Inumbo-ID: 4cb5c801-57a3-11ec-9d12-4777fae47e2b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638911940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fejqz/bIS5UVVez3Xtjq2jInYaufJY/nLKnDbenyBtw=;
	b=VC5Rvg7jiq8Ikfw+JFC2if6V+C51JARVBdC0uW9vUW0CHLXLMJTCVCws2bKyhUrgzzbYBD
	TspgTWIoCN3z1mpSmBTfGbx4XIbh9GbNDRxSmFXBfJwIBX3j0sw+jnfm/oYCbc43OrEUpM
	SS9tX2diiZM5lYRGla6ljcr7iPYUAT/RJ9qMdqhJZgpVF0sfTve/39i5qs1L2SbKmA26Kk
	RuYaS8IxyMjfJtp5yErMcFm+uepejATF2VudC9wKWykGQzcm11Soqa0vOKrqlwq9Qy2ES/
	hIUI+MznVV8wAM/ESPIdQN7tFRoLJxRc700tRc0QEredDULx8y3xvMEgR1lqVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638911940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fejqz/bIS5UVVez3Xtjq2jInYaufJY/nLKnDbenyBtw=;
	b=tpxYQz931aJ9NXdPSYYAooQnjmQcVTU6ncg1A9XfE7ZYmworf/GnMN1rkeaSCd4LIsHO3E
	LsosR2mIUwj5rrDw==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Juergen Gross
 <jgross@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will
 Deacon <will@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org, Stuart Yoder
 <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth
 Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, Sinan
 Kaya <okaya@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: Re: [patch V2 29/36] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <e32237f3-0ff2-cf80-cd99-0b4813d1ed21@kaod.org>
References: <20211206210307.625116253@linutronix.de>
 <20211206210439.235197701@linutronix.de>
 <e32237f3-0ff2-cf80-cd99-0b4813d1ed21@kaod.org>
Date: Tue, 07 Dec 2021 22:19:00 +0100
Message-ID: <87zgpc15bv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cedric,

On Tue, Dec 07 2021 at 18:42, C=C3=A9dric Le Goater wrote:
>
> This is breaking nvme on pseries but it's probably one of the previous
> patches. I haven't figured out what's wrong yet. Here is the oops FYI.

Hrm.

> [   32.494562] WARNING: CPU: 26 PID: 658 at kernel/irq/chip.c:210 irq_sta=
rtup+0x1c0/0x1e0

This complains about a manual enable_irq() on a managed interrupt.

> [   32.494575] Modules linked in: ibmvscsi ibmveth scsi_transport_srp bnx=
2x ipr libata xhci_pci xhci_hcd nvme xts vmx_crypto nvme_core mdio t10_pi l=
ibcrc32c dm_mirror dm_region_hash dm_log dm_mod
> [   32.494601] CPU: 26 PID: 658 Comm: kworker/26:1H Not tainted 5.16.0-rc=
4-clg+ #54
> [   32.494607] Workqueue: kblockd blk_mq_timeout_work
> [   32.494681] NIP [c000000000206f00] irq_startup+0x1c0/0x1e0
> [   32.494686] LR [c000000000206df0] irq_startup+0xb0/0x1e0
> [   32.494690] Call Trace:
> [   32.494692] [c0000018050f38b0] [c000000000206df0] irq_startup+0xb0/0x1=
e0 (unreliable)
> [   32.494699] [c0000018050f38f0] [c00000000020155c] __enable_irq+0x9c/0x=
b0
> [   32.494705] [c0000018050f3950] [c0000000002015d0] enable_irq+0x60/0xc0
> [   32.494710] [c0000018050f39d0] [c008000014a54ae8] nvme_poll_irqdisable=
+0x80/0xc0 [nvme]
> [   32.494719] [c0000018050f3a00] [c008000014a55824] nvme_timeout+0x18c/0=
x420 [nvme]
> [   32.494726] [c0000018050f3ae0] [c00000000076e1b8] blk_mq_check_expired=
+0xa8/0x130
> [   32.494732] [c0000018050f3b10] [c0000000007793e8] bt_iter+0xd8/0x120
> [   32.494737] [c0000018050f3b60] [c00000000077a34c] blk_mq_queue_tag_bus=
y_iter+0x25c/0x3f0
> [   32.494742] [c0000018050f3c20] [c00000000076ffa4] blk_mq_timeout_work+=
0x84/0x1a0
> [   32.494747] [c0000018050f3c70] [c000000000182a78] process_one_work+0x2=
a8/0x5a0

Confused. I diffed against v1, but could not spot anything except that
properties issue which you found too.

Thanks,

        tglx


