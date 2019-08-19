Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E094CE9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmMK-0003v0-LV; Mon, 19 Aug 2019 18:26:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzmMJ-0003uv-3w
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:26:23 +0000
X-Inumbo-ID: d7441e82-c2ae-11e9-8bf0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7441e82-c2ae-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566239180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2+liPIc4HdMNTcLpPYN46KFOTsVifPqMhUaNhq5PAus=;
 b=A5yoso2CF+7w06gIVy9Bw9+dfSkjKcGcnYbxDeH2SBAHV8zoD0eryq1H
 yF9wF+fos4a/HM1lj6ovPBM2ooLF7vxeFbT9+IpEUqkfKMS7KwvqoYpE4
 qZr1Wvd4KOCWlxI6w2VZZmkvFYZOL70KXAkMLYXaWhOEIS1liyGP7oqrT U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dJSF87J8mvefK8Ne8IGiPxS99brObkRqUXaO4HS2wONqFw/a7squnuiEwm3KMlTockFyfP1x/u
 C4wtqC3sS+x43ptKtFmVY3d+jiJ7ZHc8vbgm8omY4uTi5xPEYq+goEbJUJEAevv9kzgP2vfZok
 UH9BRiUsh5lmrzRRn6U8BgfsgRLuaS0aVPEumn3gwaV88KDBJtd22mVsVxODQTnyUhmSoF483E
 J7GZt7WaWYKnZrI4UG85hyTc4k2s6XxOs7TpsWv6cQW5LIFUY4PpdKYJtlCuhBv4nn891zfM8E
 vAA=
X-SBRS: 2.7
X-MesageID: 4647677
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4647677"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 19 Aug 2019 19:26:10 +0100
Message-ID: <20190819182612.16706-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] x86/AMD: Fix handling of x87 exception
 pointers on Fam17h hardware
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

VGhpcyBpcyBhIHN1YnNldCBvZiBhIHByZXZpb3VzbHkgcG9zdGVkIHNlcmllcywgYmVjYXVzZSBz
dXBwb3J0IGZvciB0aGlzCndvcmthcm91bmQgaGFzIGJlZW4gb3V0c3RhbmRpbmcgZm9yIGZhciB0
b28gbG9uZy4KCkFuZHJldyBDb29wZXIgKDIpOgogIHg4Ni9mZWF0dXJlOiBHZW5lcmFsaXNlIHN5
bnRoIGFuZCBpbnRyb2R1Y2UgYSBidWcgd29yZAogIHg4Ni9BTUQ6IEZpeCBoYW5kbGluZyBvZiB4
ODcgZXhjZXB0aW9uIHBvaW50ZXJzIG9uIEZhbTE3aCBoYXJkd2FyZQoKIHRvb2xzL2xpYnhsL2xp
YnhsX2NwdWlkLmMgICAgICAgICAgICAgICAgICAgfCAgMyArKwogdG9vbHMvbWlzYy94ZW4tY3B1
aWQuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysKIHhlbi9hcmNoL3g4Ni9pMzg3LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNCArKystLS0KIHhlbi9hcmNoL3g4Ni94c3RhdGUuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNiArLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVy
ZS5oICAgICAgICAgICAgfCAgMyArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlcy5o
ICAgICAgICAgICB8IDY5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVk
ZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oIHwgIDEgKwogOCBmaWxlcyBjaGFuZ2Vk
LCA2MiBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
