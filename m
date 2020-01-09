Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA7613560F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 10:46:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipULt-00055W-9l; Thu, 09 Jan 2020 09:43:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipULr-00055R-EF
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 09:43:39 +0000
X-Inumbo-ID: 7e5d78be-32c4-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e5d78be-32c4-11ea-a985-bc764e2007e4;
 Thu, 09 Jan 2020 09:43:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 872B9C065;
 Thu,  9 Jan 2020 09:43:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
 <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
 <20200108132819.GO11756@Air-de-Roger>
 <fc2390d0-b475-84c6-d76a-881f73cd288e@suse.com>
 <20200108181445.GV11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eab75a49-da7b-c611-2eca-ea4a322dc1e1@suse.com>
Date: Thu, 9 Jan 2020 10:43:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108181445.GV11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxOToxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAwOCwgMjAyMCBhdCAwMjo1NDo1N1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDguMDEuMjAyMCAxNDozMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+PiBPbiBGcmksIEph
biAwMywgMjAyMCBhdCAwMTo1NTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBP
biAwMy4wMS4yMDIwIDEzOjM0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBGcmks
IEphbiAwMywgMjAyMCBhdCAwMTowODoyMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4+IE9uIDI0LjEyLjIwMTkgMTM6NDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+IEZ1
cnRoZXIgYSBxdWVzdGlvbiBvbiBsb2NrIG5lc3Rpbmc6IFNpbmNlIHRoZSBjb21taXQgbWVzc2Fn
ZQo+Pj4+Pj4gZG9lc24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQsIGRpZCB5b3UgY2hl
Y2sgdGhlcmUgYXJlIG5vCj4+Pj4+PiBUTEIgZmx1c2ggaW52b2NhdGlvbnMgd2l0aCB0aGUgZ2V0
X2NwdV9tYXBzKCkgbG9jayBoZWxkPwo+Pj4+Pgo+Pj4+PiBUaGUgQ1BVIG1hcHMgbG9jayBpcyBh
IHJlY3Vyc2l2ZSBvbmUsIHNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGF0dGVtcHQKPj4+Pj4gYSBU
TEIgZmx1c2ggd2l0aCB0aGUgbG9jayBhbHJlYWR5IGhlbGQuCj4+Pj4KPj4+PiBXaGVuIGFscmVh
ZHkgaGVsZCBieSB0aGUgc2FtZSBDUFUgLSBzdXJlLiBJdCBiZWluZyBhIHJlY3Vyc2l2ZQo+Pj4+
IG9uZSAod2hpY2ggSSBwYWlkIGF0dGVudGlvbiB0byB3aGVuIHdyaXRpbmcgbXkgZWFybGllciBy
ZXBseSkKPj4+PiBkb2Vzbid0IG1ha2UgaXQgKHRvZ2V0aGVyIHdpdGggYW55IG90aGVyIG9uZSkg
aW1tdW5lIGFnYWluc3QKPj4+PiBBQkJBIGRlYWRsb2NrcywgdGhvdWdoLgo+Pj4KPj4+IFRoZXJl
J3Mgbm8gcG9zc2liaWxpdHkgb2YgYSBkZWFkbG9jayBoZXJlIGJlY2F1c2UgZ2V0X2NwdV9tYXBz
IGRvZXMgYQo+Pj4gdHJ5bG9jaywgc28gaWYgYW5vdGhlciBjcHUgaXMgaG9sZGluZyB0aGUgbG9j
ayB0aGUgZmx1c2ggd2lsbCBqdXN0Cj4+PiBmYWxsYmFjayB0byBub3QgdXNpbmcgdGhlIHNob3J0
aGFuZC4KPj4KPj4gV2VsbCwgd2l0aCB0aGUgX2V4YWN0XyBhcnJhbmdlbWVudHMgKGZsdXNoX2xv
Y2sgdXNlZCBvbmx5IGluIG9uZQo+PiBwbGFjZSwgYW5kIGNwdV9hZGRfcmVtb3ZlX2xvY2sgb25s
eSB1c2VkIGluIHdheXMgc2ltaWxhciB0byBob3cgaXQKPj4gaXMgdXNlZCBub3cpLCB0aGVyZSdz
IG5vIHN1Y2ggcmlzaywgSSBhZ3JlZS4gQnV0IHRoZXJlJ3Mgbm90aGluZwo+PiBhdCBhbGwgbWFr
aW5nIHN1cmUgdGhpcyBkb2Vzbid0IGNoYW5nZS4gSGVuY2UsIGFzIHNhaWQsIGF0IHRoZSB2ZXJ5
Cj4+IGxlYXN0IHRoaXMgbmVlZHMgcmVhc29uaW5nIGFib3V0IGluIHRoZSBkZXNjcmlwdGlvbiAo
b3IgYSBjb2RlCj4+IGNvbW1lbnQpLgo+IAo+IEknbSBhZnJhaWQgeW91IHdpbGwgaGF2ZSB0byBi
ZWFyIHdpdGggbWUsIGJ1dCBJJ20gc3RpbGwgbm90IHN1cmUgaG93Cj4gdGhlIGFkZGl0aW9uIG9m
IGdldF9jcHVfbWFwcyBpbiBmbHVzaF9hcmVhX21hc2sgY2FuIGxlYWQgdG8gZGVhZGxvY2tzLgo+
IEFzIHNhaWQgYWJvdmUgZ2V0X2NwdV9tYXBzIGRvZXMgYSB0cnlsb2NrLCB3aGljaCBtZWFucyB0
aGF0IGl0IHdpbGwKPiBuZXZlciBkZWFkbG9jaywgYW5kIHRoYXQncyB0aGUgb25seSB3YXkgdG8g
bG9jayBjcHVfYWRkX3JlbW92ZV9sb2NrLgoKVGhhdCdzIHdoeSBJIHNhaWQgImNwdV9hZGRfcmVt
b3ZlX2xvY2sgb25seSB1c2VkIGluIHdheXMgc2ltaWxhciB0bwpob3cgaXQgaXMgdXNlZCBub3ci
IC0gYW55IG5vbi10cnlsb2NrIGFkZGl0aW9uIHdvdWxkIGJyZWFrIHRoZQphc3N1bXB0aW9ucyB5
b3UgbWFrZSBhZmFpY3QuIEFuZCB5b3UgY2FuJ3QgcmVhbGx5IGV4cGVjdCBwZW9wbGUKYWRkaW5n
IGFub3RoZXIgKHNsaWdodGx5IGRpZmZlcmVudCkgdXNlIG9mIGFuIGV4aXN0aW5nIGxvY2sgdG8g
YmUKYXdhcmUgdGhleSBub3cgbmVlZCB0byBjaGVjayB3aGV0aGVyIHRoaXMgaW50cm9kdWNlcyBk
ZWFkbG9jawpzY2VuYXJpb3Mgb24gdW5yZWxhdGVkIHByZS1leGlzdGluZyBjb2RlIHBhdGhzLiBI
ZW5jZSBteSByZXF1ZXN0IHRvCmF0IGxlYXN0IGRpc2N1c3MgdGhpcyBpbiB0aGUgZGVzY3JpcHRp
b24gKHJhaXNpbmcgYXdhcmVuZXNzLCBhbmQKaGVuY2UgYWxsb3dpbmcgcmV2aWV3ZXJzIHRvIGp1
ZGdlIHdoZXRoZXIgZnVydGhlciBwcmVjYXV0aW9uYXJ5Cm1lYXN1cmVzIHNob3VsZCBiZSB0YWtl
bikuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
