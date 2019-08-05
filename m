Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02521816F8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 12:25:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hua86-0006Rb-Pf; Mon, 05 Aug 2019 10:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hua85-0006RV-3X
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 10:22:13 +0000
X-Inumbo-ID: d4ed91b2-b76a-11e9-b282-d386c4be8dab
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4ed91b2-b76a-11e9-b282-d386c4be8dab;
 Mon, 05 Aug 2019 10:22:11 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 10:21:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 10:21:27 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 10:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPKIBihLk9SNK0uKT7xYfRo1IkYTQcldyxyXB8uFs0NermCAu8X0Y2Un55jXa1y6q3qAqEj3G/FZKnswVqWUwTBpyrPsK75ritbrHerJpb39b/zAZEnQijYCYfMtI/OiszGU25gZmlxClIOvD+fLhZFqHftyg8N7Aw9smqez7qH9MAV81R/W/GkhaFxb5V9861bJflAUIGuvDF+cEODrUNzMQ1JISCl/VihEm3UipBvw+EWZOo7flb3+2LaIY+2r+KShal7XOC0vl/G6Eg+r4kui1QF1/XqIVifegv1c/Hj5g8PskTQDoC4yPdQMTmNUaJqG+8uoYuqxdBIVrpEwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC+Y2W+3uilgQkZPg4C+0j6vQRQDdhWc6Qs4gNXmfg4=;
 b=jDWgNbrBRJayKwjQiJmEHdfF6hIQZ5Gl0LLm8QhEbpZcNpb5aentxeZ60GBHVzaWgfM8SYneXDuyDH+s+WrQE+yvDGRavuK/gdaSk7NPOYu+rsduNO2MjUga3w2kg+ERLYVdQau8xbupdA16zEY1wVXW2ne3Re4/WCxJCzOGuDb6JSK/9e9JG2NZAu0rfTyywK2liPGPZPj+S9/JLVXtcuXM4KnStwBmQwUN5sTRN820mTlNTzSyM7ZT719JtFvfS/nMo+CVfpu91c6n0ulPeA+aM2KNkS4a0gPsaAql/2kFLgaOj7kHYJgOJM2RljBXa5/3QisUWKLiy5mjgki6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3037.namprd18.prod.outlook.com (20.179.81.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:21:26 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:21:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 3/4] xen/public: Document HYPERCALL_console_io()
Thread-Index: AQHVS3HlX+Sguj+jtEyHOttiG5U4NqbsVE8AgAAC5xWAAAD3AA==
Date: Mon, 5 Aug 2019 10:21:26 +0000
Message-ID: <cce4df00-d506-1920-42e4-2ac609cc296a@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
 <231b516e-5d23-167f-92c8-f9dcf717467d@arm.com>
 <6c0b17c8-2c50-ed56-702f-165bd692699b@suse.com>
 <cebbe948-924b-3d63-5be5-c5b693a882a8@arm.com>
In-Reply-To: <cebbe948-924b-3d63-5be5-c5b693a882a8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0034.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::47) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6788463d-cff3-48bd-59de-08d7198eac29
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3037; 
x-ms-traffictypediagnostic: MN2PR18MB3037:
x-microsoft-antispam-prvs: <MN2PR18MB303703FA8D535B57AB23B776B3DA0@MN2PR18MB3037.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(6436002)(229853002)(6916009)(6486002)(8936002)(31686004)(86362001)(53936002)(8676002)(81166006)(81156014)(6246003)(6512007)(31696002)(80792005)(11346002)(66066001)(446003)(476003)(186003)(26005)(478600001)(486006)(14454004)(102836004)(36756003)(14444005)(71200400001)(71190400001)(256004)(305945005)(76176011)(386003)(7736002)(6506007)(2616005)(6116002)(3846002)(66446008)(66946007)(66476007)(5660300002)(25786009)(4326008)(64756008)(66556008)(316002)(53546011)(52116002)(2906002)(54906003)(99286004)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3037;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yH1Dv4SCmft3XpV7Lii55nNL+bY6EhsLuIy4d87vQ41uJsOS2/BgLtiC3Ep6Wd0Tdqd1XWaMRHOgftZY2e7n/qrfa/kMQlx0yfFjjvymB2Sk0TMbZ6Wx+F3DizzVeTo+S5oOqmsnJ7OVygSvOw5WGB6BLk2OJXDh1J5+CW0z6Y6ww1ks0GtpXwn9f50aRo3B7kn8Y6gKEtCoQF1CLyrZyOeHrqQ0h0yO4ovgNTvCAacTnttWFL0G8lqjscxV4fST6P+LtL86PZdK5LhMbOHLnDGK/8DbXmv59r/72xZ0Fhy5UfGkGhpdBHAnQXwQN+BxiBcB2Od7HrmTJxobO7VupWDr1Xw4apFeySN7ZfoMmm7REcrhA6w8DefdW00sfSl1kFZYBxTkpuFLps2ozbvlCioLgD8K+aXoEHNJQLuNDPQ=
Content-ID: <1D7D0D9369006C4B85C4C2238B9CE96D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6788463d-cff3-48bd-59de-08d7198eac29
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:21:26.1575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3037
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxMjoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBKYW4sDQo+IA0K
PiBPbiAwNS8wOC8yMDE5IDExOjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA1LjA4LjIw
MTkgMTE6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDA5LzA0
LzIwMTkgMTI6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAwOS4wNC4xOSBhdCAx
MzoyNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCj4+Pj4+IE9uIDAzLzA0LzIwMTkg
MTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IEFsc28gcGxlYXNlIG5vdGUgdGhlIHF1
b3RhdGlvbiB1c2VkIGJ5IHRoZSBtZW50aW9uZWQNCj4+Pj4+PiBleGlzdGluZyBkb2MgY29tbWVu
dHMsIGFzIHdlbGwgYXMgYSBmZXcgb3RoZXIgZm9ybWFsIGFzcGVjdHMNCj4+Pj4+PiAobGlrZSB0
aGVtIGFsc28gbWFraW5nIGNsZWFyIHdoYXQgdGhlIHJldHVybiB0eXBlIGlzKS4gSSB0aGluaw0K
Pj4+Pj4+IHRoYXQncyBhIG1vZGVsIHVzZWQgZWxzZXdoZXJlIGFzIHdlbGwsIHNvIEkgdGhpbmsg
eW91IHNob3VsZA0KPj4+Pj4+IGZvbGxvdyBpdCBoZXJlLg0KPj4+Pj4NCj4+Pj4+IEkgaGF2ZW4n
dCByZXBsaWNhdGVkIHRoZSBgIGJlY2F1c2UgSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGV5IGFyZSB1
c2VkIGZvci4gSQ0KPj4+Pj4gd291bGQgYXBwcmVjaWF0ZSBpZiB5b3UgcHJvdmlkZSBwb2ludGVy
IGhvdyB0byB1c2UgdGhlbS4NCj4+Pj4NCj4+Pj4gV2VsbCwgSSBjYW4gb25seSBwb2ludCB5b3Ug
YXQgdGhlIGhpc3Rvcnkgb2YgdGhpbmdzLCBlLmcuDQo+Pj4+IDI2MmUxMThhMzcgImRvY3MvaHRt
bC86IEFubm90YXRpb25zIGZvciB0d28gaHlwZXJjYWxscyIuDQo+Pj4+DQo+Pj4+Pj4gVGhlIG90
aGVyIHRoaW5nIGlzOiBBcyBtZW50aW9uZWQgZWxzZXdoZXJlLCBJIGRvbid0IHRoaW5rIHRoZQ0K
Pj4+Pj4+IGZpcnN0IHR3byBwYXJhbWV0ZXJzIHNob3VsZCBiZSBwbGFpbiBpbnQuIEknbSBub3Qg
aGFwcHkgdG8gc2VlDQo+Pj4+Pj4gdGhpcyBwcm9saWZlcmF0ZSBpbnRvIGRvY3VtZW50YXRpb24g
YXMgd2VsbCwgaS5lLiBJJ2QgcHJlZmVyIGlmDQo+Pj4+Pj4gdGhpcyB3YXMgY29ycmVjdGVkIGJl
Zm9yZSBhZGRpbmcgZG9jdW1lbnRhdGlvbi4gV291bGQgeW91DQo+Pj4+Pj4gYmUgd2lsbGluZyB0
byBkbyB0aGlzLCBvciBzaG91bGQgSSBhZGQgaXQgdG8gbXkgdG9kbyBsaXN0Pw0KPj4+Pj4NCj4+
Pj4+IFdoaWxlIHN3aXRjaGluZyBmcm9tIGNtZCBmcm9tIHNpZ25lZCB0byB1bnNpZ25lZCBzaG91
bGQgYmUgb2suIFRoaXMgd291bGQNCj4+Pj4+IGludHJvZHVjZSBhIGRpZmZlcmVudCBiZWhhdmlv
ciBvZiBmb3IgY291bnQuDQo+Pj4+DQo+Pj4+IFNpbmNlIHRoaXMgcmVtb3ZlcyBhbiBlcnJvciBj
b25kaXRpb24sIEkgdGhpbmsgdGhpcyBpcyBhbiBva2F5IGNoYW5nZQ0KPj4+PiB0byBoYXBwZW4s
IHdpdGhvdXQgLi4uDQo+Pj4+DQo+Pj4+PiBBcmUgd2UgaGFwcHkgd2l0aCB0aGF0LCBvciBzaGFs
bCB3ZSBhZGQgYSBjaGVjayAoKGludCljb3VudCkgPiAwPw0KPj4+Pg0KPj4+PiAuLi4gYW55IHN1
Y2ggZXh0cmEgY2hlY2suIFRoaXMgYWxzbyBpc24ndCBnb2luZyB0byBpbnRyb2R1Y2UgYW55IG5l
dw0KPj4+PiByZWFsIHJpc2sgb2YgYSBsb25nIHJ1bm5pbmcgb3BlcmF0aW9uIG9yIHNvbWUgc3Vj
aCAtIGlmIDJHYiBvZiBpbnB1dA0KPj4+PiBkYXRhIGFyZSBmaW5lLCBJIGNhbid0IHNlZSB3aHkg
NEdiIHdvdWxkbid0IGJlLCB0b28uDQo+Pj4NCj4+PiBBY3R1YWxseSwgaXQgd2lsbCBub3QgYmUg
ZmluZSBhdCBsZWFzdCBmb3IgdGhlIHJlYWQgY2FzZS4gVGhlIHJldHVybiB2YWx1ZSBpcyBhIDMy
LWJpdCB2YWx1ZSAob24gQUFyY2gzMiBhbmQgaWYgeW91IHdhbnQgdG8ga2VlcCBjb21wYXQgYmV0
d2VlbiA2NC1iaXQgYW5kIDMyLWJpdCkuIEEgbmVnYXRpdmUgdmFsdWUgaW5kaWNhdGVzIGFuIGVy
cm9yLiBBcyB3ZSByZXR1cm4gdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIHJlYWQsIGl0IG1lYW5z
IHdlIGNhbiBvbmx5IGhhbmRsZSAyR0IuDQo+Pg0KPj4gSG1tLCB2YWxpZCBwb2ludC4NCj4+DQo+
Pj4gU28gSSB3b3VsZCByYXRoZXIgbGltaXQgdGhlIGJ1ZmZlciB0byAyR0IgZm9yIGV2ZXJ5b25l
Lg0KPj4NCj4+IFByb2JhYmx5IGZhaXIgZW5vdWdoIHRoZW4gKGlmIGV4cGxpY2l0bHkgc3RhdGVk
KS4gUGVyc29uYWxseSBJIHdvdWxkDQo+PiBuZXZlcnRoZWxlc3MgYWxsb3cgc2l6ZXMgdXAgdG8g
NEdiLTRrYiwgYnV0IEkgY2FuIHNlZSB3aHkgdGhpcyBtYXkNCj4+IG5vdCBiZSBsaWtlZCBieSBl
dmVyeW9uZS4gSSdkIGxpa2UgdG8gcG9pbnQgb3V0IHRob3VnaCB0aGF0IHRoZQ0KPj4gUFRSX0VS
UigpIG1hY2hpbmVyeSB3ZSd2ZSBpbmhlcml0ZWQgZnJvbSBMaW51eCB1dGlsaXplcyBleGFjdGx5
IHRoYXQuDQo+IA0KPiBXZWxsLCB0aGF0J3MgYSBjb25zb2xlIGJ1ZmZlci4gVGhlIGNoYW5jZSB5
b3UgaGF2ZSB3cml0ZS9yZWFkIG1vcmUgdGhhbiAyR0IgaW4gYSByb3cgaXMgdmVyeSB1bmxpa2Vs
eS4NCj4gDQo+IFNvIGl0IGZlZWxzIHRvIG1lIHRoYXQgZXhwb3NpbmcgUFRSX0VSUiguLi4pIGxp
a2UgaW50ZXJmYWNlIGlzIG5vdCB3b3J0aCBpdC4NCg0KU3VyZSwgaGVuY2UgbWUgaGF2aW5nIHNh
aWQgInBlcnNvbmFsbHkgSSB3b3VsZCAuLi4iIC0gSSBkb24ndCBleHBlY3QNCnlvdSB0byBnbyB0
aGF0IHJvdXRlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
