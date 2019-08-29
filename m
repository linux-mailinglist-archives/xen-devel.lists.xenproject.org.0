Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C4A1BB8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 15:44:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3KgK-00068c-Vd; Thu, 29 Aug 2019 13:41:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3KgJ-00068X-Lh
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:41:43 +0000
X-Inumbo-ID: bc4f712e-ca62-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4f712e-ca62-11e9-951b-bc764e2007e4;
 Thu, 29 Aug 2019 13:41:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63AF1B623;
 Thu, 29 Aug 2019 13:41:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <f42b05e7-22de-64b0-0486-c087bde57747@suse.com>
 <95c5ada0-5b77-072f-7ad5-c78c20c3f760@citrix.com>
 <d96c8af0-f70f-03ad-c058-c1f46114846a@suse.com>
 <e5d14e95-01ee-5879-88b6-1d63610ec490@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1ec5a2e-cb26-1e2f-da5b-57e501fc998b@suse.com>
Date: Thu, 29 Aug 2019 15:41:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5d14e95-01ee-5879-88b6-1d63610ec490@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: properly gate clearing of PKU feature
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxNToyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wOC8yMDE5
IDE0OjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMDguMjAxOSAxMjo0NiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI5LzA4LzIwMTkgMTA6MjcsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IHNldHVwX2NsZWFyX2NwdV9jYXAoKSBpcyBfX2luaXQgYW5kIGhlbmNlIG1heSBub3Qg
YmUgY2FsbGVkIHBvc3QtYm9vdC4KPj4+PiBOb3RlIHRoYXQgb3B0X3BrdSBuZXZlcnRoZWxlc3Mg
aXMgbm90IGdldHRpbmcgX19pbml0ZGF0YSBhZGRlZCAtIHNlZQo+Pj4+IGUuZy4gY29tbWl0IDQz
ZmE5NWFlNmEgKCJtbTogbWFrZSBvcHRfYm9vdHNjcnViIG5vbi1pbml0IikuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+Cj4+PiBIb3dl
dmVyLCBJJ20gdGVtcHRlZCB0byBzdWdnZXN0IHRoYXQgdGhpcyBsb2dpYyBkaXNhcHBlYXJzIGVu
dGlyZWx5LsKgCj4+PiBHaXZlbiB0aGF0IHdlIGRvbid0IHN1cHBvcnQgaXQgZm9yIFBWIGd1ZXN0
cywgYW5kIGNhbid0IHdpdGhvdXQgdGFraW5nIGEKPj4+IENSNCB3cml0ZSBvbiB0b2dnbGVfa2Vy
bmVsX21vZGUoKSwgYWxsIHRoaXMgYWN0dWFsbHkgY29udHJvbHMgaXMgd2hldGhlcgo+Pj4gdGhl
IGJpdCBmaW5kcyBpdHMgd2F5IGludG8gdGhlIEhWTSBtYXggcG9saWN5Lgo+PiBXZWxsLCBpZiB5
b3UgbWVhbiByZXBsYWNpbmcgb3B0X3BrdSBieSBhbiBhZGRpdGlvbiB0bwo+PiBwYXJzZV94ZW5f
Y3B1aWQoKSwgdGhlbiBJJ2xsIGJlIGhhcHB5IHRvIGRvIHRoYXQgYXMgYSBmb2xsb3ctb24uCj4+
IElmIHRoZXJlIGlzIGFub3RoZXIgZGlyZWN0aW9uIHlvdSd2ZSBiZWVuIGNvbnNpZGVyaW5nLCB0
aGVuCj4+IHlvdSdkIGhhdmUgdG8gYXQgbGVhc3Qgb3V0bGluZSBpdC4KPiAKPiBXZWxsIC0gSSBk
aWQgc2F5ICJkaXNhcHBlYXIgZW50aXJlbHkiLsKgIEkgZG9uJ3Qgc2VlIGl0IGFzIGhhdmluZywg
b3IKPiBsaWFibGUgdG8gZ2FpbiwgYW55IHVzZWZ1bCBwdXJwb3NlLgo+IAo+IEluIHJlYWxpdHks
IGl0IHdhcyBzdWJzdW1lZCBpbnRvIGNwdWlkPSBieSBteSBwYXRjaCB0byBhbGxvdyBhbGwgYml0
cyB0bwo+IGJlIHR3ZWFrLWFibGUuCgpEaWQgeW91IHBvc3QgdGhpcyBwYXRjaCBhbHJlYWR5IChJ
IGRvbid0IHNlZW0gdG8gcmVjYWxsOyBJIG9ubHkgcmVjYWxsCnRoZXJlIGJlaW5nIHRoZSBwbGFu
IHRvIGRvIHRoaXMpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
