Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1A14ED82
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:37:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWRc-00053b-UL; Fri, 31 Jan 2020 13:34:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixWRb-00053V-9u
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:34:47 +0000
X-Inumbo-ID: 72a68fe4-442e-11ea-8396-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72a68fe4-442e-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580477688; x=1612013688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ogODQcZCclsawk4KG0LuQiXQ/0FQ7X57bLBxBXHONto=;
 b=mF1PeSdStMHm1dSHbeDe15AONNhBKhJ6Q17aUsWKyzyM0Cs0Nb/hf/ct
 kR9NohO6WLFcnW3QwhD7xrwb4kBleZShhX9vLQKb2zZBoIAxVqXvHdy+7
 9v5RQg8oaX86I3LdEYntg4IcpOF8EcAw4uuNGCcc0Abt9x8gtoDUDCjPQ A=;
IronPort-SDR: byW6bjl+A7iF1Y6+m/QZR31jbcpFwY8MXN7M9G3bWe69eRnOv3r1QsuEEztGdoj5JgIGJzvY8p
 UzYscqj+p3bg==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="15016932"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 31 Jan 2020 13:34:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id ECD1FC5E03; Fri, 31 Jan 2020 13:34:42 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 13:34:42 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 13:34:41 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 13:34:41 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v8 1/4] x86 / vmx: move teardown from domain_destroy()...
Thread-Index: AQHV132n+XhnS5nqHEeOZtE23jo8TKgExsaAgAAAdbA=
Date: Fri, 31 Jan 2020 13:34:41 +0000
Message-ID: <8b7cd64eb28244fea579f837fcffda48@EX13D32EUC003.ant.amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-2-pdurrant@amazon.com>
 <e83d45fd-301e-036b-48f0-5e9cf8a343d3@suse.com>
In-Reply-To: <e83d45fd-301e-036b-48f0-5e9cf8a343d3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v8 1/4] x86 / vmx: move teardown from
 domain_destroy()...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMxIEphbnVhcnkgMjAyMCAxMzozMg0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Ow0KPiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMS80XSB4ODYgLyB2bXg6
IG1vdmUgdGVhcmRvd24gZnJvbQ0KPiBkb21haW5fZGVzdHJveSgpLi4uDQo+IA0KPiBPbiAzMC4w
MS4yMDIwIDE1OjU3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4uIHRvIGRvbWFpbl9yZWxp
bnF1aXNoX3Jlc291cmNlcygpLg0KPiA+DQo+ID4gVGhlIHRlYXJkb3duIGNvZGUgZnJlZXMgdGhl
IEFQSUN2IHBhZ2UuIFRoaXMgZG9lcyBub3QgbmVlZCB0byBiZSBkb25lDQo+IGxhdGUNCj4gPiBz
byBkbyBpdCBpbiBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSByYXRoZXIgdGhhbiBkb21h
aW5fZGVzdHJveSgpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPg0KPiANCj4gQnR3LiwgdGhpcyBjYW4gaGF2ZSBteQ0KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBhcyBzb29uIGFzICJ4ODYv
SFZNOiByZWxpbnF1aXNoIHJlc291cmNlcyBhbHNvIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCki
DQo+IGhhcyBnb25lIGluLiBCdXQgdGhhdCdzIHN0aWxsIHBlbmRpbmcgYW4gYWNrIG9yIG90aGVy
d2lzZSBieSB5b3UuDQo+IA0KDQpPaywgdGhhbmtzLCBJJ2xsIGdldCBvbiBhbmQgcmV2aWV3IHRo
YXQuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
