Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BDBDA10
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 10:43:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD2qY-0007w9-Mx; Wed, 25 Sep 2019 08:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6irf=XU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iD2qW-0007w4-J7
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 08:40:24 +0000
X-Inumbo-ID: 1ca7c13a-df70-11e9-962c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 1ca7c13a-df70-11e9-962c-12813bfff9fa;
 Wed, 25 Sep 2019 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569400823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NuQIlWHihiDrnNNI95FebJ6kkdnQCKy2OEsJtUcR38E=;
 b=VqTwSsyFN69MwlgaB48PK6DU9AU+AhjqP3Unxd7owRjkzBGm/k0FC7tv
 /NW9+LsWLxyUjwKxIT6+13dXZu7x5KOrZbmGIVmcAOyb+5sZ0+hOfO4Zu
 NkvYRQcE9dQKxv3OYTwPFmFy/s+SfZ+73MQwO3+pVUadClgI9oKxwCm1m g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: d57QBUyqImpP5vTVV9EEjc/jJmLy3vLYUfc/2BF4xGtxQrQjAmzY28k0aHjVg8u00MeEymAz7O
 xAx53gmVwx06Rgokb2GPVDtw/vPMhn1CRIzlRQ/y7F70X10da4lYo3bdBzg/CbkTS63qyThIqJ
 aozzcSytb7FJ7nDfUscc+e/uYuvMKnbMvQE05hXEcebkiGbp9OPgaYxVqG1JJfi2shyUj3Lpap
 hJwpHgBzytb7J4LNShUlpcE6Pxc83eihQpXM1aLArcKWPRPhGsv+v2KDOeCKMoQC+pGUuFa9GT
 /n0=
X-SBRS: 2.7
X-MesageID: 6101172
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6101172"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw
Date: Wed, 25 Sep 2019 08:40:16 +0000
Message-ID: <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
In-Reply-To: <20190918104113.3294-1-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8gSSBkb24ndCB0aGluayB0aGlzIHNlcmllcyBpcyBhd2FpdGluZyBhbnkgbW9yZSBhY2tz
Lg0KDQogIFBhdWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiBTZW50OiAxOCBTZXB0ZW1iZXIg
MjAxOSAxMTo0MQ0KPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkDQo+IDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47DQo+IElhbiBKYWNrc29uIDxJYW4uSmFja3Nv
bkBjaXRyaXguY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPjsgUGV0cmUgUGlyY2FsYWJ1DQo+IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkN
Cj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47DQo+IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+
IFN1YmplY3Q6IFtQQVRDSCB2MTMgMC80XSBhZGQgcGVyLWRvbWFpbiBJT01NVSBjb250cm9sDQo+
IA0KPiBUaGVzZSBhcmUgdGhlIHJlbWFpbmluZyB1bmNvbW1pdHRlZCBwYXRjaGVzIGZyb20gbXkg
cHJldmlvdXMgc2VyaWVzOg0KPiANCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAxMjA4Lmh0bWwNCj4gDQo+IFRoZSBvbmx5
IHBhdGNoIHRoYXQgaGFzIGJlZW4gcmV2aXNlZCBpcyBwYXRjaCAjNCAocHJldmlvdXNseSBwYXRj
aCAjNikuDQo+IA0KPiBJYW4gSmFja3NvbiAoMSk6DQo+ICAgdG9vbHMvb2NhbWw6IGFiaSBjaGVj
azogQ29wZSB3aXRoIGNvbnNlY3V0aXZlIHJlbGV2YW50IGVudW1zDQo+IA0KPiBQYXVsIER1cnJh
bnQgKDMpOg0KPiAgIHJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0cnVjdGlvbiBvZiBJT01N
VSBwYWdlIHRhYmxlcw0KPiAgIGlvbW11OiB0aWR5IHVwIGlvbW11X3VzZV9oYXBfcHQoKSBhbmQg
bmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zDQo+ICAgaW50cm9kdWNlIGEgJ3Bhc3N0aHJvdWdo
JyBjb25maWd1cmF0aW9uIG9wdGlvbiB0byB4bC5jZmcuLi4NCj4gDQo+ICBkb2NzL21hbi94bC5j
ZmcuNS5wb2QuaW4gICAgICAgICAgICAgIHwgIDU3ICsrKysrKysrKw0KPiAgdG9vbHMvbGlieGwv
bGlieGwuaCAgICAgICAgICAgICAgICAgICB8ICAxNiArKysNCj4gIHRvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jICAgICAgICAgICAgfCAgMzAgKysrKy0NCj4gIHRvb2xzL2xpYnhsL2xpYnhsX21l
bS5jICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlk
bCAgICAgICAgICAgfCAgIDkgKysNCj4gIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMgICAgICAg
ICAgICAgfCAgMTUgKysrDQo+ICB0b29scy9saWJ4bC9saWJ4bF91dGlscy5oICAgICAgICAgICAg
IHwgICAxICsNCj4gIHRvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrICAgICAgICAgfCAgMTcg
Ky0tDQo+ICB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICAgIHwgICA0ICsNCj4g
IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgICAgICAgfCAgIDUgKw0KPiAgdG9vbHMv
b2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgICB8ICAxNyArKy0NCj4gIHRvb2xzL3hsL3hs
X3BhcnNlLmMgICAgICAgICAgICAgICAgICAgfCAxNzggKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0NCj4gIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAg
eGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgICAgICAgICB8ICAxMCArLQ0KPiAgeGVuL2Fy
Y2gvYXJtL3AybS5jICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgeGVuL2FyY2gveDg2
L2RvbTBfYnVpbGQuYyAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L2RvbWFp
bi5jICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9tdHJyLmMg
ICAgICAgICAgICAgICB8ICAgNSArLQ0KPiAgeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMg
ICAgICAgICB8ICAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgICAg
ICB8ICAgNCArLQ0KPiAgeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgICAgICB8ICAg
MiArLQ0KPiAgeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgICAgICAgICB8ICAgMiArLQ0K
PiAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+ICB4ZW4v
Y29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgICAgICAgIHwgIDEzIC0tDQo+ICB4ZW4vY29tbW9u
L21lbW9yeS5jICAgICAgICAgICAgICAgICAgIHwgICA0ICstDQo+ICB4ZW4vY29tbW9uL3ZtX2V2
ZW50LmMgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9LY29uZmlnICAgICAgIHwgICAzICsNCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Rldmlj
ZV90cmVlLmMgfCAgMTEgLS0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAg
ICAgfCAxNDcgKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYyAgICAgICAgIHwgIDEyIC0tDQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuYyAgIHwgIDEwICstDQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUu
YyAgIHwgIDk3IC0tLS0tLS0tLS0tLS0tDQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11Lmgg
ICAgICAgICAgIHwgICAzIC0NCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaCAgICAgICAg
ICAgfCAgIDQgLQ0KPiAgeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgICB8ICAx
MCArLQ0KPiAgeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAgICB8ICA0MCArKyst
LS0NCj4gIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICAgfCAgIDggLS0NCj4g
IDM3IGZpbGVzIGNoYW5nZWQsIDM4OCBpbnNlcnRpb25zKCspLCAzNzAgZGVsZXRpb25zKC0pDQo+
IC0tLQ0KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4g
Q2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiBDYzogRGF2
aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz4NCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAZXUuY2l0cml4LmNvbT4NCj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPg0KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPg0KPiBDYzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4NCj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IENjOiBUaW0gRGVlZ2FuIDx0aW1A
eGVuLm9yZz4NCj4gQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IC0tDQo+IDIuMjAuMS4yLmdiMjFl
YmI2NzENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
