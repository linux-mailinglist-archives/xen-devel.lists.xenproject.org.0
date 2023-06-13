Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78E72E340
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 14:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548146.855929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q93Mb-0002Mw-Lp; Tue, 13 Jun 2023 12:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548146.855929; Tue, 13 Jun 2023 12:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q93Mb-0002L8-Is; Tue, 13 Jun 2023 12:43:09 +0000
Received: by outflank-mailman (input) for mailman id 548146;
 Tue, 13 Jun 2023 12:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbAx=CB=aculab.com=david.laight@srs-se1.protection.inumbo.net>)
 id 1q93Ma-0002L2-3g
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 12:43:08 +0000
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7eed89c-09e7-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 14:43:06 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-311-rnUksceOM2-gkIbIoMQNcA-1; Tue, 13 Jun 2023 13:43:04 +0100
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 13 Jun
 2023 13:42:59 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 13 Jun 2023 13:42:59 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d7eed89c-09e7-11ee-b232-6b7b168915f2
X-MC-Unique: rnUksceOM2-gkIbIoMQNcA-1
From: David Laight <David.Laight@ACULAB.COM>
To: 'Rasmus Villemoes' <linux@rasmusvillemoes.dk>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, Hans de Goede <hdegoede@redhat.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Lee Jones <lee@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
	<rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Christoph
 Hellwig" <hch@lst.de>
Subject: RE: [PATCH v3 3/4] vsscanf(): do not skip spaces
Thread-Topic: [PATCH v3 3/4] vsscanf(): do not skip spaces
Thread-Index: AQHZnR4ovdHGuD5F0k2o+1T0Ru69aa+Iri8A
Date: Tue, 13 Jun 2023 12:42:59 +0000
Message-ID: <32e8b52d64b642608595142ab2952f16@AcuMS.aculab.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
 <20230610204044.3653-4-demi@invisiblethingslab.com>
 <546e2ab5-f520-c85e-d6f4-ca7b02457d4c@rasmusvillemoes.dk>
In-Reply-To: <546e2ab5-f520-c85e-d6f4-ca7b02457d4c@rasmusvillemoes.dk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogUmFzbXVzIFZpbGxlbW9lcw0KPiBTZW50OiAxMiBKdW5lIDIwMjMgMTI6MDgNCj4gDQo+
IE9uIDEwLzA2LzIwMjMgMjIuNDAsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gPiBQYXNz
aW5nIHNwYWNlcyBiZWZvcmUgZS5nLiBhbiBpbnRlZ2VyIGlzIHVzdWFsbHkNCj4gPiBub3QgaW50
ZW5kZWQuDQo+IA0KPiBNYXliZSwgbWF5YmUgbm90LiBCdXQgaXQncyBtYW5kYXRlZCBieSBQT1NJ
WC9DOTkuDQo+IA0KPiBBbmQgb2YgY291cnNlIHdlIGFyZSBmcmVlIHRvIGlnbm9yZSB0aGF0IGFu
ZCBpbXBsZW1lbnQgb3VyIG93biBzZW1hbnRpY3MNCj4gKHRob3VnaCB3aXRoaW4gdGhlIGNvbnN0
cmFpbnRzIHRoYXQgd2UgcmVhbGx5IHdhbnQgLVdmb3JtYXQgdG8gaGVscCB1cyksDQo+IGJ1dCB0
aGVyZSBzZWVtcyB0byBiZSBleGlzdGluZyBjb2RlIGluLXRyZWUgdGhhdCByZWxpZXMgb24gdGhp
cw0KPiBiZWhhdmlvci4gRm9yIGV4YW1wbGUgSSB0aGluayB0aGlzIHdpbGwgYnJlYWsNCj4gZnNs
X3NhdGFfaW50cl9jb2FsZXNjaW5nX3N0b3JlKCkgd2hpY2ggdXNlcyBhIHNjYW5mIGZvcm1hdCBv
ZiAiJXUldSIuDQo+IA0KPiBTdXJlLCB0aGF0IGNvdWxkIGp1c3Qgc2F5ICIldSAldSIgaW5zdGVh
ZCwgYnV0IHRoZSBwb2ludCBpcyB0aGF0DQo+IGN1cnJlbnRseSBpdCBkb2Vzbid0LiBTbyB3aXRo
b3V0IHNvbWUgcmVhc29uYWJseSB0aG9yb3VnaCBhbmFseXNpcw0KPiBhY3Jvc3MgdGhlIHRyZWUs
IGFuZCB1cGRhdGVzIG9mIGFmZmVjdGVkIGNhbGxlcnMsIE5BSy4NCg0KSXQgd291bGQgYWxtb3N0
IGNlcnRhaW5seSBuZWVkIHRvIGJlICIgJXUgJXUiIHRvIGFsbG93IGZvcg0KdXNlcnNwYWNlIGdl
bmVyYXRpbmcgdGhlIGlucHV0IHdpdGggIiU2dSAlNnUiLA0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0
ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBL
ZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K


