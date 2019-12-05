Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC5113FA6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 11:49:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icodv-00073O-No; Thu, 05 Dec 2019 10:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fY9/=Z3=amazon.com=prvs=2352ce6fd=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icodu-00073J-Eq
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 10:45:54 +0000
X-Inumbo-ID: 6960d610-174c-11ea-a0d2-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6960d610-174c-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575542754; x=1607078754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P9Knworo0QursdFavRvioI0MSODtP2grn/u1obxMIHY=;
 b=krDqhFeEU/I4YvmRRGbQDsSuv43UubgNwZWhj3IpyiFrQeCeOgdJJ7TQ
 BSLf7n3D+EImdtFEMXVOM+JYz5/Xk2WlVfnp6u7JGsJi9WXgmFb2LB6Wg
 F3RQhn9bU0c5BYWhXz7kO8Ra7dSN8VyqCQuKlpcdC/5JtTGG4ZevJpOLT A=;
IronPort-SDR: xuw2KhltOADAoof1pu8CKoAxrNiRO9KyG2Fng6QPyMFJtF/20O8OsWOkpTjOMyU2k8pywly/pH
 NyOCye8UgmoQ==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="7253273"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Dec 2019 10:45:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4B441A284B; Thu,  5 Dec 2019 10:45:52 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 10:45:51 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 10:45:51 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 10:45:51 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v4 0/9] Add alternative API for Xen PTEs
Thread-Index: AQHVq0xxroTQx3memk2uPVDKAnsvMqerSa2AgAAC54CAAA8kAA==
Date: Thu, 5 Dec 2019 10:45:51 +0000
Message-ID: <611e4650286de7957b4ea86ca03105cd51c64a9b.camel@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <b6c93e86-0b3a-2b39-4e06-6c888191df12@suse.com>
 <16bdd981299ef440eacd38df92f3fd76e7a13521.camel@amazon.com>
 <baa3ab5b-d4ae-ab88-56af-2364cba39abc@suse.com>
In-Reply-To: <baa3ab5b-d4ae-ab88-56af-2364cba39abc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.128]
Content-ID: <18C8525C5550114AABC94AB5277C880B@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 0/9] Add alternative API for Xen PTEs
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2theSBsZXQgbWUgYmUgZXhwbGljaXQgdGhpcyB0aW1lLiBDcm9zcyBjaGVja2VkIHdpdGggbWFp
bHMgZnJvbQ0KbG9yZS5rZXJuZWwub3JnLCBpc3N1ZXMgbm90IHRvdWNoZWQgZnJvbSB2MyB0byB2
NDoNCg0KLSBfbmV3IG9yIG5vdCBfbmV3DQotIHNwbGl0dGluZyBtYXBfcGFnZXNfdG9feGVuOyBp
bnRyb2R1Y3Rpb24gb2YgbGFiZWxzLiBBbHRob3VnaCBJIGp1c3QNCnJlc3BvbmRlZCB0byB0aGVz
ZSB0d28gaXNzdWVzLg0KLSBjb25zdCBub3QgYWRkZWQgdG8gc3VnZ2VzdGVkIHZhcmlhYmxlcyBz
aW5jZSBhIGxvdCBvZiB0aGVtIGFyZSBzdHVjaw0Kd2l0aCB0aGUgb2xkIEFQSSBmb3Igbm93LiBJ
IGNhbiByZXZpZXcgcmVsZXZhbnQgZnVuY3Rpb25zIGFuZCBjb25zdA0KcXVhbGlmeSBvdGhlciBh
cHBsaWNhYmxlIG9uZXMuDQoNCkhvbmd5YW4NCg0KT24gVGh1LCAyMDE5LTEyLTA1IGF0IDEwOjUx
ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTIuMjAxOSAxMDo0MSwgWGlhLCBI
b25neWFuIHdyb3RlOg0KPiA+IEkgaGF2ZSBhZGRyZXNzZWQgdGhlIGNvbW1lbnRzIHRoYXQgSSBj
YW4gZmluZCBpbiB0aGUgYXJjaGl2ZS4NCj4gDQo+IFRoYXQncyBzdGlsbCBwcmV0dHkgdmFndWUg
LSBpcyB0aGVyZSByZWFzb24gdG8gYXNzdW1lIHlvdSB3ZXJlDQo+IG5vdCBhYmxlIHRvIGZpbmQg
c29tZSBjb21tZW50cyB0aGVyZT8NCj4gDQo+ID4gU29tZSBiaWcNCj4gPiBkZWJhdGVzIChsaWtl
IF9uZXcgb3Igbm90IF9uZXcsIHdoZXRoZXIgdG8gbW9kdWxhcmlzZQ0KPiA+IG1hcF9wYWdlc190
b194ZW4pDQo+ID4gaGF2ZSBub3QgYmVlbiB0b3VjaGVkLg0KPiANCj4gVGhlIF9uZXcgc3VmZml4
IGRpc2N1c3Npb24geW91J3ZlIG1lYW53aGlsZSByZXNwb25kZWQgeW91LA0KPiB3aGljaCBpcyB0
aGVyZWZvcmUgZmluZS4gVGhlIG1vZHVsYXJpemF0aW9uIHF1ZXN0aW9uLCBvdG9oLA0KPiBJIGRv
bid0IHJlY2FsbCBzZWVpbmcgYW55IHJlcGx5IGZvciwgYW5kIGhlbmNlIGZvciBub3cgSSdkDQo+
IHNraXAgcmUtcmV2aWV3aW5nIHRoZSByZXNwZWN0aXZlIHBhdGNoZXMuIEZ1cnRoZXJtb3JlLCBp
cw0KPiB5b3VyIHVzZSBvZiAibGlrZSIgaW1wbHlpbmcgdGhlcmUgd2VyZSBtb3JlIHRoYW4gdGhl
IHR3bw0KPiBleGFtcGxlcyB5b3UgZ2F2ZT8gQXMgbXVjaCBhcyBJIGNhbiB1bmRlcnN0YW5kIGRp
ZmZpY3VsdGllcw0KPiBvbiB5b3VyIHBhcnQgcmVzdWx0aW5nIGZyb20geW91ciBlbWFpbCBpc3N1
ZXMsIHBsZWFzZSBhbHNvDQo+IHVuZGVyc3RhbmQgbXkgcmVzZXJ2YXRpb25zIHJlZ2FyZGluZyBo
YXZpbmcgdG8gcmUtZG8gdGhpbmdzDQo+IHdoZXJlIHF1aXRlIGEgYml0IG9mIHRpbWUgaGFkIGFs
cmVhZHkgYmVlbiBpbnZlc3RlZCBpbnRvLg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
