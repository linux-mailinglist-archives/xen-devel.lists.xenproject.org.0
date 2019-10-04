Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95273CBEFC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:20:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPKk-0001V7-UF; Fri, 04 Oct 2019 15:17:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPKj-0001Ue-RX
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:17:29 +0000
X-Inumbo-ID: 0ba540d3-e6ba-11e9-975c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ba540d3-e6ba-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570202235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Wloc/ADazxebQ6zdg+jzOuNdy0A5DXAfjbJS/xjy88k=;
 b=Dzu70L8Bi6sdKupRc8qyEKlzJIb/W7/4YX16VAh3UDTHLKEZtEwrbI+I
 hqW3Ni2UbTr8dN0gPe1rPK5Q2ufYdiDFwn+sMPhKgoYw+tjH5WAHfbJnj
 lTsyG9OZqWI/rqiF3Vy93eHpD4/M2JaQ+1ZkQdU9wHZ3IWvVMxuNWPkmE U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8NeuyaetzKZCi3x/R0KzBSDdrkXEltJcN7XoAkQOr9jjv8e/SuCaUvKblWoZwuPc7PcKyBy4fy
 7nVOQ+D5aTb5LAzk2pn3u8nbLMOjLXAYZ0iV25g4wxbpuEkmBAo6ihB7cVwV4jethUk1f7njMi
 maUSWjbt0nOddYDp0s3OD2jRnjRt/jl3KBW6yk7khK78kUEQKgNQa9B8bsno7lyl0ysEidGv3F
 fRIQrKhOVjs1aHO/kxvljXgXWhFqd1pEH69lf5u9jT5IMaOAPfLgWPuum6Mk9tquMre3pn25aY
 d4w=
X-SBRS: 2.7
X-MesageID: 6846605
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6846605"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 4 Oct 2019 16:17:07 +0100
Message-ID: <20191004151707.24844-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 6/6] libxl: Remove/deprecate
 libxl_get_required_*_memory from the API
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIG5vdyByZWR1bmRhbnQgYmVjYXVzZSBzaGFkb3dfbWVta2IgYW5kIGlvbW11X21l
bWtiIGFyZSBub3cKZGVmYXVsdGVkIGF1dG9tYXRpY2FsbHkgYnkgbGlieGxfZG9tYWluX25lZWRf
bWVtb3J5IGFuZApsaWJ4bF9kb21haW5fY3JlYXRlIGV0Yy4gIENhbGxlcnMgc2hvdWxkIG5vdCBu
b3cgY2FsbCB0aGVzZTsgaW5zdGVhZCwKdGhleSBzaG91bGQganVzdCBsZXQgbGlieGwgdGFrZSBj
YXJlIG9mIGl0LgoKbGlieGxfZ2V0X3JlcXVpcmVkX3NoYWRvd19tZW1vcnkgd2FzIGludHJvZHVj
ZWQgaW4gZjg5ZjU1NTgyN2E2CiAgInJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0cnVjdGlv
biBvZiBJT01NVSBwYWdlIHRhYmxlcyIKV2UgY2FuIGZyZWVseSByZW1vdmUgaXQgYmVjYXVzZSBp
dCB3YXMgbmV2ZXIgaW4gYW55IHJlbGVhc2UuCgpsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21l
bW9yeSBoYXMgYmVlbiBpbiBsaWJ4bCBhcHByb3hpbWF0ZWx5CmZvcmV2ZXIuICBJdCBzaG91bGQg
cHJvYmFibHkgbm90IGhhdmUgc3Vydml2ZWQgdGhlIGNyZWF0aW9uIG9mCmxpYnhsX2RvbWFpbl9j
cmVhdGUsIGJ1dCBpdCBzZWVtcyB0aGUgQVBJIGF3a3dhcmRuZXNzZXMgd2Ugc2VlIGluCnJlY2Vu
dCBjb21taXRzIHByZXZlbnRlZCB0aGlzLiAgU28gd2UgaGF2ZSB0byBrZWVwIGl0LiAgSXQgcmVt
YWlucwpmdW5jdGlvbmFsIGJ1dCB3ZSBjYW4gZGVwcmVjYXRlIGl0LiAgSG9wZWZ1bGx5IHdlIGNh
biBnZXQgcmlkIG9mIGl0CmNvbXBsZXRlbHkgYmVmb3JlIHdlIGZpbmQgdGhlIG5lZWQgdG8gY2hh
bmdlIHRoZSBjYWxjdWxhdGlvbiB0byB1c2UKYWRkaXRpb25hbCBpbmZvcm1hdGlvbiB3aGljaCBp
dHMgYXJndW1lbnRzIGRvIG5vdCBjdXJyZW50bHkgc3VwcGx5LgoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGli
eGxfY3JlYXRlLmMgfCAxNyArKysrKysrKysrKysrKysrLQogdG9vbHMvbGlieGwvbGlieGxfdXRp
bHMuYyAgfCAxNSAtLS0tLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmggIHwg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYwppbmRleCAzYzUwMzNiMDViLi42NTNiMDc2NDZlIDEwMDY0NAotLS0gYS90
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUu
YwpAQCAtODg4LDYgKzg4OCwyMSBAQCBzdGF0aWMgX0Jvb2wgb2tfdG9fZGVmYXVsdF9tZW1rYl9p
bl9jcmVhdGUobGlieGxfX2djICpnYykKICAgICAgKi8KIH0KIAorc3RhdGljIHVuc2lnbmVkIGxv
bmcgbGlieGxfX2dldF9yZXF1aXJlZF9pb21tdV9tZW1vcnkodW5zaWduZWQgbG9uZyBtYXhtZW1f
a2IpCit7CisgICAgdW5zaWduZWQgbG9uZyBpb21tdV9wYWdlcyA9IDAsIG1lbV9wYWdlcyA9IG1h
eG1lbV9rYiAvIDQ7CisgICAgdW5zaWduZWQgaW50IGxldmVsOworCisgICAgLyogQXNzdW1lIGEg
NCBsZXZlbCBwYWdlIHRhYmxlIHdpdGggNTEyIGVudHJpZXMgcGVyIGxldmVsICovCisgICAgZm9y
IChsZXZlbCA9IDA7IGxldmVsIDwgNDsgbGV2ZWwrKykKKyAgICB7CisgICAgICAgIG1lbV9wYWdl
cyA9IERJVl9ST1VORFVQKG1lbV9wYWdlcywgNTEyKTsKKyAgICAgICAgaW9tbXVfcGFnZXMgKz0g
bWVtX3BhZ2VzOworICAgIH0KKworICAgIHJldHVybiBpb21tdV9wYWdlcyAqIDQ7Cit9CisKIGlu
dCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZp
ZywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkKQpA
QCAtMTAxMSw3ICsxMDI2LDcgQEAgaW50IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQo
bGlieGxfX2djICpnYywKICAgICAgICAgJiYgb2tfdG9fZGVmYXVsdF9tZW1rYl9pbl9jcmVhdGUo
Z2MpKQogICAgICAgICBkX2NvbmZpZy0+Yl9pbmZvLmlvbW11X21lbWtiID0KICAgICAgICAgICAg
IChkX2NvbmZpZy0+Y19pbmZvLnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNf
UFQpCi0gICAgICAgICAgICA/IGxpYnhsX2dldF9yZXF1aXJlZF9pb21tdV9tZW1vcnkoZF9jb25m
aWctPmJfaW5mby5tYXhfbWVta2IpCisgICAgICAgICAgICA/IGxpYnhsX19nZXRfcmVxdWlyZWRf
aW9tbXVfbWVtb3J5KGRfY29uZmlnLT5iX2luZm8ubWF4X21lbWtiKQogICAgICAgICAgICAgOiAw
OwogCiAgICAgcmV0ID0gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoZ2MsICZk
X2NvbmZpZy0+Yl9pbmZvKTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMg
Yi90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCmluZGV4IDQwNTczM2I3ZTEuLmYzNjBmNWUyMjgg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfdXRpbHMuYwpAQCAtNDgsMjEgKzQ4LDYgQEAgdW5zaWduZWQgbG9uZyBsaWJ4bF9nZXRf
cmVxdWlyZWRfc2hhZG93X21lbW9yeSh1bnNpZ25lZCBsb25nIG1heG1lbV9rYiwgdW5zaWduZWQK
ICAgICByZXR1cm4gNCAqICgyNTYgKiBzbXBfY3B1cyArIDIgKiAobWF4bWVtX2tiIC8gMTAyNCkp
OwogfQogCi11bnNpZ25lZCBsb25nIGxpYnhsX2dldF9yZXF1aXJlZF9pb21tdV9tZW1vcnkodW5z
aWduZWQgbG9uZyBtYXhtZW1fa2IpCi17Ci0gICAgdW5zaWduZWQgbG9uZyBpb21tdV9wYWdlcyA9
IDAsIG1lbV9wYWdlcyA9IG1heG1lbV9rYiAvIDQ7Ci0gICAgdW5zaWduZWQgaW50IGxldmVsOwot
Ci0gICAgLyogQXNzdW1lIGEgNCBsZXZlbCBwYWdlIHRhYmxlIHdpdGggNTEyIGVudHJpZXMgcGVy
IGxldmVsICovCi0gICAgZm9yIChsZXZlbCA9IDA7IGxldmVsIDwgNDsgbGV2ZWwrKykKLSAgICB7
Ci0gICAgICAgIG1lbV9wYWdlcyA9IERJVl9ST1VORFVQKG1lbV9wYWdlcywgNTEyKTsKLSAgICAg
ICAgaW9tbXVfcGFnZXMgKz0gbWVtX3BhZ2VzOwotICAgIH0KLQotICAgIHJldHVybiBpb21tdV9w
YWdlcyAqIDQ7Ci19Ci0KIGNoYXIgKmxpYnhsX2RvbWlkX3RvX25hbWUobGlieGxfY3R4ICpjdHgs
IHVpbnQzMl90IGRvbWlkKQogewogICAgIHVuc2lnbmVkIGludCBsZW47CmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF91dGlscy5oIGIvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuaAppbmRl
eCA2MzBjY2JlMjhhLi40NjkxOGFlYTg0IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF91
dGlscy5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmgKQEAgLTI0LDcgKzI0LDcgQEAg
Y29uc3QKIGNoYXIgKmxpYnhsX2Jhc2VuYW1lKGNvbnN0IGNoYXIgKm5hbWUpOyAvKiByZXR1cm5z
IHN0cmluZyBmcm9tIHN0cmR1cCAqLwogCiB1bnNpZ25lZCBsb25nIGxpYnhsX2dldF9yZXF1aXJl
ZF9zaGFkb3dfbWVtb3J5KHVuc2lnbmVkIGxvbmcgbWF4bWVtX2tiLCB1bnNpZ25lZCBpbnQgc21w
X2NwdXMpOwotdW5zaWduZWQgbG9uZyBsaWJ4bF9nZXRfcmVxdWlyZWRfaW9tbXVfbWVtb3J5KHVu
c2lnbmVkIGxvbmcgbWF4bWVtX2tiKTsKKyAgLyogZGVwcmVjYXRlZDsgc2VlIExJQlhMX0hBVkVf
RE9NQUlOX05FRURfTUVNT1JZX0NPTkZJRyBpbiBsaWJ4bC5oICovCiBpbnQgbGlieGxfbmFtZV90
b19kb21pZChsaWJ4bF9jdHggKmN0eCwgY29uc3QgY2hhciAqbmFtZSwgdWludDMyX3QgKmRvbWlk
KTsKIGludCBsaWJ4bF9kb21haW5fcXVhbGlmaWVyX3RvX2RvbWlkKGxpYnhsX2N0eCAqY3R4LCBj
b25zdCBjaGFyICpuYW1lLCB1aW50MzJfdCAqZG9taWQpOwogY2hhciAqbGlieGxfZG9taWRfdG9f
bmFtZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQpOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
