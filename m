Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376C7BC46
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hskKN-0006ZY-Vb; Wed, 31 Jul 2019 08:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hskKM-0006ZS-Ep
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:51:18 +0000
X-Inumbo-ID: 5358a644-b370-11e9-9f2f-2f1906f9aeaa
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5358a644-b370-11e9-9f2f-2f1906f9aeaa;
 Wed, 31 Jul 2019 08:51:13 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 08:51:04 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 08:41:41 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 08:41:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+RVUuBT/un5YZZI1yGhPnM6tq9QA6OP+6VZreAHI5puf9m2e2tT1k3KLTWElgZJABTqqAMlX1e7fkLLsCo9CISZlsd8tjrREOHAYGRUUHxTI5ptPzbGLTC3H19aBlqqJcQHfDm6PW3eVIaYvfD+yDtJCJOAg/VeVtQ3YbxrdYHcoDhvuTjlVeztk7rRFdT7BUXEylHgjx4sYO5vXufdh1A/jU0252KH+z7MEZZYZhpCD5TBeXdWhVyn4SbruvQrbnj/6FwSEWGyAvBLK20CcFwKn0J3zfizYInIyA1SX//mpDcAIF33oW8WwsvHjeiCoU/psxha75+smVUF22QzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9r5hv3oq5EGndxVw81OYwPsr5Vao1x5xiBMEIjXA6g=;
 b=EeqeCCu07Y9UhSYpLjaFNBpZtHAYB9zHpjImh/C66HA/OXji4Kx2593Ld2CwVPrR3rRz9ZEwjKbmXkFBSmVibuOmIJJf9BZ5OF2O8SKoFSVQuHB6sISgU/L+wTjPTJISxC4j4ltlMa+iB4u2exsuAoh2zPhi6JaRN7BRaJWMtcc0AilXKbxGdfMo/MyXrKfJuP6zYP6T4YkM+i3a1ndyzl9lYrQ5FlSOexQ4iyQJh02pD6aWisVlCgBG1qPUCsKMnCGs2ynZgmoKO0aCIAf8oejKqvIL+JNICACgVm0Spc95PyYMvNrC6EmyLaUJ3gWfsCppET4L1pJOh+WUiqfvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2633.namprd18.prod.outlook.com (20.179.106.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 08:41:39 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 08:41:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 08/10] xen/nodemask: Introduce unlocked
 __nodemask_{set,clear}() helpers
Thread-Index: AQHVRgbw7C6GvWJsh0yxbCWlYQa9EqbjBzYAgABqvmOAAPmDgA==
Date: Wed, 31 Jul 2019 08:41:39 +0000
Message-ID: <5cac09b6-1430-d5b9-a706-4c44fd437b12@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-9-andrew.cooper3@citrix.com>
 <7528b666-d5d8-9457-9be2-59ccc13797ab@suse.com>
 <9ebd7f61-5360-6c6d-23a3-208f5faa76cf@citrix.com>
In-Reply-To: <9ebd7f61-5360-6c6d-23a3-208f5faa76cf@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::30)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4962cee8-65c7-4635-cbd6-08d71592e7c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2633; 
x-ms-traffictypediagnostic: DM6PR18MB2633:
x-microsoft-antispam-prvs: <DM6PR18MB263359B633FF3BC2F8678D7FB3DF0@DM6PR18MB2633.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(199004)(189003)(6512007)(36756003)(446003)(6486002)(305945005)(486006)(6436002)(68736007)(476003)(7736002)(80792005)(11346002)(6916009)(31686004)(2616005)(316002)(229853002)(2906002)(54906003)(31696002)(8936002)(86362001)(186003)(71190400001)(52116002)(76176011)(71200400001)(99286004)(66066001)(66946007)(26005)(14454004)(102836004)(66556008)(64756008)(66446008)(66476007)(478600001)(6506007)(53546011)(386003)(53936002)(81156014)(256004)(8676002)(81166006)(14444005)(6116002)(4326008)(25786009)(6246003)(5660300002)(3846002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2633;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vimSAKqfvlcHyoLLHrja/OwvaL0T391GxdE4ytQxZHvbWjJvqI0vk/hC0kYdtfSS3TS1/xD65lX1C8nxZkv/eAq4LSJltQd7Fz/OkTfEP1Bpkeow3Lo1pXdqZV7NXYNCy80HGcqeT7/x97c+6ss84k4b6+WLsL031ll+WqDMWGshWIeR78IqMyJWZSXE2dyve53m+s/B6DnQTZCj8wNqrZ6PV+qV2AxL5xJaC/TyMBeAW7QSCAJEF0/3jkkKXL7ZpUq79jjqh/s/lnsshxaWDPRgT/3F8tEk4MuUTBR2li8OkZDoNtAK6+fibLJcl85VcnP8avpOjTpoq7S79fhY31F+ZCIXOxHY9L+H+neX+ytXeg9ev7wolLJvSG+Zn6ILN49whQgk50mbj6lNNMXc/RbU/3wKINRf+u4B+R9dMYo=
Content-ID: <EB8088BC694B1E44AB3F92754610B60D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4962cee8-65c7-4635-cbd6-08d71592e7c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 08:41:39.5147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2633
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 08/10] xen/nodemask: Introduce unlocked
 __nodemask_{set, clear}() helpers
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxOTo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzAvMDcvMjAx
OSAxMjoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOS4wNy4yMDE5IDE0OjEyLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oDQo+
Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmgNCj4+PiBAQCAtMTEsNyArMTEsOSBA
QA0KPj4+ICAgICogVGhlIGF2YWlsYWJsZSBub2RlbWFzayBvcGVyYXRpb25zIGFyZToNCj4+PiAg
ICAqDQo+Pj4gICAgKiB2b2lkIG5vZGVfc2V0KG5vZGUsIG1hc2spCQl0dXJuIG9uIGJpdCAnbm9k
ZScgaW4gbWFzaw0KPj4+ICsgKiB2b2lkIF9fbm9kZW1hc2tfc2V0KG5vZGUsIG1hc2spCXR1cm4g
b24gYml0ICdub2RlJyBpbiBtYXNrICh1bmxvY2tlZCkNCj4+PiAgICAqIHZvaWQgbm9kZV9jbGVh
cihub2RlLCBtYXNrKQkJdHVybiBvZmYgYml0ICdub2RlJyBpbiBtYXNrDQo+Pj4gKyAqIHZvaWQg
X19ub2RlbWFza19jbGVhcihub2RlLCBtYXNrKQl0dXJuIG9mZiBiaXQgJ25vZGUnIGluIG1hc2sg
KHVubG9ja2VkKQ0KPj4gVG8gYmUgaG9uZXN0IEknbSB1bmhhcHB5IHRvIHNlZSB5b3UgaW50cm9k
dWNlIG5ldyBuYW1lIHNwYWNlDQo+PiB2aW9sYXRpb25zLiBJIHJlYWxpemUgeW91IHdhbnQgdG8g
aGF2ZSB0aGUgbm9kZSBtYXNrIGludGVyZmFjZXMNCj4+IG1hdGNoIHRoZSBDUFUgbWFzayBvbmUg
YXMgY2xvc2VseSBhcyBwb3NzaWJsZSwgYnV0IEkgdGhpbmsgd2UNCj4+IHNob3VsZCBkaXZlcmdl
IGhlcmUgKGFuZCBldmVudHVhbGx5IG1ha2UgdGhlIENQVSBtYXNrIG9uZXMNCj4+IGZvbGxvdyB3
aGF0ZXZlciByb3V0ZSB3ZSBnbyBoZXJlKS4gQXMgdG8gbmFtaW5nLCBzaW5jZSB0aGVzZQ0KPj4g
YXJlIHN0YXRpYyBpbmxpbmVzLCBhIHNpbmdsZSBsZWFkaW5nIHVuZGVyc2NvcmUgbWF5IGJlIGFu
DQo+PiBvcHRpb24gKGFsYmVpdCBJJ2QgcHJlZmVyIHRvIGF2b2lkIHRoaXMpLiBBbm90aGVyIG9w
dGlvbiB3b3VsZA0KPj4gYmUgdG8gaGF2ZSBkb3VibGUgaW5maXggdW5kZXJzY29yZXMgKG5vZGVt
YXNrX19zZXQoKSkuIFlldA0KPj4gYW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8gZXhwcmVzcyB0
aGUgbm9uLWF0b21pY2l0eSBpbiBhDQo+PiB2ZXJiYWwgd2F5IHJhdGhlciB0aGFuIGJ5IHRoZSBu
dW1iZXIgb2YgdW5kZXJzY29yZXMgdXNlZC4gSSdtDQo+PiBhZnJhaWQgSSBkb24ndCBoYXZlIGEg
Z29vZCBuYW1pbmcgc3VnZ2VzdGlvbiBpbiB0aGF0IGNhc2UsDQo+PiB0aG91Z2guDQo+IA0KPiBJ
J20gcmVhbGx5IG5vdCBhcyBjb25jZXJuZWQgd2l0aCBuYW1lc3BhY2UgdmlvbGF0aW9ucyBhcyB5
b3Ugc2VlbSB0bw0KPiBiZS7CoCBXZSBhcmUgbm90IGEgbGlicmFyeSBoYXZpbmcgdG8gY29vcGVy
YXRlIHdpdGggYXJiaXRyYXJ5IG90aGVycyAtIHdlDQo+IGFyZSBhIGZyZWVzdGFuZGluZyBidWls
ZCB3aXRoIHRoZSBjb21waWxlciBiZWluZyB0aGUgb25seSBvdGhlciBzb3VyY2UNCj4gb2Ygc3lt
Ym9scyBpbiB0aGUgbmFtZXNwYWNlLsKgIE91ciBjaGFuY2VzIG9mIGNvbGxpZGluZyBhcmUgdmVy
eSBsb3cgdG8NCj4gYmVnaW4gd2l0aCwgYW5kIGZpeGluZyBjb25mbGljdHMgaWYgdGhleSBhcmlz
ZSBpcyB0cml2aWFsLg0KDQpUcml2aWFsIG9yIG5vdCwgc3VjaCBjb25mbGljdHMgYXJlIHByb2Js
ZW1hdGljIGZvciBicmFuY2hlcyBpbg0Kc2VjdXJpdHkgb25seSBtYWludGVuYW5jZSBtb2RlLiBX
aGlsZSB3ZSBfY2FuXyBiYWNrcG9ydCBzdWNoDQpwYXRjaGVzIHRoZXJlLCB3ZSByZWFsbHkgX3No
b3VsZG4ndF8uDQoNCj4gQXMgeW91IG5vdGUsIHRoZXJlIGlzIG5vdGhpbmcgb2J2aW91cyBhcyBh
biBhbHRlcm5hdGl2ZS7CoCBUaGUgZG91YmxlDQo+IGluZml4IGlzIGEgbm8tZ28gYXMgZmFyIGFz
IEknbSBjb25jZXJuZWQgLSBpdCdzIGZhciB0b28gc3VidGxlIGluIHRoZSBjb2RlLg0KDQpXZWxs
LCB0aGUgc2luZ2xlLXVuZGVyc2NvcmUtcHJlZml4IHZhcmlhbnQgaXMgYXQgbGVhc3QgYmV0dGVy
DQp0aGFuIHRoZSBkb3VibGUgb25lLCBldmVuIGlmIHN0aWxsIG5vdCBpZGVhbC4gSSdkIHByZWZl
ciBpZg0KeW91IHN3aXRjaGVkLCBidXQgSSBkb24ndCBtZWFuIHRvIHN0YW5kIGluIHRoZSB3YXkg
b2YgdGhpcw0KZ29pbmcgaW4sIHNvDQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KZXZlbiBpbiBpdHMgY3VycmVudCBzaGFwZS4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
