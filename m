Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F607031D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:07:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpZrh-0007DZ-JN; Mon, 22 Jul 2019 15:04:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpZrf-0007Cb-Dp
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:04:35 +0000
X-Inumbo-ID: fffd4174-ac91-11e9-b233-73b7b2753781
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fffd4174-ac91-11e9-b233-73b7b2753781;
 Mon, 22 Jul 2019 15:04:32 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 15:04:19 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 15:01:09 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 15:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiDX+iUvQLGtJWKQdG8HLAPhZ/t1zVGW9fkmkkiPdfAj8wMyltAY5vp3WoY5p907cWUXrU2meHRKAoww0XvwtbH6pvoLkrf5PuHv6c03XJ6hW3NM6IJkErM3/yXeL78Wn6dGcEUI2lVxFEcumdb28GGbIDWMmydxtngDf5QzW8WmSY9kHc8+JojaL2oq6XBP0O2I1iVGV2T8/DQburycBc71M43PyJSRzu9GJHswwuTlLpLC4aewYjhtx5171NA1UxS1BArHFIKDCYs/1InC0Ynu6JDHnzzRSiK8+Nrt1XNB+8k0q39gsmSpJnGesnwnZJ6Us532CiJ5THAv64TkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K10CfOh0N4SBDnT1u7FVK+3+bB2uy+ZLkyiYtW8GUHU=;
 b=nnt7a5oocTcH481XhoHSQ/NhDmSHxZqTAM7W2He1LKkNcW6aM4tJpinxvNhpb95XgUPw9WRCeqz6l8L7DtfBcnOetaQfW9iUBWL6ZsaMRFHSuUaNUerKL+u8nh0lEQlYvzP622nNORVh+PpSqk621F8+uaZAsNCB3Io1R6/Xj8eDraqnbng8aTFvSsmgkdCTwW4B3P8HPgybL8DNiLonnJu7kyhUd6J5k1RW2s4lvE50TQKzLfjakBmpipcXHqocvrJCgTDpUL9kwbrSolAqfE0cjs2jQNI/IBYemqCpFrr6C/R0Q9SamnRD+ET4bbTodqFh++r/UKz5r4KmbEAiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2732.namprd18.prod.outlook.com (20.179.52.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 15:01:08 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 15:01:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
Thread-Index: AQHVO/TlAPsnkpqPo0+X2y95y9fr6KbSNr9CgARDQ4CAADOwm4AAFvIA
Date: Mon, 22 Jul 2019 15:01:08 +0000
Message-ID: <dc1481ff-4c18-cf0b-cff7-1f2866b6ad40@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
 <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
 <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
 <aeb53abe-af9e-37ba-9f25-90b6b30192fc@citrix.com>
In-Reply-To: <aeb53abe-af9e-37ba-9f25-90b6b30192fc@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0372.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::24) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d106d8a8-2036-4c1a-103d-08d70eb56d3f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2732; 
x-ms-traffictypediagnostic: DM6PR18MB2732:
x-microsoft-antispam-prvs: <DM6PR18MB27327D8125936517F2F2742EB3C40@DM6PR18MB2732.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(66066001)(71190400001)(31686004)(6512007)(54906003)(316002)(68736007)(36756003)(8936002)(71200400001)(6486002)(6436002)(8676002)(64756008)(66446008)(4326008)(5660300002)(99286004)(7736002)(305945005)(66556008)(66476007)(66946007)(11346002)(2906002)(6116002)(256004)(446003)(3846002)(80792005)(76176011)(14444005)(86362001)(6246003)(186003)(2616005)(53936002)(476003)(26005)(6916009)(229853002)(102836004)(14454004)(81156014)(81166006)(25786009)(52116002)(53546011)(478600001)(6506007)(386003)(31696002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2732;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jdSVr4kbL7O3U+YMy3MoHFLGY0KM6ZEj1Tyxjh31ksI03Fbv6HW9mH5KghZ0ugGm74UfTOg8gxo/zXfaIhnbEDPrcTw4mF33efoko6FFJ8nOtJMa+h4tzWXc9B1AJnALiTe/3jW4fzVOHY4B5OZTJ7jOt0EJeJnmoSaXGaxc+4YsOIZ3Cb/KwQt2LzMTKSFDavuvgAmSCLjA/HlK9QGvQLNlnQW1WCy6fWOk7AM30Is7LkozvHH+5oLm1QLx+LX5iHylOn10GVAEjnmKGrUCNNDfNH1CKX0I6586SgljEYSs4/OfsyqrFEkNIfdh1tU9UpLOMRqFR5keJpM4ZVsxH2gR6ZDhFaJIO0896UxKdgxGWZcbRz0tkxYEWSceRldu9Y4CW0fgrdmpcTvbf4ST28aQ2zLxWcuG08udAxzgRFw=
Content-ID: <ED4D6E3F31429D40BAAD07E7CCDB26FC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d106d8a8-2036-4c1a-103d-08d70eb56d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 15:01:08.3381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2732
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
 BrianWoods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjIvMDcvMjAx
OSAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxOS4wNy4yMDE5IDE5OjI3LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE2LzA3LzIwMTkgMTc6MzgsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBAQCAtMTQyLDcgKzE3OCwxNSBAQCBzdGF0aWMgdm9pZCBmcmVlX2ludHJlbWFw
X2VudHJ5KGNvbnN0IHN0DQo+Pj4+ICAgICB7DQo+Pj4+ICAgICAgICAgdW5pb24gaXJ0ZV9wdHIg
ZW50cnkgPSBnZXRfaW50cmVtYXBfZW50cnkoaW9tbXUsIGJkZiwgaW5kZXgpOw0KPj4+PiAgICAg
DQo+Pj4+IC0gICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMzItPnJhd1swXSkgPSAwOw0KPj4+PiAr
ICAgIGlmICggaW9tbXUtPmN0cmwuZ2FfZW4gKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAg
QUNDRVNTX09OQ0UoZW50cnkucHRyMTI4LT5yYXdbMF0pID0gMDsNCj4+Pj4gKyAgICAgICAgLyog
TG93IGhhbGYgKGNvbnRhaW5pbmcgUmVtYXBFbikgbmVlZHMgdG8gYmUgY2xlYXJlZCBmaXJzdC4g
Ki8NCj4+Pj4gKyAgICAgICAgYmFycmllcigpOw0KPj4+IFdoaWxlIHRoaXMgd2lsbCBmdW5jdGlv
biBvbiB4ODYsIEkgc3RpbGwgY29uc2lkZXIgdGhpcyBidWdneS7CoCBGcm9tIGENCj4+PiBjb25j
ZXB0dWFsIHBvaW50IG9mIHZpZXcsIGJhcnJpZXIoKSBpcyBub3QgdGhlIGNvcnJlY3QgY29uc3Ry
dWN0aW9uIHRvDQo+Pj4gdXNlLCB3aGVyZWFzIHNtcF93bWIoKSBpcy4NCj4+IEkgdGhpbmsgaXQn
cyB0aGUgM3JkIHRpbWUgbm93IHRoYXQgSSByZXNwb25kIHNheWluZyB0aGF0IGJhcnJpZXIoKSBp
cw0KPj4gYXMgZ29vZCBvciBhcyBiYWQgYXMgc21wX3dtYigpLCBqdXN0IGZvciBkaWZmZXJlbnQg
cmVhc29ucy4NCj4gDQo+IGJhcnJpZXIoKSBhbmQgc21wX3dtYigpIGFyZSBkaWZmZXJlbnQgY29u
c3RydWN0cywgd2l0aCBzcGVjaWZpYywNCj4gKmRpZmZlcmVudCogbWVhbmluZ3MuwqAgRnJvbSBh
IHByb2dyYW1tZXJzIHBvaW50IG9mIHZpZXcsIHRoZXkgc2hvdWxkIGJlDQo+IGNvbnNpZGVyZWQg
YmxhY2sgYm94ZXMgb2YgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IGJhcnJpZXIoKSBpcyBmb3IgZm9y
Y2luZyB0aGUgY29tcGlsZXIgdG8gbm90IHJlb3JkZXIgdGhpbmdzLg0KPiANCj4gc21wX3dtYigp
IGlzIGFib3V0IHRoZSBleHRlcm5hbCB2aXNpYmlsaXR5IG9mIHdyaXRlcywgYXMgb2JzZXJ2ZWQg
YnkgYQ0KPiBkaWZmZXJlbnQgZW50aXR5IG9uIGEgY29oZXJlbnQgZmFicmljLg0KDQpJJ20gYWZy
YWlkIEkgZGlzYWdyZWUgaGVyZTogVGhlICJzbXAiIGluIGl0cyBuYW1lIG1lYW5zICJDUFUiLCBu
b3QNCiJlbnRpdHkiIGluIHlvdXIgc2VudGVuY2UuIFdoaWNoIGlzIHdoeSAuLi4NCg0KPiBUaGUg
ZmFjdCB0aGV5IGFsaWFzIG9uIHg4NiBpbiBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2YgeDg2
IGNhY2hlDQo+IGNvaGVyZW5jeSAtIGl0IGRvZXMgbm90IG1lYW4gdGhleSBjYW4gbGVnaXRpbWF0
ZWx5IGJlIGFsdGVybmF0ZWQgaW4gY29kZS4NCj4gDQo+IFRoaXMgcGllY2Ugb2YgY29kZSBpcyBh
IDItd2F5IGNvbW11bmljYXRpb24gYmV0d2VlbiB0aGUgQ1BVIGNvcmUgYW5kIHRoZQ0KPiBJT01N
VSwgb3ZlciBhIGNvaGVyZW50IGNhY2hlLsKgIFRoZSBJT01NVSBsb2dpY2FsbHkgaGFzIGFuIHNt
cF9ybWIoKSBpbg0KPiBpdHMgbWlycm9yIGZ1bmN0aW9uYWxpdHkgKGFsdGhvdWdoIHRoYXQgaXMg
bGlrZWx5IG5vdCBob3cgdGhlIHByb3BlcnR5DQo+IGlzIGV4cHJlc3NlZCkuDQo+IA0KPj4gV2hp
bGUgSQ0KPj4gYWdyZWUgd2l0aCB5b3UgdGhhdCBiYXJyaWVyKCkgaXMgY29ycmVjdCBvbiB4ODYg
b25seSwgSSdtIHlldCB0byBoZWFyDQo+PiBiYWNrIGZyb20geW91IG9uIG15IGFyZ3VtZW50IHRo
YXQgc21wX3dtYigpIGlzIGluY29ycmVjdCB3aGVuDQo+PiBjb25zaWRlcmluZyBpdHMgVVAgc2Vt
YW50aWNzICh3aGljaCB3ZSBkb24ndCBjdXJyZW50bHkgaW1wbGVtZW50LCBidXQNCj4+IHdoaWNo
IExpbnV4IGFzIHRoZSBvcmlnaW4gb2YgdGhlIGNvbnN0cnVjdCBjYW4gd2VsbCBiZSB1c2VkIGZv
cg0KPj4gcmVmZXJlbmNlKS4NCj4gDQo+IFVQIHZzIFNNUCBkb2Vzbid0IGFmZmVjdCB3aGljaCBp
cyB0aGUgY29ycmVjdCBjb25zdHJ1Y3QgdG8gdXNlLg0KDQouLi4gSSBkaXNhZ3JlZSB3aXRoIHRo
aXMgcGFydCB0b28uIEV2ZW4gbm93YWRheXMgTGludXggc3RpbGwgaGFzDQoNCiNpZmRlZiBDT05G
SUdfU01QDQpbLi4uXQ0KI2Vsc2UJLyogIUNPTkZJR19TTVAgKi8NCg0KI2lmbmRlZiBzbXBfbWIN
CiNkZWZpbmUgc21wX21iKCkJYmFycmllcigpDQojZW5kaWYNCg0KI2lmbmRlZiBzbXBfcm1iDQoj
ZGVmaW5lIHNtcF9ybWIoKQliYXJyaWVyKCkNCiNlbmRpZg0KDQojaWZuZGVmIHNtcF93bWINCiNk
ZWZpbmUgc21wX3dtYigpCWJhcnJpZXIoKQ0KI2VuZGlmDQoNCmluIGFzbS1nZW5lcmljL2JhcnJp
ZXIuaCwgaS5lLiBpbmRlcGVuZGVudCBvZiBhcmNoaXRlY3R1cmUuIFlldCB0aGUNClNNUCBjb25m
aWcgc2V0dGluZyBpcyBjb25jZXJuZWQgYWJvdXQgQ1BVcyBvbmx5LCBub3QgImVudGl0aWVzIi4N
Cg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
