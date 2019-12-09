Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531AE116D44
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:44:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieILQ-0006sR-D9; Mon, 09 Dec 2019 12:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieILO-0006sH-M6
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:40:54 +0000
X-Inumbo-ID: 23f4a452-1a81-11ea-88e7-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23f4a452-1a81-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575895255; x=1607431255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VIw1kTmJqxJMg02zZJc8KS3XN2nB5nqChmZFv+am6xY=;
 b=Nt6JsDHdKVjsGwq/ZXzVyK8DnivXFGK6W2F3fL3+aUfKSf3/L5nXBztk
 xrH3nbgG9wq2Z4V6irHOHL8tLHqCZ3DweuiOQBIHMyaGTV37Smz0MJgBO
 gLnXgzJW/Y/gWurtrP5zm+XBe4GxhBj0vTHPA06QuPjVmeHML6o02rMMp 0=;
IronPort-SDR: pYN9wEgJstjwwx4RrBwZlcZJHg2lwO2vtyZQW3KXZ/582Ohf6K1LdXg4XY5gCPamdbbbgtuqWY
 NUhPsOaSxPUw==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="7667714"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 09 Dec 2019 12:40:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id A4C26A209C; Mon,  9 Dec 2019 12:40:52 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:40:51 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:40:47 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 12:40:47 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEsBCAAAg3gIAAAevg
Date: Mon, 9 Dec 2019 12:40:47 +0000
Message-ID: <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
In-Reply-To: <20191209122537.GV980@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTI6MjYKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuCj4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47Cj4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3
aGVuIHN0YXRlIGlzIGZvcmNlZCB0bwo+IGNsb3NlZAo+IAo+IE9uIE1vbiwgRGVjIDA5LCAyMDE5
IGF0IDEyOjAxOjM4UE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+ID4gPiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjM5Cj4gPiA+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gPiBDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOwo+IEp1
ZXJnZW4KPiA+ID4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gPiA+IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0gg
Mi80XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMKPiBmb3JjZWQgdG8KPiA+ID4gY2xvc2Vk
Cj4gPiA+Cj4gPiA+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDAyOjAxOjIxUE0gKzAwMDAsIFBh
dWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiBPbmx5IGZvcmNlIHN0YXRlIHRvIGNsb3NlZCBpbiB0
aGUgY2FzZSB3aGVuIHRoZSB0b29sc3RhY2sgbWF5IG5lZWQKPiB0bwo+ID4gPiA+IGNsZWFuIHVw
LiBUaGlzIGNhbiBiZSBkZXRlY3RlZCBieSBjaGVja2luZyB3aGV0aGVyIHRoZSBzdGF0ZSBpbgo+
IHhlbnN0b3JlCj4gPiA+ID4gaGFzIGJlZW4gc2V0IHRvIGNsb3NpbmcgcHJpb3IgdG8gZGV2aWNl
IHJlbW92YWwuCj4gPiA+Cj4gPiA+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2YgdGhp
cywgSSB3b3VsZCBleHBlY3QgdGhhdCBhIGZhaWx1cmUgdG8KPiA+ID4gcHJvYmUgb3IgdGhlIHJl
bW92YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVuYnVzIHN0YXRlIGFzCj4gPiA+
IGNsb3NlZCwgd2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIHRoZSBhY3R1YWwgZHJpdmVyIHN0YXRl
Lgo+ID4gPgo+ID4gPiBDYW4geW91IGV4cGxhaW4gd2hhdCdzIHRoZSBiZW5lZml0IG9mIGxlYXZp
bmcgYSBkZXZpY2Ugd2l0aG91dCBhCj4gPiA+IGRyaXZlciBpbiBzdWNoIHVua25vd24gc3RhdGU/
Cj4gPiA+Cj4gPgo+ID4gSWYgcHJvYmUgZmFpbHMgdGhlbiBJIHRoaW5rIGl0IHNob3VsZCBsZWF2
ZSB0aGUgc3RhdGUgYWxvbmUuIElmIHRoZQo+ID4gc3RhdGUgaXMgbW92ZWQgdG8gY2xvc2VkIHRo
ZW4gYmFzaWNhbGx5IHlvdSBqdXN0IGtpbGxlZCB0aGF0Cj4gPiBjb25uZWN0aW9uIHRvIHRoZSBn
dWVzdCAoYXMgdGhlIGZyb250ZW5kIHdpbGwgbm9ybWFsbHkgY2xvc2UgZG93bgo+ID4gd2hlbiBp
dCBzZWVzIHRoaXMgY2hhbmdlKSBzbywgaWYgdGhlIHByb2JlIGZhaWx1cmUgd2FzIGR1ZSB0byBh
IGJ1Zwo+ID4gaW4gYmxrYmFjayBvciwgZS5nLiwgYSB0cmFuc2llbnQgcmVzb3VyY2UgaXNzdWUg
dGhlbiBpdCdzIGdhbWUgb3Zlcgo+ID4gYXMgZmFyIGFzIHRoYXQgZ3Vlc3QgZ29lcy4KPiAKPiBC
dXQgdGhlIGNvbm5lY3Rpb24gY2FuIGJlIHJlc3RhcnRlZCBieSBzd2l0Y2hpbmcgdGhlIGJhY2tl
bmQgdG8gdGhlCj4gaW5pdCBzdGF0ZSBhZ2Fpbi4KClRvbyBsYXRlLiBUaGUgZnJvbnRlbmQgc2F3
IGNsb3NlZCBhbmQgeW91IGFscmVhZHkgbG9zdC4KCj4gCj4gPiBUaGUgdWx0aW1hdGUgZ29hbCBo
ZXJlIGlzIFBWIGJhY2tlbmQgcmUtbG9hZCB0aGF0IGlzIGNvbXBsZXRlbHkKPiB0cmFuc3BhcmVu
dCB0byB0aGUgZ3Vlc3QuIE1vZGlmeWluZyBhbnl0aGluZyBpbiB4ZW5zdG9yZSBjb21wcm9taXNl
cyB0aGF0Cj4gc28gd2UgbmVlZCB0byBiZSBjYXJlZnVsLgo+IAo+IFRoYXQncyBhIGZpbmUgZ29h
bCwgYnV0IG5vdCBzd2l0Y2hpbmcgdG8gY2xvc2VkIHN0YXRlIGluCj4geGVuYnVzX2Rldl9yZW1v
dmUgc2VlbXMgd3JvbmcsIGFzIHlvdSBoYXZlIGFjdHVhbGx5IGxlZnQgdGhlIGZyb250ZW5kCj4g
d2l0aG91dCBhIG1hdGNoaW5nIGJhY2tlbmQgYW5kIHdpdGggdGhlIHN0YXRlIG5vdCBzZXQgdG8g
Y2xvc2VkLgo+IAoKV2h5IGlzIHRoaXMgYSBwcm9ibGVtPyBXaXRoIHRoaXMgc2VyaWVzIGZ1bGx5
IGFwcGxpZWQgYSAoYmxvY2spIGJhY2tlbmQgY2FuIGNvbWUgYW5kIGdvIHdpdGhvdXQgbmVlZGlu
ZyB0byBjaGFuZ2UgdGhlIHN0YXRlLiBSZWx5aW5nIG9uIGd1ZXN0cyB0byBEVFJUIGlzIG5vdCBh
IHN1c3RhaW5hYmxlIG9wdGlvbiBmb3IgYSBjbG91ZCBkZXBsb3ltZW50LgoKPiBJZTogdGhhdCB3
b3VsZCBiZSBmaW5lIGlmIHlvdSBleHBsaWNpdGx5IHN0YXRlIHRoaXMgaXMgc29tZSBraW5kIG9m
Cj4gaW50ZXJuYWwgYmxrYmFjayByZWxvYWQsIGJ1dCBub3QgZm9yIHRoZSBnZW5lcmFsIGNhc2Ug
d2hlcmUgYmxrYmFjawo+IGhhcyBiZWVuIHVuYm91bmQuIEkgdGhpbmsgd2UgbmVlZCBzb21ld2F5
IHRvIGRpZmZlcmVuY2UgYSBibGtiYWNrCj4gcmVsb2FkIHZzIGEgdW5ib3VuZC4KPiAKCldoeSBk
byB3ZSBuZWVkIHRoYXQgdGhvdWdoPyBXaHkgaXMgaXQgYWR2YW50YWdlb3VzIGZvciBhIGJhY2tl
bmQgdG8gZ28gdG8gY2xvc2VkLiBObyBQViBiYWNrZW5kcyBjb3BlIHdpdGggYW4gdW5iaW5kIGFz
LWlzLCBhbmQgYSB0b29sc3RhY2sgaW5pdGlhdGVkIHVucGx1ZyB3aWxsIGFsd2F5cyBzZXQgc3Rh
dGUgdG8gNSBhbnl3YXkuIFNvIFRCSCBhbnkgc3RhdGUgdHJhbnNpdGlvbiBkb25lIGRpcmVjdGx5
IGluIHRoZSB4ZW5idXMgY29kZSBsb29rcyB3cm9uZyB0byBtZSBhbnl3YXkgKGJ1dCBhcHBlYXJz
IHRvIGJlIGEgbmVjZXNzYXJ5IGV2aWwgdG8ga2VlcCB0aGUgdG9vbHN0YWNrIHdvcmtpbmcgaW4g
dGhlIGV2ZW50IGl0IHNwYXducyBhIGJhY2tlbmQgd2hlcmUgdGhlcmUgaXMgYWN0dWFsbHkgdG8g
ZHJpdmVyIHByZXNlbnQsIG9yIGl0IGRvZXNuJ3QgY29tZSBvbmxpbmUpLgoKICBQYXVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
