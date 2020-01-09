Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417DF135CDF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 16:36:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipZox-0005Sv-EY; Thu, 09 Jan 2020 15:34:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipZow-0005Sq-4X
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 15:34:02 +0000
X-Inumbo-ID: 75a19ce2-32f5-11ea-b9fa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75a19ce2-32f5-11ea-b9fa-12813bfff9fa;
 Thu, 09 Jan 2020 15:34:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 421C4ABBD;
 Thu,  9 Jan 2020 15:34:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
 <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
 <20200109151010.GC11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <259d98b3-5d27-a856-a457-4e7c37004982@suse.com>
Date: Thu, 9 Jan 2020 16:34:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109151010.GC11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxNjoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEph
biAwOSwgMjAyMCBhdCAwNjo0MToxMkFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+
IE9uIFRodSwgSmFuIDksIDIwMjAgYXQgMzoyOSBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPj4+Cj4+PiBIaSBUYW1hcywKPj4+Cj4+PiBPbiAwOC8wMS8yMDIwIDE3OjE0
LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+Pj4gK3N0YXRpYyBpbnQgbWVtX3NoYXJpbmdfZm9y
ayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPj4+PiArewo+Pj4+ICsgICAg
aW50IHJjOwo+Pj4+ICsKPj4+PiArICAgIGlmICggIWQtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQg
JiYKPj4+PiArICAgICAgICAgKHJjID0gZG9tYWluX3BhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIo
ZCkpICkKPj4+Cj4+PiBBRkFJVSwgdGhlIHBhcmVudCBkb21haW4gd2lsbCBiZSBwYXVzZWQgaWYg
aXQgd2Fzbid0IHBhdXNlZCBiZWZvcmUgYW5kCj4+PiB0aGlzIHdpbGwgbm90IGJlIHVucGF1c2Vk
IGJ5IHRoZSBzYW1lIGh5cGVyY2FsbC4gUmlnaHQ/Cj4+Cj4+IFllcywgaXQgbmVlZHMgdG8gcmVt
YWluIHBhdXNlZCBhcyBsb25nIGFzIHRoZXJlIGFyZSBmb3JrcyBhY3RpdmUgZnJvbQo+PiBpdC4g
QWZ0ZXJ3YXJkcyBpdCBjYW4gYmUgdW5wYXVzZWQuCj4gCj4gSWYgeW91IHdhbnQgdGhlIHBhcmVu
dCBkb21haW4gdG8gcmVtYWluIHBhdXNlZCBmb3IgYXMgbG9uZyBhcyB0aGUKPiBmb3JrcyBhcmUg
YWN0aXZlLCBzaG91bGRuJ3QgZWFjaCBmb3JrIGluY3JlbWVudCB0aGUgcGF1c2UgY291bnQgb24K
PiBjcmVhdGlvbiBhbmQgZGVjcmVtZW50IGl0IHdoZW4gdGhlIGZvcmsgaXMgZGVzdHJveWVkPwo+
IAo+IEhvdyBjYW4geW91IGFzc3VyZSBubyBvdGhlciBvcGVyYXRpb24gb3IgZW50aXR5IGhhcyBp
bmNyZW1lbnRlZAo+IGNvbnRyb2xsZXJfcGF1c2VfY291bnQgdGVtcG9yYXJ5IGFuZCBpcyBsaWtl
bHkgdG8gZGVjcmVtZW50IGl0IGF0IHNvbWUKPiBwb2ludCB3aGlsZSBmb3JrcyBhcmUgc3RpbGwg
YWN0aXZlPwoKVGhlIF9ieV9zeXN0ZW1jb250cm9sbGVyIHZhcmlhbnRzIGxvb2sgd3JvbmcgdG8g
YmUgdXNlZCBoZXJlIGFueXdheS4KV2h5IGlzIHRoaXMgbm90IHNpbXBseSBkb21haW5feyx1bn1w
YXVzZSgpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
