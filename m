Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC05E14E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 11:47:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hibp4-0002vh-BZ; Wed, 03 Jul 2019 09:45:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eYTC=VA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hibp2-0002va-Lg
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 09:45:04 +0000
X-Inumbo-ID: 39ec91d4-9d77-11e9-94c2-3b6231f4a18c
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ec91d4-9d77-11e9-94c2-3b6231f4a18c;
 Wed, 03 Jul 2019 09:45:01 +0000 (UTC)
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
IronPort-SDR: hjpM++Bu/KLDbTBDaFgciD77XologngZB1u0u5oOS7ENUxkDuzTuqtzg/KyxkAwB4m/bXg2oGA
 jC7RpAyPF8LI7GPSrmobjWwyKV9izTzzTzDGWjEMDYdtJp0+YPZLM0OZ6nPQRL3xH4OidAOdR3
 FH9K2IizvYbnJgJ9HrK8yv+V7HL0PDlWllSdwwf0Y8yiWFBvOetldroLFTAzvY1lQr5UxOQ4h0
 6kXuka5sa3qS+98U0Ihyukc5nMcxSWx8ku333h0U0Dbtl9w3EFh5BkQhqQgxvyBd5c37MU6vnf
 vZY=
X-SBRS: 2.7
X-MesageID: 2564253
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2564253"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/3] xmalloc: stop using a magic '1' in alignment padding
Thread-Index: AQHVMPSd1HhsSARhYUSxbTOowYbGiaa4grkAgAAiq3A=
Date: Wed, 3 Jul 2019 09:44:57 +0000
Message-ID: <472e43cbd2964100bdcb655dfe944d01@AMSPEX02CL03.citrite.net>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
 <20190702163840.2107-2-paul.durrant@citrix.com>
 <05c68140-caec-1b95-0c4d-e30e55a8acaf@suse.com>
In-Reply-To: <05c68140-caec-1b95-0c4d-e30e55a8acaf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] xmalloc: stop using a magic '1' in
 alignment padding
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxMDozOQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykg
PHRpbUB4ZW4ub3JnPjsNCj4gV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAxLzNdIHhtYWxsb2M6IHN0b3AgdXNpbmcgYSBtYWdpYyAnMScgaW4gYWxpZ25tZW50IHBh
ZGRpbmcNCj4gDQo+IE9uIDAyLjA3LjIwMTkgMTg6MzgsIFBhdWwgRHVycmFudCB3cm90ZToNCj4g
PiBBbGlnbm1lbnQgcGFkZGluZyBpbnNlcnRzIGEgcHNldWRvIGJsb2NrIGhlYWRlciBpbiBmcm9u
dCBvZiB0aGUgYWxsb2NhdGlvbiwNCj4gPiBzZXRzIGl0cyBzaXplIGZpZWxkIHRvIHRoZSBwYWQg
c2l6ZSBhbmQgdGhlbiBPUnMgaW4gMSwgd2hpY2ggaXMgZXF1aXZhbGVudA0KPiA+IHRvIG1hcmtp
bmcgaXQgYXMgYSBmcmVlIGJsb2NrLCBzbyB0aGF0IHhmcmVlKCkgY2FuIGRpc3Rpbmd1aXNoIGl0
IGZyb20gYQ0KPiA+IHJlYWwgYmxvY2sgaGVhZGVyLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzaW1w
bHkgcmVwbGFjZXMgdGhlIG1hZ2ljICcxJyB3aXRoIHRoZSBkZWZpbmVkICdGUkVFX0JMT0NLJyB0
bw0KPiA+IG1ha2UgaXQgbW9yZSBvYnZpb3VzIHdoYXQncyBnb2luZyBvbi4NCj4gDQo+IEhtbSwg
dGhhdCdzIHN0aWxsIGFuIGFidXNlIG9mIHNvbWUgc29ydCwgSSB0aGluay4gRlJFRV9CTE9DSw0K
PiAodG9nZXRoZXIgd2l0aCBVU0VEX0JMT0NLLCBQUkVWX0ZSRUUsIGFuZCBQUkVWX1VTRUQpIHNl
cnZlDQo+IGJsb2NrIHNwbGl0dGluZyBhbmQgcmUtY29tYmluYXRpb24sIHdoaWNoIGlzbid0IHN0
cmljdGx5IHRoZQ0KPiBjYXNlIGhlcmUuIEJ1dCB5ZXMsIEkgZ3Vlc3MgKGFiKXVzaW5nIHRoZSBt
YW5pZmVzdCBjb25zdGFudHMgaXMNCj4gc3RpbGwgYmV0dGVyIHRoYW4gKGFiKXVzaW5nIHRoZSBs
aXRlcmFsIG51bWJlcnMuDQo+IA0KPiA+IEFsc28sIHdoaWxzdCBpbiB0aGUgbmVpZ2hib3VyaG9v
ZCwgaXQgcmVtb3ZlcyBhIHN0cmF5IHNwYWNlIGFmdGVyIGEgY2FzdC4NCj4gDQo+IEFuIG9wdGlv
biB3b3VsZCBoYXZlIGJlZW4gdG8gZHJvcCB0aGUgY2FzdCBhbHRvZ2V0aGVyLiBUaGUgY29kZQ0K
PiBoZXJlIGFwcGVhcnMgdG8gYXNzdW1lIHRoYXQgdm9pZCBwb2ludGVyIGFyaXRobWV0aWMgaXMg
bm90DQo+IGFsbG93ZWQgKGFzIGlzIGluZGVlZCB0aGUgY2FzZSBpbiBwbGFpbiBDKS4NCj4gDQoN
ClllcywgdGhlIGNvZGUgaXMgcHJldHR5IGFuY2llbnQuIFRoZXJlJ3MgYSB3aG9sZSBidW5jaCBv
ZiBjbGVhbnVwL3N0eWxlIGFkanVzdG1lbnRzIChlLmcuIHUzMiAtPiB1aW50MzJfdCkgdG9vLiBJ
IGxlZnQgdGhpcyBvbmUgZm9yIGNvbnNpc3RlbmN5Lg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcy4NCg0KPiB3aXRoIG9uZSBm
dXJ0aGVyIGFkanVzdG1lbnQ6DQo+IA0KPiA+IEBAIC02MzgsMTIgKzYzOCwxMiBAQCB2b2lkIHhm
cmVlKHZvaWQgKnApDQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gICAgICAgLyogU3RyaXAgYWxpZ25t
ZW50IHBhZGRpbmcuICovDQo+ID4gLSAgICBiID0gKHN0cnVjdCBiaGRyICopKChjaGFyICopIHAg
LSBCSERSX09WRVJIRUFEKTsNCj4gPiAtICAgIGlmICggYi0+c2l6ZSAmIDEgKQ0KPiA+ICsgICAg
YiA9IChzdHJ1Y3QgYmhkciAqKSgoY2hhciAqKXAgLSBCSERSX09WRVJIRUFEKTsNCj4gPiArICAg
IGlmICggYi0+c2l6ZSAmIEZSRUVfQkxPQ0sgKQ0KPiA+ICAgICAgIHsNCj4gPiAgICAgICAgICAg
cCA9IChjaGFyICopcCAtIChiLT5zaXplICYgfjF1KTsNCj4gDQo+IFRoaXMgfjF1IGFsc28gd2Fu
dHMgdG8gYmVjb21lIH5GUkVFX0JMT0NLIHRoZW4uDQoNCk9oIHllcywgc29ycnkgSSBtaXNzZWQg
dGhhdC4NCg0KPiBJIGd1ZXNzIHRoZQ0KPiBjaGFuZ2UgaXMgZWFzeSBlbm91Z2ggdG8gbWFrZSB3
aGlsZSBjb21taXR0aW5nOyBJIGRvbid0DQo+IGV4cGVjdCB0aGUgbG9zcyBvZiB0aGUgdSBzdWZm
aXggdG8gYWN0dWFsbHkgY2F1c2UgYW55DQo+IHByb2JsZW1zLiBJbiBmYWN0IGl0cyBwcmVzZW5j
ZSB3YXMgbm90IGEgcHJvYmxlbSBvbmx5DQo+IGJlY2F1c2UgLT5zaXplIGNhbid0IGdldCB2ZXJ5
IGxhcmdlIGFuZCBpcyBvZiB1MzIgdHlwZS4NCj4gDQoNClllcywgcGxlYXNlIGdvIGFoZWFkIGFu
ZCBmaXggb24gY29tbWl0Lg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
