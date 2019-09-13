Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7252B1B1B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8iBA-0002Dh-52; Fri, 13 Sep 2019 09:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8iB8-0002Db-NS
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:47:46 +0000
X-Inumbo-ID: 89a3deb8-d60b-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89a3deb8-d60b-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568368065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OjGAKEvSeST+a/B/DQ3MtU09CoXDYaSdXrDudFU2qig=;
 b=RjfeAYgcoo+k2WGABYvhEyRvR1ejqhi6Vz+RzLCj1EqWUQ/Q16kdAbyr
 FLNgT9DBScNVHeza6obQ5Jkrn/N7IaMWiCdYr71A5g4BHnUBQL9Nc2PRZ
 Zq92gc3yz1UIV0I7q/IAPnWNQR8YjgQNG+kA1T4aGZ4EjlLELbC4IXAYz g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NJVTunH1sISTj37dTXvmH1U+cx7q+z3EowzET7LmozC8bM7PhQL598rvPxeYdOoMTv+8rN6I4f
 aUt7q1yvUM5ztTA3KsgGCCjWs17lNN4R/pte2v7i3O/fQ9uuq/rxUdmLplBPQvLO5qAFZUJFre
 DfAuj+UjgzifzbLpoHz0GzEtX0dZlmwUPc248c31oOs6BwUs975ZxRvBGW7ANJvmruBdf3P5n7
 1DWlBSZtyY3PCtCOqU6G2PR9Fjzhvat1qk08CqQxRAbkOqvNp/WqABS6i4knmtK/6ywc0i1ajS
 /VE=
X-SBRS: 2.7
X-MesageID: 5725126
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5725126"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 10:47:35 +0100
Message-ID: <20190913094741.31451-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v10 0/6] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIHJldmlzaW9ucyBvZiB0aGUgcmVtYWluaW5nIHVuY29tbWl0dGVkIHBhdGNoZXMg
ZnJvbSBteQpwcmV2aW91cyBzZXJpZXM6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDE3MzcuaHRtbAoKUGF1bCBEdXJyYW50
ICg2KToKICBkb21haW46IGludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl9pb21tdSBmbGFnCiAgdXNl
IGlzX2lvbW11X2VuYWJsZWQoKSB3aGVyZSBhcHByb3ByaWF0ZS4uLgogIHN5c2N0bCAvIGxpYnhs
OiByZXBvcnQgd2hldGhlciBJT01NVS9IQVAgcGFnZSB0YWJsZSBzaGFyaW5nIGlzCiAgICBzdXBw
b3J0ZWQKICByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFn
ZSB0YWJsZXMKICBpb21tdTogdGlkeSB1cCBpb21tdV91c2VfaGFwX3B0KCkgYW5kIG5lZWRfaW9t
bXVfcHRfc3luYygpIG1hY3JvcwogIGludHJvZHVjZSBhICdwYXNzdGhyb3VnaCcgY29uZmlndXJh
dGlvbiBvcHRpb24gdG8geGwuY2ZnLi4uCgogZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAg
ICAgICAgICAgICAgfCAgNTYgKysrKysrCiB0b29scy9saWJ4bC9saWJ4bC5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyMyArKysKIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgICAgICAgICAg
IHwgICA5ICsKIHRvb2xzL2xpYnhsL2xpYnhsX21lbS5jICAgICAgICAgICAgICAgICAgIHwgICA2
ICstCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgICAgICAgICAgICAgICB8ICAgOSArCiB0
b29scy9saWJ4bC9saWJ4bF91dGlscy5jICAgICAgICAgICAgICAgICB8ICAxNSArKwogdG9vbHMv
bGlieGwvbGlieGxfdXRpbHMuaCAgICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1sICAgICAgICAgICAgfCAgIDYgKwogdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsLm1saSAgICAgICAgICAgfCAgIDcgKwogdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5j
dHJsX3N0dWJzLmMgICAgICAgfCAgMTYgKy0KIHRvb2xzL3hsL3hsX2luZm8uYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA1ICstCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgICAgICAg
ICAgICAgICB8IDE3MiArKysrKysrKysrKysrLS0tLS0tCiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAg
ICAgICAgICAgICAgICB8ICAxNyArLQogeGVuL2FyY2gvYXJtL3AybS5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAgICAg
ICAgIHwgICAzICsKIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgICAgICAgICAgIHwg
ICA0ICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQogeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhl
bi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICAgICAgICAgIHwgIDMxICsrLS0KIHhlbi9h
cmNoL3g4Ni9odm0vbXRyci5jICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiB4ZW4vYXJjaC94
ODYvaHZtL3Zpb2FwaWMuYyAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2
bS92bXgvdm1jcy5jICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14
L3ZteC5jICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYyAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyAgICAg
ICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgICAg
ICAgICAgIHwgICA0ICstCiB4ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgICAgICAgICAgICAgfCAgIDIgKy0K
IHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICstCiB4ZW4v
Y29tbW9uL21lbW9yeS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2NvbW1v
bi9zeXNjdGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogeGVuL2NvbW1vbi92bV9l
dmVudC5jICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL0tjb25maWcgICAgICAgICAgIHwgICAzICsKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9ndWVzdC5jIHwgICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9t
bXVfaW5pdC5jICB8ICAgNSArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUu
YyAgICAgfCAgMTggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMgICAgICAgICAgICAg
IHwgICA4ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jICAgICAgICAgICB8IDE5
OCArKysrKysrKy0tLS0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAg
ICAgICAgICAgICB8ICAyOCArLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
ICAgICAgIHwgIDE4ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L2h2bS5jICAg
ICB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAgfCAg
OTkgKy0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgICAgICAgICAg
IHwgICAzIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaCAgICAgICAgICAgICAgIHwgIDE1
ICstCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICAgICAgICAgICB8ICAxNSArLQog
eGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgICAgICAgICAgICAgfCAgIDYgKy0KIHhlbi9p
bmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAgICAgICAgICAgIHwgIDQ2ICsrLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgICAgICAgICB8ICAxMyArLQogeGVuL3hzbS9mbGFz
ay9ob29rcy5jICAgICAgICAgICAgICAgICAgICAgfCAgMTggKy0KIDUyIGZpbGVzIGNoYW5nZWQs
IDUyMyBpbnNlcnRpb25zKCspLCA0MTkgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgpDYzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRp
Z0BjaXRyaXguY29tPgpDYzogRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz4KQ2M6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEp1biBOYWth
amltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgpDYzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KQ2M6
ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBTdXJhdmVlIFN1dGhpa3VscGFu
aXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDYzogVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBWb2xv
ZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
