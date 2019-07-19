Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D901C6E6F6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:56:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTKQ-0005Hj-6H; Fri, 19 Jul 2019 13:53:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoTKO-0005Hb-AX
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:53:40 +0000
X-Inumbo-ID: 9b119fdf-aa2c-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b119fdf-aa2c-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:53:38 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 13:53:32 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 13:53:20 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 13:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSEiM6T1hic/JfyAtECfyEBlUkOs+gERJ04POrgQrFHGgw2pH43Du2aoLfdYV8xD/1QeHJjThsUi0f6W/5mXGNSrStXrIUj9mDRUS4Xz7iTjQWeZbDRJcF4ZslYevoCGEopRFEKS4nBs2U8G7GJF/+oUoPRwnqjG5rKYK5G0uzmbkGj5jr6dYovqQXfV5uvcD0SN+8xv6RWE2pOQ7bt0COUtRPCWXLYxjG+jEzxOipWvoCWcApYS/tspckxnnWWxNjZkzSTNAOaM4JHTVEJgittIBeGQ7pjn/WGQXeF0NXRBisrOBWTFloAowXgfrL3d4ILo9WyNf99bNKymjUlNJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7dY0iwJbNTbJyaNNiWotRfnIz1gPooYon8sfa3Pt2M=;
 b=VrWBlqos8AvfS+4Djqvrb9IcYj/IlgW0+joxUvORxCJcf3aV8Cl9EmguDppVmOt/qvXl84X+FH2X+BaFBQW1ARG39mIyDXZEgZ6zxdNpuvF4RdYZcIhRbMRVz2qKCSos6sCyEsG8ili6u0M4Fa0bJ+gPww3wzCL+s96646ovJwVmt2TK519ChAzTfRSfnOF2aIzTkNWBni9/E82yYIY3vF0r1x3OJwCbSssY2Pgi5Y2cBRp4rIkhxl1McFzygcA7rGlijxRIHL1jF1cVemIIbcI6iDf6DZPons+iBkcvX4VdWrkQQmsoz3JBDFS2PnvOCBKQ7VK0LP8s6I4uhUZHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2731.namprd18.prod.outlook.com (20.179.52.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 13:53:19 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:53:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: Xen backports
Thread-Index: AQHVO9HjbKERKAK8KESn0Dh8RZ+rnabR+vwA
Date: Fri, 19 Jul 2019 13:53:19 +0000
Message-ID: <aefbb38a-430e-e712-e17e-40d6946de5cc@suse.com>
References: <3f24285c-b984-1dc5-7783-a1604a966bd0@citrix.com>
In-Reply-To: <3f24285c-b984-1dc5-7783-a1604a966bd0@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::16) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4bf5111-c8be-4d0b-6261-08d70c5074c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2731; 
x-ms-traffictypediagnostic: DM6PR18MB2731:
x-microsoft-antispam-prvs: <DM6PR18MB2731C9EFD453E8748AE29503B3CB0@DM6PR18MB2731.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(199004)(189003)(51444003)(14454004)(229853002)(14444005)(256004)(66476007)(66556008)(64756008)(66446008)(7736002)(66946007)(99286004)(486006)(3480700005)(71190400001)(71200400001)(31696002)(316002)(86362001)(221733001)(5660300002)(6916009)(66066001)(6436002)(26005)(7116003)(25786009)(186003)(102836004)(478600001)(76176011)(52116002)(4326008)(68736007)(3846002)(2906002)(36756003)(53546011)(6506007)(386003)(53936002)(6512007)(305945005)(6116002)(8936002)(446003)(8676002)(81166006)(81156014)(11346002)(2616005)(476003)(31686004)(6486002)(80792005)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2731;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o5JZVGKttLM1CLID+aj+wydhQT63kvCI7pFumWG1XDSkf/HxPfXvomkbTPML5V0cVusWOkrzXMI3uMOKVIIxRru2c/1MyFADiL8hmmqaENpnI0YMZWHz05fxYx/R68Bzhc/6ZkgojRYWW/1rszzjpT8UPOU45LRBOSpH1hiXjcH38XI5iSKBYkciHyorRAw0xVXsAEDChabwhWnL4KYYKIh62TdL25e7+H35CoX0LbiLPKS+155Q9L6ykm4EkqzuqLpbDCITU9LsQ+h4WpBBiWfxlxosi4P03EeybvmdTuLv7gmJ6MZ0YnNaPlVcFPUMP1A/tIvh4GfciDgAveM3rsgjvg1DFs5FhAvS0MO1c3h7GkuVjlP0JeFwip0nQf6Z5Rg6JGPOESNO64h3I065ztjn3mIsyjOYxbzz3v6ruyo=
Content-ID: <4224788CBC3AF44EBB20DBF73E98CE33@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bf5111-c8be-4d0b-6261-08d70c5074c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:53:19.3549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2731
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Xen backports
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNDoyNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gQnVnZml4ZXM6DQo+
IA0KPiA2NWMxNjVkNjU5NWYgLSB4ODYveHN0YXRlOiBEb24ndCBzcGVjaWFsIGNhc2UgZmVhdHVy
ZSBjb2xsZWN0aW9uDQo+IDAxMzg5NmNiOGIyZiAtIHg4Ni9tc3I6IEZpeCBoYW5kbGluZyBvZg0K
PiBNU1JfQU1EX1BBVENITEVWRUwvTVNSX0lBMzJfVUNPREVfUkVWDQo+IDdkMTYxZjY1Mzc1NSAt
IHg4Ni9zdm06IEZpeCBzdm1fdm1jYl9kdW1wKCkgd2hlbiB1c2VkIGluIGN1cnJlbnQgY29udGV4
dA0KPiA5Yjc1N2JkYzE3OTQgLSB4ODYvYm9vdDogRG9uJ3QgbGVhayB0aGUgbW9kdWxlX21hcCBh
bGxvY2F0aW9uIGluDQo+IF9fc3RhcnRfeGVuKCkNCj4gDQo+IFRoZSBiYWNrcG9ydCBmb3IgdGhl
IG1pY3JvY29kZSBNU1IgaXMgcmF0aGVyIHRyaWNreSB0byByZWJhc2Ugb3ZlciB0aGUNCj4geDg2
X3ZlbmRvciBiaXRtYXAgY2hhbmdlcy7CoCBJJ3ZlIGFscmVhZHkgZ290IGl0IGxvY2FsbHkuDQoN
Ck5vdCBvdmVybHkgdHJpY2t5IEkgd291bGQgc2F5LCBidXQgcmVxdWlyaW5nIGF0dGVudGlvbi4g
V2hpbGUgZG9pbmcNCnRoaXMgSSd2ZSBydW4gaW50byB0d28gcXVlc3Rpb25zOg0KDQoxKSBXYXMg
aXQgcmVhbGx5IGEgZ29vZCBpZGVhIHRvIHJlbW92ZSB0aGUgd3JpdGUgdG8gdGhlIE1TUiBhbmQg
dGhlDQpDUFVJRCBpbnZvY2F0aW9uIGZyb20gdGhlIHJlYWQgcGF0aD8gVGhlIGNvbW1lbnQgc2F5
cyAnQSBndWVzdCBtaWdodA0KaXRzZWxmIHBlcmZvcm0gdGhlICJ3cml0ZSAwLCBDUFVJRCwgcmVh
ZCIgc2VxdWVuY2UnLCBidXQgdGhhdCB3b24ndA0KaGVscCBhdCBhbGwgaWYgdGhlIHNwZWNpZmlj
IHZDUFUgZ2V0cyByZS1zY2hlZHVsZWQgaW4gdGhlIG1pZGRsZS4gQW5kDQp0aGVyZSBtYXkgbm90
IGhhdmUgYmVlbiBhbnkgdWNvZGUgbG9hZCB3ZSd2ZSBkb25lLCB3aGljaCB3ZSBjb3VsZA0KdGhl
biBndWFyYW50ZWUgd2FzIGZvbGxvd2VkIGJ5IGEgQ1BVSUQgaW52b2NhdGlvbi4NCg0KMikgV2Ug
c3RpbGwgaGF2ZW4ndCBnb3QgY29uZmlybWF0aW9uIHRoYXQgSHlnb24gYmVoYXZlcyB0aGUgc2Ft
ZSB1Y29kZS0NCndpc2UsIGhhdmUgd2U/DQoNCj4gRW5oYW5jZW1lbnRzOg0KPiANCj4gNzg3NjE5
YTA2NDBlIC0gdG9vbHM6IHJlLXN5bmMgQ1BVSUQgbGVhZiA3IHRhYmxlcyAocGVyaGFwcyBvbmx5
IHRoZQ0KPiB4ZW4tY3B1aWQgYml0cy4pDQo+IDI2MGFjYzUyMWRiNCAtIHg4Ni9jbGVhcl9wYWdl
OiBVcGRhdGUgY2xlYXJfcGFnZV9zc2UyKCkgYWZ0ZXIgZHJvcHBpbmcNCj4gMzJiaXQgWGVuDQo+
IDU2NGQyNjE2ODdjMCAtIHg4Ni9jdHh0LXN3aXRjaDogRG9jdW1lbnQgYW5kIGltcHJvdmUgR0RU
IGhhbmRsaW5nDQoNClRoZSBsYXN0IG9uZSBkb2Vzbid0IGV2ZW4gY29tZSBjbG9zZSB0byBhcHBs
eWluZywgZHVlIHRvIGl0cyBkZXBlbmRlbmN5DQpvbiAxMmRjZTdlYTVhLiBXaGlsZSBJIHRoaW5r
IHRoYXQncyBhIGxpdHRsZSB0b28gbXVjaCwgSSd2ZSBzdGlsbA0KZGVjaWRlZCB0byBwdWxsIGlu
IGJvdGggKGJ1dCBmb3Igbm93IEknbGwgcGVyaGFwcyBkbyB0aGlzIG9ubHkgZm9yIDQuMTIpDQpp
biBhbnRpY2lwYXRpb24gb2YgdXMgd2FudGluZyB0byBhdCBsZWFzdCBjb25zaWRlciBhIGJhY2tw
b3J0IG9mIHRoZQ0KY29yZSBzY2hlZHVsaW5nIHNlcmllcyAoYXNzdW1pbmcgaXQgd29uJ3QgdGFr
ZSB0b28gbG9uZyB0byBnZXQgZnVsbHkNCnJlYWR5KS4NCg0KPiBBbHRwMm06IFdoaWxlIGFsdHAy
bSBpc24ndCBzdXBwb3J0ZWQgeWV0LCBpdCB3b3VsZCBiZSB2ZXJ5IGhlbHBmdWwgdG8NCj4gdHdv
IGRvd25zdHJlYW1zIHRvIHRha2UgdGhlc2UgZml4ZXMgd2hpbGUgd2Ugd29yayBvbiBnZXR0aW5n
IGl0IGZ1bGx5DQo+IHN1cHBvcnRlZC4NCj4gDQo+IDQ0ZjNjM2NkZDMxNSAtIHg4Ni9hbHRwMm06
IHRyZWF0IHZpZXcgMCBhcyB0aGUgaG9zdHAybSBpbg0KPiBwMm1fZ2V0X21lbV9hY2Nlc3MoKQ0K
PiA4MjI4NTc3YWQxYmEgLSB4ODYvaHZtOiBGaXggYWx0cDJtX29wIGh5cGVyY2FsbCBjb250aW51
YXRpb25zDQo+IDlhYmNhYzdmZjE0NSAtIHg4Ni9hbHRwMm06IGNsZWFudXAgcDJtX2FsdHAybV9s
YXp5X2NvcHkNCj4gZGY0ZTRjYWZkMjhkIC0geDg2L2FsdHAybTogRml4IHN0eWxlIGVycm9ycyBp
bnRyb2R1Y2VkIHdpdGggYy9zIDlhYmNhYzdmZg0KDQpJJ2xsIGFwcGx5IGFsbCBvZiB0aGVzZSBz
b29uLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
