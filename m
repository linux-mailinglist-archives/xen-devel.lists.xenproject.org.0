Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9BEB34F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 15:59:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQBsQ-0005Ul-Hr; Thu, 31 Oct 2019 14:56:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQBsP-0005Ug-Fk
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 14:56:41 +0000
X-Inumbo-ID: a49c5a49-fbee-11e9-9544-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a49c5a49-fbee-11e9-9544-12813bfff9fa;
 Thu, 31 Oct 2019 14:56:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6EBDB3D5;
 Thu, 31 Oct 2019 14:56:38 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2179120f-063c-7dfc-2a25-8403163bf04b@suse.com>
Date: Thu, 31 Oct 2019 15:56:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAxNTo1MiwgSm9lIEppbiB3cm90ZToKPiBPbiAxMC8zMS8xOSAxOjAxIEFN
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMTAuMjAxOSAxOTowMSwgSm9lIEppbiB3cm90
ZToKPj4+IE9uIDEwLzMwLzE5IDEwOjIzIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+
IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDA5OjM4OjE2QU0gLTA3MDAsIEpvZSBKaW4gd3JvdGU6
Cj4+Pj4+IE9uIDEwLzMwLzE5IDE6MjQgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+
PiBDYW4geW91IHRyeSB0byBhZGQgdGhlIGZvbGxvd2luZyBkZWJ1ZyBwYXRjaCBvbiB0b3Agb2Yg
dGhlIGV4aXN0aW5nCj4+Pj4+PiBvbmUgYW5kIHJlcG9ydCB0aGUgb3V0cHV0IHRoYXQgeW91IGdl
dCBvbiB0aGUgWGVuIGNvbnNvbGU/Cj4+Pj4+Cj4+Pj4+IEFwcGxpZWQgZGVidWcgcGF0Y2ggYW5k
IHJ1biB0aGUgdGVzdCBhZ2Fpbiwgbm90IG9mIGFueSBsb2cgcHJpbnRlZCwKPj4+Pj4gYXR0YWNo
ZWQgWGVuIGxvZyBvbiBzZXJpYWwgY29uc29sZSwgc2VlbXMgcGlfdXBkYXRlX2lydGUoKSBub3Qg
YmVlbgo+Pj4+PiBjYWxsZWQgZm9yIGlvbW11X2ludHBvc3Qgd2FzIGZhbHNlLgo+Pj4+Cj4+Pj4g
SSBoYXZlIHRvIGFkbWl0IEknbSBsb3N0IGF0IHRoaXMgcG9pbnQuIERvZXMgaXQgbWVhbiB0aGUg
b3JpZ2luYWwKPj4+PiBpc3N1ZSBoYWQgbm90aGluZyB0byBkbyB3aXRoIHBvc3RlZCBpbnRlcnJ1
cHRzPwo+Pj4KPj4+IExvb2tzIHdoZW4gaW5qZWN0IGlycSBieSB2bGFwaWNfc2V0X2lycSgpLCBp
dCBjaGVja2VkIGJ5Cj4+PiBodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50ciByYXRoZXIgdGhh
biBpb21tdV9pbnRwb3N0Ogo+Pj4KPj4+ICAxNzYgICAgIGlmICggaHZtX2Z1bmNzLmRlbGl2ZXJf
cG9zdGVkX2ludHIgKQo+Pj4gIDE3NyAgICAgICAgIGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9p
bnRyKHRhcmdldCwgdmVjKTsKPj4+Cj4+PiBBbmQgZGVsaXZlcl9wb3N0ZWRfaW50cigpIHdvdWxk
IGJlIHRoZXJlLCB3aGVuIHZteCBlbmFibGVkOgo+Pj4KPj4+IChYRU4pIEhWTTogVk1YIGVuYWJs
ZWQKPj4+IChYRU4pIEhWTTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRldGVjdGVk
Cj4+PiAoWEVOKSBIVk06IEhBUCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCCj4+Cj4+IEkgY2Fu
J3Qgc2VlIHRoZSBjb25uZWN0aW9uLiBzdGFydF92bXgoKSBoYXMKPj4KPj4gICAgIGlmICggY3B1
X2hhc192bXhfcG9zdGVkX2ludHJfcHJvY2Vzc2luZyApCj4+ICAgICB7Cj4+ICAgICAgICAgYWxs
b2NfZGlyZWN0X2FwaWNfdmVjdG9yKCZwb3N0ZWRfaW50cl92ZWN0b3IsIHBpX25vdGlmaWNhdGlv
bl9pbnRlcnJ1cHQpOwo+PiAgICAgICAgIGlmICggaW9tbXVfaW50cG9zdCApCj4+ICAgICAgICAg
ICAgIGFsbG9jX2RpcmVjdF9hcGljX3ZlY3RvcigmcGlfd2FrZXVwX3ZlY3RvciwgcGlfd2FrZXVw
X2ludGVycnVwdCk7Cj4+Cj4+ICAgICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLmRlbGl2ZXJfcG9z
dGVkX2ludHIgPSB2bXhfZGVsaXZlcl9wb3N0ZWRfaW50cjsKPj4gICAgICAgICB2bXhfZnVuY3Rp
b25fdGFibGUuc3luY19waXJfdG9faXJyICAgICA9IHZteF9zeW5jX3Bpcl90b19pcnI7Cj4+ICAg
ICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLnRlc3RfcGlyICAgICAgICAgICAgPSB2bXhfdGVzdF9w
aXI7Cj4+ICAgICB9Cj4+Cj4+IGkuZS4gdGhlIGhvb2sgaXMgcHJlc2VudCBvbmx5IHdoZW4gcG9z
dGVkIGludGVycnVwdHMgYXJlCj4+IGF2YWlsYWJsZSBpbiBnZW5lcmFsLiBJLmUuIGFsc28gd2l0
aCBqdXN0IENQVS1zaWRlIHBvc3RlZAo+PiBpbnRlcnJ1cHRzLCB5ZXMsIHdoaWNoIGdldHMgY29u
ZmlybWVkIGJ5IHlvdXIgImFwaWN2PTAiCj4+IHRlc3QuIFlldCB3aXRoIGp1c3QgQ1BVLXNpZGUg
cG9zdGVkIGludGVycnVwdHMgSSdtCj4+IHN0cnVnZ2xpbmcgYWdhaW4gdG8gdW5kZXJzdGFuZCB5
b3VyIG9yaWdpbmFsIHByb2JsZW0KPj4gZGVzY3JpcHRpb24sIGFuZCB0aGUgbmVlZCB0byBmaWRk
bGUgd2l0aCBJT01NVSBzaWRlIGNvZGUuCj4gCj4gWWVzLCBvbiBteSB0ZXN0IGVudiwgY3B1X2hh
c192bXhfcG9zdGVkX2ludHJfcHJvY2Vzc2luZyA9PSB0cnVlICYmIGlvbW11X2ludHBvc3QgPT0g
ZmFsc2UsCj4gd2l0aCB0aGlzLCBwb3N0ZWQgaW50ZXJydXB0cyBiZWVuIGVuYWJsZWQuCgpBbmQg
d2hhdCdzIHRoZSB0aGVvcnkgdGhlbiBhZ2FpbiBmb3IgbmVlZGluZyB0byBtb2RpZnkgSU9NTVUK
Y29kZSBpbiB0aGlzIGNhc2U/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
