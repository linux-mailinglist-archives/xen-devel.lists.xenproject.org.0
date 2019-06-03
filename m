Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44B32632
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 03:39:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXbrb-0000Q4-7c; Mon, 03 Jun 2019 01:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXbra-0000Pz-4U
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:34:14 +0000
X-Inumbo-ID: ae0ff3b6-859f-11e9-834d-138507bc2d3d
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae0ff3b6-859f-11e9-834d-138507bc2d3d;
 Mon, 03 Jun 2019 01:34:09 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 3 Jun 2019 09:31:55 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 09:33:47 +0800
Message-ID: <1559525627-2701-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH RESEND] xen: notifier: refine 'notifier_head',
 use 'list_head' directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

J25vdGlmaWVyX2Jsb2NrJyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVuIHVz
ZWQgZm9yCidub3RpZmllcl9oZWFkJywgdGhpcyBtYWtlIHRoZSBhIGxpdHRsZSBtb3JlIGNsZWFy
LgoKU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPgot
LS0KIHhlbi9jb21tb24vbm90aWZpZXIuYyAgICAgIHwgMTIgKysrKysrLS0tLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vbm90aWZpZXIuaCB8ICA3ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL25vdGlm
aWVyLmMgYi94ZW4vY29tbW9uL25vdGlmaWVyLmMKaW5kZXggMzQ0ODhhOC4uYzdiMDY2OSAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9ub3RpZmllci5jCisrKyBiL3hlbi9jb21tb24vbm90aWZpZXIu
YwpAQCAtMjEsMTAgKzIxLDEwIEBACiB2b2lkIF9faW5pdCBub3RpZmllcl9jaGFpbl9yZWdpc3Rl
cigKICAgICBzdHJ1Y3Qgbm90aWZpZXJfaGVhZCAqbmgsIHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bikKIHsKLSAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjaGFpbiA9ICZuaC0+aGVhZC5jaGFpbjsKKyAg
ICBzdHJ1Y3QgbGlzdF9oZWFkICpjaGFpbiA9ICZuaC0+aGVhZDsKICAgICBzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgKm5iOwogCi0gICAgd2hpbGUgKCBjaGFpbi0+bmV4dCAhPSAmbmgtPmhlYWQuY2hh
aW4gKQorICAgIHdoaWxlICggY2hhaW4tPm5leHQgIT0gJm5oLT5oZWFkICkKICAgICB7CiAgICAg
ICAgIG5iID0gbGlzdF9lbnRyeShjaGFpbi0+bmV4dCwgc3RydWN0IG5vdGlmaWVyX2Jsb2NrLCBj
aGFpbik7CiAgICAgICAgIGlmICggbi0+cHJpb3JpdHkgPiBuYi0+cHJpb3JpdHkgKQpAQCAtNzEs
MTYgKzcxLDE2IEBAIGludCBub3RpZmllcl9jYWxsX2NoYWluKAogewogICAgIGludCByZXQgPSBO
T1RJRllfRE9ORTsKICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjdXJzb3I7Ci0gICAgc3RydWN0IG5v
dGlmaWVyX2Jsb2NrICpuYjsKKyAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iID0gTlVMTDsK
ICAgICBib29sX3QgcmV2ZXJzZSA9ICEhKHZhbCAmIE5PVElGWV9SRVZFUlNFKTsKIAotICAgIGN1
cnNvciA9ICYocGN1cnNvciAmJiAqcGN1cnNvciA/ICpwY3Vyc29yIDogJm5oLT5oZWFkKS0+Y2hh
aW47CisgICAgY3Vyc29yID0gKHBjdXJzb3IgJiYgKnBjdXJzb3IgPyAmKCpwY3Vyc29yKS0+Y2hh
aW4gOiAmbmgtPmhlYWQpOwogCiAgICAgZG8gewogICAgICAgICBjdXJzb3IgPSByZXZlcnNlID8g
Y3Vyc29yLT5wcmV2IDogY3Vyc29yLT5uZXh0OwotICAgICAgICBuYiA9IGxpc3RfZW50cnkoY3Vy
c29yLCBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2ssIGNoYWluKTsKLSAgICAgICAgaWYgKCBjdXJzb3Ig
PT0gJm5oLT5oZWFkLmNoYWluICkKKyAgICAgICAgaWYgKCBjdXJzb3IgPT0gJm5oLT5oZWFkICkK
ICAgICAgICAgICAgIGJyZWFrOworICAgICAgICBuYiA9IGxpc3RfZW50cnkoY3Vyc29yLCBzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2ssIGNoYWluKTsKICAgICAgICAgcmV0ID0gbmItPm5vdGlmaWVyX2Nh
bGwobmIsIHZhbCwgdik7CiAgICAgfSB3aGlsZSAoICEocmV0ICYgTk9USUZZX1NUT1BfTUFTSykg
KTsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL25vdGlmaWVyLmggYi94ZW4vaW5jbHVk
ZS94ZW4vbm90aWZpZXIuaAppbmRleCBkMWZmOWIxLi4yZTU4YmQ5IDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS94ZW4vbm90aWZpZXIuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbm90aWZpZXIuaApA
QCAtMjksMTMgKzI5LDEyIEBAIHN0cnVjdCBub3RpZmllcl9ibG9jayB7CiB9OwogCiBzdHJ1Y3Qg
bm90aWZpZXJfaGVhZCB7Ci0gICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGhlYWQ7CisgICAgc3Ry
dWN0IGxpc3RfaGVhZCBoZWFkOwogfTsKIAotI2RlZmluZSBOT1RJRklFUl9JTklUKG5hbWUpIHsg
LmhlYWQuY2hhaW4gPSBMSVNUX0hFQURfSU5JVChuYW1lLmhlYWQuY2hhaW4pIH0KKyNkZWZpbmUg
Tk9USUZJRVJfSEVBRChuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCisgIHN0cnVjdCBub3RpZmllcl9oZWFkIG5hbWUgPSB7LmhlYWQgPSBM
SVNUX0hFQURfSU5JVChuYW1lLmhlYWQpfQogCi0jZGVmaW5lIE5PVElGSUVSX0hFQUQobmFtZSkg
XAotICAgIHN0cnVjdCBub3RpZmllcl9oZWFkIG5hbWUgPSBOT1RJRklFUl9JTklUKG5hbWUpCiAK
IHZvaWQgbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoCiAgICAgc3RydWN0IG5vdGlmaWVyX2hlYWQg
Km5oLCBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKTsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
