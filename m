Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4DA0C5BE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 00:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870867.1281933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXTvQ-0006xz-4e; Mon, 13 Jan 2025 23:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870867.1281933; Mon, 13 Jan 2025 23:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXTvQ-0006vZ-1N; Mon, 13 Jan 2025 23:32:52 +0000
Received: by outflank-mailman (input) for mailman id 870867;
 Mon, 13 Jan 2025 23:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=09kq=UF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tXTvO-0006vT-6Y
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 23:32:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b28afc11-d206-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 00:32:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52B65A40169;
 Mon, 13 Jan 2025 23:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C17EC4CEE2;
 Mon, 13 Jan 2025 23:32:46 +0000 (UTC)
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
X-Inumbo-ID: b28afc11-d206-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736811167;
	bh=1jVk4ltA+d5ZhbhdluLbuAMr/zaGiphdqtr5ZLs8t80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TMQ6G17PrTp0lhrwJTgK+sdfXTdzsz+wfrbAbfgMGesgsasW1zc885f77VJ8+CU8c
	 S9E7OikwGIKzXcUdHMj9jMWX5IQHbT+cxfBWIIopte/FKrEC2DsUogjt+p0QkuuBGQ
	 SIsp30jOpVhwCJiOjipxrUOYFVp4ChIp/PqWLvwwKCUwaf5lf8+RSDfKQ/xexWNoVe
	 LzjU0DTDEI5w+cEbrPDn8VQrM1ouY7m3xkueE0O/YV4uEudlv8UbtMY099seZ4ySLs
	 sg5VmCl8jju91f/jCHRLbT2twapA+WejGgDRWZFiprXnOJznMfPjjwwCvDSUZEDTsh
	 NhnaB1VtjAa6w==
Date: Mon, 13 Jan 2025 17:32:45 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <20250113233245.GA442694@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4TqNn_RSwGX1TQn@macbook.local>

On Mon, Jan 13, 2025 at 11:25:58AM +0100, Roger Pau Monné wrote:
> On Fri, Jan 10, 2025 at 04:30:57PM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 10, 2025 at 03:01:50PM +0100, Roger Pau Monne wrote:
> > > Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both MSI
> > > and MSI-X entries globally, regardless of the IRQ chip they are using.  Only
> > > Xen sets the pci_msi_ignore_mask when routing physical interrupts over event
> > > channels, to prevent PCI code from attempting to toggle the maskbit, as it's
> > > Xen that controls the bit.
> > > 
> > > However, the pci_msi_ignore_mask being global will affect devices that use MSI
> > > interrupts but are not routing those interrupts over event channels (not using
> > > the Xen pIRQ chip).  One example is devices behind a VMD PCI bridge.  In that
> > > scenario the VMD bridge configures MSI(-X) using the normal IRQ chip (the pIRQ
> > > one in the Xen case), and devices behind the bridge configure the MSI entries
> > > using indexes into the VMD bridge MSI table.  The VMD bridge then demultiplexes
> > > such interrupts and delivers to the destination device(s).  Having
> > > pci_msi_ignore_mask set in that scenario prevents (un)masking of MSI entries
> > > for devices behind the VMD bridge.
> > > 
> > > Move the signaling of no entry masking into the MSI domain flags, as that
> > > allows setting it on a per-domain basis.  Set it for the Xen MSI domain that
> > > uses the pIRQ chip, while leaving it unset for the rest of the cases.
> > > 
> > > Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> > > with Xen dropping usage the variable is unneeded.
> > > 
> > > This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> > 
> > Wrap to fit in 75 columns.
> > 
> > The first two patches talk about devices behind VMD not being usable
> > for Xen, but this one says they now work.
> 
> Sorry, let me try to clarify:
> 
> Devices behind a VMD bridge are not known to Xen, however that doesn't
> mean Linux cannot use them.  That's what this series achieves.  By
> inhibiting the usage of VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal
> of the pci_msi_ignore_mask bodge devices behind a VMD bridge do work
> fine when use from a Linux Xen hardware domain.  That's the whole
> point of the series.
> 
> > But this doesn't undo the
> > code changes or comments added by the first two, so the result is a
> > bit confusing (probably because I know nothing about Xen).
> 
> All patches are needed.  There's probably some confusion about devices
> behind a VMD bridge not being known by Xen vs not being usable by
> Linux running under Xen as a hardware domain.
> 
> With all three patches applied devices behind a VMD bridge work under
> Linux with Xen.

There's certainly confusion in *my* mind because I don't know enough
about Xen to understand the subtlety about devices behind VMD not
being known by Xen but still being usable by Linux running under Xen.

Bjorn

