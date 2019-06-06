Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6725936F75
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYoHn-0006V7-DG; Thu, 06 Jun 2019 09:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYoHl-0006Ul-SR
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:02:13 +0000
X-Inumbo-ID: c5479f42-8839-11e9-a0c2-1b6837f47d8e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5479f42-8839-11e9-a0c2-1b6837f47d8e;
 Thu, 06 Jun 2019 09:02:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j6PBXJhpDnQ5xIl08Ghi8vbgcz8dK5iL90vWZ3kXChEpBdI3HpVXS9myWpGwhZPQQWxCbWri69
 V83uBScLorp+dTEWTL5avbVlTsdrx9pGfs0HU9NDtBahbQ7W8dSxazlq9xAxGf3QdtIx5fotLQ
 rTHOyE7yiP7rLXAqzxaytWhKdfbs9EzZdL0g0v64XvEq/Ke3MPPDwKDYo6VOeSs6i7WEsrZwVD
 S636brFMzQKPJ9tMsdoujEIo1eGhA8U//HGNLfAHEfCpK8Kps90fqhc4ZL4gkNcXX7dAwE6HYp
 p98=
X-SBRS: -0.9
X-MesageID: 1385804
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,558,1557201600"; 
   d="scan'208";a="1385804"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 11:01:36 +0200
Message-ID: <20190606090146.77381-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190606090146.77381-1-roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 02/12] pci: introduce a pci_sbdf_t field to
 pci_dev
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIHVzZSBhbiB1bmlvbiB3aXRoIHRoZSBjdXJyZW50IHNlZywgYnVzIGFuZCBkZXZmbiBmaWVs
ZHMgdG8gbWFrZQpmaWVsZHMgcG9pbnQgdG8gdGhlIHNhbWUgdW5kZXJseWluZyBkYXRhLgoKTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCgpTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Q2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRp
bUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB4ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jIHwgIDcgKystLS0tLQogeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICB8IDEyICsr
KysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVy
cy92cGNpL2hlYWRlci5jCmluZGV4IGVmYjZjYTkwZTMuLjA0NmIxYzYxMGUgMTAwNjQ0Ci0tLSBh
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
YwpAQCAtNDYxLDkgKzQ2MSw2IEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KQogICAgIHVuc2lnbmVkIGludCBpLCBudW1fYmFycywgcm9tX3JlZzsKICAgICBzdHJ1
Y3QgdnBjaV9oZWFkZXIgKmhlYWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7CiAgICAgc3RydWN0
IHZwY2lfYmFyICpiYXJzID0gaGVhZGVyLT5iYXJzOwotICAgIHBjaV9zYmRmX3Qgc2JkZiA9IHsK
LSAgICAgICAgLnNiZGYgPSBQQ0lfU0JERjMocGRldi0+c2VnLCBwZGV2LT5idXMsIHBkZXYtPmRl
dmZuKSwKLSAgICB9OwogICAgIGludCByYzsKIAogICAgIHN3aXRjaCAoIHBjaV9jb25mX3JlYWQ4
KHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90LCBmdW5jLCBQQ0lfSEVBREVSX1RZUEUpCkBAIC01
MzAsNyArNTI3LDcgQEAgc3RhdGljIGludCBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYp
CiAgICAgICAgIGVsc2UKICAgICAgICAgICAgIGJhcnNbaV0udHlwZSA9IFZQQ0lfQkFSX01FTTMy
OwogCi0gICAgICAgIHJjID0gcGNpX3NpemVfbWVtX2JhcihzYmRmLCByZWcsICZhZGRyLCAmc2l6
ZSwKKyAgICAgICAgcmMgPSBwY2lfc2l6ZV9tZW1fYmFyKHBkZXYtPnNiZGYsIHJlZywgJmFkZHIs
ICZzaXplLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGkgPT0gbnVtX2JhcnMgLSAx
KSA/IFBDSV9CQVJfTEFTVCA6IDApOwogICAgICAgICBpZiAoIHJjIDwgMCApCiAgICAgICAgIHsK
QEAgLTU2MCw3ICs1NTcsNyBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAq
cGRldikKICAgICB9CiAKICAgICAvKiBDaGVjayBleHBhbnNpb24gUk9NLiAqLwotICAgIHJjID0g
cGNpX3NpemVfbWVtX2JhcihzYmRmLCByb21fcmVnLCAmYWRkciwgJnNpemUsIFBDSV9CQVJfUk9N
KTsKKyAgICByYyA9IHBjaV9zaXplX21lbV9iYXIocGRldi0+c2JkZiwgcm9tX3JlZywgJmFkZHIs
ICZzaXplLCBQQ0lfQkFSX1JPTSk7CiAgICAgaWYgKCByYyA+IDAgJiYgc2l6ZSApCiAgICAgewog
ICAgICAgICBzdHJ1Y3QgdnBjaV9iYXIgKnJvbSA9ICZoZWFkZXItPmJhcnNbbnVtX2JhcnNdOwpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5o
CmluZGV4IGVjOTgyNzQ2NzUuLmY0OTA4YWJkOGIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9wY2kuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKQEAgLTgzLDkgKzgzLDE1IEBAIHN0
cnVjdCBwY2lfZGV2IHsKICAgICBzdHJ1Y3QgYXJjaF9tc2l4ICptc2l4OwogCiAgICAgc3RydWN0
IGRvbWFpbiAqZG9tYWluOwotICAgIGNvbnN0IHUxNiBzZWc7Ci0gICAgY29uc3QgdTggYnVzOwot
ICAgIGNvbnN0IHU4IGRldmZuOworCisgICAgdW5pb24geworICAgICAgICBzdHJ1Y3QgeworICAg
ICAgICAgICAgY29uc3QgdWludDhfdCBkZXZmbjsKKyAgICAgICAgICAgIGNvbnN0IHVpbnQ4X3Qg
YnVzOworICAgICAgICAgICAgY29uc3QgdWludDE2X3Qgc2VnOworICAgICAgICB9OworICAgICAg
ICBjb25zdCBwY2lfc2JkZl90IHNiZGY7CisgICAgfTsKIAogICAgIHU4IHBoYW50b21fc3RyaWRl
OwogCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
