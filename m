Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88DB782E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:07:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuEy-00036T-Tu; Thu, 19 Sep 2019 11:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAuEx-00035y-5Q
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:04:47 +0000
X-Inumbo-ID: 4a13bdce-dacd-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a13bdce-dacd-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vbwunet42pbXqkvz9UUo1VNQAIYRMM88TeXVqO33Kgw=;
 b=OiK4q1lkvpguL/i2G4USAm9EJwHOhhFTZIGdyR6x+wu4q4S1tbN8CuV2
 EJ7+vtZUciq1kPgd4cq43mKXa60+OmfeY6DM5pJaCJYDFds/xLGZBfDrs
 lxBhfBMv4JRUDBUYGNaxsT8t7IHj+FSiQBMmG5G6ejx6WHGJHdDgVHZ3F w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k2Rs/fHiuM2jV14t5WUNT99mF0c6SdTJpA6Y6HZRxRiSTUgnzP3R0CPrZgYVbFE3nXlaj2d0UE
 +kqmjGMVSk/TfmfCFphckYv5QSvtd8mZVqfkGSowWKpnLohfx6FRxufUcPL7n5Q0KzboZd+Zjq
 /HKGpPwzTMhFfJuJ1ZBokFtYmJjR3q3iOc6gHLCWVxDPhRLpe6FLk18PcgzghCQJmJabjEUKEF
 X6Zc/fvJ94L5HhVXPaQU70vpjj57QC0sb+iNG+e3TZTivTq9q13Rz/Yluq+YX6bYyTPBqWerT4
 ZdE=
X-SBRS: 2.7
X-MesageID: 5782652
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5782652"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 12:04:34 +0100
Message-ID: <20190919110443.817594-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/9] libxl: New slow lock + fix
 libxl_cdrom_insert with QEMU depriv
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

SGksCgpDaGFuZ2VzIGluIHYzOgotIHJlbmFtZWQgbGlieGxfX2V2X2xvY2sgdG8gbGlieGxfX2V2
X2RldmxvY2sKLSByZWJhc2VkCi0gMSBwYXRjaCBub3QgYWNrZWQgImxpYnhsX2ludGVybmFsOiBJ
bnRyb2R1Y2UgbGlieGxfX2V2X2RldmxvY2sgZm9yIGRldmljZXMgaG90cGx1ZyB2aWEgUU1QIgot
IG90aGVyIHBhdGNoZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgZm9yIHRoZSBuZXcgZXZfZGV2bG9jayBu
YW1lIGFuZCBmb3IgdGhlIHJlYmFzZWQKCkNoYW5nZXMgaW4gdjI6Ci0gTmV3IGxpYnhsX19ldl9s
b2NrLCB3aGljaCBhY3R1YWxseSByZXNwZWN0IGxvY2sgaGllcmFyY2h5IChpdCdzIG91dHNpZGUg
b2YKICBDVFhfTE9DSykuCi0gc29tZSBzbWFsbGVyIGNoYW5nZXMgZGV0YWlsZWQgaW4gcGF0Y2gg
bm90ZXMuCgpUaGlzIHBhdGNoIHNlcmllcyBmaXggbGlieGxfY2Ryb21faW5zZXJ0IHRvIHdvcmsg
d2l0aCBhIGRlcHJpdmlsZWRnZSBRRU1VLiBGb3IKdGhhdCwgd2UgbmVlZCB0byB1c2UgbGlieGxf
X2V2X3FtcC4gIEZvciB0aGF0LCB3ZSBuZWVkIGEgbmV3IGxvY2sgYmVjYXVzZQp1c2VyZGF0YV9s
b2NrIGNhbid0IGJlIHVzZWQgYW55bW9yZS4KCkZZSTogSSBkb24ndCB0aGluayB0aGF0IGVub3Vn
aCB5ZXQgdG8gbWlncmF0ZSBhIGRlcHJpdmlsZWRnZWQgUUVNVS4gV2UgbWF5IG5lZWQKdG8gb3Bl
biBkaXNrcy9jZHJvbSBpbiBsaWJ4bCBiZWZvcmUgc3RhcnRpbmcgUUVNVSwgc2ltaWxhciB0byB3
aGF0IHRoaXMgcGF0Y2gKc2VyaWVzIGRvIHdoZW4gaW5zZXJ0aW5nIGEgbmV3IGNkcm9tLgoKUGF0
Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIubGlieGwt
c2xvdy1sb2NrLXYzCgpBbnRob255IFBFUkFSRCAoOSk6CiAgbGlieGxfaW50ZXJuYWw6IFJlbW92
ZSBsb3N0IGNvbW1lbnQKICBsaWJ4bDogUG9pbnRlciBvbiB1c2FnZSBvZiBsaWJ4bF9fZG9tYWlu
X3VzZXJkYXRhX2xvY2sKICBsaWJ4bF9pbnRlcm5hbDogSW50cm9kdWNlIGxpYnhsX19ldl9kZXZs
b2NrIGZvciBkZXZpY2VzIGhvdHBsdWcgdmlhCiAgICBRTVAKICBsaWJ4bDogQWRkIG9wdGltaXNh
dGlvbiB0byBldl9sb2NrCiAgbGlieGxfZGlzazogUmVvcmdhbmlzZSBsaWJ4bF9jZHJvbV9pbnNl
cnQKICBsaWJ4bF9kaXNrOiBDdXQgbGlieGxfY2Ryb21faW5zZXJ0IGludG8gc3RlcHMgLi4KICBs
aWJ4bF9kaXNrOiBJbXBsZW1lbnQgbWlzc2luZyB0aW1lb3V0IGZvciBsaWJ4bF9jZHJvbV9pbnNl
cnQKICBsaWJ4bDogTW92ZSBxbXBfcGFyYW1ldGVyc18qIHByb3RvdHlwZXMgdG8gbGlieGxfaW50
ZXJuYWwuaAogIGxpYnhsX2Rpc2s6IFVzZSBldl9xbXAgaW4gbGlieGxfY2Ryb21faW5zZXJ0Cgog
dG9vbHMvbGlieGwvTWFrZWZpbGUgICAgICAgICB8ICAgMyArCiB0b29scy9saWJ4bC9saWJ4bF9k
aXNrLmMgICAgIHwgMzQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB0b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIHwgMTgyICsrKysrKysrKysrKysrKysrKysKIHRvb2xz
L2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAxMDUgKysrKysrKysrLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX3FtcC5jICAgICAgfCAgODkgKysrKy0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDU5MCBpbnNl
cnRpb25zKCspLCAxMzAgZGVsZXRpb25zKC0pCgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
