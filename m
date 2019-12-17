Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AE1235AE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 20:28:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihITr-0001Lf-MY; Tue, 17 Dec 2019 19:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgdD=2H=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ihITp-0001La-P7
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 19:26:01 +0000
X-Inumbo-ID: 0ec91472-2103-11ea-b6f1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ec91472-2103-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 19:26:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCA6421775;
 Tue, 17 Dec 2019 19:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576610760;
 bh=OYIEKUOV82nQWAbImTwjIF0JONpvCOJ6a8tj8QOdURQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=030VaTuVL/0+lWjHV/uSH0m7TmoxIJ1AMJoEk4tj1hdGK+UDZskyWPNyBnx+vuqsi
 kcrTwg6so9JpapeVPbSUvhdrictBitK+zKFLEpqSomRj04I9fFjdR2B/ZvHmwU/SIh
 2B4uXoaQW5n4uAX0OHNOP2YE2TLoYiB6AYxxa6xU=
Date: Tue, 17 Dec 2019 11:25:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
In-Reply-To: <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUdWUsIERl
YyAxNywgMjAxOSBhdCAxMDozMCBBTSBTdGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCAxNyBEZWMgMjAxOSwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gT24gMTcvMTIvMjAxOSAwNDozOSwgUm9t
YW4gU2hhcG9zaG5payB3cm90ZToKPiA+ID4gPiBPbiBNb24sIERlYyAxNiwgMjAxOSBhdCA2OjU1
IFBNIFN0ZWZhbm8gU3RhYmVsbGluaQo+ID4gPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgMTYgRGVjIDIwMTksIFJvbWFuIFNoYXBvc2huaWsgd3Jv
dGU6Cj4gPiA+ID4gPiBJZiBJIHN1bSBhbGwgdGhlIG1lbW9yeSBzaXplcyB0b2dldGhlciBJIGdl
dCAweDNkZGZkMDAwIHdoaWNoIGlzIDk5ME0uCj4gPiA+ID4gPiBJZiBzbywgSSB3b25kZXIgaG93
IHlvdSBjb3VsZCBib290IHN1Y2Nlc2Z1bGx5IHdpdGggZG9tMF9tZW09MTAyNE0gZXZlbgo+ID4g
PiA+ID4gb24gWGVuIDQuMTIuLi4gOi0/Cj4gPiA+ID4KPiA+ID4gPiBUaGF0IGlzIGEgdmVyeSBp
bnRlcmVzdGluZyBvYnNlcnZhdGlvbiBpbmRlZWQhIEkgYWN0dWFsbHkgZG9uJ3QKPiA+ID4gPiBy
ZW1lbWJlciB3aGVyZSB0aGF0IGRldmljZSB0cmVlIGNhbWUgZnJvbSwgYnV0IEkgdGhpbmsgaXQg
d2FzIGZyb20gb25lCj4gPiA+ID4gb2YgdGhlIExpbmFybyBzaXRlcy4KPiA+ID4KPiA+ID4gVGhp
cyBpcyBtb3N0bHkgbGlrZWx5IGJlY2F1c2Ugb2Y6Cj4gPiA+Cj4gPiA+IGNvbW1pdCA2MzQxYTY3
NDU3M2YxODM0ZjA4M2YwYWIwZjViMzZiMDc1ZjllMDJlCj4gPiA+IEF1dGhvcjogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+ID4gRGF0ZTogICBXZWQgQXVnIDIxIDIyOjQy
OjMxIDIwMTkgKzAxMDAKPiA+ID4KPiA+ID4gICAgIHhlbi9hcm06IGRvbWFpbl9idWlsZDogRG9u
J3QgY29udGludWUgaWYgdW5hYmxlIHRvIGFsbG9jYXRlIGFsbCBkb20wIGJhbmtzCj4gPiA+Cj4g
PiA+ICAgICBYZW4gd2lsbCBvbmx5IHByaW50IGEgd2FybmluZyBpZiB0aGVyZSBhcmUgbWVtb3J5
IHVuYWxsb2NhdGVkIHdoZW4gdXNpbmcKPiA+ID4gICAgIDE6MSBtYXBwaW5nIChvbmx5IHVzZWQg
YnkgZG9tMCkuIFRoaXMgYWxzbyBpbmNsdWRlcyB0aGUgY2FzZSB3aGVyZSBubwo+ID4gPiAgICAg
bWVtb3J5IGhhcyBiZWVuIGFsbG9jYXRlZC4KPiA+ID4KPiA+ID4gICAgIEl0IHdpbGwgYnJpbmcg
dG8gYWxsIHNvcnQgb2YgaXNzdWVzIHRoYXQgY2FuIGJlIGhhcmQgdG8gZGlhZ25vc3RpYyBmb3IK
PiA+ID4gICAgIHVzZXJzICh0aGUgd2FybmluZyBjYW4gYmUgZGlmZmljdWx0IHRvIHNwb3Qgb3Ig
ZGlzcmVnYXJkKS4KPiA+ID4KPiA+ID4gICAgIElmIHRoZSB1c2VycyByZXF1ZXN0IDFHQiBvZiBt
ZW1vcnksIHRoZW4gbW9zdCBsaWtlbHkgdGhleSB3YW50IHRoZSBleGFjdAo+ID4gPiAgICAgYW1v
dW50IGFuZCBub3QgNTEyTUIuIFNvIHBhbmljIGlmIGFsbCB0aGUgbWVtb3J5IGhhcyBub3QgYmVl
biBhbGxvY2F0ZWQuCj4gPiA+Cj4gPiA+ICAgICBBZnRlciB0aGlzIGNoYW5nZSwgdGhlIGJlaGF2
aW9yIGlzIHRoZSBzYW1lIGFzIGZvciBub24tMToxIG1lbW9yeQo+ID4gPiAgICAgYWxsb2NhdGlv
biAodXNlZCBieSBkb21VKS4KPiA+ID4KPiA+ID4gICAgIEF0IHRoZSBzYW1lIHRpbWUsIHJlZmxv
dyB0aGUgbWVzc2FnZSB0byBoYXZlIHRoZSBmb3JtYXQgb24gYSBzaW5nbGUKPiA+ID4gICAgIGxp
bmUuCj4gPiA+Cj4gPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+ID4gPiAgICAgQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+Cj4gPiBBaCEgUm9tYW4sIGNvdWxkIHlvdSBwbGVhc2Ug
cG9zdCB0aGUgZnVsbCBib290IGxvZyBvZiBhIHN1Y2Nlc3NmdWwgNC4xMgo+ID4gYm9vdD8KPiA+
Cj4gPiBJZiBpdCBoYXMgYSAiRmFpbGVkIHRvIGFsbG9jYXRlIHJlcXVlc3RlZCBkb20wIG1lbW9y
eSIgbWVzc2FnZSwgdGhlbiB3ZQo+ID4ga25vdyB3aGF0IHRoZSBpc3N1ZSBpcy4KPiAKPiBBaGEh
IE91ciBtZXNzYWdlcyBzZWVtcyB0byBoYXZlIGNyb3NzZWQgOy0pIEZ1bGwgbG9nIGlzIGF0dGFj
aGVkIGFuZAo+IHllcyAtLSB0aGF0J3MKPiB0aGUgcHJvYmxlbSBpbmRlZWQuCj4gCj4gU28gYXQg
bGVhc3QgdGhhdCBteXN0ZXJ5IGlzIHNvbHZlZC4gQnV0IEknbSBzdGlsbCBub3QgYWJsZSB0byBn
ZXQgdG8gYQo+IGZ1bGwgMUcgb2YgbWVtb3J5Cj4gZXZlbiB3aXRoIHlvdXIgdXBkYXRlIHRvIHRo
ZSBkZXZpY2UgdHJlZSBmaWxlLiBBbnkgY2hhbmNlIHlvdSBjYW4gc2VuZCBtZSB0aGUKPiBkZXZp
Y2UgdHJlZSBmaWxlIHRoYXQgd29ya3MgZm9yIHlvdT8KCkkgZGlkbid0IHRyeSBvbiByZWFsIGhh
cmR3YXJlLCBJIG9ubHkgdHJpZWQgb24gUUVNVSB3aXRoIGEgc2ltaWxhcgpjb25maWd1cmF0aW9u
LiBJIHdlbnQgYmFjayBhbmQgY2hlY2sgdGhlIEhpS2V5IGRldmljZSB0cmVlIEkgdXNlZCBhbmQg
aXQKaXMgdGhlIHNhbWUgYXMgeW91cnMgKGluY2x1ZGluZyB0aGUgcmFtb29wcyByZXNlcnZlZC1t
ZW1vcnkgZXJyb3IpLgoKQXBwYXJlbnRseSB0aGVyZSBhcmUgMUcgYW5kIDJHIHZhcmlhbnRzIG9m
IHRoZSBIaUtleSwgb2J2aW91c2x5IGJvdGgKeW91cnMgYW5kIG15IGRldmljZSB0cmVlIGFyZSBm
b3IgdGhlIDFHIHZhcmlhbnQuIEkgdHJ5IHRvIGRpZyB0aHJvdWdoCnRoZSBkb2NzIGJ1dCBjb3Vs
ZG4ndCBmaW5kIHRoZSBkZXRhaWxzIG9mIHRoZSAyRyB2YXJpYW50LiBJIGNhbm5vdCBmaW5kCmFu
eXdoZXJlIHRoZSBtZW1vcnkgcmFuZ2UgZm9yIHRoZSB0b3AgMUcgb2YgbWVtb3J5IG5vdCBldmVu
IG9uIHRoZQpMZU1ha2VyIGRvY3MhIDotLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
