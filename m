Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7286A87
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 21:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvnwT-0002pc-AC; Thu, 08 Aug 2019 19:19:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LEb3=WE=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hvnwR-0002pU-Vc
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 19:19:16 +0000
X-Inumbo-ID: 67b9626c-ba11-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::61e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67b9626c-ba11-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 19:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbAhXqqZRl0PloChMxAefED6lQYBDNXrJze6VaxMi2ecTvTDhYzM2QGPElGg4QTeD3NqxqGZHlcTfTJYk8CxSNQV7eaEwoFvhr9zHjqhEa1KcsNbKQeZWJBRq+Hden6CY7wXahlGZf4cDQbkTjQj3NTC+u5WItTqmUpfxgdHtCAwT86mNlooMhPxx6U6eNcJXa1VeyaOG/2jbvrFRlHMJOeAtNrM/G0rJfCTjnL707fNoFjFGXhV2QK1dM++FFpZxaFtzFecN7qlOLI61io7v2Bk9y9SoFOGc2UFJdNiEENot8oofVHTKKc+Le+HChuQl6Ul8P92een80rs2DNcWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYrAnpQp3FRRK5EcjLFpLEhnw/85P16Mjwh7oMWe9zc=;
 b=eKxNv8azb63/jnx/8SmCT1qU1IW48efKJFSSIWQg9hA5P3lYjeZyWDboQkLfDcqOATDUynFAGcdzQXASfEZvNd/r6BuycLYbrOjT17wyUp09rA7e67xJ/yW5D97JPRNTLF7uHkFoVJuMwvYk4DJP7T7kz2Vdqn6ecEZEE7gT6s24ZNuxZtpSEFoByKSzWZDVwuEijsUWwUAl9hxzBV4SI9cDBvRg01SAEfsrfYwWSw70F1vu/xaomAmH87pNiu3Na1fwMf1xPKyfihXJ1o3IIz3YgTc4Mn4hpy5o/8qmB4uaBmfFHhRAV/TYnsANsPk6apL7JIHjn+DBPzys0rbYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYrAnpQp3FRRK5EcjLFpLEhnw/85P16Mjwh7oMWe9zc=;
 b=l7mMBRvKTuGfoRGA2qdvizoFqtQ85s4a0HlifHWK6EA/YQRFxw2KS2rQ6MIZ3hT2Y8E2bWJESuWxHCsLzh5WtcLHA6NUwqQYPUoA0+y71nVoCmpetCPkwrGtpF3x9JXpG98xBNW1zn3WjMoHZ7UbZE1RMgJ6wi+JONZmPS5Mohnj9S9HIEx6ON4qRBVahnS4ptBKAUdcUN5ghQ2qePXucyXC6vHvcSNIJDz+rfphNdIJtumOW9eKnkkXwdV7Hf657ihefrxdyeNCdShTH3DRxDzAl3NtCy7noK/BMIMyAgPhwucR8ykZKrBXdrH0S85lcRXWbg66IeVVDU8Gc+VECg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5876.eurprd03.prod.outlook.com (10.255.29.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 8 Aug 2019 19:19:12 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 19:19:12 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] [PATCH v4 6/7] xen/arm: don't iomem_permit_access
 for reserved-memory regions
Thread-Index: AQHVTKDolHszhP/gS0iYSDHh38xNIKbxow6A
Date: Thu, 8 Aug 2019 19:19:11 +0000
Message-ID: <87pnlfh3dc.fsf@epam.com>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-6-sstabellini@kernel.org>
In-Reply-To: <20190806214925.7534-6-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84d5ea9e-90fb-490c-b5d7-08d71c354b67
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5876; 
x-ms-traffictypediagnostic: AM0PR03MB5876:
x-microsoft-antispam-prvs: <AM0PR03MB5876E86B733B2D6E244DA15AE6D70@AM0PR03MB5876.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(102836004)(316002)(53936002)(229853002)(86362001)(5660300002)(25786009)(14454004)(54906003)(6486002)(6246003)(4326008)(6436002)(26005)(6512007)(186003)(11346002)(478600001)(14444005)(446003)(80792005)(71190400001)(8936002)(6506007)(71200400001)(55236004)(76176011)(66066001)(99286004)(76116006)(6916009)(66446008)(64756008)(66556008)(66476007)(7736002)(305945005)(3846002)(81156014)(8676002)(476003)(2616005)(81166006)(486006)(36756003)(91956017)(256004)(66946007)(2906002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5876;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rxAEgP7LvBHpjNEkxSu7u/iMGiQ+teK20pTw6Gw+hAAr5LLLnFXIqnJ/2OYUtdmD7s/f1f7oXEcRtE77slI8c2MzZ+MYaoXU+Xny0h6Oc7xngyasJPI6cVtou97Wrlvrd9qJM18aTtAOAC57wRx0WNgpLVPFGVZufr40mgKvgqbCLZnKPDwZLtHNi95NiafC7JUf85HSDmZ9Qe1Mu5wwoey1lDFPATSlp1oGR9Dzc3m41IoVaFvZ5Sgs5caILqqZp/Hj2UB8mTzzoa1NMBhhM2SbZRXadNYSfNpDk3ksd3NnCb78zrit2rQ46Zjo4DqPV1L0IRi4blN+jZJ7xPLQ6fj3hGxkH5vYUsFP19S+K94NpFmxdNnSs/V6UYooBhiJ9HuREiIbEyszSc0ltM5Yy0Mcq9FbHvlX5nVAd/KTle0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d5ea9e-90fb-490c-b5d7-08d71c354b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 19:19:11.9183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LK7fX1GQfLJXsUy+/fyePfn+5J0scRbndn+sVeIatkwj7tg6mpGT+SMOKsYD5RvTmibXIN5Qr2kqVXlzK+bAJ7qCR+jgloWSfdeA0/FFQbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5876
Subject: Re: [Xen-devel] [PATCH v4 6/7] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBEb24ndCBhbGxvdyBy
ZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byBiZSByZW1hcHBlZCBpbnRvIGFueSBndWVzdHMsCj4g
dW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJlIHByb3Blcmx5IHN1cHBvcnRlZCBpbiBY
ZW4uIEZvciBub3csCj4gZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0X2FjY2VzcyBmb3IgdGhlbS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNv
bT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBjb21wYXJlIHRoZSBwYXJlbnQgbmFtZSB3
aXRoIHJlc2VydmVkLW1lbW9yeQo+IC0gdXNlIGR0X25vZGVfY21wCj4KPiBDaGFuZ2VzIGluIHYz
Ogo+IC0gbmV3IHBhdGNoCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDI0
ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCA0Yzg0MDQxNTVh
Li4yNjdlMDU0OWUyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0xMTUzLDE3ICsxMTUzLDI1
IEBAIHN0YXRpYyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qgc3RydWN0IGR0
X2RldmljZV9ub2RlICpkZXYsCj4gICAgICBzdHJ1Y3QgbWFwX3JhbmdlX2RhdGEgKm1yX2RhdGEg
PSBkYXRhOwo+ICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IG1yX2RhdGEtPmQ7Cj4gICAgICBib29s
IG5lZWRfbWFwcGluZyA9ICFkdF9kZXZpY2VfZm9yX3Bhc3N0aHJvdWdoKGRldik7Cj4gKyAgICBj
b25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBhcmVudCA9IGR0X2dldF9wYXJlbnQoZGV2KTsK
PiAgICAgIGludCByZXM7Cj4KPiAtICAgIHJlcyA9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFk
ZHJfdG9fcGZuKGFkZHIpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90
b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPiAtICAgIGlmICggcmVzICkKPiAr
ICAgIC8qCj4gKyAgICAgKiBEb24ndCBnaXZlIGlvbWVtIHBlcm1pc3Npb25zIGZvciByZXNlcnZl
ZC1tZW1vcnkgcmFuZ2VzIHVudGlsCj4gKyAgICAgKiByZXNlcnZlZC1tZW1vcnkgc3VwcG9ydCBp
cyBjb21wbGV0ZS4KPiArICAgICAqLwo+ICsgICAgaWYgKCBkdF9ub2RlX2NtcChkdF9ub2RlX25h
bWUocGFyZW50KSwgInJlc2VydmVkLW1lbW9yeSIpID09IDAgKQpBbSBJIG1pc3Npbmcgc29tZXRo
aW5nLCBvciB5b3UgYXJlIHBlcm1pdHRpbmcgYWNjZXNzIG9ubHkgaWYgaXQgZnJvbSBhCiJyZXNl
cnZlZC1tZW1vcnkiIG5vZGU/IFRoaXMgY29udHJhZGljdHMgd2l0aCBwYXRjaCBkZXNjcmlwdGlv
bi4KCj4gICAgICB7Cj4gLSAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBwZXJt
aXQgdG8gZG9tJWQgYWNjZXNzIHRvIgo+IC0gICAgICAgICAgICAgICAiIDB4JSJQUkl4NjQiIC0g
MHglIlBSSXg2NCJcbiIsCj4gLSAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwKPiAtICAgICAg
ICAgICAgICAgYWRkciAmIFBBR0VfTUFTSywgUEFHRV9BTElHTihhZGRyICsgbGVuKSAtIDEpOwo+
IC0gICAgICAgIHJldHVybiByZXM7Cj4gKyAgICAgICAgcmVzID0gaW9tZW1fcGVybWl0X2FjY2Vz
cyhkLCBwYWRkcl90b19wZm4oYWRkciksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPiArICAgICAg
ICBpZiAoIHJlcyApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VS
UiAiVW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4gKyAgICAgICAgICAgICAg
ICAgICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIsCj4gKyAgICAgICAgICAgICAgICAg
ICBkLT5kb21haW5faWQsCj4gKyAgICAgICAgICAgICAgICAgICBhZGRyICYgUEFHRV9NQVNLLCBQ
QUdFX0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7Cj4gKyAgICAgICAgICAgIHJldHVybiByZXM7Cj4g
KyAgICAgICAgfQo+ICAgICAgfQo+Cj4gICAgICBpZiAoIG5lZWRfbWFwcGluZyApClNvLCB0aGlz
IHJlZ2lvbiBjb2xkIGJlIG1hcHBlZCwgYnV0IHdpdGhvdXQgdGhlIGFjY2Vzcz8KCgotLQpWb2xv
ZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
