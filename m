Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FC60639
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 14:59:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjNke-00017V-BM; Fri, 05 Jul 2019 12:55:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjNkc-00017Q-LW
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 12:55:42 +0000
X-Inumbo-ID: 27dac82e-9f24-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27dac82e-9f24-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 12:55:41 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 12:55:20 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 12:54:03 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 12:54:03 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3412.namprd18.prod.outlook.com (10.255.136.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Fri, 5 Jul 2019 12:54:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 12:54:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 1/2] xmalloc: remove struct xmem_pool init_region
Thread-Index: AQHVMxBz28IggZ2JQEOAds0i1oN8iaa7zhSAgAAiFICAAAshgA==
Date: Fri, 5 Jul 2019 12:54:02 +0000
Message-ID: <89ddd2fd-45e6-190e-8873-48270ddc69f7@suse.com>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
 <20190705090249.1935-2-paul.durrant@citrix.com>
 <3f8e7d14-e0b7-6d4b-6fd4-aabffc644257@suse.com>
 <c25c88d8a3ea43cc8d232a52494233c6@AMSPEX02CL03.citrite.net>
In-Reply-To: <c25c88d8a3ea43cc8d232a52494233c6@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::16)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a77f15da-5baa-4a95-dd53-08d70147dad2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3412; 
x-ms-traffictypediagnostic: BY5PR18MB3412:
x-microsoft-antispam-prvs: <BY5PR18MB3412EC4C6A3F794011251C48B3F50@BY5PR18MB3412.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(6436002)(11346002)(446003)(8676002)(2616005)(102836004)(476003)(386003)(6506007)(53546011)(66446008)(26005)(66556008)(73956011)(66946007)(486006)(186003)(72206003)(53936002)(64756008)(66476007)(86362001)(478600001)(76176011)(5660300002)(31696002)(68736007)(7416002)(6512007)(54906003)(316002)(6916009)(52116002)(2906002)(25786009)(36756003)(31686004)(6246003)(71190400001)(71200400001)(99286004)(305945005)(4326008)(229853002)(81166006)(81156014)(3846002)(7736002)(66066001)(6116002)(6486002)(80792005)(256004)(8936002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3412;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1uyf+52enBPaD/wsH+iYiTugzqlifEFknsEwxjnQTNxdKkm/POfCp78xSPLrHN8K2hUO6VPuro5s/mNBZAgvxDMRajWRdsdMN76qCSpuySsBgiRBllhzKtUxNkJ5Exyx5nJR+Y6ntWAIHB1N7i3X6rSuYHtx6uUJWAVNgwBouPv1ZmYCy+hneBHuiSxdAWCLOSihWkkOyOi0phE4sHXrOICuSQH5BkYy34BprpIVE7TOOSYOWFXh9aWnR5mjopvWSkPy0CyIixPEzVAUSTfz9n4U3gYzzMWFoGSEdG9DSAnY+J/NnxslbQXar2ByTd51clhQA1X3OB709w5NCOXl7rRkYQZUGm9r/uQp1d8GQGBNUlZdC6akSeZS0VzQLBfPeGHY0OBY9X91VOyikSHiqf2wW2laK7rnt26mZgdHwqg=
Content-ID: <7BCDBBD9AFE8084491E8155CC0CAE18A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a77f15da-5baa-4a95-dd53-08d70147dad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 12:54:02.3581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3412
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/2] xmalloc: remove struct xmem_pool
 init_region
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMjAxOSAxNDoxOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMDUgSnVseSAyMDE5IDEzOjEyDQo+
Pg0KPj4gT24gMDUuMDcuMjAxOSAxMTowMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+IEBAIC0z
NTIsMTMgKzM0Myw2IEBAIHZvaWQgeG1lbV9wb29sX2Rlc3Ryb3koc3RydWN0IHhtZW1fcG9vbCAq
cG9vbCkNCj4+PiAgICAgICAgaWYgKCBwb29sID09IE5VTEwgKQ0KPj4+ICAgICAgICAgICAgcmV0
dXJuOw0KPj4+DQo+Pj4gLSAgICAvKiBVc2VyIGlzIGRlc3Ryb3lpbmcgd2l0aG91dCBldmVyIGFs
bG9jYXRpbmcgZnJvbSB0aGlzIHBvb2wgKi8NCj4+PiAtICAgIGlmICggeG1lbV9wb29sX2dldF91
c2VkX3NpemUocG9vbCkgPT0gQkhEUl9PVkVSSEVBRCApDQo+Pj4gLSAgICB7DQo+Pj4gLSAgICAg
ICAgQVNTRVJUKCFwb29sLT5pbml0X3JlZ2lvbik7DQo+Pj4gLSAgICAgICAgcG9vbC0+dXNlZF9z
aXplIC09IEJIRFJfT1ZFUkhFQUQ7DQo+Pj4gLSAgICB9DQo+Pg0KPj4gSSBjYW4gc2VlIHRoYXQg
dGhlIEFTU0VSVCgpIGNhbiAoYW5kIG5lZWRzIHRvKSBnbyBhd2F5LiBCdXQgSQ0KPj4gZG9uJ3Qg
dGhpbmsgeW91J3ZlIGNoYW5nZWQgYW55dGhpbmcgZWxzZXdoZXJlIHRoYXQgd291bGQgYWxzbw0K
Pj4gYWxsb3cgdGhlIGVudGlyZSBpZigpIHRvIGdvIGF3YXkuDQo+IA0KPiBJIHRoaW5rIHNvLiBB
RkFJQ1QgdGhlIHNpemUgY2hlY2sgYWdhaW5zdCBCSERSX09WRVJIRUFEIGlzIGVudGlyZWx5DQo+
IHRvIGF2b2lkIHJlcG9ydGluZyBwcmVzZW5jZSBvZiB0aGUgaW5pdF9yZWdpb24gYXMgYSBsZWFr
LiBJLmUuIGluDQo+IHRoZSBwcmVzZW5jZSBvZiBhbiBpbml0X3JlZ2lvbiwgdGhlIHVzZWRfc2l6
ZSB3b3VsZCBuZXZlciBkcm9wDQo+IGJlbG93IEJIRFJfT1ZFUkhFQUQuIFdpdGhvdXQgYW4gaW5p
dF9yZWdpb24sIHVzZWRfc2l6ZSBzaG91bGQgZHJvcA0KPiBhbGwgdGhlIHdheSAoYmFjaykgdG8g
MCB3aGVuIHRoZSBsYXN0IHhmcmVlKCkgaXMgZG9uZS4NCg0KQnV0IHRoZSBvbGQgY29kZSBhc3Nl
cnRlZCB0aGF0IHRoZXJlIHdhcyBfbm9fIGluaXQgcmVnaW9uLCBhbmQgdGhlbg0KcmVkdWNlZCBw
b29sLT51c2VkX3NpemUuIEFuZCB0aGUgc3RhdGUgb2YgdGhlIHBvb2wgd2hlbiB0aGVyZSBpcyBu
bw0KaW5pdCByZWdpb24gZG9lc24ndCBjaGFuZ2Ugd2l0aCB5b3VyIHBhdGNoLiBJZiBhbnl0aGlu
ZyB0aGlzIGlmKCkNCndhcyBib2d1cyBhbHRvZ2V0aGVyLCB3aGljaCBJIHRoaW5rIHdhcyB0aGUg
Y2FzZSBub3cgdGhhdCBJJ3ZlDQpsb29rZWQgbW9yZSBjbG9zZWx5IGF0IGhvdyAvIHdoZW4gLT51
c2VkX3NpemUgZ2V0cyB1cGRhdGVkLiBJIHdvdWxkDQpoYXZlIHdhbnRlZCB0byBjaGVjayB0aGUg
b3JpZ2luYWwgY29kZSAod2hpY2ggb3VycyB3YXMgY2xvbmVkIGZyb20pDQp0byBzZWUgd2hldGhl
ciB0aGV5J3ZlIGNoYW5nZWQgdGhpcyBwaWVjZSBhdCBzb21lIHRpbWUsIGJ1dCB0aGUgc2l0ZQ0K
ZG9lc24ndCBzZWVtIHRvIGJlIHByb3Blcmx5IHdvcmtpbmcgKGFueW1vcmUpLg0KDQpEbyB5b3Ug
YWdyZWUgdGhhdCAtPnVzZWRfc2l6ZSBjb3VsZCBlcXVhbCBCSERSX09WRVJIRUFEIG9ubHkgd2hl
bg0KdGhlcmUncyBleGFjdGx5IG9uZSByZWdpb24sIGFuZCB3aGVuIHRoYXQgb25lIHJlZ2lvbiBo
YXMgbm8NCm91dHN0YW5kaW5nIGFsbG9jYXRpb25zPyBTZWVpbmcgdGhlIHJlZ2lvbiByZW1vdmFs
IGluDQp4bWVtX3Bvb2xfZnJlZSgpIEkgYWxzbyBjYW4ndCBzZWVtIHRvIHNlZSBob3cgdGhlIGlu
aXQgcmVnaW9uDQp3b3VsZCBoYXZlIGJlZW4gZXhjbHVkZWQgZnJvbSBnZXR0aW5nIGZyZWVkIGhl
cmUsIGF0IHdoaWNoIHBvaW50DQphc3NlcnRpbmcgd2hldGhlciB0aGVyZSBpcyAoZXZlciB3YXMp
IG9uZSBsb29rcyBldmVuIG1vcmUgZmlzaHkuDQoNCkFjdHVhbGx5IHRoZXJlJ3MgYSBwZXJoYXBz
IHRlbGxpbmcgY29tbWVudCBpbiB4bWVtX3Bvb2xfY3JlYXRlKCk6DQoNCiAgICAgLyogYWx3YXlz
IG9idGFpbiBpbml0X3JlZ2lvbiBsYXppbHkgbm93IHRvIGVuc3VyZSBpdCBpcyBnZXRfbWVtJ2QN
CiAgICAgICogaW4gdGhlIHNhbWUgImNvbnRleHQiIGFzIGFsbCBvdGhlciByZWdpb25zICovDQoN
ClRoaXMgc3VnZ2VzdHMgdG8gbWUgdGhhdCBvcmlnaW5hbGx5IHRoZSBpbml0IHJlZ2lvbiB3YXMg
c2V0IHVwIHJpZ2h0DQpoZXJlLCBhdCB3aGljaCBwb2ludCB0aGF0IGFzc2VydGlvbiB3b3VsZCBo
YXZlIG1hZGUgc2Vuc2UuIEFuZCB0aGVyZQ0Kd2UgZ28gLSBJJ20gbm90IGF0IGFsbCBzdXJwcmlz
ZWQgdGhhdCB0aGlzIHN0ZW1zIGZyb20gNjAwOWY0ZGRiMg0KKCdUcmFuc2NlbmRlbnQgbWVtb3J5
ICgidG1lbSIpIGZvciBYZW4nKSwgd2l0aCBubyBtZW50aW9uIGF0IGFsbCBpbg0KdGhlIGNvbW1p
dCBtZXNzYWdlIGFzIHRvIHdoeSB0aGUgYWxsb2NhdG9yIG5lZWRlZCB0byBiZSBjaGFuZ2VkLg0K
DQpJT1cgLSBhcyBsb25nIGFzIHlvdSBhZ3JlZSB3aXRoIHRoZSBhbmFseXNpcywgYW5kIGFzIGxv
bmcgYXMgYQ0KcmVmZXJlbmNlIHRvIHRoZSBhYm92ZSBjb21taXQgcmVuZGVyaW5nIHN0YWxlIHRo
YXQgZW50aXJlIGlmKCkgZ2V0cw0KYWRkZWQgdG8gdGhlIGRlc2NyaXB0aW9uICh3aGljaCBtYXkg
c3RpbGwgYmUgcmVhc29uYWJsZSB0byBkbyB3aGlsZQ0KY29tbWl0dGluZyk6DQoNClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
