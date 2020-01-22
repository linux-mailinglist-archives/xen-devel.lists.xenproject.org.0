Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E519F145738
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 14:53:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGOy-0003Wj-Ec; Wed, 22 Jan 2020 13:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gz/D=3L=amazon.co.uk=prvs=28389f840=dwmw@srs-us1.protection.inumbo.net>)
 id 1iuGOx-0003We-5W
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 13:50:35 +0000
X-Inumbo-ID: 29c18a2a-3d1e-11ea-bc45-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29c18a2a-3d1e-11ea-bc45-12813bfff9fa;
 Wed, 22 Jan 2020 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579701034; x=1611237034;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=qH6H3eSd6lI7dhWlz9QPJgVaf1eTziTSeVQ3P/GGbMw=;
 b=QWyP/t9Ousv1SPs6gqshECE4AefI9ibL0fSb/6MMlrjHVQAhU6eu4N8H
 EwnzwS3FUjs5GFQdh5v+qS++UyQY9EWZpSRazaD5c3mdD+blc/XQbdr7f
 CAhVC0Wus6TDH67awupJsywRI8F4lDFzE6ODPSQYjDMva07ZcGyqNiMYo o=;
IronPort-SDR: GTf5YVTRCDLfcO38u+SUGjQfs8d3sDEXsayeCnzxDS1y50hgRo7dre8tFqL05KT6xWpizU5wlj
 yRY8y7ngLzxg==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="13604635"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 22 Jan 2020 13:50:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8A576A2317; Wed, 22 Jan 2020 13:50:32 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 13:50:32 +0000
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 13:50:30 +0000
Received: from EX13D08UEE001.ant.amazon.com ([10.43.62.126]) by
 EX13D08UEE001.ant.amazon.com ([10.43.62.126]) with mapi id 15.00.1367.000;
 Wed, 22 Jan 2020 13:50:29 +0000
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "julien@xen.org" <julien@xen.org>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] xen/x86: domain: Free all the pages associated to struct
 domain
Thread-Index: AQHVz555PQOh14AEn0a/wFk+mpwqNaf2poKAgAAFzwCAAACXgIAACaoA
Date: Wed, 22 Jan 2020 13:50:29 +0000
Message-ID: <f6b960ae9ce717ebb80501a6f2dd5304fbc9e178.camel@amazon.co.uk>
References: <20200120143142.19820-1-julien@xen.org>
 <a45e0622-3974-7b4b-c093-81362ad1b18f@citrix.com>
 <b9174b70-64d9-949c-1b94-de13e963a65a@xen.org>
 <13528a87-2c98-3717-b28d-a82654785940@citrix.com>
In-Reply-To: <13528a87-2c98-3717-b28d-a82654785940@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.61.21]
Content-ID: <9DFB60740678A24AB6689DC81FCB87EE@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen/x86: domain: Free all the pages
 associated to struct domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Grall, Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDIwLTAxLTIyIGF0IDEzOjE1ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiA+ID4gSSdkIG11Y2ggcmF0aGVyIHNlZSB0aGUgb3JpZ2luYWwgcGF0Y2ggcmV2ZXJ0ZWQuICBU
aGUgY3VycmVudCBzaXplIG9mDQo+ID4gPiBzdHJ1Y3QgZG9tYWluIHdpdGggbG9ja3Byb2ZpbGUg
ZW5hYmxlZCBpcyAzMjAwIGJ5dGVzLg0KPiA+IA0KPiA+IExldCBtZSBoYXZlIGEgbG9vayBmaXJz
dCB0byBzZWUgd2hlbi93aHkgc3RydWN0IGRvbWFpbiBpcyBsZXNzIHRoYW4gNEsNCj4gPiB3aXRo
IGxvY2twcm9maWxlLg0KPiANCj4gSW4gdGhlIGludGVydmVuaW5nIHRpbWUsIEp1ZXJnZW4gaGFz
IHRvdGFsbHkgcmV3cml0dGVuIGxvY2sgcHJvZmlsaW5nLA0KPiBhbmQgdGhlIHZpcnR1YWwgdGlt
ZXIgaW5mcmFzdHJ1Y3R1cmUgaGFzIGJlZW4gdGFrZW4gb3V0LW9mLWxpbmUuDQo+IA0KPiBJdHMg
cHJvYmFibHkgdGhlIGxhdHRlciB3aGljaCBpcyB0aGUgZG9taW5hdGluZyBmYWN0b3IuDQoNCk9L
LCBzbyBpZiB3ZSByZXZlcnQgODkxNmZjZjQ1NzcgaXMgaXQgcmVhc29uYWJsZSBmb3IgbWUgdG8g
dGhlbiBhc3N1bWUNCnRoYXQgJ3N0cnVjdCBkb21haW4nIHdpbGwgYWx3YXlzIGZpdCB3aXRoaW4g
YSBwYWdlLCBhbmQgZGVjbGFyZSB0aGF0DQpsaXZlIHVwZGF0ZSBzaGFsbCBub3Qgd29yayB0byBh
IFhlbiB3aGVyZSB0aGF0IGlzbid0IHRydWU/DQoNCkkgaGF2ZSBhIG5hc3R5IHRyaWNrIGluIG1p
bmQuLi4NCg0KRHVyaW5nIGxpdmUgdXBkYXRlLCB3ZSBuZWVkIHRvIGRvIGEgcGFzcyBvdmVyIHRo
ZSBsaXZlIHVwZGF0ZSBkYXRhIGluDQplYXJseSBib290IGluIG9yZGVyIHRvIHdvcmsgb3V0IHdo
aWNoIHBhZ2VzIHRvIHJlc2VydmUuIFRoYXQgcGFydCBoYXMNCnRvIGJlIGRvbmUgZWFybHksIHdo
aWxlIHRoZSBib290IGFsbG9jYXRvciBpcyBhY3RpdmUuIEl0IHdvcmtzIGJ5DQpzZXR0aW5nIHRo
ZSBQR0NfYWxsb2NhdGVkIGJpdCBpbiB0aGUgcGFnZV9pbmZvIG9mIHRoZSByZXNlcnZlZCBwYWdl
cywNCnNvIHRoYXQgaW5pdF9oZWFwX3BhZ2VzKCkga25vd3Mgbm90IHRvIGluY2x1ZGUgdGhlbS4g
SSd2ZSBwb3N0ZWQgdGhhdA0KcGFydCBhbHJlYWR5Lg0KDQpBbHNvIGR1cmluZyBsaXZlIHVwZGF0
ZSwgd2UgbmVlZCB0byBjb25zdW1lIHRoZSBhY3R1YWwgZG9tYWluIHN0YXRlDQp0aGF0IHdhcyBw
YXNzZWQgb3ZlciBmcm9tIHRoZSBwcmV2aW91cyBYZW4sIGFuZCBmaWxsIGluIHRoZSBvd25lciAo
YW5kDQpyZWZjb3VudCBldGMuKSBpbiB0aGUgc2FtZSBwYWdlX2luZm8gc3RydWN0dXJlcywgYmVm
b3JlIHRob3NlIHBhZ2VzIGFyZQ0KaW4gYSB0cnVseSBjb25zaXN0ZW50IHN0YXRlLg0KDQpSaWdo
dCBub3csIHdlIG5lZWQgdGhlIGxhdHRlciB0byBoYXBwZW4gKmFmdGVyKiB0aGUgYm9vdCBhbGxv
Y2F0b3IgaXMNCmRvbmUgYW5kIHdlJ3JlIGFibGUgdG8gYWxsb2NhdGUgZnJvbSB0aGUgaGVhcC4u
LiBiZWNhdXNlIHdlIG5lZWQgdG8gYmUNCmFibGUgdG8gYWxsb2NhdGUgdGhlIGRvbWFpbiBzdHJ1
Y3R1cmVzLCBhbmQgd2UgZG9uJ3Qgd2FudCB0byBlbnN1cmUNCnRoYXQgdGhlcmUncyBlbm91Z2gg
c3BhY2UgaW4gdGhlIExVIHJlc2VydmVkIGJvb3RtZW0gZm9yIHRoYXQgbWFueQ0KZG9tYWluIHN0
cnVjdHVyZXMuDQoNCkhlbmNlIHRoZSBuYXN0eSB0cmljazogV2hhdCBpZiB3ZSBhbGxvY2F0ZSB0
aGUgbmV3IHN0cnVjdCBkb21haW4gb24NCip0b3AqIG9mIHRoZSBvbGQgb25lLCBzaW5jZSB3ZSBo
YXBwZW4gdG8ga25vdyB0aGF0IHBhZ2UgKndhc24ndCogdXNlZA0KYnkgdGhlIHByZXZpb3VzIFhl
biBmb3IgYW55dGhpbmcgdGhhdCBuZWVkcyB0byBiZSBwcmVzZXJ2ZWQuIFRoZQ0Kc3RydWN0dXJl
IGl0c2VsZiBpc24ndCBhbiBBQkkgYW5kIG5ldmVyIGNhbiBiZSwgYW5kIGl0IHdpbGwgaGF2ZSB0
byBiZQ0KcmVwb3B1bGF0ZWQgZnJvbSB0aGUgbGl2ZSBtaWdyYXRpb24gZGF0YSwgb2YgY291cnNl
IOKAlCBidXQgaWYgd2UgY2FuIGF0DQpsZWFzdCBtYWtlIHRoZSBhc3N1bXB0aW9uIHRoYXQgaXQn
bGwgKmZpdCosIHRoZW4gcGVyaGFwcyB3ZSBjYW4gbWFuYWdlDQp0byBkbyBib3RoIG9mIHRoZSBh
Ym92ZSB3aXRoIG9ubHkgb25lIHBhc3Mgb3ZlciBhbGwgdGhlIGRvbWFpbiBwYWdlcy4NCg0KVGhp
cyB3aWxsIGhhdmUgYSBkaXJlY3QgZWZmZWN0IG9uIHRoZSBjdXN0b21lci1vYnNlcnZlZCBwYXVz
ZSB0aW1lIGZvcg0KYSBsaXZlIHVwZGF0ZS4gU28gaXQncyBraW5kIG9mIGlja3ksIGJ1dCBhbHNv
ICp2ZXJ5KiB0ZW1wdGluZy4uLg0KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRyZSAoTG9uZG9u
KSBMdGQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCBhbmQgV2FsZXMgd2l0aCByZWdpc3RyYXRpb24g
bnVtYmVyIDA0NTQzMjMyIHdpdGggaXRzIHJlZ2lzdGVyZWQgb2ZmaWNlIGF0IDEgUHJpbmNpcGFs
IFBsYWNlLCBXb3JzaGlwIFN0cmVldCwgTG9uZG9uIEVDMkEgMkZBLCBVbml0ZWQgS2luZ2RvbS4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
