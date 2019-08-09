Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A48815F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 19:36:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw8lv-00088U-Kw; Fri, 09 Aug 2019 17:33:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AvL5=WF=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hw8lu-00088P-Kz
 for xen-devel@lists.xen.org; Fri, 09 Aug 2019 17:33:46 +0000
X-Inumbo-ID: d4dd131f-bacb-11e9-8980-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.89]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d4dd131f-bacb-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 17:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/1EqsmuCpP5Egs6jwHuBlGMWlfPmoei8U5QtUssqxzTWFXMRp6+qZjZ1OuA8s0tyVgxDiqDQxNyDi+JA9OokaWY75647NmxNd0M4DXQsFIZkGVH4c6pfc9qUsPXNSiyK+vwGMs3OJjE8AFYHpK10wGHrxHx0udrMa9gGqP1u25rlobpuuRANkhmEm9ggDG+IhK+OWfNqZdoYJIfwtpQz11yTmGOkJmWLg2HfmlEpUY07kt4ZfS6ABUuOUpb74crJJ1zK3B9X9t6ATyArhCEEtPh3Uf5lw3In7zwNXyq1EvDGuN3/2r+//rThT6xUzzIfFAoF5emXtEKdWRvAICQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWtFnyJJpyMOcKUC4Gr1rlvK0XxtLkiJK4EwXuouD90=;
 b=WzDTjpUKyDOFLsKJ2cU5VA3gqw1aECSe7ynO+yqLSQSzENGcZMlli8JsZ9zuWWoKbR4jadAwHhJ1DFKnFqatoxi7WTcCbxpWRKpbMYwIyEfGAghxgDK32QUMr7RvCWChr0gE3gqbTrwGwV+uXARx5qwfCigvuVzMaaF3hufxiHekarJ8wmoH5Pn06p8nRMh+9aS827gEkYR8n66PVVLpBP7Y0wxY0CqQoXIkjn4l0QpU2UDoVQ2qGyah+0GxfNGS/4zqHRmDmpI0awPPlOKr/zkuAKsNefSY6800G0gHCTiAyROzoEEtlDVVIl9jy/2094+i43qOpSH4OSSdusmUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWtFnyJJpyMOcKUC4Gr1rlvK0XxtLkiJK4EwXuouD90=;
 b=huuCmLoIcBzQMfKEFED8BaoFmhY0Aag5bNrUJ/T39lh6Q68ET4J7eOBHdQbNwQFmtfJZWsMtkQ0SG8HeclVN5rFwMUPZ3IHPjda9Lydrv0ZAmt1YM9xLUAVLwzAcNkvR182beC3v0dI7eEroUHvCF86VExibvX/DSuOKpXWoml2bwh6UpXLvXY/Hq+rjspSfkeWEBKgZ0D5s+DINBVGTSTv2XOLQtaRabhFkceGCZyh9uKyJ3PM2X9DzdyhCZfndt1YI5PCNAjfLtMuAEIsawouqtSP1zbn/SBpWlUJsDaLhcrUEyI5FVTl3OfDW59kHyz5AXxmJmYZLiAMGiMIo1A==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6018.eurprd03.prod.outlook.com (10.255.30.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 17:33:41 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 17:33:41 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v3 1/6] xen/arm: introduce handle_interrupts
Thread-Index: AQHVTj7KzpUXXywUoU2ZhjZPPLmT4qbzFKwA
Date: Fri, 9 Aug 2019 17:33:40 +0000
Message-ID: <87o90ygs5n.fsf@epam.com>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-1-sstabellini@kernel.org>
In-Reply-To: <20190808231242.26424-1-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 942f15f0-b2d6-4daa-7791-08d71cefb849
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6018; 
x-ms-traffictypediagnostic: AM0PR03MB6018:|AM0PR03MB6018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB6018A8149D1A7840F1721D9DE6D60@AM0PR03MB6018.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(189003)(76116006)(6486002)(55236004)(229853002)(66556008)(66446008)(64756008)(66476007)(91956017)(86362001)(186003)(14454004)(486006)(66946007)(316002)(102836004)(76176011)(7736002)(6506007)(3846002)(305945005)(25786009)(36756003)(26005)(6116002)(8676002)(5660300002)(53936002)(71200400001)(71190400001)(81166006)(4326008)(6512007)(8936002)(81156014)(256004)(80792005)(6246003)(54906003)(6436002)(11346002)(2616005)(476003)(66066001)(446003)(99286004)(478600001)(6916009)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6018;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RCXPc/yNW1KOCmEUfmHmbPFCSEs0m11cY67AkKARcjiIbwadilslSMyKHuox2FW6XCQfQ8xYeO6TCoZ98alZ4Szl5uco7NP7WqaI1ZMEvLQ+HvDnl5UND1x7sVhboyZ9xyZNVBGObzLiB+TMEC4eTR+7d7dlzvhXs+YWnKWvo1pvTxfFuEvLvuZ2HyCvWFHL6Wm5EgeRT3UZT5i0AeZjfR6VJc0UI3B+uRztULrIEjgzVPeV3IVdv4E9ad1zkUjf/JND4UhkJQTh7cV0eW6g9/EbpWWhe/LcwQkLU4fdKQmaFOpmHJv6CvDQUa7LjIUU51LSgP8psnUS/jy+bkZz8CN/4ssXmLQd4sk/XVFPmSjBg6BDkoAJYu5keM/IPx5TqUdaq6tlie72okgVwy+HQJlm0zJ0Tt4o6UCRPKNT+JI=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942f15f0-b2d6-4daa-7791-08d71cefb849
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 17:33:40.9700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TweVLdIWGw8Mlk6H2OwlNMmXgsjjDEkhWJuW/tC1NMSb2X8nGLcEWAxGFsUaUz0JjEnzBEZ2MSQyQ62V5cz+FqYAg4r5o7HgIYjDihUiQXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6018
Subject: Re: [Xen-devel] [PATCH v3 1/6] xen/arm: introduce handle_interrupts
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Achin.Gupta@arm.com" <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIFN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBNb3ZlIHRoZSBp
bnRlcnJ1cHQgaGFuZGxpbmcgY29kZSBvdXQgb2YgaGFuZGxlX2RldmljZSB0byBhIG5ldyBmdW5j
dGlvbgo+IHNvIHRoYXQgaXQgY2FuIGJlIHJldXNlZCBmb3IgZG9tMGxlc3MgVk1zIGxhdGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
Pgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBhZGQgcGF0Y2gKPgo+IFRoZSBkaWZmIGlzIGhh
cmQgdG8gcmVhZCBidXQgSSBqdXN0IG1vdmVkIHRoZSBpbnRlcnJ1cHRzIHJlbGF0ZWQgY29kZQo+
IGZyb20gaGFuZGxlX2RldmljZXMgdG8gYSBuZXcgZnVuY3Rpb24gaGFuZGxlX2ludGVycnVwdHMs
IGFuZCB2ZXJ5IGxpdHRsZQo+IGVsc2UuCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYwo+IGluZGV4IDRjODQwNDE1NWEuLjAwZGRiM2IwNWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4gQEAgLTEyMjAsNDEgKzEyMjAsMTkgQEAgc3RhdGljIGludCBfX2luaXQgbWFwX2RldmljZV9j
aGlsZHJlbihzdHJ1Y3QgZG9tYWluICpkLAo+ICB9Cj4KPiAgLyoKPiAtICogRm9yIGEgZ2l2ZW4g
ZGV2aWNlIG5vZGU6Cj4gLSAqICAtIEdpdmUgcGVybWlzc2lvbiB0byB0aGUgZ3Vlc3QgdG8gbWFu
YWdlIElSUSBhbmQgTU1JTyByYW5nZQo+IC0gKiAgLSBSZXRyaWV2ZSB0aGUgSVJRIGNvbmZpZ3Vy
YXRpb24gKGkuZSBlZGdlL2xldmVsKSBmcm9tIGRldmljZSB0cmVlCj4gLSAqIFdoZW4gdGhlIGRl
dmljZSBpcyBub3QgbWFya2VkIGZvciBndWVzdCBwYXNzdGhyb3VnaDoKPiAtICogIC0gQXNzaWdu
IHRoZSBkZXZpY2UgdG8gdGhlIGd1ZXN0IGlmIGl0J3MgcHJvdGVjdGVkIGJ5IGFuIElPTU1VCj4g
LSAqICAtIE1hcCB0aGUgSVJRcyBhbmQgaW9tZW0gcmVnaW9ucyB0byBET00wCj4gKyAqIFJldHVy
bjoKPiArICogICA8IDAgb24gZXJyb3IKPiArICogICAwICAgb24gbm8gbWFwcGluZyByZXF1aXJl
ZAo+ICsgKiAgIDEgICBJUlEgbWFwcGluZyBkb25lCj4gICAqLwpBcmUgdGhpcyBzdWNoIHJldHVy
bnMgdmFsdWVzIHJlYWxseSBuZWVkZWQ/IEkgZG9uJ3Qgc2VlIGFueSBjb2RlIHRoYXQKZGVwZW5k
cyBvbiByZXR1cm4gdmFsdWUgMCBvciAxLgoKPiAtc3RhdGljIGludCBfX2luaXQgaGFuZGxlX2Rl
dmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQpCj4gK3N0YXRpYyBp
bnQgX19pbml0IGhhbmRsZV9pbnRlcnJ1cHRzKHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfbWFwcGluZykK
PiAgewo+IC0gICAgdW5zaWduZWQgaW50IG5pcnE7Cj4gLSAgICB1bnNpZ25lZCBpbnQgbmFkZHI7
Cj4gLSAgICB1bnNpZ25lZCBpbnQgaTsKPiAtICAgIGludCByZXM7Cj4gKyAgICBpbnQgaSwgbmly
cSwgcmVzOwo+ICAgICAgc3RydWN0IGR0X3Jhd19pcnEgcmlycTsKPiAtICAgIHU2NCBhZGRyLCBz
aXplOwo+IC0gICAgYm9vbCBuZWVkX21hcHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNzdGhyb3Vn
aChkZXYpOwo+Cj4gICAgICBuaXJxID0gZHRfbnVtYmVyX29mX2lycShkZXYpOwo+IC0gICAgbmFk
ZHIgPSBkdF9udW1iZXJfb2ZfYWRkcmVzcyhkZXYpOwo+IC0KPiAtICAgIGR0X2RwcmludGsoIiVz
IHBhc3N0aHJvdWdoID0gJWQgbmlycSA9ICVkIG5hZGRyID0gJXVcbiIsCj4gLSAgICAgICAgICAg
ICAgIGR0X25vZGVfZnVsbF9uYW1lKGRldiksIG5lZWRfbWFwcGluZywgbmlycSwgbmFkZHIpOwo+
IC0KPiAtICAgIGlmICggZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChkZXYpICYmIG5lZWRfbWFwcGlu
ZyApCj4gLSAgICB7Cj4gLSAgICAgICAgZHRfZHByaW50aygiJXMgc2V0dXAgaW9tbXVcbiIsIGR0
X25vZGVfZnVsbF9uYW1lKGRldikpOwo+IC0gICAgICAgIHJlcyA9IGlvbW11X2Fzc2lnbl9kdF9k
ZXZpY2UoZCwgZGV2KTsKPiAtICAgICAgICBpZiAoIHJlcyApCj4gLSAgICAgICAgewo+IC0gICAg
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiRmFpbGVkIHRvIHNldHVwIHRoZSBJT01NVSBmb3Ig
JXNcbiIsCj4gLSAgICAgICAgICAgICAgICAgICBkdF9ub2RlX2Z1bGxfbmFtZShkZXYpKTsKPiAt
ICAgICAgICAgICAgcmV0dXJuIHJlczsKPiAtICAgICAgICB9Cj4gLSAgICB9Cj4KPiAgICAgIC8q
IEdpdmUgcGVybWlzc2lvbiBhbmQgbWFwIElSUXMgKi8KPiAgICAgIGZvciAoIGkgPSAwOyBpIDwg
bmlycTsgaSsrICkKPiBAQCAtMTI5MSw2ICsxMjY5LDQ3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhh
bmRsZV9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYs
Cj4gICAgICAgICAgICAgIHJldHVybiByZXM7Cj4gICAgICB9Cj4KPiArICAgIHJldHVybiAhIShu
ZWVkX21hcHBpbmcgJiYgcmVzID09IDApOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBGb3IgYSBnaXZl
biBkZXZpY2Ugbm9kZToKPiArICogIC0gR2l2ZSBwZXJtaXNzaW9uIHRvIHRoZSBndWVzdCB0byBt
YW5hZ2UgSVJRIGFuZCBNTUlPIHJhbmdlCj4gKyAqICAtIFJldHJpZXZlIHRoZSBJUlEgY29uZmln
dXJhdGlvbiAoaS5lIGVkZ2UvbGV2ZWwpIGZyb20gZGV2aWNlIHRyZWUKPiArICogV2hlbiB0aGUg
ZGV2aWNlIGlzIG5vdCBtYXJrZWQgZm9yIGd1ZXN0IHBhc3N0aHJvdWdoOgo+ICsgKiAgLSBBc3Np
Z24gdGhlIGRldmljZSB0byB0aGUgZ3Vlc3QgaWYgaXQncyBwcm90ZWN0ZWQgYnkgYW4gSU9NTVUK
PiArICogIC0gTWFwIHRoZSBJUlFzIGFuZCBpb21lbSByZWdpb25zIHRvIERPTTAKPiArICovCj4g
K3N0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IGR0X2RldmljZV9ub2RlICpkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cDJtX3R5cGVfdCBwMm10KQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgbmFkZHI7Cj4gKyAgICB1
bnNpZ25lZCBpbnQgaTsKPiArICAgIGludCByZXM7Cj4gKyAgICB1NjQgYWRkciwgc2l6ZTsKPiAr
ICAgIGJvb2wgbmVlZF9tYXBwaW5nID0gIWR0X2RldmljZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsK
PiArCj4gKyAgICBuYWRkciA9IGR0X251bWJlcl9vZl9hZGRyZXNzKGRldik7Cj4gKwo+ICsgICAg
ZHRfZHByaW50aygiJXMgcGFzc3Rocm91Z2ggPSAlZCBuYWRkciA9ICV1XG4iLAo+ICsgICAgICAg
ICAgICAgICBkdF9ub2RlX2Z1bGxfbmFtZShkZXYpLCBuZWVkX21hcHBpbmcsIG5hZGRyKTsKPiAr
Cj4gKyAgICBpZiAoIGR0X2RldmljZV9pc19wcm90ZWN0ZWQoZGV2KSAmJiBuZWVkX21hcHBpbmcg
KQo+ICsgICAgewo+ICsgICAgICAgIGR0X2RwcmludGsoIiVzIHNldHVwIGlvbW11XG4iLCBkdF9u
b2RlX2Z1bGxfbmFtZShkZXYpKTsKPiArICAgICAgICByZXMgPSBpb21tdV9hc3NpZ25fZHRfZGV2
aWNlKGQsIGRldik7Cj4gKyAgICAgICAgaWYgKCByZXMgKQo+ICsgICAgICAgIHsKPiArICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkZhaWxlZCB0byBzZXR1cCB0aGUgSU9NTVUgZm9yICVz
XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgZHRfbm9kZV9mdWxsX25hbWUoZGV2KSk7Cj4gKyAg
ICAgICAgICAgIHJldHVybiByZXM7Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICsKPiArICAgIHJl
cyA9IGhhbmRsZV9pbnRlcnJ1cHRzKGQsIGRldiwgbmVlZF9tYXBwaW5nKTsKPiArICAgIGlmICgg
cmVzIDwgMCApCj4gKyAgICAgICAgcmV0dXJuIHJlczsKPiArCj4gICAgICAvKiBHaXZlIHBlcm1p
c3Npb24gYW5kIG1hcCBNTUlPcyAqLwo+ICAgICAgZm9yICggaSA9IDA7IGkgPCBuYWRkcjsgaSsr
ICkKPiAgICAgIHsKCgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
