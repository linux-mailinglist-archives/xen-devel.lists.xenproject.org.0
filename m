Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDED5E2CC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:30:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidOu-0003eE-4P; Wed, 03 Jul 2019 11:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hidOr-0003dS-Vr
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:26:10 +0000
X-Inumbo-ID: 5784122c-9d85-11e9-8238-bfcac5a13f49
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5784122c-9d85-11e9-8238-bfcac5a13f49;
 Wed, 03 Jul 2019 11:26:07 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 11:22:30 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 11:23:39 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 11:23:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=kPFEO71dMusemOQA5JxlqChBdZdfaC23OMUve0nOznomUVFXQUKr3S4sfxd/Nimkr+jQaHxEfduws0RUA73oa1hiB3nbIXoMSOLYAaRflkABIPCmvsm6XE2BsS9HlcbQ7rU9fsx+Xw5EwZOVcSGxwXD7+erToJHw6rfVzDXlMjk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1wxsrJwX4gZGsGPRRPyEkWkrouYfNVo3jwfb5kQNzk=;
 b=u+I/71a+VEDZKW1720TKqvI7X2uSQMsf3Puc+BEkiqpp5/CptGNj7hQ+RlsNuCG6KMyNf75EWfyLa81uWgKlIqDBOQIhf3VS6JIvzYbEVXtGcDk2KtYCszhZGma0DBcsUFKDFDFUukYlHX9sjr/FVeNZ3ddtZzuwRz5B3XK9GCU=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3234.namprd18.prod.outlook.com (10.255.137.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Wed, 3 Jul 2019 11:23:38 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 11:23:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH] x86/ept: pass correct level to p2m_entry_modify
Thread-Index: AQHVMYPg4S+dIz0qA0OTyld2TcGeGKa4r0GAgAALOJyAAAX7gA==
Date: Wed, 3 Jul 2019 11:23:38 +0000
Message-ID: <837c8c7d-a6e9-7503-5dfa-b438883f84ae@suse.com>
References: <20190703094322.1551-1-roger.pau@citrix.com>
 <00beccee-3e59-ed0d-23fc-6e24bacfcfaf@suse.com>
 <20190703110124.ejxkiiwtijrzf4qr@Air-de-Roger>
In-Reply-To: <20190703110124.ejxkiiwtijrzf4qr@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::23)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77933765-0370-4d59-fad2-08d6ffa8e4de
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3234; 
x-ms-traffictypediagnostic: BY5PR18MB3234:
x-microsoft-antispam-prvs: <BY5PR18MB323456B9BEF035C193B2D159B3FB0@BY5PR18MB3234.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(99286004)(5660300002)(36756003)(8676002)(81166006)(81156014)(4326008)(73956011)(25786009)(31686004)(8936002)(66946007)(80792005)(53936002)(71190400001)(6246003)(7736002)(305945005)(66556008)(66476007)(53546011)(6116002)(6436002)(6512007)(66446008)(64756008)(71200400001)(2616005)(11346002)(6486002)(446003)(14454004)(386003)(256004)(14444005)(66066001)(316002)(68736007)(476003)(54906003)(229853002)(186003)(2906002)(72206003)(86362001)(26005)(3846002)(52116002)(6506007)(102836004)(76176011)(486006)(31696002)(478600001)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3234;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AjLgNCpsUp5fvrdvxxDegsIU9gfTlQ7pvqrGTZBgrtG2WqC7lNg5jqj2ZAPxXyzwgocbr02iXwjxR2UV2ZhdfTXe0pblwuKU9g8HO2ZHSHOLu1hVFsXcgvfX6C7vX1QZBBTo0FMvF3p4Vig6Q2cK5t80BbFwV2E/ozW1iinJ4ikLqE0TO/IKdHF9su2ODt1soxHRPB+S8s7tSEsjQFPTL8551j2YzjLWFYTYRCfJSeJpUxce1MXJYMR9435uocoHTounfHevK5jh+ioyYPiLDYRBHcI2xGne54lQbvXDLnBC7OrQUOx7z0rfiEP2BqoDTsjg0jsY8ywYh58pCpnd4zbIjg1VIGoE+Xb/9d3vswUaxWO3GowbMZEAbVW41bERidVK4irixWdnsNb3Do4Ra9/WXHoD3PwaVgWBN9/kYc0=
Content-ID: <01E23514A07960408BD1FD50559C4202@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 77933765-0370-4d59-fad2-08d6ffa8e4de
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:23:38.2109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3234
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/ept: pass correct level to
 p2m_entry_modify
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
Cc: KevinTian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMzowMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDAzLCAyMDE5IGF0IDEwOjIyOjAzQU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMDMuMDcuMjAxOSAxMTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IEVQVCBkaWZm
ZXJzIGZyb20gTlBUIGFuZCBzaGFkb3cgd2hlbiB0cmFuc2xhdGluZyBwYWdlIG9yZGVycyB0byBs
ZXZlbHMNCj4+PiBpbiB0aGUgcGh5c21hcCBwYWdlIHRhYmxlcy4gRVBUIHBhZ2UgdGFibGVzIGxl
dmVsIGZvciBvcmRlciAwIHBhZ2VzIGlzDQo+Pj4gMCwgd2hpbGUgTlBUIGFuZCBzaGFkb3cgaW5z
dGVhZCB1c2UgMSwgaWU6IEVQVCBwYWdlIHRhYmxlcyBsZXZlbHMNCj4+PiBzdGFydHMgYXQgMCB3
aGlsZSBOUFQgYW5kIHNoYWRvdyBzdGFydHMgYXQgMS4NCj4+Pg0KPj4+IEZpeCB0aGUgcDJtX2Vu
dHJ5X21vZGlmeSBjYWxsIGluIGF0b21pY193cml0ZV9lcHRfZW50cnkgdG8gYWx3YXlzIGFkZA0K
Pj4+IG9uZSB0byB0aGUgbGV2ZWwsIGluIG9yZGVyIHRvIG1hdGNoIE5QVCBhbmQgc2hhZG93IHVz
YWdlLg0KPj4+DQo+Pj4gV2hpbGUgdGhlcmUgYWxzbyBmaXggcDJtX2VudHJ5X21vZGlmeSBCVUcg
Y29uZGl0aW9uIHRvIHRyaWdnZXIgd2hlbg0KPj4+IGZvcmVpZ24gb3IgaW9yZXEgZW50cmllcyB3
aXRoIGxldmVsIGRpZmZlcmVudCB0aGFuIDAgYXJlIGF0dGVtcHRlZC4NCj4+PiBUaGF0IHNob3Vs
ZCBhbGxvdyB0byBjYXRjaCBmdXR1cmUgZXJyb3JzIHJlbGF0ZWQgdG8gdGhlIGxldmVsDQo+Pj4g
cGFyYW1ldGVyLg0KPj4+DQo+Pj4gRml4ZXM6IGM3YTRjMCAoJ3g4Ni9tbTogc3BsaXQgcDJtIGlv
cmVxIHNlcnZlciBwYWdlcyBzcGVjaWFsIGhhbmRsaW5nIGludG8gaGVscGVyJykNCj4+DQo+PiBB
IDYtZGlnaXQgaGFzaCBpcyBkZWZpbml0ZWx5IHRvbyBzaG9ydCBpbiB0aGUgbG9uZyBydW4uIEkg
dW5kZXJzdGFuZA0KPj4gdGhhdCB0aGlzIHRoZW4gd2FudHMgYmFja3BvcnRpbmcgdG8gdGhlIDQu
MTIgdHJlZS4NCj4gDQo+IFllcy4NCj4gDQo+IElzIHRoZXJlIGNvbnNlbnN1cyBvbiBob3cgbWFu
eSBkaWdpdHMgdG8gdXNlIDgsIDEyLCAxNj8NCg0KQ29uc2Vuc3VzIC0gbm8sIEkgZG9uJ3QgdGhp
bmsgc28uIEJ1dCBhbnl0aGluZyBiZWxvdyA4IHNlZW1zDQpvcGVuIGZvciBjb2xsaXNpb25zIGlu
IHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUgKGFsYmVpdCBJIGRvbid0DQprbm93IGlmIGdpdCBoYXMg
c2VwYXJhdGUgaGFzaCBuYW1lIHNwYWNlcyBmb3IgY29tbWl0cyBhbmQNCm9iamVjdHMgaW4gZ2Vu
ZXJhbCkuIEkndmUgYmVlbiB1c2luZyAxMCBmb3IgdGhlIGxhc3Qgc28gbWFueQ0KeWVhcnMgLi4u
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
