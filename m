Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F443768
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:57:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbR7f-0001dk-TD; Thu, 13 Jun 2019 14:54:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sfy7=UM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hbR7e-0001da-5M
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:54:38 +0000
X-Inumbo-ID: 28546596-8deb-11e9-8f4c-93fd9f302b11
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28546596-8deb-11e9-8f4c-93fd9f302b11;
 Thu, 13 Jun 2019 14:54:35 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rnfr3Hr85UR4cBEzydW/4yDBMgMhb0jyecShC9mDWCEZmt04sKkPloo/DMFGjPOaaErp3yNXoN
 JRG4KRcWDbxkx3Li4pbNfBgXaM3zyN3LDZnZ+kPZCQ29ObWuV07+X0HGbc32Gomg/DkHqQXsQ7
 lzgBTy9SohcgM+edU7MMV5ndQK/HnQ8UBRigS1AF4rSVq0FteEYVEK3AL/zf8ooqesedymtQV2
 ZdQXfMCCU4yMiufqAOTffEmDMJvBfDXw8XB77EeGnXx1+u8kxouTzbtHx0QJJU/moN0FM5j6Ic
 LjA=
X-SBRS: 2.7
X-MesageID: 1683104
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,369,1557201600"; 
   d="scan'208";a="1683104"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH] viridian: unify time sources
Thread-Index: AQHVIHdS2QYJA+fiMEqpmU94cdldCqaZi18AgAAh2IA=
Date: Thu, 13 Jun 2019 14:54:31 +0000
Message-ID: <4b34b7fe7d9748ada4d940e441c86fdb@AMSPEX02CL03.citrite.net>
References: <20190611170127.2650-1-paul.durrant@citrix.com>
 <5D0261FE0200007800237F6B@prv1-mh.provo.novell.com>
In-Reply-To: <5D0261FE0200007800237F6B@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] viridian: unify time sources
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgSnVuZSAyMDE5IDE1OjQ3Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgeGVuLWRldmVsIDx4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBX
ZWlMaXUgPHdsQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdmlyaWRpYW46IHVuaWZ5
IHRpbWUgc291cmNlcwo+IAo+ID4+PiBPbiAxMS4wNi4xOSBhdCAxOTowMSwgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPiB3cm90ZToKPiA+IEBAIC03Nyw2ICs3Niw3IEBAIHN0YXRpYyB2b2lkIHVw
ZGF0ZV9yZWZlcmVuY2VfdHNjKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgaW5pdGlhbGl6ZSkKPiA+
ICAgICAgICogdGlja3MgcGVyIDEwMG5zIHNoaWZ0ZWQgbGVmdCBieSA2NC4KPiA+ICAgICAgICov
Cj4gPiAgICAgIHAtPlRzY1NjYWxlID0gKCgxMDAwMHVsIDw8IDMyKSAvIGQtPmFyY2gudHNjX2to
eikgPDwgMzI7Cj4gPiArICAgIHAtPlRzY09mZnNldCA9IHRyYy0+b2ZmOwo+ID4gICAgICBzbXBf
d21iKCk7Cj4gCj4gRXZlbiBoYXZpbmcgd3JpdHRlbiB0aGUgZGVzY3JpcHRpb24gaXQncyBub3Qg
aW1tZWRpYXRlbHkgb2J2aW91cwo+IHRvIG1lIHdoeSB0aGlzIGlzIGFuIG9rYXkgY2hhbmdlIHRv
IG1ha2UsIG5vdCB0aGUgbGVhc3Qgd2hlbgo+IHRoaW5raW5nIGFib3V0IGEgZ3Vlc3QgbWlncmF0
aW5nIGluIGZyb20gYW4gb2xkZXIgdmVyc2lvbi4gQXQgdGhlCj4gdmVyeSBsZWFzdCBkb24ndCB5
b3UgdGhpbmsgdGhlIGNvbW1lbnQgYWJvdmUgbWF5IHdhbnQgc2xpZ2h0bHkKPiBleHRlbmRpbmc/
CgpJIGd1ZXNzIEkgY291bGQgYWRkIGEgZmxhZyBpbiB0aGUgbWlncmF0aW9uIHN0cmVhbSBidXQs
IGFzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0IGNvbW1lbnQsIHRoZSBndWVzdCB3aWxsIHNlZSBh
IGp1bXAgaWYgdGhlIHBhZ2UgaGFwcGVucyB0byBnZXQgaW52YWxpZGF0ZWQsIHNvIGl0J3MgYWx3
YXlzIGEgcmlzay4gSSdsbCBleHRlbmQgdGhlIGNvbW1lbnQgYXMgeW91IHN1Z2dlc3QuCgo+IAo+
IEV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBwbGF1c2libGUgdG8gbWUuCgpPaywgdGhhbmtzLgoKICBQ
YXVsCgo+IAo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
