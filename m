Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6C1793A0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:36:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9W1h-0003I8-T7; Wed, 04 Mar 2020 15:33:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mabm=4V=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j9W1g-0003I2-Gk
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:33:36 +0000
X-Inumbo-ID: 82573c2c-5e2d-11ea-a423-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82573c2c-5e2d-11ea-a423-12813bfff9fa;
 Wed, 04 Mar 2020 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583336014;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AYruxDtouHBwKDRtS8+BItDeGd3PxEvBoTqW2UGlZE0=;
 b=gVBDzDjFYz68Jz97XKDQ5ThDqbCS7tMrNB2rLEFhInY2nf32tlqmsAV4
 5PVDSIVsbzJe+XGNdLxSWwWbZnHGNSoQRTKpmoxyhT6PRAOrT8EwlD5yI
 F3uDj7G8P2K9vQmk+tZ6AHC82SIw0qm/hayludsMdQPvX2gj0s61J7jKv k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /Iy4bzHfsFdF3XrbhXCuyn5hyG3uRX9mIe+rypzuY8Esf18zO4/6Rf5WyWrpLtzfNZ2S1JeQdN
 re8ApK2DX3rSkAsM+/zi1s06PNKpnbRYpnxTDvjkenbMXW/yP8ODaInJRRVPGx2IqLbEZTqo2D
 NrGad9d+kt52z5vawHe30R7e4ReVttfihoIGqt9ZTzDn2hR907bHifY+sNZf37F/r50rg7tanI
 F+F6dxEWI1WzpvHJ5U448KKy4IgxUcGO1vMGFz24+szTlCLExhdThiCz0c/B64RlDNntE4Rjgz
 aC8=
X-SBRS: 2.7
X-MesageID: 13830885
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,514,1574139600"; d="scan'208";a="13830885"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Mar 2020 15:33:28 +0000
Message-ID: <1583336008-10123-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] x86/cpu: Sync any remaining RCU callbacks
 before CPU up/down
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, sstabellini@kernel.org,
 julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIENQVSBkb3duIG9wZXJhdGlvbiBSQ1UgY2FsbGJhY2tzIGFyZSBzY2hlZHVsZWQgdG8g
ZmluaXNoCm9mZiBzb21lIGFjdGlvbnMgbGF0ZXIgYXMgc29vbiBhcyBDUFUgaXMgZnVsbHkgZGVh
ZCAodGhlIHNhbWUgYXBwbGllcwp0byBDUFUgdXAgb3BlcmF0aW9uIGluIGNhc2UgZXJyb3IgcGF0
aCBpcyB0YWtlbikuIElmIGluIHRoZSBzYW1lIGdyYWNlCnBlcmlvZCBhbm90aGVyIENQVSB1cCBv
cGVyYXRpb24gaXMgcGVyZm9ybWVkIG9uIHRoZSBzYW1lIENQVSwgUkNVIGNhbGxiYWNrCndpbGwg
YmUgY2FsbGVkIGxhdGVyIG9uIGEgQ1BVIGluIGEgcG90ZW50aWFsbHkgd3JvbmcgKGFscmVhZHkg
dXAgYWdhaW4KaW5zdGVhZCBvZiBzdGlsbCBiZWluZyBkb3duKSBzdGF0ZSBsZWFkaW5nIHRvIGV2
ZW50dWFsIHN0YXRlIGluY29uc2lzdGVuY3kKYW5kL29yIGNyYXNoLgoKSW4gb3JkZXIgdG8gYXZv
aWQgaXQgLSBmbHVzaCBSQ1UgY2FsbGJhY2tzIGV4cGxpY2l0bHkgYmVmb3JlIHN0YXJ0aW5nIHRo
ZQpuZXh0IENQVSB1cC9kb3duIG9wZXJhdGlvbi4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRy
dXpoaW5pbkBjaXRyaXguY29tPgotLS0KVGhpcyBnb3QgZGlzY292ZXJlZCB0cnlpbmcgdG8gcmVz
dW1lIFBWIHNoaW0gd2l0aCBtdWx0aXBsZSB2Q1BVcyBvbiBBTUQKbWFjaGluZSAod2hlcmUgcGFy
a19vZmZsaW5lX2NwdXMgPT0gMCkuIFJDVSBjYWxsYmFjayByZXNwb25zaWJsZSBmb3IKZnJlZWlu
ZyBwZXJjcHUgYXJlYSBvbiBDUFUgb2ZmbGluZSBnb3QgZmluYWxseSBjYWxsZWQgYWZ0ZXIgQ1BV
IHdlbnQKb25saW5lIGFnYWluIGFzIHRoZSBndWVzdCBwZXJmb3JtZWQgcmVndWxhciB2Q1BVIG9m
ZmxpbmUvb25saW5lIG9wZXJhdGlvbnMKb24gcmVzdW1lLgoKTm90ZTogdGhpcyBwYXRjaCByZXF1
aXJlcyBSQ1Ugc2VyaWVzIHYzIGZyb20gSnVlcmdlbiB0byBiZSBhcHBsaWVkIC0KaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAzL21zZzAw
MjAwLmh0bWwKCnYyOiBjaGFuZ2VkIHJjdV9iYXJyaWVyKCkgcG9zaXRpb24sIHVwZGF0ZWQgZGVz
Y3JpcHRpb24KdjM6IG1vdmVkIHJjdV9iYXJyaWVyKCkgdG8gY29tbW9uIGNwdV91cC9jcHVfZG93
biBjb2RlIHRvIGNvdmVyIG1vcmUgY2FzZXMKLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5j
IHwgMSAtCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgIHwgOCAtLS0tLS0tLQogeGVuL2NvbW1v
bi9jcHUuYyAgICAgICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMg
Yi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCmluZGV4IGI1ZGYwMGIuLjg0N2MyNzMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkv
cG93ZXIuYwpAQCAtMzA1LDcgKzMwNSw2IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0
YXRlKQogICAgIGNwdWZyZXFfYWRkX2NwdSgwKTsKIAogIGVuYWJsZV9jcHU6Ci0gICAgcmN1X2Jh
cnJpZXIoKTsKICAgICBtdHJyX2Fwc19zeW5jX2JlZ2luKCk7CiAgICAgZW5hYmxlX25vbmJvb3Rf
Y3B1cygpOwogICAgIG10cnJfYXBzX3N5bmNfZW5kKCk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvc3lzY3RsLmMgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKaW5kZXggNTlhMzg0MC4uYjRlODZh
OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9z
eXNjdGwuYwpAQCAtODUsMTEgKzg1LDcgQEAgbG9uZyBjcHVfdXBfaGVscGVyKHZvaWQgKmRhdGEp
CiAgICAgaW50IHJldCA9IGNwdV91cChjcHUpOwogCiAgICAgaWYgKCByZXQgPT0gLUVCVVNZICkK
LSAgICB7Ci0gICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQgaGF2ZSBvbmUg
bW9yZSBnby4gKi8KLSAgICAgICAgcmN1X2JhcnJpZXIoKTsKICAgICAgICAgcmV0ID0gY3B1X3Vw
KGNwdSk7Ci0gICAgfQogCiAgICAgaWYgKCAhcmV0ICYmICFvcHRfc210ICYmCiAgICAgICAgICBj
cHVfZGF0YVtjcHVdLmNvbXB1dGVfdW5pdF9pZCA9PSBJTlZBTElEX0NVSUQgJiYKQEAgLTExMCwx
MSArMTA2LDcgQEAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAqZGF0YSkKICAgICBpbnQgY3B1
ID0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKICAgICBpbnQgcmV0ID0gY3B1X2Rvd24oY3B1KTsKICAg
ICBpZiAoIHJldCA9PSAtRUJVU1kgKQotICAgIHsKLSAgICAgICAgLyogT24gRUJVU1ksIGZsdXNo
IFJDVSB3b3JrIGFuZCBoYXZlIG9uZSBtb3JlIGdvLiAqLwotICAgICAgICByY3VfYmFycmllcigp
OwogICAgICAgICByZXQgPSBjcHVfZG93bihjcHUpOwotICAgIH0KICAgICByZXR1cm4gcmV0Owog
fQogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIveGVuL2NvbW1vbi9jcHUuYwppbmRl
eCAzMTk1M2YzLi4xZjk3NmRiIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdS5jCisrKyBiL3hl
bi9jb21tb24vY3B1LmMKQEAgLTQsNiArNCw3IEBACiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KICNp
bmNsdWRlIDx4ZW4vc2NoZWQuaD4KICNpbmNsdWRlIDx4ZW4vc3RvcF9tYWNoaW5lLmg+CisjaW5j
bHVkZSA8eGVuL3JjdXBkYXRlLmg+CiAKIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX2Nw
dV9pZHMgPSBOUl9DUFVTOwogI2lmbmRlZiBucl9jcHVtYXNrX2JpdHMKQEAgLTUzLDYgKzU0LDcg
QEAgdm9pZCBwdXRfY3B1X21hcHModm9pZCkKIAogdm9pZCBjcHVfaG90cGx1Z19iZWdpbih2b2lk
KQogeworICAgIHJjdV9iYXJyaWVyKCk7CiAgICAgd3JpdGVfbG9jaygmY3B1X2FkZF9yZW1vdmVf
bG9jayk7CiB9CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
