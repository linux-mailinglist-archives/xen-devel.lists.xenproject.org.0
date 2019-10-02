Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A354C4A73
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:20:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFalF-00063F-Pw; Wed, 02 Oct 2019 09:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFalE-00063A-Fa
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:17:28 +0000
X-Inumbo-ID: 7336a7df-e4f5-11e9-9712-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7336a7df-e4f5-11e9-9712-12813bfff9fa;
 Wed, 02 Oct 2019 09:17:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70291AE8A;
 Wed,  2 Oct 2019 09:17:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
 <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
 <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
 <39e9ad3d-e3b0-e5c3-f115-33af4e2ee688@suse.com>
 <dfcfd2dc-65cb-e11b-0db2-535322c8275c@citrix.com>
 <9ee0114c-41ba-5d8e-1aef-5bccf1fb15dc@suse.com>
 <ce240495-a64f-db54-4162-890d0c524df7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bd70e24-4a0f-20ef-c847-3bc82aa35325@suse.com>
Date: Wed, 2 Oct 2019 11:17:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ce240495-a64f-db54-4162-890d0c524df7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxMDo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMi8xMC8yMDE5
IDA4OjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTAuMjAxOSAyMTo0NCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEluIHRoaXMgZXhhbXBsZSwgaGFyZHdhcmUgY2FuIHRoZSBlbXVs
YXRvciBjYW4gZGlzYWdyZWUgYnkgdXNpbmcgYQo+Pj4gZGlmZmVyZW50IGFjY2VzcyB3aWR0aC4K
Pj4+Cj4+PiBJJ3ZlIGJlZW4gZXhwZXJpbWVudGluZyB3aXRoIG15IFJvbWUgc3lzdGVtLCBhbmQg
YW4gZW11bGF0b3IgaGFyZGNvZGVkCj4+PiB0byB1c2UgMi1ieXRlIGFjY2Vzc2VzLsKgIEFmdGVy
IHNvbWUgaW52ZXN0aWdhdGlvbiwgdGhlIGxpdmVsb2NrIG9ubHkKPj4+IG9jY3VycyBmb3IgYWNj
ZXNzLXJpZ2h0cyBmYXVsdHMuwqAgVHJhbnNsYXRpb24gZmF1bHRzIGdldCBpZGVudGlmaWVkIGFz
Cj4+PiBub3QgYSBzaGFkb3cgZmF1bHQsIGFuZCBib3VuY2VkIGJhY2sgdG8gdGhlIGd1ZXN0Lgo+
Pj4KPj4+IFNoYWRvdyBndWVzdHMgY2FuIHVzZSBQS1JVLCBzbyBjYW4gZ2VuZXJhdGUgYW4gYWNj
ZXNzIGZhdWx0IGJ5IG1hcmtpbmcKPj4+IHRoZSBwYWdlIGF0IDB4MjAwMCBhcyBuby1hY2Nlc3Ms
IHNvIEkgdGhpbmsgdGhhdCBpbiBwcmluY2lwbGUsIHRoaXMKPj4+IGNoYW5nZSB3aWxsIHJlc3Vs
dCBpbiBhIG5ldyBsYXRlbnQgbGl2ZWxvY2sgY2FzZSwgYnV0IEkgY2FuJ3QgYWN0dWFsbHkKPj4+
IGNvbmZpcm0gaXQuCj4+IEkgdGhpbmsgSSBzZWUgd2hhdCB5b3UgbWVhbiwgYnV0IHRoZW4gSSBk
b24ndCBzZWUgaG93IHRoaXMgaXMgYW4KPj4gYXJndW1lbnQgYWdhaW5zdCB0aGUgcGF0Y2ggaW4g
aXRzIGN1cnJlbnQgc2hhcGU6IEl0IGFjdHVhbGx5Cj4+IHJlZHVjZXMgdGhlIGNhc2VzIG9mIGRp
c2FncmVlbWVudCBiZXR3ZWVuIGhhcmR3YXJlIGFuZCBlbXVsYXRvci4KPiAKPiBBdCB0aGUgbW9t
ZW50LCB0aGUgZW11bGF0b3IgaXMgc3RyaWN0bHkgNCBieXRlcywgYW5kIGhhcmR3YXJlIG1heSBi
ZSA0Cj4gb3IgMi7CoCBUaGVyZWZvcmUsIHRoZXJlIGlzIG5vIGNoYW5jZSBvZiB0aGUgcGlwZWxp
bmUgeWllbGRpbmcgI1BGIHdoaWxlCj4gdGhlIGVtdWxhdG9yIHlpZWxkaW5nIE9LLgoKQXQgdGhl
IGV4cGVuc2Ugb2YgcG9zc2libHkgeWllbGRpbmcgI1BGIHdoZW4gdGhlIHBpcGVsaW5lIHdvdWxk
bid0LgoKPiBXaXRoIHRoZSBjaGFuZ2UgaW4gcGxhY2UsIG9sZGVyIEludGVsIHBhcnRzIHdoaWNo
IGRvIHVzZSBhIDQgYnl0ZSBhY2Nlc3MKPiBub3cgY29tZSB3aXRoIGEgcmlzayBvZiBsaXZlbG9j
ay7CoCBXaGljaGV2ZXIgcGFydHMgdGhlc2UgYXJlLCB0aGV5Cj4gcHJlZGF0ZSBQS1JVIHNvIGlu
IHRoaXMgc3BlY2lmaWMgY2FzZSwgdGhlIHByb2JsZW0gaXMgb25seSB0aGVvcmV0aWNhbAo+IEFG
QUlDVC4KClBsdXMgYXQgdGhpcyBwb2ludCB3ZSBkb24ndCBldmVuIGtub3cgd2hldGhlciB0aGVy
ZSBhcmUgYW55IHN1Y2gKcGFydHMuCgo+IEFsc28sIGluIHRoaXMgc3BlY2lmaWMgY2FzZSwgSW50
ZWwncyB3YXJuaW5nIG9mICJEb24ndCB1c2UgdGhpcwo+IGluc3RydWN0aW9uIHdpdGhvdXQgYSBS
RVggcHJlZml4IiBtZWFucyB0aGF0IHdlIHNob3VsZG4ndCBzZWUgaXQgaW4KPiBhbnl0aGluZyBi
dXQgdGVzdCBzY2VuYXJpb3MuCgpJdCdzIGV4dHJlbWVseSB1bmxpa2VseSBhdCBsZWFzdC4KCj4+
IE9uZSBwb3NzaWJpbGl0eSB0byBtYWtlIGEgZnVydGhlciBzdGVwIGluIHRoYXQgZGlyZWN0aW9u
IHdvdWxkCj4+IGJlIHRvIG1ha2UgYmVoYXZpb3IgZGVwZW5kZW50IHVwb24gdGhlIHVuZGVybHlp
bmcgaGFyZHdhcmUncwo+PiB2ZW5kb3IsIHJhdGhlciB0aGFuIHRoZSBvbmUgdGhlIGd1ZXN0IHNl
ZXMuCj4gCj4gSSBjb25zaWRlcmVkIHRoaXMuwqAgSXQgd291bGQgd29yayBvbiBuYXRpdmUgKGF0
IHRoZSBleHBlbnNlIG9mCj4gY29tcGxpY2F0aW5nIHRoZSBlbXVsYXRvciksIGJ1dCB3b24ndCB3
b3JrIHByb3Blcmx5IGlmIFhlbiBpcwo+IHZpcnR1YWxpc2llZCBhbmQgbWlncmF0ZWQuwqAgSSBj
YW4ndCBzZWUgYSB3YXkgYXJvdW5kIHRoaXMuCgpBcmUgeW91IGNvbmNlcm5lZCBhYm91dCBYZW4g
Z2V0dGluZyBjcm9zcy12ZW5kb3IgbWlncmF0ZWQ/IElmCnlvdSdkIGFjY2VwdCB0aGluZ3MgdG8g
bm90IGJlIDEwMCUgcmlnaHQgaW4gc3VjaCBhIGNhc2UsIEkgY291bGQKc2ltcGx5IHByb2JlIGhh
cmR3YXJlIHdoaWxlIGJvb3RpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
