Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2E74DE0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:14:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqcbU-00015K-Cx; Thu, 25 Jul 2019 12:12:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqcbS-00015D-JN
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:12:10 +0000
X-Inumbo-ID: 6b91501d-aed5-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b91501d-aed5-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 12:12:09 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 12:12:02 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 12:06:50 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 12:06:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g15IIIPFNDw2R6s/lwy4L8a1OODZHl97T9YHcbx/r5TUhwFvK5Nd5KHyYiC/uKbxG6xGlH89zh2PvSCo/TBagVM4CnegOe+fVBWjejStvlnMI8Zmwm1jtKfOkNkzVWS7plEMyBC88dSq+ipZpFYYpuVNxrMdTnP4/GATPzM31XPt4GjYYBHiDcnRKS5xTXb8hXa2qlsLMVWi9ciuoPaKFpJrmOBdIi8xFfN/N6M076prGZYrxBvBJ8Kv28qPiMMXDFCL5BQ9M2ETQu4lf4Kz48Mo111Ng13eJ0JVDtZBr3hBehmmCc6cXa9FFb2Jt1vYrdnsOCc60E8OthZNXmtWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/FHfCnQ8lSbmKWI57t9yVMpA7frBuzkxcE+/ZKdf8U=;
 b=DGDFPCw8jfUADC7PpwAx5CGahJ8nsoB+dLoUJFnT9eQYbp8GH5Mzytfene9eVzk2wonQAyArhNu7gOw/1o+yBnRVPwmfuOMnUxnMoBkjZLnPALi1gcKzXeIIRMrGNlFXyUeW4ZmpBbWliHpaQpjUvQYxF/jOx1PsIYxtY1uzYLgS8K/pxwjg380uRITkhGOmWnUBmThY7y4qzxw7WPNxtG01lCCR24E+KfrkBSVGj7hzh9wcCoDDdhlPKevtlzx3U5CYYFVrIsu3VMNEy1AadjR2lhuQAzg9y26WgtFzBX5rfuljbcCT2Zrqi4QD+fNTnXCL4G6joR0up3Q7F68GNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3204.namprd18.prod.outlook.com (10.255.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 12:06:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 12:06:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] x86/iommu: avoid mapping the interrupt address range
 for hwdom
Thread-Index: AQHVQW4v+Mw2bodxPUiy9HdTXv5ycabbIsgAgAAJLSmAABQCgA==
Date: Thu, 25 Jul 2019 12:06:48 +0000
Message-ID: <91ba302f-17b1-e52d-dc22-dc575fd56e6a@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-2-roger.pau@citrix.com>
 <502a2fd8-5a03-0921-bf5f-bb88feae35c1@suse.com>
 <20190725105422.cymulz7ynruwycfy@Air-de-Roger>
In-Reply-To: <20190725105422.cymulz7ynruwycfy@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a135fdf-546a-44fc-2599-08d710f8921b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3204; 
x-ms-traffictypediagnostic: BY5PR18MB3204:
x-microsoft-antispam-prvs: <BY5PR18MB3204E88E07E0FFB0A5CBED8FB3C10@BY5PR18MB3204.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(189003)(199004)(52314003)(86362001)(486006)(11346002)(2616005)(31686004)(14454004)(476003)(64756008)(80792005)(66446008)(6506007)(53546011)(66946007)(5660300002)(316002)(7736002)(66476007)(386003)(305945005)(66556008)(102836004)(71190400001)(71200400001)(8676002)(81166006)(26005)(53936002)(81156014)(66066001)(99286004)(4326008)(186003)(52116002)(25786009)(6512007)(6246003)(478600001)(6916009)(54906003)(8936002)(14444005)(256004)(31696002)(36756003)(6486002)(2906002)(76176011)(6116002)(3846002)(6436002)(229853002)(68736007)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3204;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EhostxQjNgeERfb+RHlI07wMEv8VbKiKnfacfVwb4g4IHjuCD80HIkGw+SXLdmMK209bv1GtRSQvQhVG7B9iL89uAbV/ZfbhRzfzWG+DMvivPccFPs8JamG5IBwjObQtbl8zQiuvj4DXgmEaJ3BdXiZrIgJuHe6DCtI0jLlmEVUbfsf0UP4OH+Mo5ASndKS5cZqSDhwBqGXldavJ0mLMcF1+CQv4RTXFp8YCHJrcA2FS951pNsFtBqj611BKPvO28gh+xlcOouUiqp78RyENfx204dPvFvndBgr2U1DYG8jIAwdb0tOdqXx88hS4dCTsblm3fRVO+CcRpxREeMSpjskyzB4Ga3D8k0xqFoN6sKLhE9poewDLE+xPcJo+HOniMUdUZLboCieTkurFMYWO5VWTFERm4y94tNnF1YsL1x8=
Content-ID: <C1DEF48DB3867F49B5A98EE9AC06A8A7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a135fdf-546a-44fc-2599-08d710f8921b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 12:06:48.7709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3204
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] x86/iommu: avoid mapping the interrupt
 address range for hwdom
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxMjo1NCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDI1LCAyMDE5IGF0IDEwOjIyOjE3QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMjMuMDcuMjAxOSAxNzo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IEN1cnJlbnQg
Y29kZSBvbmx5IHByZXZlbnQgbWFwcGluZyB0aGUgbGFwaWMgcGFnZSBpbnRvIHRoZSBndWVzdA0K
Pj4+IHBoeXNpY2FsIG1lbW9yeSBtYXAuIEV4cGFuZCB0aGUgcmFuZ2UgdG8gYmUgMHhGRUV4X3h4
eHggYXMgZGVzY3JpYmVkDQo+Pj4gaW4gdGhlIEludGVsIFZUZCBzcGVjaWZpY2F0aW9uIHNlY3Rp
b24gMy4xMyAiSGFuZGxpbmcgUmVxdWVzdHMgdG8NCj4+PiBJbnRlcnJ1cHQgQWRkcmVzcyBSYW5n
ZSIuDQo+Pj4NCj4+PiBBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4gdGhlIEFN
RCBTUjU2OTAgRGF0YWJvb2ssIHNlY3Rpb24NCj4+PiAyLjQuNCAiTVNJIEludGVycnVwdCBIYW5k
bGluZyBhbmQgTVNJIHRvIEhUIEludGVycnVwdCBDb252ZXJzaW9uIi4NCj4+Pg0KPj4+IFJlcXVl
c3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+
DQo+PiBJJ3ZlIGNvbW1pdHRlZCB0aGlzIG9uIHRoZSBiYXNpcyB0aGF0IGl0IHNob3VsZG4ndCBo
dXJ0LCBidXQgaGF2aW5nDQo+PiB0aG91Z2h0IGFib3V0IHRoaXMgc29tZSBtb3JlIEknbSBub3Qg
cmVhbGx5IHN1cmUgSSBzZWUgdGhlIHBvaW50Og0KPj4gVGhlIElPTU1VIHNwZWNpYWwgY2FzZXMg
YWNjZXNzZXMgaW50byB0aGlzIHJhbmdlIGFueXdheSwgdG8gcmVkaXJlY3QNCj4+IGxvb2t1cCB0
byB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZSBpbnN0ZWFkIG9mIHRoZSBETUEgcmVtYXBw
aW5nDQo+PiBvbmUuIEhlbmNlIGFueSBtYXBwaW5ncyBpbnNlcnRlZCBpbnRvIHRoaXMgcmFuZ2Ug
YXJlIHNpbXBseSB1c2VsZXNzLA0KPj4gYnV0IHNob3VsZG4ndCBvdGhlcndpc2UgaHVydC4NCj4g
DQo+IEludGVsIFNETSBjb250YWluczoNCj4gDQo+ICJTb2Z0d2FyZSBtdXN0IGVuc3VyZSB0aGUg
c2Vjb25kLWxldmVsIHBhZ2luZy1zdHJ1Y3R1cmUgZW50cmllcyBhcmUNCj4gcHJvZ3JhbW1lZCBu
b3QgdG8gcmVtYXAgaW5wdXQgYWRkcmVzc2VzIHRvIHRoZSBpbnRlcnJ1cHQgYWRkcmVzcw0KPiBy
YW5nZS4gSGFyZHdhcmUgYmVoYXZpb3IgaXMgdW5kZWZpbmVkIGZvciBtZW1vcnkgcmVxdWVzdHMg
cmVtYXBwZWQgdG8NCj4gdGhlIGludGVycnVwdCBhZGRyZXNzIHJhbmdlLiINCj4gDQo+IEluIHNl
Y3Rpb24gMy4xMyAoSGFuZGxpbmcgUmVxdWVzdHMgdG8gSW50ZXJydXB0IEFkZHJlc3MgUmFuZ2Up
Lg0KPiANCj4gU2luY2UgYXJjaF9pb21tdV9od2RvbV9pbml0L2h3ZG9tX2lvbW11X21hcCBhZGRz
IGVudHJpZXMgdG8gYm90aCB0aGUNCj4gaGFwIGFuZCB0aGUgaW9tbXUgcGFnZSB0YWJsZXMgKG9y
IHRvIGhhcCBvbmx5IGlmIHNoYXJlZCkgWGVuIHNob3VsZCBiZQ0KPiBjYXJlZnVsIHRvIG5vdCBt
YXAgdGhpcyByYW5nZSBiZWNhdXNlIHRoZSBpb21tdSBzcGVjaWFsIGNhc2VzIHRoaXMNCj4gcmFu
Z2UsIGJ1dCBJJ20gbm90IHN1cmUgd2hhdCBoYXAgZG9lcy4NCg0KSG1tLCBpbiB0aGUgc2hhcmVk
LXB0IGNhc2UgdGhpcyBpcyBpbmRlZWQgZGVzaXJhYmxlIGluIGFueSBldmVudC4gSQ0KaGF2ZSB0
byBhZG1pdCB0aGF0IEkgZGlkbid0IHJlY2FsbCB0aGF0IGV2ZW4gaW4gdGhlIG5vbi1zaGFyZWQg
Y2FzZQ0KYXJjaF9pb21tdV9od2RvbV9pbml0KCkgd291bGQgZmlkZGxlIHdpdGggdGhlIEhBUCB0
YWJsZXMgYXMgd2VsbCwNCnJhdGhlciB0aGFuIGp1c3QgdGhlIElPTU1VIG9uZXMuIEkgZG9uJ3Qg
dGhpbmsgdGhpcyBzaG91bGQgcmVtYWluDQp0aGlzIHdheSBsb25nIHRlcm0uIE9yIHdhcyB0aGVy
ZSBhIHJlYXNvbiBmb3IgdGhpcyB0byBiZSBuZWVkZWQ/DQoNCkphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
