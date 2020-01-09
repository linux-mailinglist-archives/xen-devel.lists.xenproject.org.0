Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94BC1355F1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 10:39:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipUEh-0004E6-Ev; Thu, 09 Jan 2020 09:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipUEg-0004E1-G3
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 09:36:14 +0000
X-Inumbo-ID: 79efffc9-32c3-11ea-b983-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79efffc9-32c3-11ea-b983-12813bfff9fa;
 Thu, 09 Jan 2020 09:36:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 614D1BD7B;
 Thu,  9 Jan 2020 09:35:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-4-andrew.cooper3@citrix.com>
 <2c6f5ae6-004d-8beb-61c8-c988930ed318@suse.com>
 <67a1bb81-98ee-bb1c-5634-fd1d9c66098d@citrix.com>
 <874e7240-58e6-dfe4-5d12-860260d83800@suse.com>
 <efdf3015-6be3-34a8-d396-7c111c6a6408@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <644def99-58aa-3691-6d51-92f42d83062a@suse.com>
Date: Thu, 9 Jan 2020 10:35:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <efdf3015-6be3-34a8-d396-7c111c6a6408@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] x86/boot: Remove the preconstructed low
 16M superpage mappings
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

T24gMDguMDEuMjAyMCAyMDo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8wMS8yMDIw
IDExOjIzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiAgVGhpcyB3b3VsZCB0aGVuIGFsc28gZWFz
ZSBzaHJpbmtpbmcgdGhlIGJ1aWxkCj4+Pj4gdGltZSBtYXBwaW5ncyBmdXJ0aGVyLCBlLmcuIHRv
IHRoZSBsb3cgMU1iIChpbnN0ZWFkIG9mIHRvdWNoaW5nCj4+Pj4gc2V2ZXJhbCBvZiB0aGUgcGxh
Y2VzIHlvdSB0b3VjaCBub3csIGl0IHdvdWxkIGFnYWluIG1haW5seSBiZSBhbgo+Pj4+IGFkanVz
dG1lbnQgdG8gQk9PVFNUUkFQX01BUF9CQVNFLCBhbG9uZ3NpZGUgdGhlIGFzc2VtYmx5IGZpbGUK
Pj4+PiBjaGFuZ2VzIG5lZWRlZCkuCj4+PiAuLi4gYXMgeW91IGNvcnJlY3RseSBpZGVudGlmeSBo
ZXJlLCBpdCBpcyBhIHByb3BlcnR5IG9mIHRoZSBwcmVidWlsdAo+Pj4gdGFibGVzIChpbiBsP19p
ZGVudG1hcFtdKSwgbm90IGEgcHJvcGVydHkgb2Ygd2hlcmUgd2UgY2hvc2UgdG8gcHV0IHRoZQo+
Pj4gZHluYW1pYyBib290IG1hcHBpbmdzIChpbiB0aGUgbD9fYm9vdG1hcFtdKS7CoCBBbm90aGVy
IGNoYW5nZSAoYmxvY2tlZAo+Pj4gYmVoaW5kIHRoZSBhYm92ZSBidWcpIG1vdmVzIEJPT1RTVFJB
UF9NQVBfQkFTRSB0byBiZSAxRyB0byByZWR1Y2UgdGhlCj4+PiBjaGFuY2Ugb2YgYW4gb2Zmc2V0
IGZyb20gYSBOVUxMIHBvaW50ZXIgaGl0dGluZyBhIHByZXNlbnQgbWFwcGluZy4KPj4gUmlnaHQs
IEJPT1RTVFJBUF9NQVBfQkFTRSB3YXMgKGFiKXVzZWQgZm9yIGEgMm5kIHB1cnBvc2UuIEJ1dCB0
aGlzCj4+IHdvdWxkIGJldHRlciBiZSBkZWFsdCB3aXRoIGJ5IGludHJvZHVjaW5nIGEgbmV3IG1h
bmlmZXN0IGNvbnN0YW50Cj4+IChlLmcuIFBSRUJVSUxUX01BUF9MSU1JVCkgaW5zdGVhZCBvZiBv
cGVuLWNvZGluZyAyTWIgZXZlcnl3aGVyZS4KPiAKPiBJJ20gaG9waW5nIHRvIGdldCByaWQgb2Yg
ZXZlbiB0aGlzLCAoYWx0aG91Z2ggaXQgaXMgY29tcGxpY2F0ZWQgYnkKPiBDT05GSUdfVklERU8n
cyBibGluZCB1c2Ugb2YgdGhlIGxlZ2FjeSBWR0EgcmFuZ2UpLgo+IAo+PiBQbHVzIHRoZXJlJ3Mg
KGFpdWkpIGEgUFJFQlVJTFRfTUFQX0xJTUlUIDw9IEJPT1RTVFJBUF9NQVBfQkFTRQo+PiByZXF1
aXJlbWVudCwgd2hpY2ggd291bGQgYmV0dGVyIGJlIHZlcmlmaWVkIChlLmcuIGJ5IGEgQlVJTERf
QlVHX09OKCkpCj4+IHRoZW4uCj4gCj4gSXMgdGhlcmU/wqAgSSBkb24ndCBzZWUgYSByZWFsIGNv
bm5lY3Rpb24gYmV0d2VlbiB0aGUgdHdvLCBldmVuIGluIHRoaXMKPiBwYXRjaC4KClBlcmhhcHMg
bm90IGEgInJlYWwiIG9uZSAoaW4gdGhlIHNlbnNlIHRoYXQgSSB0aGluayB5b3UgbWVhbiksIGJ1
dAphdCB0aGUgdmVyeSBsZWFzdCB3aGVuIFBSRUJVSUxUX01BUF9MSU1JVCA+IEJPT1RTVFJBUF9N
QVBfQkFTRQphZGRpbmcgYSBmaXJzdCBib290c3RyYXAgbWFwcGluZyB3b3VsZCBfcmVxdWlyZV8g
YSBUTEIgZmx1c2gsIHdoZXJlYXMKdGhpbmdzIHdvdWxkIGJlIGZpbmUgd2l0aG91dCBvdGhlcndp
c2UgKGFsYmVpdCB0aGlzIGdvaW5nIHRocm91Z2gKbWFwX3BhZ2VzX3RvX3hlbigpIG1lYW5zIGFw
cHJvcHJpYXRlIGZsdXNoaW5nIHdpbGwgYmUgZG9uZSBhbnl3YXkpLgpBbnl0aGluZyBlbHNlIGRl
cGVuZHMgb24gdGhlIHBvdGVudGlhbGx5IG92ZXJsYXBwaW5nIHJhbmdlIGFjdHVhbGx5CmJlaW5n
IHVzZWQgZm9yIHNvbWV0aGluZyAod2hpY2ggeW91ciBzZXJpZXMgcHJvdmVzIGl0J3Mgbm90KS4K
CkFueXdheSwgYXMgc2FpZCBiZWZvcmUsIGNvbnNpZGVyaW5nIHlvdXIgc3Vic2VxdWVudCBjaGFu
Z2VzLCB0aGVyZSdzCm5vIHJlYWwgbmVlZCB0byBhZGQgYW55IGZ1cnRoZXIgY2hlY2tpbmcgaGVy
ZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
