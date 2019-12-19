Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8FD12644C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 15:10:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihwSE-000496-4z; Thu, 19 Dec 2019 14:07:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihwSD-000491-7C
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 14:07:01 +0000
X-Inumbo-ID: d2ccd5fb-2268-11ea-91b5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2ccd5fb-2268-11ea-91b5-12813bfff9fa;
 Thu, 19 Dec 2019 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576764420;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xjZWzoV7Mg4qg10dKcirQrIJj31tRiDX4/Of+4FOO4M=;
 b=BZMk28IvPfrw1LkZjhzF06jaIRa4zXlGtW8XiHpsvt6b3GJ42OScIFCh
 x+ma9nB2bdQCExlf1LmsdPfge6jSmu2rFuiE3ZfY5MkhDFwxyYJz3LkN7
 iXOR+zImEkna/4dYiRRSh9dsUksZhu9U7woUTcOiVWZ1cuN2kL7tqFKYK Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +m60mjyhU25ukkOOkJ9AF0JHATCW/cxRF1NZlnYfy0iAdar2k21J46H/9nUnXsWAuaMJrsmu0H
 YuYus5lscl2jxJJgfgcC+ntNSKWFy4C3s4nfJAdfh4kIS8s501YnDqEkdYDJErVMuZbT9ChYUj
 29aYJGCfVwv+BSM5NLemSs2XHfbxr/xjb2Ge6ILZhHhd3ZxKtcQpVyoAJAynyceSI5Bi7/JgEo
 3HiQaU351SyHC1suiTW4/zdyhKxkNs/SivZlk3uTpdYl2aLSVD1ZPkEZHsjyihQLYQ2UezVj1M
 0lc=
X-SBRS: 2.7
X-MesageID: 10351524
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; d="scan'208";a="10351524"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 14:06:56 +0000
Message-ID: <20191219140656.9906-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc/restore: Fix data auditing in
 handle_x86_pv_info()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

aGFuZGxlX3g4Nl9wdl9pbmZvKCkgaGFzIGEgc3VidGxlIGJ1Zy4gIEl0IHVzZXMgYW4gJ2Vsc2Ug
aWYnIGNoYWluIHdpdGggYQpjbGF1c2UgaW4gdGhlIG1pZGRsZSB3aGljaCBkb2Vzbid0IGV4aXQg
dW5jb25kaXRpb25hbGx5LiAgSW4gcHJhY3RpY2UsIHRoaXMKbWVhbnMgdGhhdCB3aGVuIHJlc3Rv
cmluZyBhIDMyYml0IFBWIGd1ZXN0LCBsYXRlciBzYW5pdHkgY2hlY2tzIGFyZSBza2lwcGVkLgoK
UmV3b3JrIHRoZSBsb2dpYyBhIGxpdHRsZSB0byBiZSBzaW1wbGVyLiAgVGhlcmUgYXJlIGV4YWN0
bHkgdHdvIHZhbGlkCmNvbWJpbmF0aW9ucyBvZiBmaWVsZHMgaW4gWDg2X1BWX0lORk8sIHNvIGZh
Y3RvciB0aGlzIG91dCBhbmQgY2hlY2sgdGhlbSBhbGwKaW4gb25lIGdvLCBiZWZvcmUgbWFraW5n
IGFkanVzdG1lbnRzIHRvIHRoZSBjdXJyZW50IGRvbWFpbi4KCk9uY2UgYWRqdXN0bWVudHMgaGF2
ZSBiZWVuIGNvbXBsZXRlZCBzdWNjZXNzZnVsbHksIHNhbml0eSBjaGVjayB0aGUgcmVzdWx0CmFn
YWluc3QgdGhlIFg4Nl9QVl9JTkZPIHNldHRpbmdzIGluIG9uZSBnbywgcmF0aGVyIHRoYW4gcGll
Y2V3aXNlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZf
cHYuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3Jl
c3RvcmVfeDg2X3B2LmMKaW5kZXggYTJkYmY4NTE1Ny4uOWU5ZmYzMmQ0NyAxMDA2NDQKLS0tIGEv
dG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYworKysgYi90b29scy9saWJ4Yy94Y19z
cl9yZXN0b3JlX3g4Nl9wdi5jCkBAIC01ODIsNiArNTgyLDIxIEBAIHN0YXRpYyBpbnQgdXBkYXRl
X2d1ZXN0X3AybShzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQogfQogCiAvKgorICogVGhlIHZh
bGlkIHdpZHRoL3B0X2xldmVscyB2YWx1ZXMgaW4gWDg2X1BWX0lORk8gYXJlIGluZXh0cmljYWJs
eSBsaW5rZWQuCisgKiBDcm9zcy1jaGVjayB0aGUgbGVnaXRpbWF0ZSBjb21iaW5hdGlvbnMuCisg
Ki8KK3N0YXRpYyBib29sIHZhbGlkX3g4Nl9wdl9pbmZvX2NvbWJpbmF0aW9uKAorICAgIGNvbnN0
IHN0cnVjdCB4Y19zcl9yZWNfeDg2X3B2X2luZm8gKmluZm8pCit7CisgICAgc3dpdGNoICggaW5m
by0+Z3Vlc3Rfd2lkdGggKQorICAgIHsKKyAgICBjYXNlIDQ6ICByZXR1cm4gaW5mby0+cHRfbGV2
ZWxzID09IDM7CisgICAgY2FzZSA4OiAgcmV0dXJuIGluZm8tPnB0X2xldmVscyA9PSA0OworICAg
IGRlZmF1bHQ6IHJldHVybiBmYWxzZTsKKyAgICB9Cit9CisKKy8qCiAgKiBQcm9jZXNzIGFuIFg4
Nl9QVl9JTkZPIHJlY29yZC4KICAqLwogc3RhdGljIGludCBoYW5kbGVfeDg2X3B2X2luZm8oc3Ry
dWN0IHhjX3NyX2NvbnRleHQgKmN0eCwKQEAgLTYwMiwyOSArNjE3LDMxIEBAIHN0YXRpYyBpbnQg
aGFuZGxlX3g4Nl9wdl9pbmZvKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsCiAgICAgICAgICAg
ICAgIHJlYy0+bGVuZ3RoLCBzaXplb2YoKmluZm8pKTsKICAgICAgICAgcmV0dXJuIC0xOwogICAg
IH0KLSAgICBlbHNlIGlmICggaW5mby0+Z3Vlc3Rfd2lkdGggIT0gNCAmJgotICAgICAgICAgICAg
ICBpbmZvLT5ndWVzdF93aWR0aCAhPSA4ICkKKworICAgIGlmICggIXZhbGlkX3g4Nl9wdl9pbmZv
X2NvbWJpbmF0aW9uKGluZm8pICkKICAgICB7Ci0gICAgICAgIEVSUk9SKCJVbmV4cGVjdGVkIGd1
ZXN0IHdpZHRoICV1LCBFeHBlY3RlZCA0IG9yIDgiLAotICAgICAgICAgICAgICBpbmZvLT5ndWVz
dF93aWR0aCk7CisgICAgICAgIEVSUk9SKCJJbnZhbGlkIFg4Nl9QVl9JTkZPIGNvbWJpbmF0aW9u
OiB3aWR0aCAldSwgcHRfbGV2ZWxzICV1IiwKKyAgICAgICAgICAgICAgaW5mby0+Z3Vlc3Rfd2lk
dGgsIGluZm8tPnB0X2xldmVscyk7CiAgICAgICAgIHJldHVybiAtMTsKICAgICB9Ci0gICAgZWxz
ZSBpZiAoIGluZm8tPmd1ZXN0X3dpZHRoICE9IGN0eC0+eDg2X3B2LndpZHRoICkKKworICAgIC8q
CisgICAgICogUFYgZG9tYWlucyBkZWZhdWx0IHRvIG5hdGl2ZSB3aWR0aC4gIEZvciBhbiBpbmNv
bW1pbmcgY29tcGF0IGRvbWFpbiwgd2UKKyAgICAgKiB3aWxsIHR5cGljYWxseSBiZSB0aGUgZmly
c3QgZW50aXR5IHRvIGluZm9ybSBYZW4uCisgICAgICovCisgICAgaWYgKCBpbmZvLT5ndWVzdF93
aWR0aCAhPSBjdHgtPng4Nl9wdi53aWR0aCApCiAgICAgewotICAgICAgICBpbnQgcmM7Ci0gICAg
ICAgIHN0cnVjdCB4ZW5fZG9tY3RsIGRvbWN0bDsKLQotICAgICAgICAvKiBUcnkgdG8gc2V0IGFk
ZHJlc3Mgc2l6ZSwgZG9tYWluIGlzIGFsd2F5cyBjcmVhdGVkIDY0IGJpdC4gKi8KLSAgICAgICAg
bWVtc2V0KCZkb21jdGwsIDAsIHNpemVvZihkb21jdGwpKTsKLSAgICAgICAgZG9tY3RsLmRvbWFp
biA9IGN0eC0+ZG9taWQ7Ci0gICAgICAgIGRvbWN0bC5jbWQgICAgPSBYRU5fRE9NQ1RMX3NldF9h
ZGRyZXNzX3NpemU7Ci0gICAgICAgIGRvbWN0bC51LmFkZHJlc3Nfc2l6ZS5zaXplID0gaW5mby0+
Z3Vlc3Rfd2lkdGggKiA4OwotICAgICAgICByYyA9IGRvX2RvbWN0bCh4Y2gsICZkb21jdGwpOwor
ICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bCBkb21jdGwgPSB7CisgICAgICAgICAgICAuZG9tYWlu
ID0gY3R4LT5kb21pZCwKKyAgICAgICAgICAgIC5jbWQgICAgPSBYRU5fRE9NQ1RMX3NldF9hZGRy
ZXNzX3NpemUsCisgICAgICAgICAgICAudS5hZGRyZXNzX3NpemUuc2l6ZSA9IGluZm8tPmd1ZXN0
X3dpZHRoICogOCwKKyAgICAgICAgfTsKKyAgICAgICAgaW50IHJjID0gZG9fZG9tY3RsKHhjaCwg
JmRvbWN0bCk7CisKICAgICAgICAgaWYgKCByYyAhPSAwICkKICAgICAgICAgewotICAgICAgICAg
ICAgRVJST1IoIldpZHRoIG9mIGd1ZXN0IGluIHN0cmVhbSAoJXUiCi0gICAgICAgICAgICAgICAg
ICAiIGJpdHMpIGRpZmZlcnMgd2l0aCBleGlzdGluZyBkb21haW4gKCV1IGJpdHMpIiwKLSAgICAg
ICAgICAgICAgICAgIGluZm8tPmd1ZXN0X3dpZHRoICogOCwgY3R4LT54ODZfcHYud2lkdGggKiA4
KTsKKyAgICAgICAgICAgIEVSUk9SKCJGYWlsZWQgdG8gdXBkYXRlIGQlZCBhZGRyZXNzIHNpemUg
dG8gJXUiLAorICAgICAgICAgICAgICAgICAgY3R4LT5kb21pZCwgaW5mby0+Z3Vlc3Rfd2lkdGgg
KiA4KTsKICAgICAgICAgICAgIHJldHVybiAtMTsKICAgICAgICAgfQogCkBAIC02MzYsMTggKzY1
MywxNCBAQCBzdGF0aWMgaW50IGhhbmRsZV94ODZfcHZfaW5mbyhzdHJ1Y3QgeGNfc3JfY29udGV4
dCAqY3R4LAogICAgICAgICAgICAgcmV0dXJuIC0xOwogICAgICAgICB9CiAgICAgfQotICAgIGVs
c2UgaWYgKCBpbmZvLT5wdF9sZXZlbHMgIT0gMyAmJgotICAgICAgICAgICAgICBpbmZvLT5wdF9s
ZXZlbHMgIT0gNCApCi0gICAgewotICAgICAgICBFUlJPUigiVW5leHBlY3RlZCBndWVzdCBsZXZl
bHMgJXUsIEV4cGVjdGVkIDMgb3IgNCIsCi0gICAgICAgICAgICAgIGluZm8tPnB0X2xldmVscyk7
Ci0gICAgICAgIHJldHVybiAtMTsKLSAgICB9Ci0gICAgZWxzZSBpZiAoIGluZm8tPnB0X2xldmVs
cyAhPSBjdHgtPng4Nl9wdi5sZXZlbHMgKQorCisgICAgLyogU2FuaXR5IGNoZWNrIChwb3NzaWJs
eSBuZXcpIGRvbWFpbiBzZXR0aW5ncy4gKi8KKyAgICBpZiAoIChpbmZvLT5ndWVzdF93aWR0aCAh
PSBjdHgtPng4Nl9wdi53aWR0aCkgfHwKKyAgICAgICAgIChpbmZvLT5wdF9sZXZlbHMgICAhPSBj
dHgtPng4Nl9wdi5sZXZlbHMpICkKICAgICB7Ci0gICAgICAgIEVSUk9SKCJMZXZlbHMgb2YgZ3Vl
c3QgaW4gc3RyZWFtICgldSIKLSAgICAgICAgICAgICAgIikgZGlmZmVycyB3aXRoIGV4aXN0aW5n
IGRvbWFpbiAoJXUpIiwKLSAgICAgICAgICAgICAgaW5mby0+cHRfbGV2ZWxzLCBjdHgtPng4Nl9w
di5sZXZlbHMpOworICAgICAgICBFUlJPUigiWDg2X1BWX0lORk8gd2lkdGgvcHRfbGV2ZWxzIHNl
dHRpbmdzICV1LyV1IG1pc21hdGNoIHdpdGggZCVkICV1LyV1IiwKKyAgICAgICAgICAgICAgaW5m
by0+Z3Vlc3Rfd2lkdGgsIGluZm8tPnB0X2xldmVscywgY3R4LT5kb21pZCwKKyAgICAgICAgICAg
ICAgY3R4LT54ODZfcHYud2lkdGgsIGN0eC0+eDg2X3B2LmxldmVscyk7CiAgICAgICAgIHJldHVy
biAtMTsKICAgICB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
