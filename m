Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A2ADA3A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 15:46:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7JxF-000559-B2; Mon, 09 Sep 2019 13:43:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7JxD-000552-Hl
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 13:43:39 +0000
X-Inumbo-ID: d32f44de-d307-11e9-ac0b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d32f44de-d307-11e9-ac0b-12813bfff9fa;
 Mon, 09 Sep 2019 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568036618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAZ4775fBadIlBfI5JqH7rk7PZPNkVMwoLJpEBsCQ6w=;
 b=PEIamQaSscMXcZUul/LwmgQu1AWEPN9uodJxdirtxmvIF9DtvIvkU/kJ
 hPnLw9anTQemiB88b6D4hJCwc2pzxBQWVrrfOtTYhf6jJ3UCCxmzbfTzL
 3NfJ85EBq155YHaWMpPVYu3ON5g3TrMWQxHsVzssqplpCTqCD2+QmPVVb o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tGFVU+aAkkSXmXYTAdfU0WoI5LMYF4awI2DfQa6F2q839fCHkw3eekZqXg2lXMc4HnAI/4VeEr
 Ae9WTXER4hTi/t1TEChEPElsF3hU6EYakuK2k1RM2kQChY335W0sG2NBkDPuE7U6vqMTucUKfY
 rOPibIwoHf8fRlqRmyn5whPyDUCwdz6Ojrok7RlMj4f+Y0tV9CUhqKGPQdrddmvfWi5nOL+U7F
 2T2cCJdSDJ9LZdD7lQSgagCTynyctFU38bqlr87oL6TvIUGLZybcgXPD0/GuOGMmIswPNCjARW
 xsw=
X-SBRS: 2.7
X-MesageID: 5320671
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5320671"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 14:43:33 +0100
Message-ID: <20190909134333.10927-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] tools/ocaml: Fix xenctrl ABI and introduce
 build-time checks
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIGYwODlmZGRkOTQxIGJyb2tlIHRoZSBPY2FtbCBBQkkgYnkgcmVudW1lcmluZyBYRU5fU1lT
Q1RMX1BIWVNDQVBfZGlyZWN0aW8Kd2l0aG91dCBhZGp1c3RpbmcgdGhlIE9jYW1sIHBoeXNpbmZv
X2NhcF9mbGFnIGVudW1lcmF0aW9uLiAgRml4IHRoaXMgYnkKaW5zZXJ0aW5nIENBUF9QViBiZXR3
ZWVuIENBUF9IVk0gYW5kIENBUF9EaXJlY3RJTy4KCkZhY3RvciBvdXQgdGhlIGJpdG1hcC10by1s
aXN0IGNvbnZlcnNpb24gbG9naWMgaW50byBhIGhlbHBlciwgdG8gYXZvaWQgYW4Kb3BlbmNvZGVk
IHRydW5jYXRpb24gb2YgdGhlIGJpdG1hcC4gIFRvIGNvdmVyIHRoaXMsIGFkZCBCVUlMRF9CVUdf
T04oKSdzIGF0CnRoZSBjYWxsZXIgZm9yIGVhY2ggY29uc3RhbnQgaW4gdGhlIEMtdG8tT2NhbWwg
Y29udmVyc2lvbiwgYW5kIGZvciB0aGUgdGhlCmFwcGxpY2FibGUgbWF4L2FsbCBjb25zdGFudC4K
ClRoaXMgd2lsbCByZXN1bHQgaW4gYSBjb21waWxlIHRpbWUgZmFpbHVyZSB3aGVuZXZlciBjb25z
dGFudHMgZ2V0CnJlbnVtYmVyZWQvYWRkZWQgd2l0aG91dCBhIGNvbXBhdGlibGUgYWRqdXN0bWVu
dCB0byB0aGUgT2NhbWwgQUJJLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0
cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5k
aWdAY2l0cml4LmNvbT4KQ0M6IFJvYiBIb2VzIDxSb2IuSG9lc0BjaXRyaXguY29tPgpDQzogRWR3
aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4KClRoaXMgbmVlZHMgYmFja3BvcnRp
bmcgdG8gWGVuIDQuMTIKCnYyOgogKiBCYXNlIHRoaXMgcGF0Y2ggY29ycmVjdGx5LgotLS0KIHRv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgICAgIHwgIDEgKwogdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1saSAgICAgfCAgNSArKy0KIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogeGVu
L2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgICAgICAgfCAgNCArKwogNCBmaWxlcyBjaGFuZ2Vk
LCA2NiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmwubWwgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwK
aW5kZXggMzU5NThiOTRkNS4uY2Q3ZTk1YTZmYSAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1sCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbApAQCAt
OTksNiArOTksNyBAQCB0eXBlIHNjaGVkX2NvbnRyb2wgPQogCiB0eXBlIHBoeXNpbmZvX2NhcF9m
bGFnID0KIAl8IENBUF9IVk0KKwl8IENBUF9QVgogCXwgQ0FQX0RpcmVjdElPCiAKIHR5cGUgcGh5
c2luZm8gPQpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSBiL3Rv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkKaW5kZXggNmM0MjY4ZDQ1My4uMGJkMDZlZDky
MCAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQorKysgYi90b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCkBAIC04Miw3ICs4MiwxMCBAQCB0eXBlIGRvbWFp
bmluZm8gPSB7CiAgIGFyY2hfY29uZmlnIDogYXJjaF9kb21haW5jb25maWc7CiB9CiB0eXBlIHNj
aGVkX2NvbnRyb2wgPSB7IHdlaWdodCA6IGludDsgY2FwIDogaW50OyB9Ci10eXBlIHBoeXNpbmZv
X2NhcF9mbGFnID0gQ0FQX0hWTSB8IENBUF9EaXJlY3RJTwordHlwZSBwaHlzaW5mb19jYXBfZmxh
ZyA9CisgIHwgQ0FQX0hWTQorICB8IENBUF9QVgorICB8IENBUF9EaXJlY3RJTwogdHlwZSBwaHlz
aW5mbyA9IHsKICAgdGhyZWFkc19wZXJfY29yZSA6IGludDsKICAgY29yZXNfcGVyX3NvY2tldCA6
IGludDsKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIGIv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKaW5kZXggMmUxYjI5Y2UzMy4uY2U4
ZGJiYTQzNyAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMK
KysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKQEAgLTMyLDYgKzMyLDcg
QEAKIAogI2RlZmluZSBYQ19XQU5UX0NPTVBBVF9NQVBfRk9SRUlHTl9BUEkKICNpbmNsdWRlIDx4
ZW5jdHJsLmg+CisjaW5jbHVkZSA8eGVuLXRvb2xzL2xpYnMuaD4KIAogI2luY2x1ZGUgIm1tYXBf
c3R1YnMuaCIKIApAQCAtMTE5LDYgKzEyMCwzMSBAQCBzdGF0aWMgdm9pZCBkb21haW5faGFuZGxl
X29mX3V1aWRfc3RyaW5nKHhlbl9kb21haW5faGFuZGxlX3QgaCwKICN1bmRlZiBYCiB9CiAKKy8q
CisgKiBWYXJpb3VzIGZpZWxkcyB3aGljaCBhcmUgYSBiaXRtYXAgaW4gdGhlIEMgQUJJIGFyZSBj
b252ZXJ0ZWQgdG8gbGlzdHMgb2YKKyAqIGludGVnZXJzIGluIHRoZSBPY2FtbCBBQkkgZm9yIG1v
cmUgaWRpb21hdGljIGhhbmRsaW5nLgorICovCitzdGF0aWMgdmFsdWUgY19iaXRtYXBfdG9fb2Nh
bWxfbGlzdCh1bnNpZ25lZCBpbnQgYml0bWFwKQoreworCUNBTUxwYXJhbTAoKTsKKwlDQU1MbG9j
YWwyKGxpc3QsIHRtcCk7CisKKwlsaXN0ID0gdG1wID0gVmFsX2VtcHR5bGlzdDsKKworCWZvciAo
IHVuc2lnbmVkIGludCBpID0gMDsgYml0bWFwOyBpKyssIGJpdG1hcCA+Pj0gMSApCisJeworCQlp
ZiAoICEoYml0bWFwICYgMSkgKQorCQkJY29udGludWU7CisKKwkJdG1wID0gY2FtbF9hbGxvY19z
bWFsbCgyLCBUYWdfY29ucyk7CisJCUZpZWxkKHRtcCwgMCkgPSBWYWxfaW50KGkpOworCQlGaWVs
ZCh0bXAsIDEpID0gbGlzdDsKKwkJbGlzdCA9IHRtcDsKKwl9CisKKwlDQU1McmV0dXJuKGxpc3Qp
OworfQorCiBDQU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2
YWx1ZSBjb25maWcpCiB7CiAJQ0FNTHBhcmFtMih4Y2gsIGNvbmZpZyk7CkBAIC0zMTUsMTYgKzM0
MSwyNSBAQCBzdGF0aWMgdmFsdWUgYWxsb2NfZG9tYWluaW5mbyh4Y19kb21haW5pbmZvX3QgKiBp
bmZvKQogCVN0b3JlX2ZpZWxkKHJlc3VsdCwgMTUsIHRtcCk7CiAKICNpZiBkZWZpbmVkKF9faTM4
Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCi0JLyogZW11bGF0aW9uX2ZsYWdzOiB4ODZfYXJj
aF9lbXVsYXRpb25fZmxhZ3MgbGlzdDsgKi8KLQl0bXAgPSBlbXVsX2xpc3QgPSBWYWxfZW1wdHls
aXN0OwotCWZvciAoaSA9IDA7IGkgPCAxMDsgaSsrKSB7Ci0JCWlmICgoaW5mby0+YXJjaF9jb25m
aWcuZW11bGF0aW9uX2ZsYWdzID4+IGkpICYgMSkgewotCQkJdG1wID0gY2FtbF9hbGxvY19zbWFs
bCgyLCBUYWdfY29ucyk7Ci0JCQlGaWVsZCh0bXAsIDApID0gVmFsX2ludChpKTsKLQkJCUZpZWxk
KHRtcCwgMSkgPSBlbXVsX2xpc3Q7Ci0JCQllbXVsX2xpc3QgPSB0bXA7Ci0JCX0KLQl9CisJLyoK
KwkgKiBlbXVsYXRpb25fZmxhZ3M6IHg4Nl9hcmNoX2VtdWxhdGlvbl9mbGFncyBsaXN0OworCSAq
CisJICogVGhlc2UgQlVJTERfQlVHX09OKCkncyBtYXAgdGhlIEMgQUJJIHRvIHRoZSBPY2FtbCBB
QkkuICBJZiB0aGV5CisJICogdHJpcCwgeGVuY3RybC5tbHssaX0gbmVlZCB1cGRhdGluZyB0byBt
YXRjaC4KKwkgKi8KKwlCVUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfTEFQSUMgICAgIT0gKDF1IDw8
ICAwKSk7CisJQlVJTERfQlVHX09OKFhFTl9YODZfRU1VX0hQRVQgICAgICE9ICgxdSA8PCAgMSkp
OworCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9QTSAgICAgICAhPSAoMXUgPDwgIDIpKTsKKwlC
VUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfUlRDICAgICAgIT0gKDF1IDw8ICAzKSk7CisJQlVJTERf
QlVHX09OKFhFTl9YODZfRU1VX0lPQVBJQyAgICE9ICgxdSA8PCAgNCkpOworCUJVSUxEX0JVR19P
TihYRU5fWDg2X0VNVV9QSUMgICAgICAhPSAoMXUgPDwgIDUpKTsKKwlCVUlMRF9CVUdfT04oWEVO
X1g4Nl9FTVVfVkdBICAgICAgIT0gKDF1IDw8ICA2KSk7CisJQlVJTERfQlVHX09OKFhFTl9YODZf
RU1VX0lPTU1VICAgICE9ICgxdSA8PCAgNykpOworCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9Q
SVQgICAgICAhPSAoMXUgPDwgIDgpKTsKKwlCVUlMRF9CVUdfT04oWEVOX1g4Nl9FTVVfVVNFX1BJ
UlEgIT0gKDF1IDw8ICA5KSk7CisJQlVJTERfQlVHX09OKFhFTl9YODZfRU1VX1ZQQ0kgICAgICE9
ICgxdSA8PCAxMCkpOworCUJVSUxEX0JVR19PTihYRU5fWDg2X0VNVV9BTEwgICAgICAhPSAweDdm
Zik7CisJZW11bF9saXN0ID0gY19iaXRtYXBfdG9fb2NhbWxfbGlzdChpbmZvLT5hcmNoX2NvbmZp
Zy5lbXVsYXRpb25fZmxhZ3MpOwogCiAJLyogeGVuX3g4Nl9hcmNoX2RvbWFpbmNvbmZpZyAqLwog
CXg4Nl9hcmNoX2NvbmZpZyA9IGNhbWxfYWxsb2NfdHVwbGUoMSk7CkBAIC02MzUsNyArNjcwLDcg
QEAgQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19zZW5kX2RlYnVnX2tleXModmFsdWUgeGNoLCB2YWx1
ZSBrZXlzKQogQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19waHlzaW5mbyh2YWx1ZSB4Y2gpCiB7CiAJ
Q0FNTHBhcmFtMSh4Y2gpOwotCUNBTUxsb2NhbDMocGh5c2luZm8sIGNhcF9saXN0LCB0bXApOwor
CUNBTUxsb2NhbDIocGh5c2luZm8sIGNhcF9saXN0KTsKIAl4Y19waHlzaW5mb190IGNfcGh5c2lu
Zm87CiAJaW50IHI7CiAKQEAgLTY0NiwxNSArNjgxLDE3IEBAIENBTUxwcmltIHZhbHVlIHN0dWJf
eGNfcGh5c2luZm8odmFsdWUgeGNoKQogCWlmIChyKQogCQlmYWlsd2l0aF94YyhfSCh4Y2gpKTsK
IAotCXRtcCA9IGNhcF9saXN0ID0gVmFsX2VtcHR5bGlzdDsKLQlmb3IgKHIgPSAwOyByIDwgMjsg
cisrKSB7Ci0JCWlmICgoY19waHlzaW5mby5jYXBhYmlsaXRpZXMgPj4gcikgJiAxKSB7Ci0JCQl0
bXAgPSBjYW1sX2FsbG9jX3NtYWxsKDIsIFRhZ19jb25zKTsKLQkJCUZpZWxkKHRtcCwgMCkgPSBW
YWxfaW50KHIpOwotCQkJRmllbGQodG1wLCAxKSA9IGNhcF9saXN0OwotCQkJY2FwX2xpc3QgPSB0
bXA7Ci0JCX0KLQl9CisJLyoKKwkgKiBjYXBhYmlsaXRpZXM6IHBoeXNpbmZvX2NhcF9mbGFnIGxp
c3Q7CisJICoKKwkgKiBUaGVzZSBCVUlMRF9CVUdfT04oKSdzIG1hcCB0aGUgQyBBQkkgdG8gdGhl
IE9jYW1sIEFCSS4gIElmIHRoZXkKKwkgKiB0cmlwLCB4ZW5jdHJsLm1seyxpfSBuZWVkIHVwZGF0
aW5nIHRvIG1hdGNoLgorCSAqLworCUJVSUxEX0JVR19PTihYRU5fU1lTQ1RMX1BIWVNDQVBfaHZt
ICAgICAgIT0gKDF1IDw8ICAwKSk7CisJQlVJTERfQlVHX09OKFhFTl9TWVNDVExfUEhZU0NBUF9w
diAgICAgICAhPSAoMXUgPDwgIDEpKTsKKwlCVUlMRF9CVUdfT04oWEVOX1NZU0NUTF9QSFlTQ0FQ
X2RpcmVjdGlvICE9ICgxdSA8PCAgMikpOworCUJVSUxEX0JVR19PTihYRU5fU1lTQ1RMX1BIWVND
QVBfTUFYICAgICAgIT0gWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvKTsKKwljYXBfbGlzdCA9
IGNfYml0bWFwX3RvX29jYW1sX2xpc3QoY19waHlzaW5mby5jYXBhYmlsaXRpZXMpOwogCiAJcGh5
c2luZm8gPSBjYW1sX2FsbG9jX3R1cGxlKDEwKTsKIAlTdG9yZV9maWVsZChwaHlzaW5mbywgMCwg
VmFsX2ludChjX3BoeXNpbmZvLnRocmVhZHNfcGVyX2NvcmUpKTsKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAppbmRl
eCAzNmIzZjhjNDI5Li41NDAxZjljMmZlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
c3lzY3RsLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCkBAIC05MCw2ICs5MCwx
MCBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF90YnVmX29wIHsKICAvKiBUaGUgcGxhdGZvcm0gc3VwcG9y
dHMgZGlyZWN0IGFjY2VzcyB0byBJL08gZGV2aWNlcyB3aXRoIElPTU1VLiAqLwogI2RlZmluZSBf
WEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvICAgICAyCiAjZGVmaW5lIFhFTl9TWVNDVExfUEhZ
U0NBUF9kaXJlY3RpbyAgKDF1PDxfWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvKQorCisvKiBN
YXggWEVOX1NZU0NUTF9QSFlTQ0FQXyogY29uc3RhbnQuICBVc2VkIGZvciBBQkkgY2hlY2tpbmcu
ICovCisjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9NQVggWEVOX1NZU0NUTF9QSFlTQ0FQX2Rp
cmVjdGlvCisKIHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvIHsKICAgICB1aW50MzJfdCB0aHJl
YWRzX3Blcl9jb3JlOwogICAgIHVpbnQzMl90IGNvcmVzX3Blcl9zb2NrZXQ7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
