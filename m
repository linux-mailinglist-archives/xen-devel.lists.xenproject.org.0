Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08FBB5C2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOgS-0002uT-NJ; Mon, 23 Sep 2019 13:47:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCOgR-0002uM-Hx
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:47:19 +0000
X-Inumbo-ID: a8b7792c-de08-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8b7792c-de08-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569246438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AYFq2i8knPDz3ALpjzlRbo3fwp6uuPQzBBpaGkhos4I=;
 b=R1ySWd8F6GtuQwSsZe0sQTdCoqV+WkZCPV8UFCTFKcdHcBVGjOyp+VTO
 CIVLZAn1q3+eHv3mBZd6jMjTcS3ejPnZAAa8e3liJsU78pB4m1H6sSoGb
 fBdLQhHhN/BG77LbZwAwCyIgKkGP2Wkg+7VBy/d3xpQcug/mnNlqx0O0C 0=;
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
IronPort-SDR: +gEA3oBBFBQx6fq5EIgFz9x/wt1MaKTc4asgVZvbOn4KkqWjbvUP7lyQP8gGz8hHI3I/3WmoU+
 /2x4DjtZ0kFo93X8gMNYlx6voAosHhQ0DVw0UXEElYy63y9sLx6ivyexB0RqTohk/JRmurkLBw
 pxU/dYsxS60mX0m0eILlkxfzNSC+5PzNaOBbOBpgELbw0cckaXXGZSwBMvvApE7vu5nU12IwQu
 x/S4rRVGhwa4aGTvmE8IqbJbJSiFxpQvizQoUNVpUJQKsmbz+yWHJ0XUz9vYWYK6xoRtROqs8j
 Psw=
X-SBRS: 2.7
X-MesageID: 6145167
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="6145167"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Wei Liu' <wl@xen.org>
Thread-Topic: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
Thread-Index: AQHVcfc0mf3MiCY5wEmvlk07Intk2qc5FCDA///qIQCAACrzIP//7WuAgAAK6oCAACOUgA==
Date: Mon, 23 Sep 2019 13:47:14 +0000
Message-ID: <7266c9a91c7c4dcba0aab375fa5aad08@AMSPEX02CL03.citrite.net>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
 <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
 <20190923125431.mpoyvjj7dz6ef4df@debian>
 <20190923133335.ktlnpbxqnanraytq@debian>
In-Reply-To: <20190923133335.ktlnpbxqnanraytq@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMjMgU2VwdGVtYmVyIDIwMTkgMTQ6MzQKPiBUbzogUGF1bCBEdXJyYW50IDxQYXVs
LkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogJ1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsgWGVuIERl
dmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdlaSBMaXUK
PiA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleQo+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIGZvci1uZXh0IFJG
QyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiAKPiBBbmQgYSBiaXQgbW9yZSB0aG91Z2h0Lgo+
IAo+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDAxOjU0OjMxUE0gKzAxMDAsIFdlaSBMaXUgd3Jv
dGU6Cj4gWy4uLl0KPiA+ID4gPgo+ID4gPiA+IFBlciBUTEZTLCBlVk1DUyBzaG91bGQgYmUgdXNl
ZCBieSBMMSBYZW4uCj4gPiA+Cj4gPiA+IFllcywgSSBndWVzcyBpdCBvbmx5IG5lZWRzIHRvIGJl
IHVzZWQgYnkgTDEsIGJ1dCBXaW5kb3dzIGlzIHVzaW5nIGFuCj4gPiA+IGluY3JlYXNpbmcgbnVt
YmVyIG9mIFZNcyBmb3IgdmFyaW91cyBwdXJwb3NlcyBzbyBJIHRoaW5rIG1ha2luZyBpdAo+ID4g
PiBzdGFjayB3ZWxsIHdvdWxkIGJlIHVzZWZ1bC4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IE5vdCBz
dXJlIHdoYXQgeW91IG1lYW50IGJ5IEVQVCBmbHVzaC4gSWYgeW91IG1lYW4gdGhpbmdzIGxpa2UK
PiA+ID4gPiBIdkZsdXNoR3Vlc3RQaHlzaWNhbEFkZHJlc3NTcGFjZSwgSSB0aGluayB0aGV5IHNo
b3VsZCBiZSB1c2VkIGJ5IFhlbgo+ID4gPiA+IG9ubHkgYXMgd2VsbC4gSSdtIG5vdCBzdXJlIHdo
ZXRoZXIgdGhleSBzaG91bGQgYmUgZXhwb3NlIHRvIEwyIGd1ZXN0cy4KPiA+ID4gPgo+ID4gPgo+
ID4gPiBZZXMsIHRoYXQncyB3aGF0IEkgbWVhbnQgYW5kLCBhZ2FpbiwgSSB3YXMgdGhpbmtpbmcg
YWJvdXQgdGhlIG5lc3RlZAo+ID4gPiBXaW5kb3dzIGd1ZXN0IHVzaW5nIFZNcyBpdHNlbGYuCj4g
Pgo+ID4gU28gdGhpcyBpcyBiYXNpY2FsbHkgbmVzdGVkIG9uIG5lc3RlZC4gSSdtIG5vdCBzdXJl
IGhvdyB0byBtYWtlIHRoYXQKPiA+IHdvcmsgeWV0LiAgSSdtIGFsc28gbm90IHN1cmUgaG93IHdl
bGwgdGhlc2UgaW50ZXJmYWNlcyBzdGFjay4gVExGUyBvbmx5Cj4gPiBkZXNjcmliZXMgb25lIGxl
dmVsIG9mIG5lc3RpbmcuIEkgd2lsbCBuZWVkIHRvIGFzayBpZiB3ZSBjYW4gbWFrZSBuZXN0ZWQK
PiA+IG9uIG5lc3RlZCB3b3JrLgo+ID4KPiAKPiBTaW5jZSBMMiBSb290IGlzIFdpbmRvd3MgaW4g
YSBIeXBlci1WIHNldHVwLCBjaGFuY2VzIGFyZSB3aGF0IHlvdSB3YW50Cj4gYWxyZWFkeSB3b3Jr
cy4gT2YgY291cnNlIHRoaXMgZGVwZW5kcyBvbiB3aGV0aGVyIFdpbmRvd3MsIHdoZW4gcnVubmlu
Zwo+IGFzIFJvb3Qgb3IgQ2hpbGQsIHVzZXMgVk0gcmVsYXRlZCBmZWF0dXJlcy4KPiAKPiBJJ20g
bm90IHZlcnNlZCBpbiBXaW5kb3dzIGZlYXR1cmVzLiBJZiB5b3UgaGF2ZSBzcGVjaWZpYyB0aGlu
Z3MgaW4gbWluZCwKPiBJIGNhbiBhc2sgZm9yIG1vcmUgZGV0YWlscyBhbmQgdGhpbmsgYWJvdXQg
aG93IHRvIGltcGxlbWVudCB0aGVtIGluIFhlbi4KCldlbGwsIGVWTUNTIHdvdWxkIGJlIGEgbWFq
b3Igb25lLiBJZiB0aGUgTDIgV2luZG93cyBjb3VsZCBiZSB0b2xkIHRvIHVzZSB0aGF0IHJhdGhl
ciB0aGFuIEwwIGhhdmUgdG8gYm91bmNlIGluZGl2aWR1YWwgVk1SRUFEL1ZNV1JJVEVzIHVwIHRv
IEwxIHRoZW4gdGhhdCB3b3VsZCBiZSBhIHdpbi4KCiAgUGF1bAoKPiAKPiBXZWkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
