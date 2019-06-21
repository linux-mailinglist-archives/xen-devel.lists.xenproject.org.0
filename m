Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDBE4EBE4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:24:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heLMU-0005q3-Df; Fri, 21 Jun 2019 15:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4J1g=UU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1heLMS-0005pv-DD
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:21:56 +0000
X-Inumbo-ID: 4c563bd8-9438-11e9-9e3b-bb75b8f2ca93
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c563bd8-9438-11e9-9e3b-bb75b8f2ca93;
 Fri, 21 Jun 2019 15:21:53 +0000 (UTC)
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
IronPort-SDR: zH73kTrnvicXleU35hGXTmQpfwKPRUgodBFuQVN0rkPysiG7GNE+HpJHGvKW7HxfH12CYVqwj4
 hCHf0bsfZqdmokFzqqsVOtodgwHO5F5qos6nJ52Scy33i/6duOsRqBF/iGylkCW7A73jfbq0f2
 6+pAVYMuXU9zCrPLIACJi096oFTaKwKQrxgS6B3y2gKTv/lskHton0Wnhyb8hPsjMNLECnxstn
 H4GMcEJm3Tmts4rzL8ex48JzIQWT/zUid85/SZa8EkXy+uad8bddG3RodwR3464dpnUXso9j2C
 2m8=
X-SBRS: 2.7
X-MesageID: 2057001
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2057001"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2] viridian: unify time sources
Thread-Index: AQHVJOYEKpYlKKXKuECuo6GB2lf0qqamBPOAgAAim3D///bXAIAAIaTw
Date: Fri, 21 Jun 2019 15:21:49 +0000
Message-ID: <64f9319e30844036891402c0e97dc361@AMSPEX02CL03.citrite.net>
References: <20190617082358.2734-1-paul.durrant@citrix.com>
 <a517fc98-cdd7-4bc4-e096-08826399ddf7@bitdefender.com>
 <e4ec7405ea9b4c9bb94f903a51561582@AMSPEX02CL03.citrite.net>
 <5D0CF5BE020000780023A3C7@prv1-mh.provo.novell.com>
In-Reply-To: <5D0CF5BE020000780023A3C7@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] viridian: unify time sources
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
Cc: "aisaila@bitdefender.com" <aisaila@bitdefender.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAyMSBKdW5lIDIwMTkgMTY6MjEKPiBUbzogUGF1bCBEdXJyYW50
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogYWlzYWlsYUBiaXRkZWZlbmRlci5jb207
IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9u
bmUKPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz47IFdlaUxpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBSRTogW1hlbi1k
ZXZlbF0gW1BBVENIIHYyXSB2aXJpZGlhbjogdW5pZnkgdGltZSBzb3VyY2VzCj4gCj4gPj4+IE9u
IDIxLjA2LjE5IGF0IDE1OjU4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+
ICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206IEFsZXhhbmRydSBTdGVmYW4g
SVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiA+PiBTZW50OiAyMSBKdW5lIDIwMTkg
MTQ6NDkKPiA+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNo
Cj4gPiA8amJldWxpY2hAc3VzZS5jb20+Owo+ID4+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2Ml0gdmly
aWRpYW46IHVuaWZ5IHRpbWUgc291cmNlcwo+ID4+Cj4gPj4gPiAgIC8qCj4gPj4gPiBAQCAtMTM2
LDcgKzEwMCw3IEBAIHN0YXRpYyBpbnQ2NF90IHRpbWVfcmVmX2NvdW50KGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpCj4gPj4gPiAgICAqIDEyOCBiaXQgbnVtYmVyIHdoaWNoIGlzIHRoZW4gc2hpZnRl
ZCA2NCB0aW1lcyB0byB0aGUgcmlnaHQgdG8gb2J0YWluCj4gPj4gPiAgICAqIHRoZSBoaWdoIDY0
IGJpdHMuIgo+ID4+ID4gICAgKi8KPiA+Pgo+ID4+IElzIHRoZXJlIGEgZ29vZCByZWFzb24gZm9y
IHVzaW5nIHNpZ25lZCBvZmZzZXQgaGVyZT8gSWYgc28gdGhlbiBtYXliZQo+ID4+IHlvdSBzaG91
bGQgY2hhbmdlIHRoZSByZXR1cm4gdHlwZSBvciBjaGVjayBmb3IgYm91bmRzLgo+ID4KPiA+IFRo
ZSBvZmZzZXQgaXMgYWN0dWFsbHkgbmVnYXRpdmUgbW9zdCBvZiB0aGUgdGltZSBidXQgdGhlIHJl
c3VsdGluZyByZWZlcmVuY2UKPiA+IHRpbWUgc2hvdWxkIGJlIHVuc2lnbmVkIHNvIHRoZSByZXR1
cm4gdHlwZSBvZiB0aW1lX3JlZl9jb3VudCgpIGRvZXMgbmVlZAo+ID4gZml4aW5nLgo+IAo+IElz
IHN3aXRjaGluZyBpdCBmcm9tIGludDY0X3QgdG8gdWludDY0X3QgYWxsIHRoYXQncyBuZWVkZWQ/
IEkgY291bGQKPiBkbyB0aGlzIHdoaWxlIGNvbW1pdHRpbmcgKHdoaWNoIEkgd2FzIGFib3V0IHRv
KS4KClllcywgdGhhdCdzIGFsbCB0aGF0J3MgbmVlZGVkIGFuZCBpdCB3b3VsZCBiZSBuaWNlIHRv
IGF2b2lkIHNlbmRpbmcgYSB2My4KClRoYW5rcywKCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
