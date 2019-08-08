Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580985BAF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:38:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcyC-0003PN-5K; Thu, 08 Aug 2019 07:36:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvcy9-0003PI-SC
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:36:17 +0000
X-Inumbo-ID: 341a49d7-b9af-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 341a49d7-b9af-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 07:36:16 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:36:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 07:32:40 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 07:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx1krN1rw1uSMGzopVY/XYsaoHg1qwJjMvPKRnsrg0lUCHj7UNKAUJgpvISJjF3P+FR4eV9OLjNefs0OrD707Hs9JKFHAGqyn7SQ+CAo03H9R52Ssuvb5hDbCALOCEPzlu8GCGahUwkOuY5KKE2x+YVoXrJ00WYfHEeim/Ry2oX7oX9+rMQRg1XwXAzhdFzPzxGd2ePlGNhnEuxEjWDOswbmOuul2p842uCgjz1nLbPWP2JJexkH5lQfGd9HmxIYT4aE4MhIhZrI8jzDbMFRmO6t76WJm4VydsC0OgEv5zVq1CBScKazNUaB7Cx8hNKU9hdKIB8LqHaknlwVWvYlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFrNth/oouxfCYvhj47C2w3mpx5PLct9qNk5pEeKYRw=;
 b=gMKF/54dlW0JswOR+1Mo4/i+z4IC5NUh45vyP2W0ExdbEpKmWzRYGakQtEZJ0dzvfTrFCPa/q8tbmw4it3apQPjCADUoYn5mv13yXOfNq5GNyLoJxRddjVO8Cmkc1jx+cu16jA2NtgTaOhZMOdc1ttEASV58i479PbkRqrWg0GBgqF1PLMR3+omDDB1OSpbCFH5phuwDy81YFjMWkvhQ56ChE+bJWXsmuGlW70jXGbxR+cslV0+PUNqbpnCZhbK72saRKEZT1s0W3WBgQcOPNXRW+BN54+F2N0sUxnX6jBLD6VA2eRn3D8ADInpqFXkUQJy950huBTLHZvphobxj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2623.namprd18.prod.outlook.com (20.179.82.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 8 Aug 2019 07:32:38 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:32:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 4/4] xen: modify lock profiling interface
Thread-Index: AQHVTSzYoaxeQnTspU6rE8JBS3hDbqbw3IcA
Date: Thu, 8 Aug 2019 07:32:38 +0000
Message-ID: <5c73f39c-a8a3-2554-d66e-6b71df02f02c@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-5-jgross@suse.com>
In-Reply-To: <20190807143119.8360-5-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:208:55::32) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae690758-c9c4-418a-2f43-08d71bd296c0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2623; 
x-ms-traffictypediagnostic: MN2PR18MB2623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB2623F649ADBE1CCE883C3D28B3D70@MN2PR18MB2623.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(81156014)(76176011)(229853002)(36756003)(2906002)(476003)(11346002)(446003)(52116002)(2616005)(14454004)(4326008)(6486002)(8936002)(6436002)(66066001)(99286004)(486006)(6862004)(81166006)(8676002)(31686004)(6636002)(6512007)(6116002)(305945005)(478600001)(256004)(14444005)(25786009)(86362001)(5660300002)(316002)(31696002)(186003)(71190400001)(80792005)(102836004)(53546011)(66476007)(386003)(66556008)(54906003)(6506007)(64756008)(66446008)(53936002)(37006003)(7736002)(3846002)(6246003)(26005)(66946007)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2623;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FUGRASefmOJtetYYgyQ5mhQ7J3e1oFn8WKk5awUBco4FaVI6h/R4zlpnCoNtgrd2HDrw+zLqU2+5i35pMTdWQSMAsR252J1qszQuqWEAOpuiTeqas57c3mfHoGmVW1RX54AOR5zT5vtBxxJnflaClLjDC4tr4gPSJ21lXEfeNFeqbfxfG6djALT1mphbsVohRl2BU2bBCRJV0cM3UHPfQEO7LlJcHpzS/W229WDPK/yPiNxKGyvlioPzPHHcHaP7IcXVvRML/Kb1egSUBtiGlOSbx4QL0Go9ehyJ/da843K8oQMBG5mhxt6w4dHkQI+kdtmSOq+4DHEQPYwDPuSWeJxmsg+9ckLhxDRwzDnWnc4zHLLK44+Ttqig+dA/4CMdrZO8T3x1X2AxdCCmI0GabT62KY2UM66sdm3eVhk3Wzg=
Content-ID: <3A01EE5E0AEC524D93D5D20581DCF5BA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae690758-c9c4-418a-2f43-08d71bd296c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:32:38.4482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pI+w1DqEmRIdqIRJsB0prgETY9/bpCCvO7TAALzSPI4Nn4Sv6z/Qq+Y4s+R+Qv/mVBxyeX/ph+10tddp60xiMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2623
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/4] xen: modify lock profiling interface
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

T24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQEAgLTQ2MywzMSAr
NDY0LDY3IEBAIGludCBzcGlubG9ja19wcm9maWxlX2NvbnRyb2woc3RydWN0IHhlbl9zeXNjdGxf
bG9ja3Byb2Zfb3AgKnBjKQ0KPiAgICAgICByZXR1cm4gcmM7DQo+ICAgfQ0KPiAgIA0KPiAtdm9p
ZCBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgNCj4gLSAgICBpbnQzMl90IHR5cGUsIHN0
cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKnFoZWFkLCBpbnQzMl90IGlkeCwgY2hhciAqbmFtZSkN
Cj4gK3N0YXRpYyBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqZmluZF9wcm9mX2FuYyhjb25zdCBj
aGFyICpuYW1lKQ0KPiAgIHsNCj4gLSAgICBxaGVhZC0+aWR4ID0gaWR4Ow0KPiArICAgIHN0cnVj
dCBsb2NrX3Byb2ZpbGVfYW5jICphbmM7DQo+ICsNCj4gKyAgICBmb3IgKCBhbmMgPSBsb2NrX3By
b2ZpbGVfYW5jczsgYW5jOyBhbmMgPSBhbmMtPm5leHQgKQ0KPiArICAgICAgICBpZiAoICFzdHJj
bXAoYW5jLT5uYW1lLCBuYW1lKSApDQo+ICsgICAgICAgICAgICByZXR1cm4gYW5jOw0KPiArICAg
IHJldHVybiBOVUxMOw0KPiArfQ0KPiArDQo+ICt2b2lkIF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJf
c3RydWN0KHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKnFoZWFkLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQzMl90IGlkeCwgY29uc3QgY2hhciAqbmFtZSkNCj4g
K3sNCj4gKyAgICBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqYW5jOw0KPiArDQo+ICAgICAgIHNw
aW5fbG9jaygmbG9ja19wcm9maWxlX2xvY2spOw0KPiAtICAgIHFoZWFkLT5oZWFkX3EgPSBsb2Nr
X3Byb2ZpbGVfYW5jc1t0eXBlXS5oZWFkX3E7DQo+IC0gICAgbG9ja19wcm9maWxlX2FuY3NbdHlw
ZV0uaGVhZF9xID0gcWhlYWQ7DQo+IC0gICAgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSA9
IG5hbWU7DQo+ICsNCj4gKyAgICBhbmMgPSBmaW5kX3Byb2ZfYW5jKG5hbWUpOw0KPiArICAgIGlm
ICggIWFuYyApDQo+ICsgICAgew0KPiArICAgICAgICBhbmMgPSB4emFsbG9jKHN0cnVjdCBsb2Nr
X3Byb2ZpbGVfYW5jKTsNCj4gKyAgICAgICAgYW5jLT5uYW1lID0gbmFtZTsNCj4gKyAgICAgICAg
YW5jLT5uZXh0ID0gbG9ja19wcm9maWxlX2FuY3M7DQo+ICsgICAgICAgIGxvY2tfcHJvZmlsZV9h
bmNzID0gYW5jOw0KPiArICAgIH0NCg0KVGhpcyBpcyBhbiBpbW8gZnVuZGFtZW50YWwgd2Vha25l
c3Mgb2YgdGhlIG5ldyBtb2RlbDogWW91IG5vdw0KcmVxdWlyZSBhIGR5bmFtaWMgbWVtb3J5IGFs
bG9jYXRpb24gKG9mIHdoaWNoIHlvdSBkb24ndCBldmVuDQpjaGVjayB0aGF0IGl0IHdhcyBzdWNj
ZXNzZnVsKS4gUmlnaHQgbm93IHRoZSBwYXRoIGFib3ZlIHdpbGwNCm9ubHkgYmUgdGFrZW4gYXQg
Ym9vdCB0aW1lLCBidXQgdGhhdCdzIG5vdCBzdGF0ZWQgYW55d2hlcmUgYXMNCmEgcmVzdHJpY3Rp
b24gKGFmYWljcyksIGFuZCBoZW5jZSBkb2Vzbid0IG5lZWQgdG8gcmVtYWluIHRoaXMNCndheS4N
Cg0KRnVydGhlcm1vcmUgIm5hbWUiIG5vdyBzZXJ2ZXMgdHdvIHB1cnBvc2VzIHdoZW4gcHJldmlv
dXNseSBpdA0Kc2VydmVkIGp1c3Qgb25lLiBUaGlzIGlzIGJlc3Qgbm90aWNlYWJsZSB3aXRoIHRo
ZSBmdW5jdGlvbidzDQp1c2UgaW4gZG9tYWluX2NyZWF0ZSgpOiBQcmV2aW91c2x5IHRoYXQgc2V0
IHVwIHRoZSBjbGFzcw0KInBlci1kb21haW4iIHdpdGggYW4gaW5pdGlhbCBpbnN0YW5jZSAic3Ry
dWN0IGRvbWFpbiIuIFRoaXMNCmRpZCBwcm92aWRlIGZvciBzb21lb25lIGxhdGVyIGdvaW5nIGFu
ZCBhbHNvIHJlZ2lzdGVyaW5nDQphbm90aGVyIHBlci1kb21haW4gc3RydWN0dXJlIChlLmcuIHN0
cnVjdCBwMm1fZG9tYWluKSBhcw0KYW5vdGhlciAicGVyLWRvbWFpbiIgY2xhc3MgaW5zdGFuY2Uu
IFRoZW4gYWdhaW4gbWF5YmUgSSdtIG5vdA0KY29ycmVjdGx5IHVuZGVyc3RhbmRpbmcgdGhlIG9y
aWdpbmFsIGludGVudGlvbnMgLi4uDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
