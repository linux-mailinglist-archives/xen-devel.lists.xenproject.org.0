Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAEA6B18
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:18:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59bS-0007bs-Cm; Tue, 03 Sep 2019 14:16:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i59bR-0007bn-MR
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:16:13 +0000
X-Inumbo-ID: 620baba0-ce55-11e9-a337-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 620baba0-ce55-11e9-a337-bc764e2007e4;
 Tue, 03 Sep 2019 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567520173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EGXUKBWA2aiQU92/izMW4Ui1DITbwjKRCM6RrKJX+CA=;
 b=WMDyDsbZpISZGzWda53S4eVdDqfhuyRXL1vpuob/MTkz06zgxxeGq0V/
 X/esGKjYxBdt9ZdjRA7BNM5wdDkAYs5HFWq1Sys3NnEOYtwsNYEfn9Xsx
 nvPnj8Avjax1wa/YHpUCBc07SjMUXeIt6ZOw5Yt1yyEaEBfD92OcVDeY2 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YL266zO/ZzoWRyhTBAkDDXelTzO/5Io5k3vvjt4pz7k1DpBTM1POBpFw/ItmSQlRs1PPf9oUgP
 lVZBXIh8xnm9vWfxh04JQbkJGuQYbJzgqFGnc/h4JPKk5zcDENv5bdAHAo/Bs/XIcIa0qcoWIE
 9MzVGuVBcYHEHfNxwYPIW87bZDjwaSw7m10Ma+t6QIDZ4CMtmjZl+m5To0KdT2nmWm7+9zT790
 ur32TUTgfphuZOIiKgh76i7HEAXvehJ/k1orkKf2ZKNkfDiIakOZyIu4Gux1B+Ma87BhaPrG0T
 j2A=
X-SBRS: 2.7
X-MesageID: 5060835
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5060835"
Date: Tue, 3 Sep 2019 16:15:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190903141545.5n4uk2khgbtvewgz@Air-de-Roger>
References: <88d6b97e-1f19-56ff-1a35-901ce3102e78@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88d6b97e-1f19-56ff-1a35-901ce3102e78@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] ns16550: make PCI device hiding uniform
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDM6NTg6MDhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBwY2lfaGlkZV9kZXZpY2UoKSBhbmQgcGNpX3Jv
X2RldmljZSgpIGlzIHRoYXQKPiB0aGUgZm9ybWVyIG9ubHkgcHJldmVudHMgYSBkZXZpY2UgZnJv
bSBnZXR0aW5nIGFzc2lnbmVkIHRvIGEgZ3Vlc3QsCj4gd2hpbGUgdGhlIGxhdHRlciBhZGRpdGlv
bmFsbHkgYXJyYW5nZXMgZm9yIERvbTAgd3JpdGUgYXR0ZW1wdHMgdG8gdGhlCj4gZGV2aWNlJ3Mg
Y29uZmlnIHNwYWNlIHRvIGJlIGlnbm9yZWQvZGlzY2FyZGVkLiBXaGV0aGVyIHdlIHdhbnQgb25l
IG9yCj4gdGhlIG90aGVyIGNlcnRhaW5seSBkb2Vzbid0IGRlcGVuZCBvbiB3aGV0aGVyIHRoZSBk
ZXZpY2UgaXMgaW4gb3VyIHNldAo+IG9mIGtub3duIGRldmljZXMuIEFsbCB0aGF0IG1hdHRlcnMg
aXMgd2hldGhlciB3ZSB1c2UgYSBQQ0kgZGV2aWNlOiBDYWxsCj4gcGNpX3JvX2RldmljZSgpIGlu
IGFueSBzdWNoIGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKTEdUTSwganVzdCBvbmUgcXVlc3Rpb24gYmVsb3cuCgo+IC0tLQo+IFJlc2Vu
ZCB3aXRoIFRvL0NjIGNvcnJlY3RlZDsgdGhhbmtzIHRvIEFuZHJldyBmb3IgcG9pbnRpbmcgb3V0
Lgo+IAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4gKysrIGIveGVuL2RyaXZl
cnMvY2hhci9uczE2NTUwLmMKPiBAQCAtNzYzLDIzICs3NjMsMTYgQEAgc3RhdGljIHZvaWQgX19p
bml0IG5zMTY1NTBfaW5pdF9wb3N0aXJxKAo+ICAjaWZkZWYgQ09ORklHX0hBU19QQ0kKPiAgICAg
IGlmICggdWFydC0+YmFyIHx8IHVhcnQtPnBzX2JkZl9lbmFibGUgKQo+ICAgICAgewo+IC0gICAg
ICAgIGlmICggIXVhcnQtPnBhcmFtICkKPiAtICAgICAgICAgICAgcGNpX2hpZGVfZGV2aWNlKDAs
IHVhcnQtPnBzX2JkZlswXSwgUENJX0RFVkZOKHVhcnQtPnBzX2JkZlsxXSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVhcnQtPnBzX2JkZlsyXSkpOwo+IC0gICAgICAgIGVsc2UKPiAt
ICAgICAgICB7Cj4gLSAgICAgICAgICAgIGlmICggdWFydC0+cGFyYW0tPm1taW8gJiYKPiAtICAg
ICAgICAgICAgICAgICByYW5nZXNldF9hZGRfcmFuZ2UobW1pb19yb19yYW5nZXMsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVhcnQtPmlvX2Jhc2UsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVhcnQtPmlvX2Jhc2UgKyB1YXJ0LT5pb19zaXpl
IC0gMSkgKQo+IC0gICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJFcnJvciB3aGls
ZSBhZGRpbmcgTU1JTyByYW5nZSBvZiBkZXZpY2UgdG8gbW1pb19yb19yYW5nZXNcbiIpOwo+ICsg
ICAgICAgIGlmICggdWFydC0+cGFyYW0gJiYgdWFydC0+cGFyYW0tPm1taW8gJiYKPiArICAgICAg
ICAgICAgIHJhbmdlc2V0X2FkZF9yYW5nZShtbWlvX3JvX3JhbmdlcywgdWFydC0+aW9fYmFzZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5pb19iYXNlICsgdWFydC0+
aW9fc2l6ZSAtIDEpICkKPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJFcnJvciB3
aGlsZSBhZGRpbmcgTU1JTyByYW5nZSBvZiBkZXZpY2UgdG8gbW1pb19yb19yYW5nZXNcbiIpOwo+
ICAKPiAtICAgICAgICAgICAgaWYgKCBwY2lfcm9fZGV2aWNlKDAsIHVhcnQtPnBzX2JkZlswXSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9ERVZGTih1YXJ0LT5wc19iZGZb
MV0sIHVhcnQtPnBzX2JkZlsyXSkpICkKPiAtICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0df
SU5GTyAiQ291bGQgbm90IG1hcmsgY29uZmlnIHNwYWNlIG9mICUwMng6JTAyeC4ldSByZWFkLW9u
bHkuXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5wc19i
ZGZbMF0sIHVhcnQtPnBzX2JkZlsxXSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWFydC0+cHNfYmRmWzJdKTsKPiAtICAgICAgICB9Cj4gKyAgICAgICAgaWYgKCBwY2lf
cm9fZGV2aWNlKDAsIHVhcnQtPnBzX2JkZlswXSwKCkRvbid0IHlvdSBuZWVkIHRvIGdhdGUgdGhl
IGNhbGwgdG8gcGNpX3JvX2RldmljZSB3aXRoCnVhcnQtPnBzX2JkZl9lbmFibGU/CgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
