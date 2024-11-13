Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016A9C782B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835874.1251736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFqY-0002nW-CI; Wed, 13 Nov 2024 16:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835874.1251736; Wed, 13 Nov 2024 16:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFqY-0002ke-9E; Wed, 13 Nov 2024 16:03:58 +0000
Received: by outflank-mailman (input) for mailman id 835874;
 Wed, 13 Nov 2024 16:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEOK=SI=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tBFqW-0002kI-Tr
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:03:57 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dec40929-a1d8-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 17:03:49 +0100 (CET)
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
X-Inumbo-ID: dec40929-a1d8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5My4xNDIuNDMuNTUiLCJoZWxvIjoiZ2Fsb2lzLmxpbnV0cm9uaXguZGUifQ==
X-Custom-Transaction: eyJpZCI6ImRlYzQwOTI5LWExZDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTEzODI5LjgxOTYzLCJzZW5kZXIiOiJ0Z2x4QGxpbnV0cm9uaXguZGUiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731513828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtC6I/wVh3bb76vb3t0LUdhFECXQ4KT3wwkegPBL5lI=;
	b=ULaUpO5DuZ2pMJ9QlEii8n5VH6LQrYmON5UKYjXr0uXw+BUKWIg3fJdbqxb7NYrD27WKbP
	MxbAa92xpSgi5CzUkOgozoczZ7yU3XwWuzeDxuX/evohe/FFAGHe4xC3fZza0Gwnx+RFdk
	r3zRuOySUPvmBBd8Nwz5eOvEW61/VGQlgm4svSukGmofp5FPDxCdXC5h22VbV6mxNSkHV/
	m23pCYVsbhhkRw7VJUH8Fcw4fSz3FJZzpDU5hwbyaB7IEGc7yd49G99fyDPYTLNeklt0g/
	2GqGG/XpRctO4FYQIGmbqt6TlNZN4ZgL+uLI8ZghI3jUtQKhCtWaG5SjTgvJvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731513828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtC6I/wVh3bb76vb3t0LUdhFECXQ4KT3wwkegPBL5lI=;
	b=1bikosKoqAqJ9LV5ympvkJTzAxL5PJTgiwLFysyriYVLswkkIvCB4AFn7UaMhQltW9CflT
	PspCYbjP3/ELnqDQ==
To: Philipp Stanner <pstanner@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave
 Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Alex Williamson
 <alex.williamson@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Philipp Stanner <pstanner@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni
 <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Mostafa Saleh <smostafa@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>, Christian Brauner
 <brauner@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/11] PCI: Prepare removing devres from pci_intx()
In-Reply-To: <20241113124158.22863-3-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
 <20241113124158.22863-3-pstanner@redhat.com>
Date: Wed, 13 Nov 2024 17:04:00 +0100
Message-ID: <87plmzktn3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> +/**
> + * pci_intx_unmanaged - enables/disables PCI INTx for device dev,
> + * unmanaged version
> + * @pdev: the PCI device to operate on
> + * @enable: boolean: whether to enable or disable PCI INTx

Except that the argument is of type int, which really should be type bool.

> + * Enables/disables PCI INTx for device @pdev
> + *
> + * This function behavios identically to pci_intx(), but is never managed with
> + * devres.

behavios?

> + */
> +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)

I find this function name mildy confusing. This _unmanaged suffix is not
really telling me anything. And the reference that this behaves
identically to pci_intx() makes it even worse.

This function is about controlling the PCI INTX_DISABLE bit in the
PCI_COMMAND config word, right?

So naming it pci_intx_control() would make it entirely clear what this
is about, no?

Thanks,

        tglx

