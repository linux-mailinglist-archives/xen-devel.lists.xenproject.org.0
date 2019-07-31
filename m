Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CF7C312
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 15:15:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsoOR-0002xN-Bi; Wed, 31 Jul 2019 13:11:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UN8Z=V4=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1hsoOQ-0002xH-3f
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:11:46 +0000
X-Inumbo-ID: ba1fb722-b394-11e9-aa5c-73bdc9029650
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba1fb722-b394-11e9-aa5c-73bdc9029650;
 Wed, 31 Jul 2019 13:11:43 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 13:11:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 13:09:17 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 13:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUwL6npI9YT6rsHJdppIlk9lZ2R6Z4lb9lcVjTcOxTxqwnHq9sARWBlRLj4jOhWr9J9OgvyzTAFOQjb9CKisapzWjNXK4RYjpepxyjuA0G3dmY7vMAQvcAMsiSPiVaV458LEZ6ZoviGpMXaTYlpVigktYUZR1LWLEPPGjZ2BAsVMtDJGw81VWWyLusZ7Lu7Qvns2JbXy3SaS9VcLj//ssN4c/FOCH9ucQp1vPRCo9z3XCVkJax4Y4fWRXHgktEkb18SZlipLzjZMVrGpC7MSZksS2NlrKQT3zte9bNlP8aNA7VtdJpSdVoi10Rv3YvSPWKx37xcgiCKKmjV0xRcu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5d48RE+eBDSgYYId1hbOqdisqqsoQyANgilf6GSx3Q=;
 b=Tj1E8OEFexWDkEbajqBU2fkXwO3U/5g+8pxxDX+pTlR7iwQrxyOGnqNTFAGQ7O8gbjFVXokn9EuVZIGqoIDzpdUn7H3MFa8vX8FyWuHD7WfYYxSJH5pyCzaMhdxO5bQrlaAuniU8GmXnypEzVsk64Vc0Y++gKIQhOwJVZOb83f/ySbY6TflgOpQQZJlSV7XNw4kCX/KtcOLmpIkkG3+oz5XZEoNdhTpI0uslhqTPURmW7crAXKkWgzeHjWmFicYWjgvuDzS4NsQG3TieqnFcRVVHYUcx54Am1Z6DzcUGIeRQIHSAoHZ0wqkmkJIlqAmj8g7Hh2bsKNvSQV5xfAU9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3220.namprd18.prod.outlook.com (10.255.136.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 13:09:16 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:09:16 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Speculative mitigation facilities report wrong status v2
Thread-Index: AQHVR6Eng6gyD2BBNUm+AkTjaw+Y7Q==
Date: Wed, 31 Jul 2019 13:09:16 +0000
Message-ID: <20190731130853.18591-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::28) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66d91374-569e-4591-17ee-08d715b84a3a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3220; 
x-ms-traffictypediagnostic: BY5PR18MB3220:
x-microsoft-antispam-prvs: <BY5PR18MB32205BAF7DE2C3ECA9697B65BEDF0@BY5PR18MB3220.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:274;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(199004)(189003)(66446008)(66556008)(36756003)(5640700003)(64756008)(66476007)(6436002)(6486002)(66946007)(6512007)(1076003)(2501003)(305945005)(316002)(54906003)(25786009)(107886003)(5660300002)(4326008)(53936002)(71200400001)(2906002)(8676002)(66066001)(81166006)(68736007)(8936002)(386003)(26005)(6506007)(50226002)(14454004)(7736002)(52116002)(102836004)(2616005)(71190400001)(6116002)(86362001)(99286004)(81156014)(486006)(256004)(478600001)(3846002)(6916009)(2351001)(186003)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3220;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nzG9I4OLCSODnR/+IExXGYTMidXvTTbXSEt3iC3SULg9XEuiAv3CnUXs74BvhxTS2jcXl4KhxS5uRX/k51b443vtVSSIyr3+63CA9Wpx/k4MWSYFjYzIzv72H+uH/YG7kiBR9s9TcmQazzK26G3Z+gcA06f1QVSEL3rBv18CtxjwTM2sifhjIpW2FXycDmf+IwcfaUuyQIHrqbiMr/faYgF0QOrlmBbWHA38z0dcpFJrn1fmpgKujgTJwdJ/NoMEvK/iHWjWazkgOxNmwthCEzZcWWlSxYvasU7X4tUlv4VNIKU6oD4Vx9FsipohREETRKYeMwLaIhuyqHQ1cLTHPt5T2QaHWZPHwq+KYR4dYa8YLOYPcivVTw/9rxO30ZgJ7Rp9V/wKFfELwesZ7KH7tnP6majQ7+srU+f1EkWh87M=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d91374-569e-4591-17ee-08d715b84a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:09:16.2739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnwang@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3220
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH] Speculative mitigation facilities report wrong
 status v2
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Jin Nan Wang <jnwang@suse.com>, "wl@xen.org" <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgY2hlY2sgYWJvdXQgWDg2X0ZFQVRVUkVfTURfQ0xFQVIgdG8gYXZvaWQgdG8gcHJpbnQg
Ik5vbmUiLgotLS0KIHhlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3BlY19jdHJs
LmMgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKaW5kZXggY2FkYTlhMDU4ZS4uNDY4YTg0NzU5
OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9zcGVjX2N0cmwuYwpAQCAtMzY2LDYgKzM2Niw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmlu
dF9kZXRhaWxzKGVudW0gaW5kX3RodW5rIHRodW5rLCB1aW50NjRfdCBjYXBzKQogICAgIHByaW50
aygiICBTdXBwb3J0IGZvciBIVk0gVk1zOiVzJXMlcyVzJXNcbiIsCiAgICAgICAgICAgIChib290
X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfTVNSX0hWTSkgfHwKICAgICAgICAgICAgIGJvb3RfY3B1
X2hhcyhYODZfRkVBVFVSRV9TQ19SU0JfSFZNKSB8fAorICAgICAgICAgICAgYm9vdF9jcHVfaGFz
KFg4Nl9GRUFUVVJFX01EX0NMRUFSKSAgIHx8CiAgICAgICAgICAgICBvcHRfZWFnZXJfZnB1KSAg
ICAgICAgICAgICAgICAgICAgICAgICAgID8gIiIgICAgICAgICAgICAgICA6ICIgTm9uZSIsCiAg
ICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19NU1JfSFZNKSAgICAgID8gIiBN
U1JfU1BFQ19DVFJMIiA6ICIiLAogICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVf
U0NfUlNCX0hWTSkgICAgICA/ICIgUlNCIiAgICAgICAgICAgOiAiIiwKQEAgLTM3Nyw2ICszNzgs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfZGV0YWlscyhlbnVtIGluZF90aHVuayB0aHVu
aywgdWludDY0X3QgY2FwcykKICAgICBwcmludGsoIiAgU3VwcG9ydCBmb3IgUFYgVk1zOiVzJXMl
cyVzJXNcbiIsCiAgICAgICAgICAgIChib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfTVNSX1BW
KSB8fAogICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX1JTQl9QVikgfHwK
KyAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9NRF9DTEVBUikgIHx8CiAgICAg
ICAgICAgICBvcHRfZWFnZXJfZnB1KSAgICAgICAgICAgICAgICAgICAgICAgICAgID8gIiIgICAg
ICAgICAgICAgICA6ICIgTm9uZSIsCiAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVS
RV9TQ19NU1JfUFYpICAgICAgID8gIiBNU1JfU1BFQ19DVFJMIiA6ICIiLAogICAgICAgICAgICBi
b290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfUlNCX1BWKSAgICAgICA/ICIgUlNCIiAgICAgICAg
ICAgOiAiIiwKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
