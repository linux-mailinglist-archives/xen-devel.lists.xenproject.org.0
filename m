Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464676583
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:18:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqz7A-0006wm-U8; Fri, 26 Jul 2019 12:14:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hqz79-0006wh-RS
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:14:23 +0000
X-Inumbo-ID: e51e7c3c-af9e-11e9-a2f1-cb55725a51f3
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e51e7c3c-af9e-11e9-a2f1-cb55725a51f3;
 Fri, 26 Jul 2019 12:14:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5cZyEn7hyE3PQmBCaMAqivswg5FykkPzQYhxa7DuuiP4AlU653HUp34PNrCnLHOSZfA/7D8/2yG607uFJ22MXuKgLgAEQY1ojxNIM/n2pSIS2r1SfLH6ahW+62rIin+KmyYg4FreIEH9ae5RLi41AVqYTPEtl+/FMOFtXcTebE0AnnEGmQE0i05LnYRysg8ZE0ZTKFEWmQngx/eaKXSuMea4/MDUhhExOzdTgehz1eAMgyDG/w276R3z/7xfvzTpjZ6Wldb4/uZuehgSe7CLddFzFrkEL5MF5lakCw9z5NbpDGv3jhOCpCozZJ9fk1gftyNzmLL5aNRle996KwnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H54XAVwgHdg+c/E1a3DYbKZLR1mRZaFAXM5CO6aq9U=;
 b=STinN80QSPZL42KZ4AvelxeDQTtyOjn5UG1gi4vjlfOFTT5RsK9yzJeb6M1HYXpzpAUa1DApErqjsgx1X4n6WCUbkUIRJ+ZieiZH5e/vbEiE/3LbxF/ZgYiXIs9jupA0dY1lH+9eMF8/FXI1BoVegYTZ+aoJxVtwu4G4z+d9wKSTBVxoCmAUxX/SNb/NGGFrV0QvDQYXWBtD4G3gm8mXS4Nl3wOab+RB9FIQyojT6x3eXSk2tE0RyrD93ZwJ6ilPDVbvpP/XvZAU6y8l5wQI/E1T0MeDnaAzwUQJudlyfggbK0OVkHrteqVNVhRjSbAjDkuazwjH2ItusurkTJvO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H54XAVwgHdg+c/E1a3DYbKZLR1mRZaFAXM5CO6aq9U=;
 b=Em2/lHo4mVeIUOEvyE0oeRmMl96uEY3x/S0AigE9EeO30dMDDnITfTvid45MMyEnT4bAMH6ephRdsR2FG8t3FN8e5EArbnTgHotWiJgmSdhxrO0XaV/upW2Y656uqhdtJKO3sf4/H/56NCL3KIo8Lm0A3AJomlSFOTbfDK5lbW17LpamQvxd2cCyqkNGF7P6+K8FVyAAMySYPE7KTZIPUeC4txJDu9YWPeMF0BJxiXrqb7QKzZRZodch0tF/+RW8Rexdh4j6sG8szCiGp+QFbtgqIi0AXC0nj3UCT4u3XhwOuQfi+YzC0/JeufNKAOuc6TverAmqaE8W9F83O4rNtg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3873.eurprd03.prod.outlook.com (52.135.146.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 12:14:18 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 12:14:18 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/7] xen/public: arch-arm: Restrict the visibility of
 struct vcpu_guest_core_regs
Thread-Index: AQHVQZ6hsgvvUgy6i0qic4XYed3qyKbc1AwA
Date: Fri, 26 Jul 2019 12:14:17 +0000
Message-ID: <87r26dhu1z.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-2-julien.grall@arm.com>
In-Reply-To: <20190723213553.22300-2-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f358e379-974f-4111-bb60-08d711c2c874
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3873; 
x-ms-traffictypediagnostic: AM0PR03MB3873:
x-microsoft-antispam-prvs: <AM0PR03MB387341B7613385BC113B5ABFE6C00@AM0PR03MB3873.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(189003)(199004)(71190400001)(66946007)(68736007)(25786009)(64756008)(66476007)(446003)(229853002)(66556008)(2616005)(476003)(305945005)(256004)(81166006)(53936002)(7736002)(71200400001)(86362001)(11346002)(6246003)(26005)(6486002)(66446008)(102836004)(14454004)(6916009)(486006)(2906002)(6512007)(76116006)(8936002)(91956017)(66066001)(478600001)(55236004)(186003)(36756003)(4326008)(6436002)(54906003)(3846002)(76176011)(6116002)(6506007)(99286004)(81156014)(316002)(80792005)(8676002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3873;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jpPVgl6fFDczItxMrN5gKt39NcrH3DrWmXU1kfzlrfFHSnBel3WxEf5bzGwJD+R2Cq5WVUCNTZ6/iYzb1KuCS64q88KJdQbJHo9huM/IVc30EgqC3bNdFCC2n4Tz85Rq+WqsjBKoQO1aohbLBEMkvmgpzEEWI0iI8pDNe9xZOEXiBQMplnt3vvQRFl1voS0S4+Ed715ZF78xNhtNsmgDE/rMz/JDGLc7d6q4Br06Jpu+jmSBVodTQbjh2t3HiuljvakYvKroBv/2wb4NHQwSJGsbz6jlo0Am7T4ekg/o2yfqZOg8aznWbtATJ/jNRSB/4rjPk5kUH3Pnu4sWWY7lDAX1utrY6bAKPCiBkJsdvfLVC+ueWdkWQQJcfw9YE9ApJQYsLXFLwWpi9pSmCOXpfKeWUFtnDurKHQG5jEe8294=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f358e379-974f-4111-bb60-08d711c2c874
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:14:17.9835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3873
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

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEN1cnJlbnRseSwgdGhlIHN0cnVj
dHVyZSB2Y3B1X2d1ZXN0X2NvcmVfcmVncyBpcyBwYXJ0IG9mIHRoZSBwdWJsaWMgQVBJLgo+IFRo
aXMgaW1wbGllcyB0aGF0IGFueSBjaGFuZ2UgaW4gdGhlIHN0cnVjdHVyZSBzaG91bGQgYmUgYmFj
a3dhcmQKPiBjb21wYXRpYmxlLgo+Cj4gSG93ZXZlciwgdGhlIHN0cnVjdHVyZSBpcyBvbmx5IG5l
ZWRlZCBieSB0aGUgdG9vbHMgYW5kIFhlbi4gSXQgaXMgYWxzbwo+IG5vdCBleHBlY3RlZCB0byBi
ZSBldmVyIHVzZWQgb3V0c2lkZSBvZiB0aGF0IGNvbnRleHQuIFNvIHdlIGNvdWxkIHNhdmUgdXMK
PiBzb21lIGhlYWRhY2hlIGJ5IG9ubHkgZGVjbGFyaW5nIHRoZSBzdHJ1Y3R1cmUgZm9yIFhlbiBh
bmQgdG9vbHMuCj4KPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiAtLS0KPiAgICAgVGhpcyBpcyBhIGZvbGxvdy11cCBvZiB0aGUgZGlzY3Vzc2lv
biBbMV0uCj4KPiAgICAgWzFdIDwzYzI0NWM1Yi01MWM2LTFkMGUtYWQ2Yy00MjQxNDU3MzE2NmZA
YXJtLmNvbT4KPgo+ICAgICBDaGFuZ2VzIGluIHYzOgo+ICAgICAgICAgLSBBdm9pZCBpbnRyb2R1
Y2UgYSBuZXcgI2lmZGVmIGluIHRoZSBoZWFkZXIgYnkgbW92aW5nIHRoZQo+ICAgICAgICAgZGVm
aW5pdGlvbnMgbGF0ZXIgb24uCj4gLS0tCj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5o
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC1hcm0uaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4gaW5kZXgg
M2U4Y2RjMTUxZC4uN2NlMTM5YTBmNSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4gQEAgLTE5
Nyw2ICsxOTcsMTggQEAKPiAgICAgIH0gd2hpbGUgKCAwICkKPiAgI2RlZmluZSBzZXRfeGVuX2d1
ZXN0X2hhbmRsZShobmQsIHZhbCkgc2V0X3hlbl9ndWVzdF9oYW5kbGVfcmF3KGhuZCwgdmFsKQo+
ICAKPiArdHlwZWRlZiB1aW50NjRfdCB4ZW5fcGZuX3Q7Cj4gKyNkZWZpbmUgUFJJX3hlbl9wZm4g
UFJJeDY0Cj4gKyNkZWZpbmUgUFJJdV94ZW5fcGZuIFBSSXU2NAo+ICsKPiArLyogTWF4aW11bSBu
dW1iZXIgb2YgdmlydHVhbCBDUFVzIGluIGxlZ2FjeSBtdWx0aS1wcm9jZXNzb3IgZ3Vlc3RzLiAq
Lwo+ICsvKiBPbmx5IG9uZS4gQWxsIG90aGVyIFZDUFVTIG11c3QgdXNlIFZDUFVPUF9yZWdpc3Rl
cl92Y3B1X2luZm8gKi8KSnVzdCBhIHN1Z2dlc3Rpb246IHlvdSBhbHJlYWR5IHRvdWNoaW5nIHRo
aXMgcGFydC4gTWF5YmUgeW91J2xsIGZpeCB0aGlzCmNvbW1lbnQgYXMgd2VsbD8KCj4gKyNkZWZp
bmUgWEVOX0xFR0FDWV9NQVhfVkNQVVMgMQo+ICsKPiArdHlwZWRlZiB1aW50NjRfdCB4ZW5fdWxv
bmdfdDsKPiArI2RlZmluZSBQUklfeGVuX3Vsb25nIFBSSXg2NAo+ICsKPiArI2lmIGRlZmluZWQo
X19YRU5fXykgfHwgZGVmaW5lZChfX1hFTl9UT09MU19fKQo+ICAjaWYgZGVmaW5lZChfX0dOVUNf
XykgJiYgIWRlZmluZWQoX19TVFJJQ1RfQU5TSV9fKQo+ICAvKiBBbm9ueW1vdXMgdW5pb24gaW5j
bHVkZXMgYm90aCAzMi0gYW5kIDY0LWJpdCBuYW1lcyAoZS5nLiwgcjAveDApLiAqLwo+ICAjIGRl
ZmluZSBfX0RFQ0xfUkVHKG42NCwgbjMyKSB1bmlvbiB7ICAgICAgICAgIFwKPiBAQCAtMjcyLDE4
ICsyODQsNiBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2NvcmVfcmVnc190
KTsKPiAgCj4gICN1bmRlZiBfX0RFQ0xfUkVHCj4gIAo+IC10eXBlZGVmIHVpbnQ2NF90IHhlbl9w
Zm5fdDsKPiAtI2RlZmluZSBQUklfeGVuX3BmbiBQUkl4NjQKPiAtI2RlZmluZSBQUkl1X3hlbl9w
Zm4gUFJJdTY0Cj4gLQo+IC0vKiBNYXhpbXVtIG51bWJlciBvZiB2aXJ0dWFsIENQVXMgaW4gbGVn
YWN5IG11bHRpLXByb2Nlc3NvciBndWVzdHMuICovCj4gLS8qIE9ubHkgb25lLiBBbGwgb3RoZXIg
VkNQVVMgbXVzdCB1c2UgVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mbyAqLwo+IC0jZGVmaW5lIFhF
Tl9MRUdBQ1lfTUFYX1ZDUFVTIDEKPiAtCj4gLXR5cGVkZWYgdWludDY0X3QgeGVuX3Vsb25nX3Q7
Cj4gLSNkZWZpbmUgUFJJX3hlbl91bG9uZyBQUkl4NjQKPiAtCj4gLSNpZiBkZWZpbmVkKF9fWEVO
X18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykKPiAgc3RydWN0IHZjcHVfZ3Vlc3RfY29udGV4
dCB7Cj4gICNkZWZpbmUgX1ZHQ0Zfb25saW5lICAgICAgICAgICAgICAgICAgIDAKPiAgI2RlZmlu
ZSBWR0NGX29ubGluZSAgICAgICAgICAgICAgICAgICAgKDE8PF9WR0NGX29ubGluZSkKCgotLSAK
Vm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
