Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A262779012
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs81z-0002ae-JS; Mon, 29 Jul 2019 15:57:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs81x-0002aO-LM
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:57:45 +0000
X-Inumbo-ID: 98d4b8f0-b219-11e9-b358-eb125def30a3
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98d4b8f0-b219-11e9-b358-eb125def30a3;
 Mon, 29 Jul 2019 15:57:42 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:57:39 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:39:37 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:39:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z920VFA4PdzE+eGT2cMUj8A2KY3f72cDtCOnfmrZmRCDnC+7In4fVuIcxj2kgFwXgTBQ77Lq2LQsgPzg4iKUknmdBO8S3e5woiIgXxHopWfNQuuuY2ZGZCFXlc1dMvqIZqWAQXG6z3I35AcH0A/JswGhRKeLygKrd7gDTCggKpUf2Zv1o2WQY55WFbwpsu1deSSGU4mcVrbef8Z4oKrCVeOYm0kIdYvBWjDcwJFd6UG8HGulviLIcQGydjmHAhgpkA5VWdY6kiYKCXCqYiOnev7xi7Iwrnvoaf/Ajq+pgc3xRT+gZMcy/x4zifNWEJTM4/ExedAzzdqo4kVTMG48Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIiUxdVbPXmfyza3zv3iSMLo5pHSWyc/BxMgwNGb6KU=;
 b=PnBsqNAKDJUcYH6g2lheY3xYLVUPN6GTkYVtzqOcCEDtHs8iVEg2+jKTF31d1nb5Pc7Ydm+xi/jAC55eEI/DzGiyf086Dpyxj4fPNdNi+50FozYJt7yMjxvrk9pbwraD0uYRlIWXQLVYvaVlkMs3Dj/2Kov9yp9FfpKy08xdbzJavOepJOswStWHBlnVhLQjW49fbGoOFP3ya+K1UZVNW+OW+1Xdc6uyPMLsypTXe02iMmeuklpfTAKgDtn8rI2Vioc403Jfyog3tQaSzKbejrJxX97dhz+R/NdKCDhN9BsjaFoCWNBGDs0WkzByF4ZrEx101Deitw28s9cjqMYDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3156.namprd18.prod.outlook.com (10.255.138.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 15:39:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:39:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 3/3] build: allow picking the env values for toolchain
 utilities
Thread-Index: AQHVRiPSkFp+75VIl0mvuXFUmT434Q==
Date: Mon, 29 Jul 2019 15:39:35 +0000
Message-ID: <1073e04c-1a97-b51e-c67a-43acafeb7bbb@suse.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-4-roger.pau@citrix.com>
In-Reply-To: <20190726133331.91482-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::26) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51f3d1b7-502c-4687-87b9-08d7143af52f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3156; 
x-ms-traffictypediagnostic: BY5PR18MB3156:
x-microsoft-antispam-prvs: <BY5PR18MB315699900DE9D9DACCCACCA0B3DD0@BY5PR18MB3156.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(189003)(199004)(6246003)(31696002)(36756003)(8936002)(14454004)(8676002)(52116002)(99286004)(6436002)(4326008)(81156014)(81166006)(186003)(76176011)(316002)(54906003)(25786009)(3846002)(6916009)(6116002)(6486002)(102836004)(229853002)(26005)(7736002)(6512007)(66476007)(486006)(305945005)(7416002)(478600001)(386003)(2906002)(53546011)(66946007)(66446008)(64756008)(66556008)(66066001)(446003)(86362001)(2616005)(68736007)(476003)(80792005)(5660300002)(31686004)(11346002)(256004)(71200400001)(6506007)(71190400001)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3156;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OZgCjQYImgAUW0i2O9oVU+wLKxY2vm2kRZ7GgVBvr/xmqCDQnXo6svo+GVpNF+de1rDDTexGZ+aLRitJAVNaixI3cb3XeoYbDeeVo+2S7RU8x1mqfOGBUedZPC0zLNgg18God2KF2Li3aR4g71Lt5etB0wE9H5GhVEAJHbWLwR1JHu4nNTrcBBy/ZL4DX2N3x6zoMwG5mKs2R8aG/ROTW+lJsMPR3u7rjErBWU9ckxl/KkJ8qtgw7+szU9by+5MwvAXDLZOhTQS7yZfXbP52a97GXulwcnsOIsHQl82DLiY8CD5XZ17FBrmLyp8eb0q3Y+NGNBimHVEn9EV9muqyfn6kUfO6P6IHqgLHSu/GqYSUg4gm4bIArryYOnwCmQrdJCezZoNmxZeZreGZHvDSnJx48VDeoEGslV5b+wvdxxU=
Content-ID: <45ADA96F5B18844293394BEE24490D37@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f3d1b7-502c-4687-87b9-08d7143af52f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:39:35.4563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3156
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/3] build: allow picking the env values for
 toolchain utilities
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

T24gMjYuMDcuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiAtLS0gYS9jb25m
aWcvU3RkR05VLm1rDQo+ICsrKyBiL2NvbmZpZy9TdGRHTlUubWsNCj4gQEAgLTEsOCArMSw2IEBA
DQo+ICAgIyBVc2UgQ2xhbmcvTExWTSBpbnN0ZWFkIG9mIEdDQz8NCj4gICBjbGFuZyAgICAgPz0g
bg0KPiAgIA0KPiAtQVMgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcw0KPiAtTEQgICAgICAg
ICA9ICQoQ1JPU1NfQ09NUElMRSlsZA0KPiAgIGlmZXEgKCQoY2xhbmcpLHkpDQo+ICAgZ2NjICAg
ICAgIDo9IG4NCj4gICBERUZfQ0MgICAgID0gY2xhbmcNCj4gQEAgLTI4LDE5ICsyNiwyMSBAQCBI
T1NUQ0MgICAgPz0gJChERUZfQ0MpDQo+ICAgSE9TVENYWCAgID89ICQoREVGX0NYWCkNCj4gICBl
bmRpZg0KPiAgIA0KPiAtQ1BQICAgICAgICA9ICQoQ0MpIC1FDQo+IC1BUiAgICAgICAgID0gJChD
Uk9TU19DT01QSUxFKWFyDQo+IC1SQU5MSUIgICAgID0gJChDUk9TU19DT01QSUxFKXJhbmxpYg0K
PiAtTk0gICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlubQ0KPiAtU1RSSVAgICAgICA9ICQoQ1JP
U1NfQ09NUElMRSlzdHJpcA0KPiAtT0JKQ09QWSAgICA9ICQoQ1JPU1NfQ09NUElMRSlvYmpjb3B5
DQo+IC1PQkpEVU1QICAgID0gJChDUk9TU19DT01QSUxFKW9iamR1bXANCj4gLVNJWkVVVElMICAg
PSAkKENST1NTX0NPTVBJTEUpc2l6ZQ0KPiArQVMgICAgICAgID89ICQoQ1JPU1NfQ09NUElMRSlh
cw0KPiArTEQgICAgICAgID89ICQoQ1JPU1NfQ09NUElMRSlsZA0KPiArQ1BQICAgICAgID89ICQo
Q0MpIC1FDQo+ICtBUiAgICAgICAgPz0gJChDUk9TU19DT01QSUxFKWFyDQo+ICtSQU5MSUIgICAg
Pz0gJChDUk9TU19DT01QSUxFKXJhbmxpYg0KPiArTk0gICAgICAgID89ICQoQ1JPU1NfQ09NUElM
RSlubQ0KPiArU1RSSVAgICAgID89ICQoQ1JPU1NfQ09NUElMRSlzdHJpcA0KPiArT0JKQ09QWSAg
ID89ICQoQ1JPU1NfQ09NUElMRSlvYmpjb3B5DQo+ICtPQkpEVU1QICAgPz0gJChDUk9TU19DT01Q
SUxFKW9iamR1bXANCj4gK1NJWkVVVElMICA/PSAkKENST1NTX0NPTVBJTEUpc2l6ZQ0KDQpUaGlz
IGRvZXMgYWZmZWN0IG1vcmUgdGhhbiBqdXN0IHRoZSB0b29sY2hhaW4gcGFydCBvZiB0aGUgdHJl
ZSwNCmRvZXNuJ3QgaXQ/IElycmVzcGVjdGl2ZSBvZiB0aGlzIG15IHBvaW50IG1hZGUgZm9yIHBh
dGNoIDINCmFwcGxpZXMgaGVyZSBhcyB3ZWxsLiBGdXJ0aGVybW9yZSwgaWYgd2Ugd2VyZSB0byBn
byB0aGlzIHJvdXRlLA0KdGhlbiBTdW5PUy5tayB3b3VsZCB3YW50IHNpbWlsYXIgbWFzc2FnaW5n
Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
