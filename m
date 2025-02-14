Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE2A3643E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 18:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888957.1298212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tizK6-0002qD-4A; Fri, 14 Feb 2025 17:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888957.1298212; Fri, 14 Feb 2025 17:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tizK6-0002o4-1S; Fri, 14 Feb 2025 17:17:54 +0000
Received: by outflank-mailman (input) for mailman id 888957;
 Fri, 14 Feb 2025 17:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iqD=VF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tizK4-0002ny-3q
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 17:17:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfba7da-eaf7-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 18:17:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D5F795C5A43;
 Fri, 14 Feb 2025 17:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96A6C4CED1;
 Fri, 14 Feb 2025 17:17:48 +0000 (UTC)
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
X-Inumbo-ID: 9dfba7da-eaf7-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739553469;
	bh=mbtek7G6QX8aERqHrVmfWL6b3yFQDL+ffEFAs64qKXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eWqKzPoOhomeHVcODhh3qVSpJ7vmTP7HfK3zdrl/hd/Yz7gti8ZhA/UygjfYpXIRJ
	 ItzDBpPNkA/O1NfOw2vS5ew8JOmhcxFsauoQEHLlxujCcmnvHV+ZA3BUgIbwo95UIN
	 5ndlqdGPRpJ6GskQlVbl0X2S24xb+7NqpAsMUfJDuQC7Hz2pDr2Cx9OSys0S/JEXTa
	 WGu/p1nzDRQqHSYTTh43ESxmL8Rt1vrRtIqW5U4XW/68rZv0xWDAH9yJ77EBgc0tY4
	 KqeFC7o4sVywJki0AyY7yyd4MmUjCdNeBeoR83Bn2BuTApj8I7HLWaQJntYJIgo8S3
	 abnPRy9JRat2Q==
Date: Fri, 14 Feb 2025 11:17:45 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: Re: [PATCH v2 0/3] xen: fix usage of devices behind a VMD bridge
Message-ID: <20250214171745.GA157045@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114103315.51328-1-roger.pau@citrix.com>

[+to Juergen, Nirmal, +cc Jonathan]

On Tue, Jan 14, 2025 at 11:33:10AM +0100, Roger Pau Monne wrote:
> Hello,
> 
> The following series should fix the usage of devices behind a VMD bridge
> when running Linux as a Xen PV hardware domain (dom0).  I've only been
> able to test PV. I think PVH should also work but I don't have hardware
> capable of testing it right now.
> 
> I don't expect the first two patches to be problematic, the last patch
> is likely to be more controversial.  I've tested it internally and
> didn't see any issues, but my testing of PV mode is mostly limited to
> dom0.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   xen/pci: do not register devices with segments >= 0x10000
>   vmd: disable MSI remapping bypass under Xen
>   pci/msi: remove pci_msi_ignore_mask
> 
>  arch/x86/pci/xen.c           |  8 ++------
>  drivers/pci/controller/vmd.c | 19 ++++++++++++++++++
>  drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
>  drivers/xen/pci.c            | 19 ++++++++++++++++++
>  include/linux/msi.h          |  3 ++-
>  kernel/irq/msi.c             |  2 +-
>  6 files changed, 64 insertions(+), 24 deletions(-)

We got an ack from Thomas, so I'm fine with this from a PCI
perspective.  How should it be merged?  Via Xen or PCI?  I'm happy to
merge via PCI, but would also want acks from Juergen for the Xen
piece and Nirmal for the VMD piece.

I have a couple more trivial comments, will respond to those patches.

