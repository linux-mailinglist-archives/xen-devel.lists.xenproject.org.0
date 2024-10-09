Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73A996485
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814006.1227077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySid-0008In-L9; Wed, 09 Oct 2024 09:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814006.1227077; Wed, 09 Oct 2024 09:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySid-0008G5-II; Wed, 09 Oct 2024 09:10:55 +0000
Received: by outflank-mailman (input) for mailman id 814006;
 Wed, 09 Oct 2024 09:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ia6U=RF=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sySib-0008Ef-E6
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:10:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60cc8f80-861e-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 11:10:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCDCF5C5DD8;
 Wed,  9 Oct 2024 09:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C87BC4CEC5;
 Wed,  9 Oct 2024 09:10:40 +0000 (UTC)
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
X-Inumbo-ID: 60cc8f80-861e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728465048;
	bh=SeiKUnM1DO48iG3Gr3JzhpZfh6fszoAqw+yG9jEe454=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=apgg8LYblMD4qcg07qq3Mkgt0ywwQuc+3xw0JHmyyo9R1mWrfGxw8wTc4OdVdv86c
	 9NvoStQW9y9swxeftz9Y/d+2+eWrhl8IJ+ehaoOKL5kcWGNnsVpJgR/dEBQtmS3u1T
	 rdBzExB9GsjgYbIOJpmcB5A2VggPdQMDCHWytgB566ZNT/uK6NwYLIDILg88BAHeQz
	 vk/SHdbAb6yjKubsySQAdtJ9+53NgxwB7giJMbQu+dDrvvT9iCnDXeZaC9YE6mq48L
	 2OdUXj462FwW5nDBk2woP+WbDOgZfiJhnt/gsiFXjp+bfi2iB8hwnrHQlGtidEcPDH
	 jr9p8eMo3AZKg==
Message-ID: <5f785dda-b2d7-466f-96c3-23faf0b80975@kernel.org>
Date: Wed, 9 Oct 2024 18:10:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/13] PCI: Prepare removing devres from pci_intx()
To: Philipp Stanner <pstanner@redhat.com>, Niklas Cassel <cassel@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-staging@lists.linux.dev,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-sound@vger.kernel.org
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-2-pstanner@redhat.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241009083519.10088-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/24 17:35, Philipp Stanner wrote:
> pci_intx() is a hybrid function which sometimes performs devres
> operations, depending on whether pcim_enable_device() has been used to
> enable the pci_dev. This sometimes-managed nature of the function is
> problematic. Notably, it causes the function to allocate under some
> circumstances which makes it unusable from interrupt context.
> 
> To, ultimately, remove the hybrid nature from pci_intx(), it is first
> necessary to provide an always-managed and a never-managed version
> of that function. Then, all callers of pci_intx() can be ported to the
> version they need, depending whether they use pci_enable_device() or
> pcim_enable_device().
> 
> An always-managed function exists, namely pcim_intx(), for which
> __pcim_intx(), a never-managed version of pci_intx() had been

s/had/has ? Not sure about this, English is not my first language :)

> implemented.
> 
> Make __pcim_intx() a public function under the name
> pci_intx_unmanaged(). Make pcim_intx() a public function.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Regardless of the above nit, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

