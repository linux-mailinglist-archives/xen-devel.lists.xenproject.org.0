Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40171A6A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 16:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvn3-0001IV-2D; Tue, 23 Jul 2019 14:29:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpvn2-0001IQ-1Q
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 14:29:16 +0000
X-Inumbo-ID: 3ee73211-ad56-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3ee73211-ad56-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 14:29:14 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q0ML/w10PlAt2kHdY7Ls/486HNiJAN3Xh9KHT6JBKZQXDZ9XJcAGUNfh/jUwWUPNWip3j435xE
 u1FPx+QoaZV6UR+H9z5XoA+Qx0bBCuDbcQHjmoLF4DU5k8ncQcTWkc/nHf8uYZWx/rGnlLnrDZ
 2dUQ2D86CpJTVJz5mmIg+Xd2/UOozP2WjhsLnBfT4C4tdtZEUFBTkMKZk6r6dc/JgKq/7c/tA5
 28xoz21HeFhuugehm7t4MypmpTmVv/Mpg4InYcFtHGqk764i8Iy3dZrdNcWQeRaj24fxfciTJk
 3YU=
X-SBRS: 2.7
X-MesageID: 3315886
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3315886"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <dfc90ddc-5d6e-6da7-f820-97c7823ec540@citrix.com>
 <73a52696-39ef-14f6-04cc-e2dc9a8c5ee8@suse.com>
 <cc078685-aae5-5382-1422-13cafeee7129@citrix.com>
 <c80e9174-c153-f6f3-af51-1e8ea3fb940a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8d6583b1-fad6-b192-077d-cd760669a252@citrix.com>
Date: Tue, 23 Jul 2019 15:29:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c80e9174-c153-f6f3-af51-1e8ea3fb940a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDcvMjAxOSAxNToxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy4wNy4xOSAx
NTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjMvMDcvMjAxOSAxNDoyNSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IE9uIDIzLjA3LjE5IDE0OjI2LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDIzLzA3LzIwMTkgMTA6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4KPj4+
Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoCDCoMKgwqDCoMKgIC8qCj4+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+
Pj4+IGluZGV4IGI0MGM4ZmQxMzguLjcyMWM0Mjk0NTQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+
Pj4+IEBAIC0yMDAsNyArMjAwLDEwIEBAIHN0cnVjdCB2Y3B1Cj4+Pj4+IMKgwqDCoMKgwqDCoCAv
KiBWQ1BVIGlzIHBhdXNlZCBmb2xsb3dpbmcgc2h1dGRvd24gcmVxdWVzdAo+Pj4+PiAoZC0+aXNf
c2h1dHRpbmdfZG93bik/ICovCj4+Pj4+IMKgwqDCoMKgwqDCoCBib29swqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBhdXNlZF9mb3Jfc2h1dGRvd247Cj4+Pj4+IMKgwqDCoMKgwqDCoCAvKiBWQ1BV
IG5lZWQgYWZmaW5pdHkgcmVzdG9yZWQgKi8KPj4+Pj4gLcKgwqDCoCBib29swqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGFmZmluaXR5X2Jyb2tlbjsKPj4+Pj4gK8KgwqDCoCB1aW50OF90wqDCoMKg
wqDCoMKgwqDCoMKgIGFmZmluaXR5X2Jyb2tlbjsKPj4+Pj4gKyNkZWZpbmUgVkNQVV9BRkZJTklU
WV9PVkVSUklERcKgwqDCoCAweDAxCj4+Pj4+ICsjZGVmaW5lIFZDUFVfQUZGSU5JVFlfTk1JwqDC
oMKgwqDCoMKgwqDCoCAweDAyCj4+Pj4KPj4+PiBWQ1BVX0FGRklOSVRZX05NSV9NQ0UgP8KgIEl0
IGlzIHVzZWQgZm9yIG1vcmUgdGhhbiBqdXN0IE5NSXMuCj4+Pgo+Pj4gT2theS4KPj4+Cj4+PiBC
VFc6IFRoZSBNQ0UgY2FzZSBpcyBuZXZlciB0cmlnZ2VyZWQgKHRoZXJlIGlzIG5vIGNhbGxlciBv
Zgo+Pj4gcHZfcmFpc2VfaW50ZXJydXB0KCkgd2l0aCBUUkFQX21hY2hpbmVfY2hlY2spLiBJcyB0
aGlzIGNvZGUgbGVmdCBpbgo+Pj4gcGxhY2Ugb24gcHVycG9zZSBvciBjb3VsZCBpdCBiZSByZW1v
dmVkPwo+Pgo+PiBJdCBjb21lIGZyb20gdGhlIHJlc3RvcmVfYWxsX2d1ZXN0IHBhdGggaW4gYXNz
ZW1ibHksIHZpYSBwcm9jZXNzX21jZS4KPgo+IEFyZSB5b3Ugc3VyZT8gSSBjYW4gc2VlIHRoYXQg
aXQgd291bGQgY2FsbAo+IHNldF9ndWVzdF9tYWNoaW5lY2hlY2tfdHJhcGJvdW5jZSgpLCBidXQg
SSBkb24ndCBzZWUgaG93IE5NSV9NQ0VfU09GVElSUQo+IHdvdWxkIGJlIHRyaWdnZXJlZCBvbiB0
aGlzIHBhdGgsIHdoaWNoIHdvdWxkIGJlIHJlcXVpcmVkIGZvciBoaXR0aW5nCj4gbm1pX21jZV9z
b2Z0aXJxKCkuCgpMb29raW5nIGF0IGl0LCBJJ20gbm90IHNvIHN1cmUuLi4KClRoZXJlIGlzIGNl
cnRhaW5seSByb29tIGZvciBmdXJ0aGVyIGNsZWFuLXVwIGhlcmUsIGZvciBhbnlvbmUgd2l0aApl
bm91Z2ggdGltZSB0byBkaXNlbnRhbmdsZSB0aGlzIHJhdHMgbmVzdC4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
