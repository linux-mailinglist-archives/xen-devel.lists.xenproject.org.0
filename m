Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275531CB2D9
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4xt-0001i4-2I; Fri, 08 May 2020 15:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX4xr-0001hy-9O
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:31:03 +0000
X-Inumbo-ID: ec95f682-9140-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec95f682-9140-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588951862;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5+MGsT7EyqtQLeICh9rFqTjuvOdRffCurchcqUClatM=;
 b=SpzoObUFHmGI9TOl2R32lkSmYSCMZo6u6qmutbiuxGD9KHDt4Siz7tHj
 Zij2csP21QlR7oRxx6lZXKbciQuu1OLgCTTYjk7jIUb8L1AKjZtGum69t
 K7Xr5fpmpz74ISfacng6wAQLVCyQKfo17i1duu9W3deiAEawCrsWY53kd g=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: GpVAFiZb+9fWBIHW5kac0SEi9E6bmNffs3++sIDrqvpFinArVS4ufgdGtyQ2GiHYx3WiE7/b5Y
 VwXYGXgRY3heO6s0Av0tL9GNvmnQ83Lo9LDsWIob4GJbbu9ATvcbVjvzagfa4yEQI2clN3Dm6Y
 eTidIsvPEIm8NOIemLbroYfmmhY0wie42bJMPAyQTRj6OTs69aruL+W2GkYxJQP/zRMN6I3JGP
 p7H1ralItCjcHnsspQHm42+OgIbsTdiB+6xP3hiwzTSeORW4Mcjk0Jj+zeSx9lIzXTKJJNdGR9
 oDw=
X-SBRS: 2.7
X-MesageID: 17453940
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17453940"
Subject: Re: [PATCH] tools/libxc: Reduce feature handling complexity in
 xc_cpuid_apply_policy()
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200303182326.16739-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f2d8a8cc-a949-22f0-0e26-0df2c7d5889f@citrix.com>
Date: Fri, 8 May 2020 16:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200303182326.16739-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tools ping?

~Andrew

On 03/03/2020 18:23, Andrew Cooper wrote:
> xc_cpuid_apply_policy() is gaining extra parameters to untangle CPUID
> complexity in Xen.  While an improvement in general, it does have the
> unfortunate side effect of duplicating some settings across muliple
> parameters.
>
> Rearrange the logic to only consider 'pae' if no explicit featureset is
> provided.  This reduces the complexity for callers who have already provided a
> pae setting in the featureset.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> ---
>  tools/libxc/include/xenctrl.h | 6 ++++++
>  tools/libxc/xc_cpuid_x86.c    | 7 +++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index fc6e57a1a0..8d13a7e20b 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1798,6 +1798,12 @@ int xc_cpuid_set(xc_interface *xch,
>                   const unsigned int *input,
>                   const char **config,
>                   char **config_transformed);
> +/*
> + * Make adjustments to the CPUID settings for a domain.
> + *
> + * Either pass a full new @featureset (and @nr_features), or adjust individual
> + * features (@pae).
> + */
>  int xc_cpuid_apply_policy(xc_interface *xch,
>                            uint32_t domid,
>                            const uint32_t *featureset,
> diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
> index 5ced6d18b9..f045b03223 100644
> --- a/tools/libxc/xc_cpuid_x86.c
> +++ b/tools/libxc/xc_cpuid_x86.c
> @@ -532,6 +532,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
>  
>          cpuid_featureset_to_policy(feat, p);
>      }
> +    else
> +    {
> +        if ( di.hvm )
> +            p->basic.pae = pae;
> +    }
>  
>      if ( !di.hvm )
>      {
> @@ -615,8 +620,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
>              break;
>          }
>  
> -        p->basic.pae = pae;
> -
>          /*
>           * These settings are necessary to cause earlier HVM_PARAM_NESTEDHVM /
>           * XEN_DOMCTL_disable_migrate settings to be reflected correctly in


