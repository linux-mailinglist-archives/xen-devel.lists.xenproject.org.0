Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDEDB7A5C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:23:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAwN0-0007U0-UQ; Thu, 19 Sep 2019 13:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAwMz-0007Tv-Fx
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:21:13 +0000
X-Inumbo-ID: 59a87fa0-dae0-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59a87fa0-dae0-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568899272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YEVn24D9QUAePWzumjORVmLwC4BwA+1M6mRuidpIwN4=;
 b=P11qvu7o0jw2CgHL0LPUGuh0eluQs5LXMAL1D7XiZq/LCgl4rRnLxX2V
 BEKl3StuyNJGT27P/Dh0WHroLLBzG+ZpGeTlt7QFbvS0HLYXmPsuESpST
 tpUz3p+50hWt58isO4SEfjVbx+wDQky/TKKRjnAhM4gdDXbDMP0VVJXis w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 911o3fZPhA47Cn0ri5SDNXDipJuzmijb7rjSveOKgj4wPI3WnoVMB9eejdYrOOygPnLl7ZJ/E5
 PhcfS8ztRzhcch0/o0vewsOrff9ejyu0RXWb2OAzdxzswv+wZIknaYezVdQEAcVQpHlgjleJB3
 mINdzV+YC0lhoewKLAktiSFiA3m72RiCq9+JJFokxCZvWGiwzEUo1yqlMQmNXTSYW4KdFL+EzP
 0492s3eey1qHHc1vmG++d9g+5gLbpUP9rWgCtr9Ipyz28nlwy7b3wd9o7gpvWZUE3ZUUHGxEka
 ins=
X-SBRS: 2.7
X-MesageID: 5991935
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5991935"
Date: Thu, 19 Sep 2019 14:21:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190919132109.GS1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-7-anthony.perard@citrix.com>
 <23937.3912.874830.653579@mariner.uk.xensource.com>
 <20190919125859.GR1308@perard.uk.xensource.com>
 <23939.31886.16367.162328@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23939.31886.16367.162328@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 06/35] libxl: Use ev_qmp for
 switch_qemu_xen_logdirty
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDI6MDM6MTBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAwNi8zNV0gbGlieGw6IFVz
ZSBldl9xbXAgZm9yIHN3aXRjaF9xZW11X3hlbl9sb2dkaXJ0eSIpOgo+ID4gT24gVHVlLCBTZXAg
MTcsIDIwMTkgYXQgMDU6NTI6MjRQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBJIGd1
ZXNzIHdlIGNvdWxkIHRyeSB0byBvcHRpbWlzZSB0aGUgc2ltcGxlciBjYXNlIHdoZW4gdGhlcmUg
aXMgb25seSBvbmUKPiA+IHFtcCBvcGVyYXRpb24sIGJlY2F1c2UgdGhhdCdzIHRoZSBtb3N0IGNv
bW1vbiwgYnV0IGFsbG93IHRvIHNlbmQKPiA+IGNvbW1hbmRzIHdpdGhvdXQgaGF2aW5nIGxpYnhs
X19xbXAgc2V0dGluZyBhIHRpbWVvdXQuCj4gCj4gVGhhdCB3b3VsZCBiZSBuaWNlLiAgSSB0aGlu
ayB0aGlzIGlzIGEgbmljZS10by1oYXZlLCBub3QgYSBibG9ja2VyLgoKR29vZCwgSSdsbCBwdXQg
dGhhdCBvbiBhIHRvZG8gbGlzdCBmb3Igd2hlbiBmdXJ0aGVyIHJlZmFjdG9yaW5nIGNhbiBiZQpk
b25lIGFzIEkgZG9uJ3QgdGhpbmsgSSB3YW50IHRvIHJ1c2ggdGhpcyBhZGRpdGlvbiB0byB0aGUg
aW50ZXJuYWwgQVBJLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
