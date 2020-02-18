Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAF162581
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:28:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j410q-0000tO-52; Tue, 18 Feb 2020 11:26:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj48=4G=amazon.co.uk=prvs=310c99ada=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j410o-0000tI-28
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:25:58 +0000
X-Inumbo-ID: 6f15b104-5241-11ea-aa99-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f15b104-5241-11ea-aa99-bc764e2007e4;
 Tue, 18 Feb 2020 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582025158; x=1613561158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=od99jAhJwk2QEe3sRTNzRj2vzDSc5/8uOgxVDYin1UY=;
 b=MkSjsF3zg1/JPXVjwPE+nwH9oAuIKmJQGO8c6jU2Vel25eoz7CodU9y1
 kSLCtyoPen4uVxWCPtIWZxg0bpFTjOQuMSty5Qj8sNDzTD0iT0Cz2EUAl
 sT2oP1uGY8JnUOU3WDZ1xVQId/p3pVezyb0lsWoeKeA/r9nrdzDwce0Hr A=;
IronPort-SDR: sKHT51gDjhBA48QfydltoB/hx7afdnwbcuxqDvkSseqXCAYFI5G/szwiLNFViuXbs8WYHmReIF
 iF/83kAxyRjw==
X-IronPort-AV: E=Sophos;i="5.70,456,1574121600"; d="scan'208";a="17455960"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 18 Feb 2020 11:25:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 81F4DA35AE; Tue, 18 Feb 2020 11:25:42 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 18 Feb 2020 11:25:41 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Feb 2020 11:25:41 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 18 Feb 2020 11:25:40 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v5 5/7] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHV2EdkLYnXyHJB5UGgi2AWokWodagfxTaAgAEEvfCAAB9oAIAAAZGg
Date: Tue, 18 Feb 2020 11:25:40 +0000
Message-ID: <39fbefb0489942e498dfe20695021275@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-6-pdurrant@amazon.com>
 <24138.53923.699587.944099@mariner.uk.xensource.com>
 <78ccdd687a344eaf92ed8c978dc04f3c@EX13D32EUC003.ant.amazon.com>
 <24139.51124.66017.255351@mariner.uk.xensource.com>
In-Reply-To: <24139.51124.66017.255351@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 5/7] libxl: allow creation of domains
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE4IEZlYnJ1YXJ5IDIwMjAgMTE6MTcKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZAo+IDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47Cj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsKPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Owo+IEphc29uIEFu
ZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDUvN10g
bGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhCj4gc3BlY2lmaWVkIG9yIHJh
bmRvbSBkb21pZAo+IAo+IER1cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtQQVRDSCB2NSA1Lzdd
IGxpYnhsOiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5zCj4gd2l0aCBhIHNwZWNpZmllZCBvciBy
YW5kb20gZG9taWQiKToKPiA+IE5vLCB0aGUgZG9tYWluIHdpbGwgbm90IGJlIGxlYWtlZC4gVGhl
IGV4aXN0aW5nIGZhaWx1cmUgaGFuZGxpbmcgaW4KPiBsaWJ4bCB3aWxsIGNsZWFuIHVwIGlmICpk
b21pZCAhPSBJTlZBTElEX0RPTUlELgo+IAo+IFNvcnJ5IGlmIEkgd2FzIGNvbmZ1c2VkOyBJIHdp
bGwgcmVhZCB0aGlzIGFnYWluLgo+IAoKSXQgaXMgaGFyZCB0byBmb2xsb3cgdGhlIGVycm9yIHBh
dGhzLiBFYXJseSBvbiBpbiBkZXZlbG9wbWVudCBJIGVuZGVkIHVwIHdpdGggZG9tYWlucyBnZXR0
aW5nIGRlc3Ryb3llZCB3aGVuIEkgZGlkbid0IHdhbnQgdGhlbSB0byBiZSAod2hlbiB4Y19kb21h
aW5fY3JlYXRlKCkgZmFpbGVkIGR1ZSB0byBhIGR1cGxpY2F0ZSBkb21pZCkuCgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMv
eGVuLmgKPiA+ID4gPiBpbmRleCBkMjE5OGRmZmFkLi43NWIxNjE5ZDBkIDEwMDY0NAo+ID4gPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy94ZW4uaAo+ID4gPiA+IEBAIC02MTQsNiArNjE0LDkgQEAgREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUobW11ZXh0X29wX3QpOwo+ID4gPiA+ICAvKiBJZGxlIGRvbWFpbi4gKi8KPiA+ID4g
PiAgI2RlZmluZSBET01JRF9JRExFICAgICAgICAgICB4ZW5fbWtfdWludCgweDdGRkYpCj4gPiA+
ID4KPiA+ID4gPiArLyogTWFzayBmb3IgdmFsaWQgZG9tYWluIGlkIHZhbHVlcyAqLwo+ID4gPiA+
ICsjZGVmaW5lIERPTUlEX01BU0sgICAgICAgICAgIHhlbl9ta191aW50KDB4N0ZGRikKPiA+ID4K
PiA+ID4gVGhpcyBuZWVkcyBhIGh5cGVydmlzb3IgbWFpbnRhaW5lciBhY2suCj4gPiA+Cj4gPiA+
IFBsZWFzZSBzcGxpdCBpdCBpbnRvIGl0cyBvd24gcGF0Y2gsIHdpdGggYSByYXRpb25hbGUsIGV0
Yy4KPiA+Cj4gPiBPaywgYnV0IGl0IGhhcyBubyByYXRpb25hbGUgd2l0aG91dCB0aGUgcmVzdCBv
ZiB0aGlzIHBhdGNoOyBJIGNhbiBvbmx5Cj4gYXNzZXJ0IHRoYXQgaXQgJ3dpbGwgYmUgbmVlZGVk
IGJ5IGEgc3Vic2VxdWVudCBwYXRjaCcuCj4gCj4gV2hhdCBkbyB0aGUgWGVuIG1haW50YWluZXJz
LCBhbmQgbXkgdG9vbHMgY28tbWFpbnRhaW5lcnMgdGhpbmsgPwo+IAo+IEkgd2FzIGhvcGluZyBm
b3IgYSByYXRpb25hbGUgYWxvbmcgdGhlIGxpbmVzIG9mOgo+IAo+ICAgVGhpcyBpcyB1c2VmdWwg
Zm9yIHByb2dyYW1zIHdoaWNoIG5lZWQgdG8gW2V4cGxhbmF0aW9uXSwKPiAgIGluY2x1ZGluZyBm
b3IgZXhhbXBsZSwgbGlieGwsIHdoaWNoIGlzIGdvaW5nIHRvIHdhbnQgdG8KPiAgIHJhbmRvbWx5
IGdlbmVyYXRlIGRvbWlkcy4KPiAKPiBNYXliZSBpdCBuZWVkcyBzb21lIGV4cGxhbmF0aW9uIG9m
IHdoeSB0aGlzIGJlbG9uZ3MgaW4gdGhlIFhlbiBwdWJsaWMKPiBoZWFkZXJzIHJhdGhlciB0aGFu
IGluIHNvbWUgaGVhZGVyIGF2YWlsYWJsZSB0byBsaWJ4YywgbGlieGwgYW5kIG90aGVyCj4gdG9v
bHMgc3R1ZmYgPwoKT2ssIEknbGwgdHJ5IHdvcmRzIGFsb25nIHRob3NlIGxpbmVzLgoKICBQYXVs
Cgo+IAo+IElhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
