Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1723C36E7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFIw3-0008KN-6D; Tue, 01 Oct 2019 14:15:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWiX=X2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFIw1-0008KI-RR
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:15:25 +0000
X-Inumbo-ID: e9203802-e455-11e9-bf31-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id e9203802-e455-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569939324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y6IhObJYLR2scTcGTVcfSXGZO5Q5i8CVykXXnSqV6uk=;
 b=hC4n3pQ/Sgdjrbu+WJrf/qbYbgYQJncrWrk5wHAUNZxs79D0zxjR845+
 FneBS3R1VqBrXUaGyF7AtZ46r30cJWph8diJGlBEPqckcXKe3KW49Ewkr
 dTCgX2NJZNKyxsrrFXPsW2Q39CaRXRAi0Yr9TSwV43JtjBkosNqx9Rk0S w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WewehEOafqF9EVg0llFSPlpJBrVsNX1q8iOg+j45E4/laHwj+5MevlqZPw3D/UZkDR+7/50VVR
 wADZoCHdPLSnr9NOovFY5Pzxs75KvFLi0P3Hplpw1irwkMxNcJ3BH3fiCJLAUuZ+u89CZ9Cl+L
 DJMBBefZmto/vI0MEZGEMIwokslhFfHvKo9FPDvsXNsRdnLd5B8BYjj/guyCsVn+CQ2V2p195T
 /3xUWR02uZVfWo4v/7fZhPGjjVv4CvHb+mXkw9/QFIIfaCPiqu3q52v/tKMmASO9ndoiJHy9+z
 iEY=
X-SBRS: 2.7
X-MesageID: 6553445
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6553445"
Date: Tue, 1 Oct 2019 16:15:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191001141515.k2ukmwo36kfizx5r@Air-de-Roger>
References: <98fd2d35-30f6-961d-a03d-3354b77d49b0@suse.com>
 <20191001113008.dquc2jhxgjenst5a@Air-de-Roger>
 <72ca9492-5204-5f5c-1ee1-2760cf98559a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72ca9492-5204-5f5c-1ee1-2760cf98559a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDE6NDA6NTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDEuMTAuMjAxOSAxMzozMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIE9jdCAwMSwgMjAxOSBhdCAxMTowNzo1NUFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RtLmMKPiA+PiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL2RtLmMKPiA+PiBAQCAtMjU1LDE2ICsyNTUsMzMgQEAgc3RhdGljIGludCBzZXRfbWVt
X3R5cGUoc3RydWN0IGRvbWFpbiAqZAo+ID4+ICAKPiA+PiAgICAgIG1lbV90eXBlID0gYXJyYXlf
aW5kZXhfbm9zcGVjKGRhdGEtPm1lbV90eXBlLCBBUlJBWV9TSVpFKG1lbXR5cGUpKTsKPiA+PiAg
Cj4gPj4gLSAgICBpZiAoIG1lbV90eXBlID09IEhWTU1FTV9pb3JlcV9zZXJ2ZXIgKQo+ID4+ICsg
ICAgc3dpdGNoICggbWVtX3R5cGUgKQo+ID4+ICAgICAgewo+ID4+ICAgICAgICAgIHVuc2lnbmVk
IGludCBmbGFnczsKPiA+PiAgCj4gPj4gKyAgICBjYXNlIEhWTU1FTV9pb3JlcV9zZXJ2ZXI6Cj4g
Pj4gICAgICAgICAgaWYgKCAhaGFwX2VuYWJsZWQoZCkgKQo+ID4+ICAgICAgICAgICAgICByZXR1
cm4gLUVPUE5PVFNVUFA7Cj4gPj4gIAo+ID4+ICAgICAgICAgIC8qIERvIG5vdCBjaGFuZ2UgdG8g
SFZNTUVNX2lvcmVxX3NlcnZlciBpZiBubyBpb3JlcSBzZXJ2ZXIgbWFwcGVkLiAqLwo+ID4+ICAg
ICAgICAgIGlmICggIXAybV9nZXRfaW9yZXFfc2VydmVyKGQsICZmbGFncykgKQo+ID4+ICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+PiArCj4gPj4gKyAgICAgICAgYnJlYWs7Cj4gPj4g
Kwo+ID4+ICsgICAgY2FzZSBIVk1NRU1fcmFtX3JvOgo+ID4+ICsgICAgICAgIC8qIHAybV9yYW1f
cm8gY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4gSU9NTVUgbWFwcGluZ3MuICovCj4gPj4gKyAgICAg
ICAgZG9tYWluX2xvY2soZCk7Cj4gPj4gKyAgICAgICAgaWYgKCBoYXNfYXJjaF9wZGV2cyhkKSAp
Cj4gPiAKPiA+IEkgd291bGQgdXNlIGlzX2lvbW11X2VuYWJsZWQgYmVjYXVzZSBJIHRoaW5rIGl0
J3MgY2xlYXJlciBpbiB0aGlzCj4gPiBjb250ZXh0IChnaXZpbmcgdGhlIGNvbW1lbnQgYWJvdmUg
ZXhwbGljaXRseSByZWZlcnMgdG8gaGF2aW5nIGlvbW11Cj4gPiBtYXBwaW5ncykuCj4gCj4gQnV0
IHRoZSB3aG9sZSBwb2ludCBvZiB0aGUgcmUtYmFzaW5nIG92ZXIgUGF1bCdzIGNoYW5nZSBpcyB0
aGF0IG5vdwo+IHRoZSBvcGVyYXRpb24gZ2V0cyByZWZ1c2VkIG9ubHkgaWYgYSBkZXZpY2Ugd2Fz
IGFjdHVhbGx5IGFzc2lnbmVkLgo+IAo+ID4+ICsgICAgICAgICAgICByYyA9IC1FWERFVjsKPiA+
IAo+ID4gRU9QTk9UU1VQUCBtaWdodCBiZSBiZXR0ZXIsIHNpbmNlIGl0J3MgcG9zc2libGUgdGhh
dCBmdXR1cmUgaW9tbXVzCj4gPiBzdXBwb3J0IHN1Y2ggcGFnZSB0eXBlPwo+IAo+IEkgZG9uJ3Qg
dGhpbmsgZnV0dXJlIElPTU1VIGJlaGF2aW9yIGFmZmVjdHMgdGhlIGNob2ljZSBvZiBlcnJvcgo+
IGNvZGUuIEkgd2FudGVkIHRvIHVzZSBzb21ldGhpbmcgaGFsZiB3YXkgcmVhc29uYWJsZSwgeWV0
IG5vdCB0b28KPiBjb21tb24sIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gZWFzaWx5IGlkZW50aWZ5
IHRoZSBzb3VyY2Ugb2YgdGhlCj4gZXJyb3IuIElmIHlvdSBhbmQgb3RoZXJzIHRoaW5rIHRoaXMg
aXNuJ3QgYSBtZWFuaW5nZnVsIGNvbmNlcm4sCj4gSSdkIGJlIG9rYXkgc3dpdGNoaW5nIHRvIC1F
T1BOT1RTVVBQLgo+IAo+ID4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4g
Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+PiBAQCAtMTQ4NiwxNSAr
MTQ4NiwzMyBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqCj4gPj4g
ICAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkKPiA+PiAgICAgICAgICByZXR1cm4gMDsK
PiA+PiAgCj4gPj4gLSAgICAvKiBQcmV2ZW50IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBv
ciBtZW0gc2hhcmluZyBoYXZlIGJlZW4gCj4gPj4gLSAgICAgKiBlbmFibGVkIGZvciB0aGlzIGRv
bWFpbiAqLwo+ID4+IC0gICAgaWYgKCB1bmxpa2VseShkLT5hcmNoLmh2bS5tZW1fc2hhcmluZ19l
bmFibGVkIHx8Cj4gPj4gLSAgICAgICAgICAgICAgICAgIHZtX2V2ZW50X2NoZWNrX3JpbmcoZC0+
dm1fZXZlbnRfcGFnaW5nKSB8fAo+ID4+ICsgICAgZG9tYWluX2xvY2soZCk7Cj4gPj4gKwo+ID4+
ICsgICAgLyoKPiA+PiArICAgICAqIFByZXZlbnQgZGV2aWNlIGFzc2lnbm1lbnQgaWYgYW55IG9m
Cj4gPj4gKyAgICAgKiAtIG1lbSBwYWdpbmcKPiA+PiArICAgICAqIC0gbWVtIHNoYXJpbmcKPiA+
PiArICAgICAqIC0gdGhlIHAybV9yYW1fcm8gdHlwZQo+ID4+ICsgICAgICogLSBnbG9iYWwgbG9n
LWRpcnR5IG1vZGUKPiA+PiArICAgICAqIGFyZSBpbiB1c2UgYnkgdGhpcyBkb21haW4uCj4gPj4g
KyAgICAgKi8KPiA+PiArICAgIGlmICggdW5saWtlbHkodm1fZXZlbnRfY2hlY2tfcmluZyhkLT52
bV9ldmVudF9wYWdpbmcpIHx8CgpXb3VsZCBiZSBuaWNlIHRvIGhhdmUgc29tZSBzeW50YWN0aWMg
c3VnYXIgbGlrZSB2bV9ldmVudF9lbmFibGVkIG9yCnNvbWUgc3VjaC4KCj4gPj4gKyNpZmRlZiBD
T05GSUdfSFZNCj4gPj4gKyAgICAgICAgICAgICAgICAgIChpc19odm1fZG9tYWluKGQpICYmCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8
fAo+ID4+ICsgICAgICAgICAgICAgICAgICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCkp
IHx8Cj4gPj4gKyNlbmRpZgoKRG8geW91IHJlYWxseSBuZWVkIHRoZSBDT05GSUdfSFZNIGd1YXJk
cz8gaXNfaHZtX2RvbWFpbiBhbHJlYWR5IGhhcyBhCklTX0VOQUJMRUQoQ09ORklHX0hWTSkuCgo+
ID4+ICAgICAgICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0
eSkgKQo+ID4gCj4gPiBJcyBzdWNoIGNoZWNrIG5lZWRlZCBhbnltb3JlPwo+ID4gCj4gPiBXaXRo
IHRoZSBlbmFibGluZyBvZiB0aGUgaW9tbXUgcmlnaHQgYXQgZG9tYWluIGNyZWF0aW9uIGl0IHNo
b3VsZG4ndAo+ID4gYmUgcG9zc2libGUgdG8gZW5hYmxlIGFueSBvZiB0aGUgYWJvdmUgZmVhdHVy
ZXMgYXQgYWxsIGFueW1vcmUuCj4gCj4gU2VlIGFib3ZlIC0gYWxsIHN1Y2ggY2hlY2tzIHNob3Vs
ZCBub3cgYmUgLyBnZXQgY29udmVydGVkIHRvIGNoZWNrCj4gd2hldGhlciBkZXZpY2VzIGFyZSBh
c3NpZ25lZCwgbm90IHdoZXRoZXIgSU9NTVUgcGFnZSB0YWJsZXMgZXhpc3QuCj4gQWZ0ZXIgYWxs
IHdlIHdhbnQgdG8gcmVmdXNlIHJlcXVlc3RzIG9ubHkgaWYgc3RyaWN0bHkgbmVjZXNzYXJ5LgoK
T2ggcmlnaHQsIEkgd2FzIG1pc3NpbmcgdGhlIHdob2xlIHBvaW50IHRoZW4uIFNvIHdlIHN0aWxs
IGtlZXAgdGhlCmlvbW11IGVuYWJsZWQgdG9nZXRoZXIgd2l0aCBpbnRyb3NwZWN0aW9uIG9yIHJh
bV9ybyBhcyBsb25nIGFzIHRoZXJlCmFyZSBubyBkZXZpY2VzIGFzc2lnbmVkLgoKUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
