Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2E10D82B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 17:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaien-0004Fw-LD; Fri, 29 Nov 2019 15:58:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iaiem-0004Fr-0O
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:58:08 +0000
X-Inumbo-ID: 08540e08-12c1-11ea-a3e7-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08540e08-12c1-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575043088; x=1606579088;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NUhMTLk9lPLIVvUGez5m3JBHNilZeSLmB2ob65XvWAk=;
 b=D66CUduoRtZcn21bNKBgnWwSgxmcLX70+Z6wSBS/T1l7cgOgc85Aje0p
 8hlmX4jD7ZniDzSMhtfhU+rjb36wsqV8/JENLYPbkUBQwIDLYzNj70SdQ
 nN23SeVuw0HmZRZa3Z7k94cLECj0b4UbvvL0CXLVUzyeeSz0xhHJ46DVt w=;
IronPort-SDR: XXwsNUHHilm/bbJT5C0s8rMZ1pcQjRQ0GBzX1lwB1+Dw5CrdfeXdc8XMIZ+Rc+2KRWlHOHG2WE
 ZJWaHw1s9Bbg==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; d="scan'208";a="11978595"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 29 Nov 2019 15:57:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id D175BA261F; Fri, 29 Nov 2019 15:57:49 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 15:57:48 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 15:57:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 15:57:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgw4W1UbyWJxu02lwfLbqnwkDKeiGWCAgAAzAoCAAAKKsA==
Date: Fri, 29 Nov 2019 15:57:48 +0000
Message-ID: <428ff7e73f654f5c89cd0837f69002dd@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124427.l7wyupz5mcn7nx57@debian>
 <24033.15733.686597.694978@mariner.uk.xensource.com>
In-Reply-To: <24033.15733.686597.694978@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTU6NDcKPiBUbzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNv
bT47IEFudGhvbnkgUGVyYXJkCj4gPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBj
aXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEph
bgo+IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IEtvbnJhZAo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kKPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT47IFZv
bG9keW15ciBCYWJjaHVrCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENILWZvci00
LjEzIHY1XSBSYXRpb25hbGl6ZSBtYXhfZ3JhbnRfZnJhbWVzIGFuZAo+IG1heF9tYXB0cmFja19m
cmFtZXMgaGFuZGxpbmcKPiAKPiBXZWkgTGl1IHdyaXRlcyAoIlJlOiBbUEFUQ0gtZm9yLTQuMTMg
djVdIFJhdGlvbmFsaXplIG1heF9ncmFudF9mcmFtZXMgYW5kCj4gbWF4X21hcHRyYWNrX2ZyYW1l
cyBoYW5kbGluZyIpOgo+ID4gV2hhdCBpZiB3ZSB1c2UgMHhmZmZmZmZmZiB0byBkZW5vdGUgZGVm
YXVsdCBpbnN0ZWFkPyBUaGF0IHdvdWxkbid0Cj4gPiByZXF1aXJlIGNoYW5naW5nIHRoZSB0eXBl
IGhlcmUuCj4gCj4gSXMgdGhlcmUgc29tZSByZWFzb24gd2Ugd291bGRuJ3QgdXNlIH4wIHRvIG1l
YW4gZGVmYXVsdCA/Cj4gCj4gSW4gdGhlIHRvb2xzIGFyZWEgd2Ugbm9ybWFsbHkgc3BlbGwgdGhp
cyBhcwo+ICAgICAgfihzb21lIGFwcHJvcHJpYXRlIHR5cGUpMAo+IHRvIG1ha2Ugc3VyZSBpdCBo
YXMgdGhlIHJpZ2h0IHdpZHRoLiAgQnV0IGlmIHdlIGtub3cgdGhlIHR5cGUgYW5kIGl0Cj4gaXMg
b2YgZml4ZWQgbGVuZ3RoLCBhcyBoZXJlLCAweGZmZmZmZmZmdSBpcyBPSyB0b28uCj4gCj4gPiBU
aGUgdHlwZSBjaGFuZ2UgaGVyZSBtYWtlcyBtZSBmZWVsIGEgYml0IHVuY29tZm9ydGFibGUsIHRo
b3VnaCBpbgo+ID4gcHJhY3RpY2UgaXQgbWF5IG5vdCBtYXR0ZXIuIEkgZG9uJ3Qgc2VlIGFueW9u
ZSB3b3VsZCBzcGVjaWZ5IGEgdmFsdWUKPiA+IHRoYXQgd291bGQgYmVjb21lIG5lZ2F0aXZlIHdo
ZW4gY2FzdCBmcm9tIHVpbnQzMiB0byBpbnRlZ2VyLgo+IAo+IFRoZSBwcm9ibGVtIHdpdGggdGhl
IHR5cGUgY2hhbmdlIGlzIHRoYXQgaW4gcHJpbmNpcGxlIHdlIGhhdmUgdG8gYXVkaXQKPiBhbGwg
dGhlIHBsYWNlcyB0aGUgdmFyaWFibGVzIGFyZSB1c2VkLgo+IAoKQ2FuIGEgdG9vbHN0YWNrIG1h
aW50YWluZXIgcGxlYXNlIGNvbWUgdXAgd2l0aCBhIGNvbmNyZXRlIHN1Z2dlc3Rpb24gYXMgdG8g
d2hhdCB0aGUgcGF0Y2ggc2hvdWxkIGRvIHRoZW4/IEl0J3Mgbm93IGF0IHY2IGFuZCB0aW1lIGlz
IHNob3J0LgoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
