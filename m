Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C0117198
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:28:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLrY-0003Hx-Lg; Mon, 09 Dec 2019 16:26:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieLrX-0003Hq-MP
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 16:26:19 +0000
X-Inumbo-ID: a16666e0-1aa0-11ea-88e7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a16666e0-1aa0-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575908780; x=1607444780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FACCC9TphTRL0+cXsVrKulsVHqGEFX7ZWN1UiNvGdJ4=;
 b=kDyiSAth4ADec8XczuxKpXKMb6Pscj3U/EjgXlX2RtKo9nop6FxEbVTl
 F+3lXa30JEo4JjfGvorCIpE5rJDdRAAqF+T/3u83DN7IfnIE38uLaBF2d
 TZGvhjMIACttvaFWcQbZAjcyiflyewfDLc4FezmqiflcU/J/262qVCxEf Q=;
IronPort-SDR: yzqPwSyPBH0xLx/HAs8JGd+ttMLiiLLtO6zf8BPU2Mtjhu8V9WEV+W54648FzQtaeVusjRInio
 y40n5xzP9pZA==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="7764489"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 09 Dec 2019 16:26:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3C99CA20E8; Mon,  9 Dec 2019 16:26:17 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 16:26:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 16:26:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 16:26:15 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEsBCAAAg3gIAAAevggAAghQCAAAFgMIAACyOAgAAHopA=
Date: Mon, 9 Dec 2019 16:26:15 +0000
Message-ID: <b9271df6222a4fba86ec54c81b09eace@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
 <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
 <20191209142852.GW980@Air-de-Roger>
 <e026926b9aea4ffe868d41828c1f4721@EX13D32EUC003.ant.amazon.com>
 <20191209151339.GZ980@Air-de-Roger>
In-Reply-To: <20191209151339.GZ980@Air-de-Roger>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+Cj4gPiBXZWxsIHVuYmluZCBp
cyBwcmV0dHkgdXNlbGVzcyBub3cgSU1PIHNpbmNlIGJpbmQgZG9lc24ndCB3b3JrLCBhbmQgYQo+
IHRyYW5zaXRpb24gc3RyYWlnaHQgdG8gY2xvc2VkIGlzIGp1c3QgcGxhaW4gd3JvbmcgYW55d2F5
Lgo+IAo+IFdoeSBkbyB5b3UgY2xhaW0gdGhhdCBhIHN0cmFpZ2h0IHRyYW5zaXRpb24gaW50byB0
aGUgY2xvc2VkIHN0YXRlIGlzCj4gd3Jvbmc/CgpJdCdzIGJhZGx5IGRvY3VtZW50ZWQsIEkgYWdy
ZWUsIGJ1dCBoYXZlIGEgbG9vayBhdCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL25ldC94ZW4tbmV0
YmFjay94ZW5idXMuYyNuNDgwLiBDb25uZWN0ZWQgLT4gQ2xvc2VkIGlzIG5vdCBhIHZhbGlkIHRy
YW5zaXRpb24sIGFuZCBJIGRvbid0IHRoaW5rIGl0IHdhcyBldmVyIGludGVuZGVkIHRvIGJlLgoK
PiAKPiBJIGRvbid0IHNlZSBhbnkgc3VjaCBtZW50aW9uIGluIGJsa2lmLmgsIHdoaWNoIGFsc28g
ZG9lc24ndCBjb250YWluCj4gYW55IGd1aWRlbGluZXMgcmVnYXJkaW5nIGNsb3Npbmcgc3RhdGUg
dHJhbnNpdGlvbnMsIHNvIHVubGVzcwo+IG90aGVyd2lzZSBzdGF0ZWQgc29tZXdoZXJlIGVsc2Ug
dHJhbnNpdGlvbnMgaW50byBjbG9zZWQgY2FuIGhhcHBlbgo+IGZyb20gYW55IHN0YXRlIElNTy4K
PiAKClRoZXkgY2FuLCBidXQgaXQgaXMgZXZlbiBtb3JlIHBvb3JseSBkb2N1bWVudGVkIHdoYXQg
c2hvdWxkIGJlIGRvbmUgaW4gdGhpcyBjYXNlLgoKPiA+IEJ1dCwgd2UgY291bGQgaGF2ZSBhIGZs
YWcgdGhhdCB0aGUgYmFja2VuZCBkcml2ZXIgc2V0cyB0byBzYXkgdGhhdCBpdAo+IHN1cHBvcnRz
IHRyYW5zcGFyZW50IHJlLWJpbmQgdGhhdCBnYXRlcyB0aGlzIGNvZGUuIFdvdWxkIHRoYXQgbWFr
ZSB5b3UKPiBmZWVsIG1vcmUgY29tZm9ydGFibGU/Cj4gCj4gSGF2aW5nIGFuIG9wdGlvbiB0byBs
ZWF2ZSBzdGF0ZSB1bnRvdWNoZWQgd2hlbiB1bmJpbmRpbmcgd291bGQgYmUgZmluZQo+IGZvciBt
ZSwgb3RoZXJ3aXNlIHN0YXRlIHNob3VsZCBiZSBzZXQgdG8gY2xvc2VkIHdoZW4gdW5iaW5kaW5n
LiBJCj4gZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnl0aGluZyBlbHNlIHRoYXQgbmVlZHMgdG8gYmUg
ZG9uZSBpbiB0aGlzCj4gcmVnYXJkLCB0aGUgY2xlYW51cCBzaG91bGQgYmUgZXhhY3RseSB0aGUg
c2FtZSB0aGUgb25seSBkaWZmZXJlbmNlCj4gYmVpbmcgdGhlIHNldHRpbmcgb2YgYWxsIHRoZSBh
Y3RpdmUgYmFja2VuZHMgdG8gY2xvc2VkIHN0YXRlLgo+IAoKT2ssIEknbGwgYWRkIHN1Y2ggYSBm
bGFnIGFuZCBkZWZpbmUgaXQgZm9yIGJsa2JhY2sgb25seSwgaW4gcGF0Y2ggIzQgaS5lLiB3aGVu
IGl0IGFjdHVhbGx5IGdhaW5zIHRoZSBhYmlsaXR5IHRvIHJlYmluZC4KCj4gPiBJZiB5b3Ugd2Fu
dCB1bmJpbmQgdG8gYWN0dWFsbHkgZG8gYSBwcm9wZXIgdW5wbHVnIHRoZW4gdGhhdCdzIGV4dHJh
IHdvcmsKPiBhbmQgbm90IHJlYWxseSBzb21ldGhpbmcgSSB3YW50IHRvIHRhY2tsZSAoYW5kIHJl
LWJpbmQgd291bGQgc3RpbGwgbmVlZCB0bwo+IGJlIHRvb2xzdGFjayBpbml0aWF0ZWQgYXMgc29t
ZXRoaW5nIHdvdWxkIGhhdmUgdG8gcmUtY3JlYXRlIHRoZSB4ZW5zdG9yZQo+IGFyZWEpLgo+IAo+
IFdoeSBkbyB5b3Ugc2F5IHRoZSB4ZW5zdG9yZSBhcmVhIHdvdWxkIG5lZWQgdG8gYmUgcmVjcmVh
dGVkPwo+IAo+IFNldHRpbmcgc3RhdGUgdG8gY2xvc2VkIHNob3VsZG4ndCBjYXVzZSBhbnkgY2xl
YW51cCBvZiB0aGUgeGVuc3RvcmUKPiBhcmVhLCBhcyB0aGF0IHNob3VsZCBhbHJlYWR5IGhhcHBl
biBmb3IgZXhhbXBsZSB3aGVuIHVzaW5nIHB2Z3J1Ygo+IHNpbmNlIGluIHRoYXQgY2FzZSBncnVi
IGl0c2VsZiBkaXNjb25uZWN0cyBhbmQgYWxyZWFkeSBjYXVzZXMgYQo+IHRyYW5zaXRpb24gdG8g
Y2xvc2VkIGFuZCBhIHJlLWF0dGFjaG1lbnQgYWZ0ZXJ3YXJkcyBieSB0aGUgZ3Vlc3QKPiBrZXJu
ZWwuCj4gCgpGb3Igc29tZSByZWFzb24sIHdoZW4gSSBvcmlnaW5hbGx5IHRlc3RlZCwgdGhlIHhl
bnN0b3JlIGFyZWEgZGlzYXBwZWFyZWQuIEkgY2hlY2tlZCBhZ2FpbiBhbmQgaXQgZGlkIG5vdCB0
aGlzIHRpbWUuIEkganVzdCBlbmRlZCB1cCB3aXRoIGEgZnJvbnRlbmQgc3R1Y2sgaW4gc3RhdGUg
NSAoYmVjYXVzZSBpdCBpcyB0aGUgc3lzdGVtIGRpc2sgYW5kIHdvbid0IGdvIG9mZmxpbmUpIHRy
eWluZyB0byB0YWxrIHRvIGEgbm9uLWV4aXN0ZW50IGJhY2tlbmQuIFVwb24gcmUtYmluZCB0aGUg
YmFja2VuZCBnb2VzIGludG8gc3RhdGUgNSAoYmVjYXVzZSBpdCBzZWVzIHRoZSA1IGluIHRoZSBm
cm9udGVuZCkgYW5kIGxlYXZlcyB0aGUgZ3Vlc3Qgd2VkZ2VkLgoKICBQYXVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
