Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E314F7B1
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 12:59:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixrO6-0003sk-M4; Sat, 01 Feb 2020 11:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2u20=3V=amazon.co.uk=prvs=293cc1bad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixrO5-0003sf-4b
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 11:56:33 +0000
X-Inumbo-ID: e36666d0-44e9-11ea-b211-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e36666d0-44e9-11ea-b211-bc764e2007e4;
 Sat, 01 Feb 2020 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580558192; x=1612094192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cHjSIqVfdwhdUw6NbP00txTjaBCeTveXm90Z9eT+Rk=;
 b=EN7X6b2pAO9ogh0se9CfeyzjtslFaUpAc03ZTdJeaall19pj2IACGuKg
 Bzds1G9g/4mmybaqN7t3SNfelwKS/2wdOn2Q6i8r5U6c7kZfIn2g8u8LL
 J1sj/T6ZIdmTqJVK3bO3wq7BBdnDmxRsmIrWicCkFPSlI3H/otT3Q/XCl 8=;
IronPort-SDR: xghx/HsS1MTPlO+e5oWAgOhOUmTT6aOOkO4Ut6+dJgKqFiHQeDc7/B5m5dJMJtcU2ckOKdwkDX
 YlqqRQMjBUjg==
X-IronPort-AV: E=Sophos;i="5.70,389,1574121600"; d="scan'208";a="13998338"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 01 Feb 2020 11:56:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 647DDA1D43; Sat,  1 Feb 2020 11:56:21 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Sat, 1 Feb 2020 11:56:20 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 1 Feb 2020 11:56:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Sat, 1 Feb 2020 11:56:19 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
Thread-Index: AQHV0TKHr+B+pHB500iZ2KXg2puHsqgDgxKAgAAB8tCAAAxkAIABbVwAgAFJoGA=
Date: Sat, 1 Feb 2020 11:56:19 +0000
Message-ID: <3db7099ec7564d9ebda632c8c51d4dcb@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-8-pdurrant@amazon.com>
 <24115.4689.88393.840303@mariner.uk.xensource.com>
 <07859eefc91d43859bb12e59eb6298cf@EX13D32EUC003.ant.amazon.com>
 <38d14767-eca0-6343-799c-49167271c9e7@citrix.com>
 <20200131160748.anvywpswgmps36aq@debian>
In-Reply-To: <20200131160748.anvywpswgmps36aq@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.89]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE2OjA4Cj4gVG86IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpv
bi5jby51az47IElhbiBKYWNrc29uCj4gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+OyBBbnRob255
IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIIHY0IDcvN10geGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZCBvbgo+
IHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlCj4gCj4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDY6
MjA6MDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IE9uIDMwLzAxLzIwMjAgMTc6
NDIsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+ID4gPj4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4gPiA+
PiBTZW50OiAzMCBKYW51YXJ5IDIwMjAgMTc6MjkKPiA+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+Cj4gPiA+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50aG9ueQo+IFBlcmFyZAo+ID4gPj4gPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDcv
N10geGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZCBvbgo+ID4gPj4gc2F2ZS9yZXN0b3Jl
IG9yIG1pZ3JhdGUKPiA+ID4+Cj4gPiA+PiBQYXVsIER1cnJhbnQgd3JpdGVzICgiW1BBVENIIHY0
IDcvN10geGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZAo+IG9uCj4gPiA+PiBzYXZlL3Jl
c3RvcmUgb3IgbWlncmF0ZSIpOgo+ID4gPj4+IFRoaXMgcGF0Y2ggYWRkcyBhICctRCcgY29tbWFu
ZCBsaW5lIG9wdGlvbiB0byBzYXZlIGFuZCBtaWdyYXRlIHRvCj4gYWxsb3cKPiA+ID4+PiB0aGUg
ZG9tYWluIGlkIHRvIGJlIGluY29ycG9yYXRlZCBpbnRvIHRoZSBzYXZlZCBkb21haW4gY29uZmln
dXJhdGlvbgo+IGFuZAo+ID4gPj4+IGhlbmNlIGJlIHByZXNlcnZlZC4KPiA+ID4+IFRoYW5rcy4K
PiA+ID4+Cj4gPiA+PiBJbiByZXNwb25zZSB0byB2MyA2LzYgSSB3cm90ZToKPiA+ID4+Cj4gPiA+
PiAgIEkgd29uZGVyIGlmIHRoaXMgc2hvdWxkIGJlIGRvbmUgbW9yZSBpbiBsaWJ4bC4gIFNob3Vs
ZCB0aGlzIGJlIGEKPiA+ID4+ICAgZG9tYWluIHByb3BlcnR5ID8gIFdlaSwgQW50aG9ueSA/Cj4g
PiA+Pgo+ID4gPj4gVGhpcyBxdWVzdGlvbiByZW1haW5zIHVuYW5zd2VyZWQuICBJJ20gc29ycnkg
dGhhdCBuZWl0aGVyIFdlaSBub3IKPiA+ID4+IEFudGhvbnkgaGFkIGEgY2hhbmNlIHRvIGFuc3dl
ciB5ZXQuLi4KPiA+ID4+Cj4gPiA+PiBQYXVsLCBkbyB5b3UgaGF2ZSBhIHJlYXNvbiBmb3IgZG9p
bmcgaXQgdGhpcyB3YXkgPyAgTXkgaW5jbGluYXRpb24gaXMKPiA+ID4+IHRoYXQgdGhpbmsgZG9p
bmcgaXQgYXQgdGhlIGxpYnhsIGxheWVyIHdvdWxkIG1ha2UgbW9yZSBzZW5zZS4gIERvIHlvdQo+
ID4gPj4gdGhpbmsgdGhhdCB3b3VsZCBiZSBwb3NzaWJsZSA/Cj4gPiA+Pgo+ID4gPiBJJ20gbm90
IHN1cmUgaG93IGl0IHdvdWxkIHdvcmsgYXQgdGhlIGxpYnhsIGxldmVsIGFzIHRoZSBkb21pZCBp
cwo+ID4gPiBwYXJ0IG9mIGNyZWF0ZV9pbmZvIGFuZCB0aGF0IGl0IHRyYW5zZmVycmVkIGJ5IHhs
IG9uIG1pZ3JhdGlvbi4gSUlVQwo+ID4gPiB3ZSdkIG5lZWQgYSBuZXcgbGlieGwgc2F2ZSByZWNv
cmQgdG8gdHJhbnNmZXIgaXQgYXQgdGhhdCBsZXZlbCwgYW5kCj4gPiA+IHRoZW4gSSdtIG5vdCBz
dXJlIHdoZXRoZXIgd2UnZCBoaXQgYW4gb3JkZXJpbmcgcHJvYmxlbSBhcyB3ZSdkIGhhdmUKPiA+
ID4gdG8gZGlnIHRoYXQgc2F2ZSByZWNvcmQgb3V0IGJlZm9yZSB3ZSBjb3VsZCBhY3R1YWxseSBj
cmVhdGUgdGhlCj4gPiA+IGRvbWFpbi4KPiA+Cj4gPiBUaGVyZSBpcyBkZWZpbml0ZWx5IGFuIG9y
ZGVyaW5nIHByb2JsZW0uCj4gPgo+ID4gSSBhZ3JlZSB0aGF0IGl0IHNob3VsZCBsb2dpY2FsbHkg
YmUgcGFydCBvZiB0aGUgbGlieGwgbGV2ZWwgb2YgdGhlCj4gPiBzdHJlYW0sIGJ1dCBub25lIG9m
IHRoYXQgaXMgZXZlbiBwYXJzZWQgdW50aWwgYWZ0ZXIgdGhlIGRvbWFpbiBoYXMgYmVlbgo+ID4g
Y3JlYXRlZCBvbiB0aGUgZGVzdGluYXRpb24gc2lkZS4KPiA+Cj4gPiBJIGhhdmUgbm8gaWRlYSBo
b3cgZWFzeS9kaWZmaWN1bHQgaXQgd291bGQgYmUgdG8gcmVhcnJhbmdlIGxpYnhsIHRvCj4gPiBz
dGFydCBwYXJzaW5nIHRoZSBtaWdyYXRpb24gc3RyZWFtIGJlZm9yZSBjcmVhdGluZyB0aGUgZG9t
YWluLsKgIEkgdGhpbmsKPiA+IHRoZXJlIHdpbGwgYmUgYSBsb3Qgb2YgY29kZSByZWx5aW5nIG9u
IHRoZSBkb21pZCBhbHJlYWR5IGJlaW5nIHZhbGlkLgo+IAo+IFRoaXMuCj4gCj4gVGhlIG90aGVy
IHdheSBJIGNhbiB0aGluayBvZiBpcyB0byBzcGVjaWZ5IHNvbWV0aGluZyAoZG9taWQgcG9saWN5
Pz8pIGluCj4gY3JlYXRlX2luZm8gYW5kIGFwcGx5IGl0IGR1cmluZyBkb21haW4gY3JlYXRpb24u
IEJ1dCB0aGF0IHJlZWtzIGxpa2UgYQo+IGxheWVyaW5nIHZpb2xhdGlvbiB0byBtZS4KPiAKClRo
YXQncyBiYXNpY2FsbHkgd2hhdCB0aGlzIHNlcmllcyBkb2VzLCBidXQgSSBkb24ndCBzZWUgaXQg
YXMgYSBsYXllcmluZyB2aW9sYXRpb24uIEl0IGhhcyBhbHdheXMgYmVlbiB0aGUgY2FzZSB0aGF0
IHhsIGlzIGluIGNvbnRyb2wgb2YgdGhlIGRvbWFpbiBjcmVhdGlvbiBhbmQgdGhlbiBwYXNzZXMg
dGhlIG1pZ3JhdGlvbiBzdHJlYW0gaW50byBsaWJ4bC4gUGFzc2luZyBpbiBhICdkb21pZCBwb2xp
Y3knIChzcGVjaWZpYyB2YWx1ZSwgJ3JhbmRvbScsIG9yICdhbGxvY2F0ZWQgYnkgWGVuJykgYXMg
cGFydCBvZiBjcmVhdGVfaW5mbywgYW5kIG5vdCBtZXNzaW5nIHdpdGggdGhlIGxpYnhsIG1pZ3Jh
dGlvbiBkYXRhLCBzZWVtcyBsaWtlIHRoZSByaWdodCBhcHByb2FjaCB0byBtZS4uLiB3aGljaCBp
cyB3aHkgSSd2ZSBkb25lIGl0IHRoYXQgd2F5LgoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
