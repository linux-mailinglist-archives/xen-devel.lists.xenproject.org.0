Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6C735CA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 19:47:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqLI7-0007iY-VJ; Wed, 24 Jul 2019 17:43:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ItzJ=VV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqLI6-0007iO-AN
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 17:43:02 +0000
X-Inumbo-ID: 7b2b80a3-ae3a-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7b2b80a3-ae3a-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 17:43:01 +0000 (UTC)
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
IronPort-SDR: +ZyqHRRUPMTLaRWMXH376SFn9xB2V4wLRHdR4CNIqfC8vbZx/hgdT4pwMyUFuxBheiYadfVMbx
 LaPLlYauPoshsJkoVXY3OTm5PEmxshYE2FKoMq/fewpMxBVi1Hyobxh77Anq1pZKxkOzCSobty
 8XyCB1vBIVjkfMOm/rkfrGtFbyed/5NRavZO0yqsqZ+u4vj4lrrUYZNVRuF1j/kLTV6wEQFHVz
 jTryc2uwkWXSUGlSAT98cQIC4JQvyYLJQ2sFh0lw+TvG27/BiDJ1gw6EJOvvaIr7P6APV2q3mQ
 1pE=
X-SBRS: 2.7
X-MesageID: 3491248
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3491248"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 24 Jul 2019 18:42:53 +0100
Message-ID: <20190724174256.5295-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] x86/dmi: Cleanup
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

VGhpcyBpcyBhbGwgdHJpdmlhbCBjbGVhbnVwIHNwb3R0ZWQgYWZ0ZXIgaGF2aW5nIGNvbWUgY29s
bGlzaW9ucyBpbiB0aGUKWGVuU2VydmVyIHBhdGNocXVldWUgd2hlbiByZWJhc2luZyBvdmVyIFJv
Z2VycyBQQ0kgU0JERiBjaGFuZ2VzIGluIHN0YWdpbmcuCgpBbmRyZXcgQ29vcGVyICgzKToKICB4
ODY6IERyb3AgQ09ORklHX0FDUElfU0xFRVAKICB4ODYvZG1pOiBEcm9wIHRyaXZpYWwgY2FsbGJh
Y2sgZnVuY3Rpb25zCiAgeDg2L2RtaTogQ29uc3RpZnkgcXVpcmtzIGRhdGEKCiB4ZW4vYXJjaC94
ODYvYWNwaS9ib290LmMgICAgICAgICAgICB8ICA0IC0tLS0KIHhlbi9hcmNoL3g4Ni9kbWlfc2Nh
bi5jICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9nZW5hcGljL2JpZ3NtcC5jICAgICAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L2h2bS9xdWly
a3MuYyAgICAgICAgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC94ODYvaW9wb3J0X2VtdWxhdGUuYyAg
ICAgICB8IDIwICsrKystLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvc2h1dGRvd24uYyAg
ICAgICAgICAgICB8ICA0ICsrLS0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW1jb25mLWZhbTEwaC5j
IHwgMTIgKysrLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2FjcGkuaCAgICAgICAgICB8
ICA0IC0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmggICAgICAgIHwgIDEgLQogeGVu
L2luY2x1ZGUveGVuL2RtaS5oICAgICAgICAgICAgICAgfCAgNCArKy0tCiAxMCBmaWxlcyBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
