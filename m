Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AA2FBBA4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70550.126634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1tJF-0000a6-E2; Tue, 19 Jan 2021 15:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70550.126634; Tue, 19 Jan 2021 15:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1tJF-0000Zh-Ak; Tue, 19 Jan 2021 15:52:45 +0000
Received: by outflank-mailman (input) for mailman id 70550;
 Tue, 19 Jan 2021 15:52:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXsN=GW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1l1tJD-0000Zc-Lr
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:52:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ee63918-f56b-4789-b894-d26ab7f42b4e;
 Tue, 19 Jan 2021 15:52:42 +0000 (UTC)
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
X-Inumbo-ID: 4ee63918-f56b-4789-b894-d26ab7f42b4e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611071562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGgBwsi4p5FyA2vaxH2uW9hggNEBCHSFZHK5BydXLd0=;
  b=a3CESiSBCYrlLkBhnGn1sdgKHSUbUIjRmYrP5trFSRLgv+qVRgl/u+Q7
   m9O6ihThumVzStYA9R3TuBBVzEyJ+VlHPI1Vupf2N1HTAJAB9CqqM/J5g
   zgrTAReNd0B/nBAQ968F3C8jm4ioEN1FB70ODJyUMFuqdgPXTiEtn3M9M
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uB9BvnCeXG/ji9vPUkoeqf6xQHvQvn8a72B2/0pwPnKdh7N1bXK7kJt50eQuGwRgZiILXIs9LO
 sl64O2PcrBtJRZat3LssubpL9QDC5kLtJRg+qlFKYYrWPcJtkdLHykDe0DpzlYrL9BheNqjLYG
 k5lUU1u1UDcJjct6uqr7oWD/kAkBMktLmXTyCDS1RcMPnXJaoFohD3LVAsjF8a4c9ErTuUVYpW
 vclZdToa/w3v2OLcZfwnXhsG4VtQnEd16261wLgfVU+ysUAX8KRdLtBgzT3Ey1tH+D9ym3VjtU
 8N0=
X-SBRS: 5.1
X-MesageID: 35384794
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35384794"
Date: Tue, 19 Jan 2021 15:52:38 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>, <lersek@redhat.com>
CC: <julien@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>, <jordan.l.justen@intel.com>,
	<ard.biesheuvel@arm.com>
Subject: Re: [edk2-devel] [PATCH] OvmfPkg/XenPlatformPei: Use CPUID to get
 physical address width on Xen
Message-ID: <YAcARq/M7ouaD1c1@perard.uk.xensource.com>
References: <1610509335-23314-1-git-send-email-igor.druzhinin@citrix.com>
 <2a806f26-04f7-a96b-522c-118ac94df8c0@xen.org>
 <0d7ad7aa-cfa9-5f2c-26e3-6b371737f6bc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0d7ad7aa-cfa9-5f2c-26e3-6b371737f6bc@redhat.com>

On Tue, Jan 19, 2021 at 03:49:34PM +0100, Laszlo Ersek wrote:
> On 01/19/21 10:37, Julien Grall wrote:
> > Hi Igor,
> > 
> > On 13/01/2021 03:42, Igor Druzhinin wrote:
> >> We faced a problem with passing through a PCI device with 64GB BAR to
> >> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
> >> 64G address which pushes physical address space to 37 bits. That is above
> >> 36-bit width that OVMF exposes currently to a guest without tweaking
> >> PcdPciMmio64Size knob.
> >>
> >> The reverse calculation using this knob was inhereted from QEMU-KVM
> >> platform
> >> code where it serves the purpose of finding max accessible physical
> >> address without necessary trusting emulated CPUID physbits value (that
> >> could
> >> be different from host physbits). On Xen we expect to use CPUID policy
> >> to level the data correctly to prevent situations with guest physbits >
> >> host physbits e.g. across migrations.
> >>
> >> The next aspect raising concern - resource consumption for DXE IPL
> >> page tables
> >> and time required to map the whole address space in case of using CPUID
> >> bits directly. That could be mitigated by enabling support for 1G pages
> >> in DXE IPL configuration. 1G pages are available on most CPUs produced in
> >> the last 10 years and those without don't have many phys bits.
> >>
> >> Remove all the redundant code now (including PcdPciMmio64.. handling
> >> that's
> >> not used on Xen anyway) and grab physbits directly from CPUID that should
> >> be what baremetal UEFI systems do.
> >>
> >> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> > 
> > Reviewed-by: Julien Grall <julien@xen.org>
> 
> I'm going to hold this patch until Anthony responds in this thread as well:

This new patch is fine, I didn't notice that it was a replacement for
the previous one.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

