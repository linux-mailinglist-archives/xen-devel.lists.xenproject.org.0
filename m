Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417A9F042B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 06:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856447.1269057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLyBn-0005MW-AQ; Fri, 13 Dec 2024 05:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856447.1269057; Fri, 13 Dec 2024 05:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLyBn-0005KL-7j; Fri, 13 Dec 2024 05:26:11 +0000
Received: by outflank-mailman (input) for mailman id 856447;
 Fri, 13 Dec 2024 05:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwbF=TG=kernel.org=cassel@srs-se1.protection.inumbo.net>)
 id 1tLyBl-0005KF-Mb
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 05:26:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf0ebc94-b912-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 06:26:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6B4C1A42515;
 Fri, 13 Dec 2024 05:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D513C4CED1;
 Fri, 13 Dec 2024 05:25:49 +0000 (UTC)
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
X-Inumbo-ID: bf0ebc94-b912-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734067562;
	bh=M2xdmdLNhUnONPFOKg4DD+NknFYDEaK+x9KyPHrv24s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bw4/mjm10HI4gIYEq6PcUyF1AyHtdTx8xY1u9mQ/MqJN77zbADAxHBaxyRlLd3fvm
	 K+xp87WmOhOZL0i+Bq0ipg5X8v20dbpQflvkGqWjrmRLY/0GuREkoyHJNVYE+cNf5x
	 z8LCuZGHvDXUpEOFv59Bb7IqvPJLfr+Ey53P+W4LJrWqp6nhL8os12GgjvLuqPfWM7
	 tQzQgeo6YclbvdVoVzle3X83Llu3G9oxPWspWAnjZkdc3+GZOJaUxSQ04u5mGgaPm3
	 thWesm1LM0XsGyHp4VpoNWDNgdZGRIRa8iRReDoOdNpvWyxV8vC93Zm54QQh6yd+QZ
	 BUiwJG/w6t0xg==
Date: Fri, 13 Dec 2024 06:25:47 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>,
	amien Le Moal <dlemoal@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/11] Remove implicit devres from pci_intx()
Message-ID: <Z1vFWyHkBD4d5xnG@ryzen>
References: <20241209130632.132074-2-pstanner@redhat.com>
 <20241212192118.GA3359591@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212192118.GA3359591@bhelgaas>

On Thu, Dec 12, 2024 at 01:21:18PM -0600, Bjorn Helgaas wrote:
> On Mon, Dec 09, 2024 at 02:06:22PM +0100, Philipp Stanner wrote:
> 
> Applied the ones with maintainer acks to pci/devres for v6.14, thanks!

I don't see this on:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/

Did you perhaps forget to push?


Kind regards,
Niklas

