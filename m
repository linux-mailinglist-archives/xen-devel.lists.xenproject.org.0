Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A537A056
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 09:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125634.236461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgMU0-0004Se-By; Tue, 11 May 2021 07:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125634.236461; Tue, 11 May 2021 07:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgMU0-0004QP-8r; Tue, 11 May 2021 07:07:08 +0000
Received: by outflank-mailman (input) for mailman id 125634;
 Tue, 11 May 2021 07:07:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xBg=KG=amazon.co.uk=prvs=758e73cee=pdurrant@srs-us1.protection.inumbo.net>)
 id 1lgMTy-0004QJ-2K
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 07:07:06 +0000
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b625f296-3f99-406c-acbb-f9f993977385;
 Tue, 11 May 2021 07:07:04 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 11 May 2021 07:06:58 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com (Postfix) with ESMTPS
 id C9DF3365327; Tue, 11 May 2021 07:06:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 11 May 2021 07:06:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.015;
 Tue, 11 May 2021 07:06:55 +0000
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
X-Inumbo-ID: b625f296-3f99-406c-acbb-f9f993977385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1620716825; x=1652252825;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=FgiF7Puuz72Tc+bHv4Fk487lVQ8q5lBGnrGRwaNZG+o=;
  b=bRMY9/im/vV3O329XRpUnzXazcHn8kZRFg41sRbEyfovYJlvyVkEARGH
   SOTsJFqmKqyZaUhNUZjyhfWMRqYJoj3RvZILwLKDlilwZLGtVC4d0Kkn9
   Dloy5c4VU923KdNGzSOn5cmx5vc4yvb+/fyNe2LSw3i/DANmb3Rk4JmP2
   M=;
X-IronPort-AV: E=Sophos;i="5.82,290,1613433600"; 
   d="scan'208";a="125102215"
Subject: RE: [PATCH] xen-netback: Check for hotplug-status existence before watching
Thread-Topic: [PATCH] xen-netback: Check for hotplug-status existence before watching
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Michael Brown <mbrown@fensystems.co.uk>,
	"paul@xen.org" <paul@xen.org>
CC: "paul@xen.org" <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "wei.liu@kernel.org" <wei.liu@kernel.org>
Thread-Index: AQHXMHlgrSEnNO4f/0CXVVR3ElA0XKrdNJQAgAAEMoCAAAGvAIAAA+GAgAAKCwCAAL1BsA==
Date: Tue, 11 May 2021 07:06:55 +0000
Message-ID: <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk> <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
In-Reply-To: <YJmMvTkp2Y1hlLLm@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IFNlbnQ6IDEwIE1h
eSAyMDIxIDIwOjQzDQo+IFRvOiBNaWNoYWVsIEJyb3duIDxtYnJvd25AZmVuc3lzdGVtcy5jby51
az47IHBhdWxAeGVuLm9yZw0KPiBDYzogcGF1bEB4ZW4ub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IHdlaS5saXVAa2VybmVsLm9yZzsg
RHVycmFudCwNCj4gUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBTdWJqZWN0OiBSRTog
W0VYVEVSTkFMXSBbUEFUQ0hdIHhlbi1uZXRiYWNrOiBDaGVjayBmb3IgaG90cGx1Zy1zdGF0dXMg
ZXhpc3RlbmNlIGJlZm9yZSB3YXRjaGluZw0KPiANCj4gT24gTW9uLCBNYXkgMTAsIDIwMjEgYXQg
MDg6MDY6NTVQTSArMDEwMCwgTWljaGFlbCBCcm93biB3cm90ZToNCj4gPiBJZiB5b3UgaGF2ZSBh
IHN1Z2dlc3RlZCBwYXRjaCwgSSdtIGhhcHB5IHRvIHRlc3QgdGhhdCBpdCBkb2Vzbid0IHJlaW50
cm9kdWNlDQo+ID4gdGhlIHJlZ3Jlc3Npb24gYnVnIHRoYXQgd2FzIGZpeGVkIGJ5IHRoaXMgY29t
bWl0Lg0KPiANCj4gQWN0dWFsbHksIEkndmUganVzdCB0ZXN0ZWQgd2l0aCBhIHNpbXBsZSByZWxv
YWRpbmcgeGVuLW5ldGZyb250IG1vZHVsZS4gSXQNCj4gc2VlbXMgaW4gdGhpcyBjYXNlLCB0aGUg
aG90cGx1ZyBzY3JpcHQgaXMgbm90IHJlLWV4ZWN1dGVkLiBJbiBmYWN0LCBJDQo+IHRoaW5rIGl0
IHNob3VsZCBub3QgYmUgcmUtZXhlY3V0ZWQgYXQgYWxsLCBzaW5jZSB0aGUgdmlmIGludGVyZmFj
ZQ0KPiByZW1haW5zIGluIHBsYWNlIChpdCBqdXN0IGdldHMgTk8tQ0FSUklFUiBmbGFnKS4NCj4g
DQo+IFRoaXMgYnJpbmdzIGEgcXVlc3Rpb24sIHdoeSByZW1vdmluZyBob3RwbHVnLXN0YXR1cyBp
biB0aGUgZmlyc3QgcGxhY2U/DQo+IFRoZSBpbnRlcmZhY2UgcmVtYWlucyBjb3JyZWN0bHkgY29u
ZmlndXJlZCBieSB0aGUgaG90cGx1ZyBzY3JpcHQgYWZ0ZXINCj4gYWxsLiBGcm9tIHRoZSBjb21t
aXQgbWVzc2FnZToNCj4gDQo+ICAgICB4ZW4tbmV0YmFjazogcmVtb3ZlICdob3RwbHVnLXN0YXR1
cycgb25jZSBpdCBoYXMgc2VydmVkIGl0cyBwdXJwb3NlDQo+IA0KPiAgICAgUmVtb3ZpbmcgdGhl
ICdob3RwbHVnLXN0YXR1cycgbm9kZSBpbiBuZXRiYWNrX3JlbW92ZSgpIGlzIHdyb25nOyB0aGUg
c2NyaXB0DQo+ICAgICBtYXkgbm90IGhhdmUgY29tcGxldGVkLiBPbmx5IHJlbW92ZSB0aGUgbm9k
ZSBvbmNlIHRoZSB3YXRjaCBoYXMgZmlyZWQgYW5kDQo+ICAgICBoYXMgYmVlbiB1bnJlZ2lzdGVy
ZWQuDQo+IA0KPiBJIHRoaW5rIHRoZSBpbnRlbnRpb24gd2FzIHRvIHJlbW92ZSAnaG90cGx1Zy1z
dGF0dXMnIG5vZGUgX2xhdGVyXyBpbg0KPiBjYXNlIG9mIHF1aWNrbHkgYWRkaW5nIGFuZCByZW1v
dmluZyB0aGUgaW50ZXJmYWNlLiBJcyB0aGF0IHJpZ2h0LCBQYXVsPw0KDQpUaGUgcmVtb3ZhbCB3
YXMgZG9uZSB0byBhbGxvdyB1bmJpbmQvYmluZCB0byBmdW5jdGlvbiBjb3JyZWN0bHkuIElJUkMg
YmVmb3JlIHRoZSBvcmlnaW5hbCBwYXRjaCBkb2luZyBhIGJpbmQgd291bGQgc3RhbGwgZm9yZXZl
ciB3YWl0aW5nIGZvciB0aGUgaG90cGx1ZyBzdGF0dXMgdG8gY2hhbmdlLCB3aGljaCB3b3VsZCBu
ZXZlciBoYXBwZW4uDQoNCj4gSW4gdGhhdCBjYXNlLCBsZXR0aW5nIGhvdHBsdWdfc3RhdHVzX2No
YW5nZWQoKSByZW1vdmUgdGhlIGVudHJ5IHdvbnQNCj4gd29yaywgYmVjYXVzZSB0aGUgd2F0Y2gg
d2FzIHVucmVnaXN0ZXJlZCBmZXcgbGluZXMgZWFybGllciBpbg0KPiBuZXRiYWNrX3JlbW92ZSgp
LiBBbmQga2VlcGluZyB0aGUgd2F0Y2ggaXMgbm90IGFuIG9wdGlvbiwgYmVjYXVzZSB0aGUNCj4g
d2hvbGUgYmFja2VuZF9pbmZvIHN0cnVjdCBpcyBnb2luZyB0byBiZSBmcmVlLWVkIGFscmVhZHku
DQo+IA0KPiBJZiBteSBndWVzcyBhYm91dCB0aGUgb3JpZ2luYWwgcmVhc29uIGZvciB0aGUgY2hh
bmdlIGlzIHJpZ2h0LCBJIHRoaW5rDQo+IGl0IHNob3VsZCBiZSBmaXhlZCBhdCB0aGUgaG90cGx1
ZyBzY3JpcHQgbGV2ZWwgLSBpdCBzaG91bGQgY2hlY2sgaWYgdGhlDQo+IGRldmljZSBpcyBzdGls
bCB0aGVyZSBiZWZvcmUgd3JpdGluZyAnaG90cGx1Zy1zdGF0dXMnIG5vZGUuDQo+IEknbSBub3Qg
c3VyZSBpZiBkb2luZyBpdCByYWNlLWZyZWUgaXMgcG9zc2libGUgZnJvbSBhIHNoZWxsIHNjcmlw
dCAoSSB0aGluayBpdA0KPiByZXF1aXJlcyBkb2luZyB4ZW5zdG9yZSByZWFkIF9hbmRfIHdyaXRl
IGluIGEgc2luZ2xlIHRyYW5zYWN0aW9uKS4gQnV0DQo+IGluIHRoZSB3b3JzdCBjYXNlLCB0aGUg
YWZ0ZXJtYXRoIG9mIGxvb3NpbmcgdGhlIHJhY2UgaXMgbGVhdmluZyBzdHJheQ0KPiAnaG90cGx1
Zy1zdGF0dXMnIHhlbnN0b3JlIG5vZGUgLSBub3QgaWRlYWwsIGJ1dCBhbHNvIGxlc3MgaGFybWZ1
bCB0aGFuDQo+IGZhaWxpbmcgdG8gYnJpbmcgdXAgYW4gaW50ZXJmYWNlLiBBdCB0aGlzIHBvaW50
LCB0aGUgdG9vbHN0YWNrIGNvdWxkIGNsZWFudXANCj4gaXQgbGF0ZXIsIHBlcmhhcHMgd2hpbGUg
c2V0dGluZyB1cCB0aGF0IGludGVyZmFjZSBhZ2FpbiAoaWYgaXQgZ2V0cw0KPiByZS1jb25uZWN0
ZWQpPw0KPiANCj4gQW55d2F5LCBwZXJoYXBzIHRoZSBiZXN0IHRoaW5nIHRvIGRvIG5vdywgaXMg
dG8gcmV2ZXJ0IGJvdGggY29tbWl0cywgYW5kDQo+IHRoaW5rIG9mIGFuIGFsdGVybmF0aXZlIHNv
bHV0aW9uIGZvciB0aGUgb3JpZ2luYWwgaXNzdWU/IFRoYXQgb2YgY291cnNlDQo+IGFzc3VtZXMg
SSBndWVzc2VkIGNvcnJlY3RseSB3aHkgaXQgd2FzIGRvbmUgaW4gdGhlIGZpcnN0IHBsYWNlLi4u
DQo+IA0KDQpTaW1wbHkgcmV2ZXJ0aW5nIGV2ZXJ5dGhpbmcgd291bGQgbGlrZWx5IGJyZWFrIHRo
ZSBhYmlsaXR5IHRvIGRvIHVuYmluZCBhbmQgYmluZCAod2hpY2ggaXMgdXNlZnVsIGUuZyB0byBh
bGxvdyB1cGRhdGUgdGhlIG5ldGJhY2sgbW9kdWxlIHdoaWxzdCBndWVzdHMgYXJlIHN0aWxsIHJ1
bm5pbmcpIHNvIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIGFuIG9wdGlvbi4NCg0KICBQYXVsDQo=

