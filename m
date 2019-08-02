Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6657F6A5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 14:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htWPI-0002rf-SH; Fri, 02 Aug 2019 12:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A8xe=V6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1htWPH-0002ra-NY
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 12:11:35 +0000
X-Inumbo-ID: aa175516-b51e-11e9-a8b0-d7b0be4abcc7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa175516-b51e-11e9-a8b0-d7b0be4abcc7;
 Fri, 02 Aug 2019 12:11:32 +0000 (UTC)
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
IronPort-SDR: OlLn7YOS3b0BQNsaJbeG9l9Ga0SynZwCcWowfX4gCnTKP5mAqwNwNmVNrAhjQpNhifO4C612zq
 INuaKjwLWmZXf28QUc0EVAxXmMeX1y5Fm8kFDf6yhi1DFs47YQ60Ce5myg8QDMD3mzPSjhVhGP
 z+RWmQFzn2+BjJrV1Ntq8T6TyBSidW5xLdm1RTZJ6y/0R54Xz21R0Bt4qaHbjOKDlQBqNCFA13
 MjdM1y4e5oAie96Fvk5LgBHlz/O86lxE/INYwJOvXMvqbEsBwEBQ2i759xYC6gIPX639KA0ygB
 CPs=
X-SBRS: 2.7
X-MesageID: 3773053
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3773053"
To: Dario Faggioli <dfaggioli@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 <xen-devel@lists.xenproject.org>
References: <156413540514.22784.14073005924861814163.stgit@Palanthas>
 <65d9c6bf-3eec-59d0-a070-8142f34d9e15@cardoe.com>
 <40213dac0d5d431c4cbc39efdeab23a222ddcc90.camel@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b6b94de3-9fb5-5df4-81b6-60028033f985@citrix.com>
Date: Fri, 2 Aug 2019 13:11:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40213dac0d5d431c4cbc39efdeab23a222ddcc90.camel@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] ci: install C++ in opensuse-leap CI
 container
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDgvMjAxOSAxMzowMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gTW9uLCAyMDE5
LTA3LTI5IGF0IDEyOjE4IC0wNTAwLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPj4gT24gNy8yNi8x
OSA1OjAzIEFNLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4KPj4+IFRoZSBvcGVuU1VTRSBMZWFw
IGNvbnRhaW5lciBpbWFnZSwgYnVpbHQgYWZ0ZXIKPj4+IG9wZW5zdXNlLWxlYXAuZG9ja2VyZmls
ZSB3YXMgbWlzc2luZyB0aGUgZ2NjLWMrKywKPj4+IHdoaWNoIGlzIG5lY2Vzc2FyeSwgZS5nLiwg
Zm9yIGJ1aWxkaW5nIE9WTUYuCj4+Pgo+Pj4gQWRkIGl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IENjOiBEb3Vn
IEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4+PiAtLS0KPj4gQWNrZWQtYnk6IERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPj4KPiBIZXksIHNvcnJ5LCBJIG1pc3NlZCB0
aGlzIG1haWwuIFRoYW5rcyBmb3IgdGhlIEFjay4KPgo+PiBXaWxsIHlvdSBiZSBwdXNoaW5nIHRo
ZSByZWJ1aWx0IGNvbnRhaW5lciBvciBkbyB5b3UgbmVlZCBtZSB0byBkbwo+PiB0aGF0Pwo+Pgo+
IEkgdHJpZWQgdG8gcHVzaCwgYnV0Ogo+Cj4gJCBQVVNIPTEgbWFrZSBzdXNlL29wZW5zdXNlLWxl
YXAKPiBkb2NrZXIgYnVpbGQgLXQgcmVnaXN0cnkuZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4v
c3VzZTpvcGVuc3VzZS1sZWFwIC1mIHN1c2Uvb3BlbnN1c2UtbGVhcC5kb2NrZXJmaWxlIHN1c2UK
PiBTZW5kaW5nIGJ1aWxkIGNvbnRleHQgdG8gRG9ja2VyIGRhZW1vbiAgNC42MDhrQgo+IFN0ZXAg
MS83IDogRlJPTSBvcGVuc3VzZS9sZWFwCj4gIC0tLT4gZGQ0YmY4OTRkMjQzCj4gU3RlcCAyLzcg
OiBMQUJFTCBtYWludGFpbmVyLm5hbWU9IlRoZSBYZW4gUHJvamVjdCIgICAgICAgbWFpbnRhaW5l
ci5lbWFpbD0ieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIgo+IC4uLgo+IC4uLgo+IC4u
Lgo+IFN1Y2Nlc3NmdWxseSBidWlsdCBjNzgzODhmZjM3MGIKPiBTdWNjZXNzZnVsbHkgdGFnZ2Vk
IHJlZ2lzdHJ5LmdpdGxhYi5jb20veGVuLXByb2plY3QveGVuL3N1c2U6b3BlbnN1c2UtbGVhcAo+
IFRoZSBwdXNoIHJlZmVycyB0byByZXBvc2l0b3J5IFtyZWdpc3RyeS5naXRsYWIuY29tL3hlbi1w
cm9qZWN0L3hlbi9zdXNlXQo+IDAwN2NiOGM3ZjMwNTogUHJlcGFyaW5nIAo+IGIzOTlmY2NiMDBm
NzogUHJlcGFyaW5nIAo+IDcwZWExZjE4NTczYjogUHJlcGFyaW5nIAo+IDIzNzljZjcxMDFlMjog
UHJlcGFyaW5nIAo+IGRlbmllZDogcmVxdWVzdGVkIGFjY2VzcyB0byB0aGUgcmVzb3VyY2UgaXMg
ZGVuaWVkCj4gbWFrZTogKioqIFtNYWtlZmlsZToxNDogc3VzZS9vcGVuc3VzZS1sZWFwXSBFcnJv
ciAxCj4KPiA6LSkKPgo+IFNvLCBJIGd1ZXNzIHNvbWVvbmUgZWxzZSwgd2l0aCBlbm91Z2ggcmln
aHRzLCB3b3VsZCBoYXZlIHRvIGRvIHRoYXQuCj4KPiBPciBhbSBJIG1pc3Npbmcgc29tZSBhdXRo
IHN0ZXAgb3IgYW9tZXRoaW5nPwoKWW91IG5lZWQgdG8gZG8gYSBkb2NrZXIgbG9naW4gdG8gdGhl
IHJlZ2lzdHJ5LgoKU2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS9oZWxwL3VzZXIvcHJvamVjdC9jb250
YWluZXJfcmVnaXN0cnkKClRoZW4gdGhlIHB1c2ggc2hvdWxkIHdvcmsuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
