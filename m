Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317BB1573A5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 12:46:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j17SK-000601-5G; Mon, 10 Feb 2020 11:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j17SH-0005zq-Uc
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 11:42:21 +0000
X-Inumbo-ID: 65956644-4bfa-11ea-852a-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65956644-4bfa-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581334942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QEILRaYX5mYlkb6OwVe6kk2u8v4uLe6Y6Nce7nvnsIU=;
 b=IooPNaGnb4h5tvDB2f7/4/+JqmaV436jFTdlinSIRiem9ZA1QCJsDCzA
 a88mLqtUR/zWBi5CNYnVLMwcaDAF+JGCGRNGjWi/9+fZqBnNfvHR0MmQ5
 6qPT6wCLmUrNTHaqYbv7sUKeEP74T3F2gGaUyCtqTIfCz6W8o4I9dHSOv A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WwnHjby62vsfFz7dYYXmyop07pMHMh14XS7b+BDSqh8l1HBip6w9GlysAS6sDDgLzCquez5gP3
 UeRwCKwFU/1aeUwLS/WHh5x7nYyOKhR/mMOIG/4yvvJmKJELsTU3JGvLFkTSK/CEgFjyvhrwD0
 ljXOSUB7Gg4Lf9X0aIuPm/3nkqktRK85c10Mgd94EnGfawXyPHMqU5RCywfx5FbtGYA177Dq3o
 2FfY3AN0ziJUFL6htfCey6womzpmEXeGADHAYL7t0TemC65HmELncFz5uR9/wCD69+ausOh3OU
 zpg=
X-SBRS: 2.7
X-MesageID: 12202802
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,424,1574139600"; d="scan'208";a="12202802"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 11:42:06 +0000
Message-ID: <20200210114206.17115-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/svm: Reduce vmentry latency
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V3JpdGluZyB0byB0aGUgc3RhY2sgcG9pbnRlciBpbiB0aGUgbWlkZGxlIG9mIGEgbGluZSBvZiBw
b3Agb3BlcmF0aW9ucyBpcwpzcGVjaWZpY2FsbHkgcmVjb21tZW5kZWQgYWdhaW5zdCBieSB0aGUg
b3B0aW1pc2F0aW9uIGd1aWRlLCBhbmQgaXMgYSB0ZWNobmlxdWUKdXNlZCBieSBTcGVjdWxhdGl2
ZSBMb2FkIEhhcmRlbmluZyB0byBjb21iYXQgU3BlY3RyZVJTQi4KCkluIHByYWN0aWNlLCBpdCBj
YXVzZXMgYWxsIGZ1cnRoZXIgc3RhY2stcmVsYXRpdmUgYWNjZXNzZXMgdG8gYmxvY2sgdW50aWwg
dGhlCndyaXRlIHRvIHRoZSBzdGFjayBwb2ludGVyIHJldGlyZXMsIHNvIHRoZSBzdGFjayBlbmdp
bmUgY2FuIGdldCBiYWNrIGluIHN5bmMuCgpQb3AgaW50byBhbnkgZGVhZCByZWdpc3RlciB0byBk
aXNjYXJkICVyYXgncyB2YWx1ZSB3aXRob3V0IGNsb2JiZXJpbmcgdGhlCnN0YWNrIGVuZ2luZS4g
IFNtYWxsZXIgY29tcGlsZWQgY29kZSwgYW5kIHJ1bnMgZmFzdGVyLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJbiBhIHNtYWxsIHRlc3Qgd2hl
cmUgSSB3aXJlZCBJQ0VCUCB0byB0aWdobHkgcmUtZW50ZXIgdGhlIGd1ZXN0LCB0aGlzIGRyb3Bw
ZWQKdGhlIGd1ZXN0cyBwZXJ2aWNlZCB0aW1lIGZvciBJQ0VCUCAoYXMgY2xvc2UgdG8gb25lIHZt
ZXhpdCBhbmQgZW50cnkgYXMgSQpjb3VsZCByZWFsaXN0aWNhbGx5IG1hbmFnZSkgYnkgMjAgdGlj
a3MuICBTYWRseSwgdGhhdCBhbHNvIHNlZW1zIHRvIGJlIHRoZQpncmFudWFybGl0eSBvZiBtZWFz
dXJlbWVudC4gIFRoZSBtb2RhbCBtZWFzdXJlbWVudCAoYWNjb3VudGluZyBmb3IgODAlIG9mCnNh
bXBsZXMpIHdhcyAxMjAwIHRpY2tzLCBhbmQgcmVkdWNlZCB0byAxMTgwIHdpdGgganVzdCB0aGlz
IGNoYW5nZSBpbiBwbGFjZS4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRyeS5TIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L2VudHJ5LlMKaW5kZXggZTk1NGQ4ZTAyMS4uMWQyZGYwOGU4OSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9zdm0vZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRyeS5T
CkBAIC03Niw3ICs3Niw3IEBAIF9fVU5MSUtFTFlfRU5EKG5zdm1faGFwKQogICAgICAgICBwb3Ag
ICVyMTAKICAgICAgICAgcG9wICAlcjkKICAgICAgICAgcG9wICAlcjgKLSAgICAgICAgYWRkICAk
OCwlcnNwIC8qIFNraXAgJXJheDogcmVzdG9yZWQgYnkgVk1SVU4uICovCisgICAgICAgIHBvcCAg
JXJjeCAvKiBTa2lwICVyYXg6IHJlc3RvcmVkIGJ5IFZNUlVOLiAqLwogICAgICAgICBwb3AgICVy
Y3gKICAgICAgICAgcG9wICAlcmR4CiAgICAgICAgIHBvcCAgJXJzaQotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
