Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C268BC9FF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClZh-0006Z3-9K; Tue, 24 Sep 2019 14:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iClZf-0006Yx-9F
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:13:51 +0000
X-Inumbo-ID: 87974e8e-ded5-11e9-97fb-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::611]) by localhost (Halon) with ESMTPS
 id 87974e8e-ded5-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5MNVbR0RBFS2TTCo5WzTPGTSnyb50WetQfhzD1hSqBfZNsSKuT7lDc7g98wuWSTw2k6loiP6UhQhFsUsMVdFEJHxNjO23F4WEOdpJgJlxDxdAPxtR7go/nKkyYRBDhQdDid3L5u7XI01rBcNA4JrbsM9HoKnnCoRzpli1Wqk4wP4Y8IT2ubkCiIO2NYUmLcLctXN7Q/XOc0a39IpQU4lpLT3yWwGjjP2BGuLMicGaDcBp2rV3F6kwVmn7wJ1Vk9k+1ETLOoJFgge+zViR/qDIzoYR55gX7oS0pb7m8xLJFFytzwPic0kSIcf166Klm6F8ihZ/a0NxEJ2KMGT9j0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zGELjDHVo6uvJBlHTa4kq3pC8MPAUDyNnidPny+Ces=;
 b=H87//+HtJbnBCD7RH0mf+dnmWurhep8QVNeKbiOSZIZb21y6LM4CIiZ1cLIKIQFxQd21qVWGGHXbZrkIo8aIAyIlka1b4Wl3WFmb3UyASLiJCMOHm7PVki873jG031HRhDjwdcyeP6j1MjGHvOCh3mIc+DRnsBwJ/YLsOboFH2Nzlj4BGHKvwJ/U+xQ+T+67TNCiGP/62WEFF4GmQW1BTiyi6qMgmrBugnjKJZWlDzpKwLidsNMPX/SPEU0Vl9YnOumkRmlNWTdaFWnZq8NC+3y98hJRNuV0r+eisDpEA8Puyh5eJfvs1fDfgP+KUUepVb2/D9l9361FVoMhu+9jZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zGELjDHVo6uvJBlHTa4kq3pC8MPAUDyNnidPny+Ces=;
 b=kCEQPJp2jtVoBZBakzCsnTXUEt5BaF7NlhKjj4Sw2cjPIn/cImmYm4C8H93bHMEOtY8XnRQMVOf9hG2ostr/qlGnpL4diLJGcRht+Xjw1J/mzJLw3KY9+xAEjrn5spY46YIHY847Nq3F2hThyWP6l4spRCklOAvZCfId/lRGrcA=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB4854.eurprd03.prod.outlook.com (20.178.88.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 14:13:48 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 14:13:48 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot pagetables
 before bringing-up each secondary CPU
Thread-Index: AQHVcGSSchlMtB7wCE+xgHav8WanLqc648aA
Date: Tue, 24 Sep 2019 14:13:48 +0000
Message-ID: <878sqdaijo.fsf@epam.com>
References: <20190921100836.21396-1-julien.grall@arm.com>
In-Reply-To: <20190921100836.21396-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f52f595-702e-4368-79e0-08d740f96b2b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4854; 
x-ms-traffictypediagnostic: AM6PR03MB4854:|AM6PR03MB4854:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB485413C5B8D4E7BDF0CFE538E6840@AM6PR03MB4854.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(189003)(199004)(99286004)(7736002)(6246003)(107886003)(305945005)(25786009)(102836004)(486006)(3846002)(476003)(446003)(71200400001)(86362001)(55236004)(11346002)(71190400001)(76116006)(14454004)(26005)(186003)(5660300002)(2616005)(66946007)(91956017)(6116002)(316002)(64756008)(66446008)(66066001)(6916009)(66476007)(6486002)(8936002)(80792005)(6512007)(81156014)(54906003)(229853002)(6436002)(81166006)(8676002)(256004)(14444005)(6506007)(76176011)(66556008)(478600001)(36756003)(2906002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4854;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ny2LZcOJkqoRxPSyF0G+fME/mK9mbPU/P4vfpWrhnl80qpU+oTzipLQI8AMypHTcHMC5oTR1EFXLWCNmzEKTZ1CrZOsT6tUIvnnbPQjOCI6hLpdnLKsXpp12/1DhkO8iPWai28O3vumGAok5n9NvqwDC+vDzh1Tfi2tchFz+6g5l/znFQ7pVTZaD71MnzVKgArsmnNhcT/lUyy2aAg533ud67hznAFuHekbGPXNCrvq+1443VkhI/Bn3HRUhpvyv9RkQ+/ZNG0Uggrcx8KYcktPvLcAdSvlszTX1xibkWMvh5TYWTUQrSei5Ohz9Op+pZOCEv581ld4rG2iwbsRCrmN5w4dF34Qj6VoF3gEoEbUGrNfKKM6yUlwkjZnfFrzRQP6xODRCYtZzhgGZ0juOEgo7EurQ0i5BpORfpa89OKg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f52f595-702e-4368-79e0-08d740f96b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 14:13:48.4386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVZaEy0xtW/CgVvbjZ2lte8C0DYMiVYJjmaE+6xjHCmsHujNmse1ARYNhBH7kd2JF7Y+t9Vnf9XvoXIy+i6dPpyY/Q+Ln2MuOIn7jqX6/So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4854
Subject: Re: [Xen-devel] [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot
 pagetables before bringing-up each secondary CPU
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIGJvb3QgcGFnZXRhYmxlcyBh
cmUgb25seSBjbGVhcmVkIG9uY2UgYXQgYm9vdC4gVGhpcyBtZWFucwo+IHdoZW4gYm9vdGluZyBD
UFUyIChhbmQgb253YXJkcykgdGhlbiBib290IHBhZ2V0YWJsZXMgd2lsbCBub3QgYmUKPiBjbGVh
cmVkLgo+Cj4gVG8ga2VlcCB0aGUgaW50ZXJmYWNlIGV4YWN0bHkgdGhlIHNhbWUgZm9yIGFsbCBz
ZWNvbmRhcnkgQ1BVLCB0aGUgYm9vdAo+IHBhZ2V0YWJsZXMgYXJlIG5vdyBjbGVhcmVkIGJlZm9y
ZSBicmluZ2luZy11cCBlYWNoIHNlY29uZGFyeSBDUFUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpUYWtpbmcgaW50byBhY2NvdW50IGZpeGVk
IHJlbWFyayBiZWxvdzoKClJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXly
X2JhYmNodWtAZXBhbS5jb20+Cgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vbW0uYyB8IDI3ICsrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hl
bi9hcmNoL2FybS9tbS5jCj4gaW5kZXggMTEyOWRjMjhjOC4uZTE0ZWU3NmZmOCAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTcw
NCw4ICs3MDQsMjAgQEAgdm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25n
IGJvb3RfcGh5c19vZmZzZXQpCj4gIAo+ICAgICAgc3dpdGNoX3R0YnIodHRicik7Cj4gIAo+IC0g
ICAgLyogQ2xlYXIgdGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRh
cnkgQ1BVCj4gLSAgICAgKiByZWJ1aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpICovCj4g
KyAgICB4ZW5fcHRfZW5mb3JjZV93bngoKTsKPiArCj4gKyNpZmRlZiBDT05GSUdfQVJNXzMyCj4g
KyAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKPiArICAgIHBlcl9j
cHUoeGVuX2RvbW1hcCwgMCkgPSBjcHUwX2RvbW1hcDsKPiArI2VuZGlmCj4gK30KPiArCj4gK3N0
YXRpYyB2b2lkIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcyh2b2lkKQo+ICt7Cj4gKyAgICAvKgo+ICsg
ICAgICogQ2xlYXIgdGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRh
cnkgQ1BVCj4gKyAgICAgKiByZWJ1aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpCk1pc3Np
bmcgZnVsbCBzdG9wLgoKPiArICAgICAqLwo+ICAgICAgY2xlYXJfdGFibGUoYm9vdF9wZ3RhYmxl
KTsKPiAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAgICAgIGNsZWFyX3RhYmxlKGJvb3RfZmlyc3Qp
Owo+IEBAIC03MTMsMTggKzcyNSwxMyBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVu
c2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCkKPiAgI2VuZGlmCj4gICAgICBjbGVhcl90YWJs
ZShib290X3NlY29uZCk7Cj4gICAgICBjbGVhcl90YWJsZShib290X3RoaXJkKTsKPiAtCj4gLSAg
ICB4ZW5fcHRfZW5mb3JjZV93bngoKTsKPiAtCj4gLSNpZmRlZiBDT05GSUdfQVJNXzMyCj4gLSAg
ICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKPiAtICAgIHBlcl9jcHUo
eGVuX2RvbW1hcCwgMCkgPSBjcHUwX2RvbW1hcDsKPiAtI2VuZGlmCj4gIH0KPiAgCj4gICNpZmRl
ZiBDT05GSUdfQVJNXzY0Cj4gIGludCBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzKGludCBjcHUp
Cj4gIHsKPiArICAgIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpOwo+ICsKPiAgICAgIC8qIFNldCBp
bml0X3R0YnIgZm9yIHRoaXMgQ1BVIGNvbWluZyB1cC4gQWxsIENQdXMgc2hhcmUgYSBzaW5nbGUg
c2V0b2YKPiAgICAgICAqIHBhZ2V0YWJsZXMsIGJ1dCByZXdyaXRlIGl0IGVhY2ggdGltZSBmb3Ig
Y29uc2lzdGVuY3kgd2l0aCAzMiBiaXQuICovCj4gICAgICBpbml0X3R0YnIgPSAodWludHB0cl90
KSB4ZW5fcGd0YWJsZSArIHBoeXNfb2Zmc2V0Owo+IEBAIC03NjcsNiArNzc0LDggQEAgaW50IGlu
aXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKPiAgICAgIHBlcl9jcHUoeGVuX3BndGFi
bGUsIGNwdSkgPSBmaXJzdDsKPiAgICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwgY3B1KSA9IGRvbWhl
YXA7Cj4gIAo+ICsgICAgY2xlYXJfYm9vdF9wYWdldGFibGVzKCk7Cj4gKwo+ICAgICAgLyogU2V0
IGluaXRfdHRiciBmb3IgdGhpcyBDUFUgY29taW5nIHVwICovCj4gICAgICBpbml0X3R0YnIgPSBf
X3BhKGZpcnN0KTsKPiAgICAgIGNsZWFuX2RjYWNoZShpbml0X3R0YnIpOwoKCi0tIApWb2xvZHlt
eXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
