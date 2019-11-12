Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C00F8F5E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 13:11:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUz2-0003j2-El; Tue, 12 Nov 2019 12:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WcyK=ZE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUUz0-0003ir-VT
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 12:09:18 +0000
X-Inumbo-ID: 4037d9d2-0545-11ea-984a-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4037d9d2-0545-11ea-984a-bc764e2007e4;
 Tue, 12 Nov 2019 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573560558;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=YHvOm2GgZeBtFDyrwjhT5r7GFPpPWD8wfq5jFzbwS0Y=;
 b=EfjmeTerFjeraBl/UiwZIddW7X6hd0cY4CVyO1MwFKtappq/LPGrN70N
 5+CD/miqXuCXZxI1waxJ01U/BvvuviJB6QTemXfZZUjFt17GYr+OyjQaM
 J+A0i3eB/ovHlGkJsXqiiQ00SBQDUVlS3AzZxvWBbaNkjRlRi1gfzqmOU Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JOtX5C9nvjfUmLa4xHS2Hi/ullLaCJrQRkJkGItecFtgxl3+0uO4zSeTG8lb1e5j76IT8HxLRV
 Tcfwz+p4+EalkJOUjKftspOMd2IdEKp8LG/fHKDnRwWjcUqTUd/qx5I921rQ9yJR5w+eJyCYFt
 6s301ru99vRaV8C3hzPozaS/yelV733gP2VKp2CF+wuAFKMf3NN+WZvcLvweVQqv875k1GfN9b
 4bEez0YBrE7TAwJumrZKpWXil4HDS/dCGDHQLWQCkMpw+FUnIVEwnqSZr5yJyBLdyc500cmJlB
 9lg=
X-SBRS: 2.7
X-MesageID: 8185778
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8185778"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 12 Nov 2019 12:09:12 +0000
Message-ID: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/2] ts-libvirt-build: Provide
 PKG_CONFIG_PATH
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Jim Fehlig <jfehlig@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3NzdGVzdCB3ZSBkbyBub3QgaW5zdGFsbCB0aGUgeGVuIHRyZWUgaW4gL3Vzci9sb2NhbCBi
ZWNhdXNlIHRoZQpidWlsZCBlbnZpcm9ubWVudCBpcyBzaGFyZWQgd2l0aCBtYW55IGRpZmZlcmVu
dCBidWlsZCBqb2JzIHdoaWNoIG1pZ2h0CmJlIHVzaW5nIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiBY
ZW4uICBXZSBwdXQgaXQgaW4gYSBqb2Itc3BlY2lmaWMKZGlyZWN0b3J5IGluIH5vc3N0ZXN0IG9u
IHRoZSBidWlsZCBob3N0LCBhbmQgc2V0IGVudmlyb25tZW50IHZhcmlhYmxlcwp0byBlbnN1cmUg
dGhhdCBpdCBhbGwgZ2V0cyBwaWNrZWQgdXAuCgpSZWNlbnQgdmVyc2lvbnMgb2YgbGlidmlydCBp
bnNpc3Qgb24gZmluZGluZyB4ZW5saWdodC5wYzsgb3RoZXJ3aXNlCnRoZXkgZGlzYWJsZSBsaWJ4
bCBzdXBwb3J0LiAgU28gd2UgbXVzdCBhZGQgYSBQS0dfQ09ORklHX1BBVEggc2V0dGluZy4KCihJ
biBhbGwgY2FzZXMsIGNvbnRyYXJ5IHRvIHRoZSB1c3VhbCBwcm90b2NvbCBmb3IgcGF0aC1saWtl
IHZhcmlhYmxlcywKd2UgZG8gbm90IGFwcGVuZCBidXQgaW5zdGVhZCBzaW1wbHkgc2V0IHRoZSB2
YXJpYWJsZS4gIFRoaXMgaXMgT0sKYmVjYXVzZSB0aGlzIGlzIGFuIG9zc3Rlc3QgYnVpbGQgc2Ny
aXB0IHJ1biB2aWEgc3NoIHRvIHRoZSBidWlsZCBob3N0LApzbyB0aGUgdmFyaWFibGVzIHdvbid0
IGhhdmUgYmVlbiBzZXQgYWxyZWFkeS4pCgpDQzogSmltIEZlaGxpZyA8amZlaGxpZ0BzdXNlLmNv
bT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Ci0tLQogdHMtbGlidmlydC1idWlsZCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvdHMtbGlidmlydC1idWlsZCBiL3RzLWxpYnZpcnQtYnVpbGQKaW5k
ZXggYmMwODE5MGEuLjJhMzYzZjQzIDEwMDc1NQotLS0gYS90cy1saWJ2aXJ0LWJ1aWxkCisrKyBi
L3RzLWxpYnZpcnQtYnVpbGQKQEAgLTYwLDYgKzYwLDcgQEAgc3ViIGNvbmZpZygpIHsKICAgICAg
ICAgY2QgbGlidmlydAogICAgICAgICBDRkxBR1M9Ii1nIC1JJHhlbnByZWZpeC9pbmNsdWRlLyIg
XFwKICAgICAgICAgTERGTEFHUz0iLWcgLUwkeGVucHJlZml4L2xpYi8gLVdsLC1ycGF0aC1saW5r
PSR4ZW5wcmVmaXgvbGliLyIgXFwKKyAgICAgICAgUEtHX0NPTkZJR19QQVRIPSIkeGVucHJlZml4
L2xpYi9wa2djb25maWcvIiBcXAogICAgICAgICBHTlVMSUJfU1JDRElSPSRidWlsZGRpci9saWJ2
aXJ0LyRnbnVsaWItPntQYXRofSBcXAogICAgICAgICAgICAgLi9hdXRvZ2VuLnNoIC0tbm8tZ2l0
IFxcCiAgICAgICAgICAgICAgICAgICAgICAgICAgLS13aXRoLWxpYnhsIC0td2l0aG91dC14ZW4g
LS13aXRob3V0LXhlbmFwaSAtLXdpdGhvdXQtc2VsaW51eCBcXAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
