Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3989CF022
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 16:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837734.1253646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByLx-00046b-EN; Fri, 15 Nov 2024 15:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837734.1253646; Fri, 15 Nov 2024 15:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByLx-00044v-B3; Fri, 15 Nov 2024 15:35:21 +0000
Received: by outflank-mailman (input) for mailman id 837734;
 Fri, 15 Nov 2024 15:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7N1=SK=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tByLv-000444-AH
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 15:35:19 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35aa1d5b-a367-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 16:35:15 +0100 (CET)
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
X-Inumbo-ID: 35aa1d5b-a367-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMGE6NTFjMDowOjEyZTo1NTA6OjEiLCJoZWxvIjoiZ2Fsb2lzLmxpbnV0cm9uaXguZGUifQ==
X-Custom-Transaction: eyJpZCI6IjM1YWExZDViLWEzNjctMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjg0OTE1LjQwODcxNCwic2VuZGVyIjoidGdseEBsaW51dHJvbml4LmRlIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731684913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yU1G2hIrLcZlXd3LaebeyKYONXTnd34hSfRSQEHJ1yU=;
	b=IBWtp97mInpsavyNlaW7Wa7P9t1WIhdFZFGtmkYainZ6bfXDspevPRYpFW4pLoFiUdTJD4
	U5VvdoT1K3yOQRre+DBq0sQWHdk4rIynAWjUT2zmNpIj2n43BIKL0t0/Vf6l/rtvSO0Fi+
	gDrBIw99IdYG1uqRK3qErn9uAAGZz664d/tZZ8KcSi+2Phfl0Sz1omrERQ/lrAOES/7JlS
	yRewNvz7aEuvd8A4q0Bq1FSIlOgXPmu0k2lEr6yoDeEt0bajmGyelDX+RQ8ypFICvCudhA
	M17FF+uzSWHmHhP49+FBOqW8qbOWE/x/12QiHel/8b+KvHi6yusfYdMgsiBxnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731684913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yU1G2hIrLcZlXd3LaebeyKYONXTnd34hSfRSQEHJ1yU=;
	b=HbOShzA2dgF/rf/JxxHpay75yREzH698PUJ7XWVcQ8L3AwP4KqCVbfvEjEUE+BssSSuAzH
	UAxm3b5R+xtq6JDw==
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
Subject: Re: [PATCH v2 07/11] PCI: MSI: Use never-managed version of pci_intx()
In-Reply-To: <20241113124158.22863-9-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
 <20241113124158.22863-9-pstanner@redhat.com>
Date: Fri, 15 Nov 2024 16:35:22 +0100
Message-ID: <87y11kzf0l.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
>
> MSI sets up its own separate devres callback implicitly in
> pcim_setup_msi_release(). This callback ultimately uses pci_intx(),
> which is problematic since the callback of course runs on driver-detach.
>
> That problem has last been described here:
> https://lore.kernel.org/all/ee44ea7ac760e73edad3f20b30b4d2fff66c1a85.camel@redhat.com/
>
> Replace the call to pci_intx() with one to the never-managed version
> pci_intx_unmanaged().
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

