Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C840C1127C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:36:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icR2r-000325-74; Wed, 04 Dec 2019 09:34:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icR2p-000320-LJ
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:34:03 +0000
X-Inumbo-ID: 3453cb0e-1679-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3453cb0e-1679-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 09:34:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0704AC0C;
 Wed,  4 Dec 2019 09:34:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-3-roger.pau@citrix.com>
 <20191129113813.GX980@Air-de-Roger>
 <c06efe66-389c-2124-d4c1-f26a54d5ac5f@suse.com>
 <20191204091734.GG980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <477e94ce-c27b-5ea9-15af-a6dd1844edc7@suse.com>
Date: Wed, 4 Dec 2019 10:34:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204091734.GG980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxMDoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAwMywgMjAxOSBhdCAwNDoxNDo0NlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjkuMTEuMjAxOSAxMjozOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+PiBPbiBGcmksIE5v
diAyOSwgMjAxOSBhdCAxMjoyODo0OVBNICswMTAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+
Pj4gQ2x1c3RlciBtb2RlIGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5n
IHN1cHBvcnQsIHNpbmNlCj4+Pj4gdGhlIHRvcCAxNmJpdHMgb2YgdGhlIEFQSUMgSUQgYXJlIGZp
bGxlZCB3aXRoIHRoZSBjbHVzdGVyIElELCBhbmQKPj4+PiBoZW5jZSBvbiBzeXN0ZW1zIHdoZXJl
IHRoZSBwaHlzaWNhbCBJRCBpcyBzdGlsbCBzbWFsbGVyIHRoYW4gMjU1IHRoZQo+Pj4+IGNsdXN0
ZXIgSUQgaXMgbm90LiBGb3JjZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUn
cyBubwo+Pj4+IGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydC4KPj4+Pgo+Pj4+IE5vdGUgdGhh
dCB0aGlzIHJlcXVpcmVzIGEgZnVydGhlciBwYXRjaCBpbiBvcmRlciB0byBlbmFibGUgeDJBUElD
Cj4+Pj4gd2l0aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQuCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Cj4+
PiBUaGlzIGlzIG1pc3NpbmcgYSBjb21tYW5kIGxpbmUgZG9jIHVwZGF0ZSBhbmQgdGhlIGxvZ2lj
IGJlbG93IGlnbm9yZXMKPj4+IGEgdXNlci1zZXQgeDJhcGljX3BoeXMgdmFsdWUuCj4+Cj4+IFNv
IHdoYXQgd291bGQgdGhlIGJlaGF2aW9yIGJlIGluIHlvdXIgb3BpbmlvbiB3aGVuIHRoZSB1c2Vy
Cj4+IGhhcyByZXF1ZXN0ZWQgY2x1c3RlciBtb2RlPyBJIGNhbid0IHNlZSB5b3UgZG8gbXVjaCBv
dGhlcgo+PiB0aGFuIHBhbmljKCktaW5nLCBwZXJoYXBzIGl0J3MgYmV0dGVyIHRvIG92ZXJyaWRl
IHRoZSByZXF1ZXN0Cj4+IChhcyB5b3UgYWxyZWFkeSBkbyk/Cj4gCj4gSSB0aGluayBwYW5pYydp
bmcgaXMgZmluZSwgYSB1c2VyIHNob3VsZG4ndCBiZSBzZXR0aW5nIHgyYXBpY19waHlzCj4gdW5s
ZXNzIHRoZXkga25vdyB3aGF0IGFyZSBkb2luZywgYW5kIHRoZW4gWGVuIGNoYW5naW5nIGl0IG9u
IHRoZSBiYWNrCj4gb2YgdGhlIHVzZXIgYWxzbyBkb2Vzbid0IHNlZW0gZmluZS4KPiAKPiBBIHBh
bmljIGV4cGxhaW5pbmcgdGhhdCB4MmFwaWNfcGh5cz1mYWxzZSBpcyBub3Qgc3VwcG9ydGVkIGFu
ZCB0aGF0Cj4gdGhlIGJveCBjYW4gb25seSBiZSBib290ZWQgd2l0aCB4MmFwaWMgcGh5cyBtb2Rl
IHNob3VsZCBiZSBmaW5lIElNTy4KCkkgY2FuIHNlZSB0aGlzIGFzIGEgdmFsaWQgcG9zaXRpb24g
dG8gdGFrZS4gUGVyc29uYWxseSwgaG93ZXZlciwgSQpkbyB0aGluayB3ZSBzaG91bGQgYXZvaWQg
ZmFpbGluZyB0byBib290IGlmIHdlIGVhc2lseSBjYW4uIChZZXMsIHdlCnNob3VsZCBsb2cgdGhl
IGZhY3QgdGhhdCB3ZSBpZ25vcmUgYSBjb21tYW5kIGxpbmUgb3B0aW9uIGluIHN1Y2ggYQpjYXNl
LikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
