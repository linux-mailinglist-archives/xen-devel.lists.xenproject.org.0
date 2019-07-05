Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24060655
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 15:07:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjNtX-0002AY-2O; Fri, 05 Jul 2019 13:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjNtV-0002AS-22
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:04:53 +0000
X-Inumbo-ID: 7891c03a-9f25-11e9-bc86-135ba8addee6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7891c03a-9f25-11e9-bc86-135ba8addee6;
 Fri, 05 Jul 2019 13:04:50 +0000 (UTC)
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
IronPort-SDR: agee8JhvHLdu+hO98ySxL/xqzqjInZJtykQ1ZnMGPx8wAYHv3ehXOj6xzX38sGAddPmVsO1ivY
 qy9cpf874YXrbAAOJw4R8+VTY9GXlwxrNDvoVdpE6iQsl4cHxaNsWVbHFyBuz6SztfSzLlbHs8
 o4HB6gYKfk2QoNIyT8sJ6tQeClYFhY2Oxnw7+sRLGsUpQEW+2gHVBNqzcKB/hcBXc8D4iAhBB0
 O/AX9snsKQE9v+AHnoj7tFr7+gDjceE8KeYH/UKhPpK6JkLEjo29VEdEWpc4EfW4c9h1ekMyHZ
 0no=
X-SBRS: 2.7
X-MesageID: 2652497
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2652497"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 1/2] xmalloc: remove struct xmem_pool init_region
Thread-Index: AQHVMxBvsCy98hithUSg+ptDBmyO7Ka7zhSAgAAiFID//+mgAIAAInBQ
Date: Fri, 5 Jul 2019 13:04:45 +0000
Message-ID: <fa8e2b86432b4c85b2ba3ba493664936@AMSPEX02CL03.citrite.net>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
 <20190705090249.1935-2-paul.durrant@citrix.com>
 <3f8e7d14-e0b7-6d4b-6fd4-aabffc644257@suse.com>
 <c25c88d8a3ea43cc8d232a52494233c6@AMSPEX02CL03.citrite.net>
 <89ddd2fd-45e6-190e-8873-48270ddc69f7@suse.com>
In-Reply-To: <89ddd2fd-45e6-190e-8873-48270ddc69f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] xmalloc: remove struct xmem_pool
 init_region
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA1IEp1bHkgMjAxOSAxMzo1NA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEp1bGllbkdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFk
Unplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcp
IDx0aW1AeGVuLm9yZz47IFdlaUxpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzJdIHhtYWxsb2M6IHJlbW92ZSBzdHJ1Y3QgeG1lbV9wb29sIGluaXRfcmVnaW9uDQo+
IA0KPiBPbiAwNS4wNy4yMDE5IDE0OjE4LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMDUgSnVseSAyMDE5
IDEzOjEyDQo+ID4+DQo+ID4+IE9uIDA1LjA3LjIwMTkgMTE6MDIsIFBhdWwgRHVycmFudCB3cm90
ZToNCj4gPj4+IEBAIC0zNTIsMTMgKzM0Myw2IEBAIHZvaWQgeG1lbV9wb29sX2Rlc3Ryb3koc3Ry
dWN0IHhtZW1fcG9vbCAqcG9vbCkNCj4gPj4+ICAgICAgICBpZiAoIHBvb2wgPT0gTlVMTCApDQo+
ID4+PiAgICAgICAgICAgIHJldHVybjsNCj4gPj4+DQo+ID4+PiAtICAgIC8qIFVzZXIgaXMgZGVz
dHJveWluZyB3aXRob3V0IGV2ZXIgYWxsb2NhdGluZyBmcm9tIHRoaXMgcG9vbCAqLw0KPiA+Pj4g
LSAgICBpZiAoIHhtZW1fcG9vbF9nZXRfdXNlZF9zaXplKHBvb2wpID09IEJIRFJfT1ZFUkhFQUQg
KQ0KPiA+Pj4gLSAgICB7DQo+ID4+PiAtICAgICAgICBBU1NFUlQoIXBvb2wtPmluaXRfcmVnaW9u
KTsNCj4gPj4+IC0gICAgICAgIHBvb2wtPnVzZWRfc2l6ZSAtPSBCSERSX09WRVJIRUFEOw0KPiA+
Pj4gLSAgICB9DQo+ID4+DQo+ID4+IEkgY2FuIHNlZSB0aGF0IHRoZSBBU1NFUlQoKSBjYW4gKGFu
ZCBuZWVkcyB0bykgZ28gYXdheS4gQnV0IEkNCj4gPj4gZG9uJ3QgdGhpbmsgeW91J3ZlIGNoYW5n
ZWQgYW55dGhpbmcgZWxzZXdoZXJlIHRoYXQgd291bGQgYWxzbw0KPiA+PiBhbGxvdyB0aGUgZW50
aXJlIGlmKCkgdG8gZ28gYXdheS4NCj4gPg0KPiA+IEkgdGhpbmsgc28uIEFGQUlDVCB0aGUgc2l6
ZSBjaGVjayBhZ2FpbnN0IEJIRFJfT1ZFUkhFQUQgaXMgZW50aXJlbHkNCj4gPiB0byBhdm9pZCBy
ZXBvcnRpbmcgcHJlc2VuY2Ugb2YgdGhlIGluaXRfcmVnaW9uIGFzIGEgbGVhay4gSS5lLiBpbg0K
PiA+IHRoZSBwcmVzZW5jZSBvZiBhbiBpbml0X3JlZ2lvbiwgdGhlIHVzZWRfc2l6ZSB3b3VsZCBu
ZXZlciBkcm9wDQo+ID4gYmVsb3cgQkhEUl9PVkVSSEVBRC4gV2l0aG91dCBhbiBpbml0X3JlZ2lv
biwgdXNlZF9zaXplIHNob3VsZCBkcm9wDQo+ID4gYWxsIHRoZSB3YXkgKGJhY2spIHRvIDAgd2hl
biB0aGUgbGFzdCB4ZnJlZSgpIGlzIGRvbmUuDQo+IA0KPiBCdXQgdGhlIG9sZCBjb2RlIGFzc2Vy
dGVkIHRoYXQgdGhlcmUgd2FzIF9ub18gaW5pdCByZWdpb24sIGFuZCB0aGVuDQo+IHJlZHVjZWQg
cG9vbC0+dXNlZF9zaXplLg0KDQpPaCB5ZXMsIEkgd2FzIGNvbXBsZXRlbHkgYmxpbmQgdG8gdGhh
dCAnIScgYXMgaXQgb25seSBtYWRlIHNlbnNlIHRvIG1lIHRoZSBvdGhlciB3YXkgcm91bmQuDQoN
Cj4gQW5kIHRoZSBzdGF0ZSBvZiB0aGUgcG9vbCB3aGVuIHRoZXJlIGlzIG5vDQo+IGluaXQgcmVn
aW9uIGRvZXNuJ3QgY2hhbmdlIHdpdGggeW91ciBwYXRjaC4gSWYgYW55dGhpbmcgdGhpcyBpZigp
DQo+IHdhcyBib2d1cyBhbHRvZ2V0aGVyLCB3aGljaCBJIHRoaW5rIHdhcyB0aGUgY2FzZSBub3cg
dGhhdCBJJ3ZlDQo+IGxvb2tlZCBtb3JlIGNsb3NlbHkgYXQgaG93IC8gd2hlbiAtPnVzZWRfc2l6
ZSBnZXRzIHVwZGF0ZWQuDQoNClllcywgSSB0aGluayBpdCB3YXMgaW5kZWVkIHRvdGFsbHkgYm9n
dXMuDQoNCj4gSSB3b3VsZA0KPiBoYXZlIHdhbnRlZCB0byBjaGVjayB0aGUgb3JpZ2luYWwgY29k
ZSAod2hpY2ggb3VycyB3YXMgY2xvbmVkIGZyb20pDQo+IHRvIHNlZSB3aGV0aGVyIHRoZXkndmUg
Y2hhbmdlZCB0aGlzIHBpZWNlIGF0IHNvbWUgdGltZSwgYnV0IHRoZSBzaXRlDQo+IGRvZXNuJ3Qg
c2VlbSB0byBiZSBwcm9wZXJseSB3b3JraW5nIChhbnltb3JlKS4NCg0KVGhlIGNvZGUgaXMgb3Zl
ciBhIGRlY2FkZSBvbGQgYWNjb3JkaW5nIHRvIHRoZSBib2lsZXJwbGF0ZSBhdCB0aGUgdG9wIHNv
IHByb2JhYmx5IG5vdCBzdXJwcmlzaW5nLg0KDQo+IA0KPiBEbyB5b3UgYWdyZWUgdGhhdCAtPnVz
ZWRfc2l6ZSBjb3VsZCBlcXVhbCBCSERSX09WRVJIRUFEIG9ubHkgd2hlbg0KPiB0aGVyZSdzIGV4
YWN0bHkgb25lIHJlZ2lvbiwgYW5kIHdoZW4gdGhhdCBvbmUgcmVnaW9uIGhhcyBubw0KPiBvdXRz
dGFuZGluZyBhbGxvY2F0aW9ucz8NCg0KWWVzLCBoZW5jZSBtZSBnZXR0aW5nIGZvb2xlZCBpbnRv
IHRoaW5raW5nIHRoaXMgd2FzIGJlY2F1c2UgYmVjYXVzZSBpbml0X3JlZ2lvbiB3YXMgbm90IGZy
ZWVkLg0KDQo+IFNlZWluZyB0aGUgcmVnaW9uIHJlbW92YWwgaW4NCj4geG1lbV9wb29sX2ZyZWUo
KSBJIGFsc28gY2FuJ3Qgc2VlbSB0byBzZWUgaG93IHRoZSBpbml0IHJlZ2lvbg0KPiB3b3VsZCBo
YXZlIGJlZW4gZXhjbHVkZWQgZnJvbSBnZXR0aW5nIGZyZWVkIGhlcmUsIGF0IHdoaWNoIHBvaW50
DQo+IGFzc2VydGluZyB3aGV0aGVyIHRoZXJlIGlzIChldmVyIHdhcykgb25lIGxvb2tzIGV2ZW4g
bW9yZSBmaXNoeS4NCj4gDQo+IEFjdHVhbGx5IHRoZXJlJ3MgYSBwZXJoYXBzIHRlbGxpbmcgY29t
bWVudCBpbiB4bWVtX3Bvb2xfY3JlYXRlKCk6DQo+IA0KPiAgICAgIC8qIGFsd2F5cyBvYnRhaW4g
aW5pdF9yZWdpb24gbGF6aWx5IG5vdyB0byBlbnN1cmUgaXQgaXMgZ2V0X21lbSdkDQo+ICAgICAg
ICogaW4gdGhlIHNhbWUgImNvbnRleHQiIGFzIGFsbCBvdGhlciByZWdpb25zICovDQo+IA0KPiBU
aGlzIHN1Z2dlc3RzIHRvIG1lIHRoYXQgb3JpZ2luYWxseSB0aGUgaW5pdCByZWdpb24gd2FzIHNl
dCB1cCByaWdodA0KPiBoZXJlLCBhdCB3aGljaCBwb2ludCB0aGF0IGFzc2VydGlvbiB3b3VsZCBo
YXZlIG1hZGUgc2Vuc2UuIEFuZCB0aGVyZQ0KPiB3ZSBnbyAtIEknbSBub3QgYXQgYWxsIHN1cnBy
aXNlZCB0aGF0IHRoaXMgc3RlbXMgZnJvbSA2MDA5ZjRkZGIyDQo+ICgnVHJhbnNjZW5kZW50IG1l
bW9yeSAoInRtZW0iKSBmb3IgWGVuJyksIHdpdGggbm8gbWVudGlvbiBhdCBhbGwgaW4NCj4gdGhl
IGNvbW1pdCBtZXNzYWdlIGFzIHRvIHdoeSB0aGUgYWxsb2NhdG9yIG5lZWRlZCB0byBiZSBjaGFu
Z2VkLg0KDQpPaC4uLiBhbm90aGVyIGNhc3VhbHR5Lg0KDQo+IA0KPiBJT1cgLSBhcyBsb25nIGFz
IHlvdSBhZ3JlZSB3aXRoIHRoZSBhbmFseXNpcywgYW5kIGFzIGxvbmcgYXMgYQ0KPiByZWZlcmVu
Y2UgdG8gdGhlIGFib3ZlIGNvbW1pdCByZW5kZXJpbmcgc3RhbGUgdGhhdCBlbnRpcmUgaWYoKSBn
ZXRzDQo+IGFkZGVkIHRvIHRoZSBkZXNjcmlwdGlvbiAod2hpY2ggbWF5IHN0aWxsIGJlIHJlYXNv
bmFibGUgdG8gZG8gd2hpbGUNCj4gY29tbWl0dGluZyk6DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuIElmIHlvdSB3YW50IG1lIHRv
IHJlLXdvcmsgdGhlIGNvbW1lbnQgdGhlbiBsZXQgbWUga25vdywgb3RoZXJ3aXNlIEknbSB0b3Rh
bGx5IGhhcHB5IGZvciB5b3UgdG8gZG8gaXQgb24gY29tbWl0Lg0KDQogIFBhdWwNCg0KPiANCj4g
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
