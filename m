Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670866BC82
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 14:41:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnjCL-0002Kw-Jz; Wed, 17 Jul 2019 12:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnjCJ-0002Kr-M5
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 12:38:15 +0000
X-Inumbo-ID: b4a841b6-a88f-11e9-87c2-4fc45f339990
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4a841b6-a88f-11e9-87c2-4fc45f339990;
 Wed, 17 Jul 2019 12:38:10 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 12:38:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 12:37:15 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 12:37:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwmLAXYB2z1ATW84Hq/nI7dBw9NkRRnQlLVQgYPTwTYhg5BXr3aXsUypQlOpyxflLysrB/2nn2TW73XHvA/Je8ZAeK5XBF8UY1xZpP9dQ250pnnrqBXquAKlvDyEgJQe3tpjzzzeK9DwQe8EcrZdcnr3uVliVE6iJkSAWwIQKa8b2OnKwBSBQRxrWrcptn/pZHxYWLZnenhE3TFDItY/3AyYjyb2TLlE1QRxFfRzFz8ph7tJ29Iiq/+MK+al0Tm/2cqdmWHqYyKVjlxu+6m1SqbiBhBDayt/TmAG9PHCY2A0h/OHhIXMtsm1oxGYWkRqsf2wlxv9iEdJ6KSh7P11Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2T2Tvw1o3ECpGv75JCNAJ9Ov6rBakQcKQ5cD0U/drNY=;
 b=NzvVyciVAxrgCgfIri/n4mvirvHgh+V14aDeEtS6KF8If6Kzl0V5J6VFbYluJ61WSK8o/ZkiPVWzFYE/PiQRTSSUsF/Jit0B7wIcCrQ8LbmkusId0rBnhfPYDByOy77cF81sL0pZ+OTHPbPvX/QqSIbbUnqfF6RhpFqY3od2kq75aCUoOFtQ8WDgZhjwudgX3c0IRi2dRcjv5wAGR4XYMZW8Syns9fh+aCN3Ni0aFrj4xFOKEEItOMeE6ni75ZIExDbWU9NhnQOo9ZGNV5T9bjiZ+q/zOiW+OqfshQB3dUqwtWdYMOFkoLwiajkz23hL244ZAx1zGMnPwcnS3WTVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2761.namprd18.prod.outlook.com (20.179.49.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 12:37:13 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 12:37:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Xen on Distros
Thread-Index: AQHVOxdKPvpxo6u4BUiqE8VCaQqJKabLmgAAgAAWKoD///HygIAAMmeAgAHYRQCAANGKAIAARDMA
Date: Wed, 17 Jul 2019 12:37:13 +0000
Message-ID: <16b8a491-4522-2da2-5bf2-a76d2f4eca5f@suse.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
 <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
 <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
 <35d77bc2-8d17-8686-c08e-211973ce49e5@suse.com>
 <76439de5430365dda0b83694444e59fa9cfdd3d0.camel@infradead.org>
 <21c9d3d4-831b-d8cd-5d81-3ce18b9f907e@citrix.com>
 <A91E670B-D372-4560-B32D-9A5142957907@citrix.com>
In-Reply-To: <A91E670B-D372-4560-B32D-9A5142957907@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::30)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b857926-b3df-4e99-0704-08d70ab37e74
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2761; 
x-ms-traffictypediagnostic: DM6PR18MB2761:
x-microsoft-antispam-prvs: <DM6PR18MB2761D12DAF9F10DB2451AD36B3C90@DM6PR18MB2761.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(199004)(189003)(2906002)(66066001)(186003)(229853002)(26005)(54906003)(4326008)(7736002)(71190400001)(80792005)(5660300002)(68736007)(305945005)(486006)(6916009)(71200400001)(14454004)(4744005)(76176011)(52116002)(102836004)(86362001)(8676002)(386003)(8936002)(31696002)(6506007)(81166006)(6436002)(81156014)(53546011)(3846002)(256004)(6246003)(99286004)(53936002)(446003)(14444005)(2616005)(6116002)(36756003)(476003)(316002)(11346002)(6512007)(66946007)(66476007)(66446008)(478600001)(25786009)(6486002)(66556008)(64756008)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2761;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VT3WN/DxYYx6mThOP0TN4bsP9lBNwelNTRooJifZSYu8SKo2jlUDbd0LLAIDhC6Xb/JDnmC3LaOHEnJnAY8/ge1FROeH3VmKEmcvafi7UCjJQwF6D1QtYUBwF9pgjVp52Y0jMV+hJBZ4nT3SYP0ovvzxbCyqsqWpI1Rwtijdd95GzlRvHi86gy1FFkDgN4eD0u3oR41tmsmV1QH2UymHVTJcrYIITeQsayIRj1tEoH8dvi5VF/3qyDj8WYZhM+GPTGOIpforL14a9FuZ9C0B9CAXAxuXhsOMGIrrB1qtpzoZqJtSyizB6zeCsKuf82lHhEpP0xlK6xASfzG7U9fWQR7zfVtQTclth2gQT8dVpY1WG2GBExMta3xZxJLTHoUUvdpQoy6YP4n5IC+ZSvfIU+0i5+KFROdsKCGb4pcBcrA=
Content-ID: <9829384F0A3D104497A2F6961041422C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b857926-b3df-4e99-0704-08d70ab37e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 12:37:13.4460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2761
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Amit Shah <amit@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxMjozMywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gDQo+PiBPbiBKdWwg
MTYsIDIwMTksIGF0IDExOjAzIFBNLCBBbmRyZXcgQ29vcGVyDQo+Pg0KPj4gV2UgY291bGQgdHJp
dmlhbGx5IHRocm93IHRoZSBmaXhlcyBpbnRvIHRoZSBicmFuY2gsIHRhZyBpdCwgc2lnbiBpdCBh
bmQNCj4+IHRocm93IGl0IG91dCBpbnRvIHRoZSBvcGVuLCBidXQgZG9pbmcgdGhhdCBvbiB0aGUg
ZW1iYXJnbyBkYXRlIGl0c2VsZg0KPj4gd291bGQgcmVzdWx0IGluIGFuIG9mZmljaWFsIHJlbGVh
c2Ugb2YgWGVuIHdoaWNoIGhhcyBoYWQgMCB0ZXN0aW5nIGluDQo+PiB0aGUgaW5jdW1iZW50IHRl
c3Qgc3lzdGVtLg0KPiANCj4gVGhlIHBvaW50IGlzIHRoYXQgYW55b25lIHdobyBzaGlwcyAvIGRl
cGxveXMgYSBmaXggb24gdGhlIGRpc2Nsb3N1cmUgZGF0ZQ0KPiBpcyBwcmV0dHkgbXVjaCBzaGlw
cGluZyBleGFjdGx5IHRoYXQuICBJZiBpdOKAmXMgbm90IGdvb2QgZW5vdWdoIHRvIHNpZ24sDQo+
IHdoeSBpcyBpdCBnb29kIGVub3VnaCB0byBkZXBsb3k/DQoNCkkgdGhpbmsgdGhlIHNlY3VyaXR5
IGZpeGVzIHRoZW1zZWx2ZXMgYXJlIGdvb2QgZW5vdWdoIHRvIGRlcGxveSwgcGVyaGFwcw0Kd2l0
aCB0aGUgYXNzdW1wdGlvbiB0aGF0IGNvbnN1bWVycyBvZiBvdXIgcHJlLWRpc2Nsb3N1cmUgbGlz
dCBoYXZlIGRvbmUNCnNvbWUgdGVzdGluZyBvbiB0aGVpciBvd24uIFRoZSBzdGFibGUgdHJlZXMs
IGhvd2V2ZXIsIGNvbnRhaW4gbW9yZSB0aGFuDQpqdXN0IHNlY3VyaXR5IGZpeGVzLCBhbmQgY2Fu
IGhhdmUgcmVncmVzc2lvbnMgKG1vc3QgbGlrZWx5IGR1ZSB0bw0KYmFja3BvcnRpbmcgbWlzdGFr
ZXMpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
