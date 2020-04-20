Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC11B0D36
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:48:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWmN-00020m-DB; Mon, 20 Apr 2020 13:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2FAk=6E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQWmL-00020h-TX
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:48:05 +0000
X-Inumbo-ID: 8ef9d962-830d-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef9d962-830d-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587390486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2NElD+U/1cEa4jqn3EeFINWbuMVySiRvo1hS95d1zH4=;
 b=V+RflgJnyZ/TY/Kj5KMpDgT6hR16Pag34LQeRlWsCYRqwzy3ACVfIu2v
 wCyKd3a+MAzGATgGXmA/IolO87/cdwXgXCyzSa5aQR4JY3lKh4FdbRQlA
 kjoMQLxSvyB8iHy243qg3M0830fZhmhAVo9nkMbwGB3dxcvzqjDOxFe+N k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wtr3FQppgT4kf7DOPZIrmcD6ZcKl/z5owwStwrFadIVBw9nqLVfHzS+5gGSNe181hV4ha6sHQK
 bl7Ee+HFXbAWvSI/HoZXbrkIrhs9zQD4WEOkqDwgHKLIyOzoDoMoZYtdufbdydphX+g4q5Yo+c
 8DrbnIhjFzyNF04omdehH5K75hXC4TShcj/sGTMNL44bHML8bOv7nX4X3A3OkaUf3wURoxtF3c
 Bv0GjsOfeURpS/5i5nObHHRq3q+0AKNPijDXAaYhrCd0Nd+E0qZ/APJUnjriBy42k+BpSbE2Wx
 cBc=
X-SBRS: 2.7
X-MesageID: 15953093
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="15953093"
Date: Mon, 20 Apr 2020 15:47:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
Message-ID: <20200420134757.GS28601@Air-de-Roger>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200417155004.16806-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 04:50:02PM +0100, Andrew Cooper wrote:
> This is the start of some performance and security-hardening improvements,
> based on the fact that 32bit PV guests are few and far between these days.
> 
> Ring1 is full or architectural corner cases, such as counting as supervisor
                ^ of
> from a paging point of view.  This accounts for a substantial performance hit
> on processors from the last 8 years (adjusting SMEP/SMAP on every privilege
> transition), and the gap is only going to get bigger with new hardware
> features.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> There is a series I can't quite post yet which wants to conditionally turn
> opt_pv32 off, which is why I've put it straight in in an int8_t form rather

s/in in/in/

> than a straight boolean form.
> ---
>  docs/misc/xen-command-line.pandoc | 12 +++++++++++-
>  xen/arch/x86/Kconfig              | 16 ++++++++++++++++
>  xen/arch/x86/pv/domain.c          | 35 +++++++++++++++++++++++++++++++++++
>  xen/arch/x86/setup.c              |  9 +++++++--
>  xen/include/asm-x86/pv/domain.h   |  6 ++++++
>  5 files changed, 75 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index acd0b3d994..ee12b0f53f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1694,7 +1694,17 @@ The following resources are available:
>      CDP, one COS will corespond two CBMs other than one with CAT, due to the
>      sum of CBMs is fixed, that means actual `cos_max` in use will automatically
>      reduce to half when CDP is enabled.
> -	
> +
> +### pv
> +    = List of [ 32=<bool> ]
> +
> +    Applicability: x86
> +
> +Controls for aspects of PV guest support.
> +
> +*   The `32` boolean controls whether 32bit PV guests can be created.  It
> +    defaults to `true`, and is ignored when `CONFIG_PV32` is compiled out.
> +
>  ### pv-linear-pt (x86)
>  > `= <boolean>`
>  
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 8149362bde..4c52197de3 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -49,6 +49,22 @@ config PV
>  
>  	  If unsure, say Y.
>  
> +config PV32
> +	bool "Support for 32bit PV guests"
> +	depends on PV
> +	default y
> +	---help---
> +	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
> +	  was deprecated and mostly removed in the AMD64 spec.  As a result,
> +	  it occasionally conflicts with newer x86 hardware features, causing
> +	  overheads for Xen to maintain backwards compatibility.
> +
> +	  People may wish to disable 32bit PV guests for attack surface
> +	  reduction, or performance reasons.  Backwards compatibility can be
> +	  provided via the PV Shim mechanism.
> +
> +	  If unsure, say Y.
> +
>  config PV_LINEAR_PT
>         bool "Support for PV linear pagetables"
>         depends on PV
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 70fae43965..47a0db082f 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -16,6 +16,39 @@
>  #include <asm/pv/domain.h>
>  #include <asm/shadow.h>
>  
> +#ifdef CONFIG_PV32
> +int8_t __read_mostly opt_pv32 = -1;
> +#endif
> +
> +static int parse_pv(const char *s)

__init

With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

