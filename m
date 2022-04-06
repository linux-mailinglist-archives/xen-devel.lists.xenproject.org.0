Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B494F66F0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 19:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300072.511639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9Np-0004Yy-1c; Wed, 06 Apr 2022 17:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300072.511639; Wed, 06 Apr 2022 17:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9No-0004WT-UO; Wed, 06 Apr 2022 17:23:52 +0000
Received: by outflank-mailman (input) for mailman id 300072;
 Wed, 06 Apr 2022 17:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ELh=UQ=citrix.com=prvs=088becc42=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nc9Nn-0004WN-JJ
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 17:23:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52088294-b5ce-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 19:23:50 +0200 (CEST)
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
X-Inumbo-ID: 52088294-b5ce-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649265830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qCFm7rZTSQ9dvwmFPGhB7Tg1OFCm4Ymp1oDTQlM4XeI=;
  b=P5Yvi7BnolqObZjOPbGwz8VxDkc0BKCvJX70j2CvC9RAq/QervMXKpGu
   NJQUEw+M31L+e8nF8vpeB+QhpcTRLLAvDT3FNyohu9Jx/gZONanjJoPdK
   zLVkbmAun44acwtW0+s8huzY3HtY+NZS/n6fHwaSQ8lC0pMcZfvmA4gHO
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68078984
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5IIdeKOtR/Wb7T7vrR09l8FynXyQoLVcMsEvi/4bfWQNrUp31jQDz
 TFOC23Ta6uKZDb0edEkb4rkp0tS78XUy94wTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 dhfvL6odUAVF/fFqeMWdV5KFg0lIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQTa6BN
 5tJNVKDajz+Sgd2Eww8UagSv+OshVbSLTB6hwq88P9fD2/7k1UqjemF3MDuUuKNQcJZj0OJv
 FXs9m7yAgwZHNGHwD/D+XWp7sfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXOxrOOlkEe4V5RaI
 lYN5ys1haEo8QqgSdyVdx61vn+C+AIdUtx4Eusm5QXLwa3Riy6bG25CSDdCYd4nscYeRDo22
 1vPlNTsbRRwtJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTP/2
 TeRtwAlmq4ey8UM0s2T/03Dgj+qjojESEgy/Aq/dmCv4x59ZYWlT5e18lWd5vFFRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApmU6uSMEiXgxmJGRZAQ8D+LvGymUdtPtWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxk/G+SI2NuuT8K4MXP8MvLFPvEDRGPxb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjOL2iJ29E+5t3L6yggYRtv3sTOL9q
 Ys3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99WqaBneNxK9w6xMy5c9skG
 FnnBCe0L3Kl2xX6xfiiMCg/ONsDo74hxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXQnKVb1GQkjMSVlC0r3dm4+venZZWn
 oBMISuAGMBZGls7UJiNAB9tpnvo1UUgdCtJdxOgCrFulI/EquCG9wSZYicLHvwx
IronPort-HdrOrdr: A9a23:QwSYpaP4/L3N5sBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68078984"
Date: Wed, 6 Apr 2022 18:23:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v9 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yk3Mn1uJ8S279Fbk@perard.uk.xensource.com>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-2-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220401104713.22291-2-jane.malalane@citrix.com>

On Fri, Apr 01, 2022 at 11:47:12AM +0100, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
> x2APIC, on x86 hardware. This is so that xAPIC and x2APIC virtualization
> can subsequently be enabled on a per-domain basis.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com> # tools

-- 
Anthony PERARD

