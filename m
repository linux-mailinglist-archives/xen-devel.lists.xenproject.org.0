Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF215ADD8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:57:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vH1-0008H6-M7; Wed, 12 Feb 2020 16:54:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vH0-0008Gz-QM
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:54:02 +0000
X-Inumbo-ID: 45224552-4db8-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45224552-4db8-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581526441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gWhvTKiWPq9gO4uI/2WPxkfxCozSJpnZ58s6YURqHkI=;
 b=Nh5sL3cOmuN6xfLA/OoiV+rZJ4B/j1Li1PsWtm6Q+NsoASAcI7fpKb/p
 rYVHwMjCXRIXQOwe5g9HGnDb7RNbLksAbI2w7J8NHi0fXSWBeozns09aM
 ydLLdYCpnPGKV/Zibxd6PrtMa0arQBZCcxrDzqnlAVxx9AvvzHzkzVJf7 o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P+halg55OJ5PJJe3Hb6Dyr7viP3qK4BIaan6VRbDXj6uXzLEDah5igrcwtmYcxgkEDK+jv/nA1
 BJJHt+07Copmt90yMzPBFFZBq4xd3CN7hrSd2hHZBllBm7LV+MoRjQumE92fcc3BXSpTvUGBf7
 2MjsfXGMbe+S7XkMq7E+N4EMdzgYQsfnlVZUMRsvEgs8rU3mA857n5cssk/G7S/RJgWCzp1cOD
 KDTCrsHsgCNUvUChMm5CPLQp2vNzbd6bF3Rq1/uM3n5vqnhJspP7AC4Ssk5ATmJgVuJG9ivYPX
 7Tg=
X-SBRS: 2.7
X-MesageID: 12717228
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12717228"
Date: Wed, 12 Feb 2020 17:53:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200212165354.GQ4679@Air-de-Roger>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-2-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212160918.18470-2-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/4] x86/hyperv: misc cleanup
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDQ6MDk6MTVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBDaGFuZ2UgaHZfdnBfaW5kZXggdG8gdXNlIHVpbnQzMl90IGJlY2F1c2UgdGhhdCBpcyB3aGF0
IGlzIGRlZmluZWQgaW4gVExGUy4KPiAKPiBBZGQgIl9hZGRyIiBzdWZmaXggdG8gaHZfZG9fcmVw
X2h5cGVyY2FsbCdzIHBhcmFtZXRlcnMuCgpCZWluZyBvZiB0eXBlIHBhZGRyX3QgSSdtIHVuc3Vy
ZSB0aGUgX2FkZHIgc3VmZml4IGFkZHMgYW55IHZhbHVlIHRvCnRoZSBuYW1lLgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKTEdUTSAoYW5kIEknbSBj
ZXJ0YWlubHkgbm90IGdvaW5nIHRvIG9wcG9zZSB0byB0aGUgX2FkZHIgc3VmZml4KToKClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
