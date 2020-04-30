Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E61BF59F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:36:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6Xf-0007Jk-5l; Thu, 30 Apr 2020 10:35:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jU6Xd-0007Jf-3n
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:35:41 +0000
X-Inumbo-ID: 54ea7ec1-8ace-11ea-9a1f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54ea7ec1-8ace-11ea-9a1f-12813bfff9fa;
 Thu, 30 Apr 2020 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588242939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b1jSX8WWP+O6RhMgYTtNX8VYzmI+wHx5nFiZBRwR9wM=;
 b=PuYvAsV3tlkTcXhOLHMpBD2SGdfaftJl+w+sq/hAVbcq2voiDHNdJhdF
 UFuh1QLlaC2GMK9iYC3XQFcSGxx+5pI5vGLOq5dXiN7r28xHxFuZqJ0Ct
 EIPWirBQXvNII6dMrzKkaEqXEisNW6VSfRF4RTijcTo4EoZmfycl2zl5N E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9wmQUI7Y/J/JVVHT7l3vKSy8QgErDhWuxyOM1ujkpOdAvgL+HCJYegi5obES0wmAfSUJmOJlqW
 QTW5ZUv93d9v2FgdxYFJYmGmMcmv31xikBzFBYV2nbzsnpAcVL4LktTZblrr+mWv3MpvSGATZe
 s5cef8nQY8d1ScCd4g+LORcO95ru8mjYTRW48TRM+p1k8ddyjvbSzKbNmzAkLDBpkGDVfYsyxB
 zExCLQGealL72UdvBiWgHnTBn/aH/uCKe1w0+6tUQcbnZCyChngxKD3fI4qZ7Z0+BTU6ogMtS7
 PvM=
X-SBRS: 2.7
X-MesageID: 16483360
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16483360"
Date: Thu, 30 Apr 2020 12:35:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: Initial support for Fam19h processors
Message-ID: <20200430103528.GC28601@Air-de-Roger>
References: <20200430095947.31958-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200430095947.31958-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 10:59:47AM +0100, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> index c3f92ed231..014524486f 100644
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -398,7 +398,7 @@ void setup_apic_nmi_watchdog(void)
>      case X86_VENDOR_AMD:
>          switch (boot_cpu_data.x86) {
>          case 6:
> -        case 0xf ... 0x17:
> +        case 0xf ... 0x19:
>              setup_k7_watchdog();
>              break;
>          default:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 0bcf554e93..33e5d21ece 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1939,7 +1939,7 @@ static unsigned int calc_ler_msr(void)
>          switch ( boot_cpu_data.x86 )
>          {
>          case 6:
> -        case 0xf ... 0x17:
> +        case 0xf ... 0x19:
>              return MSR_IA32_LASTINTFROMIP;

You seem to also add support for Fam18h here and in the chunk above,
is this intentional?

Thanks, Roger.

