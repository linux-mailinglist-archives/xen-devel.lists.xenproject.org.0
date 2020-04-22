Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F21B3A00
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 10:27:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRAi5-0002Di-KK; Wed, 22 Apr 2020 08:26:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRAi4-0002Dd-Gk
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 08:26:20 +0000
X-Inumbo-ID: f0393586-8472-11ea-9238-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0393586-8472-11ea-9238-12813bfff9fa;
 Wed, 22 Apr 2020 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587543979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y7amq8xTpcuto+AQMGhQqS4CzWMbMKrxCXwkwHmR2r8=;
 b=hMPJYR11ocR777uDreKmzjW9k1ke9AibE9lRu1b1LiPbHU0xpKojOa04
 h/abCdafzTEODLyj+AdDZ6QRzUc2ALVqkLkcQjDRD1KeFNFJhIM5CIVzk
 dIOutm6J7kQragrtrr/qOXRGwbroEcQrKB4V+QlNu3T/NiwnUgIWCPFZh U=;
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
IronPort-SDR: xpqxiZcoef+9nCFki3DxDWdEbWTd4fpPy2cRsxIPb3iGxqYvE282B60LNx1l1+llOOpuvNHova
 1tZanj7Q6yvGFsqrtRLwcLLk/D6Zzuv3EwoijrW4VGrO1GtKDVjrcXFi533xwjVeNFwCQNPtqh
 UUVY7snCvZmgoyYa1aV8Uo4wL42GcZC3p3eeqsVTfjuojqNkKeo0uvijF21dSLqSUUes9smmGa
 0nxMevHXMVj8OyZJa5CHPRgwcc50mUqxo4RICgnbp1+UfYTWXIpQ0pLPrU9KMLRB15cvCPpdmG
 xxg=
X-SBRS: 2.7
X-MesageID: 16066424
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,413,1580792400"; d="scan'208";a="16066424"
Date: Wed, 22 Apr 2020 10:26:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
Message-ID: <20200422082610.GA28601@Air-de-Roger>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
> First of all avoid excessive conversions. copy_{from,to}_guest(), for
> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
> 
> Further
> - do_physdev_op_compat() didn't use the param form for its parameter,
> - {hap,shadow}_track_dirty_vram() wrongly used the param form,
> - compat processor Px logic failed to check compatibility of native and
>   compat structures not further converted.
> 
> As this eliminates all users of guest_handle_from_param() and as there's
> no real need to allow for conversions in both directions, drop the
> macros as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -492,7 +492,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op
>      return ret;
>  }
>  
> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32) pdc)
> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32) pdc)

Nit: switch to uint32_t while there?

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

