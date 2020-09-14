Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69756268F89
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqH0-0001MN-F4; Mon, 14 Sep 2020 15:20:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHqGy-00016W-OH
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:20:04 +0000
X-Inumbo-ID: aff5d818-1ed5-4d2a-870a-4a2f8223cd65
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aff5d818-1ed5-4d2a-870a-4a2f8223cd65;
 Mon, 14 Sep 2020 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600096803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=clUVs0qED1rtt0rOzWTLMJBqH3eC6rKZpECZcqdC9bA=;
 b=fmUu0e9pPhmqN3WQ/qQRQuVlbUuZEwDMzJUX5Cz9s4l35s2aqtCvxTs5
 fsX11pCKS0Tha6AAtzOP8fm2Vsmlsd0OBDoSfgqvuzdbGpFV/paD6VPdI
 ofr9j/1k8cj75eMnbZJIOS36tyNbqrUC7misMKiEeRqXFvQMsxF1RN0Om w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Pt4nxJNj86t/brF4ZvmrNerx/MjL111T5Kpll7szF/CrxR7qPo085D0oi6L/kEOknJkCWjNjP6
 KNoE8O7AoVQuQYnun+Bgk7F0YDqlLVRTXjxqN7NOl//PW5A8+UqEWbUjMdoQz+1G7Bj0Ik8LKz
 Ug9ZKi/+a1AhSDT+V1BnM1Vu0FKNfyjMOFjVtxmSZNmajDe7QNe2ABRo87gf7ty1KKIVdxnkTY
 TsHCwbljBD/ij3YC/Jz2gM6hVFD22aj7zdI8PZ1Ce0RV44HqWC8XA5MVih6norwzh1TFI2z3d7
 B0Y=
X-SBRS: 2.7
X-MesageID: 26764229
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26764229"
Date: Mon, 14 Sep 2020 17:19:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200914151956.GG753@Air-de-Roger>
References: <20200910035723.GY1626@mail-itl>
 <20200910085148.GU753@Air-de-Roger>
 <20200910102921.GZ1626@mail-itl>
 <20200910104104.GW753@Air-de-Roger>
 <20200910105854.GA1626@mail-itl> <20200913111239.GB3962@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200913111239.GB3962@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Sep 13, 2020 at 01:12:39PM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, Sep 10, 2020 at 12:58:57PM +0200, Marek Marczykowski-Górecki wrote:
> > On Thu, Sep 10, 2020 at 12:41:04PM +0200, Roger Pau Monné wrote:
> > > Adding toolstack maintainers.
> > > 
> > > On Thu, Sep 10, 2020 at 12:29:21PM +0200, Marek Marczykowski-Górecki wrote:
> > > > On Thu, Sep 10, 2020 at 10:51:48AM +0200, Roger Pau Monné wrote:
> > > > > On Thu, Sep 10, 2020 at 05:57:23AM +0200, Marek Marczykowski-Górecki wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > After updating from Xen 4.13 to Xen 4.14 I have troubles starting any
> > > > > > HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MMIO
> > > > > > emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> > > > > > 
> > > > > > I come to a situation where seemingly the same domU started via xl
> > > > > > works, while when started via libvirt it crashes. This seems to be
> > > > > > related to xl setting b_info.{acpi,apic}, while libvirt setting
> > > > > > b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes the
> > > > > > issue.
> > > > > 
> > > > > Could you print the values of the involved fields at the end of
> > > > > libxl__domain_build_info_setdefault in both cases?
> > > > > 
> > > > > I'm not able to spot what changed between 4.13 and 4.14 that could
> > > > > alter the behavior, but knowing the values at that point might make
> > > > > it easier.
> > > > 
> > > > Sure, will do.
> > > > It may be also something else: maybe it acpi/apic settings were broken
> > > > before, but did not results in a domU crash this way.
> > > > FWIW when looking into /var/lib/xen/*-libxl-json I clearly see
> > > > difference between b_info.{acpi,apic} and b_info.u.hvm.{acpi,apic}.
> > > 
> > > I think libxl__domain_build_info_setdefault should check whether
> > > b_info.u.hvm.{acpi,apic} is set and copy those into b_info.{acpi,apic}
> > > if those are not set?
> > 
> > Looking at libxl__domain_build_info_setdefault this is not the case.
> > Instead there is libxl__acpi_defbool_val which looks at both.
> > Oh, and there is no similar thing for apic -> b_info.u.hvm.apic is
> > ignored!
> > 
> > > Toolstack people is more likely to have an opinion here, or to help
> > > debug the issue.
> 
> Ok, The crash reported initially was caused by a different thing: using
> seabios.bin instead of seabios-256k.bin (should that really cause the
> crash? shouldn't 128k seabios build work too?). But in any case, I think
> the b_info.u.hvm.{acpi,apic} is also not in a good shape.

Does 128K SeaBIOS have Xen support enabled?

Roger.

