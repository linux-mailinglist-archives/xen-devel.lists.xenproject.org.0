Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB6117132
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:11:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLaT-0001Yg-F1; Mon, 09 Dec 2019 16:08:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieLaS-0001Ya-I0
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 16:08:40 +0000
X-Inumbo-ID: 28c619ee-1a9e-11ea-880d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28c619ee-1a9e-11ea-880d-12813bfff9fa;
 Mon, 09 Dec 2019 16:08:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 354C0B1E6;
 Mon,  9 Dec 2019 16:08:37 +0000 (UTC)
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
 <e09ea2e7-c409-4b8e-4e90-47f6fbbc3be5@suse.com>
 <20191209155215.GB980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df3fb1ae-9f54-3b8d-86b5-f54234efb445@suse.com>
Date: Mon, 9 Dec 2019 17:08:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209155215.GB980@Air-de-Roger>
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

T24gMDkuMTIuMjAxOSAxNjo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIERl
YyAwOSwgMjAxOSBhdCAwNDozOTo1OFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDkuMTIuMjAxOSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIE1vbiwgRGVj
IDA5LCAyMDE5IGF0IDA0OjA0OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDA5LjEyLjIwMTkgMTU6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIE1vbiwg
RGVjIDA5LCAyMDE5IGF0IDAzOjIxOjI4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gT24gMDkuMTIuMjAxOSAxMToyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+PiBP
biBXZWQsIERlYyAwNCwgMjAxOSBhdCAwNjowNToxMVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4gT24gMDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4+Pj4+Pj4+IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA1OjExOjQyUE0gKzAxMDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+IE9uIDA0LjEyLjIwMTkgMTY6MTIsIFJvZ2VyIFBhdSBN
b25uZSB3cm90ZToKPj4+Pj4+Pj4+Pj4gQEAgLTEzMCw3ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25n
IHB2X21ha2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+Pj4+Pj4+Pj4+PiAgICAgICAqLwo+
Pj4+Pj4+Pj4+PiAgICAgIGlmICggZC0+YXJjaC5wdi5wY2lkICkKPj4+Pj4+Pj4+Pj4gICAgICAg
ICAgY3I0IHw9IFg4Nl9DUjRfUENJREU7Cj4+Pj4+Pj4+Pj4+IC0gICAgZWxzZSBpZiAoICFkLT5h
cmNoLnB2LnhwdGkgKQo+Pj4+Pj4+Pj4+PiArICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54cHRp
ICYmIG9wdF9nbG9iYWxfcGFnZXMgKQo+Pj4+Pj4+Pj4+PiAgICAgICAgICBjcjQgfD0gWDg2X0NS
NF9QR0U7Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJJ20gc29ycnkgZm9yIG5vdGljaW5nIHRoaXMg
b25seSBub3csIGJ1dCB3aGF0IGFib3V0IFhFTl9NSU5JTUFMX0NSNCwKPj4+Pj4+Pj4+PiB3aGlj
aCBpbmNsdWRlcyBYODZfQ1I0X1BHRT8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJJ3ZlIHRyaWVkIHJl
bW92aW5nIFBHRSBmcm9tIFhFTl9NSU5JTUFMX0NSNCBidXQgaXQgbWFkZSBubyBub3RpY2VhYmxl
Cj4+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlLCBzbyBJIGxlZnQgaXQgYXMtaXMuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IE15IGNvbmNlcm4gaXNuJ3QgYWJvdXQgcGVyZm9ybWFuY2UsIGJ1dCBj
b3JyZWN0bmVzcy4gSSBhZG1pdCBJCj4+Pj4+Pj4+IGZvcmdvdCBmb3IgYSBtb21lbnQgdGhhdCB3
ZSBub3cgYWx3YXlzIHdyaXRlIENSNCAodW5sZXNzIHRoZQo+Pj4+Pj4+PiBjYWNoZWQgdmFsdWUg
bWF0Y2hlcyB0aGUgaW50ZW5kZWQgbmV3IG9uZSkuIFlldAo+Pj4+Pj4+PiBtbXVfY3I0X2ZlYXR1
cmVzIChzdGFydGluZyBvdXQgYXMgWEVOX01JTklNQUxfQ1I0KSBpcyBzdGlsbCBvZgo+Pj4+Pj4+
PiBjb25jZXJuLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgYXQgbGVhc3QgcmVxdWly
ZXMgZXh0ZW5kaW5nIHRoZSBkZXNjcmlwdGlvbiB0bwo+Pj4+Pj4+PiBkaXNjdXNzIHRoZSBjb3Jy
ZWN0bmVzcy4KPj4+Pj4+Pgo+Pj4+Pj4+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggYWRkaW5nIHRo
ZSBmb2xsb3dpbmcgYXQgdGhlIGVuZCBvZiB0aGUgY29tbWl0Cj4+Pj4+Pj4gbWVzc2FnZS4KPj4+
Pj4+Pgo+Pj4+Pj4+ICJOb3RlIHRoYXQgWEVOX01JTklNQUxfQ1I0IGlzIG5vdCBtb2RpZmllZCwg
YW5kIHRodXMgZ2xvYmFsIHBhZ2VzIGFyZQo+Pj4+Pj4+IGxlZnQgZW5hYmxlZCBmb3IgdGhlIGh5
cGVydmlzb3IuIFRoaXMgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIGNvZGUKPj4+Pj4+PiB0
byBzd2l0Y2ggdGhlIGNvbnRyb2wgcmVnaXN0ZXJzIChjcjMgYW5kIGNyNCkgYWxyZWFkeSB0YWtl
cyBpbnRvCj4+Pj4+Pj4gYWNjb3VudCBzdWNoIHNpdHVhdGlvbiBhbmQgcGVyZm9ybXMgdGhlIG5l
Y2Vzc2FyeSBmbHVzaGVzLiBUaGUgc2FtZQo+Pj4+Pj4+IGFscmVhZHkgaGFwcGVucyB3aGVuIHVz
aW5nIFhQVEkgb3IgUENJREUsIGFzIHRoZSBndWVzdCBjcjQgZG9lc24ndAo+Pj4+Pj4+IGhhdmUg
Z2xvYmFsIHBhZ2VzIGVuYWJsZWQgaW4gdGhhdCBjYXNlIGVpdGhlci4iCj4+Pj4+Pgo+Pj4+Pj4g
WWVzLCB0aGlzIGlzIGdvb2QgZm9yIFhFTl9NSU5JTUFMX0NSNC4gQnV0IEkgdGhpbmsgbW11X2Ny
NF9mZWF0dXJlcwo+Pj4+Pj4gbmVlZHMgZGlzY3Vzc2luZyAob3IgYXQgbGVhc3QgbWVudGlvbmlu
ZywgaWYgdGhlIHNhbWUgYXJndW1lbnRzCj4+Pj4+PiBhcHBseSkgYXMgd2VsbC4KPj4+Pj4KPj4+
Pj4gVGhlIHNhbWUgYXBwbGllcyB0byBtbXVfY3I0X2ZlYXR1cmVzLCBpdCdzIGZpbmUgZm9yIHRo
ZSBoeXBlcnZpc29yIHRvCj4+Pj4+IHVzZSBhIGRpZmZlcmVudCBzZXQgb2YgY3I0IGZlYXR1cmVz
IChlc3BlY2lhbGx5IFBHRSkgdGhhbiBQViBndWVzdHM6Cj4+Pj4+IHRoaXMgaXMgYWxyZWFkeSB0
aGUgY2FzZSB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUgd2hlbiBYZW4gY3I0IHdpbGwKPj4+Pj4g
aGF2ZSBQR0UgYW5kIGd1ZXN0cyBjcjQgd29uJ3QsIGFuZCBzd2l0Y2hfY3IzX2NyNCBEVFJULgo+
Pj4+Pgo+Pj4+PiBTbyBJIHdvdWxkIHMvWEVOX01JTklNQUxfQ1I0L1hFTl9NSU5JTUFMX0NSNCBh
bmQgbW11X2NyNF9mZWF0dXJlcy8gaW4KPj4+Pj4gdGhlIGFib3ZlIHByb3Bvc2VkIHBhcmFncmFw
aC4KPj4+Pgo+Pj4+IEknbSBhZnJhaWQgaXQncyBtb3JlIGNvbXBsaWNhdGVkLCB1cCB0byBhbmQg
aW5jbHVkaW5nIHlvdSBtYWtpbmcgYQo+Pj4+IHBvc3NpYmxlIHByZS1leGlzdGluZyBidWcgd29y
c2U6IFRoZSBTMyByZXN1bWUgcGF0aCBsb2FkcyBDUjQgZnJvbQo+Pj4+IG1tdV9jcjRfZmVhdHVy
ZXMsIGJ1dCBkb2Vzbid0IHVwZGF0ZSB0aGUgaW4tbWVtb3J5IGNhY2hlIG9mIHRoZQo+Pj4+IHJl
Z2lzdGVyLgo+Pj4KPj4+IEFsbCBkb21haW5zIGFyZSBwYXVzZWQgYW5kIHRoZSBzY2hlZHVsZXIg
aXMgZGlzYWJsZWQgd2hlbiBkb2luZyBTMwo+Pj4gc3VzcGVuZC9yZXN1bWUsIGFuZCB0aGUgYWN0
dWFsIHN1c3BlbmQgYW5kIHJlc3VtZSBjb2RlIGlzIHJ1biBieSBhCj4+PiB0YXNrbGV0IHdoaWNo
IGlzIGV4ZWN1dGVkIGluIHRoZSBpZGxlIHZDUFUgY29udGV4dCAoc2luY2UgYWxsIGRvbWFpbnMK
Pj4+IGFyZSBwYXVzZWQpLCBhbmQgaGVuY2UgdGhlIHdyaXRlIG9mIENSNCB3aXRoIG1tdV9jcjRf
ZmVhdHVyZXMgaXMgZmluZQo+Pj4gYXMgZW50ZXJpbmcgZ3Vlc3QgY29udGV4dCBhZnRlciByZXN1
bWUgaXMgZ29pbmcgdG8gaW52b2x2ZSBhIGNhbGwgdG8KPj4+IHN3aXRjaF9jcjNfY3I0IGluIG9y
ZGVyIHRvIHN3aXRjaCBvdXQgb2YgdGhlIGlkbGUgdkNQVS4KPj4KPj4gQW5kIHN3aXRjaF9jcjNf
Y3I0KCkgaGFzCj4+Cj4+ICAgICBpZiAoIG9sZF9jcjQgIT0gY3I0ICkKPj4gICAgICAgICB3cml0
ZV9jcjQoY3I0KTsKPj4KPj4gd2l0aCBvbGRfY3I0IHJlYWQgZnJvbSB0aGUgY2FjaGUuCj4gCj4g
VGhhdCByZWFkIGZyb20gdGhlIGNhY2hlIGlzIGZpbmUuIFRoZSBpZGxlIHZDUFUgY3I0IGlzCj4g
bW11X2NyNF9mZWF0dXJlcyAoc2VlIHdyaXRlX3B0YmFzZSksIGFuZCBoZW5jZSB0aGUgd3JpdGUg
ZG9uZSBpbgo+IF9fcmV0X3BvaW50IHNob3VsZCBtYXRjaCB3aGF0J3MgaW4gdGhlIGNhY2hlLgoK
QWggeWVzLgoKPj4+IEl0IG1pZ2h0IGJlIGNsZWFyZXIgdG8ganVzdCBzYXZlIGNyNCBpbiBkb19z
dXNwZW5kX2xvd2xldmVsIGxpa2UgaXQncwo+Pj4gZG9uZSB3aXRoIHRoZSByZXN0IG9mIHRoZSBj
b250cm9sIHJlZ2lzdGVycy4KPj4KPj4gTm90IGp1c3QgbW9yZSBjbGVhciwgYnV0IGFsc28gbW9y
ZSByZWxpYWJsZS4KPiAKPiBMZXQgbWUgcHJlcGFyZSBhIHBhdGNoIHRvIGltcHJvdmUgdGhpcywg
YnV0IEkgdGhpbmsgdGhlIGN1cnJlbnQgcGF0Y2gKPiBhdCBoYW5kIGlzIGNvcnJlY3QgYW5kIHNo
b3VsZG4ndCBiZSBibG9ja2VkIGJ5IHRoaXMgc3VzcGVuZC9yZXN1bWUKPiBpbXByb3ZlbWVudC4K
CkZpbmUgd2l0aCBtZSwgYnV0IHBsZWFzZSByZS1wb3N0IHdpdGggdGhlIGVuaGFuY2VkIGRlc2Ny
aXB0aW9uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
