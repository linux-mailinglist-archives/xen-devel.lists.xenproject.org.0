Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E685C5C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdLE-0006DO-83; Thu, 08 Aug 2019 08:00:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvdLC-00069v-DQ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:00:06 +0000
X-Inumbo-ID: 825f0a72-b9b2-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 825f0a72-b9b2-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 08:00:05 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:59:46 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 07:59:04 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 07:59:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWjyPYcNwJ90thIXgEsHfmC8p9ykWRf/alyQffEEr8BABuTEu9u2gttnVbReWYTYit/TmllnMaADQOvgEXILQM+kJfuZKVtoz1CSPNAPxdrvKWHlgsvFGyJoZabM5jW88O0OJUKxIoLg3GmDrVN4bAKToL14GWZAGkHFaP8xdNEsuha6ryVoGgqkUCpNpMH+vkp+2Y2w0FjyW62T7IY1Xs2l4v0IWtmjnjXI72BcS/3gWYvaj1nggHcsYfe/BKVElHvs43JrpV0r2Hpj7cRUeLMLG6qWwTRMkjz9L4EhXIpc9kfobNwnaWQi2a22KfPZo+3xw/WlKL2maiNVE0cqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV2ibZ3ZtfGxRLATdzGxgoldyxv5gybqHdRBfJMTUcM=;
 b=A+Bchr8PmCwS09mfl19P0h6fFnm+A9/4BEdDu3/gqPEwkg2vdOfrrcyG5CaBK7BBdDh+Bxx81PqbwWMNBJ/BPVOW0/8vNYXc3Kc+jclcatMZnYX7+w1pZalN/xYHn22QexVo3Sn5K1XN81jD2saIZSODB8gyCf4Fx9quOYfmF2QOZByODyomNFVZshxcmbHy1WQZYn2ENF9ymGaT3PICOX3zY1cz7iinpsSOxEByNbLTbd2/J78T/m9pBa0CAdXnyh0lqGg/F6/oHSFevQvfCKHNEZUpPyFL5JJ0Ka1eihp7lqa8RUg7VdaCJIUVKDSu4Lr9JPwrHSlbkE4/TNI/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2992.namprd18.prod.outlook.com (20.179.23.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 07:59:03 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:59:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 1/4] xen/spinlocks: in debug builds store cpu holding the
 lock
Thread-Index: AQHVTSzXlrQ8kurvmUW1rudnDuQmCKbw9GCA///tid6AAAICgA==
Date: Thu, 8 Aug 2019 07:59:03 +0000
Message-ID: <786db0cb-68cb-5d5d-add2-11c3541abc0c@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
 <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
In-Reply-To: <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0125.eurprd07.prod.outlook.com
 (2603:10a6:207:8::11) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80d375d3-7985-48a0-8f06-08d71bd647b7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2992; 
x-ms-traffictypediagnostic: MN2PR18MB2992:
x-microsoft-antispam-prvs: <MN2PR18MB299274D5C07C3F48C8A19B01B3D70@MN2PR18MB2992.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(199004)(189003)(4744005)(31686004)(8936002)(305945005)(53936002)(76176011)(478600001)(446003)(53546011)(36756003)(66066001)(316002)(6636002)(386003)(26005)(256004)(8676002)(37006003)(7736002)(6506007)(6486002)(6512007)(6246003)(81166006)(54906003)(81156014)(186003)(6436002)(52116002)(31696002)(14454004)(6862004)(86362001)(2616005)(99286004)(102836004)(6116002)(5660300002)(25786009)(66946007)(80792005)(71190400001)(66446008)(3846002)(229853002)(11346002)(2906002)(476003)(71200400001)(486006)(64756008)(66476007)(4326008)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2992;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K8ZvAFWRKupxYiRhVhVstijYKIkBNu+AAXkgKdEOq1RtVUTMW63yabB/0STpORRBZbHR3dBZKQ511FvRXygUIfawc2Ilz6POI7GTEs2ltgwQe8Ns55EA8xnLv2443tID6xOaE0MjKmNggJuw7fl7V2bgJ/Sp28MX0SupGFMLo2/lToWIXycl+TxC6qtND7XPP6eXgMKAiRJw9KgB/G8StfhsnUd0ZSYx2+NJPO8UYD9mevDV2Gb6BBIE7DFaIk8zj0O6rTpk+zC4D9lDHYvY9YdnsUccNoQoWnMM5tSHWdu1lbwYbfgj5yQa0cJhZTTDKpkh3+IC69dgWYRz0Z5OnV3lGSfCvbmCvqMHhfSHPp/wvWJuL1+cm0Z5QyARO7okk2wvAioow8qxNV6IdkjOWXg6Yvg3CnOP7+jv9KT3vt0=
Content-ID: <D05CB1D8FE52D2459055B8831CF0EB5F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d375d3-7985-48a0-8f06-08d71bd647b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:59:03.7367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D09RY8wesYZJ5cZyruQ9YyjXDEvkGwd1+OSLcEwckJ6OJm8U7D3Vji3zhjFQwAlFObwjJ5o2rhdjkAX2+aqbiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2992
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAwOTo1MSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDguMDguMTkg
MDg6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgc2hvcnQgaXJxX3Nh
ZmU6MTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgc2hvcnQgcGFkOjI7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIHNob3J0IGNwdToxMjsNCj4+PiArwqDCoMKgIH07DQo+Pj4g
wqDCoCB9Ow0KPj4NCj4+IERvIHdlIGhhdmUgYW4gaW1wbGllZCBhc3N1bXB0aW9uIHNvbWV3aGVy
ZSB0aGF0IHVuc2lnbmVkIHNob3J0IGlzDQo+PiBleGFjdGx5IDE2IGJpdHMgd2lkZT8gSSB0aGlu
ayAidmFsIiB3YW50cyB0byBiZSB1aW50MTZfdCBoZXJlIChhcw0KPj4geW91IHJlYWxseSBtZWFu
ICJleGFjdGx5IDE2IGJpdHMiKSwgdGhlIHR3byBib29sZWFuIGZpZWxkcyB3YW50DQo+PiB0byBi
ZSBib29sLCBhbmQgdGhlIHJlbWFpbmluZyB0d28gb25lcyB1bnNpZ25lZCBpbnQuDQo+IA0KPiBC
dXQgdGhhdCB3b3VsZCBpbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgdW5pb24gdG8gNCBieXRlcyBp
bnN0ZWFkIG9mIDIuDQo+IFNvIGF0IGxlYXN0IHBhZCBhbmQgY3B1IG11c3QgYmUgdW5zaWduZWQg
c2hvcnQgb3IgKGJldHRlcikgdWludDE2X3QuDQoNCk9oLCByaWdodC4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
