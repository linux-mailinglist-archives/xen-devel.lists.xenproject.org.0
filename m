Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A186328
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hviSl-0000Si-I8; Thu, 08 Aug 2019 13:28:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hviSk-0000Sd-7T
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:28:14 +0000
X-Inumbo-ID: 5e247b17-b9e0-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5e247b17-b9e0-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 13:28:12 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 13:27:58 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 13:27:10 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 13:27:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIm8FDpmMHMHixwjwkay1Xg5/rxdStIJQUh+60K2HIjWx4paF7JpKC4Pg3xMXrEYsPCtV+tRrnhqvV4e/NUi1p00Edrx5cDyyO1Ccz5ifv5mWly3SqoC3Ht4zHYR/ObGLOcaN6D4N68mpXwdZtLvEmn2hqsP5CSbLFAq7pYTzo2AG2zQtgk+c4EN+iCgaOq2GAC9Hdh8edGMwR1AgiUAefBZY5uypfs5wWVn2Yx8Tx5SQ1byZOs+4qnGVhqLypfTwJ+4ZzvRhL9q84ZOcJVmaOWx1w9c1MBtYaAZQcWblmiMMFGqvu9kyR93n2RyHk4/y/p/CDgsgGijNUV24D9c3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSuD7o9lJSy1SrZ/srw3RYB44TECyFbrGOiEB5A3+so=;
 b=JkaysLJ6414fnqNebL3wnN3RvfyLEGgYg60t32kCXrUbtrV1jqY06ASF31I7J9j2SgQOR5WL6mQMF7k6dS86rc9BS2b41ORudAhb4nopYpfFdBy98e9UMQfEydyP3pUDQASGGKTOyvfJhD5hyviynNTJ2pEFfq3MYyhVbGZqiBBT9hDQ44eMnP4wnjsjzwpFzrpbca19sP1jcrlxxFE8fj7QzqHlOleGSrbLdPVvocY/0VT1YiAF1KQcgWLxIj8DQWb6mdNkE5zye2E07HgBfVfdWG1grF0DxOtsWW3b0PfCXq7TLjyS97YYNOqYM96ehJWX+l2oPQmfCXq8nK2Q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3072.namprd18.prod.outlook.com (20.179.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 13:27:08 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 13:27:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Eslam Elnikety <elnikety@amazon.com>
Thread-Topic: [PATCH v2] evtchn: make support for different ABIs tunable
Thread-Index: AQHVTUemBo6+AevzQUaLlW2s+A9xKqbxP0SA
Date: Thu, 8 Aug 2019 13:27:08 +0000
Message-ID: <5752a9af-ec3b-1401-13d9-4b93bdd99d72@suse.com>
References: <20190807174223.67590-1-elnikety@amazon.com>
In-Reply-To: <20190807174223.67590-1-elnikety@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::35) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ec5dbae-80a4-45b1-72ba-08d71c041cb2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3072; 
x-ms-traffictypediagnostic: MN2PR18MB3072:
x-microsoft-antispam-prvs: <MN2PR18MB307232CF885F5A8EAE5D371CB3D70@MN2PR18MB3072.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(189003)(199004)(6486002)(476003)(2616005)(6436002)(11346002)(446003)(486006)(52116002)(66066001)(5660300002)(31696002)(80792005)(26005)(186003)(6512007)(2906002)(256004)(71200400001)(31686004)(6116002)(76176011)(71190400001)(3846002)(102836004)(229853002)(53546011)(6506007)(386003)(305945005)(478600001)(25786009)(7736002)(86362001)(4326008)(316002)(99286004)(66946007)(81156014)(7416002)(14454004)(64756008)(66476007)(66556008)(66446008)(8936002)(6916009)(36756003)(53936002)(54906003)(81166006)(8676002)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3072;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SMBnO68/uDFZQibOqFNIH0o7ALn68/BEz4XYoiswfHqDGBvuNVkFUfbIz5nSOmDIis4od5YEfZvvIy2/mJOe5Ht/Y2IdnE2ku4hiwFmcjsLZRk64sL1mvhNDJe1ATNgFV4F5e0ppia4KRli8kizRvTRgRUEu64eVR5SxIgwm1eLdMHJh9WNS2asEtALqp8uCtY8v+XvOJojtnFuofLrxdmkf6Ah4av5nbre4OEPXe3QdQdFzh8KV3fSi5fbGlYOKLZk2w/1VYrTORuDWGv9y+ywCmsbV5ncgkdtdkPFnEXuyLXNA+BvvQVgm83fzRisFwDPkWxSr2lXIdzGTuCefJxCLX+U4DwOvNJXxlmUDyqRBp2YyYMpHithcVr0A8uOpdTH0MnwxIZ39YuUWE0UKWKGXBc+QhQ5153hm3s4h0TY=
x-ms-exchange-transport-forked: True
Content-ID: <1D925AADEB351C49BACB2F47C7F1120C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec5dbae-80a4-45b1-72ba-08d71c041cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 13:27:08.5496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auvfjMqlwqjyINeYxqtxzXgEL14xzX305pRhedNHd2PUfA+DIqgvTOvGRoGVJOgRdQpwmCvXJCHoh44o5FYG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3072
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxOTo0MiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6DQo+IFN1cHBvcnQgZm9y
IEZJRk8gZXZlbnQgY2hhbm5lbCBBQkkgd2FzIGZpcnN0IGludHJvZHVjZWQgaW4gWGVuIDQuNA0K
PiAoc2VlIDg4OTEwMDYxZWM2KS4gTWFrZSB0aGlzIHN1cHBvcnQgdHVuYWJsZSwgc2luY2UgdGhl
IGNob2ljZSBvZiB3aGljaA0KPiBldmVudCBjaGFubmVsIEFCSSBoYXMgaW1wbGljYXRpb25zIGZv
ciBoaWJlcm5hdGlvbi4gQ29uc2lkZXIgcmVzdW1pbmcgYQ0KPiBwcmUgWGVuIDQuNCBoaWJlcm5h
dGVkIExpbnV4IGd1ZXN0LiBEdXJpbmcgcmVzdW1lIGZyb20gaGliZXJuYXRpb24sIHRoZXJlDQo+
IGFyZSB0d28ga2VybmVscyBpbnZvbHZlZDogdGhlICJib290IiBrZXJuZWwgYW5kIHRoZSAicmVz
dW1lIiBrZXJuZWwuIFRoZQ0KPiBndWVzdCBib290IGtlcm5lbCBkZWZhdWx0cyB0byBGSUZPIEFC
SSBhbmQgaW5zdHJ1Y3RzIFhlbiB2aWEgYW4NCj4gRVZUQ0hOT1BfaW5pdF9jb250cm9sIHRvIHN3
aXRjaCBmcm9tIDJMIHRvIEZJRk8uDQoNClRoaXMgc2hvdWxkIG9ubHkgYmUgIm1heSBkZWZhdWx0
IHRvIiAtIHRoZXJlJ3Mgbm90aGluZyBtYWtpbmcgdGhpcw0KdG8gYmUgdGhlIGNhc2UgdW5jb25k
aXRpb25hbGx5IGFmYWljdC4gQW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8NCnN0YXJ0IHRoZSBz
ZW50ZW5jZSAiSWYgdGhlIGd1ZXN0IGJvb3Qga2VybmVsIGRlZmF1bHRzIC4uLiIuDQoNCj4gLS0t
IGEveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMNCj4gKysrIGIveGVuL2NvbW1vbi9ldmVudF9j
aGFubmVsLmMNCj4gQEAgLTExNzAsNiArMTE3MCwxMSBAQCBsb25nIGRvX2V2ZW50X2NoYW5uZWxf
b3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+ICAgDQo+ICAg
ICAgIGNhc2UgRVZUQ0hOT1BfaW5pdF9jb250cm9sOiB7DQo+ICAgICAgICAgICBzdHJ1Y3QgZXZ0
Y2huX2luaXRfY29udHJvbCBpbml0X2NvbnRyb2w7DQo+ICsNCj4gKyAgICAgICAgLyogRmFpbCBp
bml0X2NvbnRyb2wgZm9yIGRvbWFpbnMgdGhhdCBtdXN0IHVzZSAybCBBQkkgKi8NCj4gKyAgICAg
ICAgaWYgKCBjdXJyZW50LT5kb21haW4tPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9kaXNhYmxl
X2ZpZm8gKQ0KPiArICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsNCj4gKw0KPiAgICAgICAgICAg
aWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmluaXRfY29udHJvbCwgYXJnLCAxKSAhPSAwICkNCj4gICAg
ICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gICAgICAgICAgIHJjID0gZXZ0Y2huX2ZpZm9f
aW5pdF9jb250cm9sKCZpbml0X2NvbnRyb2wpOw0KDQpJIHRoaW5rIHRoZSBjaGVjayB3b3VsZCBi
ZXR0ZXIgZ28gaW50byBldnRjaG5fZmlmb19pbml0X2NvbnRyb2woKSwNCmF0IGxlYXN0IGFzIGxv
bmcgYXMgdGhlIHNldHRpbmcgcmVhbGx5IGlzIEZJRk8tY2VudHJpYy4gQWxzbyB0aGUNCmNvbW1l
bnQgd2lsbCBiZWNvbWUgc3RhbGUgdGhlIG1vbWVudCBhIDNyZCBldnRjaG4gbWVjaGFuaXNtIGFw
cGVhcnMNCi0gaXQgc2hvdWxkbid0IG1lbnRpb24gMkwgYXMgdGhlIHNldHRpbmcgaXNuJ3QgIjIt
bGV2ZWwgb25seSIuIFRoZW4NCmFnYWluIHlvdSBtYXkgYWN0dWFsbHkgd2FudCBpdCB0byBiZWhh
dmUgbGlrZSB0aGlzLCBhbmQgaGVuY2UgYmUNCm5hbWVkIGFjY29yZGluZ2x5Lg0KDQpJcnJlc3Bl
Y3RpdmUgb2YgdGhlc2UgcmVtYXJrcywgYW5kIGFsb25nIHRoZSBsaW5lcyBvZiBjb21tZW50cyBv
bg0KdGhlIHYxIHRocmVhZCwgaW50cm9kdWNpbmcgd2lkZXIgY29udHJvbCB0aGF0IHdvdWxkIGFs
c28gYWxsb3cNCmRpc2FibGluZyAyLWxldmVsIChmb3IgSFZNIGd1ZXN0cykgd291bGQgc2VlbSBi
ZXR0ZXIgdG8gbWUuIFRoaXMNCndvdWxkIHRoZW4gaG9wZWZ1bGx5IGJlIGNvZGVkIHVwIGluIGEg
d2F5IHRoYXQgd291bGQgbWFrZSBleHRlbmRpbmcNCml0IHN0cmFpZ2h0Zm9yd2FyZCwgb25jZSBh
IDNyZCBtZWNoYW5pc20gYXBwZWFycy4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
