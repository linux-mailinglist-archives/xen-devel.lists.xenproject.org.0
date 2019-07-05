Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1D60185
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 09:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjIfp-000597-O8; Fri, 05 Jul 2019 07:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vD9p=VC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hjIfo-000592-Ag
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 07:30:24 +0000
X-Inumbo-ID: be2699e2-9ef6-11e9-a906-bfd1144e9e7c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be2699e2-9ef6-11e9-a906-bfd1144e9e7c;
 Fri, 05 Jul 2019 07:30:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77AB0AFF3;
 Fri,  5 Jul 2019 07:30:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-40-jgross@suse.com>
 <9c499d2e-a241-5ebb-b62c-70d189926621@citrix.com>
 <b5589b2f-1d8d-a2f2-036f-06b6233c9c08@suse.com>
 <62a8c023-40f7-ae49-7131-8b66c5986cd8@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <07a38e5d-a881-5c65-8487-2633e357102f@suse.com>
Date: Fri, 5 Jul 2019 09:30:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <62a8c023-40f7-ae49-7131-8b66c5986cd8@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 39/60] x86: optimize loading of GDT at
 context switch
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMTkgMTQ6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDMvMDcvMjAxOSAw
NzozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDIuMDcuMTkgMTg6MDksIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAyOC8wNS8yMDE5IDExOjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IEluc3RlYWQgb2YgZHluYW1pY2FsbHkgZGVjaWRlIHdoZXRoZXIgdGhlIHByZXZpb3Vz
IHZjcHUgd2FzIHVzaW5nIGZ1bGwKPj4+Cj4+PiAiZGVjaWRpbmciCj4+Pgo+Pj4+IG9yIGRlZmF1
bHQgR0RUIGp1c3QgYWRkIGEgcGVyY3B1IHZhcmlhYmxlIGZvciB0aGF0IHB1cnBvc2UuIFRoaXMg
YXQKPj4+Cj4+PiAid2FzIHVzaW5nIGEgZnVsbCBvciBkZWZhdWx0IEdEVCwganVzdCBhZGQiCj4+
Pgo+Pj4+IG9uY2UgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgdGVzdGluZyB2Y3B1X2lkcyB0byBkaWZm
ZXIgdHdpY2UuCj4+Pj4KPj4+PiBDYWNoZSB0aGUgbmVlZF9mdWxsX2dkdChuZCkgdmFsdWUgaW4g
YSBsb2NhbCB2YXJpYWJsZS4KPj4+Cj4+PiBXaGF0J3MgdGhlIHBvaW50IG9mIGRvaW5nIHRoaXM/
wqAgSSBrbm93IHRoZSBsb2dpYyBpcyByYXRoZXIgY29tcGxpY2F0ZWQKPj4+IGluIF9fY29udGV4
dF9zd2l0Y2goKSwgYnV0IGF0IGxlYXN0IGl0IGlzIHZpc3VhbGx5IGNvbnNpc3RlbnQuwqAgQWZ0
ZXIKPj4+IHRoaXMgY2hhbmdlLCBpdCBpcyBhc3ltbWV0cmljIGFuZCBoYXJkZXIgdG8gZm9sbG93
Lgo+Pgo+PiBUaGlzIGlzIGEgaG90IHBhdGguIG5lZWRfZnVsbF9nZHQoKSBuZWVkcyB0d28gY29t
cGFyZXMsIG9mIHdoaWNoIG9uZSBpcwo+PiB1c2luZyBldmFsdWF0ZV9ub3NwZWMoKS4KPiAKPiBV
cmdoLsKgIFNvIGV2YWx1dGVfbm9zcGVjKCkgaXMgYWxyZWFkeSBicm9rZW4gaGVyZSBiZWNhdXNl
Cj4gbmVlZF9mdWxsX2dkdCgpIGlzbid0IGFsd2F5c19pbmxpbmUsIGJ1dCBzdXJlbHkgdGhpcyBp
c24ndCB0aGUgb25seQo+IGV4YW1wbGUgaW1wYWN0ZWQgaW4gX19jb250ZXh0X3N3aXRjaCgpP8Kg
IFRoZSBjaG9pY2Ugb2YgJ2dkdCcgaXMKPiBzaW1pbGFybHkgaW1wYWN0ZWQgYnkgdGhlIGxvb2tz
IG9mIHRoaW5ncy4KPiAKPiBJJ2QgcmVjb21tZW5kIG5vdCB3b3JyeWluZyBhYm91dCBldmFsdXRl
X25vc3BlYygpIGZvciBub3cuwqAgVGhlcmUgYXJlCj4gc2V2ZXJhbCBmdW5kYW1lbnRhbCBwcm9i
bGVtcyBhdG0sIGFuZCBYZW4gNC4xMyBjYW5ub3Qgc2hpcCB3aXRoIGl0IGluCj4gdGhpcyBzdGF0
ZS4KCkkgZGlkIGEgc21hbGwgcGVyZm9ybWFuY2UgdGVzdCB3aXRoIHRoaXMgcGF0Y2ggYW5kIHRo
ZW4gcmVtb3ZlZCBsYXRjaGluZwpvZiBuZWVkX2Z1bGxfZ2R0KG5kKSBpbiB0aGUgbG9jYWwgdmFy
aWFibGU6CgpPbiBhIDggY3B1IHN5c3RlbSBJIHN0YXJ0ZWQgMiBtaW5pLW9zIGRvbWFpbnMgKDEg
dmNwdSBlYWNoKSBkb2luZyBhIGJ1c3kKbG9vcCBzZW5kaW5nIGV2ZW50cyB0byBkb20wLiBPbiBk
b20wIEkgZGlkIGEgYnVpbGQgb2YgdGhlIGh5cGVydmlzb3IgdmlhCiJtYWtlIC1qIDgiIGFuZCBt
ZWFzdXJlZCB0aGUgdGltZSBmb3IgdGhhdCBidWlsZCwgdGhlbiB0b29rIHRoZSBhdmVyYWdlCm9m
IDUgc3VjaCBidWlsZHMgKGRvaW5nIGEgbWFrZSBjbGVhbiBpbiBiZXR3ZWVuKS4KCiAgICAgICAg
ICAgIGVsYXBzZWQgIHVzZXIgICBzeXN0ZW0KVW5wYXRjaGVkOiAgNjYuNTEgIDIzMi45MyAgMTA5
LjIxCmxhdGNoZWQ6ICAgIDY0LjgyICAyMzIuMzMgIDEwOS4xOAp1bmxhdGNoZWQ6ICA2My4zOSAg
MjMxLjgxICAxMDcuNDkKCkFzIHRoZXJlIGlzIGEgc21hbGwgYWR2YW50YWdlIGZvciBub3QgbGF0
Y2hpbmcgSSdsbCByZW1vdmUgdGhlIGZ1bGxfZ2R0CmxvY2FsIHZhcmlhYmxlLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
