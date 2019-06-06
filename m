Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2036F74
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYoHe-0006Sh-Og; Thu, 06 Jun 2019 09:02:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYoHc-0006SV-CB
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:02:04 +0000
X-Inumbo-ID: c0228784-8839-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0228784-8839-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 09:02:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wNvL4aVW+e/EtW93cqlMYlldtEA1uqDfXodfGEIl8hYuKWiYh5fRfLEDotOXZuZtWPtltcBjZU
 vzfJIwwu8AFLUqWUZeNqQ3GMzNkIEhIGyk+YTYokmCamDfPglinxc2/w2c/hpxS5TndDMHeCXc
 Y9v9AkDVJwD8v4foRcAjqli5930VRUzDuhujJPJlEOt6h/hHYdGbmmOYYuCnbSUemMvy+xnIgm
 M6E9lclEvrAnXMnM+HIWisIt9kIso2f+E6pNTnhxEQTuS5eVEv2kL7lQYVLhKtT+mK/YseoqBl
 UG0=
X-SBRS: -0.9
X-MesageID: 1397083
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,558,1557201600"; 
   d="scan'208";a="1397083"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 11:01:34 +0200
Message-ID: <20190606090146.77381-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/12] pci: expand usage of pci_sbdf_t
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
b2R1Y2UgYW55IGZ1bmN0aW9uYWwgY2hhbmdlcy4KClJvZ2VyIFBhdSBNb25uZSAoMTIpOgogIHBj
aTogaW50cm9kdWNlIGEgZGV2Zm4gZmllbGQgdG8gcGNpX3NiZGZfdAogIHBjaTogaW50cm9kdWNl
IGEgcGNpX3NiZGZfdCBmaWVsZCB0byBwY2lfZGV2CiAgcGNpOiBtYWtlIFBDSV9TQkRGIHJldHVy
biBhIHBjaV9zYmRmX3QKICBwY2k6IG1ha2UgUENJX1NCREYyIHJldHVybiBhIHBjaV9zYmRmX3QK
ICBwY2k6IG1ha2UgUENJX1NCREYzIHJldHVybiBhIHBjaV9zYmRmX3QKICBwY2k6IHN3aXRjaCBw
Y2lfY29uZl9yZWFkOCB0byB1c2UgcGNpX3NiZGZfdAogIHBjaTogc3dpdGNoIHBjaV9jb25mX3Jl
YWQxNiB0byB1c2UgcGNpX3NiZGZfdAogIHBjaTogc3dpdGNoIHBjaV9jb25mX3JlYWQzMiB0byB1
c2UgcGNpX3NiZGZfdAogIHBjaTogc3dpdGNoIHBjaV9jb25mX3dyaXRlOCB0byB1c2UgcGNpX3Ni
ZGZfdAogIHBjaTogc3dpdGNoIHBjaV9jb25mX3dyaXRlMTYgdG8gdXNlIHBjaV9zYmRmX3QKICBw
Y2k6IHN3aXRjaCBwY2lfY29uZl93cml0ZTMyIHRvIHVzZSBwY2lfc2JkZl90CiAgcHJpbnQ6IGlu
dHJvZHVjZSBhIGZvcm1hdCBzcGVjaWZpZXIgZm9yIHBjaV9zYmRmX3QKCiBkb2NzL21pc2MvcHJp
bnRrLWZvcm1hdHMudHh0ICAgICAgICAgICAgICAgIHwgICA1ICsKIHhlbi9hcmNoL3g4Ni9jcHUv
YW1kLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTUgKy0KIHhlbi9hcmNoL3g4Ni9kbWlfc2Nh
bi5jICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm1zaS5j
ICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyMDMgKysrKysrKystLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvb3By
b2ZpbGUvb3BfbW9kZWxfYXRobG9uLmMgICAgIHwgIDEwICstCiB4ZW4vYXJjaC94ODYveDg2XzY0
L21tY29uZi1mYW0xMGguYyAgICAgICAgIHwgICA4ICstCiB4ZW4vYXJjaC94ODYveDg2XzY0L21t
Y29uZmlnLXNoYXJlZC5jICAgICAgIHwgIDE0ICstCiB4ZW4vYXJjaC94ODYveDg2XzY0L3BjaS5j
ICAgICAgICAgICAgICAgICAgIHwgIDk4ICsrKy0tLS0tLQogeGVuL2NvbW1vbi9jb21wYXQvbWVt
b3J5LmMgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2NvbW1vbi92c3ByaW50Zi5jICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxOCArKwogeGVuL2RyaXZlcnMvYWNwaS9yZWJvb3QuYyAgICAg
ICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2RyaXZlcnMvY2hhci9laGNpLWRiZ3AuYyAgICAg
ICAgICAgICAgICB8ICA0OSArKystLQogeGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgICAgICAg
ICAgICAgICAgICB8ICA3MSArKysrLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9t
bXVfYWNwaS5jICAgIHwgIDE3ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
Y21kLmMgICAgIHwgICA1ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZGV0
ZWN0LmMgIHwgICA3ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5j
ICAgIHwgIDI5ICsrLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYyAg
ICB8ICAgOCArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8
ICAyNSArLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2F0cy5oICAgICAgICAgICAgICAgfCAg
IDQgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICAgICAgICAgICAgfCAyMjAg
KysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMg
ICAgICAgICAgfCAgMzYgKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2ludHJlbWFw
LmMgICAgICB8ICAxMSArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAg
ICAgICB8ICA4MCArKystLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVpcmtzLmMg
ICAgICAgIHwgIDgxICsrKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC91dGlscy5j
ICAgICAgICAgfCAgIDYgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9hdHMuYyAgICAg
ICAgICAgfCAgMjggKy0tCiB4ZW4vZHJpdmVycy9wY2kvcGNpLmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIzICstCiB4ZW4vZHJpdmVycy92aWRlby92Z2EuYyAgICAgICAgICAgICAgICAgICAg
IHwgIDExICstCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICAgICAgICAgICAgICAgIHwg
IDY1ICsrLS0tLQogeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyAgICAgICAgICAgICAgICAgICAgICB8
ICAxMyArLQogeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMgICAgICAgICAgICAgICAgICAgICB8ICAz
NSArKy0tCiB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQ2
ICsrLS0KIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgNTAg
KystLS0KIDM3IGZpbGVzIGNoYW5nZWQsIDU3NCBpbnNlcnRpb25zKCspLCA3NDkgZGVsZXRpb25z
KC0pCgotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
