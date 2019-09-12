Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF225B0DB3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8N6p-0000gn-Rz; Thu, 12 Sep 2019 11:17:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8N6o-0000gI-J1
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:17:54 +0000
X-Inumbo-ID: f36b1b14-d54e-11e9-83e7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f36b1b14-d54e-11e9-83e7-12813bfff9fa;
 Thu, 12 Sep 2019 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568287069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f53zqDnHhy2Gs6scmW6PopSSHqgAcSbH1hSNSsKAOkk=;
 b=LzJfiCIHj4AH4wqUXhGLlLHrigWYKrRkCJsUOMA5wrmoqmngFeyK9K99
 WAiNa2dmUjKf001L3AvU7S2Hj01h1nJPMRD9MlC5lJtwYHwYNLpxUeTf5
 eueVGUH1FEYaC9nX59RCu2Y+lTbKgtDc5vcbpY+yVTDXArat+IkRKov6a g=;
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
IronPort-SDR: lVdrWLaT9HjgWC6hhpLhihU8B6nFsLX5ejZGepzsZRubrwW/vwngZ8zGTXaY4wkzaE9EItLmeX
 C+FUM0mPMUov5mtDWS807Bwk7OI3+60QwReipXMrDqaYWx8BfT0PJhT54h6Yyez37JfWKYFTWJ
 mU2XeeJz9dS49cinWqP1icIXrLVJJtQYZ7IJBSwtIEfeZJQlN8jqyM+bJuVmTq3nKXpX14NkWb
 3ZvrECDu3XdBh21H5aLgcLclGVl1FdWDganBVfMU36ZA74iVsSB3T2p95Ae7wot2PHCqRuU1kp
 q2A=
X-SBRS: 2.7
X-MesageID: 5475830
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5475830"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 12:17:38 +0100
Message-ID: <20190912111744.40410-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v9 0/6] add per-domain IOMMU control
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
ICg2KToKICBkb21haW46IGludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl9pb21tdSBmbGFnCiAgdXNl
IGlzX2lvbW11X2VuYWJsZWQoKSB3aGVyZSBhcHByb3ByaWF0ZS4uLgogIHN5c2N0bCAvIGxpYnhs
OiByZXBvcnQgd2hldGhlciBJT01NVS9IQVAgcGFnZSB0YWJsZSBzaGFyaW5nIGlzCiAgICBzdXBw
b3J0ZWQKICByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFn
ZSB0YWJsZXMKICBpb21tdTogdGlkeSB1cCBpb21tdV91c2VfaGFwX3B0KCkgYW5kIG5lZWRfaW9t
bXVfcHRfc3luYygpIG1hY3JvcwogIGludHJvZHVjZSBhICdwYXNzdGhyb3VnaCcgY29uZmlndXJh
dGlvbiBvcHRpb24gdG8geGwuY2ZnLi4uCgogZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAg
ICAgICAgICAgICAgfCAgNTYgKysrKysrKwogdG9vbHMvbGlieGwvbGlieGwuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKwogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMjMgKysrCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICAgICAgICAgICAg
ICB8ICAgOSArKwogdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgICAgICAgICAgICAgICAgICAgfCAg
IDYgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCAgICAgICAgICAgICAgIHwgICA5ICsr
CiB0b29scy9saWJ4bC9saWJ4bF91dGlscy5jICAgICAgICAgICAgICAgICB8ICAxNSArKwogdG9v
bHMvbGlieGwvbGlieGxfdXRpbHMuaCAgICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMvb2Nh
bWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAgICAgICAgfCAgIDYgKwogdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1saSAgICAgICAgICAgfCAgIDYgKwogdG9vbHMvb2NhbWwvbGlicy94Yy94
ZW5jdHJsX3N0dWJzLmMgICAgICAgfCAgMTYgKy0KIHRvb2xzL3hsL3hsX2luZm8uYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA1ICstCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDE3MiArKysrKysrKysrKysrKy0tLS0tLQogeGVuL2FyY2gvYXJtL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAg
ICAgICAgICAgICAgICAgICAgfCAgMTcgKy0KIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMyArCiB4ZW4vYXJjaC9hcm0vc3lzY3RsLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAgMyArCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICAgICAgICB8ICAg
NCArLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0K
IHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4v
YXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gv
eDg2L2h2bS9tdHJyLmMgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9hcmNoL3g4Ni9o
dm0vdmlvYXBpYy5jICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bWNzLmMgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5j
ICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jICAgICAgICAg
ICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgICAgICAg
ICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYyAgICAgICAgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
CiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiB4ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2NvbW1v
bi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKy0KIHhlbi9jb21tb24vbWVt
b3J5LmMgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL3ZtX2V2ZW50
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
S2NvbmZpZyAgICAgICAgICAgfCAgIDMgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2d1ZXN0LmMgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVl
LmMgICAgIHwgIDE4ICstLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYyAgICAgICAgICAg
ICAgfCAgIDggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAgICAgICAgIHwg
MTg4ICsrKysrKystLS0tLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5j
ICAgICAgICAgICAgIHwgIDI4ICstLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jICAgICAgIHwgIDEyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L2h2bS5j
ICAgICB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAg
fCAgOTkgKy0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmggICAgICAgICAg
ICAgICB8ICAgMyAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmggICAgICAgICAgICAgICB8
ICAxNSArLQogeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgICAgICAgfCAgMTUg
Ky0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCAgICAgICAgICAgICAgIHwgICA2ICstCiB4
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgICAgICB8ICA0NCArKy0tLQogeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KIHhlbi94c20v
Zmxhc2svaG9va3MuYyAgICAgICAgICAgICAgICAgICAgIHwgIDE4ICstLQogNTIgZmlsZXMgY2hh
bmdlZCwgNDg5IGluc2VydGlvbnMoKyksIDQxMCBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4u
bGluZGlnQGNpdHJpeC5jb20+CkNjOiBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPgpDYzog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogSnVu
IE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CkNjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29t
PgpDYzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+CkNjOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4yMC4xLjIuZ2IyMWViYjY3
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
