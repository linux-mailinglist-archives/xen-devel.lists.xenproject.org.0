Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46201172B6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 18:27:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieMlC-0000Om-UJ; Mon, 09 Dec 2019 17:23:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieMlB-0000Of-1k
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 17:23:49 +0000
X-Inumbo-ID: a9390fb4-1aa8-11ea-a914-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9390fb4-1aa8-11ea-a914-bc764e2007e4;
 Mon, 09 Dec 2019 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575912229; x=1607448229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/o/DIuVt0siT0/xDHQSqGb+p+hsUxtlaap2ta8gFs3c=;
 b=ZtJwfcJ6q9uQaK7W3CuLy9rooxW6Lj2cG5JwBehMS74EoCelKy14v8cV
 WCrrclUrTOjHX+WCeydmnEcdZaSlxMyWaXL8RybjQpgeunI3BTnJZV8M+
 gBy6WzOGI8zJhJhTpKkB4/8LVcc7qX5t0LfAosTg5ndmQrUJ5ivpwb1PP g=;
IronPort-SDR: hUDG+2m+V51DMKrCpX/G/TdEZw/vlZOyeUKcewJhYdAI+7Eurg8b2SUBXrdD1VZAEKboO9MI7O
 f64BC+pBLA6w==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="7775052"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 09 Dec 2019 17:23:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 67D19A1DB8; Mon,  9 Dec 2019 17:23:41 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 17:23:40 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 17:23:40 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 17:23:39 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEsBCAAAg3gIAAAevggAAghQCAAAFgMIAACyOAgAAHopCAABsYgIAAAH5A
Date: Mon, 9 Dec 2019 17:23:39 +0000
Message-ID: <5851d5c9424d4df088af96b24dca1906@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
 <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
 <20191209142852.GW980@Air-de-Roger>
 <e026926b9aea4ffe868d41828c1f4721@EX13D32EUC003.ant.amazon.com>
 <20191209151339.GZ980@Air-de-Roger>
 <b9271df6222a4fba86ec54c81b09eace@EX13D32EUC003.ant.amazon.com>
 <20191209171757.GC980@Air-de-Roger>
In-Reply-To: <20191209171757.GC980@Air-de-Roger>
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
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTc6MTgKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuCj4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47Cj4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3
aGVuIHN0YXRlIGlzIGZvcmNlZCB0bwo+IGNsb3NlZAo+IAo+IE9uIE1vbiwgRGVjIDA5LCAyMDE5
IGF0IDA0OjI2OjE1UE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+ID4gSWYgeW91
IHdhbnQgdW5iaW5kIHRvIGFjdHVhbGx5IGRvIGEgcHJvcGVyIHVucGx1ZyB0aGVuIHRoYXQncyBl
eHRyYQo+IHdvcmsKPiA+ID4gYW5kIG5vdCByZWFsbHkgc29tZXRoaW5nIEkgd2FudCB0byB0YWNr
bGUgKGFuZCByZS1iaW5kIHdvdWxkIHN0aWxsCj4gbmVlZCB0bwo+ID4gPiBiZSB0b29sc3RhY2sg
aW5pdGlhdGVkIGFzIHNvbWV0aGluZyB3b3VsZCBoYXZlIHRvIHJlLWNyZWF0ZSB0aGUKPiB4ZW5z
dG9yZQo+ID4gPiBhcmVhKS4KPiA+ID4KPiA+ID4gV2h5IGRvIHlvdSBzYXkgdGhlIHhlbnN0b3Jl
IGFyZWEgd291bGQgbmVlZCB0byBiZSByZWNyZWF0ZWQ/Cj4gPiA+Cj4gPiA+IFNldHRpbmcgc3Rh
dGUgdG8gY2xvc2VkIHNob3VsZG4ndCBjYXVzZSBhbnkgY2xlYW51cCBvZiB0aGUgeGVuc3RvcmUK
PiA+ID4gYXJlYSwgYXMgdGhhdCBzaG91bGQgYWxyZWFkeSBoYXBwZW4gZm9yIGV4YW1wbGUgd2hl
biB1c2luZyBwdmdydWIKPiA+ID4gc2luY2UgaW4gdGhhdCBjYXNlIGdydWIgaXRzZWxmIGRpc2Nv
bm5lY3RzIGFuZCBhbHJlYWR5IGNhdXNlcyBhCj4gPiA+IHRyYW5zaXRpb24gdG8gY2xvc2VkIGFu
ZCBhIHJlLWF0dGFjaG1lbnQgYWZ0ZXJ3YXJkcyBieSB0aGUgZ3Vlc3QKPiA+ID4ga2VybmVsLgo+
ID4gPgo+ID4KPiA+IEZvciBzb21lIHJlYXNvbiwgd2hlbiBJIG9yaWdpbmFsbHkgdGVzdGVkLCB0
aGUgeGVuc3RvcmUgYXJlYQo+IGRpc2FwcGVhcmVkLiBJIGNoZWNrZWQgYWdhaW4gYW5kIGl0IGRp
ZCBub3QgdGhpcyB0aW1lLiBJIGp1c3QgZW5kZWQgdXAKPiB3aXRoIGEgZnJvbnRlbmQgc3R1Y2sg
aW4gc3RhdGUgNSAoYmVjYXVzZSBpdCBpcyB0aGUgc3lzdGVtIGRpc2sgYW5kIHdvbid0Cj4gZ28g
b2ZmbGluZSkgdHJ5aW5nIHRvIHRhbGsgdG8gYSBub24tZXhpc3RlbnQgYmFja2VuZC4gVXBvbiBy
ZS1iaW5kIHRoZQo+IGJhY2tlbmQgZ29lcyBpbnRvIHN0YXRlIDUgKGJlY2F1c2UgaXQgc2VlcyB0
aGUgNSBpbiB0aGUgZnJvbnRlbmQpIGFuZAo+IGxlYXZlcyB0aGUgZ3Vlc3Qgd2VkZ2VkLgo+IAo+
IExpa2VseSBibGtmcm9udCBzaG91bGQgZ28gYmFjayB0byBpbml0IHN0YXRlLCBidXQgYW55d2F5
LCB0aGF0J3Mgbm90Cj4gc29tZXRoaW5nIHRoYXQgbmVlZHMgZml4aW5nIGFzIHBhcnQgb2YgdGhp
cyBzZXJpZXMuCj4gCgpPaywgY29vbC4KCkkgYW0gd29uZGVyaW5nIHRob3VnaCB3aGV0aGVyIHdl
IG91Z2h0IHRvIHN1cHByZXNzIGJpbmQvdW5iaW5kIGZvciBkcml2ZXJzIHRoYXQgZG9uJ3Qgd2hp
dGVsaXN0IHRoZW1zZWx2ZXMgKHRocm91Z2ggdGhlIG5ldyB4ZW5idXNfZHJpdmVyIGZsYWcgdGhh
dCBJJ2xsIGFkZCkuIEl0J3Mgc29tZXdoYXQgbWlzbGVhZGluZyB0aGF0IHRoZSBub2RlcyBhcmUg
dGhlcmUgYnV0IGRvbid0IG5lY2Vzc2FyaWx5IHdvcmsuCgogIFBhdWwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
