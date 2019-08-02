Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A887F066
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:25:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTlm-0007NR-EX; Fri, 02 Aug 2019 09:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BtSY=V6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1htTll-0007NM-BJ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:22:37 +0000
X-Inumbo-ID: 0e1bc370-b507-11e9-9096-f78a72d0a99e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e1bc370-b507-11e9-9096-f78a72d0a99e;
 Fri, 02 Aug 2019 09:22:32 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RrvRVlofppPDj91foRAgf39nLUABKsXePsBUzypcGRQrwSiq4NmiLtTDlyGfF0C0kRuNsPcr1Y
 8zgFBavNpuG4RYA396L+6j7PqI0KIsRwXq04ONQ0Z7Bc704+TeiRXiyDAmGTAkcLlbEtbd5pMm
 kK+wvEB9ew1hbydkm+lQofUu7JB6bqhXePJm0wfLCuM/DeuB2m+++LjytBNaJoyWGJm8rajtur
 j5AUqjA+mK0bXMDaSWvNVHlT05Y7CBmgZBUBuBQ4mSo3oAKqnzRhNARQGWWupCb0PQ7rvjhYiL
 uOM=
X-SBRS: 2.7
X-MesageID: 3929034
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,337,1559534400"; 
   d="scan'208";a="3929034"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 11:22:27 +0200
Message-ID: <20190802092227.43058-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3dpdGNoIHJtcnJfaWRlbnRpdHlfbWFwcGluZyB0byB1c2UgaW9tbXVfe3VufW1hcCBpbiBvcmRl
ciB0bwplc3RhYmxpc2ggUk1SUiBtYXBwaW5ncyBmb3IgUFYgZG9tYWlucywgbGlrZSBpdCdzIGRv
bmUgaW4KYXJjaF9pb21tdV9od2RvbV9pbml0LiBUaGlzIHNvbHZlcyB0aGUgaXNzdWUgb2YgYSBQ
ViBoYXJkd2FyZSBkb21haW4Kbm90IGdldHRpbmcgUk1SUiBtYXBwaW5ncyBiZWNhdXNlIHtzZXQv
Y2xlYXJ9X2lkZW50aXR5X3AybV9lbnRyeSB3YXMKbm90IHByb3Blcmx5IHVwZGF0aW5nIHRoZSBp
b21tdSBwYWdlIHRhYmxlcy4KCkFzIHJtcnJfaWRlbnRpdHlfbWFwcGluZyB3YXMgdGhlIGxhc3Qg
dXNlciBvZgp7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkgYWdhaW5zdCBQViBkb21haW5z
IG1vZGlmeSB0aGUgZnVuY3Rpb24Kc28gaXQncyBvbmx5IHVzYWJsZSBhZ2FpbnN0IHRyYW5zbGF0
ZWQgZG9tYWlucywgYXMgdGhlIG90aGVyIHAybQpyZWxhdGVkIGZ1bmN0aW9ucy4KClJlcG9ydGVk
LWJ5OiBSb21hbiBTaGFwb3NobmlrIDxyb21hbkB6ZWRlZGEuY29tPgpTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgpDYzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KQ2M6IFJv
bWFuIFNoYXBvc2huaWsgPHJvbWFuQHplZGVkYS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL3Ay
bS5jICAgICAgICAgICAgICAgfCAxMSArKysrLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMgfCAyMyArKysrKysrKysrKysrKysrKystLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5kZXggZmVmOTdjODJm
Ni4uZDM2YTU4YjFhNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMTM0MSwxMCArMTM0MSw4IEBAIGludCBzZXRfaWRlbnRp
dHlfcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCiAKICAg
ICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUocDJtLT5kb21haW4pICkKICAgICB7Ci0gICAg
ICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCi0gICAgICAgICAgICByZXR1cm4gMDsK
LSAgICAgICAgcmV0dXJuIGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4oZ2Zu
X2wpLCBQQUdFX09SREVSXzRLLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01N
VUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpOworICAgICAgICBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsKKyAgICAgICAgcmV0dXJuIC1FTlhJTzsKICAgICB9CiAKICAgICBnZm5fbG9jayhwMm0s
IGdmbiwgMCk7CkBAIC0xNDMyLDkgKzE0MzAsOCBAQCBpbnQgY2xlYXJfaWRlbnRpdHlfcDJtX2Vu
dHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wpCiAKICAgICBpZiAoICFw
YWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQogICAgIHsKLSAgICAgICAgaWYgKCAhbmVlZF9pb21t
dV9wdF9zeW5jKGQpICkKLSAgICAgICAgICAgIHJldHVybiAwOwotICAgICAgICByZXR1cm4gaW9t
bXVfbGVnYWN5X3VubWFwKGQsIF9kZm4oZ2ZuX2wpLCBQQUdFX09SREVSXzRLKTsKKyAgICAgICAg
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAgICAgIHJldHVybiAtRU5YSU87CiAgICAgfQogCiAg
ICAgZ2ZuX2xvY2socDJtLCBnZm4sIDApOwpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpp
bmRleCA1ZDcyMjcwYzViLi42MmRmNWNhNWFhIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9t
bXUuYwpAQCAtMTk2OSw2ICsxOTY5LDcgQEAgc3RhdGljIGludCBybXJyX2lkZW50aXR5X21hcHBp
bmcoc3RydWN0IGRvbWFpbiAqZCwgYm9vbF90IG1hcCwKICAgICB1bnNpZ25lZCBsb25nIGVuZF9w
Zm4gPSBQQUdFX0FMSUdOXzRLKHJtcnItPmVuZF9hZGRyZXNzKSA+PiBQQUdFX1NISUZUXzRLOwog
ICAgIHN0cnVjdCBtYXBwZWRfcm1yciAqbXJtcnI7CiAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAq
aGQgPSBkb21faW9tbXUoZCk7CisgICAgdW5zaWduZWQgaW50IGZsdXNoX2ZsYWdzID0gMDsKIAog
ICAgIEFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKTsKICAgICBBU1NFUlQocm1yci0+YmFzZV9hZGRy
ZXNzIDwgcm1yci0+ZW5kX2FkZHJlc3MpOwpAQCAtMTk4Miw3ICsxOTgzLDcgQEAgc3RhdGljIGlu
dCBybXJyX2lkZW50aXR5X21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwgYm9vbF90IG1hcCwKICAg
ICAgICAgaWYgKCBtcm1yci0+YmFzZSA9PSBybXJyLT5iYXNlX2FkZHJlc3MgJiYKICAgICAgICAg
ICAgICBtcm1yci0+ZW5kID09IHJtcnItPmVuZF9hZGRyZXNzICkKICAgICAgICAgewotICAgICAg
ICAgICAgaW50IHJldCA9IDA7CisgICAgICAgICAgICBpbnQgcmV0ID0gMCwgZXJyOwogCiAgICAg
ICAgICAgICBpZiAoIG1hcCApCiAgICAgICAgICAgICB7CkBAIC0xOTk1LDEzICsxOTk2LDIwIEBA
IHN0YXRpYyBpbnQgcm1ycl9pZGVudGl0eV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsIGJvb2xf
dCBtYXAsCiAKICAgICAgICAgICAgIHdoaWxlICggYmFzZV9wZm4gPCBlbmRfcGZuICkKICAgICAg
ICAgICAgIHsKLSAgICAgICAgICAgICAgICBpZiAoIGNsZWFyX2lkZW50aXR5X3AybV9lbnRyeShk
LCBiYXNlX3BmbikgKQotICAgICAgICAgICAgICAgICAgICByZXQgPSAtRU5YSU87CisgICAgICAg
ICAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQorICAgICAgICAgICAgICAg
ICAgICByZXQgPSBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoZCwgYmFzZV9wZm4pOworICAgICAg
ICAgICAgICAgIGVsc2UKKyAgICAgICAgICAgICAgICAgICAgcmV0ID0gaW9tbXVfdW5tYXAoZCwg
X2RmbihiYXNlX3BmbiksIFBBR0VfT1JERVJfNEssCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZmbHVzaF9mbGFncyk7CiAgICAgICAgICAgICAgICAgYmFzZV9wZm4rKzsK
ICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAgbGlzdF9kZWwoJm1ybXJyLT5saXN0KTsKICAg
ICAgICAgICAgIHhmcmVlKG1ybXJyKTsKKyAgICAgICAgICAgIC8qIEtlZXAgdGhlIHByZXZpb3Vz
IGVycm9yIGNvZGUgaWYgdGhlcmUncyBvbmUuICovCisgICAgICAgICAgICBlcnIgPSBpb21tdV9p
b3RsYl9mbHVzaF9hbGwoZCwgZmx1c2hfZmxhZ3MpOworICAgICAgICAgICAgaWYgKCAhcmV0ICkK
KyAgICAgICAgICAgICAgICByZXQgPSBlcnI7CiAgICAgICAgICAgICByZXR1cm4gcmV0OwogICAg
ICAgICB9CiAgICAgfQpAQCAtMjAxMSw4ICsyMDE5LDEzIEBAIHN0YXRpYyBpbnQgcm1ycl9pZGVu
dGl0eV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBtYXAsCiAKICAgICB3aGlsZSAo
IGJhc2VfcGZuIDwgZW5kX3BmbiApCiAgICAgewotICAgICAgICBpbnQgZXJyID0gc2V0X2lkZW50
aXR5X3AybV9lbnRyeShkLCBiYXNlX3BmbiwgcDJtX2FjY2Vzc19ydywgZmxhZyk7CisgICAgICAg
IGludCBlcnI7CiAKKyAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQorICAg
ICAgICAgICAgZXJyID0gc2V0X2lkZW50aXR5X3AybV9lbnRyeShkLCBiYXNlX3BmbiwgcDJtX2Fj
Y2Vzc19ydywgZmxhZyk7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIGVyciA9IGlvbW11X21h
cChkLCBfZGZuKGJhc2VfcGZuKSwgX21mbihiYXNlX3BmbiksIFBBR0VfT1JERVJfNEssCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxl
LCAmZmx1c2hfZmxhZ3MpOwogICAgICAgICBpZiAoIGVyciApCiAgICAgICAgICAgICByZXR1cm4g
ZXJyOwogICAgICAgICBiYXNlX3BmbisrOwpAQCAtMjAyNiw3ICsyMDM5LDcgQEAgc3RhdGljIGlu
dCBybXJyX2lkZW50aXR5X21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwgYm9vbF90IG1hcCwKICAg
ICBtcm1yci0+Y291bnQgPSAxOwogICAgIGxpc3RfYWRkX3RhaWwoJm1ybXJyLT5saXN0LCAmaGQt
PmFyY2gubWFwcGVkX3JtcnJzKTsKIAotICAgIHJldHVybiAwOworICAgIHJldHVybiBpb21tdV9p
b3RsYl9mbHVzaF9hbGwoZCwgZmx1c2hfZmxhZ3MpOwogfQogCiBzdGF0aWMgaW50IGludGVsX2lv
bW11X2FkZF9kZXZpY2UodTggZGV2Zm4sIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQotLSAKMi4yMC4x
IChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
