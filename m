Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C408A09DF3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 23:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870064.1281519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNWx-0004Zy-EK; Fri, 10 Jan 2025 22:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870064.1281519; Fri, 10 Jan 2025 22:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNWx-0004XR-Av; Fri, 10 Jan 2025 22:31:03 +0000
Received: by outflank-mailman (input) for mailman id 870064;
 Fri, 10 Jan 2025 22:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMSX=UC=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tWNWw-0004XL-9d
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 22:31:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9174ac9e-cfa2-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 23:31:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA38F5C4CA7;
 Fri, 10 Jan 2025 22:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BCAC4CED6;
 Fri, 10 Jan 2025 22:30:59 +0000 (UTC)
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
X-Inumbo-ID: 9174ac9e-cfa2-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736548259;
	bh=9WkF6n5RBjRD1mrwR6nxL/hU9QiyhVm6Z4mOb8csuoU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rQhgmR2kSJPEviIMFBfSc+Z4Hchk6wciqoxq1D4PiiU2z+OXyngOrFXHmHSoTBD5y
	 sbrreH+lcvENWHkIyIzaxaX8C25ii1YOZqw2VyaaJQfTYL2+gMI4I9rXwiMD2txSUK
	 8QvNBNsuAfy5UaWrcvKFE/XCLn0J7RN7prRrAUcf7/kNHZx/sXU9N8AmIgEDAG9X+p
	 7M1zVVllWvmwGL9AJptwUutps9Txtg/gpYcYE8MwZrAZyS76HmrKZjdykYw0XCp0AT
	 ef3YzF9qvceS75EskXpOYtlaxhQPzb4PXV6UM0tvX810HEQu14+DoOmSEjliUbi0ot
	 T8HFuK07K2Y1Q==
Date: Fri, 10 Jan 2025 16:30:57 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <20250110223057.GA318711@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110140152.27624-4-roger.pau@citrix.com>

Match subject line style again.

On Fri, Jan 10, 2025 at 03:01:50PM +0100, Roger Pau Monne wrote:
> Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both MSI
> and MSI-X entries globally, regardless of the IRQ chip they are using.  Only
> Xen sets the pci_msi_ignore_mask when routing physical interrupts over event
> channels, to prevent PCI code from attempting to toggle the maskbit, as it's
> Xen that controls the bit.
> 
> However, the pci_msi_ignore_mask being global will affect devices that use MSI
> interrupts but are not routing those interrupts over event channels (not using
> the Xen pIRQ chip).  One example is devices behind a VMD PCI bridge.  In that
> scenario the VMD bridge configures MSI(-X) using the normal IRQ chip (the pIRQ
> one in the Xen case), and devices behind the bridge configure the MSI entries
> using indexes into the VMD bridge MSI table.  The VMD bridge then demultiplexes
> such interrupts and delivers to the destination device(s).  Having
> pci_msi_ignore_mask set in that scenario prevents (un)masking of MSI entries
> for devices behind the VMD bridge.
> 
> Move the signaling of no entry masking into the MSI domain flags, as that
> allows setting it on a per-domain basis.  Set it for the Xen MSI domain that
> uses the pIRQ chip, while leaving it unset for the rest of the cases.
> 
> Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> with Xen dropping usage the variable is unneeded.
> 
> This fixes using devices behind a VMD bridge on Xen PV hardware domains.

Wrap to fit in 75 columns.

The first two patches talk about devices behind VMD not being usable
for Xen, but this one says they now work.  But this doesn't undo the
code changes or comments added by the first two, so the result is a
bit confusing (probably because I know nothing about Xen).

Bjorn

