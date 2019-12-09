Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF43116CD7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:07:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHlv-00030Z-7L; Mon, 09 Dec 2019 12:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieHlt-00030T-Nr
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:04:13 +0000
X-Inumbo-ID: 038efe4c-1a7c-11ea-87c5-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 038efe4c-1a7c-11ea-87c5-12813bfff9fa;
 Mon, 09 Dec 2019 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575893053; x=1607429053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8AECTFICSyM5s/Ut1CazRsEgSzhmj8Neeu19wKVW8Qs=;
 b=veLK33jrWXrQJXav3vJqYctokuJeXkncaqpqz3gsOTQPFRc1tcMMrEEd
 z3h4/hMD0ZkWkqF+1EKvjCthDFPBEt6rbeSHUPmH8al+JVse/EBdUKuPJ
 bAHN4o342bRFmxCAmih+GKXGBRw457kruv4jUKC3xAy9AftvNsOiS0Yqs E=;
IronPort-SDR: rxRvUi+UywRuZk0+seSZDRlQZu/1IiRYbjPHUaFz3HJAOPm0l+qwvctWEFEG00kVUENUykWkxR
 nJWyhetsMfVA==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; d="scan'208";a="13791202"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Dec 2019 12:03:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 60AEAA2144; Mon,  9 Dec 2019 12:03:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:03:55 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:03:54 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 12:03:54 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEWoCAAAHxUA==
Date: Mon, 9 Dec 2019 12:03:54 +0000
Message-ID: <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
In-Reply-To: <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTE6NTUNCj4gVG86IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgRHVycmFudCwgUGF1bA0KPiA8cGR1
cnJhbnRAYW1hem9uLmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1
czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8NCj4gY2xvc2VkDQo+IA0KPiBPbiAwOS4x
Mi4xOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPiBPbiBUaHUsIERlYyAwNSwg
MjAxOSBhdCAwMjowMToyMVBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+IE9ubHkg
Zm9yY2Ugc3RhdGUgdG8gY2xvc2VkIGluIHRoZSBjYXNlIHdoZW4gdGhlIHRvb2xzdGFjayBtYXkg
bmVlZCB0bw0KPiA+PiBjbGVhbiB1cC4gVGhpcyBjYW4gYmUgZGV0ZWN0ZWQgYnkgY2hlY2tpbmcg
d2hldGhlciB0aGUgc3RhdGUgaW4NCj4geGVuc3RvcmUNCj4gPj4gaGFzIGJlZW4gc2V0IHRvIGNs
b3NpbmcgcHJpb3IgdG8gZGV2aWNlIHJlbW92YWwuDQo+ID4NCj4gPiBJJ20gbm90IHN1cmUgSSBz
ZWUgdGhlIHBvaW50IG9mIHRoaXMsIEkgd291bGQgZXhwZWN0IHRoYXQgYSBmYWlsdXJlIHRvDQo+
ID4gcHJvYmUgb3IgdGhlIHJlbW92YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVu
YnVzIHN0YXRlIGFzDQo+ID4gY2xvc2VkLCB3aGljaCBpcyBjb25zaXN0ZW50IHdpdGggdGhlIGFj
dHVhbCBkcml2ZXIgc3RhdGUuDQo+ID4NCj4gPiBDYW4geW91IGV4cGxhaW4gd2hhdCdzIHRoZSBi
ZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ugd2l0aG91dCBhDQo+ID4gZHJpdmVyIGluIHN1Y2gg
dW5rbm93biBzdGF0ZT8NCj4gDQo+IEFuZCBtb3JlIGNvbmNlcm5pbmc6IGRpZCB5b3UgY2hlY2sg
dGhhdCBubyBmcm9udGVuZC9iYWNrZW5kIGlzDQo+IHJlbHlpbmcgb24gdGhlIGNsb3NlZCBzdGF0
ZSB0byBiZSB2aXNpYmxlIHdpdGhvdXQgY2xvc2luZyBoYXZpbmcgYmVlbg0KPiBzZXQgYmVmb3Jl
Pw0KDQpCbGtmcm9udCBkb2Vzbid0IHNlZW0gdG8gbWluZCBhbmQgSSBiZWxpZXZlIHRoZSBXaW5k
b3dzIFBWIGRyaXZlcnMgY29wZSwgYnV0IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIGNv
bW1lbnQgc2luY2UgdGhpcyBwYXRjaCBpcyBhY3R1YWxseSByZW1vdmluZyBhIGNhc2Ugd2hlcmUg
dGhlIGJhY2tlbmQgdHJhbnNpdGlvbnMgZGlyZWN0bHkgdG8gY2xvc2VkLg0KDQogIFBhdWwNCg0K
PiANCj4gDQo+IEp1ZXJnZW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
