Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E9386FC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:26:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZB5M-0002TZ-Re; Fri, 07 Jun 2019 09:22:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GsDR=UG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hZB5K-0002TU-S4
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:22:54 +0000
X-Inumbo-ID: d3bd4f7b-8905-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3bd4f7b-8905-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 09:22:53 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TcE+CbmEK0b2OwKjOetPd5k2TB74xkovIyBfDXBfXNS2CEJKvK1ipS6J1hr9lM7xsWLokmk1ei
 Oioa4BJpqp0348YdqT9yrEDW5flTeEY2SICqI9iVN5NQq8srGVqzi0HOmwTMFUIXiUUYMvV7vA
 Hxo9SzdTS9ONswI3ev/4Rga5yEkdWIhQbQClfuN5NrK9HRyaJ6lig+qMWRdZBmzgI68IaDIPnG
 8S/XCQb2lc8qCmg7TUwmhzN6wWCOdqBilEiblpTeixE5PKiBRzNO4eQ5kyuCH2eCIDueUu7fqC
 FUo=
X-SBRS: -0.9
X-MesageID: 1438387
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1438387"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 7 Jun 2019 11:22:19 +0200
Message-ID: <20190607092232.83179-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 00/13] pci: expand usage of pci_sbdf_t
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SU1PIHBjaV9zYmRmX3QgaXQncyBuaWNlciB0byB1c2UgdGhhbiBwYXNzaW5nIGFyb3VuZCBhIHNi
ZGYgaW4gbXVsdGlwbGUKZmllbGRzLiBIb3dldmVyIGl0J3MgaGFyZCB0byBleHBhbmQgdGhlIHVz
YWdlIG9mIHBjaV9zYmRmX3QgaW4gdGhlIGNvZGUKYmFzZSB3aXRob3V0IGNoYW5naW5nIHNvbWUg
b2YgdGhlIGNvcmUgcGNpIGZ1bmN0aW9ucyBhbmQgdGhlIHBjaV9kZXYKc3RydWN0IGZpZWxkcywg
aGVuY2UgdGhpcyBwYXRjaCBzZXQuCgpOb3RlIHRoZXJlJ3Mgc3RpbGwgbW9yZSBsb3cgaGFuZ2lu
ZyBmcnVpdCB0aGF0IGNvdWxkIGJlbmVmaXQgZnJvbQpzd2l0Y2hpbmcgdG8gcGNpX3NiZGZfdCwg
dGhpcyBwYXRjaCBzZXJpZXMganVzdCBjaGFuZ2VzIHNvbWUgb2YgdGhlIG1vcmUKY29yZSBwY2kg
ZnVuY3Rpb25zIHRvIHVzZSBwY2lfc2JkZl90LgoKVGhpcyBzZXJpZXMgc2hvdWxkIG5vdCBpbnRy
b2R1Y2UgYW55IGZ1bmN0aW9uYWwgY2hhbmdlcy4KClJvZ2VyIFBhdSBNb25uZSAoMTMpOgogIHBj
aTogcmVuYW1lIGZ1bmMgZmllbGQgdG8gZm4KICBwY2k6IGludHJvZHVjZSBhIGRldmZuIGZpZWxk
IHRvIHBjaV9zYmRmX3QKICBwY2k6IGludHJvZHVjZSBhIHBjaV9zYmRmX3QgZmllbGQgdG8gcGNp
X2RldgogIHBjaTogbWFrZSBQQ0lfU0JERiByZXR1cm4gYSBwY2lfc2JkZl90CiAgcGNpOiBtYWtl
IFBDSV9TQkRGMiByZXR1cm4gYSBwY2lfc2JkZl90CiAgcGNpOiBtYWtlIFBDSV9TQkRGMyByZXR1
cm4gYSBwY2lfc2JkZl90CiAgcGNpOiBzd2l0Y2ggcGNpX2NvbmZfcmVhZDggdG8gdXNlIHBjaV9z
YmRmX3QKICBwY2k6IHN3aXRjaCBwY2lfY29uZl9yZWFkMTYgdG8gdXNlIHBjaV9zYmRmX3QKICBw
Y2k6IHN3aXRjaCBwY2lfY29uZl9yZWFkMzIgdG8gdXNlIHBjaV9zYmRmX3QKICBwY2k6IHN3aXRj
aCBwY2lfY29uZl93cml0ZTggdG8gdXNlIHBjaV9zYmRmX3QKICBwY2k6IHN3aXRjaCBwY2lfY29u
Zl93cml0ZTE2IHRvIHVzZSBwY2lfc2JkZl90CiAgcGNpOiBzd2l0Y2ggcGNpX2NvbmZfd3JpdGUz
MiB0byB1c2UgcGNpX3NiZGZfdAogIHByaW50OiBpbnRyb2R1Y2UgYSBmb3JtYXQgc3BlY2lmaWVy
IGZvciBwY2lfc2JkZl90CgogZG9jcy9taXNjL3ByaW50ay1mb3JtYXRzLnR4dCAgICAgICAgICAg
ICAgICB8ICAgNSArCiB4ZW4vYXJjaC94ODYvY3B1L2FtZC5jICAgICAgICAgICAgICAgICAgICAg
IHwgIDE1ICstCiB4ZW4vYXJjaC94ODYvZG1pX3NjYW4uYyAgICAgICAgICAgICAgICAgICAgIHwg
ICA2ICstCiB4ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgIDEw
ICstCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICst
CiB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjAzICsrKysr
KysrLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L29wcm9maWxlL29wX21vZGVsX2F0aGxvbi5jICAg
ICB8ICAxMCArLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmYtZmFtMTBoLmMgICAgICAgICB8
ICAgOCArLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1zaGFyZWQuYyAgICAgICB8ICAx
NCArLQogeGVuL2FyY2gveDg2L3g4Nl82NC9wY2kuYyAgICAgICAgICAgICAgICAgICB8ICA5OCAr
KystLS0tLS0KIHhlbi9jb21tb24vY29tcGF0L21lbW9yeS5jICAgICAgICAgICAgICAgICAgfCAg
IDQgKy0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0KIHhlbi9jb21tb24vdnNwcmludGYuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTggKysK
IHhlbi9kcml2ZXJzL2FjcGkvcmVib290LmMgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIHhl
bi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMgICAgICAgICAgICAgICAgfCAgNDkgKysrLS0KIHhl
bi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jICAgICAgICAgICAgICAgICAgfCAgNzEgKysrKy0tLQog
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYyAgICB8ICAxNyArLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2NtZC5jICAgICB8ICAgNSArLQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2RldGVjdC5jICB8ICAgNyArLQogeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyAgICB8ICAyOSArKy0KIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMgICAgfCAgIDggKy0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgfCAgMjUgKy0tCiB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hdHMuaCAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYyAgICAgICAgICAgICAgIHwgMjIwICsrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jICAgICAgICAgIHwgIDM2ICsrLS0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pbnRyZW1hcC5jICAgICAgfCAgMTEgKy0KIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgICAgfCAgODAgKysrLS0tLQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL3F1aXJrcy5jICAgICAgICB8ICA4MSArKysrLS0tCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvdXRpbHMuYyAgICAgICAgIHwgICA2ICstCiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC94ODYvYXRzLmMgICAgICAgICAgIHwgIDI4ICstLQogeGVuL2RyaXZl
cnMvcGNpL3BjaS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyMyArLQogeGVuL2RyaXZlcnMv
dmlkZW8vdmdhLmMgICAgICAgICAgICAgICAgICAgICB8ICAxMSArLQogeGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYyAgICAgICAgICAgICAgICAgICB8ICA2NSArKy0tLS0KIHhlbi9kcml2ZXJzL3Zw
Y2kvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KIHhlbi9kcml2ZXJzL3ZwY2kv
bXNpeC5jICAgICAgICAgICAgICAgICAgICAgfCAgMzUgKystLQogeGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMgICAgICAgICAgICAgICAgICAgICB8ICA0NyArKy0tLQogeGVuL2luY2x1ZGUveGVuL3Bj
aS5oICAgICAgICAgICAgICAgICAgICAgICB8ICA1MCArKystLQogMzcgZmlsZXMgY2hhbmdlZCwg
NTc0IGluc2VydGlvbnMoKyksIDc1MCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEgKEFwcGxlIEdp
dC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
