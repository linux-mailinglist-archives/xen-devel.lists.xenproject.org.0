Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E66BCBA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 15:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnja6-0004eg-Uj; Wed, 17 Jul 2019 13:02:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnja5-0004eb-AM
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 13:02:49 +0000
X-Inumbo-ID: 291a3489-a893-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 291a3489-a893-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 13:02:47 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 13:02:42 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 13:02:38 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 13:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFWaa1gxaWAosr7aRLbegI7GjDftiOiWLYKXRlumT+GGEZx0LjZI2HFrqKaHzYhSSoVvoeRLuxQ0Bu6ApDfXuYC0JvngEb+yhlckOVFiBZe0peSWVaNs3SIs3CTTWbzuBqG5uLgFcBG+d7dLdQlt4dSc+nNoipitm0IQBJiwzDxmm9noBDxxRb+DwJar2txhYURMrAiTiXyJG6i9aErZARpCRj9zoB7MHrtO4i4L8TpU+xa/xocpdPAJcZ1xHRYQEK1maQ0P8Enc/tqQWi+64gLE9jaEeHAUY5GTllemzNVHWYWNwnAQPK5rRQP2p/4HJqY7buIP97OD0pa36Fhn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVwRmtd/l/8/U9RojzdDiR0P2/PvfTdZLLYO6LWd1Pc=;
 b=VerQ9ukxyzXL1N12atIXclYJxkWbYEhzqFGrUB1VUo73iy6PwaDmtkvUaF915JGqP3TPY7lEhM+euzmxadSb25kH3Pc61tWlFhXRXJZm5mjJIUenjyPhI2J0Dsxji2YCNSztgy3x/nvO2/EdmJj+IaxkvPj1JGbIl5jddIynLkIscFA/3vxUoHDNhmlzUh0KYHXgDp/xe64UCIVIPiBOLpJ7xaO3osBNGGZwEWFHGKrpYZTJAui2jxEoIjhoCJ/Fa9U4fjt8Dl3m7CV1jP7aIJ/nCyQERCC85XtcJsIVdf/SENZoCrv7b6SmaC3xatbA864cnQn44YabU4w4V6rVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3372.namprd18.prod.outlook.com (10.255.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:02:37 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:02:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Live-Updating Xen
Thread-Index: AQHVOz84rrbZg3jr7UWo9Co44cwhi6bN7RdMgAB5rACAAEe/loAAGskA
Date: Wed, 17 Jul 2019 13:02:36 +0000
Message-ID: <ef9cc9b8-f8f1-b395-54a5-0c9d2e6715ef@suse.com>
References: <1563217075.6815.14.camel@amazon.com>
 <60587685-fbe9-116a-72e8-413eb7e99063@citrix.com>
 <c9053dcf-7c24-58b5-171a-a410653833f5@suse.com>
 <44e0c48b-2cba-c3fa-0d99-c14b413f98e2@citrix.com>
In-Reply-To: <44e0c48b-2cba-c3fa-0d99-c14b413f98e2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:b7::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d619afbb-5ddd-449e-f9ca-08d70ab70a81
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3372; 
x-ms-traffictypediagnostic: DM6PR18MB3372:
x-microsoft-antispam-prvs: <DM6PR18MB3372681B0C7E142183D24BFAB3C90@DM6PR18MB3372.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(199004)(189003)(76176011)(478600001)(80792005)(31696002)(66066001)(53546011)(52116002)(2906002)(6506007)(99286004)(25786009)(446003)(476003)(14454004)(7736002)(68736007)(386003)(14444005)(305945005)(8676002)(36756003)(186003)(11346002)(2616005)(26005)(53936002)(8936002)(31686004)(3846002)(6246003)(4326008)(6486002)(486006)(316002)(81166006)(229853002)(54906003)(81156014)(102836004)(256004)(66476007)(71190400001)(86362001)(6116002)(66946007)(66556008)(64756008)(66446008)(71200400001)(5660300002)(6916009)(6512007)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3372;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AcaN7kYqVBpm+w4vcgiIOlFszcIWQBm1oh5RP2Eme4bCrzgeFI1qpG97mjYhDUFZKOcDorIbTwLH1BIWhZ8Zr7nW5Pnarxc5bxAqnLqzo+Rutjta2OJQ+09UgNXAXPGDwwQRB3a0CTtK7Kxop63LcE21U4br7OTICEWI2FNzHM1ZckBcYDEOvOnwwPA2Tq+rpX8GSgFiryMoXdiSGZVAihAq/b8E8C+7A0DCTQpTpE1rH1/QYPE7tK5pNqSNgAs9fJBi4j7HKho4ayoUUlfkRWH5RK2Syf/HYlSYEPfpTwRjJSYhzMCxPIVr3Hjdhb9Aj7/7BPukHTpIPrmW27eGvUtA65skEDeuS6CEGtax/EPYM6qtJ2UXK4Qv/ADE41oVpiPHqULR/8RjJIMYQzszzHs1hivNuu5Nnq80+CdoAmI=
Content-ID: <1A8033C07996914F8ED4B2E15BE961AB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d619afbb-5ddd-449e-f9ca-08d70ab70a81
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:02:36.8737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3372
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
 Leonard Foerster <foersleo@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxMzoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDcvMjAx
OSAwODowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNy4wNy4yMDE5IDAxOjUxLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE1LzA3LzIwMTkgMTk6NTcsIEZvZXJzdGVyLCBMZW9u
YXJkIHdyb3RlOg0KPj4+PiAJKiBkb20wbGVzczogYm9vdHN0cmFwIGRvbWFpbnMgd2l0aG91dCB0
aGUgaW52b2x2ZW1lbnQgb2YgZG9tMA0KPj4+PiAJCS0+IHRoaXMgbWlnaHQgY29tZSBpbiBoYW5k
eSB0byBhdCBsZWFzdCBzZXR1cCBhbmQgY29udGludWUgZG9tMCBvbiB0YXJnZXQgeGVuDQo+Pj4+
IAkJLT4gSWYgd2UgaGF2ZSB0aGlzIHRoaXMgbWlnaHQgYWxzbyBlbmFibGUgdXMgdG8gZGUtc2Vy
aWFsaXplIHRoZSBzdGF0ZSBmb3INCj4+Pj4gCQkJb3RoZXIgZ3Vlc3QtZG9tYWlucyBpbiB4ZW4g
YW5kIG5vdCBoYXZlIHRvIHdhaXQgZm9yIGRvbTAgdG8gZG8gdGhpcw0KPj4+IFJlY29uc3RydWN0
aW9uIG9mIGRvbTAgaXMgc29tZXRoaW5nIHdoaWNoIFhlbiB3aWxsIGRlZmluaXRlbHkgbmVlZCB0
bw0KPj4+IGRvLsKgIFdpdGggdGhlIG1lbW9yeSBzdGlsbCBpbiBwbGFjZSwgaXRzIGp1c3QgYSBm
YWlybHkgc21hbGwgb2YgcmVnaXN0ZXINCj4+PiBzdGF0ZSB3aGljaCBuZWVkcyByZXN0b3Jpbmcu
DQo+Pj4NCj4+PiBUaGF0IHNhaWQsIHJlY29uc3RydWN0aW9uIG9mIHRoZSB0eXBlcmVmcyB3aWxs
IGJlIGFuIGlzc3VlLsKgIFdhbGtpbmcNCj4+PiBvdmVyIGEgZnVsbHkgcG9wdWxhdGVkIEw0IHRy
ZWUgY2FuIChpbiB0aGVvcnkpIHRha2UgbWludXRlcywgYW5kIGl0cyBub3QNCj4+PiBzYWZlIHRv
IGp1c3Qgc3RhcnQgZXhlY3V0aW5nIHdpdGhvdXQgcmVjb25zdHJ1Y3Rpb24uDQo+Pj4NCj4+PiBE
ZXBlbmRpbmcgb24gaG93IGJhZCBpdCBpcyBpbiBwcmFjdGljZSwgb25lIG9wdGlvbiBtaWdodCBi
ZSB0byBkbyBhDQo+Pj4gZGVtYW5kIHZhbGlkYXRlIG9mICVyaXAgYW5kICVyc3AsIGFsb25nIHdp
dGggYSBoeWJyaWQgc2hhZG93IG1vZGUgd2hpY2gNCj4+PiB0dXJucyBmYXVsdHMgaW50byB0eXBl
cmVmcywgd2hpY2ggd291bGQgYWxsb3cgdGhlIGdyb3NzIGNvc3Qgb2YNCj4+PiByZXZhbGlkYXRp
b24gdG8gYmUgYW1vcnRpc2VkIHdoaWxlIHRoZSB2Y3B1cyB3ZXJlIGV4ZWN1dGluZy7CoCBXZSB3
b3VsZA0KPj4+IGRlZmluaXRlbHkgd2FudCBzb21lIGtpbmQgb2YgbG9naWMgdG8gYWdncmVzc2l2
ZWx5IHR5cGVyZWYgb3V0c3RhbmRpbmcNCj4+PiBwYWdldGFibGVzIHNvIHRoZSBzaGFkb3cgbW9k
ZSBjb3VsZCBiZSB0dXJuZWQgb2ZmLg0KPj4gTmVpdGhlciB3YWxraW5nIHRoZSBwYWdlIHRhYmxl
IHRyZWVzIG5vciBhbmQgb24tZGVtYW5kIHJlLWNyZWF0aW9uIGNhbg0KPj4gcG9zc2libHkgd29y
aywgYXMgcG9pbnRlZCBvdXQgZHVyaW5nIChwYXJ0bHkgaW5mb3JtYWwpIGRpc2N1c3Npb246IEF0
DQo+PiB0aGUgdmVyeSBsZWFzdCB0aGUgYWxsb2NhdGVkIGFuZCBwaW5uZWQgc3RhdGVzIG9mIHBh
Z2VzIGNhbiBvbmx5IGJlDQo+PiB0cmFuc2ZlcnJlZC4NCj4gDQo+IFBpbm5lZCBzdGF0ZSBleGlz
dHMgaW4gdGhlIGN1cnJlbnQgbWlncmF0ZSBzdHJlYW0uwqAgQWxsb2NhdGVkIGRvZXMgbm90IC0N
Cj4gaXQgaXMgYW4gaW50ZXJuYWwgZGV0YWlsIG9mIGhvdyBYZW4gaGFuZGxlcyB0aGUgbWVtb3J5
Lg0KPiANCj4gQnV0IHllcyAtIHRoaXMgb2JzZXJ2YXRpb24gbWVhbnMgdGhhdCB3ZSBjYW4ndCBz
aW1wbHkgd2FsayB0aGUgZ3Vlc3QNCj4gcGFnZXRhYmxlcy4NCj4gDQo+PiBIZW5jZSB3ZSBzZWVt
IHRvIGhhdmUgY29tZSB0byBhZ3JlZW1lbnQgdGhhdCBzdHJ1Y3QNCj4+IHBhZ2VfaW5mbyBpbnN0
YW5jZXMgaGF2ZSB0byBiZSB0cmFuc2Zvcm1lZCAoaW4gcGxhY2UgaWYgcG9zc2libGUsIGkuZS4N
Cj4+IHdoZW4gdGhlIHNpemVzIG1hdGNoLCBvdGhlcndpc2UgYnkgY29weWluZykuDQo+IA0KPiAt
MTAgdG8gdGhpcyBpZGVhLCBpZiBpdCBjYW4gcG9zc2libHkgYmUgYXZvaWRlZC7CoCBJbiB0aGlz
IGNhc2UsIGl0DQo+IGRlZmluaXRlbHkgY2FuIGJlIGF2b2lkZWQuDQo+IA0KPiBXZSBkbyBub3Qg
d2FudCB0byBiZSBncm92ZWxsaW5nIGFyb3VuZCBpbiB0aGUgb2xkIFhlbidzIGRhdGFzdHJ1Y3R1
cmVzLA0KPiBiZWNhdXNlIHRoYXQgYWRkcyBhIGJpbmFyeSBBPT5CIHRyYW5zbGF0aW9uIHdoaWNo
IGlzDQo+IHBlci1vbGQtdmVyc2lvbi1vZi14ZW4sIG1lYW5pbmcgdGhhdCB5b3UgbmVlZCBhIGN1
c3RvbSBidWlsZCBvZiBlYWNoDQo+IHRhcmdldCBYZW4gd2hpY2ggZGVwZW5kcyBvbiB0aGUgY3Vy
cmVudGx5LXJ1bm5pbmcgWGVuLCBvciBoYXZlIHRvDQo+IG1haW50YWluIGEgbWF0cml4IG9mIG9s
ZCB2ZXJzaW9ucyB3aGljaCB3aWxsIGJlIGRlcGVuZGVudCBvbiB0aGUgbG9jYWwNCj4gY2hhbmdl
cywgYW5kIHRoZXJlZm9yZSBub3Qgc3VpdGFibGUgZm9yIHVwc3RyZWFtLg0KDQpOb3cgdGhlIHF1
ZXN0aW9uIGlzIHdoYXQgYWx0ZXJuYXRpdmUgeW91IHdvdWxkIHN1Z2dlc3QuIEJ5IHlvdQ0Kc2F5
aW5nICJ0aGUgcGlubmVkIHN0YXRlIGxpdmVzIGluIHRoZSBtaWdyYXRpb24gc3RyZWFtIiwgSSBh
c3N1bWUNCnlvdSBtZWFuIHRvIGltcGx5IHRoYXQgRG9tMCBzdGF0ZSBzaG91bGQgYmUgaGFuZGVk
IGZyb20gb2xkIHRvDQpuZXcgWGVuIHZpYSBzdWNoIGEgc3RyZWFtIChtaW51cyByYXcgZGF0YSBw
YWdlIGNvbnRlbnRzKT8NCg0KPj4+PiAJCS0+IFdlIG1pZ2h0IGhhdmUgdG8gZ28gYW5kIHJlLWlu
amVjdCBjZXJ0YWluIGludGVycnVwdHMNCj4+PiBXaGF0IGhhcmR3YXJlIGFyZSB5b3UgdGFyZ2V0
aW5nIGhlcmU/wqAgSXZ5QnJpZGdlIGFuZCBsYXRlciBoYXMgYSBwb3N0ZWQNCj4+PiBpbnRlcnJ1
cHQgZGVzY3JpcHRvciB3aGljaCBjYW4gYWNjdW11bGF0ZSBwZW5kaW5nIGludGVycnVwdHMgKGF0
IGxlYXN0DQo+Pj4gbWFudWFsbHkpLCBhbmQgbmV3ZXIgdmVyc2lvbnMgKEJyb2Fkd2VsbD8pIGNh
biBhY2N1bXVsYXRlIGludGVycnVwdHMNCj4+PiBkaXJlY3RseSBmcm9tIGhhcmR3YXJlLg0KPj4g
Rm9yIEhWTS9QVkggcGVyaGFwcyB0aGF0J3MgZ29vZCBlbm91Z2guIFdoYXQgYWJvdXQgUFYgdGhv
dWdoPw0KPiANCj4gV2hhdCBhYm91dCBQVj8NCj4gDQo+IFRoZSBpbi1ndWVzdCBldnRjaG4gZGF0
YSBzdHJ1Y3R1cmUgd2lsbCBhY2N1bXVsYXRlIGV2ZW50cyBqdXN0IGxpa2UgYQ0KPiBwb3N0ZWQg
aW50ZXJydXB0IGRlc2NyaXB0b3IuwqAgUmVhbCBpbnRlcnJ1cHRzIHdpbGwgcXVldWUgaW4gdGhl
IExBUElDDQo+IGR1cmluZyB0aGUgdHJhbnNpdGlvbiBwZXJpb2QuDQoNClllcywgdGhhdCdsbCB3
b3JrIGFzIGxvbmcgYXMgaW50ZXJydXB0cyByZW1haW4gYWN0aXZlIGZyb20gWGVuJ3MgUE9WLg0K
QnV0IGlmIHRoZXJlJ3MgY29uY2VybiBhYm91dCBhIGJsYWNrb3V0IHBlcmlvZCBmb3IgSFZNL1BW
SCwgdGhlbg0Kc3VyZWx5IHRoZXJlIHdvdWxkIGFsc28gYmUgc3VjaCBmb3IgUFYuDQoNCj4+Pj4g
QSBrZXkgY29ybmVyc3RvbmUgZm9yIExpdmUtdXBkYXRlIGlzIGd1ZXN0IHRyYW5zcGFyZW50IGxp
dmUgbWlncmF0aW9uDQo+Pj4+IAktPiBUaGlzIG1lYW5zIHdlIGFyZSB1c2luZyBhIHdlbGwgZGVm
aW5lZCBBQkkgZm9yIHNhdmluZy9yZXN0b3JpbmcgZG9tYWluIHN0YXRlDQo+Pj4+IAkJLT4gV2Ug
ZG8gb25seSByZWx5IG9uIGRvbWFpbiBzdGF0ZSBhbmQgbm8gaW50ZXJuYWwgeGVuIHN0YXRlDQo+
Pj4gQWJzb2x1dGVseS7CoCBPbmUgaXNzdWUgSSBkaXNjdXNzZWQgd2l0aCBEYXZpZCBhIHdoaWxl
IGFnbyBpcyB0aGF0IGV2ZW4NCj4+PiBhY3Jvc3MgYW4gdXBncmFkZSBvZiBYZW4sIHRoZSBmb3Jt
YXQgb2YgdGhlIEVQVC9OUFQgcGFnZXRhYmxlcyBtaWdodA0KPj4+IGNoYW5nZSwgYXQgbGVhc3Qg
aW4gdGVybXMgb2YgdGhlIGxheW91dCBvZiBzb2Z0d2FyZSBiaXRzLsKgIChFc3BlY2lhbGx5DQo+
Pj4gZm9yIEVQVCB3aGVyZSB3ZSBzbG93bHkgbG9zZSBzb2Z0d2FyZSBiaXRzIHRvIG5ldyBoYXJk
d2FyZSBmZWF0dXJlcyB3ZQ0KPj4+IHdpc2ggdG8gdXNlLikNCj4+IFJpZ2h0LCBhbmQgdGhlcmVm
b3JlIGEgc2ltaWxhciB0cmFuc2Zvcm1hdGlvbiBsaWtlIGZvciBzdHJ1Y3QgcGFnZV9pbmZvDQo+
PiBtYXkgYmUgdW5hdm9pZGFibGUgaGVyZSB0b28uDQo+IA0KPiBOb25lIG9mIHRoYXQgbGl2ZXMg
aW4gdGhlIGN1cnJlbnQgbWlncmF0ZSBzdHJlYW0uwqAgQWdhaW4gLSBpdCBpcw0KPiBpbnRlcm5h
bCBkZXRhaWxzLCBzbyBpcyBub3Qgc29tZXRoaW5nIHdoaWNoIGlzIGFwcHJvcHJpYXRlIHRvIGJl
DQo+IGluc3BlY3RlZCBieSB0aGUgdGFyZ2V0IFhlbi4NCj4gDQo+PiBSZS11c2luZyBsYXJnZSBk
YXRhIHN0cnVjdHVyZXMgKG9yIGFycmF5cyB0aGVyZW9mKSBtYXkgYWxzbyB0dXJuIG91dA0KPj4g
dXNlZnVsIGluIHRlcm1zIG9mIGxhdGVuY3kgdW50aWwgdGhlIG5ldyBYZW4gYWN0dWFsbHkgYmVj
b21lcyByZWFkeSB0bw0KPj4gcmVzdW1lLg0KPiANCj4gV2hlbiBpdCBjb21lcyB0byBvcHRpbWlz
aW5nIHRoZSBsYXRlbmN5LCB0aGVyZSBpcyBhIGZhaXIgYW1vdW50IHdlIG1pZ2h0DQo+IGJlIGFi
bGUgdG8gZG8gYWhlYWQgb2YgdGhlIGNyaXRpY2FsIHJlZ2lvbiwgYnV0IEkgc3RpbGwgdGhpbmsg
dGhpcyB3b3VsZA0KPiBiZSBiZXR0ZXIgZG9uZSBpbiB0ZXJtcyBvZiBhICJjbGVhbiBzdGFydCIg
aW4gdGhlIG5ldyBYZW4gdG8gcmVkdWNlDQo+IGJpbmFyeSBkZXBlbmRlbmNlcy4NCg0KTGF0ZW5j
eSBhY3R1YWxseSBpcyBvbmx5IG9uZSBhc3BlY3QgKGFsYmVpdCB0aGUgbGFyZ2VyIHRoZSBob3N0
LCB0aGUgbW9yZQ0KcmVsZXZhbnQgaXQgaXMpLiBTdWZmaWNpZW50IG1lbW9yeSB0byBoYXZlIGJv
dGggb2xkIGFuZCBuZXcgY29waWVzIG9mIHRoZQ0KZGF0YSBzdHJ1Y3R1cmVzIGluIHBsYWNlLCBw
bHVzIHRoZSBtaWdyYXRpb24gc3RyZWFtLCBpcyBhbm90aGVyLiBUaGlzDQp3b3VsZCBlc3BlY2lh
bGx5IGJlY29tZSByZWxldmFudCB3aGVuIGV2ZW4gRG9tVS1zIHdlcmUgdG8gcmVtYWluIGluDQpt
ZW1vcnksIHJhdGhlciB0aGFuIGdldHRpbmcgc2F2ZWQvcmVzdG9yZWQuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
