Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE2A5502
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 13:34:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4kY1-0003eO-IV; Mon, 02 Sep 2019 11:31:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2SMQ=W5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i4kY0-0003eJ-1s
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:31:00 +0000
X-Inumbo-ID: 22790540-cd75-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22790540-cd75-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567423860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=51ZoHPRQdGdNcn8Opfutro16d0vGfJT/U86v6S9oUUw=;
 b=grPQhwTtU/gnIZg2A+F6/4MQxZ/166L3PdxhLbUPml/+RgM6n8HCm+hV
 UUuiSC1H9qO9A/R94Li85C0vVmtCoQo43XvPsFgJMTe9qg3wKMObPMqAy
 BwiiHr5WiLI54dnG77gw9auVLLCCr44iurZLpmbrTixQ49JnM4JVNj9X0 c=;
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
IronPort-SDR: quvEcpl2OtjP5hNP/0Buy+YzHjBhLU+6B1wCdeiPj7RdzD21KEDynDV20dsOu4MkeqzE/ejIfm
 76BomTIbdaW5emplpnm9RbXC20IRakPowchI44MIFVyran5pksmS7zOzblhSl9bzRhvmFHUdqi
 S72ic6TQfksuZaaPF0YhmsieK6TD3g5mGAFfXmvTd+duvfD+AzAuVbJtMkdbQ+vwX8o7tOWzkC
 e+VF0reRLoBbqqFXbhwA+eFhWycfGbcqzeS0QtGn5edY6i44QD64cFbMfX93EG18w7t5Y04KMV
 PRU=
X-SBRS: 2.7
X-MesageID: 5013486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5013486"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 13:30:34 +0200
Message-ID: <20190902113034.97934-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcg
c3BhY2Ugb2YKZGV2aWNlcyBub3QgYXNzaWduZWQgdG8gaXQuIEllOiB0aGUgY29uZmlnIHNwYWNl
IG9mIGlvbW11IGRldmljZXMKaW4gdXNlIGJ5IFhlbiBzaG91bGQgbm90IGJlIGFjY2Vzc2libGUg
dG8gdGhlIGhhcmR3YXJlIGRvbWFpbi4KCk5vdGUgdGhhdCBhY2Nlc3MgZnJvbSB0aGUgaGFyZHdh
cmUgZG9tYWluIHRvIGNvbmZpZyBzcGFjZSByZWdpb25zCndoZXJlIFhlbiBoYXNuJ3QgZGV0ZWN0
ZWQgYW55IGRldmljZXMgaXMgc3RpbGwgYWxsb3dlZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvdnBjaS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwppbmRleCA3NThkOTQyMGU3
Li43NjFhYTQwZjk5IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYworKysgYi94
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwpAQCAtMzE5LDcgKzMxOSwyMSBAQCB1aW50MzJfdCB2cGNp
X3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6
ZSkKICAgICAvKiBGaW5kIHRoZSBQQ0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLiAqLwogICAg
IHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2Jk
Zi5kZXZmbik7CiAgICAgaWYgKCAhcGRldiApCisgICAgeworICAgICAgICBwY2lkZXZzX2xvY2so
KTsKKyAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYu
ZGV2Zm4pOworICAgICAgICBwY2lkZXZzX3VubG9jaygpOworICAgICAgICBpZiAoIHBkZXYgKQor
ICAgICAgICAgICAgLyogRHJvcCByZWFkcyB0byBkZXZpY2VzIG5vdCBhc3NpZ25lZCB0byB0aGUg
ZG9tYWluLiAqLworICAgICAgICAgICAgcmV0dXJuIGRhdGE7CisKKyAgICAgICAgLyoKKyAgICAg
ICAgICogTGV0IHRoZSBoYXJkd2FyZSBkb21haW4gYWNjZXNzIGNvbmZpZyBzcGFjZSByZWdpb25z
IGZvciBub24tZXhpc3RlbnQKKyAgICAgICAgICogZGV2aWNlcy4KKyAgICAgICAgICogVE9ETzog
cmV2aXNpdCBmb3IgZG9tVSBzdXBwb3J0LgorICAgICAgICAgKi8KICAgICAgICAgcmV0dXJuIHZw
Y2lfcmVhZF9odyhzYmRmLCByZWcsIHNpemUpOworICAgIH0KIAogICAgIHNwaW5fbG9jaygmcGRl
di0+dnBjaS0+bG9jayk7CiAKQEAgLTQxOCwxMyArNDMyLDIyIEBAIHZvaWQgdnBjaV93cml0ZShw
Y2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplLAogICAg
ICAgICByZXR1cm47CiAgICAgfQogCi0gICAgLyoKLSAgICAgKiBGaW5kIHRoZSBQQ0kgZGV2IG1h
dGNoaW5nIHRoZSBhZGRyZXNzLgotICAgICAqIFBhc3N0aHJvdWdoIGV2ZXJ5dGhpbmcgdGhhdCdz
IG5vdCB0cmFwcGVkLgotICAgICAqLworICAgIC8qIEZpbmQgdGhlIFBDSSBkZXYgbWF0Y2hpbmcg
dGhlIGFkZHJlc3MuICovCiAgICAgcGRldiA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4oZCwgc2Jk
Zi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuKTsKICAgICBpZiAoICFwZGV2ICkKICAgICB7Cisg
ICAgICAgIHBjaWRldnNfbG9jaygpOworICAgICAgICBwZGV2ID0gcGNpX2dldF9wZGV2KHNiZGYu
c2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7CisgICAgICAgIHBjaWRldnNfdW5sb2NrKCk7Cisg
ICAgICAgIGlmICggcGRldiApCisgICAgICAgICAgICAvKiBJZ25vcmUgd3JpdGVzIHRvIGRldmlj
ZXMgbm90IGFzc2lnbmVkIHRvIHRoZSBkb21haW4uICovCisgICAgICAgICAgICByZXR1cm47CisK
KyAgICAgICAgLyoKKyAgICAgICAgICogTGV0IHRoZSBoYXJkd2FyZSBkb21haW4gYWNjZXNzIGNv
bmZpZyBzcGFjZSByZWdpb25zIGZvciBub24tZXhpc3RlbnQKKyAgICAgICAgICogZGV2aWNlcy4K
KyAgICAgICAgICogVE9ETzogcmV2aXNpdCBmb3IgZG9tVSBzdXBwb3J0LgorICAgICAgICAgKi8K
ICAgICAgICAgdnBjaV93cml0ZV9odyhzYmRmLCByZWcsIHNpemUsIGRhdGEpOwogICAgICAgICBy
ZXR1cm47CiAgICAgfQotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
