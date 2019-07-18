Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A539A6D138
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:36:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8PC-0004YI-HF; Thu, 18 Jul 2019 15:33:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho8PB-0004YD-0k
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:33:13 +0000
X-Inumbo-ID: 4d1439be-a971-11e9-be52-47bee77509ae
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d1439be-a971-11e9-be52-47bee77509ae;
 Thu, 18 Jul 2019 15:33:09 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:32:50 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:32:27 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnrGvRHMnV5gORsGBoAXbzi5Dl18QrSqwnvq07K7e6OFOCJ5hB0avqhC/Rlq4qIWx+Nre0Ovp0QTleLmZgRqWOZ5lYP6+GVfKxtxmNn1EWqkoRTUOSJ4/Znx/Bh6Rbfew3HSEUpP3GQqrhb9Ic2czoXYl30lcFxxBaUpI0dQ8r7JTdr2tNrUxx6MzWD9bKYIO7ld0PHrnbEcFqBRNRiUY2toRSC3bCW2peJTnwgTNLdlv6v/592UgKKuzYrL3u2YUa3CVHNPIxjARb4qXHOfKO6a9L4ezRkiB0XXKoJtVLr1Kril2Hnx2//e/YP6KbaKaXNpfKj2eVv+l0w1j4HjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBFHHSk+1TifIUFee/ggKbdmC8cf9RwiCDgReOjMRws=;
 b=QkJfXplX6lLAVL71MZonchJ4va8HyFrirFnLhcBze5cn6S5x06HFl4p1N9Jm9NkLwy2aBEs5dG8htPbiG9p4AIlGkOUHTTD8jNzz6c6gYz4ZcsJa3U068T/klMYm7sz76/EuAG+BnFjXzZcpPS+0IZ0dc5Szbcr5TGGYusL7RO4PCi6YH6wdosp8wXgY9gJtlaedOzuPP+5pfv3Sc1FAM6eged6T0eoXewOiEili5NQwlEb3eF1uAVG9x2jkHA2LGlvluwCJeebVacINJHvZMTj4WqS4rYJ61AwfEW+GljbFX/5BG8aNOXtONkLQKLOnQvyrxWTPerHOyAxUZlX6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3001.namprd18.prod.outlook.com (20.179.104.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 15:32:26 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:32:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: printf formatter for pci_sbdf_t
Thread-Index: AQHVPKkbqe/gqkIsCkyMLC3anRUky6bPCrxPgAE6U4CAADjtToAABKyA
Date: Thu, 18 Jul 2019 15:32:25 +0000
Message-ID: <1cd5ffa1-33c6-9001-954f-30ae62d0187f@suse.com>
References: <20190717140810.a5a4bhmm7fb6oah5@Air-de-Roger.citrite.net>
 <cf05039e-45e1-cc11-c7e3-c0953c74b83b@citrix.com>
 <a27a16f1-f8ca-e620-8e91-73c9b01a8968@suse.com>
 <20190718151456.ioengemnmvk4bfs2@Air-de-Roger.citrite.net>
In-Reply-To: <20190718151456.ioengemnmvk4bfs2@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::13) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a14fa2b-19cc-412e-f001-08d70b9522d2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3001; 
x-ms-traffictypediagnostic: DM6PR18MB3001:
x-microsoft-antispam-prvs: <DM6PR18MB30017E230539C05BB755A6D7B3C80@DM6PR18MB3001.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(199004)(189003)(186003)(53936002)(68736007)(76176011)(26005)(102836004)(486006)(99286004)(52116002)(386003)(6506007)(53546011)(64756008)(2616005)(6436002)(31696002)(81156014)(3846002)(14444005)(476003)(256004)(11346002)(446003)(8676002)(2906002)(6512007)(6116002)(54906003)(36756003)(6486002)(14454004)(86362001)(316002)(25786009)(31686004)(478600001)(7736002)(4326008)(6246003)(80792005)(6916009)(7416002)(229853002)(71200400001)(66066001)(8936002)(305945005)(66556008)(81166006)(5660300002)(66446008)(66946007)(66476007)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3001;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xCO7eousIisDfrXYZMPZAPxZ2/eLXH4JnHIGNRN8l3/k67P4hQ0ffNPrQolMPlwvxnTvbCOAPnPnRe+2NTotWK8OyBld4ADHVOWOUoeB5m6FX9Wf9Sm/yiGSt0FGd9VUGu5fALw6no4XYkbqWEe11N8Bc4x1pn4iuf2DRY8r4GALCK14zbY3mMiwHe3ByPrxTwhckTwjknRd5Pxt3ohhCXvThBDfWqrYFtO3pbXjAUNioXs8oyfnGzSneVxEBfNzY8voCjpM7zN1GQsBszpe3au9qTf0fdiwoAP9g9s8jZriRkAT3Dd5fLRIfXiPmdzceHnVqlaLRKnQHgVJpSpRMnk7THiLlPNQ8FsbvOKlWJimXuRYbtN2sxGxB13XxceDCkfMrSG3sR69yNnUWdHmexgm32fGMe9VkIGYo+pQnbI=
Content-ID: <525D0C314E40334DABCDB490BD6ABE6B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a14fa2b-19cc-412e-f001-08d70b9522d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:32:25.9975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3001
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] printf formatter for pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNzoxNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDE4LCAyMDE5IGF0IDExOjUxOjU3QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMTcuMDcuMjAxOSAxOTowNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAxNy8wNy8y
MDE5IDE1OjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBBcyBwYXJ0IG9mIHNvbWUg
UENJIHJlbGF0ZWQgY2xlYW51cCBJJ20gZG9pbmcsIHdoaWNoIGluY2x1ZGVzDQo+Pj4+IGV4cGFu
ZGluZyB0aGUgdXNhZ2Ugb2YgcGNpX3NiZGZfdCwgSSdtIGFsc28gcGxhbm5pbmcgdG8gYWRkIGEg
Y3VzdG9tDQo+Pj4+IHByaW50ZiBmb3JtYXR0ZXIgZm9yIHBjaV9zYmRmX3QgWzBdLCBzbyB0aGF0
IGEgU0JERiBjYW4gYmUgcHJpbnRlZA0KPj4+PiB3aXRob3V0IGhhdmluZyB0byBzcGVjaWZ5IGZv
dXIgZm9ybWF0dGVycyAoYW5kIHBhc3MgZm91ciBwYXJhbWV0ZXJzKQ0KPj4+PiBlYWNoIHRpbWUg
KCUwNHg6JTAyeDolMDJ4LiV1KS4NCj4+Pj4NCj4+Pj4gVGhlcmUncyBiZWVuIHNvbWUgZGViYXRl
IG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGFib3V0IHdoZXRoZXIgdGhlDQo+Pj4+IGZvcm1hdHRl
ciBzaG91bGQgYmUgJXBwIG9yICVvcCwgYW5kIEkgd291bGQgbGlrZSB0byBzZXR0bGUgb24gb25l
IG9mDQo+Pj4+IHRoZW0gYmVmb3JlIHNlbmRpbmcgYSBuZXcgdmVyc2lvbjoNCj4+Pg0KPj4+IEkg
YW0gZmlybWx5IG9wcG9zZWQgdG8gb3ZlcmxvYWRpbmcgJW8uDQo+Pg0KPj4gQW5kIEkgYW0gZmly
bWx5IG9mIHRoZSBvcGluaW9uIHRoYXQgdXNpbmcgJW8gZm9yIFNCREYgaXMgdGhlIG1vcmUNCj4+
IG5hdHVyYWwgdGhpbmcgdG8gZG8uDQo+Pg0KPj4+IE5vdGhpbmcgYWJvdXQgUENJIGNvb3JkaW5h
dGVzIGhhcyBhbnl0aGluZyB0byBkbyB3aXRoIG9jdGFsDQo+Pj4gcmVwcmVzZW50YXRpb247IGl0
cyBtb3N0bHkgaGV4Lg0KPj4NCj4+IFRoZSBkb21haW4gYW5kIHZDUFUgSURzIGFyZW4jdCBwb2lu
dGVyLWlzaCBlaXRoZXIsIGZvciBleGFtcGxlLg0KPiANCj4gQnV0IHdlIGRvIHBhc3MgdGhlIHZj
cHUgYW5kIHRoZSBkb21haW4gc3RydWN0IHBvaW50ZXIgdG8gdGhvc2UNCj4gbW9kaWZpZXJzPyBp
ZTogd2UgZG9uJ3QgcGFzcyBhIHZjcHUgb3IgYSBkb21haW4gSUQgZGlyZWN0bHkgaW4gZWl0aGVy
DQo+IGNhc2UuDQoNClJpZ2h0LiBNeSBwb2ludCB3YXM6IFRoZSBhY3R1YWwgZm9ybWF0IHNwZWNp
ZmllciB1c2VkICgncCcgb3IgJ28nKQ0KZG9lc24ndCBuZWNlc3NhcmlseSBoYXZlIGFueXRoaW5n
IHRvIGRvIHdpdGggdGhlIHJlc3VsdGluZyBvdXRwdXQuDQoNCj4gQUZBSUNUIGJvdGggeW91IGFu
IEFuZHJldyBhZ3JlZSB0aGF0IGEgY3VzdG9tIHByaW50ZiBmb3JtYXR0ZXIgZm9yIFBDSQ0KPiBT
QkRGIGlzIGEgZGVzaXJhYmxlIHRoaW5nIHRvIGhhdmUsIHRoZSBvbmx5IGRpc2FncmVlbWVudCBp
cyBvbiB0aGUNCj4gYWN0dWFsIGltcGxlbWVudGF0aW9uIGRldGFpbCAod2hldGhlciAlcHAgb3Ig
JW9wIHNob3VsZCBiZSB1c2VkKS4gSW4NCj4gd2hpY2ggY2FzZSBJIHRoaW5rIEkgd291bGQgbGlr
ZSB0byBjYWxsIGZvciBUSEUgUkVTVCB0byBhbHNvIHZvaWNlIGluDQo+IHRoZWlyIG9waW5pb24g
b24gdGhlIG1hdHRlciBpbiBvcmRlciB0byB0cnkgdG8gcmVzb2x2ZSB0aGUgc2l0dWF0aW9uDQo+
IHNvIHRoYXQgSSBjYW4gbWFrZSBwcm9ncmVzcyBvbiB0aGUgc2VyaWVzLCBzb3JyeSBpZiB0aGlz
IGlzIGF3a3dhcmQuDQoNClRoYXQncyBwZXJmZWN0bHkgZmluZSB3aXRoIG1lLiBJZiBhIG1ham9y
aXR5IGFncmVlcyB3aXRoIEFuZHJldywNCnNvIGJlIGl0Lg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
