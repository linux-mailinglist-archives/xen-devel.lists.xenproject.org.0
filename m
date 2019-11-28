Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37710C689
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:19:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGrV-0006Fe-Aw; Thu, 28 Nov 2019 10:17:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDnJ=ZU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iaGrT-0006El-Bj
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:17:23 +0000
X-Inumbo-ID: 43def3ec-11c8-11ea-a3cd-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43def3ec-11c8-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574936242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=62ZMXbgI4haGaBOqgkRdyyxvgDh9wUsDhFMNcJEwAP0=;
 b=QOSNFLJNP2L7pcpoQ+r5N4roCs0lQKZKw2QjzFSl36zmEyfD4SokegKq
 Xvu/DxRBL+TaJ6pH7MMFznEgDlZzKcWR6l8eelfS9Q8/s60S9Gxtj0bQx
 nNMU5lg3rUTFGb02z7PpT6zaqh+JWqd5LNY9sjp0pn6NBioYXfP0m98qu o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7L9d7DR9+ApexPKXTZPomxIAfFyoWVl4I9QEkhY+qGlgTGquDPFXr45CoiHS+aGE841lNFHhRE
 gsAJHcreDsKaaRK1zA0xYCm0hheGsof2x0/Q+JU8nUCTNoMEbbPQYZ1k05XIgOjqeneGOO/mFO
 eVelY56dsJ0QaWf1R2GH2IwNl13TzhezfU5tMfUM3u/mD/4vFt1ExCLh3iFRv83KJIY3KJO74r
 w32qS6ETOrzDb2Ft1043dy1zr9Kvp6IKO14zBolRNEgiJsXGCECFd+IzRnbCllvvU0NwMZDfsw
 RjQ=
X-SBRS: 2.7
X-MesageID: 9304027
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9304027"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: Ping: [PATCH v2] build: provide option to disambiguate symbol
 names
Thread-Index: AQHVpdIEbgSRI8L3N06Yh3iNBK/x56egTZ8A
Date: Thu, 28 Nov 2019 10:17:18 +0000
Message-ID: <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
In-Reply-To: <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <00517751463E844C8071D5EB740C7B62@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 WeiLiu <wl@xen.org>, KonradWilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE5vdiAyOCwgMjAxOSwgYXQgOTo1NSBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4+Pj4gSGFzIGFueW9uZSBhY3R1YWxseSB0cmllZCBidWlsZGluZyBh
IGxpdmVwYXRjaCB3aXRoIHRoaXMgY2hhbmdlIGluIHBsYWNlPw0KPj4+IEFjdHVhbGx5IC0gd2hh
dCBpcyB5b3VyIGNvbmNlcm4gaGVyZT8gVGhlIGV4YWN0IHNwZWxsaW5nIG9mIHN5bWJvbHMNCj4+
PiBuYW1lcyBzaG91bGQgYmUgb2Ygbm8gaW50ZXJlc3QgdG8gdGhlIHRvb2wuIEFmdGVyIGFsbCB0
aGUgY29tcGlsZXIgaXMNCj4+PiBmcmVlIHRvIGludmVudCBhbGwgc29ydHMgb2YgbmFtZXMgZm9y
IGl0cyBsb2NhbCBzeW1ib2xzLCBpbmNsdWRpbmcNCj4+PiB0aGUgb25lcyB3ZSB3b3VsZCBwcm9k
dWNlIHdpdGggdGhpcyBjaGFuZ2UgaW4gcGxhY2UuIEFsbCB0aGUgdG9vbA0KPj4+IGNhcmVzIGFi
b3V0IGlzIHRoYXQgdGhlIG5hbWVzIGJlIHVuYW1iaWd1b3VzLiBIZW5jZSBhbnkgKHRoZW9yZXRp
Y2FsKQ0KPj4+IHJlZ3Jlc3Npb24gaGVyZSB3b3VsZCBiZSBhIGJ1ZyBpbiB0aGUgdG9vbHMsIHdo
aWNoIGltbyBpcyBubyByZWFzb24NCj4+PiB0byBkZWxheSB0aGlzIGNoYW5nZSBhbnkgZnVydGhl
ci4gKEdyYW50ZWQgSSBzaG91bGQgaGF2ZSBnb3QgdG8gaXQNCj4+PiBlYXJsaWVyLCBidXQgaXQg
aGFkIGJlZW4gY29udGludWluZyB0byBnZXQgZGVmZXJyZWQuKQ0KPj4gDQo+PiBUaGlzIG1pZ2h0
IGFsbCBiZSB0cnVlICh0aGVvcmV0aWNhbGx5KS4NCj4+IA0KPj4gVGhlIGxpdmVwYXRjaCBidWls
ZCB0b29scyBhcmUgZnJhZ2lsZSBhbmQgdmVyeSBzZW5zaXRpdmUgdG8gaG93IHRoZQ0KPj4gb2Jq
ZWN0IGZpbGVzIGFyZSBsYWlkIG91dC4gIFRoZXJlIGlzIGEgdmVyeSByZWFsIHJpc2sgdGhhdCB0
aGlzIGNoYW5nZQ0KPj4gYWNjaWRlbnRhbGx5IGJyZWFrcyBsaXZlcGF0Y2hpbmcgdG90YWxseSwg
ZXZlbiBvbiBHQ0MgYnVpbGRzLg0KPj4gDQo+PiBXZXJlIHRoaXMgdG8gaGFwcGVuLCBpdCB3b3Vs
ZCBiZSB5ZXQgYW5vdGhlciA0LjEzIHJlZ3Jlc3Npb24uDQo+IA0KPiBJdCdzIHBlcmhhcHMgYSBt
YXR0ZXIgb2YgcGVyY2VwdGlvbiwgYnV0IEknZCBzdGlsbCBjYWxsIHRoaXMgYQ0KPiBsaXZlIHBh
dGNoaW5nIHRvb2xzIGJ1ZyB0aGVuLCBub3QgYSA0LjEzIHJlZ3Jlc3Npb24uDQoNCkFmdGVyIHRo
ZSBkaXNjdXNzaW9uIHllc3RlcmRheSwgSSB3YXMgdGhpbmtpbmcgYSBiaXQgbW9yZSBhYm91dCB0
aGlzLCBhbmQgSeKAmW0gbm90IGhhcHB5IHdpdGggdGhlIHByaW5jaXBsZSBBbmR5IHNlZW1zIHRv
IGJlIG9wZXJhdGluZyBvbiwgdGhhdCBpdOKAmXMgcmVhc29uYWJsZSB0byBjb21wbGV0ZWx5IGJs
b2NrIGEgYnVnLWZpeGluZyBwYXRjaCB0byBYZW4sIGZvcmNpbmcgYSB3b3JrLWFyb3VuZCB0byBi
ZSB1c2VkIGluIGEgcmVsZWFzZSwgYmVjYXVzZSBpdCBoYXMgdW5rbm93biBlZmZlY3RzIG9uIGxp
dmVwYXRjaGluZy4NCg0KQ29uc2lkZXIgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIFhlbiBhbmQg
TGludXgsIGZvciBleGFtcGxlLiAgU3VwcG9zZSB0aGF0IGEgcGF0Y2ggd2VyZSBwb3N0ZWQgdG8g
TGludXggdG8gZml4IGFuIGlzc3VlLCBhbmQgSnVlcmdlbiByZXNwb25kZWQgYnkgc2F5aW5nIHRo
YXQgaGUgd2FzbuKAmXQgaGFwcHkgd2l0aCBpdCBiZWNhdXNlIGl0ICBtaWdodCBwb3NzaWJseSBi
cmVhayB0aGluZ3MgcnVubmluZyB1bmRlciBYZW4uICBCdXQgaGUgZGlkbuKAmXQgYWN0dWFsbHkg
dGVzdCBpdCBoaW1zZWxmLCBub3IgcHJvcG9zZSBzb21lIGFsdGVybmF0ZSB3YXkgb2YgZml4aW5n
IHRoZSBvcmlnaW5hbCBwcm9ibGVtOyByYXRoZXIsIGhlIGV4cGVjdGVkIHRoZSBvcmlnaW5hbCBw
YXRjaCBzdWJtaXR0ZXIsIHdobyBkb2VzbuKAmXQgdXNlIFhlbiwgdG8gc2V0IHVwIGEgWGVuIHN5
c3RlbSBhbmQgdGVzdCBpdCB0aGVtc2VsdmVzIGJlZm9yZSBhY2NlcHRpbmcgaXQuDQoNCkRvIHlv
dSB0aGluayBhbnlvbmUgaW4gdGhlIGtlcm5lbCBjb21tdW5pdHkgd291bGQgc3RhbmQgZm9yIHRo
YXQ/ICBPZiBjb3Vyc2Ugbm90LiAgTmF0dXJhbGx5IHRoZSBwYXRjaCB3b3VsZCBiZSAqcGF1c2Vk
KiB3aGlsZSAqcGVvcGxlIGluIHRoZSBYZW4gY29tbXVuaXR5KiB0ZXN0ZWQgYW5kIG9yIHByb3Bv
c2VkIGFsdGVybmF0ZSBzb2x1dGlvbnM7IGJ1dCBpZiB0aGVyZSB3YXMgYSBkZWxheSwgZXZlbnR1
YWxseSBpdCB3b3VsZCBiZSBjaGVja2VkIGluLg0KDQpJIHRoaW5rIHRoZSBzYW1lIHByaW5jaXBs
ZSBzaG91bGQgYXBwbHkgaGVyZS4gIElmIHBlb3BsZSB1c2luZyB0aGUgbGl2ZXBhdGNoIGNvZGUg
YXJlIGFmcmFpZCB0aGF0IEphbuKAmXMgcGF0Y2ggKm1heSogYWZmZWN0IGxpdmVwYXRjaGluZyBv
biBnY2MsIHRoZW4gdGhleSBzaG91bGQgYmUgZ2l2ZW4gdGltZSB0byByZXZpZXcsIHRlc3QsIGFu
ZC9vciBwcm9wb3NlIGFsdGVybmF0ZSBzb2x1dGlvbnMuICBCdXQgaXQgc2hvdWxkIGJlIHRoZSBy
ZXNwb25zaWJpbGl0eSBvZiBwZW9wbGUgd29ya2luZyBvbiB0aGF0IGNvZGUsIG5vdCB0aGUgcmVz
cG9uc2liaWxpdHkgb2YgZGV2ZWxvcGVycyB3aG8gZG9u4oCZdCB1c2UgdGhhdCBjb2RlLg0KDQo+
ICBJZiB0aGV5J3JlIHNvDQo+IGV4dHJlbWVseSBmcmFnaWxlLCB0aGVuIEkgdGhpbmsgdGhpcyBu
ZWVkcyB1cmdlbnRseSB0YWtpbmcgY2FyZSBvZg0KPiBieSB0aGVpciBtYWludGFpbmVycy4gQXMg
bWVudGlvbmVkIGJlZm9yZSAtIGhvdyBleGFjdGx5IHN0YXRpYw0KPiBzeW1ib2xzIGdldCByZXBy
ZXNlbnRlZCBpcyB1cCB0byB0aGUgY29tcGlsZXIsIGkuZS4gbWF5IGNoYW5nZSBhdA0KPiBhbnkg
dGltZS4gQXMgYSByZXN1bHQsIGFueSBjaGFuZ2Ugd2hhdHNvZXZlciB3b3VsZCBuZWVkIHN1Y2gN
Cj4gcmVncmVzc2lvbiB0ZXN0aW5nLCBubyBtYXR0ZXIgdGhhdCBJIGFncmVlIHRoYXQgYSBsYXJn
ZXIgc2NvcGUNCj4gY2hhbmdlIGxpa2UgdGhpcyBvbmUgaGFzIHNsaWdodGx5IGhpZ2hlciBwb3Rl
bnRpYWwgb2YgdHJpZ2dlcmluZw0KPiBzb21lIGlzc3VlLg0KDQpUaGlzIGlzIGFub3RoZXIgYXJn
dW1lbnQgSSB3b3VsZCBhZ3JlZSB3aXRoLg0KDQpHaXZlbiB0aGUgY2xvc2VuZXNzIHRvIHRoZSBy
ZWxlYXNlLCBJ4oCZZCBmYXZvciBjaGVja2luZyBpbiB0aGUgcGF0Y2ggdG9kYXkgb3IgdG9tb3Jy
b3csIHJlZ2FyZGxlc3Mgb2YgdGVzdGluZyBzdGF0dXMsIHNvIHRoYXQgaXQgY2FuIGdldCBtb3Jl
IHRlc3RpbmcgaW4gb3VyIGF1dG9tYXRlZCBzeXN0ZW1zOyBpdCBjYW4gYWx3YXlzIGJlIHJldmVy
dGVkIGlmIGl0IGlzIHNob3duIHRvIGJyZWFrIGxpdmVwYXRjaGluZyBvbiBnY2MuDQoNCiAtR2Vv
cmdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
