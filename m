Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23750DD811
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2019 12:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLlor-0007l0-92; Sat, 19 Oct 2019 10:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CQer=YM=amazon.de=prvs=188763d3f=wipawel@srs-us1.protection.inumbo.net>)
 id 1iLloq-0007kv-DK
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2019 10:18:44 +0000
X-Inumbo-ID: d4057c9a-f259-11e9-beca-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4057c9a-f259-11e9-beca-bc764e2007e4;
 Sat, 19 Oct 2019 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1571480323; x=1603016323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=XzkOk5+9ov3Mjx4lPDUNO6hJ96qaEOxglvzVQjUy7fk=;
 b=IBFYpM31xibelE7A5N7nwkgSz/H3ldxZBOlgPwInKrTWrPxjnsJZQKdz
 QRdF0uVMIZHkyCOF8yyGxDeR+v8xjb8SBQ+fmFr7iFEh2caOqnGZX2sTG
 YEOJBkUWYYiEDZd8ee1Ogj8uh/iTHDJwL9s0Dz463yFnwdsHmqwUQbXDH 0=;
X-IronPort-AV: E=Sophos;i="5.67,315,1566864000"; d="scan'208";a="794685286"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 19 Oct 2019 10:18:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6A468A1D2A; Sat, 19 Oct 2019 10:18:39 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 19 Oct 2019 10:18:38 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 19 Oct 2019 10:18:37 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Sat, 19 Oct 2019 10:18:37 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>
Thread-Topic: [PATCH v4 00/12] livepatch: new features and fixes
Thread-Index: AQHVdg9FOT1aaIWDdkSUqNalRaWdt6dgk5wAgAATRQCAATokgA==
Date: Sat, 19 Oct 2019 10:18:37 +0000
Message-ID: <DFEC7C2B-C6F2-42AB-8655-E3801E17D19A@amazon.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20191018142518.GA6040@char.us.oracle.com>
 <61ece13d-4808-ff92-45a8-4974f8684e0a@citrix.com>
In-Reply-To: <61ece13d-4808-ff92-45a8-4974f8684e0a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.182]
Content-ID: <3157D74210E22E4994600066F2B8A8E8@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 00/12] livepatch: new features and fixes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTguIE9jdCAyMDE5LCBhdCAxNzozNCwgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFn
ZXJ3YWxsQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTAvMTgvMTkgMzoyNSBQTSwgS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOg0KPj4gT24gU2F0LCBTZXAgMjgsIDIwMTkgYXQgMDM6
MTI6NTNQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6DQo+Pj4gVGhpcyBzZXJp
ZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMgdG8gdGhlIGxpdmVwYXRjaCBmdW5jdGlvbmFsaXR5
IGFzDQo+Pj4gYnJpZWZseSBkaXNjdXNzZWQgZHVyaW5nIFhlbiBEZXZlbG9wZXIgU3VtbWl0IDIw
MTk6IFthXSBhbmQgW2JdLg0KPj4+IEl0IGFsc28gcHJvdmlkZXMgYSBmZXcgZml4ZXMgYW5kIHNv
bWUgc21hbGwgaW1wcm92ZW1lbnRzLg0KPj4gSGV5YSwNCj4+IElzIHRoZXJlIGFuIHY1IG9mIHRo
ZSBwYXRjaGVzIHNvbWV3aGVyZSBicmV3aW5nIHNvIHRoYXQgSSBjYW4gZ2l2ZSB0aGVtDQo+PiBv
bmUgbGFzdCB0ZXN0Pw0KDQpZZXMsIGl0IGlz4oCmIGJ1dCBJIGFtIHdhaXRpbmcgZm9yIG1vcmUg
cmV2aWV3cyBiZWZvcmUgcHVibGlzaGluZyBhbm90aGVyIHJldmlzaW9uLg0KDQo+PiBKdWVyZ2Vu
LA0KPj4gQXJlIHlvdSBPSyB3aXRoIGdpdmluZyB0aGVtIGFuIFJlbGVhc2UtQWNrPyBJIHRoaW5r
IHRoZXJlIGFyZSBvbmx5IHR3byBtaW5vcg0KPj4gY2hhbmdlcyB0aGF0IEphbiByZXF1ZXN0ZWQu
DQo+IA0KPiBJIGhhdmUgbm90IHlldCBoYWQgdGltZSB0byByZXZpZXcgc29tZSBvZiB0aGUgcGF0
Y2hlcyBpbiB2NC4gSSBleHBlY3QgSSB3aWxsIGhhdmUgdGltZSBvbiBNb25kYXkgdG8gbG9vayBh
dCB0aGUgcmVzdC4NCj4gDQoNCkR1ZSB0byBvdGhlciB1cmdlbnQgd29yayBJIHdvbuKAmXQgYmUg
YWJsZSB0byBsb29rIGludG8gdGhpcyBmb3IgYSB3ZWVrIG9yIHR3by4NCg0KPiBUaGFua3MsDQo+
IC0tIA0KPiBSb3NzIExhZ2Vyd2FsbA0KDQpCZXN0IFJlZ2FyZHMsDQpQYXdlbCBXaWVjem9ya2ll
d2ljeg0KDQoNCg0KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3Jh
dXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNj
aGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIz
NyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
