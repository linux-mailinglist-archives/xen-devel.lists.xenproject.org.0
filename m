Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF5EE024
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 13:39:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRbag-0008Kf-GD; Mon, 04 Nov 2019 12:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jKzH=Y4=amazon.com=prvs=2041709ad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iRbaf-0008Ka-7X
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 12:36:13 +0000
X-Inumbo-ID: ae2f5fec-feff-11e9-9631-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae2f5fec-feff-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1572870971; x=1604406971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WEgPE1TjhdpVDZDbS6Mvr9lQC2aOyt2aXXPuXEy6eMY=;
 b=Ej8rTmnppiXHyiQDL+taClw2lIHjaPwqywujpdKQNaRbTu81tfK0VWl3
 QE28OogdKSbAlwmJd+WXrBttGl6Xt+B497LCgyn4GYTzSRyrVnRwZVctt
 OqKTB9Be/554ranB9cWIhF/hLjHFh508lgc7cNGv3V9cke5yfGmnk3ElB s=;
IronPort-SDR: Rsraox3fj4iKEPbezYqp351OZ6+wVluG6ro0xS/SpymiyL/Ku/iJ7eL7bFJqtV4UoHwxKLJqT0
 udptoJeQKS4Q==
X-IronPort-AV: E=Sophos;i="5.68,267,1569283200"; 
   d="scan'208";a="3843244"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 04 Nov 2019 12:36:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6767DC5A5A; Mon,  4 Nov 2019 12:36:08 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 4 Nov 2019 12:36:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 4 Nov 2019 12:36:07 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 4 Nov 2019 12:36:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13 v2] passthrough: simplify locking
 and logging
Thread-Index: AQHVkOIsGbqhkhQ+JkOVwwPA8eZvZ6d6smTAgAArkoCAAAG8IIAAEVKAgAAFxRA=
Date: Mon, 4 Nov 2019 12:36:06 +0000
Message-ID: <413ade485cc44a31ade04ea9e9327d83@EX13D32EUC003.ant.amazon.com>
References: <1572632881-9050-1-git-send-email-igor.druzhinin@citrix.com>
 <901b33296f1a4ee489da04d79932127b@EX13D32EUC003.ant.amazon.com>
 <105f4eda-14e0-33b9-e364-1f8a71dce9d9@citrix.com>
 <91a26b3802f44d0cbd9dfef227557780@EX13D32EUC003.ant.amazon.com>
 <20191104121423.GG2381@perard.uk.xensource.com>
In-Reply-To: <20191104121423.GG2381@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.139]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] passthrough: simplify locking
 and logging
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDA0IE5vdmVtYmVyIDIwMTkgMTI6MTQKPiBU
bzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgamdyb3NzQHN1c2UuY29tOyBJZ29yIERydXpoaW5pbgo+IDxpZ29yLmRydXpoaW5p
bkBjaXRyaXguY29tPjsgamJldWxpY2hAc3VzZS5jb20KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIGZvci00LjEzIHYyXSBwYXNzdGhyb3VnaDogc2ltcGxpZnkgbG9ja2luZwo+IGFu
ZCBsb2dnaW5nCj4gCj4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MTM6NDhBTSArMDAwMCwg
RHVycmFudCwgUGF1bCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
ID4gRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+ID4g
U2VudDogMDQgTm92ZW1iZXIgMjAxOSAxMTowNgo+ID4gPiBUbzogRHVycmFudCwgUGF1bCA8cGR1
cnJhbnRAYW1hem9uLmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4g
PiBDYzogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+OyBqZ3Jvc3NA
c3VzZS5jb207Cj4gPiA+IGpiZXVsaWNoQHN1c2UuY29tCj4gPiA+IFN1YmplY3Q6IFJlOiBbWGVu
LWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMgdjJdIHBhc3N0aHJvdWdoOiBzaW1wbGlmeQo+IGxvY2tp
bmcKPiA+ID4gYW5kIGxvZ2dpbmcKPiA+ID4KPiA+ID4gT24gMDQvMTEvMjAxOSAwODozMSwgRHVy
cmFudCwgUGF1bCB3cm90ZToKPiA+ID4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
ID4gPj4gRnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4g
PiA+ID4+IFNlbnQ6IDAxIE5vdmVtYmVyIDIwMTkgMTk6MjgKPiA+ID4gPj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gPiA+PiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvbT47IGpiZXVsaWNoQHN1c2UuY29tOwo+ID4gPiA+PiBqZ3Jvc3NAc3VzZS5j
b20KPiA+ID4gPj4gU3ViamVjdDogW1BBVENIIGZvci00LjEzIHYyXSBwYXNzdGhyb3VnaDogc2lt
cGxpZnkgbG9ja2luZyBhbmQKPiBsb2dnaW5nCj4gPiA+ID4+Cj4gPiA+ID4+IEZyb206IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gPiA+
PiAtLS0KPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4gdjI6IHVwZGF0ZWQgUGF1bCdzIGVtYWls
IGFkZHJlc3MKPiA+ID4KPiA+ID4gVGhpcyB3YXMgd29yayB5b3UgZGlkIGF0IENpdHJpeCwgeWVz
Pwo+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+Cj4gPiA+Cj4gPiA+IFNvQiBhbmQgUi1ieT8KPiA+Cj4gPiBJIGRpZCBkbyB0aGUgd29y
ayB3aGlsZSBJIHdhcyBhdCBDaXRyaXgsIGJ1dCBzdXJlbHkgdGhlIFNvQiBtdXN0IGJlCj4gdXBk
YXRlZCBzaW5jZSB0aGUgcGF0Y2ggaXMgb25seSBub3cgYmVpbmcgcG9zdGVkPwo+IAo+IEkgZG9u
J3QgdGhpbmsgaXQgbWF0dGVycyB3aGVuIGEgcGF0Y2ggaXMgcHVibGljbHkgcG9zdGVkLCB0aGUg
U29CCj4gc2hvdWxkbid0IGNoYW5nZS4KPiBBbHNvLCBJZ29yLCBJIHRoaW5rIHlvdSBuZWVkIHRv
IGFkZCB5b3VyIG93biBTb0IgdG8gdGhlIHBhdGNoLiBUaGlzIHdvdWxkCj4gYmUgYmVjYXVzZSBv
ZiAoYikgb3IgKGMpIG9mIHRoZSAiRGV2ZWxvcGVyJ3MgQ2VydGlmaWNhdGUgb2YgT3JpZ2luIDEu
MSIKPiBbMV0uCj4gCj4gPiBBcyBmb3IgdGhlIFItYiwgd2h5IHNob3VsZCB0aGF0IGJlIGhpc3Rv
cmljPwo+IAo+IEkgdGhpbmsgaGUgbWVhbnQgdGhhdCByZXZpZXdpbmcgeW91ciBvd24gd29yayBp
cyBhIGJpdCB3ZWlyZC4gT24gdGhlCj4gb3RoZXIgaGFuZCwgaXQgaXMgcG9zc2libGUgdG8gaGF2
ZSBib3RoIGEgU29CIGFuZCBhIFItYiBmcm9tIHRoZSBzYW1lCj4gcGVyc29uZSwgaWYgdGhlIG9y
aWdpbmFsIHBhdGNoIGhhcyBiZWVuIG1vZGlmaWVkLgoKSSB3YXMgbWVyZWx5IHJldmlld2luZyB0
aGUgY2hhbmdlIG9mIGVtYWlsIGFkZHJlc3MgYW5kIHZlcmlmeWluZyB0aGF0IGl0IHdhcyB0aGUg
cGF0Y2ggSSB3cm90ZSA6LSkKCiBQYXVsCgo+IAo+IAo+IFsxXToKPiBEZXZlbG9wZXIncyBDZXJ0
aWZpY2F0ZSBvZiBPcmlnaW4gMS4xCj4gCj4gQnkgbWFraW5nIGEgY29udHJpYnV0aW9uIHRvIHRo
aXMgcHJvamVjdCwgSSBjZXJ0aWZ5IHRoYXQ6Cj4gCj4gKGEpIFRoZSBjb250cmlidXRpb24gd2Fz
IGNyZWF0ZWQgaW4gd2hvbGUgb3IgaW4gcGFydCBieSBtZSBhbmQgSQo+ICAgICBoYXZlIHRoZSBy
aWdodCB0byBzdWJtaXQgaXQgdW5kZXIgdGhlIG9wZW4gc291cmNlIGxpY2Vuc2UKPiAgICAgaW5k
aWNhdGVkIGluIHRoZSBmaWxlOyBvcgo+IAo+IChiKSBUaGUgY29udHJpYnV0aW9uIGlzIGJhc2Vk
IHVwb24gcHJldmlvdXMgd29yayB0aGF0LCB0byB0aGUgYmVzdAo+ICAgICBvZiBteSBrbm93bGVk
Z2UsIGlzIGNvdmVyZWQgdW5kZXIgYW4gYXBwcm9wcmlhdGUgb3BlbiBzb3VyY2UKPiAgICAgbGlj
ZW5zZSBhbmQgSSBoYXZlIHRoZSByaWdodCB1bmRlciB0aGF0IGxpY2Vuc2UgdG8gc3VibWl0IHRo
YXQKPiAgICAgd29yayB3aXRoIG1vZGlmaWNhdGlvbnMsIHdoZXRoZXIgY3JlYXRlZCBpbiB3aG9s
ZSBvciBpbiBwYXJ0Cj4gICAgIGJ5IG1lLCB1bmRlciB0aGUgc2FtZSBvcGVuIHNvdXJjZSBsaWNl
bnNlICh1bmxlc3MgSSBhbQo+ICAgICBwZXJtaXR0ZWQgdG8gc3VibWl0IHVuZGVyIGEgZGlmZmVy
ZW50IGxpY2Vuc2UpLCBhcyBpbmRpY2F0ZWQKPiAgICAgaW4gdGhlIGZpbGU7IG9yCj4gCj4gKGMp
IFRoZSBjb250cmlidXRpb24gd2FzIHByb3ZpZGVkIGRpcmVjdGx5IHRvIG1lIGJ5IHNvbWUgb3Ro
ZXIKPiAgICAgcGVyc29uIHdobyBjZXJ0aWZpZWQgKGEpLCAoYikgb3IgKGMpIGFuZCBJIGhhdmUg
bm90IG1vZGlmaWVkCj4gICAgIGl0Lgo+IAo+IChkKSBJIHVuZGVyc3RhbmQgYW5kIGFncmVlIHRo
YXQgdGhpcyBwcm9qZWN0IGFuZCB0aGUgY29udHJpYnV0aW9uCj4gICAgIGFyZSBwdWJsaWMgYW5k
IHRoYXQgYSByZWNvcmQgb2YgdGhlIGNvbnRyaWJ1dGlvbiAoaW5jbHVkaW5nIGFsbAo+ICAgICBw
ZXJzb25hbCBpbmZvcm1hdGlvbiBJIHN1Ym1pdCB3aXRoIGl0LCBpbmNsdWRpbmcgbXkgc2lnbi1v
ZmYpIGlzCj4gICAgIG1haW50YWluZWQgaW5kZWZpbml0ZWx5IGFuZCBtYXkgYmUgcmVkaXN0cmli
dXRlZCBjb25zaXN0ZW50IHdpdGgKPiAgICAgdGhpcyBwcm9qZWN0IG9yIHRoZSBvcGVuIHNvdXJj
ZSBsaWNlbnNlKHMpIGludm9sdmVkLgo+IAo+IAo+IENoZWVycywKPiAKPiAtLQo+IEFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
