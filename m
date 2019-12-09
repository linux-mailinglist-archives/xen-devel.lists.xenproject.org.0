Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76531116FDB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 16:07:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieKaS-0003ob-VT; Mon, 09 Dec 2019 15:04:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieKaR-0003oW-QU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 15:04:35 +0000
X-Inumbo-ID: 356c8705-1a95-11ea-87ef-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 356c8705-1a95-11ea-87ef-12813bfff9fa;
 Mon, 09 Dec 2019 15:04:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6641EAC79;
 Mon,  9 Dec 2019 15:04:33 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
 <20191209102042.GN980@Air-de-Roger>
 <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
 <20191209144648.GX980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <55e21ad8-2f15-f3ba-05a7-58166c9f2383@suse.com>
Date: Mon, 9 Dec 2019 16:04:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209144648.GX980@Air-de-Roger>
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

T24gMDkuMTIuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIERl
YyAwOSwgMjAxOSBhdCAwMzoyMToyOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDkuMTIuMjAxOSAxMToyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwgRGVj
IDA0LCAyMDE5IGF0IDA2OjA1OjExUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDA0LjEyLjIwMTkgMTc6MTgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwg
RGVjIDA0LCAyMDE5IGF0IDA1OjExOjQyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gT24gMDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+IEBA
IC0xMzAsNyArMTQzLDcgQEAgdW5zaWduZWQgbG9uZyBwdl9tYWtlX2NyNChjb25zdCBzdHJ1Y3Qg
dmNwdSAqdikKPj4+Pj4+PiAgICAgICAqLwo+Pj4+Pj4+ICAgICAgaWYgKCBkLT5hcmNoLnB2LnBj
aWQgKQo+Pj4+Pj4+ICAgICAgICAgIGNyNCB8PSBYODZfQ1I0X1BDSURFOwo+Pj4+Pj4+IC0gICAg
ZWxzZSBpZiAoICFkLT5hcmNoLnB2LnhwdGkgKQo+Pj4+Pj4+ICsgICAgZWxzZSBpZiAoICFkLT5h
cmNoLnB2LnhwdGkgJiYgb3B0X2dsb2JhbF9wYWdlcyApCj4+Pj4+Pj4gICAgICAgICAgY3I0IHw9
IFg4Nl9DUjRfUEdFOwo+Pj4+Pj4KPj4+Pj4+IEknbSBzb3JyeSBmb3Igbm90aWNpbmcgdGhpcyBv
bmx5IG5vdywgYnV0IHdoYXQgYWJvdXQgWEVOX01JTklNQUxfQ1I0LAo+Pj4+Pj4gd2hpY2ggaW5j
bHVkZXMgWDg2X0NSNF9QR0U/Cj4+Pj4+Cj4+Pj4+IEkndmUgdHJpZWQgcmVtb3ZpbmcgUEdFIGZy
b20gWEVOX01JTklNQUxfQ1I0IGJ1dCBpdCBtYWRlIG5vIG5vdGljZWFibGUKPj4+Pj4gcGVyZm9y
bWFuY2UgZGlmZmVyZW5jZSwgc28gSSBsZWZ0IGl0IGFzLWlzLgo+Pj4+Cj4+Pj4gTXkgY29uY2Vy
biBpc24ndCBhYm91dCBwZXJmb3JtYW5jZSwgYnV0IGNvcnJlY3RuZXNzLiBJIGFkbWl0IEkKPj4+
PiBmb3Jnb3QgZm9yIGEgbW9tZW50IHRoYXQgd2Ugbm93IGFsd2F5cyB3cml0ZSBDUjQgKHVubGVz
cyB0aGUKPj4+PiBjYWNoZWQgdmFsdWUgbWF0Y2hlcyB0aGUgaW50ZW5kZWQgbmV3IG9uZSkuIFll
dAo+Pj4+IG1tdV9jcjRfZmVhdHVyZXMgKHN0YXJ0aW5nIG91dCBhcyBYRU5fTUlOSU1BTF9DUjQp
IGlzIHN0aWxsIG9mCj4+Pj4gY29uY2Vybi4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBhdCBsZWFz
dCByZXF1aXJlcyBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIHRvCj4+Pj4gZGlzY3VzcyB0aGUg
Y29ycmVjdG5lc3MuCj4+Pgo+Pj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCBhZGRpbmcgdGhlIGZv
bGxvd2luZyBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQKPj4+IG1lc3NhZ2UuCj4+Pgo+Pj4gIk5v
dGUgdGhhdCBYRU5fTUlOSU1BTF9DUjQgaXMgbm90IG1vZGlmaWVkLCBhbmQgdGh1cyBnbG9iYWwg
cGFnZXMgYXJlCj4+PiBsZWZ0IGVuYWJsZWQgZm9yIHRoZSBoeXBlcnZpc29yLiBUaGlzIGlzIG5v
dCBhbiBpc3N1ZSBiZWNhdXNlIHRoZSBjb2RlCj4+PiB0byBzd2l0Y2ggdGhlIGNvbnRyb2wgcmVn
aXN0ZXJzIChjcjMgYW5kIGNyNCkgYWxyZWFkeSB0YWtlcyBpbnRvCj4+PiBhY2NvdW50IHN1Y2gg
c2l0dWF0aW9uIGFuZCBwZXJmb3JtcyB0aGUgbmVjZXNzYXJ5IGZsdXNoZXMuIFRoZSBzYW1lCj4+
PiBhbHJlYWR5IGhhcHBlbnMgd2hlbiB1c2luZyBYUFRJIG9yIFBDSURFLCBhcyB0aGUgZ3Vlc3Qg
Y3I0IGRvZXNuJ3QKPj4+IGhhdmUgZ2xvYmFsIHBhZ2VzIGVuYWJsZWQgaW4gdGhhdCBjYXNlIGVp
dGhlci4iCj4+Cj4+IFllcywgdGhpcyBpcyBnb29kIGZvciBYRU5fTUlOSU1BTF9DUjQuIEJ1dCBJ
IHRoaW5rIG1tdV9jcjRfZmVhdHVyZXMKPj4gbmVlZHMgZGlzY3Vzc2luZyAob3IgYXQgbGVhc3Qg
bWVudGlvbmluZywgaWYgdGhlIHNhbWUgYXJndW1lbnRzCj4+IGFwcGx5KSBhcyB3ZWxsLgo+IAo+
IFRoZSBzYW1lIGFwcGxpZXMgdG8gbW11X2NyNF9mZWF0dXJlcywgaXQncyBmaW5lIGZvciB0aGUg
aHlwZXJ2aXNvciB0bwo+IHVzZSBhIGRpZmZlcmVudCBzZXQgb2YgY3I0IGZlYXR1cmVzIChlc3Bl
Y2lhbGx5IFBHRSkgdGhhbiBQViBndWVzdHM6Cj4gdGhpcyBpcyBhbHJlYWR5IHRoZSBjYXNlIHdo
ZW4gdXNpbmcgWFBUSSBvciBQQ0lERSB3aGVuIFhlbiBjcjQgd2lsbAo+IGhhdmUgUEdFIGFuZCBn
dWVzdHMgY3I0IHdvbid0LCBhbmQgc3dpdGNoX2NyM19jcjQgRFRSVC4KPiAKPiBTbyBJIHdvdWxk
IHMvWEVOX01JTklNQUxfQ1I0L1hFTl9NSU5JTUFMX0NSNCBhbmQgbW11X2NyNF9mZWF0dXJlcy8g
aW4KPiB0aGUgYWJvdmUgcHJvcG9zZWQgcGFyYWdyYXBoLgoKSSdtIGFmcmFpZCBpdCdzIG1vcmUg
Y29tcGxpY2F0ZWQsIHVwIHRvIGFuZCBpbmNsdWRpbmcgeW91IG1ha2luZyBhCnBvc3NpYmxlIHBy
ZS1leGlzdGluZyBidWcgd29yc2U6IFRoZSBTMyByZXN1bWUgcGF0aCBsb2FkcyBDUjQgZnJvbQpt
bXVfY3I0X2ZlYXR1cmVzLCBidXQgZG9lc24ndCB1cGRhdGUgdGhlIGluLW1lbW9yeSBjYWNoZSBv
ZiB0aGUKcmVnaXN0ZXIuIEhlbmNlIHNvbWUgc3Vic2VxdWVudCBDUjQgd3JpdGVzIG1heSB3cm9u
Z2x5IGJlIHNraXBwZWQsCnVudGlsIGhpdHRpbmcgb25lIHdoZXJlIGFuIGFjdHVhbCB3cml0ZSBp
cyBuZWNlc3NhcnkuIE5vdyB0aGF0IHlvdQpwbGF5IChtb3JlKSB3aXRoIFBHRSwgdGhlIHNpdHVh
dGlvbiBpcyBvbmx5IGdvaW5nIHRvIGdldCB3b3JzZS4gT2YKY291cnNlIEkgbWF5IHdlbGwgc2lt
cGx5IG5vdCBoYXZlIG1hbmFnZWQgdG8gc3BvdCB0aGUgc3luYy1pbmcgb2YKdGhlIGNhY2hlZCB2
YWx1ZS4gKFZNWCwgb3RvaCwgdGFrZXMgc3BlY2lhbCBjYXJlIHRvIGtlZXAgQ1BVIGxvYWRlZAp2
YWx1ZSBhbmQgY2FjaGUgaW4gc3luYyAtIHNlZSB0aGUgYm90dG9tIG9mIHZteF9kb19yZXN1bWUo
KS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
