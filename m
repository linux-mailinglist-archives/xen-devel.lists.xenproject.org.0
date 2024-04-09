Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAD89E41A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 22:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702816.1098381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHgg-000669-0v; Tue, 09 Apr 2024 20:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702816.1098381; Tue, 09 Apr 2024 20:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHgf-00064c-TC; Tue, 09 Apr 2024 20:03:21 +0000
Received: by outflank-mailman (input) for mailman id 702816;
 Tue, 09 Apr 2024 20:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oxf6=LO=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1ruHge-00064W-9z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 20:03:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 351f8580-f6ac-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 22:03:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56DED61A02;
 Tue,  9 Apr 2024 20:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EFDC433F1;
 Tue,  9 Apr 2024 20:03:16 +0000 (UTC)
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
X-Inumbo-ID: 351f8580-f6ac-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712692996;
	bh=W0Dg/LFVG/zk6w1OJr/E+L0AAUiXJ9nwCf1h17aljN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qIuyFRFe8Io8vngdx3pCHOgr9fPX5ND0sl//x5REFfEOjyjYNU76rWwfsRqAw6vDv
	 3Vib8zwLf743gCAZaVORYHFdeQSWBjOKZ5k0yJxTbO8HsUfJZDiZYbd+hGnpXRUc8T
	 ZX109BdQn0wlxURG5F2KlWvXYdgcHPHFf6tjCnChvmRiY33b/a4pYTzJv4R6bTTcJV
	 UJroth14Lrg1CsSiP/NUrmp8jlcJIsPDDTTsOWZfa7qKaHWkbebDvYgcu2xGVpWZr/
	 GzkTGJMCToZ8xhCzRsQn1IAetrwX0w0O9cWHbWXO6ZVomimvxzE2jhBqO8B+I131GQ
	 I2c2hOSkzQ4Xg==
Date: Tue, 9 Apr 2024 15:03:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <20240409200314.GA2086199@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5849572DFC67B1F8A68E123DE7002@BL1PR12MB5849.namprd12.prod.outlook.com>

[+to Rafael]

On Mon, Apr 08, 2024 at 06:42:31AM +0000, Chen, Jiqian wrote:
> Hi Bjorn,
> It has been almost two months since we received your reply last time.
> This series are blocking on this patch, since there are patches on Xen and Qemu side depending on it.
> Do you still have any confusion about this patch? Or do you have other suggestions?
> If no, may I get your Reviewed-by?

  - This is ACPI-specific, but exposes /sys/.../gsi for all systems,
    including non-ACPI systems.  I don't think we want that.

  - Do you care about similar Xen configurations on non-ACPI systems?
    If so, maybe the commit log could mention how you learn about PCI
    INTx routing on them in case there's some way to unify this in the
    future.

  - Missing an update to Documentation/ABI/.

  - A nit: I asked about s/dumU/DomU/ in the commit log earlier,
    haven't seen any response.

  - Commit log mentions "and for other potential scenarios."  It's
    another nit, but unless you have another concrete use for this,
    that phrase is meaningless hand waving and should be dropped.

  - A _PRT entry may refer directly to a GSI or to an interrupt link
    device (PNP0C0F) that can be routed to one of several GSIs:

      ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
 
    I don't think the kernel reconfigures interrupt links after
    enumeration, but if they are reconfigured at run-time (via _SRS),
    the cached GSI will be wrong.  I think setpnp could do this, but
    that tool is dead.  So maybe this isn't a concern anymore, but I
    *would* like to get Rafael's take on this.  If we don't care
    enough, I think we should mention it in the commit log just in
    case.

Bjorn

