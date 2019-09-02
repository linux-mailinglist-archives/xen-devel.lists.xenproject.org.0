Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D3A59C7
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:52:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4new-0006Mj-Iw; Mon, 02 Sep 2019 14:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4nev-0006Me-Dr
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:50:21 +0000
X-Inumbo-ID: fba3eb9e-cd90-11e9-ac23-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fba3eb9e-cd90-11e9-ac23-bc764e2007e4;
 Mon, 02 Sep 2019 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567435820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jbArda7kHeA8peOxEZTKM/dqWNbrx2ngZObfgQ+XtqY=;
 b=igBHA0GK9sYUDU37ZZoDMd7wjkinXcsVgRhgNrQziSSs8pUv5L8O64of
 slSi4ooAteDg77WEKwL/+FTGAwtcgjwF2uMHqiroTMqo0/y02CrfYRxoX
 grIwxK6uEjnSF34D9Ealii1fNJi4+ML4KbSKpygrGa+w4FcJJSLZiq+ov c=;
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
IronPort-SDR: 36LCxgQIhmKKLC9uwPiAohQiadZ7UUHH82qTJbVRqKlkMtN/GyRtKOdChkUzrS+aNNe6yI8rTI
 NXUuIIV3kyTUSiCNGt2oddVYE4JelRRE6SgJgNa54PIaxPtcjvPbNTcm8s67BP6LSwyTSMF5LI
 iaLgnX8W/Z0FtfAKB9DR/RzHtyRidcTTuKAh/wNeiFV3gVQ+vmyyQz7SK6iTNFZCYUckqEtLpw
 P9X7Ajrunzbh3xrDY57GPn5D+6XHQ+czL6HQThMwYJYRf9uQS8WF3qe/zbzjoz/fp5zzgMvIiH
 Qf4=
X-SBRS: 2.7
X-MesageID: 5020240
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5020240"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 15:50:08 +0100
Message-ID: <20190902145014.36442-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 0/6] add per-domain IOMMU control
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIHJldmlzaW9ucyBvZiB0aGUgcmVtYWluaW5nIHVuY29tbWl0dGVkIHBhdGNoZXMg
ZnJvbSBteQpwcmV2aW91cyBzZXJpZXM6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDE3MzcuaHRtbAoKUGF1bCBEdXJyYW50
ICg2KToKICB4ODYvZG9tYWluOiByZW1vdmUgdGhlICdvb3Nfb2ZmJyBmbGFnCiAgZG9tYWluOiBp
bnRyb2R1Y2UgWEVOX0RPTUNUTF9DREZfaW9tbXUgZmxhZwogIHVzZSBpc19pb21tdV9lbmFibGVk
KCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4KICByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1
Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMKICBpb21tdTogdGlkeSB1cCBpb21tdV91c2VfaGFw
X3B0KCkgYW5kIG5lZWRfaW9tbXVfcHRfc3luYygpIG1hY3JvcwogIGludHJvZHVjZSBhICdwYXNz
dGhyb3VnaCcgY29uZmlndXJhdGlvbiBvcHRpb24gdG8geGwuY2ZnLi4uCgogZG9jcy9tYW4veGwu
Y2ZnLjUucG9kLmluICAgICAgICAgICAgICAgICAgfCAgNTIgKysrKysrKwogdG9vbHMvbGlieGwv
bGlieGwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKwogdG9vbHMvbGlieGwvbGlieGxf
Y3JlYXRlLmMgICAgICAgICAgICAgICAgfCAgIDkgKysKIHRvb2xzL2xpYnhsL2xpYnhsX21lbS5j
ICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwg
ICAgICAgICAgICAgICB8ICAgOCArCiB0b29scy9saWJ4bC9saWJ4bF91dGlscy5jICAgICAgICAg
ICAgICAgICB8ICAxNSArKwogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuaCAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAgICAgICAgfCAg
MTIgKy0KIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgICAgICAgICAgIHwgIDEyICst
CiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgICAgICB8ICAxNSArLQogdG9v
bHMveGwveGxfcGFyc2UuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNDUgKysrKysrKysrKyst
LS0tLS0KIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgIHwgIDEwICst
CiB4ZW4vYXJjaC9hcm0vcDJtLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVu
L2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogeGVuL2FyY2gv
eDg2L2RvbTBfYnVpbGQuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9k
b21haW4uYyAgICAgICAgICAgICAgICAgICAgIHwgICA5ICstCiB4ZW4vYXJjaC94ODYvZG9tY3Rs
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAg
ICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIHhlbi9hcmNoL3g4Ni9odm0vbXRyci5jICAgICAg
ICAgICAgICAgICAgIHwgICA1ICstCiB4ZW4vYXJjaC94ODYvaHZtL3Zpb2FwaWMuYyAgICAgICAg
ICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jICAgICAgICAgICAg
ICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyAgICAgICAgICAgICB8ICAgMiAr
LQogeGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhl
bi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vYXJj
aC94ODYvbW0vcGFnaW5nLmMgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2
L21tL3NoYWRvdy9jb21tb24uYyAgICAgICAgICAgfCAgIDcgKy0KIHhlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvbm9uZS5jICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMyArCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgICAg
ICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTYgKy0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMgfCAgIDIg
Ky0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgICAgIHwgIDE4ICstLQog
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYyAgICAgICAgICAgICAgfCAgIDggKy0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAgICAgICAgIHwgMTgwICsrKysrKystLS0tLS0t
LS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICAgICAgICAgIHwgIDI4
ICstLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgIHwgIDEyICst
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L2h2bS5jICAgICB8ICAgMiArLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAgfCAgOTkgKy0tLS0tLS0tLS0t
CiB4ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmggICAgICAgICAgICAgICB8ICAgMyAtCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2RvbWFpbi5oICAgICAgICAgICAgICB8ICAgMSAtCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2lvbW11LmggICAgICAgICAgICAgICB8ICAxNyArLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9zaGFkb3cuaCAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaCAgICAgICAgICAgICAgIHwgIDEwICstCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAg
ICAgICAgICAgICAgICAgICB8ICA0OCArKystLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAg
ICAgICAgICAgICAgICAgIHwgIDEzICstCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAg
ICAgICAgICAgICB8ICAxOCArLS0KIDQ5IGZpbGVzIGNoYW5nZWQsIDQzMyBpbnNlcnRpb25zKCsp
LCA0MDkgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
PgpDYzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpDYzog
RGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1h
QGludGVsLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KQ2M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CkNj
OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogU3VyYXZlZSBTdXRoaWt1bHBh
bml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KQ2M6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXNAdGtsZW5neWVsLmNvbT4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogVm9s
b2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
