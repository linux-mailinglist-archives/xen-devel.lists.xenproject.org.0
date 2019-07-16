Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8826A65A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKWD-0006Hf-MI; Tue, 16 Jul 2019 10:17:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nepe=VN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hnKWC-0006Ha-Kg
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:17:08 +0000
X-Inumbo-ID: dd2fae5c-a7b2-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd2fae5c-a7b2-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 10:17:07 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JlitRHSHF4OL6NfGG6j6wVYNETYWU77QXWlziPhjIRqnfhHuWD2zjtDCsPS6K4nk+I0TqxZ0/U
 hS379upSUAUzl0SmjIE0PKbWqrd4hWbWZBYXcAtULTAmpoaPiwox2/JEOTbgEOaX0U1fmGCzO3
 FiOvOZ3pKOFHgqZkwF68Jp6xbdMjaBIvQZ16nlF6TYGgzUM2mUYTJOmdDj0jU3ijf6/9n+sUWY
 6+nghmr4BpFxCxIJZd4WqvcBlIxvFxz90+a1GHnx1K+knLNIQXLO0vWsSE/hcf18horLnP42je
 Hag=
X-SBRS: 2.7
X-MesageID: 3028178
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3028178"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 16 Jul 2019 11:16:54 +0100
Message-ID: <20190716101657.23327-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190716101657.23327-1-paul.durrant@citrix.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBub3QgdmVuZG9yIHNwZWNpZmljIHNvIGl0IGRvZXNuJ3QgcmVhbGx5IGJlbG9uZyB0aGVy
ZS4KClNjYW5uaW5nIHRoZSBQQ0kgdG9wb2xvZ3kgYWxzbyByZWFsbHkgZG9lc24ndCBoYXZlIG11
Y2ggdG8gZG8gd2l0aCBJT01NVQppbml0aWFsaXphdGlvbi4gSXQgZG9lc24ndCBkZXBlbmQgb24g
dGhlcmUgZXZlbiBiZWluZyBhbiBJT01NVS4gVGhpcyBwYXRjaAptb3ZlcyB0byB0aGUgY2FsbCB0
byB0aGUgYmVnaW5uaW5nIG9mIGlvbW11X2hhcmR3YXJlX3NldHVwKCkgYnV0IG9ubHkKcGxhY2Vz
IGl0IHRoZXJlIGJlY2F1c2UgdGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIHdvdWxkIGJlIG90aGVy
d2lzZSB1bnVzZWQuCgpTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBhY3R1YWxseSBtYWtlIHVzZSBv
ZiB0aGUgUENJIHRvcG9sb2d5IGR1cmluZwooeDg2KSBJT01NVSBpbml0aWFsaXphdGlvbi4KClNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6
IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+CkNj
OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cgp2MjoKIC0gRXhwYW5kZWQgY29tbWl0IGNvbW1lbnQuCiAtIE1vdmVkIFBDSSBz
Y2FuIHRvIGJlZm9yZSBJT01NVSBpbml0aWFsaXphdGlvbiwgcmF0aGVyIHRoYW4gYWZ0ZXIgaXQu
Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8IDMgKyst
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICAgIHwgNCAtLS0tCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAgICAgICAgIHwgNiArKysrKysKIDMg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCmluZGV4IDRhZmJjZDE2MDkuLjMz
MzhhOGUwZTggMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1k
X2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUu
YwpAQCAtMTgwLDcgKzE4MCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGlvdl9kZXRlY3Qodm9pZCkK
IAogICAgIGlmICggIWFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAgKQogICAgICAgICBwcmludGso
WEVOTE9HX1dBUk5JTkcgIkFNRC1WaTogVXNpbmcgZ2xvYmFsIGludGVycnVwdCByZW1hcCB0YWJs
ZSBpcyBub3QgcmVjb21tZW5kZWQgKHNlZSBYU0EtMzYpIVxuIik7Ci0gICAgcmV0dXJuIHNjYW5f
cGNpX2RldmljZXMoKTsKKworICAgIHJldHVybiAwOwogfQogCiBpbnQgYW1kX2lvbW11X2FsbG9j
X3Jvb3Qoc3RydWN0IGRvbWFpbl9pb21tdSAqaGQpCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jCmluZGV4IDhiMjdkN2U3NzUuLmIwZTNiZjI2YjUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC9pb21tdS5jCkBAIC0yMzcyLDEwICsyMzcyLDYgQEAgc3RhdGljIGludCBfX2luaXQgdnRkX3Nl
dHVwKHZvaWQpCiAgICAgUChpb21tdV9oYXBfcHRfc2hhcmUsICJTaGFyZWQgRVBUIHRhYmxlcyIp
OwogI3VuZGVmIFAKIAotICAgIHJldCA9IHNjYW5fcGNpX2RldmljZXMoKTsKLSAgICBpZiAoIHJl
dCApCi0gICAgICAgIGdvdG8gZXJyb3I7Ci0KICAgICByZXQgPSBpbml0X3Z0ZF9odygpOwogICAg
IGlmICggcmV0ICkKICAgICAgICAgZ290byBlcnJvcjsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lv
bW11LmMKaW5kZXggMGZhNmRjYzNmZC4uYTc0MzhjOWMyNSAxMDA2NDQKLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
eDg2L2lvbW11LmMKQEAgLTI4LDkgKzI4LDE1IEBAIHN0cnVjdCBpb21tdV9vcHMgX19yZWFkX21v
c3RseSBpb21tdV9vcHM7CiAKIGludCBfX2luaXQgaW9tbXVfaGFyZHdhcmVfc2V0dXAodm9pZCkK
IHsKKyAgICBpbnQgcmM7CisKICAgICBpZiAoICFpb21tdV9pbml0X29wcyApCiAgICAgICAgIHJl
dHVybiAtRU5PREVWOwogCisgICAgcmMgPSBzY2FuX3BjaV9kZXZpY2VzKCk7CisgICAgaWYgKCBy
YyApCisgICAgICAgIHJldHVybiByYzsKKwogICAgIGlmICggIWlvbW11X29wcy5pbml0ICkKICAg
ICAgICAgaW9tbXVfb3BzID0gKmlvbW11X2luaXRfb3BzLT5vcHM7CiAgICAgZWxzZQotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
