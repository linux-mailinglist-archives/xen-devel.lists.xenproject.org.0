Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A714E6B89F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 10:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnfcY-0007dF-Ov; Wed, 17 Jul 2019 08:49:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fL=VO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnfcX-0007dA-5c
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 08:49:05 +0000
X-Inumbo-ID: ba481121-a86f-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.97]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba481121-a86f-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 08:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3MypQJY5h+591+NMtmjQLMRk+0LtiIHeAWdzq8voD9rwRGjNXowJRv2J9gikr3TLKv4fxM2e8i0DN1iQuITQLl1VU5DQ3TowOlrlWFIsOvx8UVmAX7AiAW4PIL+pQD4cXoFEeDYZNsIFdcc7dW/qc5+8F0kjOSdXDNRcEbVkXDBjy/nhp+T/+tug9bHSWfdvM+DaKkq7Z1lZ2K7O13OkBi44LysramsZ0RKUgn+mlD0gDXN7jMoMsP1bMzqW1ane57+fBsqsFw0bYCi2GvN0FlJPpJA6AodEp26Bv/qQqT+XgxnTStSVNcd/FX2BhC0NBhqtb+WZU85B2bEhusdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J72CkctZpPAtd4pxFIzNOsuBlbACmMUg4Pp8wNZvhv4=;
 b=BXxyEEJu7O43w+7X6SNCnpZ6QWWCGQ1XX1NpOZ72cym/TxNbm6kXo4VRPPwqAZX8bAZK3F9APhkwfXacbJ+EcyxRoT7OyuZ1t6b5MUnJtNEZTducwfPJ53ubJFXCh4IuxaCIHDKZmP4YiM1lq/qqycRIebsqBfx+IwG7H4Pjsze2vUYWaxHhMxYw6s2YutRxP3crzWvoj4XfWcDZAySUV/M6UBEJbij4VrRPrnML8zReWg40TeMLsIMh2SsMR8O0iNsC2vyJJv/m7AwJXI1Kot55smCQnnyLV0S5eyFpaRZepOXQf6uJV6BQ0YfO/lePByVCWmesopu6ohk5X6246g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J72CkctZpPAtd4pxFIzNOsuBlbACmMUg4Pp8wNZvhv4=;
 b=kyIpSHwYImNV4aiPZBYqHfHpPs+lWTQd/eHKNzpS8hcGMn9rvMHB1kjWVgKpBQDCVql6UcWP4AqydJ9AiPsKoyvspA0MkBtEWoaGjfZ1XuNKrjziVUnXr+jiOPmZ9DZTCRpeFHM8U33wmI5urjShmUg2PJUSl8yp1NgIi/zgZys=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2735.eurprd02.prod.outlook.com (10.171.106.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 08:49:00 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 08:49:00 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 01/10] vm_event: Define VM_EVENT type
Thread-Index: AQHVO/jtVFymlnJaSEejYjjrOofIFKbOgP6A
Date: Wed, 17 Jul 2019 08:49:00 +0000
Message-ID: <b5b9d063-2e54-aa36-9f2c-2027a5239dce@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <e42d2c771da20ac7d8e3bdf0351aea1a01b1600f.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <e42d2c771da20ac7d8e3bdf0351aea1a01b1600f.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::16) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef4828e4-d80c-48b6-2271-08d70a939cc4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2735; 
x-ms-traffictypediagnostic: VI1PR0202MB2735:|VI1PR0202MB2735:
x-microsoft-antispam-prvs: <VI1PR0202MB2735871AC0365043041998A2ABC90@VI1PR0202MB2735.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(7736002)(4326008)(99286004)(305945005)(66066001)(6246003)(53936002)(2906002)(54906003)(6512007)(8676002)(25786009)(2501003)(316002)(7416002)(110136005)(68736007)(446003)(2616005)(476003)(11346002)(4744005)(6486002)(6436002)(186003)(14454004)(53546011)(386003)(6506007)(229853002)(6116002)(3846002)(76176011)(86362001)(31696002)(8936002)(26005)(36756003)(52116002)(486006)(66556008)(64756008)(256004)(5660300002)(102836004)(66946007)(66476007)(478600001)(31686004)(66446008)(71190400001)(71200400001)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2735;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xcuPeJ73pqJ7O7bHQsVDssbR5zdg0GRXWFNMCQXlnCfC7Lgb4QOElHM/kiHZZ8hBAbTN84cIDqtZKG1tUvDpWKRkF5HNJU85LTPh2DVPlh9+Y8tM7og+RqeHmrim2SbK/HhNcfd72YrgTt4hr4qrCRk/s167svlEM9pJRvP0q/p0mkNSACvwTk+8uTddVu7/KC55wHFzqfpZVWzVrbaKcmhs+eGO9yXSunPI76LK1XgbSttoA6Jod+D+kzn3wF62k2Rp4WeXksCf9i/PgT1NY3ucKl9B036rpdXnBCjOMrW1JN3m8BSa4QqV2MWLypE7H7sQSEkpLqkqRwzxlZgAK9PC7ZAOlidvJ4aB9F2od+8FunLThsLjYT4O6+obuJZwjlvm9er4Oi3rPADELFqWSbg8aFcSYgnb7NlLyFNR5Oc=
Content-ID: <70766A7B6AB9E544AA8BC299CB3C256E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4828e4-d80c-48b6-2271-08d70a939cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 08:49:00.4986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2735
Subject: Re: [Xen-devel] [PATCH v2 01/10] vm_event: Define VM_EVENT type
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE2LjA3LjIwMTkgMjA6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4gQEAgLTEw
MDQsNyArOTQyLDcgQEAgc3RydWN0IHhlbl9kb21jdGxfcHNyX2NtdF9vcCB7DQo+ICAgICogRW5h
YmxlL2Rpc2FibGUgbW9uaXRvcmluZyB2YXJpb3VzIFZNIGV2ZW50cy4NCj4gICAgKiBUaGlzIGRv
bWN0bCBjb25maWd1cmVzIHdoYXQgZXZlbnRzIHdpbGwgYmUgcmVwb3J0ZWQgdG8gaGVscGVyIGFw
cHMNCj4gICAgKiB2aWEgdGhlIHJpbmcgYnVmZmVyICJNT05JVE9SIi4gVGhlIHJpbmcgaGFzIHRv
IGJlIGZpcnN0IGVuYWJsZWQNCj4gLSAqIHdpdGggdGhlIGRvbWN0bCBYRU5fRE9NQ1RMX1ZNX0VW
RU5UX09QX01PTklUT1IuDQo+ICsgKiB3aXRoIFhFTl9WTV9FVkVOVF9FTkFCTEUuDQoNClRoZSBh
Ym92ZSBjb21tZW50IHNob3VsZCBhbHNvIGJlIGFkanVzdGVkLg0KDQo+ICAgICoNCj4gICAgKiBH
RVRfQ0FQQUJJTElUSUVTIGNhbiBiZSB1c2VkIHRvIGRldGVybWluZSB3aGljaCBvZiB0aGVzZSBm
ZWF0dXJlcyBpcw0KPiAgICAqIGF2YWlsYWJsZSBvbiBhIGdpdmVuIHBsYXRmb3JtLg0KDQpBbGV4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
