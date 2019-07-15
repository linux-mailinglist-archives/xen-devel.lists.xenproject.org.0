Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DFE685CB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 10:55:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmwit-000317-CI; Mon, 15 Jul 2019 08:52:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qxeU=VM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hmwir-000310-Mf
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 08:52:37 +0000
X-Inumbo-ID: e3d26a0a-a6dd-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.122]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e3d26a0a-a6dd-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 08:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXJkduPzaF+qTSIhfL9V2vsiEOB6N3RDn94K7wd3YiVyx3URtueq+pdkXa//ILNFxePjC3JUUy0WqHB9BnmGbWPhrDnmnrD/QD7JItFJHLxtQSsc8qwXwSsKahMQkxgpidR9tU3n+fN47V/Psy0bg6M0rdUYmVfdSy4dQ4yewk30y9CaK0sVM1WmeoLOcEQnTE/S0o4ETL6ojJ1aN7E6shIAG6NS2pxyZ1KweL/DaDnG/ANQ4GRDnWlAkeet3x8s9DZUAZM0TIL8t9pFRSoE8AJ73E4/DWRqcEGzvtzzztZweWrl0SX4DV+j6APfEyCkzGi7/R07SZjF8DbyKra6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUOfx48OOW+cJQkhRTSCk8RvylAvCFOTuZKA+tDh/fg=;
 b=O2HQ3nL7kxZpAJ05b0YHGb+612PBDQmZZ8U4HgaMSx3eIKlXcw8+FLScByWurMkgf7TCMBfeFf4EuGO8ZTNzGReWnBPfRz+e5smokfAcg+dZPeLh8mfy2s1qZ8Z1DuwafZ1lRowx/OOa6u5roamQi/5gOIxx8FMGE+WgjxnqIfwtfJ+znLxMRQjgxVC+T+I5MqOjZFYLVoj1W5Be7MB3sB5UJAftFaJFRtQe99GYyN3WqDRgka/oPQozAwYWQGlTBDXDoiPekKmPbsN5LXwvKQCNVkQy5x1sWxleMml+/dB/hL/d9IXqUz1EL0AfdZ0RgbzZ8lq7e1WePfj0A0Wamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUOfx48OOW+cJQkhRTSCk8RvylAvCFOTuZKA+tDh/fg=;
 b=edsfh8dIk4BMXETV5olKybXg4R7obmmOIijzh6W2Dnml3LShHTvqZATGbF/IrmjmzFwBuy3kj/0EbpHmkrR/N032NGk7xPDL9XcoktMML3v7GLYLdPS/mf+WxvM9RwS46nLSZz7bUCkmiDNRPhPaMcB2xzqmohDhwUxrZ14kQGM=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3504.eurprd02.prod.outlook.com (52.134.18.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 08:52:32 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 08:52:32 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbFtNiAgACKMgCABTMcAA==
Date: Mon, 15 Jul 2019 08:52:31 +0000
Message-ID: <46da0d27-7960-6d51-265b-94456bc4790a@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <CABfawhk19LTiO5bDbVMW2u1mmmnexNJS3Df=y6XtUzvKc8APvw@mail.gmail.com>
 <2bdd4726-0629-e452-2bc3-c5109db3c0c3@suse.com>
In-Reply-To: <2bdd4726-0629-e452-2bc3-c5109db3c0c3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::22) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb8f5e21-ee56-4610-4eb6-08d70901c5f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3504; 
x-ms-traffictypediagnostic: VI1PR0202MB3504:|VI1PR0202MB3504:
x-microsoft-antispam-prvs: <VI1PR0202MB35048C280D5A6A0FED20E434ABCF0@VI1PR0202MB3504.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39860400002)(396003)(346002)(136003)(366004)(376002)(199004)(189003)(3846002)(6116002)(5660300002)(6486002)(54906003)(110136005)(31686004)(14454004)(6246003)(7736002)(6436002)(8936002)(256004)(4326008)(6512007)(53936002)(486006)(68736007)(71200400001)(71190400001)(8676002)(86362001)(31696002)(99286004)(81166006)(81156014)(316002)(2906002)(229853002)(11346002)(476003)(2616005)(446003)(186003)(76176011)(66446008)(64756008)(66556008)(66476007)(66946007)(478600001)(102836004)(52116002)(26005)(6506007)(386003)(53546011)(66066001)(305945005)(36756003)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3504;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JD9s0ihmN6Ccw48YTreWtaFR+MebJWc3ZJSqJs2744MDIQMe4hSXX9l9c8VWCMtK4qATt28wT/9JiOb0VoNaahkPur3Q/GJT1FllLY6XJXq5RcJ+S01xHqHeP8z5e+5DML8cUDqP9u8NCwhvOhqVsXTkRLpj4R28htQrvG2cgiw39F1auf8ZWni8Q6vrFWAnUBvNRYMMwkrOe/3b7P3WinIIo6FJKSqpPnBSSc6+Y2VB+DV/Jija4ybVSh/nd7L3SKT1vck/y6cT3zQHc7uEcvaVfKynl07Y8t1wRAMSceLvygEph9bA2VIQVx1r6BhTPSQYtgW7gy85kSiERFN9CYI/upatDJjbJJ0ntD0uJ1fkFIcjjV0fdR5Yw+S98fDOXYYC+KzKyhCuvREW4sXCN7z+h4v1oeQZDcXERGJpzys=
Content-ID: <29DE79FA23E91C479C4A645B4055CADA@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8f5e21-ee56-4610-4eb6-08d70901c5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 08:52:31.9608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3504
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEyLjA3LjIwMTkgMDQ6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wNy4y
MDE5IDE5OjEzLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4gQEAgLTYyOSw2ICs2OTcsMTQg
QEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4+DQo+Pj4gICAgICAg
ICAgICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3JlYWRv
bmx5KHAybXQpKTsNCj4+PiAgICAgICAgICAgIH0NCj4+PiArDQo+Pj4gKyAgICAgICAgaWYgKCBj
dXJyLT5hcmNoLnZtX2V2ZW50ICYmDQo+Pj4gKyAgICAgICAgICAgIGN1cnItPmFyY2gudm1fZXZl
bnQtPnNlbmRfZXZlbnQgJiYNCj4+DQo+PiBXaHkgbm90IGZvbGQgdGhlc2UgY2hlY2tzIGludG8g
aHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCBzaW5jZS4uDQo+IA0KPiBJIGhhZCBhc2tlZCBmb3Ig
YXQgbGVhc3QgdGhlIGZpcnN0IG9mIHRoZSBjaGVja3MgdG8gYmUgcHVsbGVkDQo+IG91dCBvZiB0
aGUgZnVuY3Rpb24sIGZvciB0aGUgY29tbW9uIGNhc2UgdG8gYmUgYWZmZWN0ZWQgYXMNCj4gbGl0
dGxlIGFzIHBvc3NpYmxlLg0KPiANCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+
Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPj4+IEBAIC0zMjI0LDYgKzMyMjQsMTQg
QEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KA0KPj4+ICAg
ICAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsNCj4+PiAgICAgICAg
ICAgIH0NCj4+Pg0KPj4+ICsgICAgICAgIGlmICggdW5saWtlbHkodi0+YXJjaC52bV9ldmVudCkg
JiYNCj4+PiArICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJg0KPj4N
Cj4+IC4uIHlvdSBzZWVtIHRvIGp1c3QgcmVwZWF0IHRoZW0gaGVyZSBhZ2Fpbj8NCj4gDQo+IEkg
YWdyZWUgdGhhdCB0aGUgZHVwbGljYXRpb24gbWFrZXMgbm8gc2Vuc2UuDQo+IA0KDQpUaGUgZmly
c3QgY2hlY2sgaXMgb24gdGhlIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkgcGF0aCBhbmQgdGhl
IHNlY29uZCANCmlzIG9uIGh2bWVtdWxfaW5zbl9mZXRjaCgpIHBhdGguIFRoZXJlIGFyZSAyIGRp
c3RpbmN0IHdheXMgdG8gcmVhY2ggdGhhdCANCmlmIGFuZCB0aGVyZWZvcmUgdGhlIGNoZWNrIGlz
IG5vdCBkdXBsaWNhdGVkLg0KDQpUaGFua3MsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
