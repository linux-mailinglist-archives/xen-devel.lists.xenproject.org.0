Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4668143D5E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:56:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itt3A-0002dQ-9s; Tue, 21 Jan 2020 12:54:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8osE=3K=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1itt37-0002dF-Ud
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:54:29 +0000
X-Inumbo-ID: 2906b6cc-3c4d-11ea-9fd7-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::713])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2906b6cc-3c4d-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 12:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftroFTM1uNZhgSL5CPeg73mBTlm3132grdX9/lRwjLMp04AflT1TLDVqD6UX7HIut12lzfSfXPuVnaZo/biamt3c8bI0mOzPpHYTXd2qYDGb4+1ItNzKA7dL6g57mxyg93ROg6XRJyGAzyyx3h2ozjaJjp6fxC0lj+xhTnh7R67svyG7BwOUlArScfzlWxEWcXBZeGUt7EmFmdBtnUmn2eJtXavs0f9m9zFW7BE0/ECrjpDvUFjqFx28q0dvhOvobGAHCxA10nRw+UCD8iKTZK59N5ZBgx+fAoTL93N5EOKjkNb5VogWooR0JCYZm0Oc8obrby1VMebKOaGoqeVQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awZNKTvVpWox+hXfd2C6HQHewXp+8WWFVdZI0Quvz+E=;
 b=LnpGb4NBVsI/15jJnpiBaPbD/9mPJ7rmhvaTXTikdEknfuwGX8Mb04rWWEpWFheEY7Y5xWC3qVFzEjAtqEpnwC1ntPBRXeKSnitjqSAbDS/TlW+YbvCyA80rIk5oPu0C9WPoDXM4t0qOFx7paEj4Mcb2la25CxwpmQ6VeIb3wOeQBav2MWfGsiXAMxuKMbRMB9+OiDgH4s0zX3tobLAN5WvJ/HOiW9d0oZ2qiu/4Z6jekfTXsGvz2dWDJ8ZPvV4JuCd9zfXe2ao9PgLqPUtWUKPqxcCRAbgTrl3Dwh2s5zZZe2vCjmYHsM1rb6smVeQTZAmIiKbwr2XztcDS8Bpmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awZNKTvVpWox+hXfd2C6HQHewXp+8WWFVdZI0Quvz+E=;
 b=P3BfqyzzAOxTVYEjsG1wnqvAoUSiSv4+LUb5fFvWgSlqTrIkUJNeC9/4tTfH+GJ0nEeDuHdf7r9dYPp22tvPyT1itvzHa14Eav0nu0FaG6+gb8UXN+RNVxO1Q15RDEKXdPo3IgxHLISWB+h6wetqFfxe1gxDu77KZ6a4cUO8Ew8=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB5591.eurprd02.prod.outlook.com (10.255.120.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Tue, 21 Jan 2020 12:54:27 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 12:54:27 +0000
Received: from pepi-Latitude-E5570 (91.199.104.6) by
 AM3PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:207:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.12 via Frontend Transport; Tue, 21 Jan 2020 12:54:26 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V8 4/4] x86/mm: Make use of the default access param from
 xc_altp2m_create_view
Thread-Index: AQHVzTpvm+uhV8EGOE+G9u9dUjhcEKf1GVyA
Date: Tue, 21 Jan 2020 12:54:27 +0000
Message-ID: <dc095ac5794a8d188194d5706be5fa7be8f839ee.camel@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
 <20200117133059.14602-4-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-4-aisaila@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0108.eurprd07.prod.outlook.com
 (2603:10a6:207:7::18) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca838f86-ac0c-4a0b-3489-08d79e710c86
x-ms-traffictypediagnostic: AM6PR02MB5591:|AM6PR02MB5591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB5591DA33283FF0565B18A783D60D0@AM6PR02MB5591.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(110136005)(54906003)(5660300002)(71200400001)(316002)(6486002)(186003)(2906002)(16526019)(66476007)(66446008)(66556008)(52116002)(8936002)(26005)(4744005)(6496006)(64756008)(7416002)(4326008)(36756003)(81166006)(66946007)(86362001)(81156014)(478600001)(2616005)(956004)(8676002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5591;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jSz/BQCwQqZBB2GExvTUf13qVOu9V+MA3Hn3RsgXQxqZ5e996jOtpagHg4zgsmDzHsx22gIhRWfMubWM7yvgYbrFSVLGWq7DA3dBTPAN+ckyXZj4OjOY4AoFE0OCWRDUlH5eSy/nmCf/YxJaHMxIo3ulQ5+kpi11ahk4k6z5FwU9J8y0Dd5LoNUcqwSiKR6KEd7B0g0Jzs7wFEIgVwyn97t6PiVNLysECU50cg+RRjdBlhf0CQ03cxOs7hCryswMdCbmNUX8CKNULwUIjRD8D1fMbi2iXWgwcb4HK5PeJ891seqtp8TgsCiF8vSF2zMSsvUgvRxXA9yYHMiUMVCH1ENI+p+ZFWJczY7G6JEQm2VpOIXn4XCSxtDcoMVlGd6rIldBO4srlOduQPy5OIcwa0/l79VBmi+wKaywZAK7E9/Nv1y2sbzkqebLMp8wcqw4q6JKMxbh5ZjQjEv8yeVQ5fDDWgXpU2EFRa9V7WXgAMpR/cdt64txhCgOmudsYxtM
Content-ID: <46C8FDEAA78B46419A0C4861177F81C9@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca838f86-ac0c-4a0b-3489-08d79e710c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 12:54:27.6148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6G8t/ql5vpwd8Bl4gt0j+1QphiHDn13EBKAVrUSe/B71QEkuL1d0//2Oxsat6ZZreutZO4Vs8KNyY+uNlkZ/EXbxHddIU7Pt3ZvB5uuSQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5591
Subject: Re: [Xen-devel] [PATCH V8 4/4] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAxLTE3IGF0IDE1OjMxICswMjAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gQXQgdGhpcyBtb21lbnQgdGhlIGRlZmF1bHRfYWNjZXNzIHBhcmFtIGZyb20g
eGNfYWx0cDJtX2NyZWF0ZV92aWV3IGlzDQo+IG5vdCB1c2VkLg0KPiANCj4gVGhpcyBwYXRjaCBh
c3NpZ25zIGRlZmF1bHRfYWNjZXNzIHRvIHAybS0+ZGVmYXVsdF9hY2Nlc3MgYXQgdGhlIHRpbWUN
Cj4gb2YNCj4gaW5pdGlhbGl6aW5nIGEgbmV3IGFsdHAybSB2aWV3Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+IEFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KUmV2aWV3ZWQtYnk6IFBl
dHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
