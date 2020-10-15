Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036428F157
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 13:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7273.18974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT1U0-0003Hj-3u; Thu, 15 Oct 2020 11:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7273.18974; Thu, 15 Oct 2020 11:31:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT1U0-0003HK-0b; Thu, 15 Oct 2020 11:31:44 +0000
Received: by outflank-mailman (input) for mailman id 7273;
 Thu, 15 Oct 2020 11:31:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT1Tz-0003HF-Bn
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 11:31:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb00959c-74d3-4245-8149-5e6e3c81f928;
 Thu, 15 Oct 2020 11:31:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT1Tz-0003HF-Bn
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 11:31:43 +0000
X-Inumbo-ID: bb00959c-74d3-4245-8149-5e6e3c81f928
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bb00959c-74d3-4245-8149-5e6e3c81f928;
	Thu, 15 Oct 2020 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602761501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JaKKGt3d+i+nh0Sf/oHSA2TVHCS6q9lA/II9WTvsiHI=;
  b=NkMTXy6YUvAk3MKvr2cb5u5/tW5f15ePiJkQ+UOKrEqb86t0BBWBgW48
   pkQILHik67WuZc06GzfhHn2tP6CG8Gzor+W5wTamjD9UO2wyIhiYXV2ux
   avRYXSdVcpdOgGommbZeqGeGKhFkIAnAwjdidYw+W2J8Xl381+FGUmEiz
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RTxSUs8l+PfyoDrEqhblrAMlIjAPi4B35dQozjF52rakKudSspVBFEp++RApEw57Kq1MBrOhEv
 +y/JW6VwM0kfES4d7GN7Chx049SKFoCm1kP/XsuxrdjXwWr8Jr1J7vre3OX7pUyK3CJDpRrfeM
 XpdLLcgLEcJZ6iKbTGh5hfGgYma7ILqJ7iDP1T9/5l8Q84yk0xnTb6ZY3cliTNTNlemZyHOV+B
 6cf+bd3v+W7xz/eK69xtYZ/na3uJdT5RwfAjVAXhGE4Jp93Ad141PASZsyN+ntBcYvXuhHauRx
 1Ug=
X-SBRS: 2.5
X-MesageID: 29314360
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,378,1596513600"; 
   d="scan'208";a="29314360"
Date: Thu, 15 Oct 2020 13:31:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<intel-gfx@lists.freedesktop.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: i915 dma faults on Xen
Message-ID: <20201015113109.GA68032@Air-de-Roger>
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 14, 2020 at 08:37:06PM +0100, Andrew Cooper wrote:
> On 14/10/2020 20:28, Jason Andryuk wrote:
> > Hi,
> >
> > Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/2576
> >
> > I'm seeing DMA faults for the i915 graphics hardware on a Dell
> > Latitude 5500. These were captured when I plugged into a Dell
> > Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.4
> > staging and Linux 5.4.70 (and some earlier versions).
> >
> > Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handler
> > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handler
> > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =
> > ffff82c00021d000
> > Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > PTE Read access is not set
> > Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handler
> > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handler
> > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =
> > ffff82c00021d000
> > Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > PTE Read access is not set
> >
> > They repeat. In the log attached to
> > https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start at
> > "Oct 14 18:41:49.056589" and continue until I unplug the dock around
> > "Oct 14 18:41:54.801802".
> >
> > I've also seen similar messages when attaching the laptop's HDMI port
> > to a 4k monitor. The eDP display by itself seems okay.
> >
> > I tried Fedora 31 & 32 live images with intel_iommu=on, so no Xen, and
> > didn't see any errors
> >
> > This is a kernel & xen log with drm.debug=0x1e. It also includes some
> > application (glass) logging when it changes resolutions which seems to
> > set off the DMA faults. 5500-igfx-messages-kern-xen-glass
> >
> > Running xen with iommu=no-igfx disables the iommu for the i915
> > graphics and no faults are reported. However, that breaks some other
> > devices (Dell Latitude 7200 and 5580) giving a black screen with:
> >
> > Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Failed
> > to idle engines, declaring wedged!
> > Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Failed
> > to initialize GPU, declaring it wedged!
> >
> > Any suggestions welcome.
> 
> Presumably this is with a PV dom0.  What are 39b5845000 and 4238d0a000
> in the machine memory map?
> 
> This smells like a missing RMRR in the ACPI tables.

I agree.

Can you paste the memory map as printed by Xen when booting, and what
command line are you using to boot Xen.

Have you tried adding dom0-iommu=map-inclusive to the Xen command
line?

Roger.

