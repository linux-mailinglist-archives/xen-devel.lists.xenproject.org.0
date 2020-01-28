Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3C14BE45
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:04:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUFa-0002zP-Ku; Tue, 28 Jan 2020 17:02:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwUFZ-0002z9-D5
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:02:05 +0000
X-Inumbo-ID: e708caa0-41ef-11ea-a933-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e708caa0-41ef-11ea-a933-bc764e2007e4;
 Tue, 28 Jan 2020 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580230922; x=1611766922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DQDWc43f0nBDPiATCrlKrI3u+B2wbGm1Im586zDwR2c=;
 b=uAnK3OzDVBSD1K8jbXtmeIUUw/MjAnRzjipxxsaia/2vCMmRcZnF9kwT
 up5+laeHreib4tz6O1L++4kaIP0lFz6OmFBZCXjexgYCT/FrTKkibRU0i
 dkfXsNllKXiV8TpDbejgbbiWP7dfuxYdh4xrWEfQaugpQ+yzbvvI53NaX 4=;
IronPort-SDR: zVnSfYGgY0jv8vdfop2CqwVJqlkUn7G43T3+NqpYGOzmeOUgR6eSBRwOTerJZKny41qa5cowoA
 JI0I401vUF5w==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="15142117"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Jan 2020 17:01:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id E65B6C5B40; Tue, 28 Jan 2020 17:01:55 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 17:01:55 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 17:01:54 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 17:01:54 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>
Thread-Topic: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
Thread-Index: AQHV0WIB2MUXnCM2s0mWNu7Ejtkljqf4ZmMAgAfdfACAAAaIgIAAAzQwgAAGkACAAAInQA==
Date: Tue, 28 Jan 2020 17:01:54 +0000
Message-ID: <bb80af501c55435cbfe4599756ed1167@EX13D32EUC003.ant.amazon.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-7-liuwe@microsoft.com>
 <c73aa226-df1a-552c-caea-f6a781dc63c6@suse.com>
 <20200128155510.ruie6ck4i3hg5dub@debian>
 <568d6410-ad85-74f8-84ab-2c5e47d2c314@suse.com>
 <c6a5c2bc7178499ca4618a76996dc8d4@EX13D32EUC003.ant.amazon.com>
 <20200128165330.y36ozjw6io7fyucq@debian>
In-Reply-To: <20200128165330.y36ozjw6io7fyucq@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMjggSmFudWFyeSAyMDIwIDE2OjU0Cj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgWGVuIERldmVsb3BtZW50Cj4g
TGlzdCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+
IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBN
aWNoYWVsIEtlbGxleQo+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPgo+IFN1YmplY3Q6IFJlOiBb
WGVuLWRldmVsXSBbUEFUQ0ggdjQgNi83XSB4ODYvaHlwZXJ2OiByZXRyaWV2ZSB2cF9pbmRleCBm
cm9tCj4gSHlwZXItVgo+IAo+IE9uIFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDA0OjMzOjAwUE0gKzAw
MDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gPiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmc+IE9uIEJlaGFsZiBPZgo+IEphbgo+ID4gPiBCZXVsaWNoCj4gPiA+IFNlbnQ6IDI4IEph
bnVhcnkgMjAyMCAxNjoxOQo+ID4gPiBUbzogV2VpIExpdSA8d2xAeGVuLm9yZz47IFBhdWwgRHVy
cmFudCA8cGF1bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3Blcgo+ID4gPiA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiA+ID4gQ2M6IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+OyBSb2dlciBQYXUKPiBNb25uw6kKPiA+ID4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IE1pY2hhZWwgS2VsbGV5
Cj4gPiA+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIIHY0IDYvN10geDg2L2h5cGVydjogcmV0cmlldmUgdnBfaW5kZXgKPiBmcm9t
Cj4gPiA+IEh5cGVyLVYKPiA+ID4KPiA+ID4gT24gMjguMDEuMjAyMCAxNjo1NSwgV2VpIExpdSB3
cm90ZToKPiA+ID4gPiBPbiBUaHUsIEphbiAyMywgMjAyMCBhdCAwNDo0ODozOFBNICswMTAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPj4gT24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3
cm90ZToKPiA+ID4gPj4+IFRoaXMgd2lsbCBiZSB1c2VmdWwgd2hlbiBpbnZva2luZyBoeXBlcmNh
bGwgdGhhdCB0YXJnZXRzIHNwZWNpZmljCj4gPiA+ID4+PiB2Y3B1KHMpLgo+ID4gPiA+Pj4KPiA+
ID4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiA+
ID4+PiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4gPiA+ID4+Cj4g
PiA+ID4+IEZvciBmb3JtYWwgcmVhc29ucwo+ID4gPiA+PiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gPiA+Pgo+ID4gPiA+PiBIb3dldmVyIEkgd29uZGVyIHdo
ZXRoZXIgdGhlIFZpcmlkaWFuIGVudHJ5IGluIE1BSU5UQUlORVJTCj4gc2hvdWxkbid0Cj4gPiA+
ID4+IGJlIGV4dGVuZGVkIGJ5Cj4gPiA+ID4+Cj4gPiA+ID4+IEY6CXhlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvCj4gPiA+ID4+Cj4gPiA+ID4+IChhbmQgcG9zc2libHkgaGF2ZSBpdHMgdGl0bGUg
YWRqdXN0ZWQpLiBUaG91Z2h0cz8KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXNuJ3QgYWJvdXQgZW11
bGF0aW5nIEh5cGVyLVYgaW5zaWRlIFhlbiwgc28gSSBkb24ndCB0aGluawo+IHRoYXQncwo+ID4g
PiA+IHRoZSByaWdodCBhcHByb2FjaCBoZXJlLgo+ID4gPgo+ID4gPiBXZWxsLCBpdCdzIHRoZSBj
b2RlIHByb2R1Y2luZyB0aGUgaW50ZXJmYWNlIGluIG9uZSBjYXNlLCBhbmQKPiA+ID4gY29uc3Vt
aW5nIGl0IGhlcmUuIFNvIHRoZXJlIGlzIHNvbWUgb3ZlcmxhcCBhdCBsZWFzdC4KPiA+ID4KPiA+
ID4gPiBUaGF0IHNhaWQsIGlmIFBhdWwgd2FudHMgdG8gdGFrZSB0aGlzIHVuZGVyIGhpcyBwdXJ2
aWV3LCBpdCdzIGZpbmUKPiBieSBtZQo+ID4gPiA+IC0tIHRoYXQgd291bGQgbWFrZSBtZSBlYXNp
ZXIgdG8gdXBzdHJlYW0gbXkgcGF0Y2guIDstKSAgSSBhbHNvCj4gd291bGRuJ3QKPiA+ID4gPiBt
aW5kIGFkZGluZyBteXNlbGYgYXMgbWFpbnRhaW5lciBmb3IgdGhpcyBwYXRoLgo+ID4gPgo+ID4g
PiBQZXJoYXBzIGJlc3QgYm90aCBvZiB5b3U/IFBhdWwsIEFuZHJldywgd2hhdCBkbyB5b3UgdGhp
bms/Cj4gPiA+Cj4gPgo+ID4gSU1PIGl0J3MgcHJvYmFibHkgYmVzdCB0byB0aGUgcHV0IHRoZSBI
eXBlci1WIHN0dWZmIHVuZGVyICdWaXJpZGlhbicKPiA+IGFuZCBhZGQgeW91cnNlbGYgYXMgYSBt
YWludGFpbmVyIHRoZXJlLiBUaGVyZSByZWFsbHkgaXMgbGlrZWx5IHRvIGJlCj4gPiBzaWduaWZp
Y2FudCBvdmVybGFwIGFuZCBpdCdkIG1ha2UgaXQgZWFzaWVyIChmb3IgbWUgYXQgbGVhc3QpIHRv
IGtlZXAKPiA+IHRyYWNrIG9mIHRoZSBiaWdnZXIgcGljdHVyZSAoaS5lLiBYZW4gdXNpbmcgZW5s
aWdodGVubWVudHMgYXMgd2VsbCBhcwo+ID4gaW1wbGVtZW50aW5nIHRoZW0pLgo+IAo+IFdoZW4g
eW91IHNhaWQgInlvdXJzZWxmIiwgZGlkIHlvdSBtZWFuIG1lIG9yIEphbj8KPgoKWW91LiBJIHRo
b3VnaHQgd2FzIHJlcGx5aW5nIHRvIHlvdXIgcXVlc3Rpb24uIEFwb2xvZ2llcyBmb3IgYW55IGNv
bmZ1c2lvbi4KCiAgUGF1bAogCj4gV2VpLgo+IAo+ID4KPiA+ICAgQ2hlZXJzLAo+ID4KPiA+ICAg
ICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
