Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711ED7FDB0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZbJ-00032p-9E; Fri, 02 Aug 2019 15:36:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZbH-00032L-K3
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:36:11 +0000
X-Inumbo-ID: 40cc03d6-b53b-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 40cc03d6-b53b-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:36:10 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n65uTvD2AdDmT0zmnaVGCgaKo7+N7xtrBAt+XoVhcwIjYEfcY821bc4NyD1A8mJ+okZI1RnYR0
 vxC2JExWp1IrBl4fdUtDmR2vt1V51IP68CnAR7+/m8g+LY5Rv45uUc4CaEapzlzRO2kbfCGDDG
 BPqExrpZGJVTczMThtkAXsW4R6zvNWKwYyeHengo33dDy0O8Sf1DwXoeCLpbyK48d3AHvxYjh4
 I+/YW+ODIQv3vkjcNSROZEvuyZnlJX1dRm2O/9/TruhxxdNYe0Q08GqXrUC86rL1DLxE8/ETx0
 JKY=
X-SBRS: 2.7
X-MesageID: 3825668
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3825668"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:34 +0100
Message-ID: <20190802153606.32061-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 03/35] libxl: Make libxl_set_vcpuonline async
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYmVjYXVzZSBpdCBtYWtlcyBRTVAgY2FsbHMgd2hpY2ggYXJlIGdvaW5nIHRvIGJlIGFzeW5j
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgfCAxNCArKysrKysrKysrKysrLQog
dG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgfCAxMiArKysrKysrKy0tLS0KIHRvb2xzL3hsL3hs
X2NwdXBvb2wuYyAgICAgIHwgIDIgKy0KIHRvb2xzL3hsL3hsX3ZjcHUuYyAgICAgICAgIHwgIDIg
Ky0KIDQgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5oIGIvdG9vbHMvbGlieGwvbGlieGwuaAppbmRl
eCAwMTY0ZDkzYWRmLi4yMjRjOWFmMWM2IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bC5o
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKQEAgLTIyODcsNyArMjI4NywxOSBAQCBpbnQgbGli
eGxfZG9tYWluX3NldF9ub2RlYWZmaW5pdHkobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlk
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2JpdG1hcCAqbm9kZW1h
cCk7CiBpbnQgbGlieGxfZG9tYWluX2dldF9ub2RlYWZmaW5pdHkobGlieGxfY3R4ICpjdHgsIHVp
bnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2Jp
dG1hcCAqbm9kZW1hcCk7Ci1pbnQgbGlieGxfc2V0X3ZjcHVvbmxpbmUobGlieGxfY3R4ICpjdHgs
IHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9iaXRtYXAgKmNwdW1hcCk7CitpbnQgbGlieGxfc2V0X3Zj
cHVvbmxpbmUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAorICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX2JpdG1hcCAqY3B1bWFwLAorICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3cpCisgICAgICAgICAgICAgICAgICAgICAg
ICAgTElCWExfRVhURVJOQUxfQ0FMTEVSU19PTkxZOworI2lmIGRlZmluZWQoTElCWExfQVBJX1ZF
UlNJT04pICYmIExJQlhMX0FQSV9WRVJTSU9OIDwgMHgwNDEzMDAKK3N0YXRpYyBpbmxpbmUgaW50
IGxpYnhsX3NldF92Y3B1b25saW5lXzB4MDQxMjAwKGxpYnhsX2N0eCAqY3R4LAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9iaXRt
YXAgKmNwdW1hcCkKK3sKKyAgICByZXR1cm4gbGlieGxfc2V0X3ZjcHVvbmxpbmUoY3R4LCBkb21p
ZCwgY3B1bWFwLCBOVUxMKTsKK30KKyNkZWZpbmUgbGlieGxfc2V0X3ZjcHVvbmxpbmUgbGlieGxf
c2V0X3ZjcHVvbmxpbmVfMHgwNDEyMDAKKyNlbmRpZgogCiAvKiBBIHJldHVybiB2YWx1ZSBsZXNz
IHRoYW4gMCBzaG91bGQgYmUgaW50ZXJwcmV0ZWQgYXMgYSBsaWJ4bF9lcnJvciwgd2hpbGUgYQog
ICogcmV0dXJuIHZhbHVlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAwIHNob3VsZCBiZSBpbnRl
cnByZXRlZCBhcyBhCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmluZGV4IDg2Y2RkYzA1YTkuLjYwYzNmN2EzNGIgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2RvbWFpbi5jCkBAIC0xMzg2LDkgKzEzODYsMTEgQEAgc3RhdGljIGludCBsaWJ4bF9fc2V0
X3ZjcHVvbmxpbmVfcW1wKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgIHJldHVy
biByYzsKIH0KIAotaW50IGxpYnhsX3NldF92Y3B1b25saW5lKGxpYnhsX2N0eCAqY3R4LCB1aW50
MzJfdCBkb21pZCwgbGlieGxfYml0bWFwICpjcHVtYXApCitpbnQgbGlieGxfc2V0X3ZjcHVvbmxp
bmUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX2JpdG1hcCAqY3B1bWFwLAorICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3cpCiB7Ci0gICAgR0NfSU5JVChjdHgpOworICAgIEFP
X0NSRUFURShjdHgsIGRvbWlkLCBhb19ob3cpOwogICAgIGludCByYywgbWF4Y3B1czsKICAgICBs
aWJ4bF9kb21pbmZvIGluZm87CiAKQEAgLTE0MzksOCArMTQ0MSwxMCBAQCBpbnQgbGlieGxfc2V0
X3ZjcHVvbmxpbmUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9iaXRtYXAg
KmNwdW1hcCkKIAogb3V0OgogICAgIGxpYnhsX2RvbWluZm9fZGlzcG9zZSgmaW5mbyk7Ci0gICAg
R0NfRlJFRTsKLSAgICByZXR1cm4gcmM7CisgICAgaWYgKHJjKQorICAgICAgICByZXR1cm4gQU9f
Q1JFQVRFX0ZBSUwocmMpOworICAgIGxpYnhsX19hb19jb21wbGV0ZShlZ2MsIGFvLCByYyk7Cisg
ICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9CiAKIHN0YXRpYyBpbnQgbGlieGxfX2RvbWFpbl9z
M19yZXN1bWUobGlieGxfX2djICpnYywgaW50IGRvbWlkKQpkaWZmIC0tZ2l0IGEvdG9vbHMveGwv
eGxfY3B1cG9vbC5jIGIvdG9vbHMveGwveGxfY3B1cG9vbC5jCmluZGV4IDI3MzgxMWI2NjMuLmNm
ZmU4N2UwYzcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX2NwdXBvb2wuYworKysgYi90b29scy94
bC94bF9jcHVwb29sLmMKQEAgLTU0Niw3ICs1NDYsNyBAQCBpbnQgbWFpbl9jcHVwb29sbnVtYXNw
bGl0KGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICAgICAgZnByaW50ZihzdGRlcnIsICJlcnJv
ciBvbiBnZXR0aW5nIGluZm8gZm9yIERvbWFpbi0wXG4iKTsKICAgICAgICAgZ290byBvdXQ7CiAg
ICAgfQotICAgIGlmIChpbmZvLnZjcHVfb25saW5lID4gbiAmJiBsaWJ4bF9zZXRfdmNwdW9ubGlu
ZShjdHgsIDAsICZjcHVtYXApKSB7CisgICAgaWYgKGluZm8udmNwdV9vbmxpbmUgPiBuICYmIGxp
YnhsX3NldF92Y3B1b25saW5lKGN0eCwgMCwgJmNwdW1hcCwgTlVMTCkpIHsKICAgICAgICAgZnBy
aW50ZihzdGRlcnIsICJlcnJvciBvbiByZW1vdmluZyB2Y3B1cyBmb3IgRG9tYWluLTBcbiIpOwog
ICAgICAgICBnb3RvIG91dDsKICAgICB9CmRpZmYgLS1naXQgYS90b29scy94bC94bF92Y3B1LmMg
Yi90b29scy94bC94bF92Y3B1LmMKaW5kZXggMzI5NTEyZWFhZi4uOWZmNTM1NGY3NCAxMDA2NDQK
LS0tIGEvdG9vbHMveGwveGxfdmNwdS5jCisrKyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwpAQCAtMzY5
LDcgKzM2OSw3IEBAIHN0YXRpYyBpbnQgdmNwdXNldCh1aW50MzJfdCBkb21pZCwgY29uc3QgY2hh
ciogbnJfdmNwdXMsIGludCBjaGVja19ob3N0KQogICAgIGZvciAoaSA9IDA7IGkgPCBtYXhfdmNw
dXM7IGkrKykKICAgICAgICAgbGlieGxfYml0bWFwX3NldCgmY3B1bWFwLCBpKTsKIAotICAgIHJj
ID0gbGlieGxfc2V0X3ZjcHVvbmxpbmUoY3R4LCBkb21pZCwgJmNwdW1hcCk7CisgICAgcmMgPSBs
aWJ4bF9zZXRfdmNwdW9ubGluZShjdHgsIGRvbWlkLCAmY3B1bWFwLCBOVUxMKTsKICAgICBpZiAo
cmMgPT0gRVJST1JfRE9NQUlOX05PVEZPVU5EKQogICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkRv
bWFpbiAldSBkb2VzIG5vdCBleGlzdC5cbiIsIGRvbWlkKTsKICAgICBlbHNlIGlmIChyYykKLS0g
CkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
