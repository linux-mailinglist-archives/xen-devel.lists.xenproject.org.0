Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54BA14EB54
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 12:00:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixTzH-0006ly-C4; Fri, 31 Jan 2020 10:57:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixTzF-0006lt-GC
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 10:57:21 +0000
X-Inumbo-ID: 747c3ab4-4418-11ea-b211-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 747c3ab4-4418-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580468241; x=1612004241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C9FK3N/ouxohAcmywh0uIvdkemdyh9P72eiDUf9ZgUs=;
 b=XhIOnJUirC3bk4mY9aZ9lZK5IX1TCJUDk3A+op47yBYAKgLn4eWm7z6b
 edQMhcFl8cGOogDPuG6b/QpylIsL2CZW8jYtIGxvWS8h7RMo2DEAtbH1k
 eabyin73WU14+BJkIuAgvrA8TeeqyDFLZA32Qw2St5iZAv6T8OLben2u8 M=;
IronPort-SDR: wA/n5YZD7WBfpytzv1kvv/IbZ+ARq1wf+NN+unu1VhoMzYpyV2u1hXOvDNE5n4Ddm0e8soWCzk
 JPuwqBh7NfUQ==
X-IronPort-AV: E=Sophos;i="5.70,385,1574121600"; d="scan'208";a="15073585"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 31 Jan 2020 10:57:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 69073A20F6; Fri, 31 Jan 2020 10:57:19 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 10:57:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 10:57:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 10:57:17 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH v4 4/7] libxl: add infrastructure to track and query
 'recent' domids
Thread-Index: AQHV0TKDnh+D1bkKTE+zyVJ74YGBcKgEp28AgAAAbQA=
Date: Fri, 31 Jan 2020 10:57:17 +0000
Message-ID: <9438ca2892f44a8f8e6050144ccc0f3a@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-5-pdurrant@amazon.com>
 <20200131105514.GS1288@perard.uk.xensource.com>
In-Reply-To: <20200131105514.GS1288@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 4/7] libxl: add infrastructure to track
 and query 'recent' domids
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDEwOjU1Cj4g
VG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3Nvbgo+IDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQv
N10gbGlieGw6IGFkZCBpbmZyYXN0cnVjdHVyZSB0byB0cmFjayBhbmQgcXVlcnkKPiAncmVjZW50
JyBkb21pZHMKPiAKPiBPbiBXZWQsIEphbiAyMiwgMjAyMCBhdCAwMjo0NDo0M1BNICswMDAwLCBQ
YXVsIER1cnJhbnQgd3JvdGU6Cj4gPiBBIGRvbWlkIGlzIGNvbnNpZGVyZWQgcmVjZW50IGlmIHRo
ZSBkb21haW4gaXQgcmVwcmVzZW50cyB3YXMgZGVzdHJveWVkCj4gPiBsZXNzIHRoYW4gYSBzcGVj
aWZpZWQgbnVtYmVyIG9mIHNlY29uZHMgYWdvLiBUaGUgbnVtYmVyIGNhbiBiZSBzZXQgdXNpbmcK
PiA+IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBMSUJYTF9ET01JRF9SRVVTRV9USU1FT1VULiBJ
ZiB0aGUgdmFyaWFibGUgZG9lcwo+ID4gbm90IGV4aXN0IHRoZW4gYSBkZWZhdWx0IHZhbHVlIG9m
IDYwcyBpcyB1c2VkLgo+IAo+IENvdWxkIHlvdSByZXdyaXRlIHRoYXQgcGFydCBvZiB0aGUgY29t
bWl0IG1lc3NhZ2U/IEJ5IHJlYWRpbmcgaXQsIGl0Cj4gc291bmRzIHRvIG1lIGxpa2UgTElCWExf
RE9NSURfUkVVU0VfVElNRU9VVCBpcyBhIGNvbmZpZ3VyYXRpb24gdmFyaWFibGUKPiB0aGF0IGEg
dG9vbHN0YWNrIG1heSB3YW50IHRvIHNldC4gV2hlcmVhcyB0aGUgY29tbWVudCBpbgo+IGxpYnhs
X2ludGVybmFsLmggaW5kaWNhdGVzIHRoYXQgaXQncyBmb3IgZGVidWdpbmcuICBIYXZpbmcgZW52
IHZhciBmb3IKPiBkZWJ1Z2dpbmcgc291bmRzIGdvb2QsIGJ1dCBoYXZpbmcgZW52IHZhciBhcyBj
b25maWd1cmF0aW9uIGRvZXNuJ3QuCj4gCgpTdXJlLCBJJ2xsIG1ha2UgdGhlIGNvbW1pdCBjb21t
ZW50IGNsZWFyZXIuCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
