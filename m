Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CE6637C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 03:52:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlkg3-0002JG-R5; Fri, 12 Jul 2019 01:48:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlkg2-0002JB-QK
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 01:48:46 +0000
X-Inumbo-ID: 258c2075-a447-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 258c2075-a447-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 01:48:44 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 12 Jul 2019 01:44:48 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 12 Jul 2019 01:28:15 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 12 Jul 2019 01:28:15 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2810.namprd18.prod.outlook.com (20.179.50.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 01:28:14 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 01:28:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbFtSk5gACJ34A=
Date: Fri, 12 Jul 2019 01:28:14 +0000
Message-ID: <2bdd4726-0629-e452-2bc3-c5109db3c0c3@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <CABfawhk19LTiO5bDbVMW2u1mmmnexNJS3Df=y6XtUzvKc8APvw@mail.gmail.com>
In-Reply-To: <CABfawhk19LTiO5bDbVMW2u1mmmnexNJS3Df=y6XtUzvKc8APvw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:610:4c::15) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [50.201.95.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d80df3a8-5097-411a-2ad4-08d7066835c0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2810; 
x-ms-traffictypediagnostic: DM6PR18MB2810:
x-microsoft-antispam-prvs: <DM6PR18MB281069CBC6387C45EF7CBDD5B3F20@DM6PR18MB2810.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(386003)(6246003)(2616005)(6116002)(229853002)(2906002)(186003)(6436002)(102836004)(53546011)(6506007)(256004)(478600001)(25786009)(54906003)(486006)(8936002)(66946007)(86362001)(64756008)(4326008)(5660300002)(71200400001)(7736002)(305945005)(26005)(76176011)(80792005)(52116002)(316002)(31696002)(53936002)(66556008)(66476007)(3846002)(14454004)(66446008)(81166006)(31686004)(476003)(6916009)(6486002)(11346002)(81156014)(99286004)(7416002)(8676002)(68736007)(6512007)(71190400001)(446003)(66066001)(4744005)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2810;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UxdWXeApd3tetB+ChCFa8j3cVxbWjBse4W4G5pRyIJSnjncRF9a1To5mWTZkKrGp7HQnrqh5LdR37iP0Jz0HjBjrxXJRcSxZL7+2B5mg3CQmxorUudqxvR0BjJTBoLpx5ZhDaFW5YlZtsmph7wEkmI74WPhiUsndqFzhqwfCLw8Bi8ia1Oa+0BNBf8OfRb4QoKKrygVoBqtty57PEQeF/hROjtEaHfV71m9eFgcFmdUgxOpIiBXmcTZ9t+kVbJLA1dFdp9S4zgFwlyIBZ/ucVZjOV1qj99BQBBStBT2xiujx1xRRGN4++wtwavJ5mgatSEHVeCVY3mOOUmuiT+9kuYWXkQIB+OXika9HRVDS5QmlT4FUj8m63H5W0v+HkjO6Yl3Upx1tuA5VlkUz/YOURWE9F/DSQRGDLVgG+h9/3Ac=
Content-ID: <345B8C5AF27B1840A5F48070963062C1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d80df3a8-5097-411a-2ad4-08d7066835c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 01:28:14.5725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2810
X-OriginatorOrg: suse.com
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
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDcuMjAxOSAxOToxMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4gQEAgLTYyOSw2
ICs2OTcsMTQgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4NCj4+
ICAgICAgICAgICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lz
X3JlYWRvbmx5KHAybXQpKTsNCj4+ICAgICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBpZiAo
IGN1cnItPmFyY2gudm1fZXZlbnQgJiYNCj4+ICsgICAgICAgICAgICBjdXJyLT5hcmNoLnZtX2V2
ZW50LT5zZW5kX2V2ZW50ICYmDQo+IA0KPiBXaHkgbm90IGZvbGQgdGhlc2UgY2hlY2tzIGludG8g
aHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCBzaW5jZS4uDQoNCkkgaGFkIGFza2VkIGZvciBhdCBs
ZWFzdCB0aGUgZmlyc3Qgb2YgdGhlIGNoZWNrcyB0byBiZSBwdWxsZWQNCm91dCBvZiB0aGUgZnVu
Y3Rpb24sIGZvciB0aGUgY29tbW9uIGNhc2UgdG8gYmUgYWZmZWN0ZWQgYXMNCmxpdHRsZSBhcyBw
b3NzaWJsZS4NCg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9odm0uYw0KPj4gQEAgLTMyMjQsNiArMzIyNCwxNCBAQCBzdGF0aWMgZW51
bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHkoDQo+PiAgICAgICAgICAgICAgIHJl
dHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsNCj4+ICAgICAgICAgICB9DQo+Pg0KPj4gKyAg
ICAgICAgaWYgKCB1bmxpa2VseSh2LT5hcmNoLnZtX2V2ZW50KSAmJg0KPj4gKyAgICAgICAgICAg
IHYtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgJiYNCj4gDQo+IC4uIHlvdSBzZWVtIHRvIGp1
c3QgcmVwZWF0IHRoZW0gaGVyZSBhZ2Fpbj8NCg0KSSBhZ3JlZSB0aGF0IHRoZSBkdXBsaWNhdGlv
biBtYWtlcyBubyBzZW5zZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
