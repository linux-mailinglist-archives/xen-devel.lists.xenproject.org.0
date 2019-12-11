Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A022B11B8F1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 17:36:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if4wC-0008Sl-Sw; Wed, 11 Dec 2019 16:34:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SbsP=2B=amazon.com=prvs=241424563=hongyxia@srs-us1.protection.inumbo.net>)
 id 1if4wB-0008Sa-Ex
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 16:34:07 +0000
X-Inumbo-ID: 0d1ba6c2-1c34-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d1ba6c2-1c34-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576082048; x=1607618048;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q33PdgfjnioXeLgvzCqv5+PReqehDdL2nQo0ei1iRIA=;
 b=hTINhm7pl403O/QaJid2DyL9gIVvdbTG/7pcOYbq2yEdeied05PrzFS0
 SBi6KfiQ8E7A/jPCNIVgG6KeysPs9sjNNV/hb5Ip9i89SQD3koT5njsox
 ihlAewsFSBkTulX3a/3c0EHlsGMNie1gw72057fsY/HzIcVP2XfP55Si0 Q=;
IronPort-SDR: rkJErNTm/G8UuTyBkUcfOwdkyHwou48f/npk48w9IRG/MRLxFNF52beckPDjnlfMiSHo4TMRs2
 jwXHHVRghwpg==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8122781"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 11 Dec 2019 16:34:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3B61DA26CA; Wed, 11 Dec 2019 16:34:04 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 16:34:04 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 16:34:03 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 16:34:03 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVsDfWlUg056AbKUGc0V5G6yTiGqe1IScA
Date: Wed, 11 Dec 2019 16:34:03 +0000
Message-ID: <458627277d5ced08e8ae12513c81e9c8c897240a.camel@amazon.com>
References: <cover.1576061451.git.hongyxia@amazon.com>
 <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
 <b2472504-72f0-dd95-a804-1353f1ece6a4@suse.com>
In-Reply-To: <b2472504-72f0-dd95-a804-1353f1ece6a4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.37]
Content-ID: <E091214B54696D4FAAA0556EB594F42F@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall, 
 Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTEyLTExIGF0IDE2OjI5ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
PiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBpZiAoIGxvY2tpbmcgKQ0KPiA+ICsgICAgICAgIHNw
aW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOw0KPiA+ICsgICAgaWYgKCAobDNlX2dldF9mbGFncygq
cGwzZSkgJiBfUEFHRV9QUkVTRU5UKSAmJg0KPiA+ICsgICAgICAgICAobDNlX2dldF9mbGFncygq
cGwzZSkgJiBfUEFHRV9QU0UpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBsM2Vfd3JpdGVf
YXRvbWljKHBsM2UsDQo+ID4gKyAgICAgICAgICAgIGwzZV9mcm9tX3BhZGRyKChwYWRkcl90KXZp
cnRfdG9fbWFkZHIobDJ0KSwNCj4gPiBfX1BBR0VfSFlQRVJWSVNPUikpOw0KPiANCj4gV2h5IHRo
ZSBjYXN0PyAoSSdtIHNvcnJ5IGlmIHRoaXMgd2FzIHRoZXJlIG9uIHYzIGFscmVhZHkgYW5kIEkN
Cj4gZGlkbid0IHNwb3QgaXQuIEFuZCBpZiB0aGlzIHJlbWFpbnMgdGhlIG9ubHkgdGhpbmcgdG8g
YWRqdXN0LA0KPiB0aGVuIEkgZ3Vlc3MgdGhpcyBjb3VsZCBiZSB0YWtlbiBjYXJlIG9mIHdoaWxl
IGNvbW1pdHRpbmcuKQ0KPiANCj4gSmFuDQoNClNhZGx5IHRoZXJlIGlzIG5vIGwzZV9mcm9tX21h
ZGRyIG9yIHZpcnRfdG9fcGFkZHIgdG8gY2FsbCBkaXJlY3RseS4gT2YNCmNvdXJzZSwgcGFkZHJf
dCBhbmQgbWFkZHIgaGF2ZSB0aGUgc2FtZSB1bmRlcmx5aW5nIHR5cGUgKHVuc2lnbmVkDQpsb25n
KSwgc28gaXQgd29ya3Mgd2l0aG91dCBhIGNhc3QuIEkganVzdCBhZGRlZCB0aGUgY2FzdCB0byBt
YWtlIGl0DQpleHBsaWNpdCB0aGF0IHRoZXNlIHR3byBhcmUgbm90IGV4YWN0bHkgdGhlIHNhbWUu
DQoNCkhvbmd5YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
