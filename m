Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755D6B749
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 09:13:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hne5L-0000gB-9W; Wed, 17 Jul 2019 07:10:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hne5J-0000g6-FX
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 07:10:41 +0000
X-Inumbo-ID: f8a48474-a861-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f8a48474-a861-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 07:10:39 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 07:10:35 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 07:09:56 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 07:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkoK6K+x9IApmS8eih32dIrqXsQGCB9IUMRKNLGovqZBQ1k2luOs9RrsYyO0HhGdstDzPWCTt+sXJ/W2voXf+sWgIbs5lFb/UzjzlpbNGfX3z2mpnX0imGdwxnOSJ4WEWnDAkipYQU1oPJzNUud3wdFM6SKSlepzU7srUHYu8EqFs7JGT8swLHyXCzXkjgJEQ5QJd2h9CnOpifOsqTPGxgJxih/TiyLem+WDaCQFsdyoSUocQgYzFIOJR72qp0RSbEqRu5Gy12KWUNh++NBKmpiaCettrGUU5mezJEh266fcozIRz/8c/O5Uv0Rfv/Si1lVkl+QPRdNNazXoJ4JosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTlrE4K7kTVJfMAX5Di3gU2IrMca0jp+2OsedzJl3bI=;
 b=Nt7T8XPCETREInaNUiAFqGAfOaIwH3MvGSBlPm9PKa1eoPzbAiahpoguAy2wvALvOz6LgOXuaqajHXjnPLMo1h2CXDTMzdjYr584E+RYZbl6OwxX8DB03ewB2bOa1FiUrfUVsblJpauAFyVPdy9UPCYmHfQVKhlfngAnWUdGNi9XfRQZHjGwekYi+MZcYtIVvXPki+Gu0rtMujZGOL7IF6DfhppKS3q07QbXAGWjTuUI9kR3/HUCI0iszeTjRWsBgXmGVFOdW0FdrTKv5tEzyiHk+9EtVF5sIv1nqR/FAyK7PKQ0FvGQmbZty8wuOil6pUcNJYwRoyGGeUJANmyJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2522.namprd18.prod.outlook.com (20.179.105.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 07:09:55 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 07:09:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Live-Updating Xen
Thread-Index: AQHVOz84rrbZg3jr7UWo9Co44cwhi6bN7RdMgAB5rAA=
Date: Wed, 17 Jul 2019 07:09:55 +0000
Message-ID: <c9053dcf-7c24-58b5-171a-a410653833f5@suse.com>
References: <1563217075.6815.14.camel@amazon.com>
 <60587685-fbe9-116a-72e8-413eb7e99063@citrix.com>
In-Reply-To: <60587685-fbe9-116a-72e8-413eb7e99063@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:55::27) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99e2a2e1-6be0-4922-b4ea-08d70a85c572
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2522; 
x-ms-traffictypediagnostic: DM6PR18MB2522:
x-microsoft-antispam-prvs: <DM6PR18MB2522CBE1F50142CC7CE49A2CB3C90@DM6PR18MB2522.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(189003)(199004)(76176011)(52116002)(68736007)(386003)(53936002)(71200400001)(81166006)(81156014)(99286004)(6512007)(8936002)(71190400001)(186003)(6506007)(53546011)(26005)(6486002)(316002)(36756003)(6246003)(102836004)(25786009)(478600001)(229853002)(6436002)(256004)(7736002)(64756008)(446003)(476003)(66556008)(31696002)(2616005)(66476007)(4326008)(86362001)(14444005)(486006)(11346002)(54906003)(305945005)(2906002)(66446008)(5660300002)(14454004)(66946007)(66066001)(6916009)(6116002)(3846002)(80792005)(31686004)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2522;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6qWiYeZ6/N9a+REDhZn3ibMhzJx8wcbKlxCeTV0ikKzucx71QTAvVuKgLaFHkZFleZWqNQu8lGlh5ywdLibG5RkCxCNwPv49wnIKj9m5EfCLNZIUnWgT+Cl56dN5oxdXikf6oQcOhZacrzZs7vzBGoK9SvnJfqojFk8wPdGwfZAuqS8YFmD8AIQFdBMq3ObJick2BdXDoiVrpZnsYT1lwJ4G3r9kCADJgWGiAuWPjjxCzUDY3uYwlSodQj2KgMhH7J9MaxYK4c0UQ5HxWfeWbZpjOzuh3ny3ew2Rly1cETasEnWo1z+bMwr6tRujmpGrHpsELDo+PABaiWEKBInbcoV16PPeMUlsVAAWqngQEUnfiF7ADucWkhBMDOf/7FmmSSmWTiKV+1AlUj6d56XL9GTP43vhzqLuMazILl4yXPI=
Content-ID: <B8ADB25B7F27584AAE5F9A7CEDD2A12A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e2a2e1-6be0-4922-b4ea-08d70a85c572
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 07:09:55.6980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2522
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
 Leonard Foerster <foersleo@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAwMTo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTUvMDcvMjAx
OSAxOTo1NywgRm9lcnN0ZXIsIExlb25hcmQgd3JvdGU6DQo+PiAJKiBkb20wbGVzczogYm9vdHN0
cmFwIGRvbWFpbnMgd2l0aG91dCB0aGUgaW52b2x2ZW1lbnQgb2YgZG9tMA0KPj4gCQktPiB0aGlz
IG1pZ2h0IGNvbWUgaW4gaGFuZHkgdG8gYXQgbGVhc3Qgc2V0dXAgYW5kIGNvbnRpbnVlIGRvbTAg
b24gdGFyZ2V0IHhlbg0KPj4gCQktPiBJZiB3ZSBoYXZlIHRoaXMgdGhpcyBtaWdodCBhbHNvIGVu
YWJsZSB1cyB0byBkZS1zZXJpYWxpemUgdGhlIHN0YXRlIGZvcg0KPj4gCQkJb3RoZXIgZ3Vlc3Qt
ZG9tYWlucyBpbiB4ZW4gYW5kIG5vdCBoYXZlIHRvIHdhaXQgZm9yIGRvbTAgdG8gZG8gdGhpcw0K
PiANCj4gUmVjb25zdHJ1Y3Rpb24gb2YgZG9tMCBpcyBzb21ldGhpbmcgd2hpY2ggWGVuIHdpbGwg
ZGVmaW5pdGVseSBuZWVkIHRvDQo+IGRvLsKgIFdpdGggdGhlIG1lbW9yeSBzdGlsbCBpbiBwbGFj
ZSwgaXRzIGp1c3QgYSBmYWlybHkgc21hbGwgb2YgcmVnaXN0ZXINCj4gc3RhdGUgd2hpY2ggbmVl
ZHMgcmVzdG9yaW5nLg0KPiANCj4gVGhhdCBzYWlkLCByZWNvbnN0cnVjdGlvbiBvZiB0aGUgdHlw
ZXJlZnMgd2lsbCBiZSBhbiBpc3N1ZS7CoCBXYWxraW5nDQo+IG92ZXIgYSBmdWxseSBwb3B1bGF0
ZWQgTDQgdHJlZSBjYW4gKGluIHRoZW9yeSkgdGFrZSBtaW51dGVzLCBhbmQgaXRzIG5vdA0KPiBz
YWZlIHRvIGp1c3Qgc3RhcnQgZXhlY3V0aW5nIHdpdGhvdXQgcmVjb25zdHJ1Y3Rpb24uDQo+IA0K
PiBEZXBlbmRpbmcgb24gaG93IGJhZCBpdCBpcyBpbiBwcmFjdGljZSwgb25lIG9wdGlvbiBtaWdo
dCBiZSB0byBkbyBhDQo+IGRlbWFuZCB2YWxpZGF0ZSBvZiAlcmlwIGFuZCAlcnNwLCBhbG9uZyB3
aXRoIGEgaHlicmlkIHNoYWRvdyBtb2RlIHdoaWNoDQo+IHR1cm5zIGZhdWx0cyBpbnRvIHR5cGVy
ZWZzLCB3aGljaCB3b3VsZCBhbGxvdyB0aGUgZ3Jvc3MgY29zdCBvZg0KPiByZXZhbGlkYXRpb24g
dG8gYmUgYW1vcnRpc2VkIHdoaWxlIHRoZSB2Y3B1cyB3ZXJlIGV4ZWN1dGluZy7CoCBXZSB3b3Vs
ZA0KPiBkZWZpbml0ZWx5IHdhbnQgc29tZSBraW5kIG9mIGxvZ2ljIHRvIGFnZ3Jlc3NpdmVseSB0
eXBlcmVmIG91dHN0YW5kaW5nDQo+IHBhZ2V0YWJsZXMgc28gdGhlIHNoYWRvdyBtb2RlIGNvdWxk
IGJlIHR1cm5lZCBvZmYuDQoNCk5laXRoZXIgd2Fsa2luZyB0aGUgcGFnZSB0YWJsZSB0cmVlcyBu
b3IgYW5kIG9uLWRlbWFuZCByZS1jcmVhdGlvbiBjYW4NCnBvc3NpYmx5IHdvcmssIGFzIHBvaW50
ZWQgb3V0IGR1cmluZyAocGFydGx5IGluZm9ybWFsKSBkaXNjdXNzaW9uOiBBdA0KdGhlIHZlcnkg
bGVhc3QgdGhlIGFsbG9jYXRlZCBhbmQgcGlubmVkIHN0YXRlcyBvZiBwYWdlcyBjYW4gb25seSBi
ZQ0KdHJhbnNmZXJyZWQuIEhlbmNlIHdlIHNlZW0gdG8gaGF2ZSBjb21lIHRvIGFncmVlbWVudCB0
aGF0IHN0cnVjdA0KcGFnZV9pbmZvIGluc3RhbmNlcyBoYXZlIHRvIGJlIHRyYW5zZm9ybWVkIChp
biBwbGFjZSBpZiBwb3NzaWJsZSwgaS5lLg0Kd2hlbiB0aGUgc2l6ZXMgbWF0Y2gsIG90aGVyd2lz
ZSBieSBjb3B5aW5nKS4NCj4+IAkJLT4gV2UgbWlnaHQgaGF2ZSB0byBnbyBhbmQgcmUtaW5qZWN0
IGNlcnRhaW4gaW50ZXJydXB0cw0KPiANCj4gV2hhdCBoYXJkd2FyZSBhcmUgeW91IHRhcmdldGlu
ZyBoZXJlP8KgIEl2eUJyaWRnZSBhbmQgbGF0ZXIgaGFzIGEgcG9zdGVkDQo+IGludGVycnVwdCBk
ZXNjcmlwdG9yIHdoaWNoIGNhbiBhY2N1bXVsYXRlIHBlbmRpbmcgaW50ZXJydXB0cyAoYXQgbGVh
c3QNCj4gbWFudWFsbHkpLCBhbmQgbmV3ZXIgdmVyc2lvbnMgKEJyb2Fkd2VsbD8pIGNhbiBhY2N1
bXVsYXRlIGludGVycnVwdHMNCj4gZGlyZWN0bHkgZnJvbSBoYXJkd2FyZS4NCg0KRm9yIEhWTS9Q
VkggcGVyaGFwcyB0aGF0J3MgZ29vZCBlbm91Z2guIFdoYXQgYWJvdXQgUFYgdGhvdWdoPw0KDQo+
PiBBIGtleSBjb3JuZXJzdG9uZSBmb3IgTGl2ZS11cGRhdGUgaXMgZ3Vlc3QgdHJhbnNwYXJlbnQg
bGl2ZSBtaWdyYXRpb24NCj4+IAktPiBUaGlzIG1lYW5zIHdlIGFyZSB1c2luZyBhIHdlbGwgZGVm
aW5lZCBBQkkgZm9yIHNhdmluZy9yZXN0b3JpbmcgZG9tYWluIHN0YXRlDQo+PiAJCS0+IFdlIGRv
IG9ubHkgcmVseSBvbiBkb21haW4gc3RhdGUgYW5kIG5vIGludGVybmFsIHhlbiBzdGF0ZQ0KPiAN
Cj4gQWJzb2x1dGVseS7CoCBPbmUgaXNzdWUgSSBkaXNjdXNzZWQgd2l0aCBEYXZpZCBhIHdoaWxl
IGFnbyBpcyB0aGF0IGV2ZW4NCj4gYWNyb3NzIGFuIHVwZ3JhZGUgb2YgWGVuLCB0aGUgZm9ybWF0
IG9mIHRoZSBFUFQvTlBUIHBhZ2V0YWJsZXMgbWlnaHQNCj4gY2hhbmdlLCBhdCBsZWFzdCBpbiB0
ZXJtcyBvZiB0aGUgbGF5b3V0IG9mIHNvZnR3YXJlIGJpdHMuwqAgKEVzcGVjaWFsbHkNCj4gZm9y
IEVQVCB3aGVyZSB3ZSBzbG93bHkgbG9zZSBzb2Z0d2FyZSBiaXRzIHRvIG5ldyBoYXJkd2FyZSBm
ZWF0dXJlcyB3ZQ0KPiB3aXNoIHRvIHVzZS4pDQoNClJpZ2h0LCBhbmQgdGhlcmVmb3JlIGEgc2lt
aWxhciB0cmFuc2Zvcm1hdGlvbiBsaWtlIGZvciBzdHJ1Y3QgcGFnZV9pbmZvDQptYXkgYmUgdW5h
dm9pZGFibGUgaGVyZSB0b28uDQoNClJlLXVzaW5nIGxhcmdlIGRhdGEgc3RydWN0dXJlcyAob3Ig
YXJyYXlzIHRoZXJlb2YpIG1heSBhbHNvIHR1cm4gb3V0DQp1c2VmdWwgaW4gdGVybXMgb2YgbGF0
ZW5jeSB1bnRpbCB0aGUgbmV3IFhlbiBhY3R1YWxseSBiZWNvbWVzIHJlYWR5IHRvDQpyZXN1bWUu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
