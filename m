Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B01BF5C6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6dr-0008DJ-4C; Thu, 30 Apr 2020 10:42:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jU6dq-0008DE-5h
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:42:06 +0000
X-Inumbo-ID: 3b71a09e-8acf-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b71a09e-8acf-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588243325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uYM6bDQJzrQLgCW/7eeeoqfzMnwT9rFLZiGFOJHen4k=;
 b=b+fDGYdO6BobacvpSu5HajPCLFX+U9mGrp7QOHCB+UWmJNCyUy6Puxd1
 S8XgPzs9wUYnIzZc9eZDepmUm+AGvJ5iCi+t1LkjbtC5y7u9C71y4ec2K
 C31GctdswyIMqBdRPZo3MxIdyjXREFyZZAkTuc0GneNkWSs1ZcYgqe8RM c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4oieARdwbP9SgqvQXcEgC0K6wiB/5KbykvgSTBZMHDkkbkY1fYiSqVAZrrFyU+WRrkzaCHm/6+
 V5Ci9a6NYMr5cOlgt4i1xe/eDKHaSYBThplA+HwMc3ZDrBZhv4V0+bMQZTyeeM7uOABA8DUhMp
 L1K4uKANdJnRzZdgYf3Vme4TP3e82aKJzudTaKyv8jHlFJN1KIBhw8u1RkWK/WqSo5uHBnasGG
 GLxnhiPiXKTsQ6EApA9oHfUhbURBvvszOswMiIe+Knzfzeel6oConb4rr950r2KxlWpqh7bowP
 MNo=
X-SBRS: 2.7
X-MesageID: 16896266
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16896266"
Date: Thu, 30 Apr 2020 12:41:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: Initial support for Fam19h processors
Message-ID: <20200430104158.GD28601@Air-de-Roger>
References: <20200430095947.31958-1-andrew.cooper3@citrix.com>
 <20200430103528.GC28601@Air-de-Roger>
 <9ae757ef-1cc4-98ef-8b68-161b0717ac22@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ae757ef-1cc4-98ef-8b68-161b0717ac22@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 11:38:14AM +0100, Andrew Cooper wrote:
> On 30/04/2020 11:35, Roger Pau Monné wrote:
> > On Thu, Apr 30, 2020 at 10:59:47AM +0100, Andrew Cooper wrote:
> >> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> >> index c3f92ed231..014524486f 100644
> >> --- a/xen/arch/x86/nmi.c
> >> +++ b/xen/arch/x86/nmi.c
> >> @@ -398,7 +398,7 @@ void setup_apic_nmi_watchdog(void)
> >>      case X86_VENDOR_AMD:
> >>          switch (boot_cpu_data.x86) {
> >>          case 6:
> >> -        case 0xf ... 0x17:
> >> +        case 0xf ... 0x19:
> >>              setup_k7_watchdog();
> >>              break;
> >>          default:
> >> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> >> index 0bcf554e93..33e5d21ece 100644
> >> --- a/xen/arch/x86/traps.c
> >> +++ b/xen/arch/x86/traps.c
> >> @@ -1939,7 +1939,7 @@ static unsigned int calc_ler_msr(void)
> >>          switch ( boot_cpu_data.x86 )
> >>          {
> >>          case 6:
> >> -        case 0xf ... 0x17:
> >> +        case 0xf ... 0x19:
> >>              return MSR_IA32_LASTINTFROMIP;
> > You seem to also add support for Fam18h here and in the chunk above,
> > is this intentional?
> 
> Yes.  Honestly, these details have never changed since the K7.  I'm
> tempted to drop the family logic entirely.

Ack, just wanted to be sure the changes where intentional:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Re dropping the logic - as you wish.

Thanks, Roger.

