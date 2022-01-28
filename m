Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8949FE9D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 18:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262105.454203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDUg8-0005GA-Ox; Fri, 28 Jan 2022 17:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262105.454203; Fri, 28 Jan 2022 17:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDUg8-0005DU-Kw; Fri, 28 Jan 2022 17:04:52 +0000
Received: by outflank-mailman (input) for mailman id 262105;
 Fri, 28 Jan 2022 17:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDUg6-0005D7-ST
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 17:04:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6531e45b-805c-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 18:04:48 +0100 (CET)
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
X-Inumbo-ID: 6531e45b-805c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643389489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5H0JcPSfrpDUuApqPHSiDE05M25uq2O3xA3RqucXv/s=;
  b=GuZa8NS2W7M9kx6WSEuzZuAuTqxwWY1BhVjzforaFFM3kDbQfzOacn63
   3DspSiRHWCahjwRKXzrlD3eCH4UB519yAJTJLe2bv1iaAmf7hkfuAg2wt
   EehXqcVLHq5bVb97L2n1anAvdHieUNo2BxR8VlD3YnrUSDNp7q4OLSTsi
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: E/vmO0mbzqlUL2oLX6XdwFLIcrdzET61SMqEthP68i9w1gEenzzGRuhQGw+66pLOPxbefPL2VD
 FaLCZ9e7exCwUeIHcZdvqa8KAyR9kAUXpyFYRwKl/8aJ5vf+XXVnJk2qV8DGJjYPuOiMekdpUc
 uMwOqlDUuaQr52PnwfUz2Kq0WBopxppaeO7JaX4rTWXm5w+2ITDnKYL14cxL4ZxgHGknGB1lpx
 E93YDQafylkV0S32nryjRl9ZIiNDjgDmZFcfR2QJPt6GJjvjQHXJsgY2+ZQpqJmzD9fJgb29jl
 SUFXssY/BapBEwH/pjSOqwFt
X-SBRS: 5.2
X-MesageID: 63000957
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WJdH+64qim+Gouw0utR2xwxRtFPBchMFZxGqfqrLsTDasY5as4F+v
 jcbDzzSOveNZGHyfdtzPYy+9x4HuJSDx9BkHQBp+CkzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2N4w3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zi
 +UQ9s2bFx8TJvOLmPZNAz90HTtSIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRq6GP
 5tENlKDajz4SiV3OUZKNKgXmcKCgnvBQSUHoXe88P9fD2/7k1UqjemF3MDuUuKNQcJZj0OJv
 FXs9m7yAgwZHNGHwD/D+XWp7sfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXOxrOOlkEe4V5RaI
 lYN5ys1haEo8QqgSdyVdx61vn+C+AIdUtx4Eusm5QXLwa3Riy6bG25CSDdCYd4nscYeRDo22
 1vPlNTsbRRwtJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTP/2
 TeRtwAlmq4ey8UM0s2T/03Dgj+qjojESEgy/Aq/dmCv4x59ZYWlT5e18lWd5vFFRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApnq16vGYRaCmWR3Qd4h5WT93VKtZ6xPtWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxk/G+SI2NuuT8K4MXP8MvLFPvEDRGOBbIt10BhnTAhk3W1
 X2zVc+3RUgXBq18pNZdb7dMiOR7rszSKI66eHwa8/hF+efGDJJ2Ye1cWLdrUgzfxPnZyOky2
 40HX/ZmMz0FDIXDjtD/qOb/12wiI3khHozRoMdKbOOFKQcOMDh/V6SLmut6JdE9wvU9egL0E
 peVABEwJL3X3iWvFOl3Qio7NOOHsWhX8xrXwhDAzX73giN+MO5DHY8UdoctfKlPyQCQ5aUcc
 hXxQO3ZWq4nYm2eo1w1NMChxKQ/KkjDrV/QbkKNPWhuF7Y9Fleh0oK1IWPSGNwmU3DfWT0W+
 ePwj2s2gPMrGmxfMSohQKvxlwvv5SRMx7MasomhCoA7RXgAObNCc0TZ5sLb6elVQfka7jfFh
 QuQHzkCouzB/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy+YB6wu7U
 06C4PdAPrCNNJ+3GVIdPlN9PO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI58m
 LUvos8b7QC7myEGCNfeg3AG7XmII1wBT74j6sMQDrj0h1d50VpFe5HdVHP7ucndd9VWP0A2C
 TaIn66e1a9Ez0/PfndvR3jA2e1R2cYHtBxQlQJQIl2InpzOh+Mt3Q0X+jMyF1wHwhJC2uN1G
 25qK0wqevneo2Y23JBODzK2BgVMJByF4UigmVIGmVrQQ1SsSmGQfnY2PvyA/RxB/m9RFtSBE
 Gp0FIoxve7WQfzM
IronPort-HdrOrdr: A9a23:NggfmqgtN1aHVlP/m2GwjOE6KHBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="63000957"
Date: Fri, 28 Jan 2022 17:04:35 +0000
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
Subject: Re: [PATCH 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YfQiIzxNMVDAGz7p@perard>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-2-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220127160133.11608-2-jane.malalane@citrix.com>

On Thu, Jan 27, 2022 at 04:01:32PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  tools/golang/xenlight/helpers.gen.go |  4 ++++
>  tools/golang/xenlight/types.gen.go   |  6 ++++++

Note for committers: Please regenerate the go bindings, there are
out-of-sync with libxl_types.idl at the moment.

> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 1feadebb18..33da51fe89 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              xc_physinfo_t xcphysinfo)

It might be better to pass "xcphysinfo" as a pointer, otherwise I think
a copy of the whole struct is made when calling this function.


In any case, the tool part of the patch looks good:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

