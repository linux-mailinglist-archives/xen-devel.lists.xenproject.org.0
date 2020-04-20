Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3B1B17A8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 22:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQdSt-0007zU-HT; Mon, 20 Apr 2020 20:56:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQdSr-0007zP-Eb
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 20:56:25 +0000
X-Inumbo-ID: 6436127c-8349-11ea-90a7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6436127c-8349-11ea-90a7-12813bfff9fa;
 Mon, 20 Apr 2020 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587416184;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=S79DiUrKjSp1OJp5zwKtvZ9/QIdrrycRZwpzUvspEZQ=;
 b=ac9ybHvnMw7XQk0imqcC5euQHCfn3hYUEkJqDO403GnpoNgWSsACMA0s
 aSjMHDQU8ciopbe0U+3IGBp8arP4bUjOhg0IJxo7lp+fgrqqpnu3F+X5l
 wlKleMjNkUAJYjLbEWzkFcvYmIkdfoFyKyq2OgLn3Vplg9Q4vxq6LDIML Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HqOEGo02meEOmgaCm+X4kUt7Cg/diRW0NQQP4R8ASdqiSyQOYiJbOpG2+AN3b7+O7FkZwl6lvg
 +Av8g210jiJmCYr01qz0sLRNJEE4pds6kZP/NUzh8fQ3zMV8SZja+8yItS5Qyq4WG98xVfg031
 MnmlhUHifdMS3qlEV3BCo/gyYPtu/2hEt7r7pIMtJk5qN23th0tOkPnaI/6JbrFePPLxapmbq7
 Nysh5/xbPlaVv7uk7fVeJ7HXHs8NTOMrUO6YqxmjLytghf6OpW/rNbEkqI+lwswNTanGUkMJ9Y
 oEQ=
X-SBRS: 2.7
X-MesageID: 15981285
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="15981285"
Subject: Re: grant_table_op v2 support for HVM?
To: =?UTF-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>,
 <xen-devel@lists.xenproject.org>
References: <CAMnsW57Kn05TyDiVmZLaiYBdVZwy_7LazvLvR_AG0KHEYJ-z0Q@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a8245dcc-cb91-f3d2-f0a2-135efd137370@citrix.com>
Date: Mon, 20 Apr 2020 21:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMnsW57Kn05TyDiVmZLaiYBdVZwy_7LazvLvR_AG0KHEYJ-z0Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 21:38, Jaromír Doleček wrote:
> Hello,
>
> I'm working on NetBSD Xen support.
>
> Recently, we've switched to grant version 2 mainly for the improved
> status handling,

Really?  The status handling is certainly different, but v2 is much
harder to use correctly.

>  and eventually for copy-only subpage grant support,
> which I'd like to experiment with in our netback driver. Currently we
> don't need the 64-bit frame, which I found was reason to Linux was
> switched over to v2 a while ago.
>
> However, later found out that HVM doesn't actually seem to support the
> GNTTABOP_get_status_frames hypercall, so had to fall back to v1 for
> HVM. Code in xen/arch/x86/hvm/hypercall.c, which doesn't have any
> handling in GNTTABOP_get_status_frames neither in Xen 4.11/4.12/4.13.
>
> Can you advise which version should be used by Dom0/DomU kernels?
>
> Is there some way to still use v2 with HVM? Possibly instead of using
> the status frames, still use the old cmpxchg16 method on hdr.flags,
> but as I understand hdr.flags is not used for GTF_reading and
> GTF_writing in v2. I also see the set_version and get_version calls
> are still supported even for HVM.
>
> Understandably, we'd prefer to use same version for PV and HVM kernels.

Like many things, PV and HVM are different.

For PV, the guest creates the mapping.  You've got to ask Xen for the
list of MFNs, so you can create a PTE pointing at them.

For HVM, you've got to decide were you'd like the frames in your guest
physical space, and ask Xen to make the adjustment.

You want add_to_physmap(), requesting XENMAPSPACE_grant_table and or-ing
XENMAPIDX_grant_table_status into the index.  (Because a new
XENMAPSPACE_grant_status apparently wasn't the most logical way to
extend the existing interface.)

i.e. duplicate the existing grant frame logic, picking a second set of
gfns, and tweaking the index input.

~Andrew

