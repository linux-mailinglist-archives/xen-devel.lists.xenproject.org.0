Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9314EF37
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:10:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXtP-0006mG-QF; Fri, 31 Jan 2020 15:07:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixXtO-0006mB-2K
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:07:34 +0000
X-Inumbo-ID: 67b473be-443b-11ea-ad98-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67b473be-443b-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580483252; x=1612019252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mJg/SvnJG+EAApf4UoLFG80y7B8alaR3RBA7FqocjNE=;
 b=M6poSwBVctDgi3mDGMKBNw5w7dtUkUVuG4UElCp/2ITZOD1HPp2Zrj/e
 9Ithl4vkshnqyxuY5EsWOUBlLW7KquKp2af0vuBxZhgcuOvUEko9WwlBO
 eH+mgbGZxx1OTMjAEqcxa1MHKC89lPKa6yFkwDYvhiLM8DfFLQpka7tmf k=;
IronPort-SDR: yFnzi4808Ra/4v5vyGiEfimlrfLl2TBnOZMt+xphCxOEWIhNVQ1jsQkaf/3Irowm+MEBUTmpz3
 vVGqi2rK5kQw==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="23625593"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 31 Jan 2020 15:07:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id 792DEA1E89; Fri, 31 Jan 2020 15:07:31 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 15:07:31 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 15:07:30 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 15:07:29 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
Thread-Index: AQHV1qRPojuC/HmUw0ekDi6BkslB06gE4p4Q
Date: Fri, 31 Jan 2020 15:07:29 +0000
Message-ID: <095808f30b57490eb39af9780aacf93c@EX13D32EUC003.ant.amazon.com>
References: <dc7ef061-25f9-6657-27ba-e6f2f51b8a64@suse.com>
In-Reply-To: <dc7ef061-25f9-6657-27ba-e6f2f51b8a64@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMjkgSmFudWFyeSAyMDIwIDEzOjAwDQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBQYXVsIER1cnJhbnQNCj4gPHBhdWxAeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVj
dDogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB4ODYvSFZNOiByZWxpbnF1aXNoIHJlc291cmNlcyBh
bHNvIGZyb20NCj4gaHZtX2RvbWFpbl9kZXN0cm95KCkNCj4gDQo+IERvbWFpbiBjcmVhdGlvbiBm
YWlsdXJlIHBhdGhzIGRvbid0IGNhbGwgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCksDQo+
IHlldCBhbGxvY2F0aW9ucyBhbmQgYWxpa2UgZG9uZSBmcm9tIGh2bV9kb21haW5faW5pdGlhbGl6
ZSgpIG5lZWQgdG8gYmUNCj4gdW5kb25lIG5ldmVydGhlbGVzcy4gQ2FsbCB0aGUgZnVuY3Rpb24g
YWxzbyBmcm9tIGh2bV9kb21haW5fZGVzdHJveSgpLA0KPiBhZnRlciBtYWtpbmcgc3VyZSBhbGwg
ZGVzY2VuZGFudHMgYXJlIGlkZW1wb3RlbnQuDQo+IA0KPiBOb3RlIHRoYXQgd2hpbGUgdmlyaWRp
YW5fe2RvbWFpbix2Y3B1fV9kZWluaXQoKSB3ZXJlIGFscmVhZHkgdXNlZCBpbg0KPiB3YXlzIHN1
Z2dlc3RpbmcgdGhleSdyZSBpZGVtcG90ZW50LCB2aXJpZGlhbl90aW1lX3ZjcHVfZGVpbml0KCkg
YWN0dWFsbHkNCj4gd2Fzbid0OiBPbmUgY2FuJ3Qga2lsbCBhIHRpbWVyIHRoYXQgd2FzIG5ldmVy
IGluaXRpYWxpemVkLg0KPiANCj4gRm9yIGh2bV9kZXN0cm95X2FsbF9pb3JlcV9zZXJ2ZXJzKCkn
cyBwdXJwb3NlcyBtYWtlDQo+IHJlbG9jYXRlX3BvcnRpb19oYW5kbGVyKCkgcmV0dXJuIHdoZXRo
ZXIgdGhlIHRvIGJlIHJlbG9jYXRlZCBwb3J0IHJhbmdlDQo+IHdhcyBhY3R1YWxseSBmb3VuZC4g
VGhpcyBzZWVtcyBjaGVhcGVyIHRoYW4gaW50cm9kdWNpbmcgYSBmbGFnIGludG8NCj4gc3RydWN0
IGh2bV9kb21haW4ncyBpb3JlcV9zZXJ2ZXIgc3ViLXN0cnVjdHVyZS4NCj4gDQo+IEluIGh2bV9k
b21haW5faW5pdGlhbGlzZSgpIGFkZGl0aW9uYWxseQ0KPiAtIHVzZSBYRlJFRSgpIGFsc28gdG8g
cmVwbGFjZSBhZGphY2VudCB4ZnJlZSgpLA0KPiAtIHVzZSBodm1fZG9tYWluX3JlbGlucXVpc2hf
cmVzb3VyY2VzKCkgYXMgYmVpbmcgaWRlbXBvdGVudCBub3cuDQo+IFRoZXJlIGFzIHdlbGwgYXMg
aW4gaHZtX2RvbWFpbl9kZXN0cm95KCkgdGhlIGV4cGxpY2l0IGNhbGwgdG8NCj4gcnRjX2RlaW5p
dCgpIGlzbid0IG5lZWRlZCBhbnltb3JlLg0KPiANCj4gSW4gaHZtX2RvbWFpbl9yZWxpbnF1aXNo
X3Jlc291cmNlcygpIGFkZGl0aW9uYWxseSBkcm9wIGEgbm8gbG9uZ2VyDQo+IHJlbGV2YW50IGlm
KCkuDQo+IA0KPiBGaXhlczogZTdhOWI1ZTcyZjI2ICgidmlyaWRpYW46IHNlcGFyYXRlbHkgYWxs
b2NhdGUgZG9tYWluIGFuZCB2Y3B1DQo+IHN0cnVjdHVyZXMiKQ0KPiBGaXhlczogMjZmYmEzYzg1
NTcxICgidmlyaWRpYW46IGFkZCBpbXBsZW1lbnRhdGlvbiBvZiBzeW50aGV0aWMgdGltZXJzIikN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpMR1RN
DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNCj4g
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
