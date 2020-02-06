Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03B1544DE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:28:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhBK-0002lZ-It; Thu, 06 Feb 2020 13:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izhBI-0002lN-GO
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:26:56 +0000
X-Inumbo-ID: 57c4efc6-48e4-11ea-841d-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57c4efc6-48e4-11ea-841d-bc764e2007e4;
 Thu, 06 Feb 2020 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580995616; x=1612531616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PRRS+4sXdb7q/NkquzoTtN5ORxldpBxl53RGC7/ryDQ=;
 b=TOtNplFK0wq52H0aMa1RynRq+bRS/b38DcDD3LQkBv4po8aCmDWKDf1S
 mI03ls7EImdmouhIOP23izWUatKIL57nrLsZTT/O2L9GdXfTk4/0yJvTG
 YY6q8nwtaX7KJjzfQkq3+MZ+q627DZI55xkK55PpA/bEN3lP6iAwX1/h5 Q=;
IronPort-SDR: H+ruf824EEo2uJBfXACzzRG534yNbdlTSQhGYGX0SmJeSHIbFKfol2oKk7zulRzavr2YvcQBaa
 ouFV7LJnHR2w==
X-IronPort-AV: E=Sophos;i="5.70,409,1574121600"; d="scan'208";a="15028529"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 06 Feb 2020 13:26:45 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 48EC6221CD2; Thu,  6 Feb 2020 13:26:44 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 13:26:43 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 13:26:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 13:26:42 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 3/7] x86/HVM: introduce "curr" into
 hvmemul_rep_{mov, sto}s()
Thread-Index: AQHV2FXlmotPirE43U6/MNdpsvmBfqgOMCbw
Date: Thu, 6 Feb 2020 13:26:42 +0000
Message-ID: <a7952dfe113849daaca3ed4467f0b0eb@EX13D32EUC003.ant.amazon.com>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <90e7ed4e-aff5-1b0b-e3a8-fbb4c058a7d1@suse.com>
In-Reply-To: <90e7ed4e-aff5-1b0b-e3a8-fbb4c058a7d1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 3/7] x86/HVM: introduce "curr" into
 hvmemul_rep_{mov, sto}s()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE2OjQzDQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0
cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaQ0KPiBMaXUgPHdsQHhl
bi5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU3ViamVjdDogW1hlbi1kZXZl
bF0gW1BBVENIIHY0IDMvN10geDg2L0hWTTogaW50cm9kdWNlICJjdXJyIiBpbnRvDQo+IGh2bWVt
dWxfcmVwX3ttb3YsIHN0b31zKCkNCj4gDQo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiB1c2VzIG9m
ICJjdXJyZW50IiBhbHJlYWR5LCBhbmQgbW9yZSBtYXkgYXBwZWFyDQo+IGRvd24gdGhlIHJvYWQu
IExhdGNoIGludG8gYSBsb2NhbCB2YXJpYWJsZS4NCj4gDQo+IEF0IHRoaXMgb2NjYXNpb24gYWxz
byBkcm9wIHN0cmF5IGNhc3RzIGZyb20gY29kZSBnZXR0aW5nIHRvdWNoZWQgYW55d2F5Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZp
ZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQouLi53aXRoIG9u
ZSBzdWdnZXN0aW9uOg0KDQo+IC0tLQ0KPiB2NDogTmV3Lg0KPiANCj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9lbXVsYXRlLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMNCj4g
QEAgLTE3NDcsNyArMTc0Nyw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9yZXBfbW92cygNCj4gIHsN
Cj4gICAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAqaHZtZW11bF9jdHh0ID0NCj4gICAgICAg
ICAgY29udGFpbmVyX29mKGN0eHQsIHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0LCBjdHh0KTsNCj4g
LSAgICBzdHJ1Y3QgaHZtX3ZjcHVfaW8gKnZpbyA9ICZjdXJyZW50LT5hcmNoLmh2bS5odm1faW87
DQo+ICsgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Ow0KPiArICAgIHN0cnVjdCBodm1f
dmNwdV9pbyAqdmlvID0gJmN1cnItPmFyY2guaHZtLmh2bV9pbzsNCj4gICAgICB1bnNpZ25lZCBs
b25nIHNhZGRyLCBkYWRkciwgYnl0ZXM7DQo+ICAgICAgcGFkZHJfdCBzZ3BhLCBkZ3BhOw0KPiAg
ICAgIHVpbnQzMl90IHBmZWMgPSBQRkVDX3BhZ2VfcHJlc2VudDsNCj4gQEAgLTE4MDcsOCArMTgw
OCw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9yZXBfbW92cygNCj4gICAgICB9DQo+IA0KPiAgICAg
IC8qIENoZWNrIGZvciBNTUlPIG9wcyAqLw0KPiAtICAgICh2b2lkKSBnZXRfZ2ZuX3F1ZXJ5X3Vu
bG9ja2VkKGN1cnJlbnQtPmRvbWFpbiwgc2dwYSA+PiBQQUdFX1NISUZULA0KPiAmc3AybXQpOw0K
PiAtICAgICh2b2lkKSBnZXRfZ2ZuX3F1ZXJ5X3VubG9ja2VkKGN1cnJlbnQtPmRvbWFpbiwgZGdw
YSA+PiBQQUdFX1NISUZULA0KPiAmZHAybXQpOw0KPiArICAgIGdldF9nZm5fcXVlcnlfdW5sb2Nr
ZWQoY3Vyci0+ZG9tYWluLCBzZ3BhID4+IFBBR0VfU0hJRlQsICZzcDJtdCk7DQo+ICsgICAgZ2V0
X2dmbl9xdWVyeV91bmxvY2tlZChjdXJyLT5kb21haW4sIGRncGEgPj4gUEFHRV9TSElGVCwgJmRw
Mm10KTsNCg0KU2luY2Ugd2UgaGF2ZSBtb3JlIHRoYW4gb25lICdjdXJyLT5kb21haW4nLCBJIHRo
aW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gYSBsYXRjaGVkICdjdXJyZCcgZG9tYWluIHBvaW50ZXIg
dG9vLg0KDQogIFBhdWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
