Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F916A118
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 10:09:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j69h6-0003qN-0r; Mon, 24 Feb 2020 09:06:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1O9Y=4M=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j69h3-0003qI-NA
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 09:06:25 +0000
X-Inumbo-ID: ee5de56a-56e4-11ea-ade5-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.95]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee5de56a-56e4-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 09:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtKqQiU/qEu6NTeWPCJN7N/pk3QMG7aaHYU8xkrGWBEhCQ1NK7EzRwCFMUZ+W4+nN2L47ZKrJMXnisY/Bk3tKhH3EGb4PTQKzZn5+G0mkfy8oyL4Sl5/wJ8NAFZ+cIW28FG/xAU0png+b45hiWt/xWsf6DaFQ/3FbUsLJ+o5SXRVAUMuMAS9ZekSStAdnWs0EjgY/6kM58U/xFCW5ITLEewZjOLMRZjCQ+vClXNC9eSuAVitz2sJfhFtVlcFnMu/7Kg5RowAKeYyYdv523U9sWvizhAFkuyUnP8p2/ahD9DVLRyzjroviYUFtdzHmF+gg1tPOk8Vx9TsTYCDzbLiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfuV5NUr8gP+tVUml4jRCgn9kcSpKt9CpNFMGSFdDXg=;
 b=CkZjAxyRo5QmJ00Vv7S99abQJpzfRqg0qPIg+c3JJOT0MuOSjGcQaRIJDSvQ75WpsNxA2kUQ1ha34IQDOy6Z1n3WwXkk+DLp3eL86GwF6mkq+GAzFi/bPIYAwF52amUg71f/uTXtWWdCGcyhWsfNGYLIXN9kD5vy/FfJBL6ht4DD15nAYj7t5qlSgJgFQ9w/oXd6S3kc16BgxXCo9k1QuP4yY1xEdRH+Y5kMZmK1I4inFcg/yNjvV+cNJxtplRyTlXi6pYLyW82iADqrHCM66NPieP+ZUi6dszdzJd4dlDpjS5Ni4OSosgRJ/N8fJCh6cOhcBbHoEQgMh5rkFqhgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfuV5NUr8gP+tVUml4jRCgn9kcSpKt9CpNFMGSFdDXg=;
 b=ayK9gpf1ZWWqbTN9ETB035VQe8f8T1mxhz22UqT3dL1VObCxi2fLOzj1VdYsbVpKDHZJQCQLGpuwlXuJ3JuddF1PNFBqf3NSy3lXLSFDTZEAIDfu+tt4eyPAhQ5MwgTGtxhtuSFtVQvelF+vikDzcULFkQ9hC+jo+zN2VTACotk=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3109.eurprd02.prod.outlook.com (10.175.233.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Mon, 24 Feb 2020 09:06:21 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e%4]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:06:21 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR01CA0115.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Mon, 24 Feb 2020 09:06:20 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V4] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV6JEygsFwXfT/ykedOiNCZrGg7Kgl2b8AgAQ4eIA=
Date: Mon, 24 Feb 2020 09:06:21 +0000
Message-ID: <0b88a34f-caa4-54c3-cbed-637660ad8b09@bitdefender.com>
References: <20200221083014.29274-1-aisaila@bitdefender.com>
 <db92db09-3f73-aa91-cac7-a1652782da95@suse.com>
In-Reply-To: <db92db09-3f73-aa91-cac7-a1652782da95@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::20) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 071c7e64-9e8d-44bf-b623-08d7b908d102
x-ms-traffictypediagnostic: DB6PR02MB3109:|DB6PR02MB3109:
x-microsoft-antispam-prvs: <DB6PR02MB3109B91EFF1CA5DE46C7D09EABEC0@DB6PR02MB3109.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(186003)(16526019)(316002)(2616005)(4326008)(16576012)(956004)(6486002)(8936002)(81156014)(8676002)(81166006)(31696002)(2906002)(26005)(53546011)(7416002)(31686004)(86362001)(478600001)(52116002)(71200400001)(36756003)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(6916009)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3109;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2rS77GuQRUuH3/JCHDKZeVjmWC+6T0qa5wcx0OSdYtQGAvVFTtl+AxSD3jRwwJUXaaRQR7AsNAR0UYnfYFF/slht9r35ZGc05RgE6OnY6VfskO/ppMbfDy77oqA4kGlnBjRC63x3qaGeLTjxqYTplracfGSyLYUjtFy0kE37quVWFln6sFyE3mS8kPlD+wPRI/II+8NQvHUnv8JPidCO4EpsywLjhh7tNfbiamuKYEcHCatyxYeOt4AfaLh5+ME+42BHW4dxTKhkrf700PryYhveG+KwTZbjMA93Hie3ENB8Mx8gL2Ndv9OL0g5kB5O3JmoX1jGrwEoIV+Wc/JgTbThmxnqErfT/w7qylbka8TDjFydOIX7ZU0D8om9hSsuLGSGlyckjOaVBrjDid85qdTVwNSHP7u0cDclbFehsBoZu08A0BBGiq+Rj+7wpiGoN
x-ms-exchange-antispam-messagedata: RTtDFnSm3tEGuIH5BGb8yPKUAbIdMpeNNSEqq7oTox8ZcO+7h6OVn3GzTXxRvS/oyzeTLfexl0EEUvn5A6IpwS4WIxvOu3vB6owAtZ8nkcGiNryGziP46bC4wVpioyswCdKE4PkG8ugfSKanKN1udw==
x-ms-exchange-transport-forked: True
Content-ID: <BA2C253962117E4782CD6D500090D809@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071c7e64-9e8d-44bf-b623-08d7b908d102
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 09:06:21.6285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiC9ipdWYc2n8UxG0r8VvBAHlkJBYXQ+2A5Hwk+7TJu63K1VwbqaqMb+HGhooulUXQjQW/jzKp7b5ecFOEMR7JNilE05tFtAH+IgXB5jQgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3109
Subject: Re: [Xen-devel] [PATCH V4] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIxLjAyLjIwMjAgMTg6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMi4y
MDIwIDA5OjMwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC00ODM1LDYg
KzQ4MzYsMjYgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+PiAgICAgICAgICAgYnJlYWs7
DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJp
bGl0eToNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdWludDE2X3QgaWR4ID0gYS51LnNldF92aXNp
YmlsaXR5LmFsdHAybV9pZHg7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGEudS5zZXRfdmlzaWJp
bGl0eS5wYWQgfHwNCj4+ICsgICAgICAgICAgICAgaWR4ID49IG1pbihBUlJBWV9TSVpFKGQtPmFy
Y2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KPiANCj4gV2h5IG1pbigpIGhlcmU/IFlvdSBv
bmx5IGFjY2VzcyBNQVhfRVBUUC1kaW1lbnNpb25lZCBhcnJheXMgYWZhaWNzLiBJZg0KPiB0aGlz
IGlzIGludGVudGlvbmFsLCBJIHRoaW5rIGl0IGRlc2VydmVzIGEgY29tbWVudC4NCg0KSSBoYXZl
IG1pbigpIGhlcmUgYmVjYXVzZSB0aGUgYWx0cDJtIGluZGV4IHNob3VsZCBub3QgYmUgZ3JhdGVy
IHRoZW4gDQpNQVhfQUxUUDJNLiBJIGtub3cgdGhpcyBpcyB1c2VkIGFzIGFsdHAybV9lcHRwKCkg
aW5kZXggYnV0IHRoZSB0d28gYXJlIA0KY291cGxlZC4NCg0KPiANCj4+ICsgICAgICAgICAgICAg
ZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoaWR4LCBNQVhfRVBUUCldID09
DQo+PiArICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSApDQo+PiArICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOw0KPj4gKyAgICAgICAgZWxzZSBpZiAoICFhbHRwMm1fYWN0aXZlKGQpICkN
Cj4+ICsgICAgICAgICAgICByYyA9IC1FT1BOT1RTVVBQOw0KPj4gKyAgICAgICAgZWxzZSBpZiAo
IGEudS5zZXRfdmlzaWJpbGl0eS52aXNpYmxlICkNCj4+ICsgICAgICAgICAgICBkLT5hcmNoLmFs
dHAybV93b3JraW5nX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9DQo+
PiArICAgICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVj
KGlkeCwgTUFYX0VQVFApXTsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICBkLT5h
cmNoLmFsdHAybV93b3JraW5nX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFAp
XSA9DQo+PiArICAgICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKTsNCj4+ICsgICAgICAg
IGJyZWFrOw0KPiANCj4gWW91IGRvbid0IHNlZW0gdG8gYmUgaG9sZGluZyBhbnkgbG9ja3MuIEF0
IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgbWVhbnMNCj4gdGhlIGluLXJhbmdlLWluZGV4LWlzLXZhbGlk
IGNoZWNrIGZ1cnRoZXIgdXAgd2lsbCBoYXZlIGJlY29tZSBzdGFsZQ0KPiBieSB0aGUgdGltZSB5
b3UgYWN0dWFsbHkgY29uc3VtZSB0aGUgc2xvdC4NCj4gDQoNCkdvb2QgdGhpbmcgdG8gcG9pbnQg
dGhpcyBvdXQgaGVyZS4gSSB3aWxsIGFkZCBhbHRwMm1fbGlzdF9sb2NrL3VubG9jayhkKSANCnRv
IGd1YXJkIHRoaXMgY2hlY2sgYW5kIG9wZXJhdGlvbi4NCg0KPj4gQEAgLTI2MzgsNyArMjYzOSw5
IEBAIGludCBwMm1fZGVzdHJveV9hbHRwMm1fYnlfaWQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGlkeCkNCj4+ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAgIHAybV9yZXNldF9h
bHRwMm0oZCwgaWR4LCBBTFRQMk1fREVBQ1RJVkFURSk7DQo+PiAgICAgICAgICAgICAgIGQtPmFy
Y2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9DQo+PiAt
ICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pOw0KPj4gKyAgICAgICAgICAgICAgICBtZm5f
eChJTlZBTElEX01GTik7DQo+PiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19l
cHRwW2FycmF5X2luZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQ0KPj4gKyAgICAgICAgICAg
ICAgICBtZm5feChJTlZBTElEX01GTik7DQo+IA0KPiBJIGFwcHJlY2lhdGUgeW91IGFsc28gYWRq
dXN0aW5nIHRoZSBib2d1cyBpbmRlbnRhdGlvbiBvZiB0aGUgcHJlLQ0KPiBleGlzdGluZyBsaW5l
Lg0KPiANCg0KVGhhbmtzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
