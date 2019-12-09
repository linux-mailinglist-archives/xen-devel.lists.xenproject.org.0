Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF91170B6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 16:41:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieL8T-0006lp-Hc; Mon, 09 Dec 2019 15:39:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieL8S-0006lj-2J
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 15:39:44 +0000
X-Inumbo-ID: 1dc17ee8-1a9a-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dc17ee8-1a9a-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 15:39:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D471AD0E;
 Mon,  9 Dec 2019 15:39:40 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
 <20191209102042.GN980@Air-de-Roger>
 <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
 <20191209144648.GX980@Air-de-Roger>
 <55e21ad8-2f15-f3ba-05a7-58166c9f2383@suse.com>
 <20191209153647.GA980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e09ea2e7-c409-4b8e-4e90-47f6fbbc3be5@suse.com>
Date: Mon, 9 Dec 2019 16:39:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209153647.GA980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIERl
YyAwOSwgMjAxOSBhdCAwNDowNDo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDkuMTIuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIE1vbiwgRGVj
IDA5LCAyMDE5IGF0IDAzOjIxOjI4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDA5LjEyLjIwMTkgMTE6MjAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwg
RGVjIDA0LCAyMDE5IGF0IDA2OjA1OjExUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gT24gMDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+PiBP
biBXZWQsIERlYyAwNCwgMjAxOSBhdCAwNToxMTo0MlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4gT24gMDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
Pj4+Pj4+Pj4gQEAgLTEzMCw3ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNv
bnN0IHN0cnVjdCB2Y3B1ICp2KQo+Pj4+Pj4+Pj4gICAgICAgKi8KPj4+Pj4+Pj4+ICAgICAgaWYg
KCBkLT5hcmNoLnB2LnBjaWQgKQo+Pj4+Pj4+Pj4gICAgICAgICAgY3I0IHw9IFg4Nl9DUjRfUENJ
REU7Cj4+Pj4+Pj4+PiAtICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54cHRpICkKPj4+Pj4+Pj4+
ICsgICAgZWxzZSBpZiAoICFkLT5hcmNoLnB2LnhwdGkgJiYgb3B0X2dsb2JhbF9wYWdlcyApCj4+
Pj4+Pj4+PiAgICAgICAgICBjcjQgfD0gWDg2X0NSNF9QR0U7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkn
bSBzb3JyeSBmb3Igbm90aWNpbmcgdGhpcyBvbmx5IG5vdywgYnV0IHdoYXQgYWJvdXQgWEVOX01J
TklNQUxfQ1I0LAo+Pj4+Pj4+PiB3aGljaCBpbmNsdWRlcyBYODZfQ1I0X1BHRT8KPj4+Pj4+Pgo+
Pj4+Pj4+IEkndmUgdHJpZWQgcmVtb3ZpbmcgUEdFIGZyb20gWEVOX01JTklNQUxfQ1I0IGJ1dCBp
dCBtYWRlIG5vIG5vdGljZWFibGUKPj4+Pj4+PiBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlLCBzbyBJ
IGxlZnQgaXQgYXMtaXMuCj4+Pj4+Pgo+Pj4+Pj4gTXkgY29uY2VybiBpc24ndCBhYm91dCBwZXJm
b3JtYW5jZSwgYnV0IGNvcnJlY3RuZXNzLiBJIGFkbWl0IEkKPj4+Pj4+IGZvcmdvdCBmb3IgYSBt
b21lbnQgdGhhdCB3ZSBub3cgYWx3YXlzIHdyaXRlIENSNCAodW5sZXNzIHRoZQo+Pj4+Pj4gY2Fj
aGVkIHZhbHVlIG1hdGNoZXMgdGhlIGludGVuZGVkIG5ldyBvbmUpLiBZZXQKPj4+Pj4+IG1tdV9j
cjRfZmVhdHVyZXMgKHN0YXJ0aW5nIG91dCBhcyBYRU5fTUlOSU1BTF9DUjQpIGlzIHN0aWxsIG9m
Cj4+Pj4+PiBjb25jZXJuLgo+Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgdGhpcyBhdCBsZWFzdCByZXF1
aXJlcyBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIHRvCj4+Pj4+PiBkaXNjdXNzIHRoZSBjb3Jy
ZWN0bmVzcy4KPj4+Pj4KPj4+Pj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCBhZGRpbmcgdGhlIGZv
bGxvd2luZyBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQKPj4+Pj4gbWVzc2FnZS4KPj4+Pj4KPj4+
Pj4gIk5vdGUgdGhhdCBYRU5fTUlOSU1BTF9DUjQgaXMgbm90IG1vZGlmaWVkLCBhbmQgdGh1cyBn
bG9iYWwgcGFnZXMgYXJlCj4+Pj4+IGxlZnQgZW5hYmxlZCBmb3IgdGhlIGh5cGVydmlzb3IuIFRo
aXMgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIGNvZGUKPj4+Pj4gdG8gc3dpdGNoIHRoZSBj
b250cm9sIHJlZ2lzdGVycyAoY3IzIGFuZCBjcjQpIGFscmVhZHkgdGFrZXMgaW50bwo+Pj4+PiBh
Y2NvdW50IHN1Y2ggc2l0dWF0aW9uIGFuZCBwZXJmb3JtcyB0aGUgbmVjZXNzYXJ5IGZsdXNoZXMu
IFRoZSBzYW1lCj4+Pj4+IGFscmVhZHkgaGFwcGVucyB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUs
IGFzIHRoZSBndWVzdCBjcjQgZG9lc24ndAo+Pj4+PiBoYXZlIGdsb2JhbCBwYWdlcyBlbmFibGVk
IGluIHRoYXQgY2FzZSBlaXRoZXIuIgo+Pj4+Cj4+Pj4gWWVzLCB0aGlzIGlzIGdvb2QgZm9yIFhF
Tl9NSU5JTUFMX0NSNC4gQnV0IEkgdGhpbmsgbW11X2NyNF9mZWF0dXJlcwo+Pj4+IG5lZWRzIGRp
c2N1c3NpbmcgKG9yIGF0IGxlYXN0IG1lbnRpb25pbmcsIGlmIHRoZSBzYW1lIGFyZ3VtZW50cwo+
Pj4+IGFwcGx5KSBhcyB3ZWxsLgo+Pj4KPj4+IFRoZSBzYW1lIGFwcGxpZXMgdG8gbW11X2NyNF9m
ZWF0dXJlcywgaXQncyBmaW5lIGZvciB0aGUgaHlwZXJ2aXNvciB0bwo+Pj4gdXNlIGEgZGlmZmVy
ZW50IHNldCBvZiBjcjQgZmVhdHVyZXMgKGVzcGVjaWFsbHkgUEdFKSB0aGFuIFBWIGd1ZXN0czoK
Pj4+IHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZSB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUgd2hl
biBYZW4gY3I0IHdpbGwKPj4+IGhhdmUgUEdFIGFuZCBndWVzdHMgY3I0IHdvbid0LCBhbmQgc3dp
dGNoX2NyM19jcjQgRFRSVC4KPj4+Cj4+PiBTbyBJIHdvdWxkIHMvWEVOX01JTklNQUxfQ1I0L1hF
Tl9NSU5JTUFMX0NSNCBhbmQgbW11X2NyNF9mZWF0dXJlcy8gaW4KPj4+IHRoZSBhYm92ZSBwcm9w
b3NlZCBwYXJhZ3JhcGguCj4+Cj4+IEknbSBhZnJhaWQgaXQncyBtb3JlIGNvbXBsaWNhdGVkLCB1
cCB0byBhbmQgaW5jbHVkaW5nIHlvdSBtYWtpbmcgYQo+PiBwb3NzaWJsZSBwcmUtZXhpc3Rpbmcg
YnVnIHdvcnNlOiBUaGUgUzMgcmVzdW1lIHBhdGggbG9hZHMgQ1I0IGZyb20KPj4gbW11X2NyNF9m
ZWF0dXJlcywgYnV0IGRvZXNuJ3QgdXBkYXRlIHRoZSBpbi1tZW1vcnkgY2FjaGUgb2YgdGhlCj4+
IHJlZ2lzdGVyLgo+IAo+IEFsbCBkb21haW5zIGFyZSBwYXVzZWQgYW5kIHRoZSBzY2hlZHVsZXIg
aXMgZGlzYWJsZWQgd2hlbiBkb2luZyBTMwo+IHN1c3BlbmQvcmVzdW1lLCBhbmQgdGhlIGFjdHVh
bCBzdXNwZW5kIGFuZCByZXN1bWUgY29kZSBpcyBydW4gYnkgYQo+IHRhc2tsZXQgd2hpY2ggaXMg
ZXhlY3V0ZWQgaW4gdGhlIGlkbGUgdkNQVSBjb250ZXh0IChzaW5jZSBhbGwgZG9tYWlucwo+IGFy
ZSBwYXVzZWQpLCBhbmQgaGVuY2UgdGhlIHdyaXRlIG9mIENSNCB3aXRoIG1tdV9jcjRfZmVhdHVy
ZXMgaXMgZmluZQo+IGFzIGVudGVyaW5nIGd1ZXN0IGNvbnRleHQgYWZ0ZXIgcmVzdW1lIGlzIGdv
aW5nIHRvIGludm9sdmUgYSBjYWxsIHRvCj4gc3dpdGNoX2NyM19jcjQgaW4gb3JkZXIgdG8gc3dp
dGNoIG91dCBvZiB0aGUgaWRsZSB2Q1BVLgoKQW5kIHN3aXRjaF9jcjNfY3I0KCkgaGFzCgogICAg
aWYgKCBvbGRfY3I0ICE9IGNyNCApCiAgICAgICAgd3JpdGVfY3I0KGNyNCk7Cgp3aXRoIG9sZF9j
cjQgcmVhZCBmcm9tIHRoZSBjYWNoZS4KCj4gSXQgbWlnaHQgYmUgY2xlYXJlciB0byBqdXN0IHNh
dmUgY3I0IGluIGRvX3N1c3BlbmRfbG93bGV2ZWwgbGlrZSBpdCdzCj4gZG9uZSB3aXRoIHRoZSBy
ZXN0IG9mIHRoZSBjb250cm9sIHJlZ2lzdGVycy4KCk5vdCBqdXN0IG1vcmUgY2xlYXIsIGJ1dCBh
bHNvIG1vcmUgcmVsaWFibGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
