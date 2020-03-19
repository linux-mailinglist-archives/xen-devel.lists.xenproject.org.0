Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668EE18B01E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 10:24:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jErNN-0005CA-JD; Thu, 19 Mar 2020 09:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jErNL-0005C0-Ob
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:22:03 +0000
X-Inumbo-ID: 17671a8a-69c3-11ea-bbd6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17671a8a-69c3-11ea-bbd6-12813bfff9fa;
 Thu, 19 Mar 2020 09:22:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2755ADBE;
 Thu, 19 Mar 2020 09:22:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
 <080ba22f-f79d-1e50-71ba-ef3d2653e920@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9168f174-1f75-86cd-267d-0b4bcd3a07e5@suse.com>
Date: Thu, 19 Mar 2020 10:21:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <080ba22f-f79d-1e50-71ba-ef3d2653e920@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAyMjo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMy8yMDIw
IDIxOjA1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBTcGxpdCB0aGUgZXhpc3RpbmcgYXNtL21p
Y3JvY29kZS5oIGluIGhhbGYsIGtlZXBpbmcgdGhlIHBlci1jcHUgY3B1X3NpZwo+PiBhdmFpbGFi
bGUgdG8gZXh0ZXJuYWwgdXNlcnMsIGFuZCBtb3ZpbmcgZXZlcnl0aGluZyBlbHNlIGludG8gcHJp
dmF0ZS5oCj4+Cj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHRyaW0gYW5kIGNsZWFuIHVwIHRo
ZSBpbmNsdWRlIGxpc3RzIGZvciBhbGwgMyBzb3VyY2UKPj4gZmlsZXMsIGFsbCBvZiB3aGljaCBp
bmNsdWRlIHJhdGhlciBtb3JlIHRoYW4gbmVjZXNzYXJ5Lgo+Pgo+PiBObyBmdW5jdGlvbmFsIGNo
YW5nZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPj4gLS0tCj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
Cj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IEluY2x1c2lvbiBvZiBhc20vZmx1c2h0bGIuaCBpbiBp
c29sYXRpb24gd2FzIGJyb2tlbiBieSBjL3MgODA5NDNhYTQwZSwgYW5kIHRoZQo+PiBjb21taXQg
bWVzc2FnZSBldmVuIHN0YXRlcyB0aGlzIGJyZWFrYWdlLiAgSSdtIHN1cnByaXNlZCBpdCBnb3Qg
YWNjZXB0ZWQuCj4+Cj4+IEVpdGhlciB0aGlzIG5lZWRzIGZpeGluZywgb3IgdGhlIDIzKCEpIG90
aGVyIGZpbGVzIGluY2x1ZGluZyBhc20vZmx1c2h0bGIuaAo+PiBzaG91bGQgYmUgYWRqdXN0ZWQu
ICBQZXJzb25hbGx5IEkgZG9uJ3QgdGhpbmsgaXQgaXMgcmVhc29uYWJsZSB0byByZXF1aXJlCj4+
IGluY2x1ZGluZyB4ZW4vbW0uaCBqdXN0IHRvIGdldCBhdCB0bGIgZmx1c2hpbmcgZnVuY3Rpb25h
bGl0eSwgYnV0IEkgYWxzbyBjYW4ndAo+PiBzcG90IGFuIG9idmlvdXMgd2F5IHRvIHVudGFuZ2xl
IHRoZSBkZXBlbmRlbmNpZXMgKGhlbmNlIHRoZSBUT0RPKS4KPiAKPiBBY3R1YWxseSwgSSd2ZSBm
b3VuZCB0aGF0IG1pY3JvY29kZV9mcmVlX3BhdGNoKCkgaGFzIG5vIGV4dGVybmFsIGNhbGxlcnMu
Cj4gCj4gSSd2ZSBmb2xkZWQgdGhlIGZvbGxvd2luZyBkZWx0YSBpbiwgdG8gYXZvaWQgbW92aW5n
IGEgdXNlbGVzcyBmdW5jdGlvbgo+IGRlY2xhcmF0aW9uCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9taWNyb2NvZGUvY29yZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS9jb3JlLmMK
PiBpbmRleCBlOTlmNGFiMDZjLi4xOWUxZDRiMjIxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGUvY29yZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS9jb3JlLmMK
PiBAQCAtMjQzLDcgKzI0Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXJz
ZV9ibG9iKGNvbnN0IGNoYXIKPiAqYnVmLCBzaXplX3QgbGVuKQo+IMKgwqDCoMKgIHJldHVybiBO
VUxMOwo+IMKgfQo+IMKgCj4gLXZvaWQgbWljcm9jb2RlX2ZyZWVfcGF0Y2goc3RydWN0IG1pY3Jv
Y29kZV9wYXRjaCAqbWljcm9jb2RlX3BhdGNoKQo+ICtzdGF0aWMgdm9pZCBtaWNyb2NvZGVfZnJl
ZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfcGF0Y2gpCj4gwqB7Cj4g
wqDCoMKgwqAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRjaChtaWNyb2NvZGVfcGF0Y2gtPm1jKTsK
PiDCoMKgwqDCoCB4ZnJlZShtaWNyb2NvZGVfcGF0Y2gpOwo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbWljcm9jb2RlL3ByaXZhdGUuaAo+IGIveGVuL2FyY2gveDg2L21pY3JvY29kZS9wcml2
YXRlLmgKPiBpbmRleCA5N2M3NDA1ZGFkLi4yZTNiZTc5ZWFmIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9taWNyb2NvZGUvcHJpdmF0ZS5oCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29k
ZS9wcml2YXRlLmgKPiBAQCAtMzQsNiArMzQsNCBAQCBzdHJ1Y3QgbWljcm9jb2RlX29wcyB7Cj4g
wqAKPiDCoGV4dGVybiBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX29wcyAqbWljcm9jb2RlX29wczsK
PiDCoAo+IC12b2lkIG1pY3JvY29kZV9mcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gg
KnBhdGNoKTsKPiAtCj4gwqAjZW5kaWYgLyogQVNNX1g4Nl9NSUNST0NPREVfUFJJVkFURV9IICov
Cj4gCj4gCj4gQWx0ZXJuYXRpdmVseSwgSSBtaWdodCBjb25zaWRlciBwdWxsaW5nIHRoaXMgYW5k
IHRoZSBzaW1pbGFyIGNoYW5nZSB0bwo+IGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1KCkgaW50
byBhbiBlYXJsaWVyIHBhdGNoLCB0byBzZXBhcmF0ZSB0aGUKPiBzdGF0aWMtaW5nIG9mIGZ1bmN0
aW9ucyBmcm9tIHRoZSBnZW5lcmFsIG1vdmluZyBvZiBjb2RlL2RlY2xhcmF0aW9ucy4KPiAKPiBU
aG91Z2h0cz8KCkVpdGhlciB3YXkgaXMgZmluZSBieSBtZSwgYW5kIGNhbiBoYXZlIG15IGFjayBy
aWdodCBhd2F5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
