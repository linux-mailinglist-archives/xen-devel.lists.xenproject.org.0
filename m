Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D92E1FEB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIsE-0000o2-Sk; Wed, 23 Oct 2019 15:48:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNIsC-0000nx-U2
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:48:32 +0000
X-Inumbo-ID: 904c4118-f5ac-11e9-bbab-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 904c4118-f5ac-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571845713;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=YfEubWdoNPsdGvk7KcIl3N+zCk1IqD5seSYSW512jEQ=;
 b=Jibm7A6dT+svkcN4+4ut6VfN4GQpH8LOhqrbY4vqutMExQukmBChq4QZ
 W2kStBhoHfBMyo4j0PejV85HY8Y491y63NMGuTMs/6qcx3CVUXNfpn/y1
 BZ8K91FTtzgBZOKnQg2y26fplVC+coJlRaOXllZWkh5sgREikWQkmqBDf U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6xfw69F9QjTi9YFeG+x+/XFaBWXVXF86yTabUnp2q7uZDRQBxcJ0X2WPh6y6M4qXi1fpWRhFCk
 0KppCT1Ve7aMfNb3JwL2TO2P8GIz+tK+hEljM4kNgu1e0jNkbYLztuulg6eC3pH+VzEtVCM44v
 aG9jHr7raO2BeHUZ99KamkcT6MerjIcCImefzvTnMhlS9BKa0CdNoHtkJGqRhukp4IHxq9NLzk
 qaHWRH+29KydTeC8HFtXv/1yh/BYo28BBErzTrgy960g4q6nLl7y5GzYp0o809yT0RI1/TI0fv
 I6w=
X-SBRS: 2.7
X-MesageID: 7328574
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7328574"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23984.30284.460579.337385@mariner.uk.xensource.com>
Date: Wed, 23 Oct 2019 16:48:28 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191023154008.GL1138@perard.uk.xensource.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-12-ian.jackson@eu.citrix.com>
 <20191023154008.GL1138@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 11/11] libxl: On ARM,
 reject future new passthrough modes too
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgdjcgMTEvMTFd
IGxpYnhsOiBPbiBBUk0sIHJlamVjdCBmdXR1cmUgbmV3IHBhc3N0aHJvdWdoIG1vZGVzIHRvbyIp
Ogo+IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDAyOjAwOjEzUE0gKzAxMDAsIElhbiBKYWNrc29u
IHdyb3RlOgo+ID4gLSAgICBpZiAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJYTF9QQVNTVEhS
T1VHSF9TWU5DX1BUKSB7Cj4gPiArICAgIHN3aXRjaCAoY19pbmZvLT5wYXNzdGhyb3VnaCkgewo+
ID4gKyAgICBjYXNlIExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEOwo+IAo+IFRoYXQgbG9va3Mg
c3RyYW5nZSwgdGhlcmUgYSBzZW1pY29sb24gXiBoZXJlIGluc3RlYWQgb2YgYSBjb2xvbiAnOicu
CgpEYW1uLCBJJ20gYW4gaWRpb3QuICBJIGJ1aWxkIHRlc3RlZCB0aGlzIG9uIHg4Ni4KCkkgd2ls
bCBmaW5kIHNvbWV3aGVyZSB0byBidWlsZCB0ZXN0IGl0IG9uIEFSTS4KClRoYW5rcyBmb3IgdGhl
IHJldmlldy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
