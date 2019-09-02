Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F7FA58B3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4ms1-00015k-Ci; Mon, 02 Sep 2019 13:59:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4ms0-00015d-8s
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:59:48 +0000
X-Inumbo-ID: e65e6bda-cd89-11e9-aea3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e65e6bda-cd89-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567432778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJd6/ZDmLNaLIeblwXG719FwR16d8q4gCBsb98c/4DU=;
 b=hC/36iEKZqxtvjvNL4TLOE1NId1FPs0yfSPRm+mpaP0UrN2ME0xhtfgD
 jpgiddMIg6EAMeiUyqYNkLugvuXpxnFPirtvDaGj9pXVlo8C7Z1k551qa
 iRYStY+uLbJvbXyFaWAkTrGIO0s/i1rKbeZ+3lmKHQZBeg9MF+TAhSDpz E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1IrNfOvZwktPR2QuQ57y7np0PKR4jbVwJXtpLUHNryVbvWwn+be/8Wi6JsGK3cO8efNn6t/HXM
 jDS2ollCWH+SpYa5zYLXZyYJIEtjf8beCBCRr88GfM703HFXqMtWYKPIPcy85rHcg/YCuUBQt/
 RdlYDPu1a/J+M2vS2T/TeJNrMJcIbk1FG4Y5h9zu440bTgrY0TNVN80HKqNbV71NID5mKU+TgM
 g2fycb54Z6YlxwJIEw3v2ufm0oTI/Pgaj6pj+5w8qkNFBuqY+2YZXidfF6tXYA6/mSMrb+UmA2
 LLE=
X-SBRS: 2.7
X-MesageID: 5018458
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5018458"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVXw0b+0WFjb3WC0C8fMKn7++tpqcYNaWAgAApv5D//+psAIAAJTyQ
Date: Mon, 2 Sep 2019 13:59:33 +0000
Message-ID: <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
 <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
In-Reply-To: <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDE0OjQ2DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
PjsgV2VpTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDEvNl0g
eDg2L2RvbWFpbjogcmVtb3ZlIHRoZSAnb29zX29mZicgZmxhZw0KPiANCj4gT24gMDIuMDkuMjAx
OSAxNTowNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDEzOjM0DQo+ID4+
DQo+ID4+IE9uIDMwLjA4LjIwMTkgMTA6MjksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+IC0t
LSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMN
Cj4gPj4+IEBAIC0zMTMsMTEgKzMxMywxOSBAQCBzdGF0aWMgaW50IHNhbml0aXNlX2RvbWFpbl9j
b25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+ID4+PiAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICAgICAgfQ0KPiA+Pj4NCj4gPj4+IC0gICAgaWYg
KCAhKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpICYmDQo+ID4+PiAt
ICAgICAgICAgKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9oYXApICkNCj4gPj4+ICsg
ICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpICkNCj4g
Pj4+ICAgICAgew0KPiA+Pj4gLSAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIkhBUCByZXF1
ZXN0ZWQgZm9yIG5vbi1IVk0gZ3Vlc3RcbiIpOw0KPiA+Pj4gLSAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4+PiArICAgICAgICBpZiAoIGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9o
YXAgKQ0KPiA+Pj4gKyAgICAgICAgew0KPiA+Pj4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9H
X0lORk8sICJIQVAgcmVxdWVzdGVkIGZvciBub24tSFZNIGd1ZXN0XG4iKTsNCj4gPj4+ICsgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsgICAgICAgIH0NCj4gPj4+ICsNCj4gPj4+
ICsgICAgICAgIC8qDQo+ID4+PiArICAgICAgICAgKiBJdCBpcyBvbmx5IG1lYW5pbmdmdWwgZm9y
IFhFTl9ET01DVExfQ0RGX29vc19vZmYgdG8gYmUgY2xlYXINCj4gPj4+ICsgICAgICAgICAqIGZv
ciBIVk0gZ3Vlc3RzLg0KPiA+Pj4gKyAgICAgICAgICovDQo+ID4+PiArICAgICAgICBjb25maWct
PmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX29vc19vZmY7DQo+ID4+DQo+ID4+IC4uLiBJIHdvbmRl
ciB3aGV0aGVyIHRoaXMgbGFzdCBwYXJ0IHdvdWxkbid0IGJldHRlciBiZWxvbmcgaW50bw0KPiA+
PiB4ODYncyBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoKS4gQXJtLCB0byB0aGUgY29udHJh
cnksIHNob3VsZA0KPiA+PiBmb3JjZS9yZXF1aXJlIHRoZSBiaXQgdG8gYmUgdW5pZm9ybWx5IG9m
Zi4NCj4gPj4NCj4gPg0KPiA+IEknbSBzdXJlIEkgaGFkIGEgcmVhc29uIGZvciBkb2luZyBpdCBs
aWtlIHRoaXMgYnV0IGl0J3Mgc3VmZmljaWVudGx5IGxvbmcNCj4gPiBhZ28gbm93IHRoYXQgSSd2
ZSBmb3Jnb3R0ZW4gd2hhdCBpdCB3YXMqLiBXb3VsZCBpdCBiZSBvayB0byB0YWtlIHRoZSBjb2Rl
DQo+ID4gYXMtaXMgYW5kIEknbGwgaW52ZXN0aWdhdGUgd2hldGhlciB0aGlzIGNhbiBiZSB0aWRp
ZWQgdXA/DQo+IA0KPiBXZWxsLCB3aXRoIHRoaXMgcGVuZGluZyBxdWVzdGlvbiBJJ20gbGVzcyBp
bmNsaW5lZCB0byBzdG9wIHdhaXRpbmcgZm9yDQo+IHRoZSBvdXRzdGFuZGluZyBhY2tzLg0KPiAN
Cj4gPiBbICogSSBzdXNwZWN0IGl0IHdhcyBjb25jZXJuIG92ZXIgYnJlYWtpbmcgZXhpc3Rpbmcg
dG9vbC1zdGFja3MgYnkNCj4gPiByZXF1aXJpbmcgdGhlbSB0byBzZXQgYSBmbGFnIHRoYXQgcHJl
dmlvdXNseSB0aGV5IGRpZCBub3QgbmVlZCB0bywgYnV0DQo+ID4gSSdtIG5vdCBzdXJlIHRoYXQg
d2FzIHRoZSBvbmx5IHJlYXNvbiBdDQo+IA0KPiBTZWVtcyByYXRoZXIgdW5saWtlbHkgdG8gbWUs
IGFzIHRoZXJlIHdvdWxkbid0IGJlIGFueSBkaWZmZXJlbmNlIChmcm9tDQo+IHRvb2wgc3RhY2sg
cGVyc3BlY3RpdmUpIGlmIHRoZSBhZGp1c3RtZW50IHdhcyBkb25lIGJ5IHBlci1hcmNoIGNvZGUu
DQo+IA0KDQpPaywgaWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgaXQgSSdsbCBtb3ZlIHRoZSBo
dW5rLg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
