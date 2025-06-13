Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDBAD8CAD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 15:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014350.1392489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ42F-0005Z8-NQ; Fri, 13 Jun 2025 13:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014350.1392489; Fri, 13 Jun 2025 13:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ42F-0005Xk-Ki; Fri, 13 Jun 2025 13:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1014350;
 Fri, 13 Jun 2025 13:01:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uQ42E-0005Xe-CJ
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 13:01:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uQ42C-00H7Y4-30;
 Fri, 13 Jun 2025 13:01:28 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uQ42C-004QEa-1N;
 Fri, 13 Jun 2025 13:01:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=TLxfTk0M/zl8+aqDSMrB64PaN0fMFCrbvtx3rVjxWOg=; b=sHcc4XCqjBFkfc3B0YPaK6s5DK
	lfdf4TOsy+Tp5vFq+8V/EsH0yyXDQ+eOMlVyLUrfX8asJR3nNL6813DR4k2xFDv8UteC6HjbG2Eoi
	5yQZMMPaFLjJHJpCKhKt9IV2xEYdj9dbyrXu4/LJby0kMod0P1YsC+axM5G/wNsT34Jc=;
Date: Fri, 13 Jun 2025 15:01:26 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v5] x86/hvmloader: select xen platform pci MMIO BAR UC or
 WB MTRR cache attribute
Message-ID: <aEwhJkcTBL7u_52r@l14>
References: <20250613110009.31245-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613110009.31245-1-roger.pau@citrix.com>

On Fri, Jun 13, 2025 at 01:00:09PM +0200, Roger Pau Monne wrote:
> The Xen platform PCI device (vendor ID 0x5853) exposed to x86 HVM guests
> doesn't have the functionality of a traditional PCI device.  The exposed
> MMIO BAR is used by some guests (including Linux) as a safe place to map
> foreign memory, including the grant table itself.
> 
> Traditionally BARs from devices have the uncacheable (UC) cache attribute
> from the MTRR, to ensure correct functionality of such devices.  hvmloader
> mimics this behavior and sets the MTRR attributes of both the low and high
> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> 
> This however causes performance issues for users of the Xen platform PCI
> device BAR, as for the purposes of mapping remote memory there's no need to
> use the UC attribute.  On Intel systems this is worked around by using
> iPAT, that allows the hypervisor to force the effective cache attribute of
> a p2m entry regardless of the guest PAT value.  AMD however doesn't have an
> equivalent of iPAT, and guest PAT values are always considered.
> 
> Linux commit:
> 
> 41925b105e34 xen: replace xen_remap() with memremap()
> 
> Attempted to mitigate this by forcing mappings of the grant-table to use
> the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
> into account to calculate which PAT type to use, and seeing the MTRR cache
> attribute for the region being UC the PAT also ends up as UC, regardless of
> the caller having requested WB.
> 
> As a workaround to allow current Linux to map the grant-table as WB using
> memremap() introduce an xl.cfg option (xen_platform_pci_bar_uc=0) that can
> be used to select whether the Xen platform PCI device BAR will have the UC
> attribute in MTRR.  Such workaround in hvmloader should also be paired with
> a fix for Linux so it attempts to change the MTRR of the Xen platform PCI
> device BAR to WB by itself.
> 
> Overall, the long term solution would be to provide the guest with a safe
> range in the guest physical address space where mappings to foreign pages
> can be created.
> 
> Some vif throughput performance figures provided by Anthoine from a 8
> vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
> 
> Without this patch:
> vm -> dom0: 1.1Gb/s
> vm -> vm:   5.0Gb/s
> 
> With the patch:
> vm -> dom0: 4.5Gb/s
> vm -> vm:   7.0Gb/s
> 
> Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com> # hvmloader
> ---
> Changes since v4:
>  - Rename to Xen platform PCI to avoid confusion.
>  - Set hvmloader BAR default to UC.
>  - Unconditionally write XS node in libxl.
>  - Introduce define for Xen PCI vendor ID.

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

