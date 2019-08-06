Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18787839E4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 21:53:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv5Ul-0001IV-D0; Tue, 06 Aug 2019 19:51:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XUhE=WC=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hv5Uj-0001IQ-0h
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 19:51:41 +0000
X-Inumbo-ID: 9a7cd84c-b883-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::62f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a7cd84c-b883-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 19:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J38rtVUlFLDFRdSuf/mXOeQ/Vwki7o8ikLEfdHWiGjl0rKK+dr8qvWuXsbA93xxK/du5rI32RbtrpMJsVSjfADrYSAvP9jUEAbBhxYzE7uGPzySysMlRKs9WCz5gtZ4Ki0jcjIOxEuQfszwGctm3kxGC/e+HENJdrnBE3LM+wd3nRuZ23G3aUgAH43dPvD3sKSDPECLz1T+6jR8cl5Cx66+S+YGJcuMXYbI+reLOl22NtXLVsIul7bAQs6uSJWcewPspwxJM/ViCRZ8SbYLXsWR3rEF1dWcP2NsAUqa2d0oT/o9BFq6KQiAjB+dXxJWU5JS7/xwDypeysaoYwfmRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHkWOSqyPXIegIGPw4ZaV24ElYWmS7SQ2w1ONmn8xGE=;
 b=JQIKEZ0z06JbYNgNe4pv3C/KhmXvpga+PLWLcjo7CGiiBNQNXmaWw7IDlDwf8i9lGtIY16B2m+ISi9wbapfoWxJ6JSCrX06uGpKdMyGyZMEJeJr/YWE7zS7zE2f2nNa6tLfgLQJWgoqm3psElQD7v70bKREQLimJ4lXN5creJcNIvgY+p1vjkOBlpbKrQ4cRGC1HeQ2ZBIEk0ItSIs/GNsdlthk8QYq9qWyA9Xjf2e0EKewunbXi2KqDHFwgdD8eNacZMrYkut/JUOIiPQ8HgOv44intAytkPM6oZZ2h24jAHv5S2cxnz3Vj31VY1RoGGa0Ts+34DMV6rZHNt+ZJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHkWOSqyPXIegIGPw4ZaV24ElYWmS7SQ2w1ONmn8xGE=;
 b=qjiW8wUws1LXIorfyZi7NgRKf+Nw60LqlKuiP+C9QwDCgWwOuRR6L56BkVC0uLySHsRooLAm/Xk5szEvXTqQH3IRu4T7o5WPtF+Jg6l67SzZgwr7pipRr5dezkiyOUx6nD9JrhI4jyfJUUvyGXY8xsEs2Q6L7tvRRPi74SQk2AiTlLG2yhaUbuouMHql1HdWHQVI5//OwjsDh6FVlA2ZoAw27FtsffP1rk9sIMG4FiOEpEIL3V6wovYJkB9MlCskatzv8/LTkFopKy94VKFLcedKJMT6sALTlPNb+llmpfAg/1EnXnFqhzwMBpaImOysmk8RNHbQ9LoYLY2L3XtDAw==
Received: from VI1PR03MB4159.eurprd03.prod.outlook.com (20.177.48.76) by
 VI1PR03MB3645.eurprd03.prod.outlook.com (52.134.22.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 6 Aug 2019 19:51:36 +0000
Received: from VI1PR03MB4159.eurprd03.prod.outlook.com
 ([fe80::b5a1:15f2:9a62:36d6]) by VI1PR03MB4159.eurprd03.prod.outlook.com
 ([fe80::b5a1:15f2:9a62:36d6%5]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 19:51:36 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce _xrealloc
 function
Thread-Index: AQHVS3WhxEP7sPmFBk6t/8cQy9ir3qbuicmA
Date: Tue, 6 Aug 2019 19:51:36 +0000
Message-ID: <87sgqegji0.fsf@epam.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
In-Reply-To: <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d059eeb-c4c9-4131-da88-08d71aa77dbe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR03MB3645; 
x-ms-traffictypediagnostic: VI1PR03MB3645:|VI1PR03MB3645:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB36452B9D7DDC8223097E7E69E6D50@VI1PR03MB3645.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(7416002)(53936002)(446003)(25786009)(14454004)(6506007)(6512007)(8936002)(6246003)(53546011)(80792005)(81166006)(81156014)(71190400001)(71200400001)(6486002)(4326008)(26005)(76176011)(2906002)(6916009)(478600001)(102836004)(55236004)(99286004)(229853002)(86362001)(5660300002)(11346002)(66066001)(6436002)(91956017)(7736002)(305945005)(76116006)(486006)(2616005)(36756003)(476003)(66946007)(66476007)(256004)(66556008)(64756008)(66446008)(54906003)(186003)(316002)(6116002)(3846002)(8676002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB3645;
 H:VI1PR03MB4159.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MfKx1FiOE1lxOwUslUw/ajDWy/+/x0x4gLQnERB7GLA5jXOzzs2RvuCQ0LL3h5vL3NVg4tzJ37+00TQ71VPQWl/R9wnJPpoFXDVPuRA97frkZi1JRFfKSDBkTYeTHWytlD6vgT6iMr24VECDH1SmriMO9bnh0CNqaekOtyHeFY5oULjdf8GXIhmWOANR5OVmEmii7Em2T+Z6pUiXxWfiYTv+wGfPEfnJVGtlzU0kiPD/lR+TlUta2pdG3zQ8oBVPvlX02HAs9No95RL6pZ/pqLnTo57jUlGuF/pdz7GySpPAfxxauxTDxPejAHZG2HcBzC4oD5Ai4zTrZcB5qe53zGa4LwEP0vljyJ+w8wiCx637RvdlGbEQfhFsPJK8PugOVv2i5Fm55/w6jnShi1FBpTMsXdGT2jZ+OWamcNSi5v4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d059eeb-c4c9-4131-da88-08d71aa77dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 19:51:36.6595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3645
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEphbiwKCkphbiBCZXVsaWNoIHdyaXRlczoKCj4gT24gMDIuMDguMjAxOSAxODozOSwgT2xl
a3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24veG1hbGxvY190bHNm
LmMKPj4gKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwo+PiBAQCAtNjEwLDYgKzYxMCwy
NyBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxp
Z24pCj4+ICAgICAgIHJldHVybiBwID8gbWVtc2V0KHAsIDAsIHNpemUpIDogcDsKPj4gICB9Cj4+
ICAgCj4+ICt2b2lkICpfeHJlYWxsb2Modm9pZCAqcCwgdW5zaWduZWQgbG9uZyBuZXdfc2l6ZSwg
dW5zaWduZWQgbG9uZyBhbGlnbikKPj4gK3sKPj4gKyAgICB2b2lkICpuZXdfcDsKPj4gKwo+PiAr
ICAgIGlmICggIW5ld19zaXplICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHhmcmVlKHApOwo+PiAr
ICAgICAgICByZXR1cm4gTlVMTDsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICBuZXdfcCA9IF94bWFs
bG9jKG5ld19zaXplLCBhbGlnbik7Cj4+ICsKPj4gKyAgICBpZiAoIG5ld19wICYmIHAgKQo+PiAr
ICAgIHsKPj4gKyAgICAgICAgbWVtY3B5KG5ld19wLCBwLCBuZXdfc2l6ZSk7Cj4+ICsgICAgICAg
IHhmcmVlKHApOwo+PiArICAgIH0KPj4gKwo+PiArICAgIHJldHVybiBuZXdfcDsKPj4gK30KPgo+
IFdoaWxlIEkgY2FuIHNlZSB3aHkgaGF2aW5nIGEgcmUtYWxsb2NhdGlvbiBmdW5jdGlvbiBtYXkg
YmUgaGFuZHksCj4gZXhwbGljaXQgLyBkaXJlY3QgdXNlIG9mIF94bWFsbG9jKCkgYW5kIF94emFs
bG9jKCkgYXJlIGRpc2NvdXJhZ2VkLAo+IGluIGZhdm9yIG9mIHRoZSBtb3JlIHR5cGUtc2FmZSB1
bmRlcnNjb3JlLWxlc3MgdmFyaWFudHMuIEkgY2FuJ3QKPiBzZWUgdGhvdWdoIGhvdyBhIHR5cGUt
c2FmZSAicmVhbGxvYyIgY291bGQgbG9vayBsaWtlLCBleGNlcHQgZm9yCj4gYXJyYXlzLiBJZiBy
ZXNpemluZyBhcnJheXMgaXMgYWxsIHlvdSdyZSBhZnRlciwgSSdkIGxpa2UgdG8KPiByZWNvbW1l
bmQgdG8gZ28gdGhhdCByb3V0ZSByYXRoZXIgdGhlbiB0aGUgc3VnZ2VzdGVkIG9uZSBoZXJlLiBJ
Zgo+IHJlc2l6aW5nIGFyYml0cmFyeSBvYmplY3RzIGlzIHRoZSBnb2FsLCB0aGVuIHdoYXQgeW91
IHN1Z2dlc3QgbWF5Cj4gYmUgdGhlIG9ubHkgcm91dGUsIGJ1dCBJJ2Qgc3RpbGwgYmUgbm90IG92
ZXJseSBoYXBweSB0byBzZWUgc3VjaAo+IGFkZGVkLgoKSSBjYW4gc2VlIDMgdXNlcyBmb3IgcmVh
bGxvYzoKCiBhLiByZS1hbGxvY2F0ZSBnZW5lcmljIGRhdGEgYnVmZmVyCiBiLiByZS1hbGxvY2F0
ZSBhcnJheQogYy4gcmUtYWxsb2NhdGUgc3RydWN0IHdpdGggZmxleGlibGUgYnVmZmVyLgoKb3B0
aW9uIGMuIGlzIGFib3V0IHN0cnVjdHVyZXMgbGlrZSB0aGlzOgoKc3RydWN0IGFycmxlbgp7CiAg
ICAgICAgc2l6ZV90IGxlbjsKICAgICAgICBpbnQgZGF0YVsxXTsKfTsKClRoaXMgaXMgT2xla3Nh
bmRyJ3MgY2FzZS4KClNvIGZvciBvcHRpb24gYS4gd2UgY2FuIHVzZSBfeHJlYWxsb2NhdGUocHRy
LCBzaXplLCBhbGlnbikKRm9yIG9wdGlvbiBiLiB3ZSBjYW4gdXNlIHhyZWFsbG9jX2FycmF5KF9w
dHIsIF90eXBlLCBfbnVtKQpBbmQgZm9yIG9wdGlvbiBjLiBJIHByb3Bvc2UgdG8gaW1wbGVtZW50
IHRoZSBmb2xsb3dpbmcgbWFjcm86CgojZGVmaW5lIHJlYWxsb2NfZmxleF9zdHJ1Y3QoX3B0ciwg
X3R5cGUsIF9maWVsZCwgX2xlbikgICAgICAgICAgICAgICAgICAgICAgICBcCiAoKF90eXBlICop
X3hyZWFsbG9jKF9wdHIsIG9mZnNldG9mKF90eXBlLCBfZmllbGRbX2xlbl0pICwgX19hbGlnbm9m
X18oX3R5cGUpKSkKCkl0IGNhbiBiZSB1c2VkIGluIHRoZSBmb2xsb3dpbmcgd2F5OgoKbmV3cHRy
ID0gcmVhbGxvY19mbGV4X3N0cnVjdChwdHIsIHN0cnVjdCBhcnJsZW4sIG5ld3NpemUpOwoKQXMg
eW91IGNhbiBzZWUsIHRoaXMgYXBwcm9hY2ggaXMgdHlwZS1zYWZlIGFuZCBjb3ZlcnMgT2xla3Nh
bnJkJ3MgY2FzZS4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
