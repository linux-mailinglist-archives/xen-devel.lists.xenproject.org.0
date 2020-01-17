Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1A14097E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 13:09:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isQPH-0004eY-IH; Fri, 17 Jan 2020 12:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZlyK=3G=amazon.co.uk=prvs=278c75273=pdurrant@srs-us1.protection.inumbo.net>)
 id 1isQPF-0004eN-JY
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 12:07:17 +0000
X-Inumbo-ID: e562cd44-3921-11ea-b4ee-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e562cd44-3921-11ea-b4ee-12813bfff9fa;
 Fri, 17 Jan 2020 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579262833; x=1610798833;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=clwtQ3h5b3+bjbHZZ9reCTn1PjeZX6iTmH27d1no9sE=;
 b=k9g+WVzfIRl/lb7j0EDhT7jqybipDeV+oOs4smNJMpIR1G359JqDksn4
 46WGR6TmreFvEgyYEVsJphNcLgJJNMrqKKMkbaGXwFN02xid24xvGag2v
 po3BS3473/ftsZUfIZWs45siLV1eQQpP5Ib8QNUMU4RiYw1lnPKY0Z4Mv 8=;
IronPort-SDR: gANHdF07U/9O/KPTWUC+lg2k58kwXKT5bfjO2OE0ttjKvX8lUv06OMbcLBzJXuOwRzURO+AjxB
 2eq7z5KRYBbw==
X-IronPort-AV: E=Sophos;i="5.70,330,1574121600"; d="scan'208";a="20674212"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Jan 2020 12:07:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 06877A2089; Fri, 17 Jan 2020 12:06:57 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 12:06:57 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 12:06:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 17 Jan 2020 12:06:56 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v3 4/6] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHVzFBoLAnvKVVhW06F0xOPMrYEQKftnwCAgAD5nnCAACM9gIAACGbQ
Date: Fri, 17 Jan 2020 12:06:55 +0000
Message-ID: <d5ca972f0e7a429d847a522e9f21c54b@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <24096.44311.441643.264877@mariner.uk.xensource.com>
 <402866798e2a40e192fd8052548374c5@EX13D32EUC003.ant.amazon.com>
 <24097.39947.159860.741920@mariner.uk.xensource.com>
In-Reply-To: <24097.39947.159860.741920@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.74]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE3IEphbnVhcnkgMjAyMCAxMjozNgo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUGVyYXJkCj4gPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsKPiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Owo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gamFuZHJ5dWtA
Z21haWwuY29tCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MyA0LzZdIGxpYnhsOiBhbGxvdyBjcmVh
dGlvbiBvZiBkb21haW5zIHdpdGggYQo+IHNwZWNpZmllZCBvciByYW5kb20gZG9taWQKPiAKPiBE
dXJyYW50LCBQYXVsIHdyaXRlcyAoIlJFOiBbUEFUQ0ggdjMgNC82XSBsaWJ4bDogYWxsb3cgY3Jl
YXRpb24gb2YgZG9tYWlucwo+IHdpdGggYSBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkIik6Cj4g
PiBbSWFuOl0KPiA+ID4gSSB0aGluayB0aGVyZSBhcmUgb25seSB0d28gcG9zc2libGUgc29sdXRp
b25zOgo+ID4gPgo+ID4gPiAgIC0gQ2hlY2sgdGhlIGRvbWFpbidzIGVudHJ5IGluIHRoZSByZWNl
bnQgbGlzdCAqYWZ0ZXIqIGNyZWF0aW5nCj4gPiA+ICAgICB0aGUgZG9tYWluIGluIFhlbi4gIFRo
aXMgaW52b2x2ZXMgYWNjZXB0aW5nIHRoYXQgd2Ugd2lsbAo+ID4gPiAgICAgcmV1c2UgdGhlIGRv
bWlkIGJ1dCBvbmx5IGZvciBhIGRvbWFpbiB3ZSBhcmUgaW4gdGhlIGVhcmx5Cj4gPiA+ICAgICBz
dGFnZXMgb2YgY29uc3RydWN0aW5nLCBzbyBob3BlZnVsbHkgd2l0aG91dCBiYWQgY29uc2VxdWVu
Y2U/Cj4gPiA+Cj4gPiA+ICAgLSBUYWtlIHRoZSByZWNlbnQgZG9taWQgbG9jay4KPiA+ID4KPiA+
Cj4gPiBPciB0YWtlIGEgZ2xvYmFsIGZpbGUgbG9jayBpbiBsaWJ4bCBhcm91bmQgZG9tYWluIGNy
ZWF0aW9uIGFuZAo+IGRlc3RydWN0aW9uPwo+IAo+IFdlIHdhbnQgZG9tYWluIGNvbnN0cnVjdGlv
biB0byBiZSBjb25jdXJyZW50LCB3aGVuIGl0IGNhbiBiZS4gIFNvIEkKPiB0aGluayBhIGxvY2sg
YXJvdW5kIGp1c3QgeGNfZG9tYWluX2NyZWF0ZSBpcyBPSyBidXQgYSBsb2NrIGFyb3VuZCB0aGUK
PiB3aG9sZSBvcGVyYXRpb24gaXMgbm90Lgo+IAo+ID4gPiBBbHNvLCBpdCBzZWVtcyB0byBtZSB0
aGF0IHdlIHNob3VsZCBjaGVjayB0aGUgcmVjZW50IGRvbWlkIGxpc3QgaWYgd2UKPiA+ID4gbGV0
IFhlbiBjaG9vc2UgdGhlIGRvbWlkLiAgTWF5YmUgdGhhdCBjYW4gYmUgaW4gYSBzdWJzZXF1ZW50
IHBhdGNoLi4uCj4gPgo+ID4gV2VsbCwgd2UgY291bGQgc29sdmUgYWxsIHRoaXMsIHJlbW92ZSB0
aGUgbmVlZCBmb3IgYSBmaWxlIGFuZCBhbGwgdGhlCj4gYXNzb2NpYXRlZCBjb21wbGV4aXR5IGJ5
IHNpbXBseSBrZWVwaW5nIGhpc3RvcnkgaW5zaWRlIHRoZSBoeXBlcnZpc29yLiBJCj4gZG9uJ3Qg
a25vdyBob3cgdGhlIFhlbiBtYWludGFpbmVycyB3aWxsIGZlZWwgYWJvdXQgdGhhdCB0aG91Z2gs
IGFzIFhlbgo+IGl0c2VsZiBzaG91bGRuJ3QgaGF2ZSBhIHByb2JsZW0gd2l0aCBlYWdlciBkb21p
ZCByZS11c2UuCj4gCj4gSSB0aGluayB0aGlzIGRvZXNuJ3QgbmVlZCB0byBiZSBkb25lIGluIHRo
ZSBoeXBlcnZpc29yIHNvIEkgYW0KPiBpbmNsaW5lZCB0byBzYXkgaXQgc2hvdWxkbid0IGJlLiAg
QWxzbywgdGhlcmUgaXMgYSBsb3Qgb2YgcG9saWN5IGhlcmUuLi4KPiAKCk9rLCB0byBjb3ZlciBh
bGwgYmFzZXMgdGhlbiBpdCBzZWVtcyBsaWtlIGNoZWNraW5nIHRoZSBkb21pZCBhZnRlciBjcmVh
dGlvbiBhbmQgdGhlbiBkZXN0cm95aW5nIGlmIGl0IGlzIHRvbyByZWNlbnQgaXMgdGhlIGJldHRl
ciBvcHRpb24uCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
