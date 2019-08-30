Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1CBA329F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3cIH-00065t-ND; Fri, 30 Aug 2019 08:30:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0MMg=W2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3cIG-00064o-G1
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 08:30:04 +0000
X-Inumbo-ID: 5a43b7a8-cb00-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a43b7a8-cb00-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567153800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q18AB+b0Ue54LY/ie2ZdgIeH6trz7v3XxbS9KiBIbuo=;
 b=aMDmk58GG9jQjiro1hRTX5V+9aS3PU4rPTcSYSyl/jnnqKoB2vNfD4DF
 AiNnjPoZ3ZiiCvV6TSXorqZlkN5r5Geyovmh1tDoVA0Cao2B/7g587EC6
 NVkMK10oi8Tz1QNl0zpVZQwUmezaVI6687jH5Q2snNBKfLvOZjNXcCjr6 I=;
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
IronPort-SDR: L7PFwabbs6pLIIJZEE50OWcTj1pe58vKkLtIRnl1YTdcn6U8/OLYeG/kJ1f+hsVJ51iIp66DTN
 eYBO9mul7MVJDWcAqaUkHYS+huUKfm3TewtDWi9gaY51HPrAgcuM0GE3BYAsAUgm2TUsyKSbsU
 xIyKGhT2acfmCT5FQNcWO83zhGuP0ohWwcdgQy7M/s2FkN4dTKuxMZB9/dBaBU/ZxKGq5kIZt3
 AfgIgiMEd2tDzNYTJCnesdnhdaFMLQYavNBRhnZoA8IDe5mcLUCdlNLpk2Bry1hXWDz9cL9HKn
 eVU=
X-SBRS: 2.7
X-MesageID: 4925069
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,446,1559534400"; 
   d="scan'208";a="4925069"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 30 Aug 2019 09:29:47 +0100
Message-ID: <20190830082953.2192-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 0/6] add per-domain IOMMU control
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
b21haW4uYyAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvZG9tY3Rs
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
ICAgICAgICAgfCAgMzAgKysrLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDQgKy0KIHhlbi9jb21tb24vdm1fZXZlbnQuYyAgICAgICAgICAgICAgICAgICAg
IHwgICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZ3Vlc3QuYyB8ICAg
MiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYyAgICAgfCAgMTggKy0t
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jICAgICAgICAgICAgICB8ICAgOCArLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyAgICAgICAgICAgfCAxODAgKysrKysrKy0tLS0t
LS0tLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICAgICAgfCAg
MjggKy0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAgICAgfCAgMTIg
Ky0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC94ODYvaHZtLmMgICAgIHwgICAyICstCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAgICAgICB8ICA5OSArLS0tLS0tLS0t
LS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgICAgICAgICAgIHwgICAzIC0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggICAgICAgICAgICAgIHwgICAxIC0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvaW9tbXUuaCAgICAgICAgICAgICAgIHwgIDE3ICstCiB4ZW4vaW5jbHVkZS9h
c20teDg2L3NoYWRvdy5oICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2luY2x1ZGUvcHVibGlj
L2RvbWN0bC5oICAgICAgICAgICAgICAgfCAgMTAgKy0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5o
ICAgICAgICAgICAgICAgICAgIHwgIDQ4ICsrKy0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
ICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAg
ICAgICAgICAgICAgIHwgIDE4ICstLQogNDkgZmlsZXMgY2hhbmdlZCwgNDM3IGluc2VydGlvbnMo
KyksIDQxMiBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CkNjOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CkNj
OiBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPgpDYzogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPgpDYzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4K
Q2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBTdXJhdmVlIFN1dGhpa3Vs
cGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDYzogVGFtYXMgSyBMZW5neWVs
IDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
