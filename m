Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB99116F56
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:43:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieKEL-0001iN-RC; Mon, 09 Dec 2019 14:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieKEK-0001iH-Hn
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:41:44 +0000
X-Inumbo-ID: 04f5034c-1a92-11ea-88e7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f5034c-1a92-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575902504; x=1607438504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XbcTZM4MjHE6lmT4GQMd2AUnJ2M3OvQz7zQpxDVD1KM=;
 b=WTioHLJ4cYPibzBh14izcKu2EJnCLJSRq1UraJm0AWWvMlX8XrV/p69w
 CLImjz+A1EiJfiw0pDBx11eWzSfaO9i8sZsWiVnx4Dnggl9m8RopS8Rgt
 lNvqNbETNPzUv/D0CkqKnOPQQspW8oa1RIT3aX54zupTRGL51qGYeHRkf 0=;
IronPort-SDR: YwFq6IemvsINv3mi9a8IuDZl45EjZnpt8fBGfIdhG+M/Nx3njDgEBZRpGtinUxcfUUPKL1ZOXZ
 Z3G3Hi67ilWw==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="6820773"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Dec 2019 14:41:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 32D3AA22FC; Mon,  9 Dec 2019 14:41:42 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:41:41 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:41:41 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 14:41:40 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEsBCAAAg3gIAAAevggAAghQCAAAFgMA==
Date: Mon, 9 Dec 2019 14:41:40 +0000
Message-ID: <e026926b9aea4ffe868d41828c1f4721@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
 <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
 <20191209142852.GW980@Air-de-Roger>
In-Reply-To: <20191209142852.GW980@Air-de-Roger>
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
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTQ6MjkKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuCj4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47Cj4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3
aGVuIHN0YXRlIGlzIGZvcmNlZCB0bwo+IGNsb3NlZAo+IAo+IE9uIE1vbiwgRGVjIDA5LCAyMDE5
IGF0IDEyOjQwOjQ3UE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+ID4gPiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDEyOjI2Cj4gPiA+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gPiBDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOwo+IEp1
ZXJnZW4KPiA+ID4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gPiA+IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0gg
Mi80XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMKPiBmb3JjZWQgdG8KPiA+ID4gY2xvc2Vk
Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgRGVjIDA5LCAyMDE5IGF0IDEyOjAxOjM4UE0gKzAwMDAsIER1
cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4gPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
PiA+ID4gPiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjM5Cj4gPiA+ID4gPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+ID4gPiA+IENjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7Cj4gPiA+IEp1
ZXJnZW4KPiA+ID4gPiA+IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxp
bmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gPiA+ID4gPiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtYZW4t
ZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcwo+ID4gPiBmb3Jj
ZWQgdG8KPiA+ID4gPiA+IGNsb3NlZAo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFRodSwgRGVjIDA1
LCAyMDE5IGF0IDAyOjAxOjIxUE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiA+
ID4gT25seSBmb3JjZSBzdGF0ZSB0byBjbG9zZWQgaW4gdGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0
YWNrIG1heQo+IG5lZWQKPiA+ID4gdG8KPiA+ID4gPiA+ID4gY2xlYW4gdXAuIFRoaXMgY2FuIGJl
IGRldGVjdGVkIGJ5IGNoZWNraW5nIHdoZXRoZXIgdGhlIHN0YXRlIGluCj4gPiA+IHhlbnN0b3Jl
Cj4gPiA+ID4gPiA+IGhhcyBiZWVuIHNldCB0byBjbG9zaW5nIHByaW9yIHRvIGRldmljZSByZW1v
dmFsLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2Yg
dGhpcywgSSB3b3VsZCBleHBlY3QgdGhhdCBhCj4gZmFpbHVyZSB0bwo+ID4gPiA+ID4gcHJvYmUg
b3IgdGhlIHJlbW92YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVuYnVzIHN0YXRl
IGFzCj4gPiA+ID4gPiBjbG9zZWQsIHdoaWNoIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgYWN0dWFs
IGRyaXZlciBzdGF0ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDYW4geW91IGV4cGxhaW4gd2hhdCdz
IHRoZSBiZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ugd2l0aG91dCBhCj4gPiA+ID4gPiBkcml2
ZXIgaW4gc3VjaCB1bmtub3duIHN0YXRlPwo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IElmIHBy
b2JlIGZhaWxzIHRoZW4gSSB0aGluayBpdCBzaG91bGQgbGVhdmUgdGhlIHN0YXRlIGFsb25lLiBJ
ZiB0aGUKPiA+ID4gPiBzdGF0ZSBpcyBtb3ZlZCB0byBjbG9zZWQgdGhlbiBiYXNpY2FsbHkgeW91
IGp1c3Qga2lsbGVkIHRoYXQKPiA+ID4gPiBjb25uZWN0aW9uIHRvIHRoZSBndWVzdCAoYXMgdGhl
IGZyb250ZW5kIHdpbGwgbm9ybWFsbHkgY2xvc2UgZG93bgo+ID4gPiA+IHdoZW4gaXQgc2VlcyB0
aGlzIGNoYW5nZSkgc28sIGlmIHRoZSBwcm9iZSBmYWlsdXJlIHdhcyBkdWUgdG8gYSBidWcKPiA+
ID4gPiBpbiBibGtiYWNrIG9yLCBlLmcuLCBhIHRyYW5zaWVudCByZXNvdXJjZSBpc3N1ZSB0aGVu
IGl0J3MgZ2FtZSBvdmVyCj4gPiA+ID4gYXMgZmFyIGFzIHRoYXQgZ3Vlc3QgZ29lcy4KPiA+ID4K
PiA+ID4gQnV0IHRoZSBjb25uZWN0aW9uIGNhbiBiZSByZXN0YXJ0ZWQgYnkgc3dpdGNoaW5nIHRo
ZSBiYWNrZW5kIHRvIHRoZQo+ID4gPiBpbml0IHN0YXRlIGFnYWluLgo+ID4KPiA+IFRvbyBsYXRl
LiBUaGUgZnJvbnRlbmQgc2F3IGNsb3NlZCBhbmQgeW91IGFscmVhZHkgbG9zdC4KPiA+Cj4gPiA+
Cj4gPiA+ID4gVGhlIHVsdGltYXRlIGdvYWwgaGVyZSBpcyBQViBiYWNrZW5kIHJlLWxvYWQgdGhh
dCBpcyBjb21wbGV0ZWx5Cj4gPiA+IHRyYW5zcGFyZW50IHRvIHRoZSBndWVzdC4gTW9kaWZ5aW5n
IGFueXRoaW5nIGluIHhlbnN0b3JlIGNvbXByb21pc2VzCj4gdGhhdAo+ID4gPiBzbyB3ZSBuZWVk
IHRvIGJlIGNhcmVmdWwuCj4gPiA+Cj4gPiA+IFRoYXQncyBhIGZpbmUgZ29hbCwgYnV0IG5vdCBz
d2l0Y2hpbmcgdG8gY2xvc2VkIHN0YXRlIGluCj4gPiA+IHhlbmJ1c19kZXZfcmVtb3ZlIHNlZW1z
IHdyb25nLCBhcyB5b3UgaGF2ZSBhY3R1YWxseSBsZWZ0IHRoZSBmcm9udGVuZAo+ID4gPiB3aXRo
b3V0IGEgbWF0Y2hpbmcgYmFja2VuZCBhbmQgd2l0aCB0aGUgc3RhdGUgbm90IHNldCB0byBjbG9z
ZWQuCj4gPiA+Cj4gPgo+ID4gV2h5IGlzIHRoaXMgYSBwcm9ibGVtPyBXaXRoIHRoaXMgc2VyaWVz
IGZ1bGx5IGFwcGxpZWQgYSAoYmxvY2spIGJhY2tlbmQKPiBjYW4gY29tZSBhbmQgZ28gd2l0aG91
dCBuZWVkaW5nIHRvIGNoYW5nZSB0aGUgc3RhdGUuIFJlbHlpbmcgb24gZ3Vlc3RzIHRvCj4gRFRS
VCBpcyBub3QgYSBzdXN0YWluYWJsZSBvcHRpb24gZm9yIGEgY2xvdWQgZGVwbG95bWVudC4KPiA+
Cj4gPiA+IEllOiB0aGF0IHdvdWxkIGJlIGZpbmUgaWYgeW91IGV4cGxpY2l0bHkgc3RhdGUgdGhp
cyBpcyBzb21lIGtpbmQgb2YKPiA+ID4gaW50ZXJuYWwgYmxrYmFjayByZWxvYWQsIGJ1dCBub3Qg
Zm9yIHRoZSBnZW5lcmFsIGNhc2Ugd2hlcmUgYmxrYmFjawo+ID4gPiBoYXMgYmVlbiB1bmJvdW5k
LiBJIHRoaW5rIHdlIG5lZWQgc29tZXdheSB0byBkaWZmZXJlbmNlIGEgYmxrYmFjawo+ID4gPiBy
ZWxvYWQgdnMgYSB1bmJvdW5kLgo+ID4gPgo+ID4KPiA+IFdoeSBkbyB3ZSBuZWVkIHRoYXQgdGhv
dWdoPyBXaHkgaXMgaXQgYWR2YW50YWdlb3VzIGZvciBhIGJhY2tlbmQgdG8gZ28KPiB0byBjbG9z
ZWQuIE5vIFBWIGJhY2tlbmRzIGNvcGUgd2l0aCBhbiB1bmJpbmQgYXMtaXMsIGFuZCBhIHRvb2xz
dGFjawo+IGluaXRpYXRlZCB1bnBsdWcgd2lsbCBhbHdheXMgc2V0IHN0YXRlIHRvIDUgYW55d2F5
LiBTbyBUQkggYW55IHN0YXRlCj4gdHJhbnNpdGlvbiBkb25lIGRpcmVjdGx5IGluIHRoZSB4ZW5i
dXMgY29kZSBsb29rcyB3cm9uZyB0byBtZSBhbnl3YXkgKGJ1dAo+IGFwcGVhcnMgdG8gYmUgYSBu
ZWNlc3NhcnkgZXZpbCB0byBrZWVwIHRoZSB0b29sc3RhY2sgd29ya2luZyBpbiB0aGUgZXZlbnQK
PiBpdCBzcGF3bnMgYSBiYWNrZW5kIHdoZXJlIHRoZXJlIGlzIGFjdHVhbGx5IHRvIGRyaXZlciBw
cmVzZW50LCBvciBpdAo+IGRvZXNuJ3QgY29tZSBvbmxpbmUpLgo+IAo+IElNTyB0aGUgbm9ybWFs
IGZsb3cgZm9yIHVuYmluZCB3b3VsZCBiZSB0byBhdHRlbXB0IHRvIGNsb3NlIG9wZW4KPiBjb25u
ZWN0aW9ucyBhbmQgdGhlbiByZW1vdmUgdGhlIGRyaXZlcjogbGVhdmluZyBmcm9udGVuZHMgY29u
bmVjdGVkCj4gd2l0aG91dCBhbnkgYXR0YWNoZWQgYmFja2VuZHMgaXMgbm90IGNvcnJlY3QsIGFu
ZCB3aWxsIGp1c3QgYmxvY2sgdGhlCj4gZ3Vlc3QgZnJvbnRlbmQgdW50aWwgcmVxdWVzdHMgc3Rh
cnQgdGltaW5nIG91dC4KPiAKPiBJIGNhbiBzZWUgdGhlIHJlYXNvbmluZyBmb3IgZG9pbmcgdGhh
dCBmb3IgdGhlIHB1cnBvc2Ugb2YgdXBkYXRpbmcgYQo+IGJsa2JhY2sgbW9kdWxlIHdpdGhvdXQg
Z3Vlc3RzIG5vdGljaW5nLCBidXQgSSB3b3VsZCBwcmVmZXIgdGhhdAo+IGxlYXZpbmcgY29ubmVj
dGlvbnMgb3BlbiB3YXMgYW4gb3B0aW9uIHRoYXQgY291bGQgYmUgZ2l2ZW4gd2hlbgo+IHVuYmlu
ZGluZyAob3IgbWF5YmUgYSBkcml2ZXIgb3B0aW9uIGluIHN5c2ZzPyksIHNvIHRoYXQgdGhlIGRl
ZmF1bHQKPiBiZWhhdmlvdXIgd291bGQgYmUgdG8gdHJ5IHRvIGNsb3NlIGV2ZXJ5dGhpbmcgd2hl
biB1bmJpbmRpbmcgaWYKPiBwb3NzaWJsZS4KCldlbGwgdW5iaW5kIGlzIHByZXR0eSB1c2VsZXNz
IG5vdyBJTU8gc2luY2UgYmluZCBkb2Vzbid0IHdvcmssIGFuZCBhIHRyYW5zaXRpb24gc3RyYWln
aHQgdG8gY2xvc2VkIGlzIGp1c3QgcGxhaW4gd3JvbmcgYW55d2F5LiBCdXQsIHdlIGNvdWxkIGhh
dmUgYSBmbGFnIHRoYXQgdGhlIGJhY2tlbmQgZHJpdmVyIHNldHMgdG8gc2F5IHRoYXQgaXQgc3Vw
cG9ydHMgdHJhbnNwYXJlbnQgcmUtYmluZCB0aGF0IGdhdGVzIHRoaXMgY29kZS4gV291bGQgdGhh
dCBtYWtlIHlvdSBmZWVsIG1vcmUgY29tZm9ydGFibGU/CgpJZiB5b3Ugd2FudCB1bmJpbmQgdG8g
YWN0dWFsbHkgZG8gYSBwcm9wZXIgdW5wbHVnIHRoZW4gdGhhdCdzIGV4dHJhIHdvcmsgYW5kIG5v
dCByZWFsbHkgc29tZXRoaW5nIEkgd2FudCB0byB0YWNrbGUgKGFuZCByZS1iaW5kIHdvdWxkIHN0
aWxsIG5lZWQgdG8gYmUgdG9vbHN0YWNrIGluaXRpYXRlZCBhcyBzb21ldGhpbmcgd291bGQgaGF2
ZSB0byByZS1jcmVhdGUgdGhlIHhlbnN0b3JlIGFyZWEpLgoKICBQYXVsCgo+IAo+IFRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
