Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A974FD3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:42:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdxw-0008Vk-MF; Thu, 25 Jul 2019 13:39:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdxv-0008VQ-49
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:39:27 +0000
X-Inumbo-ID: 9dbccc00-aee1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9dbccc00-aee1-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:39:25 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZyHKo+gfarVaSumbHSTBJorjOltLwTQsw3kxcQs80PTmfLsp/HP+WR894aslNgAxX06z61Quu9
 nmHZEGX1RgNUcLBeccCIDsmTlqEH2CNX2HmAe391Nh5zSCy87qLn/WNVGp43Di6/+6/45ibhL7
 yi4md2+KRke5E5qnVGGkkgwGvWoTOJUhU6rw+Q3/PqZhgXwwTgsgIiPd/8Lp/L6xemD4Mw0Le9
 vc1Wp3Z3/V4umixGhk05ryA9ti+YHnJ1PkeEYBxxt5o2M+Df9HQa1ClvTriHti2TFiLpvjbGyN
 WT4=
X-SBRS: 2.7
X-MesageID: 3420483
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3420483"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 14:39:14 +0100
Message-ID: <20190725133920.40673-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/6] stash domain create flags and then use
 them
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Gang Wei <gang.wei@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgc3RhcnRzIHdpdGggYSBwYXRjaCB0byBzdGFzaCB0aGUgZG9tYWluIGNyZWF0
ZSBmbGFncyBpbiBzdHJ1Y3QKZG9tYWluIHRoZW4gdGhlbiBmb2xsb3dzIHVwIHdpdGggdmFyaW91
cyBjbGVhbi11cCBwYXRjaGVzIHRoYXQgdGhpcwplbmFibGVzLgoKUGF1bCBEdXJyYW50ICg2KToK
ICBkb21haW46IHN0YXNoIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGZsYWdzIGluIHN0cnVjdCBk
b21haW4KICBkb21haW46IHJlbW92ZSAnZ3Vlc3RfdHlwZScgZmllbGQgKGFuZCBlbnVtIGd1ZXN0
X3R5cGUpCiAgeDg2L2h2bS9kb21haW46IHJlbW92ZSB0aGUgJ2hhcF9lbmFibGVkJyBmbGFnCiAg
eDg2L2RvbWFpbjogcmVtb3ZlIHRoZSAnb29zX29mZicgZmxhZwogIGRvbWFpbjogcmVtb3ZlIHRo
ZSAnaXNfeGVuc3RvcmUnIGZsYWcKICB4ODYvZG9tYWluOiByZW1vdmUgdGhlICdzM19pbnRlZ3Jp
dHknIGZsYWcKCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICB8ICA5ICstLS0tLS0t
LQogeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jICB8ICA1ICsrLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93
L25vbmUuYyAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvdGJvb3QuYyAgICAgICAgICAgICB8ICAy
ICstCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAgICB8IDE1ICsrKysrLS0tLS0tLS0t
LQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgfCAxMiArKy0tLS0tLS0tLS0KIHhl
bi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgIHwgIDkgKystLS0tLS0tCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2RvbWFpbi5oICAgICB8ICAzIC0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
ZG9tYWluLmggfCAgOSArKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcGFnaW5nLmggICAg
IHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAgIHwgIDIgKy0KIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgIHwgMjIgKysrKysrKysrKy0tLS0tLS0tLS0tLQog
eGVuL2luY2x1ZGUveHNtL2R1bW15LmggICAgICAgICAgfCAgMiArLQogMTQgZmlsZXMgY2hhbmdl
ZCwgMzIgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdy
YUB0eWNoby5uc2EuZ292PgpDYzogR2FuZyBXZWkgPGdhbmcud2VpQGludGVsLmNvbT4KQ2M6IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6ICJSb2dlciBQYXUg
TW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBTaGFuZSBXYW5nIDxzaGFuZS53YW5n
QGludGVsLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4K
LS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
