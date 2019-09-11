Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F1B0327
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 19:52:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i86jU-0007mI-8h; Wed, 11 Sep 2019 17:48:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1gu=XG=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i86jS-0007mD-V1
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 17:48:42 +0000
X-Inumbo-ID: 6418a282-d4bc-11e9-978d-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6418a282-d4bc-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 17:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ity8Iv1UgPrJF2DGG+Neb6dmHGQuciPBs9cYnsznbSv9AbuA9l5frr2oyljzzkPMjA9vgR1DAwZoTqJuBJnvkBeLPcIDxE0d/fq204SKo1S0PyzYKHaxQpwS1YwNxax5HcjRCuaerCliNwKcVgYf6s2XyP1sPhbTwBK8j4Ew6fZdb19AgnKLDxpRdyi7H01lwC0r9uCIIOKxcKu1BH3e8CJXlotDrjfkgM7Mne2nSRAF/u2Zk9bvgPkGlCBs+r2NTCpsXSrYzA16i+NVgup7ra1BaPyCbA+Ay7CzcijsQPXDDPSOvDcTii8o1I7vv/Yn8mF1KdD5U41oC8UwsgRpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0DqDsV2z1KJgHZHrewbuRWL5ZqktPsVThRHGVzBcy4=;
 b=Z50Dp91wWGEzwbuo6o6vL/8i8yHca/nhdcoKjLa93FY7U8zASvZX37pgtlz8j5NJb85hJvObOPj20c9Bt5SiNa7zz15RuMn3zKTv2u4s3r221BfDH8C/7k03GzOrP4bDzWcCubBEjyXVFz/GmhhMsubNiOGBy0BPxRiOFigY5vmOdWtWhAPhzMD2W8Ja1gYnXmqr/UzuKz8Fag/pcyz1Zqz7eJddAn7yaA5whDblELhwa2Nr+98ocw95JnZ/5seEUFoguazKTwYRCTy+YFw3PKHxDUgHF+/z6EbO5jfX0HlYlKfTPfTGjtFNq/wXtQwlLdR4SVUpd0jGRmxpz+uQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0DqDsV2z1KJgHZHrewbuRWL5ZqktPsVThRHGVzBcy4=;
 b=IXy0GdmWn89Lr/eplKG2rw89jO4V4PjrPOiDSBHqyxoF0E5ZBf5KQWTLeKLBNZ/Qvige7G9USrOEqSViHJxfxTujPdy8PmHpgoE1dB5qKl+49cqPxbQl0fL9hzXzCEIh7z/tx0HPRLHZyXjD7rS+IHSaSYritjeRj8QPbeJkr7I=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4658.eurprd03.prod.outlook.com (20.177.41.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 17:48:40 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 11 Sep 2019
 17:48:33 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [RFC 4/9] arm64: utilize time accounting
Thread-Index: AQHVaIw6MLUGOcq9k0Wum1GxgvSav6cmwSgA
Date: Wed, 11 Sep 2019 17:48:33 +0000
Message-ID: <87pnk6g1vz.fsf@epam.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-5-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1568197942-15374-5-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3263b6c6-ab96-467a-ef88-08d736e04402
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4658; 
x-ms-traffictypediagnostic: AM0PR03MB4658:|AM0PR03MB4658:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB46588728D2882AE2CCD22E07E6B10@AM0PR03MB4658.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(199004)(189003)(11346002)(86362001)(54906003)(76176011)(6436002)(80792005)(2616005)(81156014)(81166006)(66066001)(102836004)(476003)(26005)(15650500001)(66946007)(316002)(486006)(8676002)(4326008)(305945005)(7736002)(186003)(53936002)(8936002)(66556008)(99286004)(64756008)(107886003)(6246003)(66476007)(6512007)(6486002)(66446008)(2906002)(446003)(25786009)(71200400001)(71190400001)(6916009)(36756003)(229853002)(55236004)(6116002)(3846002)(14444005)(256004)(14454004)(5660300002)(478600001)(91956017)(76116006)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4658;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZDEClNOvVyhL8g27CNUW/pMyKOuM2QA11lvA6kN7w+jlgpyGfrfB5e5I43T0s130EPtc7HrtjaEmIDOd4h1CE4INBYcCSEx+nnH9OV552x9UMqouphwMOXpAQJN7nnV4ID9Fs9b6s4t0B8wnIN4li9Mfa0GJKcssgfBVkcuiGXAmcPOir+4DwjOXoD4JZt9F8STHZYZXlFFXMQW7brxyVU9qtbsj49BBbfDz6QLa3/PrNtRthUWZ0qKgQ4yHt2TDtQEe1lCZRST0lGctBVyxKqLzFGX1SVrpeiafVwPQqQ/BQiSs7uHfBYJl5bHQ0O2BSUaE9tW/CRhNZnukYBY7S5yIsBO1fkCd/TzLtfmWCRNg8jXGVpFeye/YjFVf8EU7neykmBnKXZ5Vg/Wx2bJ9bBvLCKO75XJGocV+Lj6oPU0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3263b6c6-ab96-467a-ef88-08d736e04402
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 17:48:33.5083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKZx4RbcqFxJcRRPaIlYZg6yKjNnlQo9QCvySC4fWc92piXzAbTVJ7tF8DpQ7dvsBkvTAfY8MHOTyEtllIUgY4R0ZkoClpNXx9dA87HEqWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4658
Subject: Re: [Xen-devel] [RFC 4/9] arm64: utilize time accounting
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEFuZHJpaSwKCkFuZHJpaSBBbmlzb3Ygd3JpdGVzOgoKPiBGcm9tOiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Cj4gQ2FsbCB0aW1lIGFjY291bnRpbmcgaG9va3Mg
ZnJvbSBhcHByb3ByaWF0ZSB0cmFuc2l0aW9uIHBvaW50cwo+IG9mIHRoZSBBUk02NCBjb2RlLgpJ
J2QgcHJlZmVyIG1vcmUgZWxhYm9yYXRlIGNvbW1pdCBtZXNzYWdlLiBGb3IgZXhhbXBsZSAtIHdo
YXQgYXJlCmFwcHJvcHJpYXRlIHRyYW5zaXRpb24gcG9pbnRzPyBJIG1lYW4gLSBob3cgeW91IGNo
b3NlIG9uZXM/Cgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZA
ZXBhbS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwgMzkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW4u
YyAgICAgIHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPiBpbmRleCAyZDlhMjcxLi42ZmIyZmE5IDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gvYXJt
L2FybTY0L2VudHJ5LlMKPiBAQCAtMTQzLDEyICsxNDMsMjEgQEAKPgo+ICAgICAgICAgIC5lbmRt
Cj4KPiAtICAgICAgICAubWFjcm8gIGV4aXQsIGh5cCwgY29tcGF0Cj4gKyAgICAgICAgLm1hY3Jv
ICBleGl0LCBoeXAsIGNvbXBhdCwgdGFjYz0xCj4KPiAgICAgICAgICAuaWYgXGh5cCA9PSAwICAg
ICAgICAgLyogR3Vlc3QgbW9kZSAqLwo+Cj4gKwkuaWYgXHRhY2MgPT0gMQpUaGVyZSBpcyBhIGhh
cmQgdGFiLCBpbnN0ZWFkIG9mIDggc3BhY2VzLgoKQWxzbywgd2hpbGUgaXQgaXMgZWFzeSB0byBn
dWVzcyB3aGF0ICdoeXAnIGFuZCAnY29tcGF0JyBtZWFuLCBpdCBpcyBoYXJkCnRvIHRlbGwgd2hh
dCAndGFjYycgc3RhbmRzIGZvci4gSSB0aGluaywgeW91IG5lZWQgZWl0aGVyIGJldHRlcgpuYW1l
IGZvciB0aGlzIG9yIGEgY29tbWVudCwgd2hpY2ggZXhwbGFpbnMgYWxsIHBhcmFtZXRlcnMuCgo+
ICsKPiArICAgICAgICBtb3YgICAgIHgwLCAjMQo+ICsgICAgICAgIGJsICAgICAgdGFjY19oeXAK
PiArCj4gKwkuZW5kaWYKVGhlIHNhbWUgYWJvdXQgaGFyZCB0YWJzLiBQcm9iYWJseSwgdGhlcmUg
YXJlIG1vcmUgb2YgdGhlbSBpbiB0aGlzIHBhdGNoLgoKPiArCj4gICAgICAgICAgYmwgICAgICBs
ZWF2ZV9oeXBlcnZpc29yX3RhaWwgLyogRGlzYWJsZXMgaW50ZXJydXB0cyBvbiByZXR1cm4gKi8K
Pgo+ICsJbW92ICAgICB4MCwgIzEKPiArCWJsICAgICAgdGFjY19ndWVzdAo+ICAgICAgICAgIGV4
aXRfZ3Vlc3QgXGNvbXBhdAo+Cj4gICAgICAgICAgLmVuZGlmCj4gQEAgLTIwNSw5ICsyMTQsMTUg
QEAgaHlwX3N5bmM6Cj4KPiAgaHlwX2lycToKPiAgICAgICAgICBlbnRyeSAgIGh5cD0xCj4gKyAg
ICAgICAgbW92ICAgICB4MCwjNQpTcGFjZSBpcyBtaXNzaW5nIGJlZm9yZSAjNQoKPiArICAgICAg
ICBibCAgICAgIHRhY2NfaXJxX2VudGVyCj4gICAgICAgICAgbXNyICAgICBkYWlmY2xyLCAjNAo+
ICAgICAgICAgIG1vdiAgICAgeDAsIHNwCj4gICAgICAgICAgYmwgICAgICBkb190cmFwX2lycQo+
ICsKPiArICAgICAgICBtb3YgICAgIHgwLCM1ClNwYWNlIGlzIG1pc3NpbmcgYmVmb3JlICM1Cgo+
ICsgICAgICAgIGJsICAgICAgdGFjY19pcnFfZXhpdAo+ICsKPiAgICAgICAgICBleGl0ICAgIGh5
cD0xCj4KPiAgZ3Vlc3Rfc3luYzoKPiBAQCAtMjkxLDYgKzMwNiw5IEBAIGd1ZXN0X3N5bmNfc2xv
d3BhdGg6Cj4gICAgICAgICAgICogdG8gc2F2ZSB0aGVtLgo+ICAgICAgICAgICAqLwo+ICAgICAg
ICAgIGVudHJ5ICAgaHlwPTAsIGNvbXBhdD0wLCBzYXZlX3gwX3gxPTAKPiArClRoZXJlIGFyZSB0
cmFpbGluZyB3aGl0ZXNwYWNlcy4gSSBzdXJlIHRoYXQgJ2dpdCBkaWZmJyBoaWdobGlnaHRzCnN1
Y2ggbWlzdGFrZXMuLi4KCj4gKyAgICAgICAgbW92ICAgICB4MCwjMQpTcGFjZSBpcyBtaXNzaW5n
IGJlZm9yZSAjMQoKPiArICAgICAgICBibCAgICAgIHRhY2NfZ3N5bmMKPiAgICAgICAgICAvKgo+
ICAgICAgICAgICAqIFRoZSB2U0Vycm9yIHdpbGwgYmUgY2hlY2tlZCB3aGlsZSBTS0lQX1NZTkNI
Uk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4gICAgICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2
U0Vycm9yIHRvb2sgcGxhY2UsIHRoZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxsIGJlCj4gQEAgLTMw
Nyw2ICszMjUsMTAgQEAgZ3Vlc3Rfc3luY19zbG93cGF0aDoKPgo+ICBndWVzdF9pcnE6Cj4gICAg
ICAgICAgZW50cnkgICBoeXA9MCwgY29tcGF0PTAKPiArCj4gKyAgICAgICAgbW92ICAgICB4MCwj
NgpTcGFjZSBpcyBtaXNzaW5nIGJlZm9yZSAjNgoKPiArICAgICAgICBibCAgICAgIHRhY2NfaXJx
X2VudGVyCj4gKwo+ICAgICAgICAgIC8qCj4gICAgICAgICAgICogVGhlIHZTRXJyb3Igd2lsbCBi
ZSBjaGVja2VkIHdoaWxlIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKPiAgICAg
ICAgICAgKiBpcyBub3Qgc2V0LiBJZiBhIHZTRXJyb3IgdG9vayBwbGFjZSwgdGhlIGluaXRpYWwg
ZXhjZXB0aW9uIHdpbGwgYmUKPiBAQCAtMzE5LDYgKzM0MSw4IEBAIGd1ZXN0X2lycToKPiAgICAg
ICAgICBtb3YgICAgIHgwLCBzcAo+ICAgICAgICAgIGJsICAgICAgZG9fdHJhcF9pcnEKPiAgMToK
PiArCW1vdgl4MCwjNgpTcGFjZSBpcyBtaXNzaW5nIGJlZm9yZSAjNiwgYWxzbyBsb29rcyBsaWtl
IHRoZXJlIGlzIGEgaGFyZCB0YWIgY2hhcmFjdGVyLgoKPiArICAgICAgICBibCAgICAgIHRhY2Nf
aXJxX2V4aXQKPiAgICAgICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9MAo+Cj4gIGd1ZXN0X2Zp
cV9pbnZhbGlkOgo+IEBAIC0zMzQsNiArMzU4LDkgQEAgZ3Vlc3RfZXJyb3I6Cj4KPiAgZ3Vlc3Rf
c3luY19jb21wYXQ6Cj4gICAgICAgICAgZW50cnkgICBoeXA9MCwgY29tcGF0PTEKPiArCj4gKyAg
ICAgICAgbW92ICAgICB4MCwjMgpTcGFjZSBpcyBtaXNzaW5nIGJlZm9yZSAjMi4KCj4gKyAgICAg
ICAgYmwgICAgICB0YWNjX2dzeW5jCj4gICAgICAgICAgLyoKPiAgICAgICAgICAgKiBUaGUgdlNF
cnJvciB3aWxsIGJlIGNoZWNrZWQgd2hpbGUgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllf
RVhJVAo+ICAgICAgICAgICAqIGlzIG5vdCBzZXQuIElmIGEgdlNFcnJvciB0b29rIHBsYWNlLCB0
aGUgaW5pdGlhbCBleGNlcHRpb24gd2lsbCBiZQo+IEBAIC0zNTAsNiArMzc3LDEwIEBAIGd1ZXN0
X3N5bmNfY29tcGF0Ogo+Cj4gIGd1ZXN0X2lycV9jb21wYXQ6Cj4gICAgICAgICAgZW50cnkgICBo
eXA9MCwgY29tcGF0PTEKPiArCj4gKyAgICAgICAgbW92ICAgICB4MCwjNwpTcGFjZSBpcyBtaXNz
aW5nIGJlZm9yZSAjNy4KCj4gKyAgICAgICAgYmwgICAgICB0YWNjX2lycV9lbnRlcgo+ICsKPiAg
ICAgICAgICAvKgo+ICAgICAgICAgICAqIFRoZSB2U0Vycm9yIHdpbGwgYmUgY2hlY2tlZCB3aGls
ZSBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4gICAgICAgICAgICogaXMgbm90
IHNldC4gSWYgYSB2U0Vycm9yIHRvb2sgcGxhY2UsIHRoZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxs
IGJlCj4gQEAgLTM2Miw2ICszOTMsOCBAQCBndWVzdF9pcnFfY29tcGF0Ogo+ICAgICAgICAgIG1v
diAgICAgeDAsIHNwCj4gICAgICAgICAgYmwgICAgICBkb190cmFwX2lycQo+ICAxOgo+ICsgICAg
ICAgIG1vdiAgICAgeDAsIzcKU3BhY2UgaXMgbWlzc2luZyBiZWZvcmUgIzcuLi4KCj4gKyAgICAg
ICAgYmwgICAgICB0YWNjX2lycV9leGl0Cj4gICAgICAgICAgZXhpdCAgICBoeXA9MCwgY29tcGF0
PTEKPgo+ICBndWVzdF9maXFfaW52YWxpZF9jb21wYXQ6Cj4gQEAgLTM3Niw5ICs0MDksOSBAQCBn
dWVzdF9lcnJvcl9jb21wYXQ6Cj4gICAgICAgICAgZXhpdCAgICBoeXA9MCwgY29tcGF0PTEKPgo+
ICBFTlRSWShyZXR1cm5fdG9fbmV3X3ZjcHUzMikKPiAtICAgICAgICBleGl0ICAgIGh5cD0wLCBj
b21wYXQ9MQo+ICsgICAgICAgIGV4aXQgICAgaHlwPTAsIGNvbXBhdD0xLCB0YWNjPTAKPiAgRU5U
UlkocmV0dXJuX3RvX25ld192Y3B1NjQpCj4gLSAgICAgICAgZXhpdCAgICBoeXA9MCwgY29tcGF0
PTAKPiArICAgICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9MCwgdGFjYz0wCj4KPiAgcmV0dXJu
X2Zyb21fdHJhcDoKPiAgICAgICAgICBtc3IgICAgIGRhaWZzZXQsICMyIC8qIE1hc2sgaW50ZXJy
dXB0cyAqLwoKCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNo
L2FybS9kb21haW4uYwo+IGluZGV4IGE5YzQxMTMuLjUzZWY2MzAgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4gQEAgLTUx
LDExICs1MSwxMyBAQCBzdGF0aWMgdm9pZCBkb19pZGxlKHZvaWQpCj4gICAgICBwcm9jZXNzX3Bl
bmRpbmdfc29mdGlycXMoKTsKPgo+ICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiArICAgIHRh
Y2NfaWRsZSgxKTsKMSBhbmQgMiAoYmVsb3cpIGxvb2sgbGlrZSBzb21lIG1hZ2ljYWwgdmFsdWVz
IHRvIG1lLgpJIGJlbGlldmUsIHlvdSBuZWVkIHRvIGRlZmluZSBzb21lIGVudW1lcmF0aW9uLgoK
PiAgICAgIGlmICggY3B1X2lzX2hhbHRhYmxlKGNwdSkgKQo+ICAgICAgewo+ICAgICAgICAgIGRz
YihzeSk7Cj4gICAgICAgICAgd2ZpKCk7Cj4gICAgICB9Cj4gKyAgICB0YWNjX2h5cCgyKTsKPiAg
ICAgIGxvY2FsX2lycV9lbmFibGUoKTsKPgo+ICAgICAgc2NoZWRfdGlja19yZXN1bWUoKTsKCgot
LQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
