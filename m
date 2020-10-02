Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E441280FCB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1754.5365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHJJ-0005PT-1w; Fri, 02 Oct 2020 09:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1754.5365; Fri, 02 Oct 2020 09:25:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHJI-0005P4-V7; Fri, 02 Oct 2020 09:25:04 +0000
Received: by outflank-mailman (input) for mailman id 1754;
 Fri, 02 Oct 2020 09:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MyDR=DJ=amazon.co.uk=prvs=537cbcb7c=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kOHJG-0005Ox-Ny
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:25:02 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbd5334f-5bf0-420f-808b-ca31ca0098d7;
 Fri, 02 Oct 2020 09:25:01 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 02 Oct 2020 09:25:00 +0000
Received: from EX13D32EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3F8CBA1CE3; Fri,  2 Oct 2020 09:24:58 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 2 Oct 2020 09:24:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 2 Oct 2020 09:24:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MyDR=DJ=amazon.co.uk=prvs=537cbcb7c=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kOHJG-0005Ox-Ny
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:25:02 +0000
X-Inumbo-ID: bbd5334f-5bf0-420f-808b-ca31ca0098d7
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bbd5334f-5bf0-420f-808b-ca31ca0098d7;
	Fri, 02 Oct 2020 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601630701; x=1633166701;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=bZTRy/oiBMSi7X6q4j6KD9K3dvxlX9rhdFlk5EL90I0=;
  b=V79OG+WskMU8JkoQnKFrJQN9bWHDpBtX1xCrlxcaNz6JNL+gvbojAbRz
   IbRZ+n/Wh8hwuA0S11chyqaaE+w3hiaF5uN7K48forSfeGanVgAAIhS3z
   fwlGINg0DkFitkNnMNdk62auwrrAsdNOjVl9/za3dWWq0d8p6MUfUprlw
   o=;
X-IronPort-AV: E=Sophos;i="5.77,326,1596499200"; 
   d="scan'208";a="59026413"
Subject: RE: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI callbacks
Thread-Topic: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI callbacks
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 02 Oct 2020 09:25:00 +0000
Received: from EX13D32EUC004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS id 3F8CBA1CE3;
	Fri,  2 Oct 2020 09:24:58 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 2 Oct 2020 09:24:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 2 Oct 2020 09:24:58 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>
Thread-Index: AQHWlxZTwfhKSEHIHk+Wx3kHFgYPGamEA1KAgAAIUXA=
Date: Fri, 2 Oct 2020 09:24:57 +0000
Message-ID: <59e20dff55464b7fbee9737348fae751@EX13D32EUC003.ant.amazon.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-2-roger.pau@citrix.com>
 <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
In-Reply-To: <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.68]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIE9jdG9iZXIgMjAyMCAwOTo0OA0KPiBUbzogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IER1cnJh
bnQsIFBhdWwNCj4gPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gU3ViamVjdDogUkU6IFtFWFRF
Uk5BTF0gW1BBVENIIHYyIDAxLzExXSB4ODYvaHZtOiBkcm9wIHZjcHUgcGFyYW1ldGVyIGZyb20g
dmxhcGljIEVPSSBjYWxsYmFja3MNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFu
ZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDMwLjA5LjIwMjAg
MTI6NDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZsYXBpYy5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYw0KPiA+IEBAIC00
NTksMTMgKzQ1OSwxMCBAQCB2b2lkIHZsYXBpY19FT0lfc2V0KHN0cnVjdCB2bGFwaWMgKnZsYXBp
YykNCj4gPg0KPiA+ICB2b2lkIHZsYXBpY19oYW5kbGVfRU9JKHN0cnVjdCB2bGFwaWMgKnZsYXBp
YywgdTggdmVjdG9yKQ0KPiA+ICB7DQo+ID4gLSAgICBzdHJ1Y3QgdmNwdSAqdiA9IHZsYXBpY192
Y3B1KHZsYXBpYyk7DQo+ID4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPiA+
IC0NCj4gPiAgICAgIGlmICggdmxhcGljX3Rlc3RfdmVjdG9yKHZlY3RvciwgJnZsYXBpYy0+cmVn
cy0+ZGF0YVtBUElDX1RNUl0pICkNCj4gPiAtICAgICAgICB2aW9hcGljX3VwZGF0ZV9FT0koZCwg
dmVjdG9yKTsNCj4gPiArICAgICAgICB2aW9hcGljX3VwZGF0ZV9FT0kodmVjdG9yKTsNCj4gPg0K
PiA+IC0gICAgaHZtX2RwY2lfbXNpX2VvaShkLCB2ZWN0b3IpOw0KPiA+ICsgICAgaHZtX2RwY2lf
bXNpX2VvaSh2ZWN0b3IpOw0KPiA+ICB9DQo+IA0KPiBXaGF0IGFib3V0IHZpcmlkaWFuX3N5bmlj
X3dybXNyKCkgLT4gdmxhcGljX0VPSV9zZXQoKSAtPg0KPiB2bGFwaWNfaGFuZGxlX0VPSSgpPyBZ
b3UnZCBwcm9iYWJseSBoYXZlIG5vdGljZWQgdGhpcyBpZiB5b3UNCj4gaGFkIHRyaWVkIHRvIChj
b25zaXN0ZW50bHkpIGRyb3AgdGhlIHJlc3BlY3RpdmUgcGFyYW1ldGVycyBmcm9tDQo+IHRoZSBp
bnRlcm1lZGlhdGUgZnVuY3Rpb25zIGFzIHdlbGwuDQo+IA0KPiBRdWVzdGlvbiBvZiBjb3Vyc2Ug
aXMgaW4gaG93IGZhciB2aXJpZGlhbl9zeW5pY193cm1zcigpIGZvcg0KPiBIVl9YNjRfTVNSX0VP
SSBtYWtlcyBtdWNoIHNlbnNlIHdoZW4gdiAhPSBjdXJyZW50LiBQYXVsLCBXZWk/DQo+IA0KDQpJ
IGRvbid0IHRoaW5rIGl0IG1ha2VzIGFueSBzZW5zZS4gSSB0aGluayBpdCB3b3VsZCBiZSBmaW5l
IHRvIG9ubHkgZG8gaXQgaWYgdiA9PSBjdXJyZW50Lg0KDQogIFBhdWwNCg0KPiBBIHNlY29uZGFy
eSBxdWVzdGlvbiBvZiBjb3Vyc2UgaXMgd2hldGhlciBwYXNzaW5nIGFyb3VuZCB0aGUNCj4gcG9p
bnRlcnMgaXNuJ3QgcmVhbGx5IGNoZWFwZXIgdGhhbiB0aGUgb2J0YWluaW5nIG9mICdjdXJyZW50
Jy4NCj4gDQo+IEphbg0K

