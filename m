Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9242568FA5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1jg-00031a-FT; Mon, 15 Jul 2019 14:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn1jf-00031U-1V
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:13:47 +0000
X-Inumbo-ID: bf8cf7d8-a70a-11e9-8ade-f7c1dbf5137c
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf8cf7d8-a70a-11e9-8ade-f7c1dbf5137c;
 Mon, 15 Jul 2019 14:13:44 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 14:13:41 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 14:13:40 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 14:13:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdvyrfqsmEvJq74WONx0k1Qk+EW/VKFChqLXI1GHCMUSBImQ7ylfQ63JaCEHR4k95Bo5ghNkRNKhaPKilloPZnfUBKiV8TCHoX2MYndVo6Tuxmxb/XeNP5KyQz5brd3pvvM9AtnEMQ/i9mEAHzmUwiXYp5qVNGNKNJLZasJWAIbfBj+azokGfzkmNsbGKO2ys4Nn2VGfsp4xw/3+gd6DKVWO6BFbW1npbGg0MNWLgQDoPMLhtJwfuEx3EnILhxrVNgxjwiK5lAxt5a+3E0X3lFsKXSYCJNRVSurxjtmJFFLBKInqON3zbHa/cba61WoockrjK7WC01EmmFmCe1CLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZFypzeExzbM7rS6y1OHI8Ide7Re/IOEEM1u/Fx/Xq8=;
 b=QKeHBMN/ukP3yJNDG7uw5iNcGJyMu5us9l6hQbuNJYfZFGwt6avbHIKDIAMTSNwisGfcMfQE8Den/q0K8EiOoBeafNwgF7wc6F36HJhmkFmqyeWuWZ7sdwCndvR0tXdOKvX5yXzwyWOtvaG6lM+ZvWRDpKz5U5jcZxkQKz+9/9HC5VYDjm/M1NYwCdYQx3tnFWUgSDvJSta90EsdvyFZEREufLEMa2GAcItRdkfzzZk0Zy5+CZIGWoW4jhlyySqNm9JixOv0CkWc+6AdnICVGgfNPeI3AoXbSbS3wtLiiAMA2HS+eptumsCuFJme8P//mSGCkc+4o9xhaBGfmLitfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2970.namprd18.prod.outlook.com (20.179.52.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 14:13:39 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:13:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Thread-Topic: [PATCH] x86/dom0-build: fix build with clang5
Thread-Index: AQHVOxeAOJS35VCb3EmrxBvoPUkIQA==
Date: Mon, 15 Jul 2019 14:13:39 +0000
Message-ID: <07f476c6-2f65-c6a6-7b80-9700816cbd54@suse.com>
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
 <CABfawhmHFWEQ36S6M0+M+Ls1fFJpvHRCN6+Q4Mn0_DrFQjOVPg@mail.gmail.com>
In-Reply-To: <CABfawhmHFWEQ36S6M0+M+Ls1fFJpvHRCN6+Q4Mn0_DrFQjOVPg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0066.eurprd03.prod.outlook.com
 (2603:10a6:4:54::34) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20ea5e56-c92b-49b5-749f-08d7092ea290
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2970; 
x-ms-traffictypediagnostic: DM6PR18MB2970:
x-microsoft-antispam-prvs: <DM6PR18MB297050F28B9F0797D2317CFEB3CF0@DM6PR18MB2970.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(6116002)(66476007)(68736007)(86362001)(66946007)(64756008)(3846002)(66446008)(486006)(256004)(54906003)(14444005)(26005)(31696002)(36756003)(66066001)(186003)(446003)(66556008)(2616005)(14454004)(11346002)(476003)(316002)(4326008)(305945005)(386003)(53546011)(31686004)(81166006)(6506007)(6486002)(5660300002)(6512007)(8936002)(6246003)(7736002)(81156014)(2906002)(102836004)(8676002)(99286004)(6916009)(52116002)(53936002)(25786009)(76176011)(71200400001)(71190400001)(80792005)(6436002)(229853002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2970;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Z7v5wAM1wBt6ig6irVgB03UNSn+t0OBnV7TlGBQUjM3ibx/soiREXCWB6Tjf59yq9vSd9hUqie5H7RMljD0HVnnNSsw59YezNTysxhf1ka4wyqEuVQFcDy0NopOGWKyraUy2Bd6dEnC4fsZ/nVwIPy8rGPtudMPTvReNAnfR6Pcc3JvpNIJWrp/64aM0MnlTGcHXiO7Z8J5smpv7BuVMxEwpBdWE8bVQH+2KsA+HTPcVZVLiCeNrcMlUvbMtrH/mtJi04L3iOcssPYGx0UBj1ClnmnlA16RDvUByMUkiX0NlcnUB5bxc5wE0dtmCHGxRnSmV2o8lH+8VoFb4p9tKGuPA0CJLjQVWvqOuw9/2cJZ4e5WxxYjDUeDzRF+TEDtk0fJGKAVNDtQcyisG5ZxTtaAa2qg1Dad0SWFHsOJ8W0=
Content-ID: <4D72C3D6697AC545ADF8ED2DF62D63FD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ea5e56-c92b-49b5-749f-08d7092ea290
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:13:39.8295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2970
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxNTo0MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBNb24sIEp1
bCAxNSwgMjAxOSBhdCA0OjM2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gV2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNl
cw0KPj4NCj4+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IGVycm9yOiB1c2Ugb2YgbG9naWNhbCAnJiYn
IHdpdGggY29uc3RhbnQgb3BlcmFuZCBbLVdlcnJvciwtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFu
ZF0NCj4+ICAgICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQ0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIF4gIH5+fn5+fn5+fn5+fn5+fn5+fg0KPj4gZG9t
MF9idWlsZC5jOjM0NDoyNDogbm90ZTogdXNlICcmJyBmb3IgYSBiaXR3aXNlIG9wZXJhdGlvbg0K
Pj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn4NCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAm
DQo+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiByZW1vdmUgY29uc3RhbnQgdG8gc2lsZW5j
ZSB0aGlzIHdhcm5pbmcNCj4+ICAgICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9N
MF9NRU1bMF0gKQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fn5+fn5+fn5+fn5+
fn5+fg0KPj4gMSBlcnJvciBnZW5lcmF0ZWQuDQo+Pg0KPj4gT2J2aW91c2x5IG5laXRoZXIgb2Yg
dGhlIHR3byBzdWdnZXN0aW9ucyBhcmUgYW4gb3B0aW9uIGhlcmUuIE9kZGx5DQo+PiBlbm91Z2gg
c3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0aW5n
IG9yDQo+PiBwYXJlbnRoZXNpemluZyBkb2Vzbid0LiBBbm90aGVyIHdvcmthYmxlIHZhcmlhbnQg
bG9va3MgdG8gYmUgdGhlIHVzZSBvZg0KPj4gISEgb24gdGhlIGNvbnN0YW50Lg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IC0tLQ0KPj4g
SSdtIG9wZW4gdG8gZ29pbmcgdGhlICEhIG9yIHlldCBzb21lIGRpZmZlcmVudCByb3V0ZS4gTm8g
bWF0dGVyIHdoaWNoDQo+PiBvbmUgd2UgY2hvb3NlLCBJJ20gYWZyYWlkIGl0IGlzIGdvaW5nIHRv
IHJlbWFpbiBndWVzc3dvcmsgd2hhdCBuZXdlcg0KPj4gKGFuZCBmdXR1cmUpIHZlcnNpb25zIG9m
IGNsYW5nIHdpbGwgY2hva2Ugb24uDQo+IA0KPiBJcyBkaXNhYmxpbmcgdGhlIGNoZWNrIGl0c2Vs
ZiBub3QgYW4gb3B0aW9uPyBTZWVtcyB0byBtZSB0byBiZSBhIG1vcmUNCj4gc2Vuc2libGUgb3B0
aW9uIHRoZW4gaGFja2luZyBhcm91bmQgaXQuDQoNCkhvdyB3b3VsZCB5b3UgZW52aXNpb24gdG8g
ZGlzYWJsZSB0aGUgY2hlY2s/IEl0J3MgdGhlcmUgZm9yIGEgcmVhc29uDQphZnRlciBhbGwuDQoN
Ckphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
