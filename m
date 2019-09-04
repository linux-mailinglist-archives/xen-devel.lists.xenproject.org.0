Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939DA77DE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 02:24:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5J2T-0000Zr-1m; Wed, 04 Sep 2019 00:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IHZE=W7=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i5J2R-0000Zc-37
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 00:20:43 +0000
X-Inumbo-ID: d0d9c824-cea9-11e9-aba8-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0d9c824-cea9-11e9-aba8-12813bfff9fa;
 Wed, 04 Sep 2019 00:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567556436;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=REnkVIGmDtY7lvGG2M1j0JFI4QkmkQIKYK2dQ3BcqE0=;
 b=BTJKzTwHl0N5EUxwEqg11ndPM/jEARuMXXjfgWqJ3da3iHRi9ghUhRHt
 BxMLXVvdWEFPtjrzo5HfX7xjTu7KwjrmKds7rFQRcS1ILfacx2omy4OH8
 nQgZbK/+MJJfagQEIqtgGCd7cyQ3nf3vxFHa641LkLJZQq7wpnegEv93Z Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ihSSbqvcBHI79WN++CxzfilhADPpkPgRdVrUvsODTRGNlVu/v8KiA/qtX5WBIuXu1jFbgT2T2/
 QuuqyfAMPLTt6WApOiA+yLeqvnRRV2g6wFdGB7Mee6A1OMk31Cwzm5hPaIdr9Mv3U0mOwdr75Q
 OlEFTUgwkSh6O0ZVXRIhzTa0y7KIxJZcjMp4ozQPlmkYHBfGvjr+ZiShLVBIV5+K1VXyvMYfXP
 zlzwRzURUY3WIyIMoMNx6BaOBXRwRz1OYDLSmlzXBHhZh2XGyTG1U6LyT0zyK+brgZz5NbeqLN
 5z0=
X-SBRS: 2.7
X-MesageID: 5277025
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5277025"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 4 Sep 2019 01:20:31 +0100
Message-ID: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgTUNGRyBhcmVhIGlzIG5vdCByZXNlcnZlZCBpbiBFODIwLCBYZW4gYnkgZGVmYXVsdCB3aWxs
IGRlZmVyIGl0cyB1c2FnZQp1bnRpbCBEb20wIHJlZ2lzdGVycyBpdCBleHBsaWNpdGx5IGFmdGVy
IEFDUEkgcGFyc2VyIHJlY29nbml6ZXMgaXQgYXMKYSByZXNlcnZlZCByZXNvdXJjZSBpbiBEU0RU
LiBIYXZpbmcgaXQgcmVzZXJ2ZWQgaW4gRTgyMCBpcyBub3QKbWFuZGF0b3J5IGFjY29yZGluZyB0
byAiUENJIEZpcm13YXJlIFNwZWNpZmljYXRpb24sIHJldiAzLjIiIChwYXIuIDQuMS4yKQphbmQg
ZmlybXdhcmUgaXMgZnJlZSB0byBrZWVwIGEgaG9sZSBFODIwIGluIHRoYXQgcGxhY2UuIFhlbiBk
b2Vzbid0IGtub3cKd2hhdCBleGFjdGx5IGlzIGluc2lkZSB0aGlzIGhvbGUgc2luY2UgaXQgbGFj
a3MgZnVsbCBBQ1BJIHZpZXcgb2YgdGhlCnBsYXRmb3JtIHRoZXJlZm9yZSBpdCdzIHBvdGVudGlh
bGx5IGhhcm1mdWwgdG8gYWNjZXNzIE1DRkcgcmVnaW9uCndpdGhvdXQgYWRkaXRpb25hbCBjaGVj
a3MgYXMgc29tZSBtYWNoaW5lcyBhcmUga25vd24gdG8gcHJvdmlkZQppbmNvbnNpc3RlbnQgaW5m
b3JtYXRpb24gb24gdGhlIHNpemUgb2YgdGhlIHJlZ2lvbi4KCk5vdyB4ZW5fbWNmZ19sYXRlKCkg
cnVucyBhZnRlciBhY3BpX2luaXQoKSB3aGljaCBpcyB0b28gbGF0ZSBhcyBzb21lIGJhc2ljClBD
SSBlbnVtZXJhdGlvbiBzdGFydHMgZXhhY3RseSB0aGVyZS4gVHJ5aW5nIHRvIHJlZ2lzdGVyIGEg
ZGV2aWNlIHByaW9yCnRvIE1DRkcgcmVzZXJ2YXRpb24gY2F1c2VzIG11bHRpcGxlIHByb2JsZW1z
IHdpdGggUENJZSBleHRlbmRlZApjYXBhYmlsaXR5IGluaXRpYWxpemF0aW9ucyBpbiBYZW4gKGUu
Zy4gU1ItSU9WIFZGIEJBUiBzaXppbmcpLiBUaGVyZSBhcmUKbm8gY29udmVuaWVudCBob29rcyBm
b3IgdXMgdG8gc3Vic2NyaWJlIHRvIHNvIHRyeSB0byByZWdpc3RlciBNQ0ZHCmFyZWFzIGVhcmxp
ZXIgdXBvbiB0aGUgZmlyc3QgaW52b2NhdGlvbiBvZiB4ZW5fYWRkX2RldmljZSgpLiBLZWVwIHRo
ZQpleGlzdGluZyBpbml0Y2FsbCBpbiBjYXNlIGluZm9ybWF0aW9uIG9mIE1DRkcgYXJlYXMgaXMg
dXBkYXRlZCBsYXRlcgppbiBhY3BpX2luaXQoKS4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhp
bmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KIGRyaXZlcnMveGVuL3BjaS5jIHwg
MTUgKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3BjaS5jIGIvZHJpdmVycy94ZW4v
cGNpLmMKaW5kZXggNzQ5NGRiZS4uODAwZjQxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcGNp
LmMKKysrIGIvZHJpdmVycy94ZW4vcGNpLmMKQEAgLTI5LDYgKzI5LDkgQEAKICNpbmNsdWRlICIu
Li9wY2kvcGNpLmgiCiAjaWZkZWYgQ09ORklHX1BDSV9NTUNPTkZJRwogI2luY2x1ZGUgPGFzbS9w
Y2lfeDg2Lmg+CisKK3N0YXRpYyBpbnQgeGVuX21jZmdfbGF0ZSh2b2lkKTsKK3N0YXRpYyBib29s
IF9fcmVhZF9tb3N0bHkgcGNpX21jZmdfcmVzZXJ2ZWQgPSBmYWxzZTsKICNlbmRpZgogCiBzdGF0
aWMgYm9vbCBfX3JlYWRfbW9zdGx5IHBjaV9zZWdfc3VwcG9ydGVkID0gdHJ1ZTsKQEAgLTQxLDYg
KzQ0LDE2IEBAIHN0YXRpYyBpbnQgeGVuX2FkZF9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQog
CXN0cnVjdCBwY2lfZGV2ICpwaHlzZm4gPSBwY2lfZGV2LT5waHlzZm47CiAjZW5kaWYKIAorI2lm
ZGVmIENPTkZJR19QQ0lfTU1DT05GSUcKKwkvKgorCSAqIFRyeSB0byByZXNlcnZlIE1DRkcgYXJl
YXMgZGlzY292ZXJlZCBzbyBmYXIgZWFybHkgb24gZmlyc3QgaW52b2NhdGlvbgorCSAqIGR1ZSB0
byB0aGlzIGJlaW5nIHBvdGVudGlhbGx5IGNhbGxlZCBmcm9tIGluc2lkZSBvZiBhY3BpX2luaXQK
KwkgKi8KKwlpZiAoIXBjaV9tY2ZnX3Jlc2VydmVkKSB7CisJCXhlbl9tY2ZnX2xhdGUoKTsKKwkJ
cGNpX21jZmdfcmVzZXJ2ZWQgPSB0cnVlOworCX0KKyNlbmRpZgogCWlmIChwY2lfc2VnX3N1cHBv
cnRlZCkgewogCQlzdHJ1Y3QgewogCQkJc3RydWN0IHBoeXNkZXZfcGNpX2RldmljZV9hZGQgYWRk
OwpAQCAtMjEzLDcgKzIyNiw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHJlZ2lzdGVyX3hlbl9wY2lf
bm90aWZpZXIodm9pZCkKIGFyY2hfaW5pdGNhbGwocmVnaXN0ZXJfeGVuX3BjaV9ub3RpZmllcik7
CiAKICNpZmRlZiBDT05GSUdfUENJX01NQ09ORklHCi1zdGF0aWMgaW50IF9faW5pdCB4ZW5fbWNm
Z19sYXRlKHZvaWQpCitzdGF0aWMgaW50IHhlbl9tY2ZnX2xhdGUodm9pZCkKIHsKIAlzdHJ1Y3Qg
cGNpX21tY2ZnX3JlZ2lvbiAqY2ZnOwogCWludCByYzsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
