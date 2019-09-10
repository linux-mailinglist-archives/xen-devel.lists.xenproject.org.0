Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE9AEC76
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:55:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gaA-00032G-ID; Tue, 10 Sep 2019 13:53:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7ga9-00032B-1N
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:53:21 +0000
X-Inumbo-ID: 58d02e3a-d3d2-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58d02e3a-d3d2-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568123600;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wm/WDl8QS1ghZgAdPfmjKIYMMsuZSTEPzLn0D2r8/7E=;
 b=eE7F7SOhkNVTWyBkzb/0Sd3WCTX0tLYGfw9vuK8nyWlOXK4pIlEo1xY5
 oGkK0qBX7WgSuhORk26kEPWxhMz7FT8WWzf1UNrYooYIN2FnyTKuM2RZq
 Zka+TpewgBAsSXca4yH1ehd81gCMTpIFjbpn3XFANjj4EvsubMW/7mdej Q=;
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
IronPort-SDR: VMkCYkp+Ms0mrh6RJJLWKztp8x6zXDIa4+xzh/joVT3J7pUL6OOs0vtFJoo61l/aa+yv0lXsLh
 VCgAKdFA6Q01lLU5NOcaYIyUbRcwSdeed9WWW/1V7+UgQE+b9iES4luhuzdYEeYD/tgEijw44o
 S26je+1+c9f2NpeRvOiAAgoe0rJmQg/CjkwV8KvCslVMfhhLNPnr944muiQD4XguI02bqMoTCS
 O/zKNYkEplb1fs4Wt6p4PpZI4wqp111DvBzSXk1XUCmz1NcwmmM/lwgQdq3CSq6Olt6lEPeLIt
 liA=
X-SBRS: 2.7
X-MesageID: 5563869
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5563869"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2 01/11] ioreq: fix hvm_all_ioreq_servers_add_vcpu fail
 path cleanup
Thread-Index: AQHVYnKwXKcNObHIYUmMOM+OmK6Ekack0PiAgAABNICAAACEAIAAAf2AgAAkefA=
Date: Tue, 10 Sep 2019 13:53:16 +0000
Message-ID: <15cba5dcc4a14ab29e2f950de0929c01@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-2-roger.pau@citrix.com>
 <7a37466e-4bb8-2358-f940-42aa5426bdcb@suse.com>
 <20190910133315.i35z5jfmbxwl4kyi@Air-de-Roger>
 <d26f3f92-7b4d-82a5-121d-d3caec79b56a@suse.com>
 <20190910134213.3fj3q5vcv6oqowfc@Air-de-Roger>
In-Reply-To: <20190910134213.3fj3q5vcv6oqowfc@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMTAgU2VwdGVtYmVyIDIwMTkgMTQ6NDIKPiBUbzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVu
Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAxLzExXSBpb3JlcTogZml4IGh2bV9hbGxf
aW9yZXFfc2VydmVyc19hZGRfdmNwdSBmYWlsIHBhdGggY2xlYW51cAo+IAo+IE9uIFR1ZSwgU2Vw
IDEwLCAyMDE5IGF0IDAzOjM1OjA2UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gT24g
MTAuMDkuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwg
U2VwIDEwLCAyMDE5IGF0IDAzOjI4OjU3UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
Pj4gT24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+ID4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vaW9yZXEuYwo+ID4gPj4+IEBAIC0xMTk1LDcgKzExOTUsNyBAQCBpbnQgaHZtX2FsbF9pb3Jl
cV9zZXJ2ZXJzX2FkZF92Y3B1KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2KQo+ID4g
Pj4+ICAgICAgcmV0dXJuIDA7Cj4gPiA+Pj4KPiA+ID4+PiAgIGZhaWw6Cj4gPiA+Pj4gLSAgICB3
aGlsZSAoIGlkLS0gIT0gMCApCj4gPiA+Pj4gKyAgICB3aGlsZSAoIGlkKysgIT0gTUFYX05SX0lP
UkVRX1NFUlZFUlMgKQo+ID4gPj4+ICAgICAgewo+ID4gPj4+ICAgICAgICAgIHMgPSBHRVRfSU9S
RVFfU0VSVkVSKGQsIGlkKTsKPiA+ID4+Cj4gPiA+PiBXaXRoIFBhdWwncyBSLWIgSSB3YXMgYWJv
dXQgdG8gY29tbWl0IHRoaXMsIGJ1dCBkb2Vzbid0IHRoaXMKPiA+ID4+IG5lZWQgdG8gYmUgKytp
ZD8gKElmIHNvLCBJJ2xsIGJlIGhhcHB5IHRvIGZpeCB3aGlsZSBjb21taXR0aW5nLikKPiA+ID4K
PiA+ID4gVGhlIGluY3JlbWVudCBpcyBhbHJlYWR5IGRvbmUgaW4gdGhlIGxvb3AgY29uZGl0aW9u
Lgo+ID4KPiA+IFRoYXQncyB0aGUgaW5jcmVtZW50IEkgbWVhbi4gSSdtIHNvcnJ5IGZvciB0aGUg
YW1iaWd1aXR5OyBJCj4gPiBkaWRuJ3Qgd2FudCB0byBjdXQgdG9vIG11Y2ggb2YgdGhlIGNvbnRl
eHQuCj4gCj4gT2ggc29ycnksIHllcyBJIHRoaW5rIHlvdSBhcmUgY29ycmVjdCwgb3IgZWxzZSB3
ZSB3b3VsZCBvdmVycnVuIHRoZQo+IGFycmF5IGJ5IG9uZS4KCkluZGVlZC4gSSBzaG91bGQgaGF2
ZSBzcG90dGVkIHRoYXQuCgogIFBhdWwKCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
