Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B12116D53
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:53:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieIUe-0007kc-B7; Mon, 09 Dec 2019 12:50:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieIUc-0007kX-28
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:50:26 +0000
X-Inumbo-ID: 772d96f1-1a82-11ea-87ca-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 772d96f1-1a82-11ea-87ca-12813bfff9fa;
 Mon, 09 Dec 2019 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575895826; x=1607431826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JwipO2X1VmQq2Ag5f6aOSWXN7UQj3QQuwEodP/dnAlU=;
 b=R18xQG7q8jo54dTrkF/p5mCdFlXSFwTRFfhB7PpNevbqVyk5HbmwI9Ux
 6ktbr+LU2KAZVYmyIQYjWJZlTjX9pCOlB/QKl7/7/5Wh2IiV7AlfLUYir
 +pE4uyihiiM4GvPdzS6O9B9j+82fOq1lzrD06Hiq8NBi9zoRIde1AyYy6 A=;
IronPort-SDR: ed04pFZ02vaQIEH7Le5nNdxA7GWYxUdU+Lr2RmSO7Wi8qRP/6Ed3kWP+0iDfPs27mx9+x1zrd7
 kbXw6uPB33Cg==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="4015538"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 09 Dec 2019 12:50:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id B67EFA15C3; Mon,  9 Dec 2019 12:50:11 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:50:11 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:50:10 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 12:50:10 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending
 work in FRONT/BACK_RING_ATTACH
Thread-Index: AQHVq3SEQ22T+F2O5E+9q5oO42T5TKextFGAgAAC9wCAAA/DwA==
Date: Mon, 9 Dec 2019 12:50:10 +0000
Message-ID: <33b8644a74034544aa72187428780d98@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-4-pdurrant@amazon.com>
 <20191209114137.GT980@Air-de-Roger>
 <5777c17b-9028-2525-1322-6c05f1ce3aab@suse.com>
In-Reply-To: <5777c17b-9028-2525-1322-6c05f1ce3aab@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending
 work in FRONT/BACK_RING_ATTACH
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSsO8cmdlbiBH
cm/Dnw0KPiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjUyDQo+IFRvOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IER1cnJhbnQsIFBhdWwNCj4gPHBkdXJyYW50QGFt
YXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEJvcmlzIE9z
dHJvdnNreQ0KPiA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMy80XSB4ZW4vaW50ZXJmYWNl
OiBkb24ndCBkaXNjYXJkIHBlbmRpbmcNCj4gd29yayBpbiBGUk9OVC9CQUNLX1JJTkdfQVRUQUNI
DQo+IA0KPiBPbiAwOS4xMi4xOSAxMjo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPiBP
biBUaHUsIERlYyAwNSwgMjAxOSBhdCAwMjowMToyMlBNICswMDAwLCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+ID4+IEN1cnJlbnRseSB0aGVzZSBtYWNyb3Mgd2lsbCBza2lwIG92ZXIgYW55IHJlcXVl
c3RzL3Jlc3BvbnNlcyB0aGF0IGFyZQ0KPiA+PiBhZGRlZCB0byB0aGUgc2hhcmVkIHJpbmcgd2hp
bHN0IGl0IGlzIGRldGFjaGVkLiBUaGlzLCBpbiBnZW5lcmFsLCBpcw0KPiBub3QNCj4gPj4gYSBk
ZXNpcmFibGUgc2VtYW50aWMgc2luY2UgbW9zdCBmcm9udGVuZCBpbXBsZW1lbnRhdGlvbnMgd2ls
bA0KPiBldmVudHVhbGx5DQo+ID4+IGJsb2NrIHdhaXRpbmcgZm9yIGEgcmVzcG9uc2Ugd2hpY2gg
d291bGQgZWl0aGVyIG5ldmVyIGFwcGVhciBvciBuZXZlcg0KPiBiZQ0KPiA+PiBwcm9jZXNzZWQu
DQo+ID4+DQo+ID4+IE5PVEU6IFRoZXNlIG1hY3JvcyBhcmUgY3VycmVudGx5IHVudXNlZC4gQkFD
S19SSU5HX0FUVEFDSCgpLCBob3dldmVyLA0KPiB3aWxsDQo+ID4+ICAgICAgICBiZSB1c2VkIGlu
IGEgc3Vic2VxdWVudCBwYXRjaC4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+DQo+ID4gVGhvc2UgaGVhZGVycyBjb21lIGZy
b20gWGVuLCBhbmQgc2hvdWxkIGJlIG1vZGlmaWVkIGluIFhlbiBmaXJzdCBhbmQNCj4gPiB0aGVu
IGltcG9ydGVkIGludG8gTGludXggSU1PLg0KPiANCj4gSW4gdGhlb3J5LCB5ZXMuIEJ1dCB0aGUg
WGVuIHZhcmlhbnQgZG9lc24ndCBjb250YWluIHRoZSBBVFRBQ0ggbWFjcm9zLg0KPiANCg0KT09J
IGRvIHdlIGhhdmUgYSBwb2xpY3kgYWJvdXQgdGhpcz8gUmUtaW1wb3J0aW5nIGhlYWRlcnMgaW50
byBMaW51eCB3aG9sZXNhbGUgaXMgYWx3YXlzIHNsaWdodGx5IHBhaW5mdWwgYmVjYXVzZSBvZiBp
bnRlcmRlcGVuZGVuY2llcyBhbmQgc3R5bGUgY2hlY2tpbmcgaXNzdWVzLg0KDQogIFBhdWwNCg0K
PiANCj4gSnVlcmdlbg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
