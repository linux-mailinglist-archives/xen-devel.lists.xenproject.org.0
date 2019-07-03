Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749385E1C1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:16:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicGw-0005mE-3k; Wed, 03 Jul 2019 10:13:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eYTC=VA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hicGu-0005m4-7b
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:13:52 +0000
X-Inumbo-ID: 3f40078e-9d7b-11e9-bf16-a75bedc76cae
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f40078e-9d7b-11e9-bf16-a75bedc76cae;
 Wed, 03 Jul 2019 10:13:48 +0000 (UTC)
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
IronPort-SDR: Jcg1waMs/cEC04e/cl/MppVyNEDDUEafB7Yn+0OihB8CJyPLpONUPN4BPL68KdBDPwjQz+MlJb
 5wdpqKk/mxdW0Xikb8zFvUlnl8qVBBlzPxHE/GtbI8gZZC63EyKaJvr5eeRPXrPxF/VNjCLyCe
 wDTpFtYddJ8zzYYMumZwoQdHj+QlZTHlb4yJymt5mg1QfIfsN328M7HhmJGnvcOmkM61fSrevy
 fWIZZfrSYSofcZbn1Rno+3Hwqo4CvQRNq1Dvavl70V9kip32VE2XW71dsmuZeYUGlHAk7APKxq
 wtE=
X-SBRS: 2.7
X-MesageID: 2565135
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2565135"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH 2/3] xmalloc: don't evaluate ADD_REGION without holding
 the pool lock
Thread-Index: AQHVMPSdA/twfVfKQUaCaWmgyZtzN6a4h8mAgAAmBjA=
Date: Wed, 3 Jul 2019 10:13:44 +0000
Message-ID: <6406f45dd0b14475b4edcc897a31a9f9@AMSPEX02CL03.citrite.net>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
 <20190702163840.2107-3-paul.durrant@citrix.com>
 <89a07d9f-1c10-90f6-55aa-659a27641d7b@suse.com>
In-Reply-To: <89a07d9f-1c10-90f6-55aa-659a27641d7b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/3] xmalloc: don't evaluate ADD_REGION
 without holding the pool lock
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
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxMDo1Nw0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzNdIHhtYWxsb2M6IGRvbid0IGV2YWx1YXRlIEFERF9SRUdJT04gd2l0aG91dCBob2xk
aW5nIHRoZSBwb29sIGxvY2sNCj4gDQo+IE9uIDAyLjA3LjIwMTkgMTg6MzgsIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jDQo+ID4gKysrIGIv
eGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYw0KPiA+IEBAIC0zODAsMTggKzM4MCwyMiBAQCB2b2lk
ICp4bWVtX3Bvb2xfYWxsb2ModW5zaWduZWQgbG9uZyBzaXplLCBzdHJ1Y3QgeG1lbV9wb29sICpw
b29sKQ0KPiA+ICAgICAgaW50IGZsLCBzbDsNCj4gPiAgICAgIHVuc2lnbmVkIGxvbmcgdG1wX3Np
emU7DQo+ID4NCj4gPiArICAgIHNwaW5fbG9jaygmcG9vbC0+bG9jayk7DQo+ID4gICAgICBpZiAo
IHBvb2wtPmluaXRfcmVnaW9uID09IE5VTEwgKQ0KPiA+ICAgICAgew0KPiA+ICsgICAgICAgc3Bp
bl91bmxvY2soJnBvb2wtPmxvY2spOw0KPiA+ICAgICAgICAgaWYgKCAocmVnaW9uID0gcG9vbC0+
Z2V0X21lbShwb29sLT5pbml0X3NpemUpKSA9PSBOVUxMICkNCj4gPiAgICAgICAgICAgICBnb3Rv
IG91dDsNCj4gPiArICAgICAgIHNwaW5fbG9jaygmcG9vbC0+bG9jayk7DQo+ID4gICAgICAgICBB
RERfUkVHSU9OKHJlZ2lvbiwgcG9vbC0+aW5pdF9zaXplLCBwb29sKTsNCj4gPiAtICAgICAgIHBv
b2wtPmluaXRfcmVnaW9uID0gcmVnaW9uOw0KPiA+ICsgICAgICAgLyogUmUtY2hlY2sgc2luY2Ug
dGhlIGxvY2sgd2FzIGRyb3BwZWQgKi8NCj4gPiArICAgICAgIGlmICggcG9vbC0+aW5pdF9yZWdp
b24gPT0gTlVMTCApDQo+ID4gKyAgICAgICAgICAgcG9vbC0+aW5pdF9yZWdpb24gPSByZWdpb247
DQo+ID4gICAgICB9DQo+IA0KPiBJbnN0ZWFkIG9mIHRoaXMsIGhvdyBhYm91dCBkZWxldGluZyB0
aGUgaW5pdF9yZWdpb24gZmllbGQ/DQo+IEl0J3Mgbm90IHJlYWxseSB1c2VkIGFueXdoZXJlLiBJ
J20gbm90IGdvaW5nIHRvIGV4Y2x1ZGUgdGhhdA0KPiBmdW5jdGlvbnMgbGlrZSBGSU5EX1NVSVRB
QkxFX0JMT0NLKCkgZXhwZWN0IF9zb21lXyByZWdpb24gdG8NCj4gYmUgdGhlcmUgaW4gdGhlIHBv
b2wsIGJ1dCB0aGF0IHN0aWxsIHdvdWxkbid0IHJlcXVpcmUNCj4gdHJhY2tpbmcgd2hpY2ggb25l
IHdhcyB0aGUgZmlyc3QgdG8gZ2V0IGFsbG9jYXRlZC4gQSBjaGVjaw0KPiBsaWtlIHRoYXQgaW4g
eG1lbV9wb29sX2Rlc3Ryb3koKSB3b3VsZCB0aGVuIGRvIGhlcmUgdG8gbWFrZQ0KPiBzdXJlIGF0
IGxlYXN0IG9uZSByZWdpb24gaXMgdGhlcmUuDQo+IA0KDQpPaywgSSBjYW4gZG8gaXQgdGhhdCB3
YXkgaW5zdGVhZC4uLiBub3QgdGhhdCBhbnl0aGluZyBjYWxscyB4bWVtX3Bvb2xfZGVzdHJveSBh
dCB0aGUgbW9tZW50IGFueXdheS4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
