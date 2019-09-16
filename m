Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61365B3ADA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 14:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9qYL-0005fU-5H; Mon, 16 Sep 2019 12:56:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aiU4=XL=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i9qYJ-0005fI-EU
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 12:56:23 +0000
X-Inumbo-ID: 6229d3b0-d881-11e9-b76c-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6229d3b0-d881-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568638582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9iuRsh+xHYGZR0HQ2YkGVws4GHD6WIC2TTwvvv5PdEA=;
 b=K6AYge+Kjg9J+wyzCJNkS7oRtZaVju4uzlubFitmmeL9tsM7Q0RqTiyX
 nCTnw3leWCdfv47SP8t+h7FksJ5yTStjxkJ56aO52BfaO84u0tX86hQU0
 venvGMUXXlaMw+rBgqxDAO5gcrUmV2L2CT+Nd5Ktnt7O0aEYPj3e4hVBy Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cIJqDKTd9h/b98VwJ99P4emMqZE6trti++F+xcGz1hIKW3xafgD4EsrWv8F6d4EOUAwLchIzTv
 Hn42PBq8SMuyu2VRw+j3/BxRlwn8PoqUg1OzeT+EhMVgwYlK0g+CmXXCmcUgvAu5NVoFDo9+JE
 bsQ9Il33vLxnx3SoOuA71h4oIIpT3XGbIjsgfF3KfimBeItjt1mDnZJ4gDDmbYC8vj8VkLL48A
 cq/i82UfsATb16fJp73iED0Zum3OX5e53iQGWXqKY5zCSi8+33vz/jxKVaxvtD5BlwVxGHwE94
 ylI=
X-SBRS: 2.7
X-MesageID: 5811992
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,512,1559534400"; 
   d="scan'208";a="5811992"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL print message
Thread-Index: AQHVakzfjc+5AN/Pck2FIcRisbbuAqcsonAQgAGBTICAACG5sA==
Date: Mon, 16 Sep 2019 12:56:15 +0000
Message-ID: <3a73e41c33f24bbbbae1f6deb5a9e05e@AMSPEX02CL03.citrite.net>
References: <20190913160404.495-1-andrew.cooper3@citrix.com>
 <02785fd186584f12bf364a6949ff8a4d@AMSPEX02CL03.citrite.net>
 <302a0acc-618f-5793-5840-36d80881d07f@citrix.com>
In-Reply-To: <302a0acc-618f-5793-5840-36d80881d07f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL
 print message
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxNiBTZXB0ZW1iZXIgMjAxOSAxMzo0OA0K
PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IFhlbi1kZXZlbCA8
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHg4Ni92aXJpZGlhbjog
UmV3b3JkIEhWX1g2NF9NU1JfQ1JBU0hfQ1RMIHByaW50IG1lc3NhZ2UNCj4gDQo+IE9uIDE1LzA5
LzIwMTkgMTI6NTEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCj4gPj4gU2VudDogMTMgU2VwdGVtYmVyIDIwMTkgMTc6MDQNCj4gPj4gVG86IFhlbi1k
ZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiA+PiBDYzogQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+Ow0KPiA+PiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIXSB4ODYvdmlyaWRpYW46IFJld29yZCBIVl9YNjRf
TVNSX0NSQVNIX0NUTCBwcmludCBtZXNzYWdlDQo+ID4+DQo+ID4+IE1lc3NhZ2Ugc3VjaCBhczoN
Cj4gPj4NCj4gPj4gICAoWEVOKSBkM3YwIFZJUklESUFOIENSQVNIOiA1MSAxIGZmZmY5NzAwZTE0
NmIwMDAgMTAwMCAyMDQNCj4gPj4NCj4gPj4gaGF2ZSBjb25mdXNlZCBtYW55IHBlb3BsZSBpbnRv
IHRoaW5raW5nIHRoZSB0aGUgcHJvYmxlbSBpcyBhIGJ1ZyBpbiB0aGUNCj4gPj4gdmlyaWRpYW4g
Y29kZS4gIFRoZSBwcmVmaXggd2FzIGludGVuZGVkIHRvIHNpZ25pZnkgdGhlIHVzZSBvZiB0aGUg
dmlyaWRpYW4NCj4gPj4gY3Jhc2gtcmVwb3J0aW5nIGludGVyZmFjZS4NCj4gPj4NCj4gPj4gUmVw
bGFjZSB0aGUgVklSSURJQU4gcHJlZml4IHdpdGggJ3JlcG9ydGVkJyB0byByZWR1Y2UgdGhlIGNv
bmZ1c2lvbiB0bw0KPiA+PiBub24teGVuLWRldmVsb3BlcnMgdHJ5aW5nIHRvIGludGVycHJldCB0
aGUgbWVzc2FnZS4NCj4gPiBUaGlzIGlzIGEgbWVzc2FnZSB0aGF0IGlzIHBlY3VsaWFyIHRvIFdp
bmRvd3MgVk1zLCBzbyBob3cgYWJvdXQgIldpbmRvd3MgVk0gQ1JBU0giPw0KPiANCj4gSSBwcmVz
dW1lIHlvdSBtZWFuIHBhcnRpY3VsYXIsIGJ1dCBubyAtIGl0IGlzbid0IHdpbmRvd3Mgd2hpY2gg
aXMgdGhlDQo+IGV4Y2x1c2l2ZSB1c2VyIG9mIHRoaXMgaW50ZXJmYWNlLsKgIExpbnV4IGhhcyBh
IGRyaXZlciB0byB1c2UgaXQgd2hlbg0KPiBydW5uaW5nIHVuZGVyIEh5cGVyVi4NCg0KSG1tLCB0
aGF0J3MgYSBiaXQgb2RkLiBJIHRob3VnaHQgdGhlIGNyYXNoIGNvZGVzIGFyZSBXaW5kb3dzIHNw
ZWNpZmljLiBQZXJoYXBzIHRoZXkgY2FuIGJlIGRpc3Rpbmd1aXNoZWQgaW4gc29tZSB3YXkuIEFs
bCB0aGUgc2FtZSwgdGhlIGxvZyBsaW5lIG5lZWRzIHRvIGxlYWQgcGVvcGxlIHRvIHNvbWUgd2F5
IG9mIGRlY29kaW5nIHRoZSBtYWdpYyBudW1iZXJzIEkgdGhpbmsuIEhvdyBhYm91dDoNCg0KIlZJ
UklESUFOIFJFUE9SVEVEIENSQVNIIg0KDQo/DQoNCiAgUGF1bA0KDQo+IA0KPiB+QW5kcmV3DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
