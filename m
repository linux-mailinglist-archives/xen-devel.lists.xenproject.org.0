Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB5140F43
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:47:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUjj-000088-AC; Fri, 17 Jan 2020 16:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DzQF=3G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1isUjh-000083-Rh
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 16:44:41 +0000
X-Inumbo-ID: a5f3c7a4-3948-11ea-b595-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5f3c7a4-3948-11ea-b595-12813bfff9fa;
 Fri, 17 Jan 2020 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579279477;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3OK9ICucmvY4btYuyVU/iRu7zAvg+8aI04OWZlF9DEA=;
 b=MYi61zNtRyjChuY0A82UQ6r+CJRTMsHQUL+Jg4mXpUV0N5kfEoCq4Amu
 7AygZ/5Pp3U1op038IW94gtoJnoBjev89CVZajkYKYiQ3ZWDkKMxi57oF
 jKxeqqAE1pMAQAWr0va72uutWl1sS8s2Am4rhvkHo2ByEIPLujtFrc1+r M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XNpmbnAFnfnpDrb+xHiaHxMMzpytFNzsH6cFB7Rqec9aUk43InUK391AyxbOZToMlH7PfB7fMI
 Wx4a6ddd2luTiNlrkFhn1VdfJIK2mxHfcg0OLXW73PdYOqq/dNGcvKMbNdhLxyqluBxg4qyblp
 FwFQaMnc1dZFDTPn4aNRn5QzZR2UNLPxU/x4/V1Nv3ELhCaQvg7AmUeQ/boB3C3WQ08DBBCIij
 IuGP0QvdFoqbnEEuuldxQJIE+UDehTn3YOwlI6aKVZZZV/Ajvgxs+vpF9lNBKGvbiYhypr7Pr5
 Al8=
X-SBRS: 2.7
X-MesageID: 11515041
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11515041"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Fri, 17 Jan 2020 16:44:31 +0000
Message-ID: <20200117164432.32245-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] xsm: add config option for denied string
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgot
LS0KdjIgLS0+IHYzOgotIG5ldyBwYXRjaAoKQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJp
eC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgpDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5n
b3Y+CkNDOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9LY29uZmlnICAgfCA4ICsrKysrKysrCiB4ZW4vY29tbW9uL3ZlcnNpb24uYyB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCmluZGV4IGIzZDE2MWQw
NTcuLmYwYTNmMGRhMGYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vS2NvbmZpZworKysgYi94ZW4v
Y29tbW9uL0tjb25maWcKQEAgLTIzNiw2ICsyMzYsMTQgQEAgY2hvaWNlCiAJCWJvb2wgIlNJTE8i
IGlmIFhTTV9TSUxPCiBlbmRjaG9pY2UKIAorY29uZmlnIFhTTV9ERU5JRURfU1RSSU5HCisJc3Ry
aW5nICJ4ZW5fdmVyc2lvbiBkZW5pZWQgc3RyaW5nIgorCWRlZmF1bHQgIjxkZW5pZWQ+IgorCWRl
cGVuZHMgb24gWFNNCisJLS0taGVscC0tLQorCSAgQSBzdHJpbmcgd2hpY2ggc3Vic3RpdHV0ZXMg
c2Vuc2l0aXZlIGluZm9ybWF0aW9uIHJldHVybmVkIHZpYQorCSAgeGVuX3ZlcnNpb24gaHlwZXJj
YWxsIHRvIG5vbi1wcml2aWxlZ2VkIGd1ZXN0cworCiBjb25maWcgTEFURV9IV0RPTQogCWJvb2wg
IkRlZGljYXRlZCBoYXJkd2FyZSBkb21haW4iCiAJZGVmYXVsdCBuCmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL3ZlcnNpb24uYyBiL3hlbi9jb21tb24vdmVyc2lvbi5jCmluZGV4IDkzN2ViMTI4MWMu
LjE0YjIwNWFmNDggMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdmVyc2lvbi5jCisrKyBiL3hlbi9j
b21tb24vdmVyc2lvbi5jCkBAIC02Nyw3ICs2Nyw3IEBAIGNvbnN0IGNoYXIgKnhlbl9iYW5uZXIo
dm9pZCkKIAogY29uc3QgY2hhciAqeGVuX2Rlbnkodm9pZCkKIHsKLSAgICByZXR1cm4gIjxkZW5p
ZWQ+IjsKKyAgICByZXR1cm4gQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HOwogfQogCiBzdGF0aWMg
Y29uc3Qgdm9pZCAqYnVpbGRfaWRfcCBfX3JlYWRfbW9zdGx5OwotLSAKMi4xNy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
