Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF04CD6A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 14:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdvpr-00064n-OL; Thu, 20 Jun 2019 12:06:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AtfB=UT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdvpp-00064i-Vk
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 12:06:34 +0000
X-Inumbo-ID: d6ca76e8-9353-11e9-af64-8f220008ee0d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6ca76e8-9353-11e9-af64-8f220008ee0d;
 Thu, 20 Jun 2019 12:06:31 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bK/WM6lDttzmGjbXWMerrkkeVOi/gukRsB65BJU0JKIvEGfDY9SQdPHzV/zUnPeVACe+Lju1H5
 r/jy+mvx5pG45q8AMyzJz8UXCB7x3JHhq9TY90Uc0eqF68gP4Vwe+d8BIuHhwOKMTxIfnvvBdD
 czTHGsMKmPAGYlWlI36fLTecqtyRXJhJqdXAwi3pt5r3bRH2SOiqVzgmgEcoKl3+gX4DZtOI5v
 Nz3G5Fo42QuNsc6ghRPGIQYFuIiQUWxKuMwjxeh6yCYG/WNN0mWq2HyKFKOJS89pUl5GIPgAmA
 YaM=
X-SBRS: 2.7
X-MesageID: 1988511
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,396,1557201600"; 
   d="scan'208";a="1988511"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 20 Jun 2019 13:06:21 +0100
Message-ID: <1561032381-24385-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/svm: Drop svm_vm{load,save}() helpers
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9sbG93aW5nIG9uIGZyb20gYy9zIDdkMTYxZjY1MzcgIng4Ni9zdm06IEZpeCBzdm1fdm1jYl9k
dW1wKCkgd2hlbiB1c2VkIGluCmN1cnJlbnQgY29udGV4dCIsIHRoZXJlIGlzIG5vdyBvbmx5IGEg
c2luZ2xlIHVzZXIgb2Ygc3ZtX3Ztc2F2ZSgpIHJlbWFpbmluZyBpbgp0aGUgdHJlZSwgd2l0aCBh
bGwgdXNlcnMgbW92ZWQgdG8gc3ZtX3Zte2xvYWQsc2F2ZX1fcGEoKS4KCm52LT5udl9uMXZtY3gg
aGFzIGEgbWF0Y2hpbmcgbnYtPm52X24xdm1jeF9wYSB3aGljaCBpcyBhbHdheXMgY29ycmVjdCwg
YW5kCmF2b2lkcyBhIHJlZHVuZGFudCBfX3BhKCkgdHJhbnNsYXRpb24gYmVoaW5kIHRoZSBzY2Vu
ZXMuCgpXaXRoIHRoaXMgZ29uZSwgYWxsIFZNe0xPQUQsU0FWRX0gb3BlcmF0aW9ucyBhcmUgdXNp
bmcgcGFkZHJfdCdzIHdoaWNoIGlzIG1vcmUKZWZmaWNpZW50LCBzbyBkcm9wIHRoZSBzdm1fdm17
bG9hZCxzYXZlfSgpIGhlbHBlcnMgdG8gYXZvaWQgdXNlcyBvZiB0aGVtCnJlYXBwZWFyaW5nIGlu
IHRoZSBmdXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
CkNDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29t
PgpDQzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CgpJdCB0dXJucyBvdXQgSSB3
YXMgbWlzdGFrZW4gYWJvdXQgaG93IGNvbXBsaWNhdGVkIHRoaXMgd2FzLgotLS0KIHhlbi9hcmNo
L3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L3N2bS9zdm0uaCB8IDMgLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5j
IGIveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMKaW5kZXggMzVjMWEwNC4uZmVmMTI0
ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMKKysrIGIveGVu
L2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMKQEAgLTEwMzAsNyArMTAzMCw3IEBAIG5zdm1f
dm1jYl9wcmVwYXJlNHZtZXhpdChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MpCiAgICAgc3RydWN0IHZtY2Jfc3RydWN0ICpuc192bWNiID0gbnYtPm52X3Z2bWN4Owog
ICAgIHN0cnVjdCB2bWNiX3N0cnVjdCAqbjJ2bWNiID0gbnYtPm52X24ydm1jeDsKIAotICAgIHN2
bV92bXNhdmUobnYtPm52X24xdm1jeCk7CisgICAgc3ZtX3Ztc2F2ZV9wYShudi0+bnZfbjF2bWN4
X3BhKTsKIAogICAgIC8qIENhY2hlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgb2YgdmlydHVhbCB2
bWNiCiAgICAgICogZm9yIFZNQ0IgQ2xlYW5iaXQgZW11bGF0aW9uLgpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
c3ZtL3N2bS5oCmluZGV4IDZlNjg4YTguLjE2YTk5NGUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3N2bS9zdm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0v
c3ZtLmgKQEAgLTIyLDkgKzIyLDYgQEAKIAogI2luY2x1ZGUgPHhlbi90eXBlcy5oPgogCi0jZGVm
aW5lIHN2bV92bWxvYWQoeCkgICAgIHN2bV92bWxvYWRfcGEoX19wYSh4KSkKLSNkZWZpbmUgc3Zt
X3Ztc2F2ZSh4KSAgICAgc3ZtX3Ztc2F2ZV9wYShfX3BhKHgpKQotCiBzdGF0aWMgaW5saW5lIHZv
aWQgc3ZtX3ZtbG9hZF9wYShwYWRkcl90IHZtY2IpCiB7CiAgICAgYXNtIHZvbGF0aWxlICgKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
