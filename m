Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459D0B7A13
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:06:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAw6H-0003Zv-K6; Thu, 19 Sep 2019 13:03:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3dW=XO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iAw6F-0003Zb-GF
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:03:55 +0000
X-Inumbo-ID: ee1dd945-dadd-11e9-965d-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.110]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee1dd945-dadd-11e9-965d-12813bfff9fa;
 Thu, 19 Sep 2019 13:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeFY2S/VgJUggfaZeyxsy2k1nJd0oI5QIcar7kUaNenFbZrtfUtWDyuqdB2NIv9m+CTBa5005KsmWVPv34IUGWIZ/3OyeojAySQ005XpuR1WmDwVDIuOTXCQ1dqrOpWaLI7zfW3w1IhO5en8tBnjpzIfDZX+bgPyWqnP42Zb4c86QIsqPuLmI0ZIxqjEm0Q8sRAWMIkYCp1kXsJGtv8WwPUW44Z1tNGGGGYKbxHW56q7gTXweXGAr/SLmN54suvOdAYLM+0Gtcgv42gPTmyf6bb+IxVf9smc4vrCsI54W3st16gyRLG7zSez6HS2xqyw5IMIgzc4bOZkxDfVrjVO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIRWajWghNkrq4szqEY9+5WMUTCJksmqL2YeQ72nJ3g=;
 b=E2mIRB5OG6vGNL5sslQp1ySJGQfthT4KFrLXhalEtQpsqu91JZDkU6ohWwzWAPCWhijtwnUMt1udVTPiksE5pxNCiuIpI6cuwI5hRObhkHa2FmhZl0O1AbGyANd6y9UN1pSU35XbI6V3/ZkuScArweGmUSuK3ClbfdES1+sfLPFLuge/qKozt2am/6hW6LjlvEetJ4nsiSDDsviamOWmSwjWPwfNxWjxvOffRo5tjmr2R9H1kzf35G2h20kfGsQe/+gVT0KB+RChYWtsEKEZFy+7wdRJk0gb8I4VmCF5JWc3oZhN0vGvekcDMHZKdunhJjfj4U3v4XTXs63E0H9/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIRWajWghNkrq4szqEY9+5WMUTCJksmqL2YeQ72nJ3g=;
 b=p1eaD9qO8iRF0vwuOg4Ga86wx1IuIYUa5V7iobpAz2JYK1mhxCtiS/NKqbaV6XUDUaENO9Cu+0W6zGKK8D+5c2N6Q5/dEYScN/nbLG1p46AjMZ9l7NJ8OgjiEVY+a/ofKS6RAvpHtkQHmMQ1bEVCOGGSZdLrL0/joLcGXGsuulY=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5767.eurprd02.prod.outlook.com (10.141.171.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 13:03:52 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 13:03:52 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v11] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbuqvObi2c4eeME6qC/Xll4ji7A==
Date: Thu, 19 Sep 2019 13:03:52 +0000
Message-ID: <20190919130338.3132-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:101:16::30) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c7d8a0b-819d-48db-c296-08d73d01d1b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5767; 
x-ms-traffictypediagnostic: AM7PR02MB5767:|AM7PR02MB5767:|AM7PR02MB5767:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB57673681200F8EB18C85E89BAB890@AM7PR02MB5767.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(305945005)(6916009)(25786009)(7736002)(66556008)(1076003)(64756008)(2906002)(386003)(66476007)(66446008)(102836004)(66946007)(6506007)(256004)(99286004)(14444005)(30864003)(52116002)(2351001)(6116002)(5660300002)(2616005)(486006)(476003)(478600001)(86362001)(186003)(26005)(14454004)(6512007)(3846002)(66066001)(6436002)(71190400001)(8936002)(6486002)(8676002)(50226002)(36756003)(5640700003)(2501003)(71200400001)(54906003)(81166006)(81156014)(4326008)(316002)(3714002)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5767;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iO0AKsx5fTi1Moe1JbT/E++h9GVvUUdAouSwAOgVm0gU7qJiMGBnXUhycfamdpET2ScSh5DTvIdH2qxW04GCo/oc0NUL5nIyUVDFxXbRFkAfCzS9Obda1ToMHOiUOI5/yjQK9GeiUprkSj/BpiP+ln9Xdib11QZhbpXjze7nWHURG3Fvv5kL1BwJbD/tAU9IUggGOVsHNgEjD2allGu9hEuRDj+4cpDnnSxeMUPvLzUfPGxk8+oo46X0ND/Kvm9GczTkuzJ73dcXto87MaV+3tONhZ+sdFnhp5cEhRAhUcIJLGktdQQJfe5X2Z/jkseS60CjtEMokABCjJVpCl1DSnPgDc/Sk/48S3sUwIszhHuIe6Cn9JdI+lJD5B3MurC38MdRunGGjpTBMFwmjW8GaYQr0fXcSiR+jExHTfXgyuc=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7d8a0b-819d-48db-c296-08d73d01d1b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 13:03:52.0481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OdxpwWI/XfH3sk7oJHVw2wEVrh1NVYvmLQjbSDdx1NhgQ46ebSBt3xD7D6xyiKlL38viVRhCzZeuVFuXzJm9KZK0XLeqmh1Jgu0BZ0fZqIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5767
Subject: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QS9EIGJpdCB3cml0ZXMgKG9uIHBhZ2Ugd2Fsa3MpIGNhbiBiZSBjb25zaWRlcmVkIGJlbmlnbiBi
eSBhbiBpbnRyb3NwZWN0aW9uCmFnZW50LCBzbyByZWNlaXZpbmcgdm1fZXZlbnRzIGZvciB0aGVt
IGlzIGEgcGVzc2ltaXphdGlvbi4gV2UgdHJ5IGhlcmUgdG8Kb3B0aW1pemUgYnkgZmlsdGVyaW5n
IHRoZXNlIGV2ZW50cyBvdXQuCkN1cnJlbnRseSwgd2UgYXJlIGZ1bGx5IGVtdWxhdGluZyB0aGUg
aW5zdHJ1Y3Rpb24gYXQgUklQIHdoZW4gdGhlIGhhcmR3YXJlIHNlZXMKYW4gRVBUIGZhdWx0IHdp
dGggbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhLiBUaGlzIGlzLCBob3dldmVyLApp
bmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGltYXRl
bHkgY2F1c2UgYW4KRVBUIGZhdWx0IG9mIGl0cyBvd24gd2hpbGUgYWNjZXNzaW5nIGEgX2RpZmZl
cmVudF8gcGFnZSBmcm9tIHRoZSBvcmlnaW5hbCBvbmUsCndoZXJlIEEvRCB3ZXJlIHNldC4KVGhl
IHNvbHV0aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVtdWxhdGlvbiwgd2hpbGUgaWdub3Jp
bmcgRVBUIHJlc3RyaWN0aW9ucwpmb3IgdGhlIHdhbGsgcGFydCwgYW5kIHRha2luZyB0aGVtIGlu
dG8gYWNjb3VudCBmb3IgdGhlICJhY3R1YWwiIGVtdWxhdGluZyBvZgp0aGUgaW5zdHJ1Y3Rpb24g
YXQgUklQLiBXaGVuIHdlIHNlbmQgb3V0IGEgdm1fZXZlbnQsIHdlIGRvbid0IHdhbnQgdGhlIGVt
dWxhdGlvbgp0byBjb21wbGV0ZSwgc2luY2UgaW4gdGhhdCBjYXNlIHdlIHdvbid0IGJlIGFibGUg
dG8gdmV0byB3aGF0ZXZlciBpdCBpcyBkb2luZy4KVGhhdCB3b3VsZCBtZWFuIHRoYXQgd2UgY2Fu
J3QgYWN0dWFsbHkgcHJldmVudCBhbnkgbWFsaWNpb3VzIGFjdGl2aXR5LCBpbnN0ZWFkCndlJ2Qg
b25seSBiZSBhYmxlIHRvIHJlcG9ydCBvbiBpdC4KV2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVu
dCIgY2FzZSB3aGlsZSBlbXVsYXRpbmcsIHdlIG5lZWQgdG8gZmlyc3Qgc2VuZCB0aGUKZXZlbnQg
b3V0IGFuZCB0aGVuIHN1c3BlbmQgdGhlIGVtdWxhdGlvbiAocmV0dXJuIFg4NkVNVUxfUkVUUlkp
LgpBZnRlciB0aGUgZW11bGF0aW9uIHN0b3BzIHdlJ2xsIGNhbGwgaHZtX3ZtX2V2ZW50X2RvX3Jl
c3VtZSgpIGFnYWluIGFmdGVyIHRoZQppbnRyb3NwZWN0aW9uIGFnZW50IHRyZWF0cyB0aGUgZXZl
bnQgYW5kIHJlc3VtZXMgdGhlIGd1ZXN0LiBUaGVyZSwgdGhlCmluc3RydWN0aW9uIGF0IFJJUCB3
aWxsIGJlIGZ1bGx5IGVtdWxhdGVkICh3aXRoIHRoZSBFUFQgaWdub3JlZCkgaWYgdGhlCmludHJv
c3BlY3Rpb24gYXBwbGljYXRpb24gYWxsb3dzIGl0LCBhbmQgdGhlIGd1ZXN0IHdpbGwgY29udGlu
dWUgdG8gcnVuIHBhc3QKdGhlIGluc3RydWN0aW9uLgoKQSBjb21tb24gZXhhbXBsZSBpcyBpZiB0
aGUgaGFyZHdhcmUgZXhpdHMgYmVjYXVzZSBvZiBhbiBFUFQgZmF1bHQgY2F1c2VkIGJ5IGEKcGFn
ZSB3YWxrLCBwMm1fbWVtX2FjY2Vzc19jaGVjaygpIGRlY2lkZXMgaWYgaXQgaXMgZ29pbmcgdG8g
c2VuZCBhIHZtX2V2ZW50LgpJZiB0aGUgdm1fZXZlbnQgd2FzIHNlbnQgYW5kIGl0IHdvdWxkIGJl
IHRyZWF0ZWQgc28gaXQgcnVucyB0aGUgaW5zdHJ1Y3Rpb24KYXQgUklQLCB0aGF0IGluc3RydWN0
aW9uIG1pZ2h0IGFsc28gaGl0IGEgcHJvdGVjdGVkIHBhZ2UgYW5kIHByb3Zva2UgYSB2bV9ldmVu
dC4KCk5vdyBpZiBucGZlYy5raW5kID09IG5wZmVjX2tpbmRfaW5fZ3B0IGFuZCBkLT5hcmNoLm1v
bml0b3IuaW5ndWVzdF9wYWdlZmF1bHRfZGlzYWJsZWQKaXMgdHJ1ZSB0aGVuIHdlIGFyZSBpbiB0
aGUgcGFnZSB3YWxrIGNhc2UgYW5kIHdlIGNhbiBkbyB0aGlzIGVtdWxhdGlvbiBvcHRpbWl6YXRp
b24KYW5kIGVtdWxhdGUgdGhlIHBhZ2Ugd2FsayB3aGlsZSBpZ25vcmluZyB0aGUgRVBULCBidXQg
ZG9uJ3QgaWdub3JlIHRoZSBFUFQgZm9yIHRoZQplbXVsYXRpb24gb2YgdGhlIGFjdHVhbCBpbnN0
cnVjdGlvbi4KCkluIHRoZSBmaXJzdCBjYXNlIHdlIHdvdWxkIGhhdmUgMiBFUFQgZXZlbnRzLCBp
biB0aGUgc2Vjb25kIGNhc2Ugd2Ugd291bGQgaGF2ZQoxIEVQVCBldmVudCBpZiB0aGUgaW5zdHJ1
Y3Rpb24gYXQgdGhlIFJJUCB0cmlnZ2VycyBhbiBFUFQgZXZlbnQuCgpXZSB1c2UgaHZtZW11bF9t
YXBfbGluZWFyX2FkZHIoKSB0byBpbnRlcmNlcHQgd3JpdGUgYWNjZXNzIGFuZApfX2h2bV9jb3B5
KCkgdG8gaW50ZXJjZXB0IGV4ZWMgYW5kIHJlYWQgYWNjZXNzLgoKaHZtX2VtdWxhdGVfc2VuZF92
bV9ldmVudCgpIGNhbiByZXR1cm4gZmFsc2UgaWYgdGhlcmUgd2FzIG5vIHZpb2xhdGlvbiwKaWYg
dGhlcmUgd2FzIGFuIGVycm9yIGZyb20gbW9uaXRvcl90cmFwcygpIG9yIHAybV9nZXRfbWVtX2Fj
Y2VzcygpLgotRVNSQ0ggZnJvbSBwMm1fZ2V0X21lbV9hY2Nlc3MoKSBpcyB0cmVhdGVkIGFzIHJl
c3RyaWN0ZWQgYWNjZXNzLgoKTk9URTogaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgpIGFzc3Vt
ZXMgdGhlIGNhbGxlciB3aWxsIGNoZWNrCmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQKClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgoKLS0t
CkNoYW5nZXMgc2luY2UgVjEwOgoJLSBVc2UgbG9jYWwgdmFyIGN1cnIgaW5zdGVhZCBvZiBjdXJy
ZW50CgktIEFkZCBhIG5ldyBtZW1iZXIgaW4gZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0Cgkt
IENoZWNrIEhWTUNPUFlfbGluZWFyIGZsYWcgaW4gX19odm1fY29weSgpCgktIENvbnNpZGVyIC1F
U1JDSCBmcm9tIHAybV9nZXRfbWVtX2FjY2VzcygpIGFzIHJlc3RyaWN0ZWQKYWNjZXNzLgotLS0K
IHhlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jICAgICAgICB8IDE4ICsrKysrKy0KIHhlbi9hcmNo
L3g4Ni9odm0vaHZtLmMgICAgICAgICAgICB8IDEzICsrKysrCiB4ZW4vYXJjaC94ODYvaHZtL21v
bml0b3IuYyAgICAgICAgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jICAgICAgfCAgOCArKystCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9tb25pdG9yLmggfCAgMyArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3VwcG9y
dC5oIHwgIDEgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni92bV9ldmVudC5oICAgIHwgIDIgKwogNyBm
aWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0
ZS5jCmluZGV4IDM2YmNiNTI2ZDMuLmRkZjI0YTgzYzEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC01NDgs
NiArNTQ4LDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKAogICAgIHVu
c2lnbmVkIGludCBucl9mcmFtZXMgPSAoKGxpbmVhciArIGJ5dGVzIC0gISFieXRlcykgPj4gUEFH
RV9TSElGVCkgLQogICAgICAgICAobGluZWFyID4+IFBBR0VfU0hJRlQpICsgMTsKICAgICB1bnNp
Z25lZCBpbnQgaTsKKyAgICBnZm5fdCBnZm47CiAKICAgICAvKgogICAgICAqIG1mbiBwb2ludHMg
dG8gdGhlIG5leHQgZnJlZSBzbG90LiAgQWxsIHVzZWQgc2xvdHMgaGF2ZSBhIHBhZ2UgcmVmZXJl
bmNlCkBAIC01ODIsNyArNTgzLDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9h
ZGRyKAogICAgICAgICBBU1NFUlQobWZuX3goKm1mbikgPT0gMCk7CiAKICAgICAgICAgcmVzID0g
aHZtX3RyYW5zbGF0ZV9nZXRfcGFnZShjdXJyLCBhZGRyLCB0cnVlLCBwZmVjLAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwZmluZm8sICZwYWdlLCBOVUxMLCAmcDJtdCk7
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBmaW5mbywgJnBhZ2UsICZn
Zm4sICZwMm10KTsKIAogICAgICAgICBzd2l0Y2ggKCByZXMgKQogICAgICAgICB7CkBAIC02MDEs
NiArNjAyLDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKAogCiAgICAg
ICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dDoKICAgICAgICAgY2FzZSBIVk1UUkFOU19n
Zm5fc2hhcmVkOgorICAgICAgICBjYXNlIEhWTVRSQU5TX2JhZF9nZm5fYWNjZXNzOgogICAgICAg
ICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7CiAgICAgICAgICAgICBnb3RvIG91
dDsKIApAQCAtNjI2LDYgKzYyOCwxNCBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFy
X2FkZHIoCiAKICAgICAgICAgICAgIEFTU0VSVChwMm10ID09IHAybV9yYW1fbG9nZGlydHkgfHwg
IXAybV9pc19yZWFkb25seShwMm10KSk7CiAgICAgICAgIH0KKworICAgICAgICBpZiAoIHVubGlr
ZWx5KGN1cnItPmFyY2gudm1fZXZlbnQpICYmCisgICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9l
dmVudC0+c2VuZF9ldmVudCAmJgorICAgICAgICAgICAgIGh2bV9tb25pdG9yX2NoZWNrX3AybShh
ZGRyLCBnZm4sIHBmZWMsIG5wZmVjX2tpbmRfd2l0aF9nbGEpICkKKyAgICAgICAgeworICAgICAg
ICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7CisgICAgICAgICAgICBnb3RvIG91
dDsKKyAgICAgICAgfQogICAgIH0KIAogICAgIC8qIEVudGlyZSBhY2Nlc3Mgd2l0aGluIGEgc2lu
Z2xlIGZyYW1lPyAqLwpAQCAtMTE0MSw2ICsxMTUxLDcgQEAgc3RhdGljIGludCBsaW5lYXJfcmVh
ZCh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGludCBieXRlcywgdm9pZCAqcF9kYXRhLAog
CiAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0OgogICAgIGNhc2UgSFZNVFJBTlNfZ2Zu
X3NoYXJlZDoKKyAgICBjYXNlIEhWTVRSQU5TX2JhZF9nZm5fYWNjZXNzOgogICAgICAgICByZXR1
cm4gWDg2RU1VTF9SRVRSWTsKICAgICB9CiAKQEAgLTExOTIsNiArMTIwMyw3IEBAIHN0YXRpYyBp
bnQgbGluZWFyX3dyaXRlKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgaW50IGJ5dGVzLCB2
b2lkICpwX2RhdGEsCiAKICAgICBjYXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6CiAgICAgY2Fz
ZSBIVk1UUkFOU19nZm5fc2hhcmVkOgorICAgIGNhc2UgSFZNVFJBTlNfYmFkX2dmbl9hY2Nlc3M6
CiAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOwogICAgIH0KIApAQCAtMTg1Miw2ICsxODY0
LDggQEAgc3RhdGljIGludCBodm1lbXVsX3JlcF9tb3ZzKAogCiAgICAgeGZyZWUoYnVmKTsKIAor
ICAgIEFTU0VSVChyYyAhPSBIVk1UUkFOU19iYWRfZ2ZuX2FjY2Vzcyk7CisKICAgICBpZiAoIHJj
ID09IEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQgKQogICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRS
WTsKICAgICBpZiAoIHJjID09IEhWTVRSQU5TX2dmbl9zaGFyZWQgKQpAQCAtMTk2NCw2ICsxOTc4
LDggQEAgc3RhdGljIGludCBodm1lbXVsX3JlcF9zdG9zKAogICAgICAgICBpZiAoIGJ1ZiAhPSBw
X2RhdGEgKQogICAgICAgICAgICAgeGZyZWUoYnVmKTsKIAorICAgICAgICBBU1NFUlQocmMgIT0g
SFZNVFJBTlNfYmFkX2dmbl9hY2Nlc3MpOworCiAgICAgICAgIHN3aXRjaCAoIHJjICkKICAgICAg
ICAgewogICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6CmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwppbmRleCBmZGIx
ZTE3ZjU5Li40Y2MwNzdiYjNmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTMyMzYsNiArMzIzNiwxOSBAQCBzdGF0aWMg
ZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHkoCiAgICAgICAgICAgICByZXR1
cm4gSFZNVFJBTlNfYmFkX2dmbl90b19tZm47CiAgICAgICAgIH0KIAorICAgICAgICAvKgorICAg
ICAgICAgKiBJbiBjYXNlIGEgdm0gZXZlbnQgd2FzIHNlbnQgcmV0dXJuIHBhZ2VkX291dCBzbyB0
aGUgZW11bGF0aW9uIHdpbGwKKyAgICAgICAgICogc3RvcCB3aXRoIG5vIHNpZGUgZWZmZWN0Cisg
ICAgICAgICAqLworICAgICAgICBpZiAoIChmbGFncyAmIEhWTUNPUFlfbGluZWFyKSAmJgorICAg
ICAgICAgICAgIHVubGlrZWx5KHYtPmFyY2gudm1fZXZlbnQpICYmCisgICAgICAgICAgICAgdi0+
YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJgorICAgICAgICAgICAgIGh2bV9tb25pdG9yX2No
ZWNrX3AybShhZGRyLCBnZm4sIHBmZWMsIG5wZmVjX2tpbmRfd2l0aF9nbGEpICkKKyAgICAgICAg
eworICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7CisgICAgICAgICAgICByZXR1cm4gSFZNVFJB
TlNfYmFkX2dmbl9hY2Nlc3M7CisgICAgICAgIH0KKwogICAgICAgICBwID0gKGNoYXIgKilfX21h
cF9kb21haW5fcGFnZShwYWdlKSArIChhZGRyICYgflBBR0VfTUFTSyk7CiAKICAgICAgICAgaWYg
KCBmbGFncyAmIEhWTUNPUFlfdG9fZ3Vlc3QgKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9tb25pdG9yLmMgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwppbmRleCAyYTQxY2NjOTMw
Li43Y2E3ZjA5OGMwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwpAQCAtMjMsOCArMjMsMTAgQEAKICAqLwogCiAj
aW5jbHVkZSA8eGVuL3ZtX2V2ZW50Lmg+CisjaW5jbHVkZSA8eGVuL21lbV9hY2Nlc3MuaD4KICNp
bmNsdWRlIDx4ZW4vbW9uaXRvci5oPgogI2luY2x1ZGUgPGFzbS9odm0vbW9uaXRvci5oPgorI2lu
Y2x1ZGUgPGFzbS9hbHRwMm0uaD4KICNpbmNsdWRlIDxhc20vbW9uaXRvci5oPgogI2luY2x1ZGUg
PGFzbS9wYWdpbmcuaD4KICNpbmNsdWRlIDxhc20vdm1fZXZlbnQuaD4KQEAgLTIxNSw2ICsyMTcs
ODQgQEAgdm9pZCBodm1fbW9uaXRvcl9pbnRlcnJ1cHQodW5zaWduZWQgaW50IHZlY3RvciwgdW5z
aWduZWQgaW50IHR5cGUsCiAgICAgbW9uaXRvcl90cmFwcyhjdXJyZW50LCAxLCAmcmVxKTsKIH0K
IAorLyoKKyAqIFNlbmQgbWVtb3J5IGFjY2VzcyB2bV9ldmVudHMgYmFzZWQgb24gcGZlYy4gUmV0
dXJucyB0cnVlIGlmIHRoZSBldmVudCB3YXMKKyAqIHNlbnQgYW5kIGZhbHNlIGZvciBwMm1fZ2V0
X21lbV9hY2Nlc3MoKSBlcnJvciwgbm8gdmlvbGF0aW9uIGFuZCBldmVudCBzZW5kCisgKiBlcnJv
ci4gQXNzdW1lcyB0aGUgY2FsbGVyIHdpbGwgY2hlY2sgYXJjaC52bV9ldmVudC0+c2VuZF9ldmVu
dC4KKyAqLworYm9vbCBodm1fbW9uaXRvcl9jaGVja19wMm0odW5zaWduZWQgbG9uZyBnbGEsIGdm
bl90IGdmbiwgdWludDMyX3QgcGZlYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQx
Nl90IGtpbmQpCit7CisgICAgeGVubWVtX2FjY2Vzc190IGFjY2VzczsKKyAgICBzdHJ1Y3QgdmNw
dSAqY3VyciA9IGN1cnJlbnQ7CisgICAgdm1fZXZlbnRfcmVxdWVzdF90IHJlcSA9IHt9OworICAg
IHBhZGRyX3QgZ3BhID0gKGdmbl90b19nYWRkcihnZm4pIHwgKGdsYSAmIH5QQUdFX01BU0spKTsK
KyAgICBpbnQgcmM7CisKKyAgICBBU1NFUlQoY3Vyci0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVu
dCk7CisKKyAgICBjdXJyLT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50ID0gZmFsc2U7CisKKyAg
ICAvKgorICAgICAqIHAybV9nZXRfbWVtX2FjY2VzcygpIGNhbiBmYWlsIGZyb20gYSBpbnZhbGlk
IE1GTiBhbmQgcmV0dXJuIC1FU1JDSAorICAgICAqIGluIHdoaWNoIGNhc2UgYWNjZXNzIG11c3Qg
YmUgcmVzdHJpY3RlZC4KKyAgICAgKi8KKyAgICByYyA9IHAybV9nZXRfbWVtX2FjY2VzcyhjdXJy
LT5kb21haW4sIGdmbiwgJmFjY2VzcywgYWx0cDJtX3ZjcHVfaWR4KGN1cnIpKTsKKworICAgIGlm
ICggcmMgPT0gLUVTUkNIICkKKyAgICAgICAgYWNjZXNzID0gWEVOTUVNX2FjY2Vzc19uOworICAg
IGVsc2UgaWYgKCByYyApCisgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgIHN3aXRjaCAoIGFj
Y2VzcyApCisgICAgeworICAgIGNhc2UgWEVOTUVNX2FjY2Vzc194OgorICAgIGNhc2UgWEVOTUVN
X2FjY2Vzc19yeDoKKyAgICAgICAgaWYgKCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3MgKQorICAg
ICAgICAgICAgcmVxLnUubWVtX2FjY2Vzcy5mbGFncyA9IE1FTV9BQ0NFU1NfUiB8IE1FTV9BQ0NF
U1NfVzsKKyAgICAgICAgYnJlYWs7CisKKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3NfdzoKKyAgICBj
YXNlIFhFTk1FTV9hY2Nlc3Nfcnc6CisgICAgICAgIGlmICggcGZlYyAmIFBGRUNfaW5zbl9mZXRj
aCApCisgICAgICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZsYWdzID0gTUVNX0FDQ0VTU19YOwor
ICAgICAgICBicmVhazsKKworICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yOgorICAgIGNhc2UgWEVO
TUVNX2FjY2Vzc19uOgorICAgICAgICBpZiAoIHBmZWMgJiBQRkVDX3dyaXRlX2FjY2VzcyApCisg
ICAgICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfUiB8IE1FTV9B
Q0NFU1NfVzsKKyAgICAgICAgaWYgKCBwZmVjICYgUEZFQ19pbnNuX2ZldGNoICkKKyAgICAgICAg
ICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19YOworICAgICAgICBicmVh
azsKKworICAgIGNhc2UgWEVOTUVNX2FjY2Vzc193eDoKKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3Nf
cnd4OgorICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yeDJydzoKKyAgICBjYXNlIFhFTk1FTV9hY2Nl
c3NfbjJyd3g6CisgICAgY2FzZSBYRU5NRU1fYWNjZXNzX2RlZmF1bHQ6CisgICAgICAgIGJyZWFr
OworICAgIH0KKworICAgIGlmICggIXJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgKQorICAgICAgICBy
ZXR1cm4gZmFsc2U7IC8qIG5vIHZpb2xhdGlvbiAqLworCisgICAgaWYgKCBraW5kID09IG5wZmVj
X2tpbmRfd2l0aF9nbGEgKQorICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9B
Q0NFU1NfRkFVTFRfV0lUSF9HTEEgfAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1FTV9BQ0NFU1NfR0xBX1ZBTElEOworICAgIGVsc2UgaWYgKCBraW5kID09IG5wZmVjX2tpbmRf
aW5fZ3B0ICkKKyAgICAgICAgcmVxLnUubWVtX2FjY2Vzcy5mbGFncyB8PSBNRU1fQUNDRVNTX0ZB
VUxUX0lOX0dQVCB8CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNX0FDQ0VT
U19HTEFfVkFMSUQ7CisKKworICAgIHJlcS5yZWFzb24gPSBWTV9FVkVOVF9SRUFTT05fTUVNX0FD
Q0VTUzsKKyAgICByZXEudS5tZW1fYWNjZXNzLmdmbiA9IGdmbl94KGdmbik7CisgICAgcmVxLnUu
bWVtX2FjY2Vzcy5nbGEgPSBnbGE7CisgICAgcmVxLnUubWVtX2FjY2Vzcy5vZmZzZXQgPSBncGEg
JiB+UEFHRV9NQVNLOworCisgICAgcmV0dXJuIG1vbml0b3JfdHJhcHMoY3VyciwgdHJ1ZSwgJnJl
cSkgPj0gMDsKK30KKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jCmluZGV4IDAxNDRmOTJiOTguLjk0YzdmMmE4MGMgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3Mu
YwpAQCAtMjEwLDEwICsyMTAsMTYgQEAgYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVjayhwYWRkcl90
IGdwYSwgdW5zaWduZWQgbG9uZyBnbGEsCiAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKICAgICAg
ICAgfQogICAgIH0KKworICAgIC8qCisgICAgICogVHJ5IHRvIGF2b2lkIHNlbmRpbmcgYSBtZW0g
ZXZlbnQuIFN1cHByZXNzIGV2ZW50cyBjYXVzZWQgYnkgcGFnZS13YWxrcworICAgICAqIGJ5IGVt
dWxhdGluZyBidXQgc3RpbGwgY2hlY2tpbmcgbWVtX2FjY2VzcyB2aW9sYXRpb25zLgorICAgICAq
LwogICAgIGlmICggdm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9ldmVudF9tb25pdG9yKSAmJgog
ICAgICAgICAgZC0+YXJjaC5tb25pdG9yLmluZ3Vlc3RfcGFnZWZhdWx0X2Rpc2FibGVkICYmCi0g
ICAgICAgICBucGZlYy5raW5kICE9IG5wZmVjX2tpbmRfd2l0aF9nbGEgKSAvKiBkb24ndCBzZW5k
IGEgbWVtX2V2ZW50ICovCisgICAgICAgICBucGZlYy5raW5kID09IG5wZmVjX2tpbmRfaW5fZ3B0
ICkKICAgICB7CisgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgPSB0cnVlOwog
ICAgICAgICBodm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQoRU1VTF9LSU5EX05PUk1BTCwgVFJBUF9p
bnZhbGlkX29wLCBYODZfRVZFTlRfTk9fRUMpOwogCiAgICAgICAgIHJldHVybiB0cnVlOwpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vbW9uaXRvci5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vbW9uaXRvci5oCmluZGV4IGYxYWY0ZjgxMmEuLjMyNWI0NDY3NGQgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL21vbml0b3IuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS9tb25pdG9yLmgKQEAgLTQ5LDYgKzQ5LDkgQEAgdm9pZCBodm1fbW9uaXRv
cl9pbnRlcnJ1cHQodW5zaWduZWQgaW50IHZlY3RvciwgdW5zaWduZWQgaW50IHR5cGUsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZXJyLCB1aW50NjRfdCBjcjIpOwog
Ym9vbCBodm1fbW9uaXRvcl9lbXVsX3VuaW1wbGVtZW50ZWQodm9pZCk7CiAKK2Jvb2wgaHZtX21v
bml0b3JfY2hlY2tfcDJtKHVuc2lnbmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBm
ZWMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBraW5kKTsKKwogI2VuZGlm
IC8qIF9fQVNNX1g4Nl9IVk1fTU9OSVRPUl9IX18gKi8KIAogLyoKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL3N1cHBvcnQuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N1
cHBvcnQuaAppbmRleCBlOTg5YWE3MzQ5Li41MDljNTg2NzI3IDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9zdXBwb3J0LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
c3VwcG9ydC5oCkBAIC02MSw2ICs2MSw3IEBAIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCB7
CiAgICAgSFZNVFJBTlNfdW5oYW5kbGVhYmxlLAogICAgIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQs
CiAgICAgSFZNVFJBTlNfZ2ZuX3NoYXJlZCwKKyAgICBIVk1UUkFOU19iYWRfZ2ZuX2FjY2VzcywK
IH07CiAKIC8qCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3ZtX2V2ZW50LmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L3ZtX2V2ZW50LmgKaW5kZXggMjNlNjU1NzEwYi4uNjZkYjllMWUy
NSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni92bV9ldmVudC5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvdm1fZXZlbnQuaApAQCAtMzYsNiArMzYsOCBAQCBzdHJ1Y3QgYXJjaF92
bV9ldmVudCB7CiAgICAgYm9vbCBzZXRfZ3ByczsKICAgICAvKiBBIHN5bmMgdm1fZXZlbnQgaGFz
IGJlZW4gc2VudCBhbmQgd2UncmUgbm90IGRvbmUgaGFuZGxpbmcgaXQuICovCiAgICAgYm9vbCBz
eW5jX2V2ZW50OworICAgIC8qIFNlbmQgbWVtIGFjY2VzcyBldmVudHMgZnJvbSBlbXVsYXRvciAq
LworICAgIGJvb2wgc2VuZF9ldmVudDsKIH07CiAKIGludCB2bV9ldmVudF9pbml0X2RvbWFpbihz
dHJ1Y3QgZG9tYWluICpkKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
