Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547A85B37
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:04:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcPt-0000vF-3H; Thu, 08 Aug 2019 07:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvcPr-0000v9-RZ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:00:51 +0000
X-Inumbo-ID: 3edaa07e-b9aa-11e9-90d6-ff570262c85a
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3edaa07e-b9aa-11e9-90d6-ff570262c85a;
 Thu, 08 Aug 2019 07:00:46 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:00:33 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 06:58:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 06:58:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw63ftzva9ffWrhHDbvROTy5jYwuiLhq23EGPJ21B2MgTFwYgFqpNCjSvGFkCXLFoAaEblAhexZWQruxXwikZAbYE9BBhwp0DdIAKXa0QGM+7JNDIQJklgExeJTMbTpUI9fqcV3jVuXMia50jgiYsUCt679C9WovxSPtfjIxSVnWydzJPkn6Fxshd/R2xtUnh1/YCq3AdYDY6qQMxqM11bgHe6aFaFBjPzFCz6USHykaBpgPKe8mR2GpIKCiEsDWcq86r7sF0sQgtiIdt/lATdTy3v8yH/x9avNqJIMQhORZruX4g7wiSnKY51noCng1tCP94RYWVSOeE/Pahih56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQB4H+Drc5cxf54zVL8WZUM+rhOdcR6kmFcSiv3QurE=;
 b=Nk7FWoHbtvDGtbhFVl1OQ/lw1qRyR9RsF9Y6p1b5fJ4UNu6gd8gjxI8+42kp9XDLA6/G1T+DORp9ac9HHRaLhWPUG20SbqGp49FvgKoTyttgNGe3MHS9MgOHuUXYyqXYBG/7Zr88eBFfNDWMhtoHaIGbBYYkVb0WcEfQI6ant3C/sF2WDZrd9ypYbod1Be6ryUHnvoUtmt4MdgS9SeBgKvQZB8xkmtcHOZOE4UQcAoPUYG5dFRuZM06KCi/qxt1naTZdpgHjUbv3HJ3pOjwRPNzcPwDMlCh7mpjEVUAoE7A4vhw980oFU+s3a5gbGLk4hS7DjlryZy5ykKM5KvXnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2926.namprd18.prod.outlook.com (20.179.21.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 06:58:01 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 06:58:01 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 1/4] xen/spinlocks: in debug builds store cpu holding the
 lock
Thread-Index: AQHVTSzXlrQ8kurvmUW1rudnDuQmCKbw0tmA
Date: Thu, 8 Aug 2019 06:58:01 +0000
Message-ID: <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
In-Reply-To: <20190807143119.8360-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0081.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::22) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fafaca67-5c41-4f54-bee7-08d71bcdc0ca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2926; 
x-ms-traffictypediagnostic: MN2PR18MB2926:
x-microsoft-antispam-prvs: <MN2PR18MB2926D7150193E6203879F977B3D70@MN2PR18MB2926.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(189003)(305945005)(256004)(386003)(6116002)(37006003)(8936002)(81166006)(3846002)(54906003)(76176011)(81156014)(8676002)(53546011)(2906002)(52116002)(6506007)(26005)(316002)(6862004)(14454004)(478600001)(99286004)(102836004)(186003)(66066001)(4326008)(80792005)(36756003)(71190400001)(71200400001)(86362001)(64756008)(66946007)(66556008)(66446008)(6246003)(7736002)(6512007)(6436002)(31696002)(66476007)(31686004)(14444005)(229853002)(476003)(486006)(6636002)(11346002)(2616005)(53936002)(5660300002)(25786009)(6486002)(446003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2926;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PTBv3uRdk4iRjAej1vIs3axgZJNRLjXLAP9M/Z4JPnB+T1vdVtxYylMeD60eR+bHjOedQX7Yq0mYmX2chnmb2L7z4T26BCemEtikD4fEEdfv77HCKjkMLmy66KSiTBoJSwOEK9iR/QFykoiyAPwT00WrgaemX+R36ZZwEVxyul896PAruQnmzXb2b7kanky4KledaodLqIpabs7+ciz0prYnbIjlp9xm/soqN90ef/0C+seRv/8sdTejBvaTbO20ZJEFm52/fgKDvsa38nafDXUPXnc9QqnQKJOgnEakrYlYMhEbnsEPYyLj6kAadn1PoxdN8eqs3gVlNRfIp4HfK8Ym6Jx+StU3WHM+yPhSioOw+VszsMmtx4wvqvoMI1/9GXvUSJ/ReUNydIlAIQHDqPNGuQsqLfHIJqxsDsZnd6s=
Content-ID: <5062C27CF4B7684D854B80211D4BD753@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fafaca67-5c41-4f54-bee7-08d71bcdc0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 06:58:01.6011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Shb66YzZ33qKZEBC/JhQUDPjB2pX8OAB6yOv9vsyAAaQvjOnEMB0JiBZzFhuVDXMNDtzpx7C21+6sqBbe/wcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2926
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gLS0tIGEveGVuL2Nv
bW1vbi9zcGlubG9jay5jDQo+ICsrKyBiL3hlbi9jb21tb24vc3BpbmxvY2suYw0KPiBAQCAtMTMs
OSArMTMsOSBAQA0KPiAgIA0KPiAgIHN0YXRpYyBhdG9taWNfdCBzcGluX2RlYnVnIF9fcmVhZF9t
b3N0bHkgPSBBVE9NSUNfSU5JVCgwKTsNCj4gICANCj4gLXN0YXRpYyB2b2lkIGNoZWNrX2xvY2so
c3RydWN0IGxvY2tfZGVidWcgKmRlYnVnKQ0KPiArc3RhdGljIHZvaWQgY2hlY2tfbG9jayh1bmlv
biBsb2NrX2RlYnVnICpkZWJ1ZykNCj4gICB7DQo+IC0gICAgaW50IGlycV9zYWZlID0gIWxvY2Fs
X2lycV9pc19lbmFibGVkKCk7DQo+ICsgICAgdW5zaWduZWQgc2hvcnQgaXJxX3NhZmUgPSAhbG9j
YWxfaXJxX2lzX2VuYWJsZWQoKTsNCg0KYm9vbD8gU2VlaW5nIHlvdXIgaGVhdnkgdXNlIG9mICJ1
bnNpZ25lZCBzaG9ydCIgSSByZWFsaXplIHRoYXQNCm15IENvZGluZ1N0eWxlIGNoYW5nZSBjb21t
aXR0ZWQgeWVzdGVyZGF5IHN0aWxsIHdhc24ndCBwcmVjaXNlDQplbm91Z2guDQoNCj4gQEAgLTQz
LDE4ICs0MywyMSBAQCBzdGF0aWMgdm9pZCBjaGVja19sb2NrKHN0cnVjdCBsb2NrX2RlYnVnICpk
ZWJ1ZykNCj4gICAgICAqLw0KPiAgICAgIGlmICggdW5saWtlbHkoZGVidWctPmlycV9zYWZlICE9
IGlycV9zYWZlKSApDQo+ICAgICAgew0KPiAtICAgICAgICBpbnQgc2VlbiA9IGNtcHhjaGcoJmRl
YnVnLT5pcnFfc2FmZSwgLTEsIGlycV9zYWZlKTsNCj4gKyAgICAgICAgdW5pb24gbG9ja19kZWJ1
ZyBzZWVuLCBuZXcgPSB7IDAgfTsNCj4gICANCj4gLSAgICAgICAgaWYgKCBzZWVuID09ICFpcnFf
c2FmZSApDQo+ICsgICAgICAgIG5ldy5pcnFfc2FmZSA9IGlycV9zYWZlOw0KPiArICAgICAgICBz
ZWVuLnZhbCA9IGNtcHhjaGcoJmRlYnVnLT52YWwsIDB4ZmZmZiwgbmV3LnZhbCk7DQoNClRoaXMg
MHhmZmZmIHNob3VsZCBiZSBjb25uZWN0ZWQgKGJ5IHdheSBvZiBhdCBsZWFzdCBhICNkZWZpbmUp
IHRvDQp0aGUgb25lIHVzZWQgaW4gX0xPQ0tfREVCVUcuDQoNCj4gKyAgICAgICAgaWYgKCAhc2Vl
bi51bnVzZWQgJiYgc2Vlbi5pcnFfc2FmZSA9PSAhaXJxX3NhZmUgKQ0KDQpXaGlsZSAidW51c2Vk
IiBtYWtlcyBzdWZmaWNpZW50IHNlbnNlIGhlcmUsIC4uLg0KDQo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zcGlubG9jay5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oDQo+IEBA
IC03LDE0ICs3LDIwIEBADQo+ICAgI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4NCj4gICANCj4gICAj
aWZuZGVmIE5ERUJVRw0KPiAtc3RydWN0IGxvY2tfZGVidWcgew0KPiAtICAgIHMxNiBpcnFfc2Fm
ZTsgLyogKzE6IElSUS1zYWZlOyAwOiBub3QgSVJRLXNhZmU7IC0xOiBkb24ndCBrbm93IHlldCAq
Lw0KPiArdW5pb24gbG9ja19kZWJ1ZyB7DQo+ICsgICAgdW5zaWduZWQgc2hvcnQgdmFsOw0KPiAr
ICAgIHN0cnVjdCB7DQo+ICsgICAgICAgIHVuc2lnbmVkIHNob3J0IHVudXNlZDoxOw0KDQouLi4g
aXQgZ2l2ZXMgYSByYXRoZXIgbWlzbGVhZGluZyBpbXByZXNzaW9uIG9mIHRoaXMgYmVpbmcgYW4g
dW51c2VkDQpmaWVsZCBoZXJlLiBIb3cgYWJvdXQgZS5nLiAidW5zZWVuIiBpbnN0ZWFkPw0KDQo+
ICsgICAgICAgIHVuc2lnbmVkIHNob3J0IGlycV9zYWZlOjE7DQo+ICsgICAgICAgIHVuc2lnbmVk
IHNob3J0IHBhZDoyOw0KPiArICAgICAgICB1bnNpZ25lZCBzaG9ydCBjcHU6MTI7DQo+ICsgICAg
fTsNCj4gICB9Ow0KDQpEbyB3ZSBoYXZlIGFuIGltcGxpZWQgYXNzdW1wdGlvbiBzb21ld2hlcmUg
dGhhdCB1bnNpZ25lZCBzaG9ydCBpcw0KZXhhY3RseSAxNiBiaXRzIHdpZGU/IEkgdGhpbmsgInZh
bCIgd2FudHMgdG8gYmUgdWludDE2X3QgaGVyZSAoYXMNCnlvdSByZWFsbHkgbWVhbiAiZXhhY3Rs
eSAxNiBiaXRzIiksIHRoZSB0d28gYm9vbGVhbiBmaWVsZHMgd2FudA0KdG8gYmUgYm9vbCwgYW5k
IHRoZSByZW1haW5pbmcgdHdvIG9uZXMgdW5zaWduZWQgaW50Lg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
