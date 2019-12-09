Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF2116EE0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:24:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJuU-00084S-Hp; Mon, 09 Dec 2019 14:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieJuT-00084N-68
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:21:13 +0000
X-Inumbo-ID: 2620100a-1a8f-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2620100a-1a8f-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 14:21:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8EB35AC3E;
 Mon,  9 Dec 2019 14:21:10 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
 <20191209102042.GN980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
Date: Mon, 9 Dec 2019 15:21:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209102042.GN980@Air-de-Roger>
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

T24gMDkuMTIuMjAxOSAxMToyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIERl
YyAwNCwgMjAxOSBhdCAwNjowNToxMVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwgRGVj
IDA0LCAyMDE5IGF0IDA1OjExOjQyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDA0LjEyLjIwMTkgMTY6MTIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQEAgLTEzMCw3
ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2
KQo+Pj4+PiAgICAgICAqLwo+Pj4+PiAgICAgIGlmICggZC0+YXJjaC5wdi5wY2lkICkKPj4+Pj4g
ICAgICAgICAgY3I0IHw9IFg4Nl9DUjRfUENJREU7Cj4+Pj4+IC0gICAgZWxzZSBpZiAoICFkLT5h
cmNoLnB2LnhwdGkgKQo+Pj4+PiArICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54cHRpICYmIG9w
dF9nbG9iYWxfcGFnZXMgKQo+Pj4+PiAgICAgICAgICBjcjQgfD0gWDg2X0NSNF9QR0U7Cj4+Pj4K
Pj4+PiBJJ20gc29ycnkgZm9yIG5vdGljaW5nIHRoaXMgb25seSBub3csIGJ1dCB3aGF0IGFib3V0
IFhFTl9NSU5JTUFMX0NSNCwKPj4+PiB3aGljaCBpbmNsdWRlcyBYODZfQ1I0X1BHRT8KPj4+Cj4+
PiBJJ3ZlIHRyaWVkIHJlbW92aW5nIFBHRSBmcm9tIFhFTl9NSU5JTUFMX0NSNCBidXQgaXQgbWFk
ZSBubyBub3RpY2VhYmxlCj4+PiBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlLCBzbyBJIGxlZnQgaXQg
YXMtaXMuCj4+Cj4+IE15IGNvbmNlcm4gaXNuJ3QgYWJvdXQgcGVyZm9ybWFuY2UsIGJ1dCBjb3Jy
ZWN0bmVzcy4gSSBhZG1pdCBJCj4+IGZvcmdvdCBmb3IgYSBtb21lbnQgdGhhdCB3ZSBub3cgYWx3
YXlzIHdyaXRlIENSNCAodW5sZXNzIHRoZQo+PiBjYWNoZWQgdmFsdWUgbWF0Y2hlcyB0aGUgaW50
ZW5kZWQgbmV3IG9uZSkuIFlldAo+PiBtbXVfY3I0X2ZlYXR1cmVzIChzdGFydGluZyBvdXQgYXMg
WEVOX01JTklNQUxfQ1I0KSBpcyBzdGlsbCBvZgo+PiBjb25jZXJuLgo+Pgo+PiBJIHRoaW5rIHRo
aXMgYXQgbGVhc3QgcmVxdWlyZXMgZXh0ZW5kaW5nIHRoZSBkZXNjcmlwdGlvbiB0bwo+PiBkaXNj
dXNzIHRoZSBjb3JyZWN0bmVzcy4KPiAKPiBXb3VsZCB5b3UgYmUgZmluZSB3aXRoIGFkZGluZyB0
aGUgZm9sbG93aW5nIGF0IHRoZSBlbmQgb2YgdGhlIGNvbW1pdAo+IG1lc3NhZ2UuCj4gCj4gIk5v
dGUgdGhhdCBYRU5fTUlOSU1BTF9DUjQgaXMgbm90IG1vZGlmaWVkLCBhbmQgdGh1cyBnbG9iYWwg
cGFnZXMgYXJlCj4gbGVmdCBlbmFibGVkIGZvciB0aGUgaHlwZXJ2aXNvci4gVGhpcyBpcyBub3Qg
YW4gaXNzdWUgYmVjYXVzZSB0aGUgY29kZQo+IHRvIHN3aXRjaCB0aGUgY29udHJvbCByZWdpc3Rl
cnMgKGNyMyBhbmQgY3I0KSBhbHJlYWR5IHRha2VzIGludG8KPiBhY2NvdW50IHN1Y2ggc2l0dWF0
aW9uIGFuZCBwZXJmb3JtcyB0aGUgbmVjZXNzYXJ5IGZsdXNoZXMuIFRoZSBzYW1lCj4gYWxyZWFk
eSBoYXBwZW5zIHdoZW4gdXNpbmcgWFBUSSBvciBQQ0lERSwgYXMgdGhlIGd1ZXN0IGNyNCBkb2Vz
bid0Cj4gaGF2ZSBnbG9iYWwgcGFnZXMgZW5hYmxlZCBpbiB0aGF0IGNhc2UgZWl0aGVyLiIKClll
cywgdGhpcyBpcyBnb29kIGZvciBYRU5fTUlOSU1BTF9DUjQuIEJ1dCBJIHRoaW5rIG1tdV9jcjRf
ZmVhdHVyZXMKbmVlZHMgZGlzY3Vzc2luZyAob3IgYXQgbGVhc3QgbWVudGlvbmluZywgaWYgdGhl
IHNhbWUgYXJndW1lbnRzCmFwcGx5KSBhcyB3ZWxsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
