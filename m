Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A569764B6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:41:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqyYt-0003fL-Hw; Fri, 26 Jul 2019 11:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqyYs-0003fG-8T
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:38:58 +0000
X-Inumbo-ID: f276ab84-af99-11e9-a7a3-cf6aa4f45b66
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f276ab84-af99-11e9-a7a3-cf6aa4f45b66;
 Fri, 26 Jul 2019 11:38:55 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 11:38:55 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 11:35:25 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 11:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXJscLb8Ax4u9Ult/X96twEsd+r8B9bQu1zELNkdBePxtjRPa5ahl6Li6aWsjguyK3o7ZopaWK4zrlDqFSEz2tWeIds4gdl1vGgaIeZh5VwlcvaX6zP3NLxL3rmG158qbt0xvrche6vuaQeHDqJTdMwHPIRLLiM58tww//yWxRR1Vysf+uPJIoopGbn0o3K48OeHC4lezzjk2wqrviHtEuxcah7hP2XK7dwAWBKUvwKuQ4wk1RnAJWp4ObDXHABhboe2aKk0/0f19HDqDrmC2lmOhdeLrMJWgtM/SK1sO6ZA+bbt3710dAVb3kwXVKIH4IpiIXyxeI1AQVLWQ+AB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvsDLP7MtyKCo948+mQCJO7JMc6MCEGn3Zr8+vGnsB8=;
 b=Y8I8oXvv3ukYhgKe1/Claxq+Lfxm+aJE5Gy94A2hZIfdr9Wl4SC5yEAKlV7LEjMsgrDynr7hBu/9IVCYJrotAKBbs6FcRJbxlbMZkfvyEKDJFWiSAb0JJdtfK4U5I1+lnkQ/UDHcDGxR36gL62I2ynmLS+BhNI1fEpNY/CwOsQW1Q/zc1UAnaEtyqPhuY6VWdJ1Nkxm7SeIHWH/KEaOF+OXhoDRlzDLAGw1HScvgLBGioS2y5o/nST0SeHFMoroFy0lsgNZkqw/HVCdyIFqn0+X51df3pzMsWwpcCbTe2S5l0S/l6lrHlW9PMo92J7RGHch5g9akiNzTCd3YV38VUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3411.namprd18.prod.outlook.com (10.255.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 11:35:24 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 11:35:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH v3 2/2] xen: merge temporary vcpu pinning scenarios
Thread-Index: AQHVQhK9XkC67/eVmky5KVr20rRuZKbcqfttgAAeRIA=
Date: Fri, 26 Jul 2019 11:35:23 +0000
Message-ID: <4e74ddbe-f6f1-02e9-82f3-5f07e060ba19@suse.com>
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
 <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
In-Reply-To: <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0162.eurprd07.prod.outlook.com
 (2603:10a6:6:43::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27a3fc9b-83ef-4110-2b7a-08d711bd590c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3411; 
x-ms-traffictypediagnostic: BY5PR18MB3411:
x-microsoft-antispam-prvs: <BY5PR18MB34110228259FA3BEE27028E4B3C00@BY5PR18MB3411.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(52116002)(66446008)(305945005)(5660300002)(66476007)(64756008)(6506007)(229853002)(186003)(6246003)(386003)(256004)(81166006)(53546011)(26005)(316002)(14444005)(102836004)(3846002)(2616005)(53936002)(81156014)(11346002)(7736002)(71200400001)(66946007)(446003)(8936002)(36756003)(486006)(25786009)(99286004)(6486002)(6436002)(110136005)(86362001)(14454004)(8676002)(6636002)(6116002)(478600001)(31696002)(68736007)(6512007)(66066001)(2906002)(76176011)(71190400001)(476003)(54906003)(4326008)(80792005)(31686004)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3411;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9VZOM9aIrz7b3UhVUT9TixU5HeJK71aYjWI+b5OaJToylSfcsDbNbaTnfcb/q1+ArDXKHBaMrGokufSO6Mp5qRb/uDKs6OUVAkfumArh0IwHG9nE2z9NOIPUy6C7JMFlIm+eLoIDtwAp79S0Y06aJuMVBRQgbDOphS+wVuKrHCZ+hk2T5aYhKB47aVCuqAVKEXLVsyHzrvCsetkhMsrsoSFJHtxy6RG4BJoveNnKBJ3dkv8gdlWg5+odgv8wQXSb0GnOTD0SVHBBQlHK8+dKPEMRuAiWK+lbfpH7QWY284irmW/UiUIYcCYRaPTp0cydzzZLUmcjCOopU1R/vV5TYREoYjVYHkm2CxsxSLr9fYOj/yWipoILMXDSJiVI8AyB9BN0NPQOwUMfLNyu3xYk5R45dHCKLOdI8auaYVRZ+iY=
Content-ID: <ED80EEA54352D346B71D42DCDAB47584@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a3fc9b-83ef-4110-2b7a-08d711bd590c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:35:23.8204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3411
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
 scenarios
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxMTo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjQvMDcvMjAx
OSAxMjoyNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEBAIC0xODIsMzAgKzE3OCwyNCBAQCBz
dGF0aWMgdm9pZCBfX3ByZXBhcmVfdG9fd2FpdChzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdikN
Cj4+ICAgc3RhdGljIHZvaWQgX19maW5pc2hfd2FpdChzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndx
dikNCj4+ICAgew0KPj4gICAgICAgd3F2LT5lc3AgPSBOVUxMOw0KPj4gLSAgICAodm9pZCl2Y3B1
X3NldF9oYXJkX2FmZmluaXR5KGN1cnJlbnQsICZ3cXYtPnNhdmVkX2FmZmluaXR5KTsNCj4+ICsg
ICAgdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoY3VycmVudCwgTlJfQ1BVUywgVkNQVV9BRkZJTklU
WV9XQUlUKTsNCj4+ICAgfQ0KPj4gICANCj4+ICAgdm9pZCBjaGVja193YWtldXBfZnJvbV93YWl0
KHZvaWQpDQo+PiAgIHsNCj4+IC0gICAgc3RydWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYgPSBjdXJy
ZW50LT53YWl0cXVldWVfdmNwdTsNCj4+ICsgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50
Ow0KPj4gKyAgICBzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdiA9IGN1cnItPndhaXRxdWV1ZV92
Y3B1Ow0KPj4gICANCj4+ICAgICAgIEFTU0VSVChsaXN0X2VtcHR5KCZ3cXYtPmxpc3QpKTsNCj4+
ICAgDQo+PiAgICAgICBpZiAoIGxpa2VseSh3cXYtPmVzcCA9PSBOVUxMKSApDQo+PiAgICAgICAg
ICAgcmV0dXJuOw0KPj4gICANCj4+IC0gICAgLyogQ2hlY2sgaWYgd2Ugd29rZSB1cCBvbiB0aGUg
d3JvbmcgQ1BVLiAqLw0KPj4gLSAgICBpZiAoIHVubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSAh
PSB3cXYtPndha2V1cF9jcHUpICkNCj4+ICsgICAgLyogQ2hlY2sgaWYgd2UgYXJlIHN0aWxsIHBp
bm5lZC4gKi8NCj4+ICsgICAgaWYgKCB1bmxpa2VseSghKGN1cnItPmFmZmluaXR5X2Jyb2tlbiAm
IFZDUFVfQUZGSU5JVFlfV0FJVCkpICkNCj4+ICAgICAgIHsNCj4+IC0gICAgICAgIC8qIFJlLXNl
dCBWQ1BVIGFmZmluaXR5IGFuZCByZS1lbnRlciB0aGUgc2NoZWR1bGVyLiAqLw0KPj4gLSAgICAg
ICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Ow0KPj4gLSAgICAgICAgY3B1bWFza19jb3B5
KCZ3cXYtPnNhdmVkX2FmZmluaXR5LCBjdXJyLT5jcHVfaGFyZF9hZmZpbml0eSk7DQo+PiAtICAg
ICAgICBpZiAoIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoY3VyciwgY3B1bWFza19vZih3cXYtPndh
a2V1cF9jcHUpKSApDQo+PiAtICAgICAgICB7DQo+PiAtICAgICAgICAgICAgZ2RwcmludGsoWEVO
TE9HX0VSUiwgIlVuYWJsZSB0byBzZXQgdmNwdSBhZmZpbml0eVxuIik7DQo+PiAtICAgICAgICAg
ICAgZG9tYWluX2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7DQo+PiAtICAgICAgICB9DQo+PiAtICAg
ICAgICB3YWl0KCk7IC8qIHRha2VzIHVzIGJhY2sgaW50byB0aGUgc2NoZWR1bGVyICovDQo+PiAr
ICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAidmNwdSBhZmZpbml0eSBsb3N0XG4iKTsNCj4+
ICsgICAgICAgIGRvbWFpbl9jcmFzaChjdXJyLT5kb21haW4pOw0KPj4gICAgICAgfQ0KPiANCj4g
SSdtIHNvcnJ5IHRvIHJldHJhY3QgbXkgUi1ieSBhZnRlciB0aGUgZmFjdCwgYnV0IEkndmUgb25s
eSBqdXN0IG5vdGljZWQNCj4gKHdoaWxlIHJlYmFzaW5nIHNvbWUgb2YgbXkgcGVuZGluZyB3b3Jr
IG92ZXIgdGhpcykgdGhhdCBpdCBpcyBidWdneS4NCj4gDQo+IFRoZSByZWFzb24gd2FpdCgpIHdh
cyBjYWxsZWQgaXMgYmVjYXVzZSBpdCBpcyBub3Qgc2FmZSB0byBsZWF2ZSB0aGF0DQo+IGlmKCkg
Y2xhdXNlLg0KPiANCj4gV2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZSwgd2UnbGwgYXJyYW5nZSBm
b3IgdGhlIFZNIHRvIGJlIGNyYXNoZWQsIHRoZW4NCj4gbG9uZ2p1bXAgYmFjayBpbnRvIHRoZSBz
dGFjayBmcm9tIGZyb20gdGhlIHdhaXRpbmcgdkNQVSwgb24gdGhlIHdyb25nDQo+IENQVS7CoCBB
bnkgY2FsbGVyIHdpdGggc21wX3Byb2Nlc3Nvcl9pZCgpIG9yIHRocmVhZC1sb2NhbCB2YXJpYWJs
ZXMgY2FjaGUNCj4gYnkgcG9pbnRlciBvbiB0aGUgc3RhY2sgd2lsbCB0aGVuIGNhdXNlIG1lbW9y
eSBjb3JydXB0aW9uLg0KPiANCj4gSXRzIG5vdCBpbW1lZGlhdGVseSBvYnZpb3VzIGhvdyB0byBm
aXggdGhpcywgYnV0IGJlYXIgaW4gbWluZCB0aGF0IGFzDQo+IHNvb24gYXMgdGhlIHZtLWV2ZW50
IGludGVyZmFjZSBpcyBkb25lLCBJIHBsYW4gdG8gZGVsZXRlIHRoaXMgd2hvbGUNCj4gd2FpdHF1
ZXVlIGluZnJhc3RydWN0dXJlIGFueXdheS4NCg0KSW4gd2hpY2ggY2FzZSAtIHNob3VsZCB3ZSBy
ZXZlcnQgdGhlIGNvbW1pdCB1bnRpbCB0aGlzIGlzIHJlc29sdmVkPw0KDQpKYW4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
