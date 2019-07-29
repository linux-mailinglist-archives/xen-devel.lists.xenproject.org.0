Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD878B89
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:15:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Vg-0006c8-EK; Mon, 29 Jul 2019 12:12:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs4Ve-0006bm-R3
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:10 +0000
X-Inumbo-ID: 170689f0-b1fa-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 170689f0-b1fa-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:12:09 +0000 (UTC)
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
IronPort-SDR: g585z62AXuuzKgG+ZUdYdUQzBhhM+fmFY6142nqALR9hhGW5UpCfmryneYGdyCussTzKDueI3L
 mBz2yO1RF+KygV0AsmAM95WcfQWOcnZftkY7FpH/hsOFdJ58qxIlehuxuxTGqwCWoz+eKxtwBF
 q4lAVNRzaqSOvpaNiQrqb0mam4VWF6pdULWY1/Ffdv7FDB0KZdY2b5WSGmfU2MQbBSrLvEDQRM
 46b1jYu874R0jcVV2px7R4ga36N+mvAvJhdqncRtJxThaTob5WwSlcEPpuR4Vo0MPQy/BFYP+F
 a+4=
X-SBRS: 2.7
X-MesageID: 3672659
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3672659"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 13:11:54 +0100
Message-ID: <20190729121204.13559-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 00/10] xen/nodemask: API cleanup and fixes
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaGFzIGV4cGFuZGVkIHN1YnN0YW50aWFsbHkgZnJvbSB2Mi4KClRoZSBidWdm
aXggaGFzIGJlZW4gbW92ZWQgdG8gcGF0Y2ggMSwgaW4gY2FzZSBpdCB3YW50cyBiYWNrcG9ydGlu
Zy4KRXZlcnl0aGluZyBlbHNlIGlzIEFQSSBjbGVhbnVwIGZvbGxvd2luZyBmcm9tIEphbidzIHJl
cXVlc3QgdG8gZG8gbW9yZSB0aGFuIGluCnYyLgoKQW5kcmV3IENvb3BlciAoMTApOgogIHBhZ2Ut
YWxsb2M6IENsYW1wIGdldF9mcmVlX2J1ZGR5KCkgdG8gb25saW5lIG5vZGVzCiAgeGVuL2JpdG1h
cDogRHJvcCB7Yml0bWFwLGNwdW1hc2ssbm9kZXN9X3NoaWZ0X3tsZWZ0LHJpZ2h0fSgpCiAgeGVu
L25vZGVtYXNrOiBEcm9wIGFueV9vbmxpbmVfbm9kZSgpIGFuZCBmaXJzdF91bnNldF9ub2RlKCkK
ICB4ZW4vbWFzazogQ29udmVydCB7Y3B1LG5vZGV9bWFza190ZXN0KCkgdG8gYmUgc3RhdGljIGlu
bGluZQogIHhlbi9jcHVtYXNrOiBJbnRyb2R1Y2UgYSBDUFVNQVNLX1BSKCkgd3JhcHBlciBmb3Ig
cHJpbnRpbmcKICB4ZW4vbm9kZW1hc2s6IEludHJvZHVjZSBhIE5PREVNQVNLX1BSKCkgd3JhcHBl
ciBmb3IgcHJpbnRpbmcKICB4ZW4vbm9kZW1hc2s6IERyb3Agbm9kZXNfe3NldGFsbCxjbGVhcn0o
KSBhbmQgaW1wcm92ZSB0aGUgaW5pdGlhbGlzZXJzCiAgeGVuL25vZGVtYXNrOiBJbnRyb2R1Y2Ug
dW5sb2NrZWQgX19ub2RlbWFza197c2V0LGNsZWFyfSgpIGhlbHBlcnMKICB4ZW4vbm9kZW1hc2s6
IFNhbml0aXNlIHRoZSByZW1haW5kZXIgb2YgdGhlIG5vZGVtYXNrIEFQSQogIHhlbi9ub2RlbWFz
azogRHJvcCByZW1haW5pbmcgcmVmZWNlcyB0byBsaW51eAoKIHhlbi9hcmNoL3g4Ni9jcHUvbWNo
ZWNrL21jZS5jIHwgICAyICstCiB4ZW4vYXJjaC94ODYvY3Jhc2guYyAgICAgICAgICB8ICAgMiAr
LQogeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyAgICAgfCAgMTIgKy0KIHhlbi9hcmNoL3g4Ni9p
b19hcGljLmMgICAgICAgIHwgICA2ICstCiB4ZW4vYXJjaC94ODYvaXJxLmMgICAgICAgICAgICB8
ICAgNSArLQogeGVuL2FyY2gveDg2L251bWEuYyAgICAgICAgICAgfCAgIDcgKy0KIHhlbi9hcmNo
L3g4Ni9zcmF0LmMgICAgICAgICAgIHwgIDE1ICstCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAg
ICAgICB8ICAgMyArLQogeGVuL2NvbW1vbi9iaXRtYXAuYyAgICAgICAgICAgfCAgODggLS0tLS0t
LS0tLS0KIHhlbi9jb21tb24vY3B1cG9vbC5jICAgICAgICAgIHwgICA3ICstCiB4ZW4vY29tbW9u
L2RvbWFpbi5jICAgICAgICAgICB8ICAxMCArLQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAg
ICAgfCAgIDQgKy0KIHhlbi9jb21tb24va2V5aGFuZGxlci5jICAgICAgIHwgIDEwICstCiB4ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgICB8ICAzNSArKystLQogeGVuL2NvbW1vbi9zY2hlZF9j
cmVkaXQuYyAgICAgfCAgIDggKy0KIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jICAgIHwgIDEy
ICstCiB4ZW4vY29tbW9uL3NjaGVkX251bGwuYyAgICAgICB8ICAgNyArLQogeGVuL2NvbW1vbi9z
Y2hlZF9ydC5jICAgICAgICAgfCAgIDMgKy0KIHhlbi9jb21tb24vc3lzY3RsLmMgICAgICAgICAg
IHwgICAyICstCiB4ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmggICAgICB8ICAyMiAtLS0KIHhlbi9p
bmNsdWRlL3hlbi9jcHVtYXNrLmggICAgIHwgIDQxICsrLS0tCiB4ZW4vaW5jbHVkZS94ZW4vbm9k
ZW1hc2suaCAgICB8IDM0NiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDIyIGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspLCA0MTkgZGVsZXRpb25zKC0p
CgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
