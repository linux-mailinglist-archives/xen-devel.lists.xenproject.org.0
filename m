Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7217A90A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:40:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9sZz-0007tz-Lc; Thu, 05 Mar 2020 15:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P6JL=4W=amazon.co.uk=prvs=326373da0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9sZx-0007tq-FW
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:38:29 +0000
X-Inumbo-ID: 58f23902-5ef7-11ea-a607-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58f23902-5ef7-11ea-a607-12813bfff9fa;
 Thu, 05 Mar 2020 15:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583422704; x=1614958704;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=O+y1iMfqp6YulkvBwgofJ+S3Ah+be5gcoszGUbboe90=;
 b=ie5wcIh1Th+RMdAtJPMI1wF8hG1tpZimu+PaZhABkvzw3DuMRMas4Kfj
 D4Arz1hQg0dWE/SF3NthGcHm7khlQrkexjDowX/6vWTJgEQhQHPO63sSD
 sIIgP9rUZoeeAjz5uswdlTlg/ndjZJecM7Zh38CuEzgWin4AOHVruTlpU g=;
IronPort-SDR: fq/uofGC7qJAkd549k14ORcec1njnOf+FKT5OHH8XrCKoPaN9VN9vwl3Wx0nBOaqHBvfYMk2wn
 uj9vd/6Y/l/g==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="30850934"
Thread-Topic: [PATCH v3 5/6] mm: add 'is_special_page' macro...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 05 Mar 2020 15:38:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id C8B7EA2F47; Thu,  5 Mar 2020 15:38:16 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 15:38:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 15:38:15 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Mar 2020 15:38:15 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Tamas K Lengyel <tamas@tklengyel.com>, "pdurrant@amzn.com"
 <pdurrant@amzn.com>
Thread-Index: AQHV8uvzxGIBlfeLUUGZcXfQktffOqg6GlkAgAAHIPA=
Date: Thu, 5 Mar 2020 15:38:15 +0000
Message-ID: <38dc7e483b0e4599834372a92ddc909c@EX13D32EUC003.ant.amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <CABfawhkGxrj_bT2JwD5g7QPDYHYLCojuFPt8+p813REhyaiTSA@mail.gmail.com>
In-Reply-To: <CABfawhkGxrj_bT2JwD5g7QPDYHYLCojuFPt8+p813REhyaiTSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.216]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+DQo+IFNlbnQ6IDA1IE1hcmNoIDIwMjAgMTU6MTANCj4gVG86IHBk
dXJyYW50QGFtem4uY29tDQo+IENjOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz47IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEphbiBCZXVs
aWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5B
TF1bUEFUQ0ggdjMgNS82XSBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIG1hY3JvLi4uDQo+IA0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KPiANCj4gDQo+IA0KPiBPbiBUaHUsIE1hciA1LCAyMDIwIGF0IDU6NDUgQU0gPHBkdXJyYW50
QGFtem4uY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4NCj4gPg0KPiA+IC4uLiB0byBjb3ZlciB4ZW5oZWFwIGFuZCBQR0NfZXh0cmEg
cGFnZXMuDQo+ID4NCj4gPiBQR0NfZXh0cmEgcGFnZXMgYXJlIGludGVuZGVkIHRvIGhvbGQgZGF0
YSBzdHJ1Y3R1cmVzIHRoYXQgYXJlIGFzc29jaWF0ZWQNCj4gPiB3aXRoIGEgZG9tYWluIGFuZCBt
eSBiZSBtYXBwZWQgYnkgdGhhdCBkb21haW4uIFRoZXkgc2hvdWxkIG5vdCBiZSB0cmVhdGVkDQo+
ID4gYXMgJ25vcm1hbCcgZ3Vlc3QgcGFnZXMgKGkuZS4gUkFNIG9yIHBhZ2UgdGFibGVzKS4gSGVu
Y2UsIGluIG1hbnkgY2FzZXMNCj4gPiB3aGVyZSBjb2RlIGN1cnJlbnRseSB0ZXN0cyBpc194ZW5f
aGVhcF9wYWdlKCkgaXQgc2hvdWxkIGFsc28gY2hlY2sgZm9yDQo+ID4gdGhlIFBHQ19leHRyYSBi
aXQgaW4gJ2NvdW50X2luZm8nLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCB0aGVyZWZvcmUgZGVmaW5l
cyBpc19zcGVjaWFsX3BhZ2UoKSB0byBjb3ZlciBib3RoIGNhc2VzIGFuZA0KPiA+IGNvbnZlcnRz
IHRlc3RzIGlmIGlzX3hlbl9oZWFwX3BhZ2UoKSB0byBpc19zcGVjaWFsX3BhZ2UoKSB3aGVyZQ0K
PiA+IGFwcHJvcHJpYXRlLg0KPiANCj4gSW4gY29udGV4dCBvZiBWTSBmb3JraW5nLCBhcmUgdGhl
c2UgcGFnZXMgb25seSB1c2VkIGJ5IHNvbWUgdHlwZSBvZiBQVg0KPiBtZWNoYW5pc20/IElmIG5v
dCwgd291bGQgd2UgbmVlZCB0byBnZXQgdGhlbSBjb3BpZWQgc29tZWhvdyBvciBhcmUNCj4gdGhl
c2Ugc2V0dXAgZHVyaW5nIHRoZSByZWd1bGFyIGNyZWF0ZWRvbWFpbiByb3V0aW5lPyBDYW4gdGhl
eSBiZQ0KPiBjb3BpZWQgb24tZGVtYW5kLCBpZS4gZG8gdGhlc2UgcGFnZXMgcGFzcyBhIHAybV9p
c19yYW0oKSBjaGVjaz8NCg0KUEdDX2V4dHJhIGRvbWhlYXAgcGFnZXMgYXJlIGludGVuZGVkIGFz
IGRpcmVjdCByZXBsYWNlbWVudHMgZm9yIHNoYXJlZCB4ZW5oZWFwIHBhZ2VzIGFuZCBzaG91bGQg
YmUgdHJlYXRlZCB0aGUgc2FtZSB3YXkuIFRodXMgdGhleSBkbyBub3QgZm9ybSBwYXJ0IG9mIHRo
ZSBtaWdyYXRpb24gc3RyZWFtLiBUaGVpciBwMm0gdHlwZSBkZXBlbmRzIGVudGlyZWx5IG9uIGhv
dyB0aGV5IGFyZSBhZGRlZCB0byB0aGUgcDJtLCBhcyBpdCBpcyBmb3IgYW55IG90aGVyIHBhZ2Uu
DQoNCiAgUGF1bA0KDQo+IA0KPiBUaGFua3MsDQo+IFRhbWFzDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
