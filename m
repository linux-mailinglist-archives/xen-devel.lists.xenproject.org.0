Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C49A05B5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819852.1233308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10Sz-0000xc-ED; Wed, 16 Oct 2024 09:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819852.1233308; Wed, 16 Oct 2024 09:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10Sz-0000vv-BI; Wed, 16 Oct 2024 09:37:17 +0000
Received: by outflank-mailman (input) for mailman id 819852;
 Wed, 16 Oct 2024 09:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r+g5=RM=kernel.org=kvalo@srs-se1.protection.inumbo.net>)
 id 1t10Sx-0000ua-En
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:37:15 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 392c18c0-8ba2-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:37:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 43C17A43BC2;
 Wed, 16 Oct 2024 09:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83DEC4CECF;
 Wed, 16 Oct 2024 09:37:00 +0000 (UTC)
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
X-Inumbo-ID: 392c18c0-8ba2-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729071431;
	bh=3qs9RCIcBMaiRaaQowBtUAYRplzqstMrihAHPPNLmDY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TKOX9/0GP1+lza5sQLTeaGorlh3MWnyZcXGq05D/f/GBd2opmS8ChUbAgJdPb/CZ1
	 yn5rFWuoHPLLh+d3Tn7faqhBzYHFIRUNCjskSa+aHE7Hk+eHTbbOc5TCSh9q9iJ3uy
	 ecD+a1d8UI2TkI22bqwo5dXLynEXWBDFQZqY5PiV0eO3UFpqqqMhVJV65YiRQTDMNj
	 WP2usCFu0zlWexw7EVaqgNj9e/FFPneDaR8h9YjjAPmN4hPc1uAoQejPiORMJPvOU5
	 CWaLZFgGsjhgxS13aQ+7ta5bJuOGaob/3dXOYCK3/wDOU6szpcWpgz4jJlrkWESsRr
	 s45FfeYSH4aKw==
From: Kalle Valo <kvalo@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>,
  Sergey Shtylyov <s.shtylyov@omp.ru>,  Basavaraj Natikar
 <basavaraj.natikar@amd.com>,  Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Alex Dubov <oakad@yahoo.com>,
  Sudarsana Kalluru <skalluru@marvell.com>,  Manish Chopra
 <manishc@marvell.com>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Rasesh Mody <rmody@marvell.com>,
  GR-Linux-NIC-Dev@marvell.com,  Igor Mitsyanko <imitsyanko@quantenna.com>,
  Sergey Matyukevich <geomatsi@gmail.com>,  Sanjay R Mehta
 <sanju.mehta@amd.com>,  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,  Jon
 Mason <jdmason@kudzu.us>,  Dave Jiang <dave.jiang@intel.com>,  Allen Hubbe
 <allenbh@gmail.com>,  Bjorn Helgaas <bhelgaas@google.com>,  Alex
 Williamson <alex.williamson@redhat.com>,  Juergen Gross <jgross@suse.com>,
  Stefano Stabellini <sstabellini@kernel.org>,  Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Chen Ni <nichen@iscas.ac.cn>,  Mario
 Limonciello <mario.limonciello@amd.com>,  Ricky Wu <ricky_wu@realtek.com>,
  Al Viro <viro@zeniv.linux.org.uk>,  Breno Leitao <leitao@debian.org>,
  Kevin Tian <kevin.tian@intel.com>,  Thomas Gleixner <tglx@linutronix.de>,
  Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,  Andy
 Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Mostafa Saleh <smostafa@google.com>,
  Jason Gunthorpe <jgg@ziepe.ca>,  Yi Liu <yi.l.liu@intel.com>,  Christian
 Brauner <brauner@kernel.org>,  Ankit Agrawal <ankita@nvidia.com>,  Eric
 Auger <eric.auger@redhat.com>,  Reinette Chatre
 <reinette.chatre@intel.com>,  Ye Bin <yebin10@huawei.com>,  Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
  Pierre-Louis
 Bossart <pierre-louis.bossart@linux.dev>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>,
  linux-ide@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-input@vger.kernel.org,  netdev@vger.kernel.org,
  linux-wireless@vger.kernel.org,  ntb@lists.linux.dev,
  linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
  xen-devel@lists.xenproject.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/13] wifi: qtnfmac: use always-managed version of
 pcim_intx()
References: <20241015185124.64726-1-pstanner@redhat.com>
	<20241015185124.64726-11-pstanner@redhat.com>
Date: Wed, 16 Oct 2024 12:36:58 +0300
In-Reply-To: <20241015185124.64726-11-pstanner@redhat.com> (Philipp Stanner's
	message of "Tue, 15 Oct 2024 20:51:20 +0200")
Message-ID: <87y12o4ced.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Philipp Stanner <pstanner@redhat.com> writes:

> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
>
> qtnfmac enables its PCI-Device with pcim_enable_device(). Thus, it needs
> the always-managed version.
>
> Replace pci_intx() with pcim_intx().
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Feel free to take this via the PCI tree:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

