Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83776736
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:20:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr064-0004tX-J2; Fri, 26 Jul 2019 13:17:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hr062-0004tO-FH
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:17:18 +0000
X-Inumbo-ID: b00b25af-afa7-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::610])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b00b25af-afa7-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+VP7t4FbGne2Xw85nAePkXB/ZRY9Fw5GqqCYRx+Z8TNP5T2rfHBQ6G8VIBOGmqqx4/k9OE+NcxntWbxsnwP5SaRjHvNnagj/ki1p+f0d1AWEgyAZeNdC/htH6vLysIi8mMsP4plIsMagwHdIDBehSTGbs8LfEV6BoHu/+uG769Pc/mAc46oaeebug+Ma7TY5PT4MfNRnlZx/ESjdnhTA9dxMxPs1QHq2RydKKGdZfIgwdhPjhTUXrz/GrualD2r1+boszH2TvcsxJga2isdY6+e8boYvDTHqvPWW870PGGo5Q5DlZq8qfXETH0TN6J+wAgCxvqwNKDFtyWWLqgcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ip1B4LWSjNFJKTPuwqQb3NBFIWfNROcM1S1B7JSbzZw=;
 b=F+atZMI+4FA7HjctfxF/kVpO92PiStI2+k1UMd7xVfgVzEICq2uOeDoUlDb0+Izkar6oz+33PzSS6PKazljWPPCUZarfEXzrQ1B4syZl2Chs5783HPpdUmx1SXrPiYPSf6nujEB4bgrcHOCp04dqvIGGQvIjqn70cVj2RIdEsn3jMg/5A59r6PsiyFmADwvhU0CCigKcM4XhTFdOPBhF1PZO4d6fzCanZlccuZ5FwH6RppTdkVqxyICjzE0U7J0vwB5Df4f5kZKzl9MyYPrqrbfSlkqONnfjlOTGSZhQw3L8w+Q7CpOFKLNYklfVXEqCbUWQcRDqDmHsTc+CmxmzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ip1B4LWSjNFJKTPuwqQb3NBFIWfNROcM1S1B7JSbzZw=;
 b=diHb2toztfZa2TFDA/Rv/R5oQT14peBuUwxCKb+iD6eF2w8hQEW4GYfnWXkkQLei3KfUJdI80mAI/RSTeRWl92gPjPZRYq7UAJsKCnrSVWauqc9O/i/nGo2WMEeLXidbWEohZD0feYCXLGD6wlKe5nRicm2BVdDXT1rC0E4QemR8vucwuX7UxoV2kVtkUjZGs3FFJI5M5eHhcm3tiCm+i2XT5w8FRi808TJS1QkqLnQc0ep7g2IO+wJT+vpT30/jv4KxsyEzkt1fa6UmA12yU3DNgpcicsv3lfdhLrVjZMsmplr6bMUnhkQUv8hxHkrsXs8hoVLSynQOBS1gzZUBrA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0SPR01MB0074.eurprd03.prod.outlook.com (20.179.253.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 13:17:14 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 13:17:14 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/7] xen/public: arch-arm: Restrict the visibility of
 struct vcpu_guest_core_regs
Thread-Index: AQHVQZ6hsgvvUgy6i0qic4XYed3qyKbc1AwAgAALaACAAAYugA==
Date: Fri, 26 Jul 2019 13:17:14 +0000
Message-ID: <87h879hr52.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-2-julien.grall@arm.com> <87r26dhu1z.fsf@epam.com>
 <b93a7a7e-970f-b550-bd0e-b31ac8e62975@arm.com>
In-Reply-To: <b93a7a7e-970f-b550-bd0e-b31ac8e62975@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80ff965e-509d-4e88-6f3f-08d711cb9351
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0SPR01MB0074; 
x-ms-traffictypediagnostic: AM0SPR01MB0074:|AM0SPR01MB0074:
x-microsoft-antispam-prvs: <AM0SPR01MB007401BD48CE7A7898AC26F8E6C00@AM0SPR01MB0074.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(316002)(6246003)(3846002)(14444005)(256004)(66476007)(6116002)(81166006)(81156014)(66066001)(66946007)(86362001)(6486002)(8676002)(64756008)(6436002)(478600001)(36756003)(66556008)(486006)(71200400001)(55236004)(446003)(11346002)(6512007)(6506007)(2616005)(14454004)(76176011)(476003)(53546011)(229853002)(99286004)(53936002)(8936002)(186003)(76116006)(5660300002)(4326008)(54906003)(7736002)(68736007)(25786009)(26005)(2906002)(305945005)(6916009)(71190400001)(66446008)(80792005)(102836004)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB0074;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gz7jR7mU3bPbXMob+Ab9QLyBEWkpyB67FtKjV4hZOxXgDV96shVF5cEQYhrfL9Jzuof81JHtlA+uN9MFTWhz6I6i0FxF2oUrNUI/G58313iO4wjjLUxexxMWz+bsbgkNoLUDvVXrhDlszUMh2nAoSSPMHwVHHfFeQK+cGYtFOygzCbvwulqzJ7wLHRDo+hcxzboorf/CnZdpbEt5HE64Gyypz3fvFkCD1o5Ev/+kdzmlYV/5FBRKAR16xYARAmkTFQQNigMmk5WtfDPERoIwm1UM1yRS5Z+O9mnLT1aNBQJUWSpf3LmIoFXjnrJSqb6tcTd1HimniL8OTMsfAcj0/XuEyW+KxHP11ZWCiBpoawHOmt6nFhsl5SgQf1cWA1TY6BBBGfCdtZU8D65O5xXTdnHYuso4ypLlEhwA34b1Zek=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ff965e-509d-4e88-6f3f-08d711cb9351
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 13:17:14.2965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB0074
Subject: Re: [Xen-devel] [PATCH 1/7] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDI2LzA3LzIwMTkgMTM6MTQsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pgo+PiBIaSBKdWxpZW4sCj4KPiBIaSBWb2xvZHlteXIsCj4KPj4gSnVs
aWVuIEdyYWxsIHdyaXRlczoKPj4KPj4+IEN1cnJlbnRseSwgdGhlIHN0cnVjdHVyZSB2Y3B1X2d1
ZXN0X2NvcmVfcmVncyBpcyBwYXJ0IG9mIHRoZSBwdWJsaWMgQVBJLgo+Pj4gVGhpcyBpbXBsaWVz
IHRoYXQgYW55IGNoYW5nZSBpbiB0aGUgc3RydWN0dXJlIHNob3VsZCBiZSBiYWNrd2FyZAo+Pj4g
Y29tcGF0aWJsZS4KPj4+Cj4+PiBIb3dldmVyLCB0aGUgc3RydWN0dXJlIGlzIG9ubHkgbmVlZGVk
IGJ5IHRoZSB0b29scyBhbmQgWGVuLiBJdCBpcyBhbHNvCj4+PiBub3QgZXhwZWN0ZWQgdG8gYmUg
ZXZlciB1c2VkIG91dHNpZGUgb2YgdGhhdCBjb250ZXh0LiBTbyB3ZSBjb3VsZCBzYXZlIHVzCj4+
PiBzb21lIGhlYWRhY2hlIGJ5IG9ubHkgZGVjbGFyaW5nIHRoZSBzdHJ1Y3R1cmUgZm9yIFhlbiBh
bmQgdG9vbHMuCj4+Pgo+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPj4+IC0tLQo+Pj4gICAgICBUaGlzIGlzIGEgZm9sbG93LXVwIG9mIHRo
ZSBkaXNjdXNzaW9uIFsxXS4KPj4+Cj4+PiAgICAgIFsxXSA8M2MyNDVjNWItNTFjNi0xZDBlLWFk
NmMtNDI0MTQ1NzMxNjZmQGFybS5jb20+Cj4+Pgo+Pj4gICAgICBDaGFuZ2VzIGluIHYzOgo+Pj4g
ICAgICAgICAgLSBBdm9pZCBpbnRyb2R1Y2UgYSBuZXcgI2lmZGVmIGluIHRoZSBoZWFkZXIgYnkg
bW92aW5nIHRoZQo+Pj4gICAgICAgICAgZGVmaW5pdGlvbnMgbGF0ZXIgb24uCj4+PiAtLS0KPj4+
ICAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggfCAyNCArKysrKysrKysrKystLS0tLS0t
LS0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+PiBpbmRleCAzZThjZGMxNTFkLi43Y2Ux
MzlhMGY1IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgKPj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+PiBAQCAtMTk3LDYgKzE5Nywx
OCBAQAo+Pj4gICAgICAgfSB3aGlsZSAoIDAgKQo+Pj4gICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3Rf
aGFuZGxlKGhuZCwgdmFsKSBzZXRfeGVuX2d1ZXN0X2hhbmRsZV9yYXcoaG5kLCB2YWwpCj4+PiAg
ICt0eXBlZGVmIHVpbnQ2NF90IHhlbl9wZm5fdDsKPj4+ICsjZGVmaW5lIFBSSV94ZW5fcGZuIFBS
SXg2NAo+Pj4gKyNkZWZpbmUgUFJJdV94ZW5fcGZuIFBSSXU2NAo+Pj4gKwo+Pj4gKy8qIE1heGlt
dW0gbnVtYmVyIG9mIHZpcnR1YWwgQ1BVcyBpbiBsZWdhY3kgbXVsdGktcHJvY2Vzc29yIGd1ZXN0
cy4gKi8KPj4+ICsvKiBPbmx5IG9uZS4gQWxsIG90aGVyIFZDUFVTIG11c3QgdXNlIFZDUFVPUF9y
ZWdpc3Rlcl92Y3B1X2luZm8gKi8KPj4gSnVzdCBhIHN1Z2dlc3Rpb246IHlvdSBhbHJlYWR5IHRv
dWNoaW5nIHRoaXMgcGFydC4gTWF5YmUgeW91J2xsIGZpeCB0aGlzCj4+IGNvbW1lbnQgYXMgd2Vs
bD8KPgo+IEkgYW0gbm90IHN1cmUgd2hhdCdzIHdyb25nIHdpdGggdGhlIGN1cnJlbnQgY29tbWVu
dC4gQ2FuIHlvdSBleHBhbmQKPiB5b3VyIHRob3VnaHRzIHBsZWFzZT8KU3VyZS4gSXQgZG9lcyBu
b3QgY29uZm9ybSB0byBDT0RJTkdfU1RZTEU6CgogICBDb21tZW50cyBjb250YWluaW5nIGEgc2lu
Z2xlIHNlbnRlbmNlIG1heSBlbmQgd2l0aCBhIGZ1bGwKICAgc3RvcDsgY29tbWVudHMgY29udGFp
bmluZyBzZXZlcmFsIHNlbnRlbmNlcyBtdXN0IGhhdmUgYSBmdWxsIHN0b3AKICAgYWZ0ZXIgZWFj
aCBzZW50ZW5jZS4KClRoZSBzZWNvbmQgY29tbWVudCBtaXNzZXMgZnVsbCBzdG9wIGF0IHRoZSBl
bmQuIEFsc28sIG1heWJlIHdlIHNob3VsZApjb25zaWRlciB0aGlzIGFzIHMgbXVsdGktbGluZSBj
b21tZW50OgoKICAgTXVsdGktbGluZSBjb21tZW50IGJsb2NrcyBzaG91bGQgc3RhcnQgYW5kIGVu
ZCB3aXRoIGNvbW1lbnQgbWFya2VycyBvbgogICBzZXBhcmF0ZSBsaW5lcyBhbmQgZWFjaCBsaW5l
IHNob3VsZCBiZWdpbiB3aXRoIGEgbGVhZGluZyAnKicuCgoKLS0gClZvbG9keW15ciBCYWJjaHVr
IGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
