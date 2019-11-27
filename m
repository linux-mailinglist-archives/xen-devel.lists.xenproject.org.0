Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23B610AC19
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 09:44:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZsu3-0003mw-9y; Wed, 27 Nov 2019 08:42:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZsu1-0003mk-Aa
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 08:42:25 +0000
X-Inumbo-ID: d553d996-10f1-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d553d996-10f1-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574844145; x=1606380145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fVjnoESlu6F5aj2TxN2UWNGYqW/ivoRN2WUYmWc2ll0=;
 b=nALz3MyaUCU9cIfx7HUhgyVb3ySk9qBkneDJLA/5AMsm904fUFW67Q2u
 2D1s8447XM60hABhQeBwrbQmm+IcL8Uzt6x4LwDaxoPx2YEBmKy8t4vqg
 sYjo2CGnkB6e3XEEqg17oe98W8GM8v8kRdNW9mKIMfYHCpWQfjfE51LMK c=;
IronPort-SDR: 9CUz4/OFP+bGkbPHLrg90t/Pj1f9o0ktAF4SwCGHobpDE6Ab7dOm2dYTHCk536EZL3OQwvkevp
 ghW/LFi5/YTg==
X-IronPort-AV: E=Sophos;i="5.69,248,1571702400"; 
   d="scan'208";a="1751457"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 27 Nov 2019 08:42:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0ACCFA2245; Wed, 27 Nov 2019 08:42:07 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 08:42:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 08:42:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 08:42:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
Thread-Index: AQHVpH29Wt0+ySss8US4fj89FHkMnqedtvYAgAD8w4A=
Date: Wed, 27 Nov 2019 08:42:06 +0000
Message-ID: <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <24029.25218.75565.126333@mariner.uk.xensource.com>
In-Reply-To: <24029.25218.75565.126333@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Hans van Kranenburg <hans@knorrie.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSWFuDQo+IEphY2tz
b24NCj4gU2VudDogMjYgTm92ZW1iZXIgMjAxOSAxNzozNg0KPiBUbzogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+OyBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gPG1hcm1hcmVrQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+OyBIYW5zIHZhbiBLcmFuZW5idXJnIDxoYW5zQGtub3JyaWUub3Jn
PjsNCj4gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMg
Mi8yXSBSYXRpb25hbGl6ZSBtYXhfZ3JhbnRfZnJhbWVzDQo+IGFuZCBtYXhfbWFwdHJhY2tfZnJh
bWVzIGhhbmRsaW5nDQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRDSCBmb3ItNC4x
MyAyLzJdIFJhdGlvbmFsaXplIG1heF9ncmFudF9mcmFtZXMNCj4gYW5kIG1heF9tYXB0cmFja19m
cmFtZXMgaGFuZGxpbmciKToNCj4gPiBYZW4gdXNlZCB0byBoYXZlIHNpbmdsZSwgc3lzdGVtLXdp
ZGUgbGltaXRzIGZvciB0aGUgbnVtYmVyIG9mIGdyYW50DQo+ID4gZnJhbWVzIGFuZCBtYXB0cmFj
ayBmcmFtZXMgYSBndWVzdCB3YXMgYWxsb3dlZCB0byBjcmVhdGUuICBJbmNyZWFzaW5nDQo+ID4g
b3IgZGVjcmVhc2luZyB0aGlzIHNpbmdsZSBsaW1pdCBvbiB0aGUgWGVuIGNvbW1hbmQtbGluZSB3
b3VsZCBjaGFuZ2UNCj4gPiB0aGUgbGltaXQgZm9yIGFsbCBndWVzdHMgb24gdGhlIHN5c3RlbS4N
Cj4gDQo+IElmIEkgYW0gbm90IG1pc3Rha2VuLCB0aGlzIGlzIGFuIGltcG9ydGFudCBjaGFuZ2Ug
dG8gaGF2ZS4NCj4gDQoNCkl0IGlzLCBhbmQgbWFueSB0aGFua3MgdG8gR2VvcmdlIGZvciBwaWNr
aW5nIHRoaXMgdXAuDQoNCj4gSSBoYXZlIHNlZW4gcmVwb3J0cyBvZiB1c2VycyB3aG8gcmFuIG91
dCBvZiBncmFudC9tYXB0cmFjayBmcmFtZXMNCj4gYmVjYXVzZSBvZiB1cGRhdGVzIHRvIHVzZSBt
dWx0aXJpbmcgcHJvdG9jb2xzIGV0Yy4gIFRoZSBlcnJvciBtZXNzYWdlcw0KPiBhcmUgbm90IHZl
cnkgZ29vZCBhbmQgdGhlIHJlY29tbWVuZGVkIHdvcmthcm91bmQgaGFzIGJlZW4gdG8gaW5jcmVh
c2UNCj4gdGhlIGRlZmF1bHQgbGltaXQgb24gdGhlIGh5cGVydmlzb3IgY29tbWFuZCBsaW5lLg0K
PiANCj4gSXQgaXMgaW1wb3J0YW50IHRoYXQgd2UgZG9uJ3QgYnJlYWsgdGhhdCB3b3JrYXJvdW5k
IQ0KDQpBbGFzIGl0IGhhcyBhcHBhcmVudGx5IGJlZW4gYnJva2VuIGZvciBzZXZlcmFsIHJlbGVh
c2VzIG5vdyA6LSgNCg0KICBQYXVsDQoNCj4gDQo+IFRoYW5rcywNCj4gSWFuLg0KPiANCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVs
IG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
