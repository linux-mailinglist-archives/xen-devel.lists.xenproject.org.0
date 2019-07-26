Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD776BAA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:30:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Cc-0003on-9A; Fri, 26 Jul 2019 14:28:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hr1Ca-0003oe-GI
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:28:08 +0000
X-Inumbo-ID: 955f5811-afb1-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::61d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 955f5811-afb1-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3SVA0nNmP6uFgguitz3z3gsTe7c3VqVqFqGy6v5XZVXPe/s+Ssn/QrHAtj5VbR2BmtM+3Owm5W15gK5eHSzlmc1pS38Ob1xpf1e9EZwsXY0zdAC2/s7ENqtSrlhH8klPTEDHLaKp+q8fj74PDxCogVDt5mJOxai8BmXfr/Kz4uekdFjR1AKryGVkroEqnuyUfAxVv5fZzUztGPn+GuS1f+Ecs8ACiwcMo+bbiKTTQmbnn9+kosrLJM2jL785N5l7Fei6pcBw0V7jATTnRK9MuMOwZgkeMLctObADBEukuBZ50srCS6Pn21E2VM2ZetevyUWQjQevQCAND5Vh0bbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGG5xNZfcThoeZvm5Sm8eDSyEflhaFJJeYzIZNUj1nw=;
 b=JDJo5pCKuuwuEHsy9j5tqVoWrCHsO5BY/6HRJqhJ+O14QDIrD1h1KWccbEOhwOIOCsL3kXo222pNniu+UkVYG24Afhi3bbqdRdgEtwhrLHOYAM/Cgwp4vsULfNwIKQM44e6qmp6UC0LsQlpaNXUMrunahKLAfpBbGKGFFMo3oGS1su4tdf42ENBQ0b0tetzSCkUxZLo4YxbVTQ9T5JevweuTPfV4n8DaYcwGFx4IxRqAqi/CjLZ41xGD0yff1iuMcEOjfxyFQrTo1aTKjf57P26EgqPO0ZBHYV9tg2fq73soiNyGvGCRMpB7At2VEjAvotGK33TydaKPbg+tBqyD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGG5xNZfcThoeZvm5Sm8eDSyEflhaFJJeYzIZNUj1nw=;
 b=NoIn/UWoF9L1SmzpYr3FVTLC41fd1bwToDppb0TByxHaPiSlUS0EdM66jbXIvzn0hM9b768PlxMfnl9id1tyTka2cz8jE5X3twmoEGnDYgx5Bo6guUT/J6IbRc3qRRrsjHaY1byDCtz1TUwuWnW1GTnCpRJfTwV6vzrL2/4loGgzsRLb+4CUe6c21n/rNwEZRW8zU/J+CpgMdn1e5Kjq+z5S2cQvhXqUZwGxxE9Q+bXDBCDsGHB4/b6RAOSkd6BowKGtfPd4YevdNTpEpcw7rOdn/i7SuaBb3tCWR/hiUeUWm+bBYkPfNZfT486IpO9kQsvhDLGpkLBIq585ELkeEQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5700.eurprd03.prod.outlook.com (20.179.253.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 14:28:05 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:28:05 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 01/35] xen/arm64: macros: Introduce an assembly macro
 to alias x30
Thread-Index: AQHVQNYJDI/OfN/Uj0qAC6V0n+ChE6bc+v8A
Date: Fri, 26 Jul 2019 14:28:05 +0000
Message-ID: <87blxgj2ff.fsf@epam.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-2-julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-2-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17a9b710-ae5d-4da5-d16f-08d711d578f5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5700; 
x-ms-traffictypediagnostic: AM0PR03MB5700:
x-microsoft-antispam-prvs: <AM0PR03MB570017D7391F9F6247BF43ECE6C00@AM0PR03MB5700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(229853002)(81156014)(7736002)(8676002)(4326008)(305945005)(476003)(71190400001)(316002)(8936002)(81166006)(71200400001)(486006)(66476007)(5660300002)(66556008)(76116006)(76176011)(36756003)(6506007)(99286004)(186003)(54906003)(6116002)(55236004)(446003)(256004)(3846002)(66066001)(68736007)(91956017)(102836004)(14454004)(2906002)(80792005)(6486002)(26005)(11346002)(6916009)(478600001)(66946007)(64756008)(107886003)(66446008)(6512007)(25786009)(53936002)(6436002)(2616005)(86362001)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5700;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /ZdnJYCX412K5gM3KToDwNS1WbQF62BO1qhsWu7vdhZzs47Y8UDEH3q1zZ8VkCspOQIo6wqiVEvfAjDig7YDhzf5FITxO4cpVbq/e881ihviGQ1FTOfp0qEVoym/UdNZVALFcV/DTPfU3r8qH0UA/B4WjgRIWxBk/lrMXiGt/YNX1ra1UbFhHgmR01wEgrmt8gxhwafGLAnpkMK4kuuuEwV4t5dzn6jc7AkTdxUeOBAnIXnwU+XQN2XYTcgSRZoh5TNYuTlRqTQ7oPlj5y0k6uD7+yGl+EB4hJCecQ3fmk/HWhYVF2KHx3pEZsYpblKVS1ghco0SbWTs+UwSWpfqZ6fOhAHaiHEoSREJG1UPpAIK8+gGwwCdjgCWcTZg3SbOAMcNoOtkLnrRsTqm4kaNc14feIqvGiz961CJXhyQQyo=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a9b710-ae5d-4da5-d16f-08d711d578f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:28:05.0307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5700
Subject: Re: [Xen-devel] [PATCH v2 01/35] xen/arm64: macros: Introduce an
 assembly macro to alias x30
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpKdWxpZW4gR3JhbGwgd3JpdGVzOgoKPiBUaGUgcmV0dXJuIGFkZHJlc3Mgb2YgYSBmdW5jdGlv
biBpcyBhbHdheXMgc3RvcmVkIGluIHgzMC4gRm9yIGNvbnZlbmllbmNlLAo+IGludHJvZHVjZSBh
IHJlZ2lzdGVyIGFsaWFzIHNvICJsciIgY2FuIGJlIHVzZWQgaW4gYXNzZW1ibHkuCj4KPiBUaGlz
IGlzIGRlZmluZWQgaW4gYXNtLWFybS9hcm02NC9tYWNyb3MuaCB0byBhbGxvdyBhbGwgYXNzZW1i
bHkgZmlsZXMKPiB0byB1c2UgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9k
eW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAg
ICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyAg
ICAgICAgIHwgNSAtLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L21hY3Jvcy5oIHwg
NSArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyBiL3hlbi9hcmNo
L2FybS9hcm02NC9lbnRyeS5TCj4gaW5kZXggOTdiMDVmNTNlYS4uMmQ5YTI3MTNhMSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9h
cm02NC9lbnRyeS5TCj4gQEAgLTcsMTEgKzcsNiBAQAo+ICAjaW5jbHVkZSA8cHVibGljL3hlbi5o
Pgo+ICAKPiAgLyoKPiAtICogUmVnaXN0ZXIgYWxpYXNlcy4KPiAtICovCj4gLWxyICAgICAgLnJl
cSAgICB4MzAgICAgICAgICAgICAgLyogbGluayByZWdpc3RlciAqLwo+IC0KPiAtLyoKPiAgICog
U3RhY2sgcHVzaGluZy9wb3BwaW5nIChyZWdpc3RlciBwYWlycyBvbmx5KS4gRXF1aXZhbGVudCB0
byBzdG9yZSBkZWNyZW1lbnQKPiAgICogYmVmb3JlLCBsb2FkIGluY3JlbWVudCBhZnRlci4KPiAg
ICovCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvbWFjcm9zLmggYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L21hY3Jvcy5oCj4gaW5kZXggOWM1ZTY3NmIzNy4uZjk4
MWI0ZjQzZSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L21hY3Jvcy5o
Cj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9tYWNyb3MuaAo+IEBAIC0yMSw1ICsy
MSwxMCBAQAo+ICAgICAgbGRyICAgICBcZHN0LCBbXGRzdCwgXHRtcF0KPiAgICAgIC5lbmRtCj4g
IAo+ICsvKgo+ICsgKiBSZWdpc3RlciBhbGlhc2VzLgo+ICsgKi8KPiArbHIgICAgICAucmVxICAg
IHgzMCAgICAgICAgICAgICAvKiBsaW5rIHJlZ2lzdGVyICovCj4gKwo+ICAjZW5kaWYgLyogX19B
U01fQVJNX0FSTTY0X01BQ1JPU19IICovCgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
