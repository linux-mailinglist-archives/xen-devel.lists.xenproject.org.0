Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6098081A1F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hucXZ-0001lE-21; Mon, 05 Aug 2019 12:56:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hucXX-0001l9-Dn
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:56:39 +0000
X-Inumbo-ID: 733e844c-b780-11e9-99f9-1ff6c60405e6
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 733e844c-b780-11e9-99f9-1ff6c60405e6;
 Mon, 05 Aug 2019 12:56:34 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 12:56:19 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 12:52:36 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 12:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8EttGX0WUte3BYKobo1eNQ29Z3Ga8copZ3Oj8/0Goghy0JGiWqPIOpjEcOyOX7/9ewcnRZwhtXShu7m/Nb98V+wzLO4qMLXNxOP2QXkC4tmubDxMC9DdiuMZG7Aw2Uw2OxvRcfUI7VsPhLmNE3w3FBbGfltEnAARJYDtqjofqyos0WivVmg39Bnh9lazm/YePZ4mEHBHnaZU6MIiO2IjfJbCmoegzBJZO4uEPr2E565FbA7vvJxQM8/n+AvjsxBPJHF4HMviOStsBYqJ8Pb+QFBMmm6/p/SthQxztJvJGlHd4u2ph0rjuj8o6VbG9aXte7JYcRjg/f/+xWwqhfhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cqDBFUgVywrY8uCSsG08X7qDeo4uR/CJRYBimX35WQ=;
 b=VngqkY9IKwJZJ8iFaG9HGzqXh/onuyPUnsjXdjqnqeJCLwCdVsI/x4XJBDShDxyKqGnCg0Z1VlUTKlhfELd1YTeagKyApDRVpocc3rfF4soqyd6pV8gb+dyHeXJzm/KhD7TACgwQ8LXqBiiUGHtfE6ygN/6LXe17hpF4tDH+jNxxp+y5Fb8PgO1SmmBqhOftWh1Cqtw5grEn1srlL6F0wEXHbMgHLB4MCcq0opSAxNamLpFdcrbgir39vq5e2q/ZlbKjakP5PbPVXVNIZeKl69vKWHQrm8+bZF8eflWEJH+ukmxZtzM7n5RRXHtx4/X1pzagGJ+kCIng+rjszey7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3264.namprd18.prod.outlook.com (10.255.237.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Mon, 5 Aug 2019 12:52:34 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 12:52:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow
 capable hardware
Thread-Index: AQHVRuU3MpytGLjiWki4k1cIRnKVnabsi3qA
Date: Mon, 5 Aug 2019 12:52:34 +0000
Message-ID: <61cbc138-7299-5125-34a0-a721c9b29f82@suse.com>
References: <20190730144255.6126-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190730144255.6126-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:15::31) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaf200ec-9365-4f05-39e8-08d719a3c916
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR18MB3264; 
x-ms-traffictypediagnostic: MN2PR18MB3264:
x-microsoft-antispam-prvs: <MN2PR18MB326473697BB6B83B3891E233B3DA0@MN2PR18MB3264.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(199004)(189003)(6436002)(6486002)(31686004)(81156014)(11346002)(8676002)(478600001)(476003)(7736002)(256004)(6512007)(66066001)(14454004)(305945005)(53936002)(8936002)(71200400001)(71190400001)(36756003)(66556008)(66476007)(64756008)(66446008)(66946007)(81166006)(54906003)(229853002)(25786009)(486006)(5660300002)(2906002)(80792005)(316002)(99286004)(6246003)(53546011)(6506007)(86362001)(386003)(6116002)(6916009)(186003)(102836004)(76176011)(446003)(3846002)(4326008)(52116002)(2616005)(68736007)(26005)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3264;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rl1lIKBpNCJXvJgYgPYZ3sQZZDXLDTh/pOhiQRSi5SpLyjtmyfXbY5yyFrFov3SD7CvU2iMyTPJUF/ZxO6Zqq9BQ5jgpYxDxBIwZJmbW1FNP8I75LGWRryLJD4xdcUHePGOKDc5izcYPd/lKckwTaKVzPWJqJPMsfNSyc1viDB9WJBe/1FmWX2Gfh0+Fbc/2UUuLmRg33jJGHUmzoAK2mvVo0KmIIWRVhh6UpCygeE8+qcG5ik4c7Wmvmkea4z7VqKnFPdGMURhTpqO+xwMHxKHs9UkhMn/juNdDzqxxVbziKqGM1f0b3qvn9ozU4CeRlE4PZt2PsHP3ntSlqD5NiydCbaARHdEsw5UI7jXE/dVj87tDWy5v6AA8P7e1mJ1p0q3fD10CgI4B7OVgNCDmfAmr5z9WHtKzvPC4L76/Yjw=
Content-ID: <091583E9A548DA4EA5E37C6E70B5918E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf200ec-9365-4f05-39e8-08d719a3c916
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 12:52:34.2763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3264
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow
 capable hardware
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNjo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gYy9zIGU5OTg2YjBk
ZCAieDg2L3Z2bXg6IFNpbXBsaWZ5IHBlci1DUFUgbWVtb3J5IGFsbG9jYXRpb25zIiBoYWQgdGhl
IHdyb25nDQo+IGluZGlyZWN0aW9uIG9uIGl0cyBwb2ludGVyIGNoZWNrIGluIG52bXhfY3B1X3Vw
X3ByZXBhcmUoKSwgY2F1c2luZyB0aGUNCj4gVk1DUy1zaGFkb3dpbmcgYnVmZmVyIG5ldmVyIGJl
IGFsbG9jYXRlZC4gIEZpeCBpdC4NCj4gDQo+IFRoaXMgaW4gdHVybiByZXN1bHRzIGluIGEgbWFz
c2l2ZSBxdWFudGl0eSBvZiBsb2dzcGFtLCBhcyBldmVyeSB2aXJ0dWFsDQo+IHZtZW50cnkvZXhp
dCBoaXRzIGJvdGggZ2RwcmludGsoKXMgaW4gdGhlICpfYnVsaygpIGZ1bmN0aW9ucy4NCg0KVGhl
ICJpbiB0dXJuIiBoZXJlIGFwcGxpZXMgdG8gdGhlIG9yaWdpbmFsIGJ1ZyAod2hpY2ggZ2V0cyBm
aXhlZCBoZXJlKQ0KYWl1aSwgaS5lLiB0aGVyZSBpc24ndCBhbnkgbG9nIHNwYW0gd2l0aCB0aGUg
Zml4IGluIHBsYWNlIGFueW1vcmUsIGlzDQp0aGVyZT8gSWYgc28sIC4uLg0KDQo+IFN3aXRjaCB0
aGVzZSB0byB1c2luZyBwcmludGtfb25jZSgpLiAgVGhlIHNpemUgb2YgdGhlIGJ1ZmZlciBpcyBj
aG9zZW4gYXQNCj4gY29tcGlsZSB0aW1lLCBzbyBjb21wbGFpbmluZyBhYm91dCBpdCByZXBlYXRl
ZGx5IGlzIG9mIG5vIGJlbmVmaXQuDQoNCi4uLiBJJ20gbm90IHN1cmUgSSdkIGFncmVlIHdpdGgg
dGhpcyBtb3ZlOiBXaHkgd291bGQgaXQgYmUgb2YgaW50ZXJlc3QNCm9ubHkgdGhlIGZpcnN0IHRp
bWUgdGhhdCB3ZSAod291bGQgaGF2ZSkgb3ZlcnJ1biB0aGUgYnVmZmVyPyBBZnRlciBhbGwNCml0
J3Mgbm90IG9ubHkgdGhlIGNvbXBpbGUgdGltZSBjaG9pY2Ugb2YgYnVmZmVyIHNpemUgdGhhdCBt
YXR0ZXJzIGhlcmUsDQpidXQgYWxzbyB0aGUgcnVudGltZSBhc3BlY3Qgb2Ygd2hhdCB2YWx1ZSAi
biIgaGFzIGdvdCBwYXNzZWQgaW50byB0aGUNCmZ1bmN0aW9ucy4gSWYgdGhpcyBpcyBvbiB0aGUg
YXNzdW1wdGlvbiB0aGF0IHdlJ2Qgd2FudCB0byBrbm93IG1lcmVseQ0Kb2YgdGhlIGZhY3QsIG5v
dCBob3cgb2Z0ZW4gaXQgb2NjdXJzLCB0aGVuIEknZCB0aGluayB0aGlzIG91Z2h0IHRvDQpyZW1h
aW4gYSBkZWJ1Z2dpbmcgcHJpbnRrKCkuDQoNCj4gRmluYWxseSwgZHJvcCB0aGUgcnVudGltZSBO
VUxMIHBvaW50ZXIgY2hlY2tzLiAgSXQgaXMgbm90IHRlcnJpYmx5IGFwcHJvcHJpYXRlDQo+IHRv
IGJlIHJlcGVhdGVkbHkgY2hlY2tpbmcgaW5mcmFzdHJ1Y3R1cmUgd2hpY2ggaXMgc2V0IHVwIGZy
b20gc3RhcnQtb2YtZGF5LA0KPiBhbmQgaW4gdGhpcyBjYXNlLCBhY3R1YWxseSBoaWQgdGhlIGFi
b3ZlIGJ1Zy4NCg0KSSBkb24ndCBzZWUgaG93IHRoZSByZXBlYXRlZCBjaGVja2luZyB3b3VsZCBo
YXZlIGhpZGRlbiBhbnkgYnVnOiBEdWUNCnRvIHRoZSBsYWNrIG9mIHRoZSBleHRyYSBpbmRpcmVj
dGlvbiB0aGUgcG9pbnRlciB3b3VsZCBoYXZlIHJlbWFpbmVkDQpOVUxMLCBhbmQgaGVuY2UgdGhl
IGxvZyBtZXNzYWdlIHdvdWxkIGhhdmUgYXBwZWFyZWQgKGFzIGFsc28NCm1lbnRpb25lZCBhYm92
ZSkgX3VudGlsXyB5b3UgaGFkIGZpeGVkIHRoZSBpbmRpcmVjdGlvbiBtaXN0YWtlLiAoVGhpcw0K
aXNuJ3QgdG8gbWVhbiBJJ20gYWdhaW5zdCBkcm9wcGluZyB0aGUgY2hlY2ssIEknZCBqdXN0IGxp
a2UgdG8NCnVuZGVyc3RhbmQgdGhlIHdoeS4pDQoNCj4gQEAgLTkyMiwxMSArOTIyLDEwIEBAIHN0
YXRpYyB2b2lkIHZ2bWNzX3RvX3NoYWRvd19idWxrKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBp
bnQgbiwNCj4gICAgICAgaWYgKCAhY3B1X2hhc192bXhfdm1jc19zaGFkb3dpbmcgKQ0KPiAgICAg
ICAgICAgZ290byBmYWxsYmFjazsNCj4gICANCj4gLSAgICBpZiAoICF2YWx1ZSB8fCBuID4gVk1D
U19CVUZfU0laRSApDQo+ICsgICAgaWYgKCBuID4gVk1DU19CVUZfU0laRSApDQo+ICAgICAgIHsN
Cj4gLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLCAidm1jcyBzeW5jIGZhbGwgYmFjayB0
byBub24tYnVsayBtb2RlLCAiDQo+IC0gICAgICAgICAgICAgICAgICJidWZmZXI6ICVwLCBidWZm
ZXIgc2l6ZTogJWQsIGZpZWxkcyBudW1iZXI6ICVkLlxuIiwNCj4gLSAgICAgICAgICAgICAgICAg
dmFsdWUsIFZNQ1NfQlVGX1NJWkUsIG4pOw0KPiArICAgICAgICBwcmludGtfb25jZShYRU5MT0df
RVJSICIlcHYgVk1DUyBzeW5jIHRvbyBtYW55IGZpZWxkcyAldVxuIiwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgdiwgbik7DQo+ICAgICAgICAgICBnb3RvIGZhbGxiYWNrOw0KPiAgICAgICB9DQo+
ICAgDQo+IEBAIC05NjIsMTEgKzk2MSwxMCBAQCBzdGF0aWMgdm9pZCBzaGFkb3dfdG9fdnZtY3Nf
YnVsayhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IG4sDQo+ICAgICAgIGlmICggIWNwdV9o
YXNfdm14X3ZtY3Nfc2hhZG93aW5nICkNCj4gICAgICAgICAgIGdvdG8gZmFsbGJhY2s7DQo+ICAg
DQo+IC0gICAgaWYgKCAhdmFsdWUgfHwgbiA+IFZNQ1NfQlVGX1NJWkUgKQ0KPiArICAgIGlmICgg
biA+IFZNQ1NfQlVGX1NJWkUgKQ0KPiAgICAgICB7DQo+IC0gICAgICAgIGdkcHJpbnRrKFhFTkxP
R19ERUJVRywgInZtY3Mgc3luYyBmYWxsIGJhY2sgdG8gbm9uLWJ1bGsgbW9kZSwgIg0KPiAtICAg
ICAgICAgICAgICAgICAiYnVmZmVyOiAlcCwgYnVmZmVyIHNpemU6ICVkLCBmaWVsZHMgbnVtYmVy
OiAlZC5cbiIsDQo+IC0gICAgICAgICAgICAgICAgIHZhbHVlLCBWTUNTX0JVRl9TSVpFLCBuKTsN
Cj4gKyAgICAgICAgcHJpbnRrX29uY2UoWEVOTE9HX0VSUiAiJXB2IFZNQ1Mgc3luYyB0b28gbWFu
eSBmaWVsZHMgJXVcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgIHYsIG4pOw0KDQpXb3VsZCB5
b3UgbWluZCB0YWtpbmcgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGRpc2FtYmlndWF0ZSB0aGUg
dHdvDQpsb2cgbWVzc2FnZXMsIHNvIHRoYXQgZnJvbSBvYnNlcnZpbmcgb25lIGl0IGlzIGNsZWFy
IHdoaWNoIGluc3RhbmNlDQppdCB3YXMgdGhhdCBnb3QgdHJpZ2dlcmVkPw0KDQpKYW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
