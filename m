Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFC21B0B1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtnqw-0005GG-Rc; Fri, 10 Jul 2020 07:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RM36=AV=amazon.de=prvs=453334893=wipawel@srs-us1.protection.inumbo.net>)
 id 1jtnqu-0005GB-WF
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 07:53:49 +0000
X-Inumbo-ID: 7c9f6336-c282-11ea-bb8b-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c9f6336-c282-11ea-bb8b-bc764e2007e4;
 Fri, 10 Jul 2020 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1594367629; x=1625903629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=rgE8KP+G2jBgkSX7/8VriuBGi2KgsQj33m8hlyStpus=;
 b=aetBFfIs1kLYrRPcizYRzOqTyZRaivkXz7kDk5cVM+tmXu7GbZ1qO2oi
 TaFSjJjEe3GJB/xv4Sp5118jpv3jF3+Z/iMpFb8+P1CXxA1iobw8aa/0c
 uvTukJpyU8QpyNI35ie38Qio2Kwh2+BB5ijC8p/fLTRrNOkG/hHz1PGNJ M=;
IronPort-SDR: 8K05o5Smf0O3xPGbO1WCyBp+X1hf38iHeQjtJUsbuJPetvlSFcBSQ9F+1N/jff0xPg4vYWKiUk
 5ZzMxP/ixsPg==
X-IronPort-AV: E=Sophos;i="5.75,335,1589241600"; d="scan'208";a="58783042"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 10 Jul 2020 07:53:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 13009C1963; Fri, 10 Jul 2020 07:53:41 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 10 Jul 2020 07:53:40 +0000
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 10 Jul 2020 07:53:39 +0000
Received: from EX13D05EUB003.ant.amazon.com ([10.43.166.253]) by
 EX13D05EUB003.ant.amazon.com ([10.43.166.253]) with mapi id 15.00.1497.006;
 Fri, 10 Jul 2020 07:53:39 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien@xen.org>
Subject: Re: [XTF] xenbus: Don't wait if the response ring is full
Thread-Topic: [XTF] xenbus: Don't wait if the response ring is full
Thread-Index: AQHWVo856A8ZAu2mDEGOBIlrR83SyQ==
Date: Fri, 10 Jul 2020 07:53:39 +0000
Message-ID: <02F94EA5-3555-4D3B-97DF-98914410424B@amazon.com>
References: <20200709184647.5159-1-julien@xen.org>
In-Reply-To: <20200709184647.5159-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.86]
Content-Type: text/plain; charset="utf-8"
Content-ID: <44A3B3D566F72048AF5A80600D164451@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.co.uk>, xen-devel <xen-devel@lists.xenproject.org>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gOS4gSnVsIDIwMjAsIGF0IDIwOjQ2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24u
Y29tPg0KPiANCj4gWGVuU3RvcmUgcmVzcG9uc2UgY2FuIGJlIGJpZ2dlciB0aGFuIHRoZSByZXNw
b25zZSByaW5nLiBJbiB0aGlzIGNhc2UsDQo+IGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgdGhlIHJp
bmcgZnVsbCAoZS5nIGNvbnMgPSAxOSBhbmQgcHJvZCA9IDEwNDMpLg0KPiANCj4gSG93ZXZlciwg
WFRGIHdpbGwgY29uc2lkZXIgdGhhdCB0aGVyZSBpcyBubyBkYXRhIGFuZCB0aGVyZWZvcmUgd2Fp
dCBmb3INCj4gbW9yZSBpbnB1dC4gVGhpcyB3aWxsIHJlc3VsdCB0byBibG9jayBpbmRlZmluaXRl
bHkgYXMgdGhlIHJpbmcgaXMgZnVsbC4NCj4gDQo+IFRoaXMgY2FuIGJlIHNvbHZlZCBieSBhdm9p
ZGluZyB0byBtYXNrIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gcHJvZCBhbmQNCj4gY29ucy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IC0t
LQ0KPiBjb21tb24veGVuYnVzLmMgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi94ZW5idXMuYyBi
L2NvbW1vbi94ZW5idXMuYw0KPiBpbmRleCAyNGZmZjQ4NzIzNzIuLmYzYmIzMGFjNjkzZiAxMDA2
NDQNCj4gLS0tIGEvY29tbW9uL3hlbmJ1cy5jDQo+ICsrKyBiL2NvbW1vbi94ZW5idXMuYw0KPiBA
QCAtNzUsNyArNzUsNyBAQCBzdGF0aWMgdm9pZCB4ZW5idXNfcmVhZCh2b2lkICpkYXRhLCBzaXpl
X3QgbGVuKQ0KPiAgICAgICAgIHVpbnQzMl90IHByb2QgPSBBQ0NFU1NfT05DRSh4Yl9yaW5nLT5y
c3BfcHJvZCk7DQo+ICAgICAgICAgdWludDMyX3QgY29ucyA9IEFDQ0VTU19PTkNFKHhiX3Jpbmct
PnJzcF9jb25zKTsNCj4gDQo+IC0gICAgICAgIHBhcnQgPSBtYXNrX3hlbmJ1c19pZHgocHJvZCAt
IGNvbnMpOw0KPiArICAgICAgICBwYXJ0ID0gcHJvZCAtIGNvbnM7DQo+IA0KPiAgICAgICAgIC8q
IE5vIGRhdGE/ICBLaWNrIHhlbnN0b3JlZCBhbmQgd2FpdCBmb3IgaXQgdG8gcHJvZHVjZSBzb21l
IGRhdGEuICovDQo+ICAgICAgICAgaWYgKCAhcGFydCApDQo+IOKAlA0KPiAyLjE3LjENCj4gDQoN
ClJldmlld2VkLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+CgoK
CkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEw
MTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0
aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVy
IEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


