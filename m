Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4569B7C06
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 14:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828701.1243681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6VU7-0004Au-T4; Thu, 31 Oct 2024 13:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828701.1243681; Thu, 31 Oct 2024 13:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6VU7-000497-Pd; Thu, 31 Oct 2024 13:45:11 +0000
Received: by outflank-mailman (input) for mailman id 828701;
 Thu, 31 Oct 2024 13:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uKj0=R3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1t6VU6-000491-FK
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 13:45:10 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5588df2a-978e-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 14:45:05 +0100 (CET)
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
X-Inumbo-ID: 5588df2a-978e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMGE6NTFjMDowOjEyZTo1NTA6OjEiLCJoZWxvIjoiZ2Fsb2lzLmxpbnV0cm9uaXguZGUifQ==
X-Custom-Transaction: eyJpZCI6IjU1ODhkZjJhLTk3OGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzgyMzA1LjI4NjM5NSwic2VuZGVyIjoidGdseEBsaW51dHJvbml4LmRlIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730382304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEO4GUXIuQTW+sY+/WiYJk1PjJtbzNP/nS0HeFEOI6A=;
	b=yoCNsTYAFyyFk5pGSYkD1piEjw8MOo53vDo2YkXW02EDMHDlaOfzFQIBgvw62YeQnStj0R
	qkY5Ky9UOyVC1w3OVKBzXSwejc99F3AGpf5zUOBwsDyJSVfTnZWMWet1KTbQJOfOLCVNhV
	cy7TVNur5FmVBVRh+KOvfZ/CNyLR8SNv9i7yqNqrq5kD5xMENaMe0V6OpvokmfW/Ob9QM/
	5un8Zwrlq9QRR3JPr7QuSkLpK98KMG43mFh0DMvW9yQHq+GuztrjGuFKrW+m4h5GhCy/Ac
	kp1SwmKR/ksHOOv6R90FQYE4O+PRPlazUvlT9/6ThYdYhTcp0TO69X6RMhaPYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730382304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEO4GUXIuQTW+sY+/WiYJk1PjJtbzNP/nS0HeFEOI6A=;
	b=tnv8I/cOG9O9Bmuz6A4PtC/V6UOPd//2+oyqsIznzxGGzis4KZd76yQ3kxGFswkP13hKpV
	nr8ioE+FYr3wlOBw==
To: Philipp Stanner <pstanner@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave
 Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Alex Williamson
 <alex.williamson@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Philipp Stanner <pstanner@redhat.com>, Ricky
 Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>, Ilpo =?utf-8?Q?J?=
 =?utf-8?Q?=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Christian
 Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, Eric
 Auger <eric.auger@redhat.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis
 Bossart <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/13] PCI: Prepare removing devres from pci_intx()
In-Reply-To: <20241015185124.64726-2-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
 <20241015185124.64726-2-pstanner@redhat.com>
Date: Thu, 31 Oct 2024 14:45:03 +0100
Message-ID: <87cyjgwfmo.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 15 2024 at 20:51, Philipp Stanner wrote:
> +/**
> + * pci_intx - enables/disables PCI INTx for device dev, unmanaged version

mismatch vs. actual function name.

> + * @pdev: the PCI device to operate on
> + * @enable: boolean: whether to enable or disable PCI INTx
> + *
> + * Enables/disables PCI INTx for device @pdev
> + *
> + * This function behavios identically to pci_intx(), but is never managed with
> + * devres.
> + */
> +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)

This is a misnomer. The function controls the INTX_DISABLE bit of a
PCI device. Something like this:

void __pci_intx_control()
{
}

static inline void pci_intx_enable(d)
{
        __pci_intx_control(d, true);
}

.....

makes it entirely clear what this is about.

Hmm?

Thanks,

        tglx

