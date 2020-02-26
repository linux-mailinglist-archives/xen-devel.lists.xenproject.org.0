Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460ED16FDDE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:36:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ux3-00013q-L7; Wed, 26 Feb 2020 11:34:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6ux2-00013T-Ay
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:04 +0000
X-Inumbo-ID: e12890ae-588b-11ea-aba8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e12890ae-588b-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hEyVUEJZoqNpzOyyuY+v5WWTIO3kbmM7ep4YALQEAYo=;
 b=CD81CQgDCBWUsG/XbhtsnZtfU5oonzJ/nTRlKWu/UGhEcUkg9rEy5zzW
 SOpDQwMJ3Je+GNcCgMEwjLQLqzx/bryQshPRh3fnxymtWTmkV3is81s/L
 mngMDGRHtFMNhQW6jNZ+wQc9BPx6ev55lhn1xa0l58wukndv2dd6VgCwU 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZLavmTemiXCy1n0UjybYOm+Y7GU7lwUEWLORiRAlyUz3Dr+holLpIDC+17IxqpD7NzrJ6JSucm
 4F0UmgVN1iPxZ0TYUCyNc+fYMrJwB06aa8EgIJkssV5Dxvnebb8WijTX5D687i0Vt+Vmy9rwMF
 A/e/JgSZ0jMbQhtxWdq2ZMNsMiSeyy9QCPjBvZG9RCv5FLICQZ9248rvc64biN2Nkw6jJ21b1m
 jEFlepC6D7ob+4bbZB2zC/o6OBQSHn7u6ceDqfR8/dih3LFcHcsqjN9aZWDvVZ0W6Iwh6TIeAi
 YMU=
X-SBRS: 2.7
X-MesageID: 13012715
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13012715"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:37 +0000
Message-ID: <20200226113355.2532224-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 05/23] xen/build: Allow to test clang
 .include without asm symlink
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNsYW5nIHRlc3QgZm9yICJhc20oKS1zIHN1cHBvcnQgLmluY2x1ZGUuIiBuZWVkcyB0byBi
ZSBtb2RpZmllZApiZWNhdXNlIHRoZSBzeW1ib2xpYyBsaW5rIGFzbSAtPiBhc20teDg2IG1heSBu
b3QgZXhpc3Qgd2hlbiB0aGUgdGVzdAppcyBydW5uZWQuIFNpbmNlIGl0J3MgYW4geDg2IHRlc3Qs
IHdlIGRvbid0IG5lZWQgdGhlIGxpbmsuCgpUaGlzIHdpbGwgYmUgYW4gaXNzdWUgd2l0aCB0aGUg
Zm9sbG93aW5nIHBhdGNoICJ4ZW4vYnVpbGQ6IGhhdmUgdGhlCnJvb3QgTWFrZWZpbGUgZ2VuZXJh
dGVzIHRoZSBDRkxBR1MiLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAgIC0gbmV3IHBhdGNoCiAg
ICAgIChuZWVkZWQgZm9yICJ4ZW4vYnVpbGQ6IGhhdmUgdGhlIHJvb3QgTWFrZWZpbGUgZ2VuZXJh
dGVzIHRoZSBDRkxBR1MiKQoKIHhlbi9hcmNoL3g4Ni9SdWxlcy5tayB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9SdWxlcy5tayBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawppbmRleCBlNjliOGU2OTdj
YzAuLjRiN2FiNzg0NjcwYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L1J1bGVzLm1rCisrKyBi
L3hlbi9hcmNoL3g4Ni9SdWxlcy5tawpAQCAtMjYsNyArMjYsNyBAQCAkKGNhbGwgYXMtb3B0aW9u
LWFkZCxDRkxBR1MsQ0MsIi5MMDogLkwxOiAuc2tpcCAoLkwxIC0gLkwwKSIsLFwKICAgICAgICAg
ICAgICAgICAgICAgIC1uby1pbnRlZ3JhdGVkLWFzKQogCiAjIENoZWNrIHdoZXRoZXIgY2xhbmcg
YXNtKCktcyBzdXBwb3J0IC5pbmNsdWRlLgotJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLEND
LCIuaW5jbHVkZSBcImFzbS9pbmRpcmVjdF90aHVua19hc20uaFwiIiwsXAorJChjYWxsIGFzLW9w
dGlvbi1hZGQsQ0ZMQUdTLENDLCIuaW5jbHVkZSBcImFzbS14ODYvaW5kaXJlY3RfdGh1bmtfYXNt
LmhcIiIsLFwKICAgICAgICAgICAgICAgICAgICAgIC1uby1pbnRlZ3JhdGVkLWFzKQogCiAjIENo
ZWNrIHdoZXRoZXIgY2xhbmcga2VlcHMgLm1hY3JvLXMgYmV0d2VlbiBhc20oKS1zOgotLSAKQW50
aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
