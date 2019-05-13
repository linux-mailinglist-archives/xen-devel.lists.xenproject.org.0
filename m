Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E1C1B7A7
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:02:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBU3-0005vD-MJ; Mon, 13 May 2019 13:59:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBU2-0005v4-Py
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:59:14 +0000
X-Inumbo-ID: 49adb851-7587-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 49adb851-7587-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 13:59:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 07:59:12 -0600
Message-Id: <5CD9782C020000780022E23F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 07:59:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E78F6020000780021BB21@prv1-mh.provo.novell.com>
 <3172ee3f-0800-99a5-e148-d10ecdfd51a8@citrix.com>
In-Reply-To: <3172ee3f-0800-99a5-e148-d10ecdfd51a8@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDE1OjQ0LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAzLzUvMTkgMToyNiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvaW9tbXUuYwo+PiBAQCAtMTkyLDIxICsxOTIsMjcgQEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9t
bXVfaHdkb21faW5pdChzdHJ1Ywo+PiAgCj4+ICAgICAgICAgIHBhZ2VfbGlzdF9mb3JfZWFjaCAo
IHBhZ2UsICZkLT5wYWdlX2xpc3QgKQo+PiAgICAgICAgICB7Cj4+IC0gICAgICAgICAgICB1bnNp
Z25lZCBsb25nIG1mbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKPj4gLSAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZGZuID0gbWZuX3RvX2dtZm4oZCwgbWZuKTsKPj4gLSAgICAgICAgICAg
IHVuc2lnbmVkIGludCBtYXBwaW5nID0gSU9NTVVGX3JlYWRhYmxlOwo+PiAtICAgICAgICAgICAg
aW50IHJldDsKPj4gKyAgICAgICAgICAgIGlmICggKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYg
UEdUX3R5cGVfbWFzaykgPT0gUEdUX25vbmUgKQo+PiArICAgICAgICAgICAgewo+PiArICAgICAg
ICAgICAgICAgIEFTU0VSVCghKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21h
c2spKTsKPj4gKyAgICAgICAgICAgICAgICBpZiAoIGdldF9wYWdlX2FuZF90eXBlKHBhZ2UsIGQs
IFBHVF93cml0YWJsZV9wYWdlKSApCj4+ICsgICAgICAgICAgICAgICAgICAgIHB1dF9wYWdlX2Fu
ZF90eXBlKHBhZ2UpOwo+PiArICAgICAgICAgICAgICAgIGVsc2UgaWYgKCAhcmMgKQo+PiArICAg
ICAgICAgICAgICAgICAgICByYyA9IC1FQlVTWTsKPj4gKyAgICAgICAgICAgIH0KPj4gIAo+PiAt
ICAgICAgICAgICAgaWYgKCAoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21h
c2spID09IDApIHx8Cj4+IC0gICAgICAgICAgICAgICAgICgocGFnZS0+dS5pbnVzZS50eXBlX2lu
Zm8gJiBQR1RfdHlwZV9tYXNrKQo+PiAtICAgICAgICAgICAgICAgICAgPT0gUEdUX3dyaXRhYmxl
X3BhZ2UpICkKPj4gLSAgICAgICAgICAgICAgICBtYXBwaW5nIHw9IElPTU1VRl93cml0YWJsZTsK
Pj4gKyAgICAgICAgICAgIGlmICggKChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF90eXBl
X21hc2spID09Cj4+ICsgICAgICAgICAgICAgICAgICBQR1Rfd3JpdGFibGVfcGFnZSkgKQo+PiAr
ICAgICAgICAgICAgewo+PiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWZuID0gbWZu
X3gocGFnZV90b19tZm4ocGFnZSkpOwo+PiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZGZuID0gbWZuX3RvX2dtZm4oZCwgbWZuKTsKPj4gKyAgICAgICAgICAgICAgICBpbnQgcmV0ID0g
aW9tbXVfbWFwKGQsIF9kZm4oZGZuKSwgX21mbihtZm4pLCAwLAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmZsdXNoX2ZsYWdzKTsKPiAK
PiBXaGF0J3MgdGhlIGlkZWEgYmVoaW5kIGNhbGxpbmcgaW9tbXVfbWFwKCkgaGVyZSwgcmF0aGVy
IHRoYW4gcmVseWluZyBvbgo+IHRoZSBvbmUgaW4gX2dldF9wYWdlX3R5cGUoKT8gIERvZXMgbmVl
ZF9pb21tdV9wdF9zeW5jKCkgbm90IHdvcmsgeWV0IGF0Cj4gdGhpcyBwb2ludCwgb3IgZG8geW91
IGV4cGVjdCB0aGVyZSB0byBiZSBwYWdlcyB0aGF0IGhhdmUgYmVlbiBtYXJrZWQKPiBQR1Rfd3Jp
dGFibGUgd2l0aG91dCBoYXZpbmcgZ29uZSB0aHJvdWdoIF9nZXRfcGFnZV90eXBlKCk/CgpObywg
SSB0aGluayBJIHNpbXBseSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IHRoaXMgY291bGQgYmUgZGVsZXRl
ZCBhbHRvZ2V0aGVyCndpdGggdGhlIGFkZGVkIGdldF9wYWdlX2FuZF90eXBlKCkgaW52b2NhdGlv
bi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
