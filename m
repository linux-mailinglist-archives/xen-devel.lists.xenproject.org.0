Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BDC2EDB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:30:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDWG-0007Zt-FL; Tue, 01 Oct 2019 08:28:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFDWF-0007Zm-DH
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:28:27 +0000
X-Inumbo-ID: 6f9d7416-e425-11e9-96f4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 6f9d7416-e425-11e9-96f4-12813bfff9fa;
 Tue, 01 Oct 2019 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569918506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=blPZs7U2JM4O6k6nBMNKdwPphdgEJHB3IGwWcUJP3fA=;
 b=U7+SKkzbTT2+5OWewY4G75/5xBMmud16MYEBiGxs4HPBFKIykztPGtrq
 SL3dv7oZ5cxMNtqZWcuSlNTAy8t4UdVATtbs0StopNc8q593F04tMyrQD
 E9tPn100hqGrElXvUpvbSWh2TG0x1uYtZRT7jz4ZvJkwATLsEVLRL1R9R Q=;
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
IronPort-SDR: 6oCxCUHSDgAgbxgvN1R2szSz4405WtpopLrJ8E2JbfcFw1BUPcjxdDLc2tN5SnYhmy7jnXp/UJ
 pHpaJ8zSkaITivTwokF6lp1enk/DjMUN64vVe6LEOVjp9w+E8VEImceTBxcBI2DGXr0YkhLQ8r
 B9F5Zi+t4f/vEl5cmMzW9ViSKng6YXDezL2uk+texLegvD2xV+HPXDgl/VUlsSRIIOSMR7YXrH
 aiGJdVy/dgeh/MmbpdymeZa3/TN7XRz4nErcuxhym12wkJlB6KGKMLDGO6ilQ2D8haQTqBLEFU
 R2s=
X-SBRS: 2.7
X-MesageID: 6299397
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6299397"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 09:28:18 +0100
Message-ID: <20191001082818.34233-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm93IHRoYXQgeGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9NTVUg
bWFwcGluZ3MgZm9yIGEKZG9tYWluLCBtaWdyYXRpb24gbWF5IGJlIG5lZWRsZXNzbHkgdmV0b2Vk
IGR1ZSB0byB0aGUgY2hlY2sgb2YKaXNfaW9tbXVfZW5hYmxlZCgpIGluIHBhZ2luZ19sb2dfZGly
dHlfZW5hYmxlKCkuClRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dkaXJ0
eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNzCmRldmljZXMgYXJlIGFzc2lnbmVkIHRvIGEgZG9t
YWluIGFuZCB0aGF0IGRvbWFpbiBpcyBzaGFyaW5nIEhBUCBtYXBwaW5ncwp3aXRoIHRoZSBJT01N
VSAoaW4gd2hpY2ggY2FzZSBkaXNhYmxpbmcgd3JpdGUgcGVybWlzc2lvbnMgaW4gdGhlIFAyTSBt
YXkKY2F1c2UgRE1BIGZhdWx0cykuCgpUaGlzIHBhdGNoIHRoZXJlZm9yZSByZXZlcnRzIGNvbW1p
dCAzNzIwMWM2MiAibWFrZSBsb2dkaXJ0eSBhbmQgaW9tbXUKbXV0dWFsbHkgZXhjbHVzaXZlIiBh
bmQgcmVwbGFjZXMgaXQgd2l0aCBjaGVja3MgdG8gZW5zdXJlIHRoYXQsIGlmCmlvbW11X3VzZV9o
YXBfcHQoKSBpcyB0cnVlLCB0aGF0IGxvZ2RpcnR5IGFuZCBkZXZpY2UgYXNzaWdubWVudCBhcmUg
bXV0dWFsbHkKZXhjbHVzaXZlLgoKTk9URTogV2hpbGUgaW4gdGhlIG5laWdoYm91cmhvb2QsIHRo
ZSBib29sX3QgcGFyYW1ldGVyIHR5cGUgaW4KICAgICAgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUo
KSBpcyByZXBsYWNlZCB3aXRoIGEgYm9vbCBhbmQgdGhlIGZvcm1hdAogICAgICBvZiB0aGUgY29t
bWVudCBpbiBhc3NpZ25fZGV2aWNlKCkgaXMgZml4ZWQuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvbW0vaGFwL2hhcC5jICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMg
ICAgICB8ICA4ICsrKystLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDEwICsr
KysrKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcGFnaW5nLmggIHwgIDIgKy0KIDQgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwppbmRl
eCA0MTJhNDQyYjZhLi4zZDkzZjM0NTFjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFw
L2hhcC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKQEAgLTcxLDcgKzcxLDcgQEAg
aW50IGhhcF90cmFja19kaXJ0eV92cmFtKHN0cnVjdCBkb21haW4gKmQsCiAKICAgICAgICAgaWYg
KCAhcGFnaW5nX21vZGVfbG9nX2RpcnR5KGQpICkKICAgICAgICAgewotICAgICAgICAgICAgcmMg
PSBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZShkLCAwKTsKKyAgICAgICAgICAgIHJjID0gcGFnaW5n
X2xvZ19kaXJ0eV9lbmFibGUoZCwgZmFsc2UpOwogICAgICAgICAgICAgaWYgKCByYyApCiAgICAg
ICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgIH0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9wYWdpbmcuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwppbmRleCBkOWE1MmM0ZGI0
Li4yNDBmNmY5M2ZiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKKysrIGIv
eGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCkBAIC0yMDksMTUgKzIwOSwxNSBAQCBzdGF0aWMgaW50
IHBhZ2luZ19mcmVlX2xvZ19kaXJ0eV9iaXRtYXAoc3RydWN0IGRvbWFpbiAqZCwgaW50IHJjKQog
ICAgIHJldHVybiByYzsKIH0KIAotaW50IHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKHN0cnVjdCBk
b21haW4gKmQsIGJvb2xfdCBsb2dfZ2xvYmFsKQoraW50IHBhZ2luZ19sb2dfZGlydHlfZW5hYmxl
KHN0cnVjdCBkb21haW4gKmQsIGJvb2wgbG9nX2dsb2JhbCkKIHsKICAgICBpbnQgcmV0OwogCi0g
ICAgaWYgKCBpc19pb21tdV9lbmFibGVkKGQpICYmIGxvZ19nbG9iYWwgKQorICAgIGlmICggaGFz
X2FyY2hfcGRldnMoZCkgJiYgaW9tbXVfdXNlX2hhcF9wdChkKSAmJiBsb2dfZ2xvYmFsICkKICAg
ICB7CiAgICAgICAgIC8qCiAgICAgICAgICAqIFJlZnVzZSB0byB0dXJuIG9uIGdsb2JhbCBsb2ct
ZGlydHkgbW9kZQotICAgICAgICAgKiBpZiB0aGUgZG9tYWluIGlzIHVzaW5nIHRoZSBJT01NVS4K
KyAgICAgICAgICogaWYgdGhlIGRvbWFpbiBpcyBzaGFyaW5nIHRoZSBQMk0gd2l0aCB0aGUgSU9N
TVUuCiAgICAgICAgICAqLwogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CkBAIC03Mjcs
NyArNzI3LDcgQEAgaW50IHBhZ2luZ19kb21jdGwoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHhl
bl9kb21jdGxfc2hhZG93X29wICpzYywKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAvKiBF
bHNlIGZhbGwgdGhyb3VnaC4uLiAqLwogICAgIGNhc2UgWEVOX0RPTUNUTF9TSEFET1dfT1BfRU5B
QkxFX0xPR0RJUlRZOgotICAgICAgICByZXR1cm4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoZCwg
MSk7CisgICAgICAgIHJldHVybiBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZShkLCB0cnVlKTsKIAog
ICAgIGNhc2UgWEVOX0RPTUNUTF9TSEFET1dfT1BfT0ZGOgogICAgICAgICBpZiAoIChyYyA9IHBh
Z2luZ19sb2dfZGlydHlfZGlzYWJsZShkLCByZXN1bWluZykpICE9IDAgKQpkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYwppbmRleCA3ZGVlZjJmMTJiLi45NjE0ZGNhOGMxIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwpA
QCAtMTQ4NiwxMSArMTQ4NiwxNSBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRv
bWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMyIGZsYWcpCiAgICAgaWYgKCAh
aXNfaW9tbXVfZW5hYmxlZChkKSApCiAgICAgICAgIHJldHVybiAwOwogCi0gICAgLyogUHJldmVu
dCBkZXZpY2UgYXNzaWduIGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuIAot
ICAgICAqIGVuYWJsZWQgZm9yIHRoaXMgZG9tYWluICovCisgICAgLyoKKyAgICAgKiBQcmV2ZW50
IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBtZW0gc2hhcmluZyBoYXZlIGJlZW4KKyAg
ICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFpbiwgb3IgbG9nZGlydHkgaXMgZW5hYmxlZCBhbmQg
dGhlIFAyTSBpcworICAgICAqIHNoYXJlZCB3aXRoIHRoZSBJT01NVS4KKyAgICAgKi8KICAgICBp
ZiAoIHVubGlrZWx5KGQtPmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwKICAgICAgICAg
ICAgICAgICAgIHZtX2V2ZW50X2NoZWNrX3JpbmcoZC0+dm1fZXZlbnRfcGFnaW5nKSB8fAotICAg
ICAgICAgICAgICAgICAgcDJtX2dldF9ob3N0cDJtKGQpLT5nbG9iYWxfbG9nZGlydHkpICkKKyAg
ICAgICAgICAgICAgICAgIChwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSAmJgor
ICAgICAgICAgICAgICAgICAgIGlvbW11X3VzZV9oYXBfcHQoZCkpKSApCiAgICAgICAgIHJldHVy
biAtRVhERVY7CiAKICAgICBpZiAoICFwY2lkZXZzX3RyeWxvY2soKSApCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2luZy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdpbmcu
aAppbmRleCBhYjc4ODdmMjNjLi44YzIwMjdjNzkxIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L3BhZ2luZy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcGFnaW5nLmgKQEAgLTE1
Nyw3ICsxNTcsNyBAQCB2b2lkIHBhZ2luZ19sb2dfZGlydHlfcmFuZ2Uoc3RydWN0IGRvbWFpbiAq
ZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90ICpkaXJ0eV9iaXRtYXApOwog
CiAvKiBlbmFibGUgbG9nIGRpcnR5ICovCi1pbnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3Ry
dWN0IGRvbWFpbiAqZCwgYm9vbF90IGxvZ19nbG9iYWwpOworaW50IHBhZ2luZ19sb2dfZGlydHlf
ZW5hYmxlKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgbG9nX2dsb2JhbCk7CiAKIC8qIGxvZyBkaXJ0
eSBpbml0aWFsaXphdGlvbiAqLwogdm9pZCBwYWdpbmdfbG9nX2RpcnR5X2luaXQoc3RydWN0IGRv
bWFpbiAqZCwgY29uc3Qgc3RydWN0IGxvZ19kaXJ0eV9vcHMgKm9wcyk7Ci0tIAoyLjIwLjEuMi5n
YjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
