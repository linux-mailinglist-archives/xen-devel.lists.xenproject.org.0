Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB8F14D98C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:14:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix7jC-0007IV-Fk; Thu, 30 Jan 2020 11:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix7jA-0007IQ-Jg
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:11:16 +0000
X-Inumbo-ID: 3b27d6fa-4351-11ea-b211-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b27d6fa-4351-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580382676; x=1611918676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JBQGMMUcBzwlb0G8Ddn/2gU9v4B2cOMRTiOu0Rjpt/s=;
 b=ULHPziTzCXtPWkI52cqlMEbQJxXMo005v2cAIrvZ49kAj71burh9sIaU
 TBSK58q/bZsdqT5D4apLxAoPzhPPHjY/w3g+bIolU+T7/NhX2i2Xk+UWI
 5XlSfjNrkhJ/ppgzKLDtp4CSm+vRFujey/dDdLITPqIev00fcZfVwPpmA c=;
IronPort-SDR: QOdcM9/SgbpXr+MY2HApeZByNc/kgoUyus3DciwDxApMb8zEffdig+SkS7T5nMjETPFFTAMwGd
 FHwIexBswSiA==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="13605331"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 30 Jan 2020 11:11:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 75EC61A00C6; Thu, 30 Jan 2020 11:11:00 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 11:11:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 11:10:59 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 11:10:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v7 2/3] mm: make pages allocated with MEMF_no_refcount
 safe to assign
Thread-Index: AQHV1scJ/JWRQq5aIkeCPreZhLsvk6gDC/QAgAAAsxA=
Date: Thu, 30 Jan 2020 11:10:58 +0000
Message-ID: <1762baa055ca42969b3a6d6947b92ca9@EX13D32EUC003.ant.amazon.com>
References: <20200129171030.1341-1-pdurrant@amazon.com>
 <20200129171030.1341-3-pdurrant@amazon.com>
 <aa731ded-b87a-8ed8-864d-54c8be979ac0@suse.com>
In-Reply-To: <aa731ded-b87a-8ed8-864d-54c8be979ac0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v7 2/3] mm: make pages allocated with
 MEMF_no_refcount safe to assign
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEphbnVhcnkgMjAyMCAxMTowMg0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0Bl
cGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY3IDIvM10gbW06IG1ha2UgcGFnZXMgYWxsb2NhdGVkIHdpdGggTUVN
Rl9ub19yZWZjb3VudA0KPiBzYWZlIHRvIGFzc2lnbg0KPiANCj4gKHJlcGx5aW5nIGZyb20gc2Vl
aW5nIHlvdXIgcmVwbHkgb24gdGhlIGxpc3QgYXJjaGl2ZXMsIGkuZS4NCj4gdGhyZWFkaW5nIGxv
c3QvYnJva2VuKQ0KPiANCj4gT24gMzAuMDEuMjAyMCAxMDo0MCwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+IFRoaXMgaXMgZ2V0dGluZyB2ZXJ5IHZlcnkgY29tcGxpY2F0ZWQgbm93LCB3aGljaCBt
YWtlcyBtZSB0aGluayB0aGF0IG15DQo+ID4gb3JpZ2luYWwgYXBwcm9hY2ggdXNpbmcgYSAnbm9y
bWFsJyBwYWdlIGFuZCBzZXR0aW5nIGFuIGluaXRpYWwgbWF4X3BhZ2VzDQo+IGluDQo+ID4gZG9t
YWluX2NyZWF0ZSgpIHdhcyBhIGJldHRlciBhcHByb2FjaC4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsg
c28sIG5vLiBJIGFsc28gZG9uJ3QgdGhpbmcgYXVkaXRpbmcgYWxsIC0+e21heCx0b3R9X3BhZ2Vz
DQo+IHVzZXMgY2FuIGJlIGNhbGxlZCAidmVyeSB2ZXJ5IGNvbXBsaWNhdGVkIi4gQWxsIEkgY2Fu
IHNheSAoYWdhaW4sIEkNCj4gdGhpbmspIGlzIHRoYXQgdGhlcmUgd2FzIGEgcmVhc29uIHRoaXMg
QVBJQyBwYWdlIHRoaW5nIHdhcyBkb25lIHRoZQ0KPiB3YXkgaXQgd2FzIGRvbmUuIChJdCdzIGFu
b3RoZXIgdGhpbmcgdGhhdCB0aGlzIHByb2JhYmx5IHdhc24ndCBhDQo+IF9nb29kXyByZWFzb24u
KQ0KPiANCg0KSSByZWFsbHkgd2FudCB0byBnZXQgcmlkIG9mIHNoYXJlZCB4ZW5oZWFwIHBhZ2Vz
IHRob3VnaCwgc28gSSB3aWxsIHBlcnNpc3QuIEknbGwgYWRkIHRoZSBkb21haW5fdG90X3BhZ2Vz
KCkgaGVscGVyIGFzIHlvdSBzdWdnZXN0LiBJIGFsc28gYWdyZWUgdGhhdCBzdGVhbF9wYWdlKCkg
b3VnaHQgbm90IHRvIGVuY291bnRlciBhIFBHQ19leHRyYSBwYWdlIHNvIEkgdGhpbmsgSSdsbCBq
dXN0IG1ha2UgdGhhdCBhbiBlcnJvciBjYXNlLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
