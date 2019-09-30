Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9FC1DCE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErnt-0007kW-Qk; Mon, 30 Sep 2019 09:17:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iErns-0007kR-5x
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:17:12 +0000
X-Inumbo-ID: 14b3868e-e363-11e9-96cb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 14b3868e-e363-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569835031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yjgIqLISfEmXR+0IJmBrCVPZASshpktVzi04wd4+aNY=;
 b=ThYjl8hwi9zLQyk6BDWuVnqcMKg0XQmwWe3db/ldI7xeTctoYN7WY0Xd
 XAO0V8/GAMWNtifYGWYJCgg6OD0HH1Nb39eBst3qoSmlRBpEiTHKfnLIL
 qSb0du3RUe6H5lnVeF5VKqSU8APiqyKlrsoBmZAPzENalvzSQ8wFGdHaE Q=;
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
IronPort-SDR: Fu8LD4vKd1NHCddJ7mHXWFdzG7E0rLo+1hnUe88u4gssK/TkOBR6MiQJYUMjMmpNhd+zNYyfb6
 GvpEO23QPimF6z4Bn6CyWqmJB3tx6KHfGc7auOEczT48eeFixbUU3PWYoeq0eGgdWFS0JhcZCH
 4BnnzcFKrJbwUIQpl9ZvlsFViSbWM4xHaKGRPb2eUkPE9Xo4IwbD+M5l1+gxiTXeeHjG0K4mKl
 r8VotQN3kpXwqWL+i8vYLq1/MhlZyo0MlTb6ZuSdKpw0DRGB0UKohhjNWd6wMD1FUemqOaIgeJ
 TEs=
X-SBRS: 2.7
X-MesageID: 6240591
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6240591"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd253+PVNwkOIxkSNk0siYotC/adD8JHw
Date: Mon, 30 Sep 2019 09:17:06 +0000
Message-ID: <4ddb83bbceeb4c858f500976da9a73f2@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
 <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
 <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
In-Reply-To: <cc6e90c1-8f15-e2d3-144a-6a16c11e911f@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDEwOjA3DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBvc3N0ZXN0
IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3QtDQo+IGFkbWluQHhlbnByb2plY3Qub3JnPg0KPiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0ZXN0XSAxNDE5OTA6IHJlZ3Jlc3Np
b25zIC0gRkFJTA0KPiANCj4gT24gMzAuMDkuMjAxOSAxMDoxNSwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+IEkgY2FuJ3QgZmluZCBhbnl0aGluZyBjb25jbHVzaXZlIGluIHRoZSBsb2dzLCBidXQg
aXQgbG9va3MgbGlrZSBpdCdzIG1haW5seSBBTUQgaC93IHRoYXQncyB0aGUNCj4gcHJvYmxlbSBh
bmQgb24gYXQgbGVhc3Qgb25lIG9mIHRoZSB0ZXN0IGZhaWx1cmVzIEkgc2VlIGxvdHMgb2YgdGhp
cyBraW5kIG9mIHRoaW5nIGluIHRoZSBzZXJpYWwgbG9nOg0KPiA+DQo+ID4gU2VwIDI5IDE3OjMz
OjU1LjMxNjQyMiBbICAxNjkuODI4NTYzXSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljgz
MTc5OF0gSU9fUEFHRV9GQVVMVA0KPiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJl
c3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPiBTZXAgMjkgMTc6MzM6NTUu
Mzc2NTk1IFsgIDE2OS44NDA0ODFdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODQzNzE2
XSBJT19QQUdFX0ZBVUxUDQo+IGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0w
eDAwMDAwMDAwMDAwMDAwODAgZmxhZ3M9MHgwMDIwXQ0KPiA+IFNlcCAyOSAxNzozMzo1NS4zODg0
NjkgWyAgMTY5Ljg1MjM5OF0gQU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44NTU2MjddIElP
X1BBR0VfRkFVTFQNCj4gZGV2aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAw
MDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdDQo+ID4gU2VwIDI5IDE3OjMzOjU1LjQwMDQ4NiBb
ICAxNjkuODY0MzExXSBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg2NzU0MF0gSU9fUEFH
RV9GQVVMVA0KPiBkZXZpY2U9MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAw
MDAwMDAwMDgwIGZsYWdzPTB4MDAyMF0NCj4gPiBTZXAgMjkgMTc6MzM6NTUuNDEyNTU5IFsgIDE2
OS44NzYyMjRdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODc5NDU4XSBJT19QQUdFX0ZB
VUxUDQo+IGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAw
MDAwODAgZmxhZ3M9MHgwMDIwXQ0KPiANCg0KQWggeWVzLCB0aGV5IG1pZ2h0IGJlLiBTdGlsbCBu
b3QgZm91bmQgYW55dGhpbmcgdXNlZnVsIGluIG90aGVyIGxvZ3MuDQoNCiAgUGF1bA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
