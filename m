Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94981508A5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:45:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycx0-0006Al-2g; Mon, 03 Feb 2020 14:43:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac3p=3X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iycwz-0006Af-5E
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:43:45 +0000
X-Inumbo-ID: 92a17113-4693-11ea-8e6a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92a17113-4693-11ea-8e6a-12813bfff9fa;
 Mon, 03 Feb 2020 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580741025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ByDNkAr5LjV/jbHj2NJFyZF8W7juBYKh37bxqA/zHfo=;
 b=IWEa20qI2cMXleHK9KLshzjsZO8QFxm3H7JE4vIVFZwPw3ApRBMqc7El
 9F9B5p3fddA7ERbgsQpS4jSNuF7TRdP8+uUZGtSiGpdWNTdTont8LlgFi
 Nv5WHKwmPNounpkmvMYo7YvmxpHZiC/u92FGaCaeWBYSvBdE5tAQ5bNnf k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 63e1pgEUbFnQ98maHOM1A8YJZQR24gvcxKcCom9Q+7OkMr1hklcZYi2d1c2kOI4CcKRxbGDiRM
 d9Fsic9zg8S2W3qengRFZE5Qu6xBcrduuhCnSCB7a580E5DjJ/I0uULrb9UO5uyHoafvIGotoU
 clYIOuhYFsTO6vMwURICL6UP1JdvGy7ZM4sD9mpY7wUScpYBNbIGPYJx56Fr5jmrasFgn6Btvn
 ASpOoZ46lKseb22RRQlvzmAiQ0f7uXSYNbo7e/6NcaiuOcC+QQNfbtvAek5qJLINojo4wBkDuM
 IjI=
X-SBRS: 2.7
X-MesageID: 12023810
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12023810"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 14:43:36 +0000
Message-ID: <20200203144340.4614-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] AMD/IOMMU: Cleanup
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaW91cyBiaXRzIG9mIGNsZWFudXAgd2l0aG91dCBhbnkgbWFqb3IgZnVuY3Rpb25hbCBjaGFu
Z2UuICBUaGUgZXZlbnR1YWwKcGxhbiBpcyB0byBwdXJnZSB0aGUge2dldCxzZXR9X2ZpZWxkX3tm
cm9tLGlufV91MzIoKSBoZWxwZXJzLCB3aGljaCBhcmUKcmVzcG9uc2libGUgZm9yIHZlcnkgaGFy
ZCB0byBmb2xsb3cgY29kZSwgYW5kIHBvb3IgY29kZSBnZW5lcmF0aW9uLgoKQW5kcmV3IENvb3Bl
ciAoNCk6CiAgQU1EL0lPTU1VOiBNb3ZlIGhlYWRlcnMgdG8gYmUgbG9jYWwKICBBTUQvSU9NTVU6
IERlbGV0ZSBpb21tdV97Z2V0LHNldCxjbGVhcn1fYml0KCkgaGVscGVycwogIEFNRC9JT01NVTog
VHJlYXQgZ3Vlc3QgaGVhZC90YWlsIHBvaW50ZXJzIGFzIGJ5dGUgb2Zmc2V0cwogIEFNRC9JT01N
VTogVHJlYXQgaGVhZC90YWlsIHBvaW50ZXJzIGFzIGJ5dGUgb2Zmc2V0cwoKIHhlbi9hcmNoL3g4
Ni9tbS9wMm0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KIC4uLi9wYXNz
dGhyb3VnaC9hbWQvaW9tbXUtZGVmcy5ofSAgICAgICAgICAgICAgICAgIHwgIDQxICsrLS0KIC4u
Li9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaH0gICAgICAgICAgICAgICAgICAgICAgIHwgMjA2ICsr
KysrKysrKysrKysrKysrLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2Fj
cGkuYyAgICAgICAgICAgfCAgIDcgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21t
dV9jbWQuYyAgICAgICAgICAgIHwgIDMyICsrLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9kZXRlY3QuYyAgICAgICAgIHwgICA3ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvaW9tbXVfZ3Vlc3QuYyAgICAgICAgICB8IDEzMiArKysrKystLS0tLS0tCiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jICAgICAgICAgICB8ICA2NCArKystLS0t
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jICAgICAgICAgICB8ICAg
OSArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jICAgICAgICAgICAg
fCAgIDggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgICAg
ICAgIHwgICA5ICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5oICAgICAgICAgICAg
ICAgICAgICB8IDE5MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAxMiBmaWxlcyBjaGFuZ2VkLCAyOTgg
aW5zZXJ0aW9ucygrKSwgNDA4IGRlbGV0aW9ucygtKQogcmVuYW1lIHhlbi97aW5jbHVkZS9hc20t
eDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaCA9PiBkcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdS1kZWZzLmh9ICg5MiUpCiByZW5hbWUgeGVuL3tpbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9h
bWQtaW9tbXUtcHJvdG8uaCA9PiBkcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5ofSAoNjgl
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvYW1kLWlvbW11LmgKCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
