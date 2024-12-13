Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621939F0980
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 11:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856540.1269128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2wp-0006Yy-5n; Fri, 13 Dec 2024 10:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856540.1269128; Fri, 13 Dec 2024 10:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2wp-0006Wv-35; Fri, 13 Dec 2024 10:31:03 +0000
Received: by outflank-mailman (input) for mailman id 856540;
 Fri, 13 Dec 2024 10:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XWyo=TG=kernel.org=kvalo@srs-se1.protection.inumbo.net>)
 id 1tM2wm-0006Wp-Ub
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 10:31:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57004528-b93d-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 11:30:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEA0D5C6B59;
 Fri, 13 Dec 2024 10:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65922C4CED0;
 Fri, 13 Dec 2024 10:30:44 +0000 (UTC)
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
X-Inumbo-ID: 57004528-b93d-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734085855;
	bh=BTQhG+pcPpVWdFU7M6WGNSEHiOAWlPk9OMovbRGe8jk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KwAmFDLewAK8qtG2JcgTDln5oAPvX7T6s21n+sVrQK/zovEQltlKTZMfOOydVCYBZ
	 wexQmXSVYI3h7TBHmpxxuKJCAtIKDA3xJNa8/Im/UBR7LXeWQh180GN2AD0v8T0VFC
	 xau4jIIld3rUWglJe0O5Ly1c3n+LVRPKkn4Ap2bFPikm9rfX1t0FvFxCEdhmOO7GmQ
	 T1Kv1o7hm5xTuEGg8jC3v4laVOub2r/1lqEAAYkD9VqHdQWO6/vYMu4tQswLjScRFC
	 qcBNgWj6+WXQRdmWrvKriaNXsmUfp6QHYu1lvvdq1sD36YHJ/Kyex37L0CjkCkv8o5
	 SYIrwECkF64TQ==
From: Kalle Valo <kvalo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>,  Igor Mitsyanko
 <imitsyanko@quantenna.com>,  amien Le Moal <dlemoal@kernel.org>,  Niklas
 Cassel <cassel@kernel.org>,  Basavaraj Natikar
 <basavaraj.natikar@amd.com>,  Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Sergey
 Matyukevich <geomatsi@gmail.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Alex Dubov <oakad@yahoo.com>,  Sudarsana
 Kalluru <skalluru@marvell.com>,  Manish Chopra <manishc@marvell.com>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com,  Sanjay R Mehta
 <sanju.mehta@amd.com>,  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,  Jon
 Mason <jdmason@kudzu.us>,  Dave Jiang <dave.jiang@intel.com>,  Allen Hubbe
 <allenbh@gmail.com>,  Bjorn Helgaas <bhelgaas@google.com>,  Alex
 Williamson <alex.williamson@redhat.com>,  Juergen Gross <jgross@suse.com>,
  Stefano Stabellini <sstabellini@kernel.org>,  Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Mario Limonciello
 <mario.limonciello@amd.com>,  Chen Ni <nichen@iscas.ac.cn>,  Ricky Wu
 <ricky_wu@realtek.com>,  Al Viro <viro@zeniv.linux.org.uk>,  Breno Leitao
 <leitao@debian.org>,  Thomas Gleixner <tglx@linutronix.de>,  Kevin Tian
 <kevin.tian@intel.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Mostafa Saleh <smostafa@google.com>,
  Jason Gunthorpe <jgg@ziepe.ca>,  Yi Liu <yi.l.liu@intel.com>,  Kunwu Chan
 <chentao@kylinos.cn>,  Dan Carpenter <dan.carpenter@linaro.org>,  "Dr.
 David Alan Gilbert" <linux@treblig.org>,  Ankit Agrawal
 <ankita@nvidia.com>,  Reinette Chatre <reinette.chatre@intel.com>,  Eric
 Auger <eric.auger@redhat.com>,  Ye Bin <yebin10@huawei.com>,
  linux-ide@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-input@vger.kernel.org,  netdev@vger.kernel.org,
  linux-wireless@vger.kernel.org,  ntb@lists.linux.dev,
  linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 09/11] wifi: qtnfmac: use always-managed version of
 pcim_intx()
References: <20241212192935.GA3360239@bhelgaas>
Date: Fri, 13 Dec 2024 12:30:42 +0200
In-Reply-To: <20241212192935.GA3360239@bhelgaas> (Bjorn Helgaas's message of
	"Thu, 12 Dec 2024 13:29:35 -0600")
Message-ID: <87cyhvoox9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Bjorn Helgaas <helgaas@kernel.org> writes:

> [cc->to: Igor]
>
> On Mon, Dec 09, 2024 at 02:06:31PM +0100, Philipp Stanner wrote:
>> pci_intx() is a hybrid function which can sometimes be managed through
>> devres. To remove this hybrid nature from pci_intx(), it is necessary to
>> port users to either an always-managed or a never-managed version.
>> 
>> qtnfmac enables its PCI-Device with pcim_enable_device(). Thus, it needs
>> the always-managed version.
>> 
>> Replace pci_intx() with pcim_intx().
>> 
>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>> Acked-by: Kalle Valo <kvalo@kernel.org>
>
> Hoping for an ack from Igor, too.

Igor hasn't been around for a while so I'm not expecting see an ack from
him, I think the whole qtnfmac driver should be removed in the future.
Feel free to take the patch as is.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

