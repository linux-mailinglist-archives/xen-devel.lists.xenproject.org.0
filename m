Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70581C1E82
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:56:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsMV-0002jv-LR; Mon, 30 Sep 2019 09:52:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEsMU-0002jq-2i
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:52:58 +0000
X-Inumbo-ID: 13c6f544-e368-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 13c6f544-e368-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569837177;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FdLMoG+Fg67uo0heOuwxcUrf5xv7rff3rTGjsP0upRk=;
 b=S9pltvSJzMdnmR+QTThFa8OE4lckj3To8WQ6eUxZ/1VK5C0VDBfns6OW
 YEphuNfSpcDsLwmClBBn4QWRWHBPd8sRnIQhV+siUOOoiomvjo2w0uWvb
 sVuahpzODlcwxcgmpNRob0YY9uIpJ4/U8dfJrykI/goMQExOAHUW+OXEx o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xxwdWKroXfLKkknIYpR3yWeShhTsysuAehbi6A3xmt7IDeUmjsbadWOYBmLk66EVRaw3cykuMn
 AouQRVv5Yhuv1nDpGKSCnBGIGYFhC9gfe0x8ZynvhcA7PsWnkdYyZCzKL/BkHbb0rv0jqn17I0
 lSx/Q/+pNpeJANFaXYCfkaybEIRq0WNmxZH+QVJffog0IoJXqUtg20hNNkbhzuYJoIDA9kXKn1
 LeqadOui9kff6L5KjR4cYixpbAdzFLXziIwaDjsqMc3A/1VE7nI9R/s5yqQdOKVJWxFm4LRETp
 1wE=
X-SBRS: 2.7
X-MesageID: 6312475
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6312475"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: =?utf-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd253+PVNwkOIxkSNk0siYotC/adD8JHw///iaACAACdO0A==
Date: Mon, 30 Sep 2019 09:52:52 +0000
Message-ID: <18dc6e494b0e4dc8bf4797a5dfb8f45f@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
 <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
 <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
 <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
In-Reply-To: <67da0b6a-bf6f-ab2a-b875-031eaf8a6f33@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEwOjMwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBvc3N0ZXN0
IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3QtYWRtaW5AeGVucHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbeGVuLXVuc3RhYmxlIHRlc3RdIDE0MTk5MDogcmVncmVzc2lvbnMg
LSBGQUlMDQo+IA0KPiBPbiAzMC4wOS4xOSAxMToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEwOjA3DQo+ID4+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiA+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXINCj4gPG9zc3Rlc3QtDQo+ID4+IGFkbWluQHhlbnBy
b2plY3Qub3JnPg0KPiA+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0
ZXN0XSAxNDE5OTA6IHJlZ3Jlc3Npb25zIC0gRkFJTA0KPiA+Pg0KPiA+PiBPbiAzMC4wOS4yMDE5
IDEwOjE1LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+PiBJIGNhbid0IGZpbmQgYW55dGhpbmcg
Y29uY2x1c2l2ZSBpbiB0aGUgbG9ncywgYnV0IGl0IGxvb2tzIGxpa2UgaXQncyBtYWlubHkgQU1E
IGgvdyB0aGF0J3MgdGhlDQo+ID4+IHByb2JsZW0gYW5kIG9uIGF0IGxlYXN0IG9uZSBvZiB0aGUg
dGVzdCBmYWlsdXJlcyBJIHNlZSBsb3RzIG9mIHRoaXMga2luZCBvZiB0aGluZyBpbiB0aGUgc2Vy
aWFsDQo+IGxvZzoNCj4gPj4+DQo+ID4+PiBTZXAgMjkgMTc6MzM6NTUuMzE2NDIyIFsgIDE2OS44
Mjg1NjNdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODMxNzk4XSBJT19QQUdFX0ZBVUxU
DQo+ID4+IGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAw
MDAwODAgZmxhZ3M9MHgwMDIwXQ0KPiA+Pj4gU2VwIDI5IDE3OjMzOjU1LjM3NjU5NSBbICAxNjku
ODQwNDgxXSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg0MzcxNl0gSU9fUEFHRV9GQVVM
VA0KPiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAw
MDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPj4+IFNlcCAyOSAxNzozMzo1NS4zODg0NjkgWyAgMTY5
Ljg1MjM5OF0gQU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44NTU2MjddIElPX1BBR0VfRkFV
TFQNCj4gPj4gZGV2aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAw
MDAwMDA4MCBmbGFncz0weDAwMjBdDQo+ID4+PiBTZXAgMjkgMTc6MzM6NTUuNDAwNDg2IFsgIDE2
OS44NjQzMTFdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODY3NTQwXSBJT19QQUdFX0ZB
VUxUDQo+ID4+IGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAw
MDAwMDAwODAgZmxhZ3M9MHgwMDIwXQ0KPiA+Pj4gU2VwIDI5IDE3OjMzOjU1LjQxMjU1OSBbICAx
NjkuODc2MjI0XSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg3OTQ1OF0gSU9fUEFHRV9G
QVVMVA0KPiA+PiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAw
MDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPj4NCj4gPg0KPiA+IEFoIHllcywgdGhleSBtaWdo
dCBiZS4gU3RpbGwgbm90IGZvdW5kIGFueXRoaW5nIHVzZWZ1bCBpbiBvdGhlciBsb2dzLg0KPiAN
Cj4gT25lIGNhc2Ugd2FzIGZvciBzdHViLWRtLCBhbm90aGVyIG9uZSBmb3IgbWlncmF0aW9uLg0K
PiANCj4gSSBjb3VsZCBpbWFnaW5lIGluZm8tPnBhc3N0aHJvdWdoIGlzbid0IGluaXRpYWxpemVk
IHByb3Blcmx5IGZvciB0aGUNCj4gc3R1YmRvbSBjYXNlLCBhbmQgbWF5YmUgdGhlIGluZm9ybWF0
aW9uIGlzIG1pc3NpbmcgaW4gdGhlIG1pZ3JhdGlvbg0KPiBzdHJlYW0sIHRvbz8NCj4gDQoNClRy
dWUsIHRoZSBsYXN0IG1pbnV0ZSBhZGRpdGlvbiBvZiB0aGUgJ2RlZmF1bHQnIG9wdGlvbiBjb3Vs
ZCBoYXZlIG1lc3NlZCB0aGluZ3MgdXAuIEknbGwgY2hlY2sgdGhhdCBzY2VuYXJpby4NCg0KICBQ
YXVsDQoNCj4gDQo+IEp1ZXJnZW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
