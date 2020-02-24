Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F716ABB4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:35:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6GfK-0004k9-7g; Mon, 24 Feb 2020 16:33:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zoxf=4M=amazon.co.uk=prvs=316f3025c=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6GfI-0004k1-Jm
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:33:04 +0000
X-Inumbo-ID: 54608b22-5723-11ea-a490-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54608b22-5723-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582561984; x=1614097984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WMsZpzA79JCOXz02/9sJoVK1NeUpmrrCsWSvCKWdF7s=;
 b=UYXHVbE7X7eEiKiSrmnqkuCVdg9vJFMVYCvz2dLrOiun6rSO4Gh8mJnB
 Anj1kz9lbSwugsHSaYGh23qWgp852UP5m1NyvEdFhRvL6lvby8u3v7uw9
 3Edt03DO+srh/edtsq1aqbHmPcNFMD7PMnsZCB/Uvc1BpJeYmnQP/5KG3 0=;
IronPort-SDR: kKKuy4SUrOjO8j7P2wjjLGM55DCJiOgajtA/faj9QAIfbkGdRKp/QYi3bXA0CC+XNRI63mvWxQ
 ddkZWo6ADUIA==
X-IronPort-AV: E=Sophos;i="5.70,480,1574121600"; d="scan'208";a="17944628"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 24 Feb 2020 16:32:51 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id D7BF9A1EE8; Mon, 24 Feb 2020 16:32:49 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 24 Feb 2020 16:32:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 24 Feb 2020 16:32:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 24 Feb 2020 16:32:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v7 0/6] xl/libxl: domid allocation/preservation changes
Thread-Index: AQHV6Kj8cIQs0OK9UUyKbbfvg2lzPagqg/iAgAAKiXA=
Date: Mon, 24 Feb 2020 16:32:48 +0000
Message-ID: <dd6cfb5f1770450abf7362ff1872f2b8@EX13D32EUC003.ant.amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <24147.61855.619335.745427@mariner.uk.xensource.com>
In-Reply-To: <24147.61855.619335.745427@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.246]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v7 0/6] xl/libxl: domid
 allocation/preservation changes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI0IEZlYnJ1YXJ5IDIwMjAgMTU6NTQKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsKPiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Owo+IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT47IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBLb25yYWQKPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDAvNl0g
eGwvbGlieGw6IGRvbWlkIGFsbG9jYXRpb24vcHJlc2VydmF0aW9uCj4gY2hhbmdlcwo+IAo+IFBh
dWwgRHVycmFudCB3cml0ZXMgKCJbUEFUQ0ggdjcgMC82XSB4bC9saWJ4bDogZG9taWQKPiBhbGxv
Y2F0aW9uL3ByZXNlcnZhdGlvbiBjaGFuZ2VzIik6Cj4gPiBQYXVsIER1cnJhbnQgKDYpOgo+ID4g
ICBsaWJ4bDogYWRkIGluZnJhc3RydWN0dXJlIHRvIHRyYWNrIGFuZCBxdWVyeSAncmVjZW50JyBk
b21pZHMKPiA+ICAgbGlieGw6IG1vZGlmeSBsaWJ4bF9fbG9ndigpIHRvIG9ubHkgbG9nIHZhbGlk
IGRvbWlkIHZhbHVlcwo+ID4gICBwdWJsaWMveGVuLmg6IGFkZCBhIGRlZmluaXRpb24gZm9yIGEg
J3ZhbGlkIGRvbWlkJyBtYXNrCj4gPiAgIGxpYnhsOiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5z
IHdpdGggYSBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkCj4gPiAgIHhsLmNvbmY6IGludHJvZHVj
ZSAnZG9taWRfcG9saWN5Jwo+ID4gICB4bDogYWxsb3cgZG9taWQgdG8gYmUgcHJlc2VydmVkIG9u
IHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlCj4gCj4gVGhhbmtzIGZvciB0aGlzLiAgSSB0aGluayB0
aGlzIGhhcyBlbm91Z2ggYWNrcyB0byBnbyBpbiBub3cuICBXb3VsZAo+IHlvdSBjYXJlIHRvIGZv
bGQgdGhlIGFja3MvcmV2aWV3cyBhbmQgcGFzcyBtZSBhIGdpdCBicmFuY2ggPyAgSWYgaXQncwo+
IGVhc3kgZm9yIHlvdSwgdGhhdCB3b3VsZCBiZSBtb3JlIGNvbnZlbmllbnQgYW5kIHJlbGlhYmxl
IHRoYW4gcmVseWluZwo+IG9uIGdpdC1hbS4gIEZlZWwgZnJlZSB0byBuZWdvdGlhdGUgYWJvdXQg
ZGV0YWlscyBvbiBpcmMuLi4KPiAKClN1cmUsIEknbGwgcG9pbnQgeW91IGF0IGEgYnJhbmNoLCBo
b3BlZnVsbHkgd2l0aGluIHRoZSBuZXh0IGhvdXIgb3Igc28uCgogIFRoYW5rcywKCiAgICBQYXVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
