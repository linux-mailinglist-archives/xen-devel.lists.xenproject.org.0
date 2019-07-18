Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D76D0DE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho86u-0002LD-36; Thu, 18 Jul 2019 15:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho86s-0002L5-5T
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:14:18 +0000
X-Inumbo-ID: b3d42cca-a96e-11e9-ab9a-13bb60e71ffe
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3d42cca-a96e-11e9-ab9a-13bb60e71ffe;
 Thu, 18 Jul 2019 15:14:15 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:14:11 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:13:41 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:13:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce03qKn7blY0kVibTLy6bRBR9euhpsdXRO9stvpjvU6vzI+oidlByRpDR7cWMC6QewPMXsWvY4QxklJOdEp8xE/dwBUwD4A0V5LmDAgira19zyba8Ap3IiY/gqvuege5e9Spj3BuU4J1M/w3CvT9mq/c8jKoXsRd4rb07/excM8KMPCaLB6WYZywmeAZt6ytOFMuBS6TnDwPUgnjfah1gBzpkEdGOcedv/dvXZpVNAL7KxKHM2MKSFUzGKSTiPhIeH8+DDmtbchLcHHrItLRedKSv3KKTECUaK/MgctiEiJRUdw40ZTRuoGicYdK8xPbwBC7Ss/s7s5JoVc+Zyt5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rI7SWKJ2Rt5b79/U+BQgtSwKfNmRmvB+vHHNJq8fFI=;
 b=Ib6wZ3B1AvnCs6tyy6tS9uy2Y8Py+bBgdDW9o6IF9gI8jtEzT6m/WT/VdpOw9RSJZDoiOcOm5LtWDbFHmw5Vxen4mkXcUVgIG9J8uUxbzPxU4hOREkxlhhK2kq5WgdzG5HA3tWn6aUG7Syranw2JHOWJ7G+JHH0HY8BA2Te/GPFVQKq5fqmfD0mwro1ljMFekIrWu2z0C67r9bR3xh+bTK1braqTQyWWgGXK32cng5D3r9G4S7kwbVkHVnMgAJkNhrllzWQimUegfL2Lv9Rrk3FYPl+f+n8txEJku9lkZxfUgyzDw7gdIw7vXsbJ45DNR31fs+3YwVq2Ygij32+DEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2905.namprd18.prod.outlook.com (20.179.49.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:13:40 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:13:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [RFC] xen: Add .astylerc for automated style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQe86A
Date: Thu, 18 Jul 2019 15:13:40 +0000
Message-ID: <642271a1-d9ca-adfc-c06b-cd05d266e53c@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
In-Reply-To: <20190718144317.23307-1-tamas@tklengyel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::28) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62812dd8-ce35-455b-1e75-08d70b9283d7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2905; 
x-ms-traffictypediagnostic: DM6PR18MB2905:
x-microsoft-antispam-prvs: <DM6PR18MB2905A906D75EF59F241D08C3B3C80@DM6PR18MB2905.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(486006)(316002)(4744005)(229853002)(81166006)(81156014)(54906003)(8936002)(3846002)(36756003)(31686004)(6486002)(6506007)(8676002)(476003)(6246003)(4326008)(256004)(99286004)(6916009)(102836004)(53546011)(53936002)(5660300002)(86362001)(6116002)(66446008)(64756008)(66556008)(66946007)(66476007)(71190400001)(52116002)(2906002)(386003)(66066001)(7416002)(31696002)(71200400001)(80792005)(76176011)(478600001)(6512007)(26005)(186003)(68736007)(446003)(7736002)(25786009)(2616005)(11346002)(6436002)(14454004)(305945005)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2905;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Hn3H6cg81bpU/cTkwOXWCW6VpDw7iXSAsYEswqDOWQT0HU79jZZ8fp9q8ii/A1fApCIlDz8vTXH7g3ue0TEWiMidoEa98VyqAHIeIcNVa5rvLOwcmGlG5YOU+cS09FukkxLG6HZtjbZ6HiYEmLc+WTxYXkL0a8s0/C6iUeHVxvXOHuFk9Sl14bUNnvUHMGZ94u4ppqWSXCjPLGZB/m9QCgiBl6cpCGgB7P9hSEc1yrNJrtKgjuuziMh/jBd0yI36gXYRqOvY8SjtSgTZ7OGJoR4fnmWp7L/E1h1LQ/QDcYmdy/3reEwRIdX7oqcpqJsxLaukhan7vr4940u9Ne7gjkku5jBTKUDtfmyHcXyG2tiqgrSS2zkOMPuWWKkmKmG2hEBnACj4JvkMfOq49zQ1WuqAil2+2WjWAN4HvZKLNc=
Content-ID: <9BC884836FB2984CA11B8C9E79B9136C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62812dd8-ce35-455b-1e75-08d70b9283d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:13:40.3777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2905
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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

T24gMTguMDcuMjAxOSAxNjo0MywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiAtLS0gYS9DT0RJ
TkdfU1RZTEUNCj4gKysrIGIvQ09ESU5HX1NUWUxFDQo+IEBAIC02MCw4ICs2MCw4IEBAIEJyYWNp
bmcNCj4gICAtLS0tLS0tDQo+ICAgDQo+ICAgQnJhY2VzICgneycgYW5kICd9JykgYXJlIHVzdWFs
bHkgcGxhY2VkIG9uIGEgbGluZSBvZiB0aGVpciBvd24sIGV4Y2VwdA0KPiAtZm9yIHRoZSBkby93
aGlsZSBsb29wLiAgVGhpcyBpcyB1bmxpa2UgdGhlIExpbnV4IGNvZGluZyBzdHlsZSBhbmQNCj4g
LXVubGlrZSBLJlIuICBkby93aGlsZSBsb29wcyBhcmUgYW4gZXhjZXB0aW9uLiBlLmcuOg0KPiAr
Zm9yIHRoZSB3aGlsZS1wYXJ0IG9mIGRvL3doaWxlIGxvb3BzLiAgVGhpcyBpcyB1bmxpa2UgdGhl
IExpbnV4IGNvZGluZyBzdHlsZQ0KPiArYW5kIHVubGlrZSBLJlIuICBkby93aGlsZSBsb29wcyBh
cmUgYW4gZXhjZXB0aW9uLiBlLmcuOg0KPiAgIA0KPiAgIGlmICggY29uZGl0aW9uICkNCj4gICB7
DQo+IEBAIC03Nyw3ICs3Nyw4IEBAIHdoaWxlICggY29uZGl0aW9uICkNCj4gICAgICAgLyogRG8g
c3R1ZmYuICovDQo+ICAgfQ0KPiAgIA0KPiAtZG8gew0KPiArZG8NCj4gK3sNCj4gICAgICAgLyog
RG8gc3R1ZmYuICovDQo+ICAgfSB3aGlsZSAoIGNvbmRpdGlvbiApOw0KDQpJIGRpc2FncmVlIHdp
dGggdGhpcyBjaGFuZ2U6IFRoZXJlJ3MgYSBsYXJnZSBudW1iZXIgb2YgKGNvcnJlY3QgYXMNCnBl
ciB0aGUgdGV4dCBwcmlvciB0byB5b3VyIGNoYW5nZSkgaW5zdGFuY2VzLCBhbmQgc2luY2UgdGhl
cmUncw0Kbm90aGluZyBhZmZlY3RpbmcgdGhlIGxlbmd0aCBvZiBzdWNoIGxpbmVzIGF2b2lkaW5n
IHRoZSBleHRyYSBsaW5lDQppcyBxdWl0ZSBkZXNpcmFibGUgaW1vLg0KDQpKYW4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
