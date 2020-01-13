Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB9139067
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 12:51:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqyCV-0005Di-Gp; Mon, 13 Jan 2020 11:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rdZH=3C=amazon.com=prvs=274b223ee=sblbir@srs-us1.protection.inumbo.net>)
 id 1iqy7z-00058k-Rv
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 11:43:27 +0000
X-Inumbo-ID: e9dd1e68-35f9-11ea-a2eb-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9dd1e68-35f9-11ea-a2eb-bc764e2007e4;
 Mon, 13 Jan 2020 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578915808; x=1610451808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6XSa5GpL3gh4h8YvwELtoJ+sfZcbWRXkFc5y4pfehoc=;
 b=XB5oT7mYagcyvbru4dFX+upsX3l3aVSmztU9P6B57v/2yflNOaZxpDRP
 MmsVkrk3k8XSruzHi9cFruv3RNEuqukNYSOcbT8DQAjP5ZmUuSl3U1FtX
 N4/EeYyyKRc6I01tOx8cEJV7vn3sSb7HRiXroXqhda80w4KKNRGJCneN9 4=;
IronPort-SDR: R+BlWp6nTHVVhaIhMU2TJ0LB4YSRTLQsATI0sOMiyFM4iSh27yUGPwc+8iW49sp1OvtUIhwKnD
 k40Idn6O/1kA==
X-IronPort-AV: E=Sophos;i="5.69,428,1571702400"; d="scan'208";a="12102670"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Jan 2020 11:43:27 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9A4CDA1D45; Mon, 13 Jan 2020 11:43:19 +0000 (UTC)
Received: from EX13D05UWB003.ant.amazon.com (10.43.161.26) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 Jan 2020 11:43:18 +0000
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13D05UWB003.ant.amazon.com (10.43.161.26) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 Jan 2020 11:43:18 +0000
Received: from EX13D01UWB002.ant.amazon.com ([10.43.161.136]) by
 EX13d01UWB002.ant.amazon.com ([10.43.161.136]) with mapi id 15.00.1367.000;
 Mon, 13 Jan 2020 11:43:18 +0000
From: "Singh, Balbir" <sblbir@amazon.com>
To: "peterz@infradead.org" <peterz@infradead.org>, "Valentin, Eduardo"
 <eduval@amazon.com>
Thread-Topic: [RFC PATCH V2 11/11] x86: tsc: avoid system instability in
 hibernation
Thread-Index: AQHVxbSKwN2FtiBCp0yRN06uTqctz6fgl2OAgAN0VQCABF3RgIAAGFiA
Date: Mon, 13 Jan 2020 11:43:18 +0000
Message-ID: <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
In-Reply-To: <20200113101609.GT2844@hirez.programming.kicks-ass.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.119]
Content-ID: <842199D22376DB4B847E04A9819A1D72@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Mon, 13 Jan 2020 11:48:05 +0000
Subject: Re: [Xen-devel] [RFC PATCH V2 11/11] x86: tsc: avoid system
 instability in hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "konrad.wilk@oracle.co" <konrad.wilk@oracle.co>,
 "x86@kernel.org" <x86@kernel.org>, "len.brown@intel.com" <len.brown@intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "Kamata, 
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Agarwal, 
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com"
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDIwLTAxLTEzIGF0IDExOjE2ICswMTAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4gT24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDc6MzU6MjBBTSAtMDgwMCwgRWR1YXJkbyBWYWxl
bnRpbiB3cm90ZToNCj4gPiBIZXkgUGV0ZXIsDQo+ID4gDQo+ID4gT24gV2VkLCBKYW4gMDgsIDIw
MjAgYXQgMTE6NTA6MTFBTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6DQo+ID4gPiBPbiBU
dWUsIEphbiAwNywgMjAyMCBhdCAxMTo0NToyNlBNICswMDAwLCBBbmNoYWwgQWdhcndhbCB3cm90
ZToNCj4gPiA+ID4gRnJvbTogRWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+DQo+
ID4gPiA+IA0KPiA+ID4gPiBTeXN0ZW0gaW5zdGFiaWxpdHkgYXJlIHNlZW4gZHVyaW5nIHJlc3Vt
ZSBmcm9tIGhpYmVybmF0aW9uIHdoZW4gc3lzdGVtDQo+ID4gPiA+IGlzIHVuZGVyIGhlYXZ5IENQ
VSBsb2FkLiBUaGlzIGlzIGR1ZSB0byB0aGUgbGFjayBvZiB1cGRhdGUgb2Ygc2NoZWQNCj4gPiA+
ID4gY2xvY2sgZGF0YSwgYW5kIHRoZSBzY2hlZHVsZXIgd291bGQgdGhlbiB0aGluayB0aGF0IGhl
YXZ5IENQVSBob2cNCj4gPiA+ID4gdGFza3MgbmVlZCBtb3JlIHRpbWUgaW4gQ1BVLCBjYXVzaW5n
IHRoZSBzeXN0ZW0gdG8gZnJlZXplDQo+ID4gPiA+IGR1cmluZyB0aGUgdW5mcmVlemluZyBvZiB0
YXNrcy4gRm9yIGV4YW1wbGUsIHRocmVhZGVkIGlycXMsDQo+ID4gPiA+IGFuZCBrZXJuZWwgcHJv
Y2Vzc2VzIHNlcnZpY2luZyBuZXR3b3JrIGludGVyZmFjZSBtYXkgYmUgZGVsYXllZA0KPiA+ID4g
PiBmb3Igc2V2ZXJhbCB0ZW5zIG9mIHNlY29uZHMsIGNhdXNpbmcgdGhlIHN5c3RlbSB0byBiZSB1
bnJlYWNoYWJsZS4NCj4gPiA+ID4gVGhlIGZpeCBmb3IgdGhpcyBzaXR1YXRpb24gaXMgdG8gbWFy
ayB0aGUgc2NoZWQgY2xvY2sgYXMgdW5zdGFibGUNCj4gPiA+ID4gYXMgZWFybHkgYXMgcG9zc2li
bGUgaW4gdGhlIHJlc3VtZSBwYXRoLCBsZWF2aW5nIGl0IHVuc3RhYmxlDQo+ID4gPiA+IGZvciB0
aGUgZHVyYXRpb24gb2YgdGhlIHJlc3VtZSBwcm9jZXNzLiBUaGlzIHdpbGwgZm9yY2UgdGhlDQo+
ID4gPiA+IHNjaGVkdWxlciB0byBhdHRlbXB0IHRvIGFsaWduIHRoZSBzY2hlZCBjbG9jayBhY3Jv
c3MgQ1BVcyB1c2luZw0KPiA+ID4gPiB0aGUgZGVsdGEgd2l0aCB0aW1lIG9mIGRheSwgdXBkYXRp
bmcgc2NoZWQgY2xvY2sgZGF0YS4gSW4gYSBwb3N0DQo+ID4gPiA+IGhpYmVybmF0aW9uIGV2ZW50
LCB3ZSBjYW4gdGhlbiBtYXJrIHRoZSBzY2hlZCBjbG9jayBhcyBzdGFibGUNCj4gPiA+ID4gYWdh
aW4sIGF2b2lkaW5nIHVubmVjZXNzYXJ5IHN5bmNzIHdpdGggdGltZSBvZiBkYXkgb24gc3lzdGVt
cw0KPiA+ID4gPiBpbiB3aGljaCBUU0MgaXMgcmVsaWFibGUuDQo+ID4gPiANCj4gPiA+IFRoaXMg
bWFrZXMgbm8gZnJpZ2dpbmcgc2Vuc2Ugd2hhdCBzbyBibG9vZHkgZXZlci4gSWYgdGhlIGNsb2Nr
IGlzDQo+ID4gPiBzdGFibGUsIHdlIGRvbid0IGNhcmUgYWJvdXQgc2NoZWRfY2xvY2tfZGF0YS4g
V2hlbiBpdCBpcyBzdGFibGUgeW91IGdldA0KPiA+ID4gYSBsaW5lYXIgZnVuY3Rpb24gb2YgdGhl
IFRTQyB3aXRob3V0IGNvbXBsaWNhdGVkIGJpdHMgb24uDQo+ID4gPiANCj4gPiA+IFdoZW4gaXQg
aXMgdW5zdGFibGUsIG9ubHkgdGhlbiBkbyB3ZSBjYXJlIGFib3V0IHRoZSBzY2hlZF9jbG9ja19k
YXRhLg0KPiA+ID4gDQo+ID4gDQo+ID4gWWVhaCwgbWF5YmUgd2hhdCBpcyBub3QgY2xlYXIgaGVy
ZSBpcyB0aGF0IHdlIGNvdmVyaW5nIGZvciBzaXR1YXRpb24NCj4gPiB3aGVyZSBjbG9jayBzdGFi
aWxpdHkgY2hhbmdlcyBvdmVyIHRpbWUsIGUuZy4gYXQgcmVndWxhciBib290IGNsb2NrIGlzDQo+
ID4gc3RhYmxlLCBoaWJlcm5hdGlvbiBoYXBwZW5zLCB0aGVuIHJlc3RvcmUgaGFwcGVucyBpbiBh
IG5vbi1zdGFibGUgY2xvY2suDQo+IA0KPiBTdGlsbCBjb25mdXNlZCwgd2hvIG1hcmtzIHRoZSB0
aGluZyB1bnN0YWJsZT8gVGhlIHBhdGNoIHNlZW1zIHRvIHN1Z2dlc3QNCj4geW91IGRvIHlvdXJz
ZWxmLCBidXQgaXQgaXMgbm90IGF0IGFsbCBjbGVhciB3aHkuDQo+IA0KPiBJZiBUU0MgcmVhbGx5
IGlzIHVuc3RhYmxlLCB0aGVuIGl0IG5lZWRzIHRvIHJlbWFpbiB1bnN0YWJsZS4gSWYgdGhlIFRT
Qw0KPiByZWFsbHkgaXMgc3RhYmxlIHRoZW4gdGhlcmUgaXMgbm8gcG9pbnQgaW4gbWFya2luZyBp
cyB1bnN0YWJsZS4NCj4gDQo+IEVpdGhlciB3YXkgc29tZXRoaW5nIGlzIG9mZiwgYW5kIHlvdSdy
ZSBub3QgdGVsbGluZyBtZSB3aGF0Lg0KPiANCg0KSGksIFBldGVyDQoNCkZvciB5b3VyIG9yaWdp
bmFsIGNvbW1lbnQsIGp1c3Qgd2FudGVkIHRvIGNsYXJpZnkgdGhlIGZvbGxvd2luZzoNCg0KMS4g
QWZ0ZXIgaGliZXJuYXRpb24sIHRoZSBtYWNoaW5lIGNhbiBiZSByZXN1bWVkIG9uIGEgZGlmZmVy
ZW50IGJ1dCBjb21wYXRpYmxlDQpob3N0ICh0aGVzZSBhcmUgVk0gaW1hZ2VzIGhpYmVybmF0ZWQp
DQoyLiBUaGlzIG1lYW5zIHRoZSBjbG9jayBiZXR3ZWVuIGhvc3QxIGFuZCBob3N0MiBjYW4vd2ls
bCBiZSBkaWZmZXJlbnQNCg0KSW4geW91ciBjb21tZW50cyBhcmUgeW91IG1ha2luZyB0aGUgYXNz
dW1wdGlvbiB0aGF0IHRoZSBob3N0KHMpIGlzL2FyZSB0aGUNCnNhbWU/IEp1c3QgY2hlY2tpbmcg
dGhlIGFzc3VtcHRpb25zIGJlaW5nIG1hZGUgYW5kIGJlaW5nIG9uIHRoZSBzYW1lIHBhZ2Ugd2l0
aA0KdGhlbS4NCg0KQmFsYmlyIFNpbmdoLg0KDQo+ID4gPiA+IFJldmlld2VkLWJ5OiBFcmlrIFF1
YW5zdHJvbSA8cXVhbnN0cm9AYW1hem9uLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEZyYW5r
IHZhbiBkZXIgTGluZGVuIDxmbGxpbmRlbkBhbWF6b24uY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1i
eTogQmFsYmlyIFNpbmdoIDxzYmxiaXJAYW1hem9uLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6
IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6b24uY29tPg0KPiA+ID4gPiBUZXN0ZWQtYnk6
IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBFZHVhcmRvIFZhbGVudGluIDxlZHV2YWxAYW1hem9uLmNvbT4NCj4gPiA+ID4gLS0tDQo+
ID4gPiANCj4gPiA+IE5BSywgdGhlIGNvZGUgdmVyeSBtdWNoIHJlbGllcyBvbiBuZXZlciBnZXR0
aW5nIG1hcmtlZCBzdGFibGUgYWdhaW4NCj4gPiA+IGFmdGVyIGl0IGdldHMgc2V0IHRvIHVuc3Rh
YmxlLg0KPiA+ID4gDQo+ID4gDQo+ID4gV2VsbCBhY3R1YWxseSwgYXQgdGhlIFBNX1BPU1RfSElC
RVJOQVRJT04sIHdlIGRvIHRoZSBjaGVjayBhbmQgc2V0IHN0YWJsZQ0KPiA+IGlmDQo+ID4ga25v
d24gdG8gYmUgc3RhYmxlLg0KPiA+IA0KPiA+IFRoZSBpc3N1ZSBvbmx5IHJlYWxseSBoYXBwZW5z
IGR1cmluZyB0aGUgcmVzdG9yYXRpb24gcGF0aCB1bmRlciBzY2hlZHVsaW5nDQo+ID4gcHJlc3N1
cmUsDQo+ID4gd2hpY2ggdGFrZXMgZm9yZXZlciB0byBmaW5pc2gsIGFzIGRlc2NyaWJlZCBpbiB0
aGUgY29tbWl0Lg0KPiA+IA0KPiA+IERvIHlvdSBzZWUgYSBiZXR0ZXIgc29sdXRpb24gZm9yIHRo
aXMgaXNzdWU/DQo+IA0KPiBJIHN0aWxsIGhhdmUgbm8gY2x1ZSB3aGF0IHlvdXIgYWN0dWFsIHBy
b2JsZW0gaXMuIFlvdSBzYXkgc2NoZWR1bGluZw0KPiBnb2VzIHdvYmJseSBiZWNhdXNlIHNjaGVk
X2Nsb2NrX2RhdGEgaXMgc3RhbGUsIGJ1dCB3aGVuIHN0YWJsZSB0aGF0DQo+IGRvZXNuJ3QgbWF0
dGVyLg0KPiANCj4gU28gd2hhdCBpcyB0aGUgYWN0dWFsIHByb2JsZW0/DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
