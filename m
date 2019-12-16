Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFB120EBE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 17:02:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igsmQ-0006TJ-4j; Mon, 16 Dec 2019 15:59:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igsmO-0006TD-BH
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:59:28 +0000
X-Inumbo-ID: 083c42d4-201d-11ea-93c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 083c42d4-201d-11ea-93c7-12813bfff9fa;
 Mon, 16 Dec 2019 15:59:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71E8AADEE;
 Mon, 16 Dec 2019 15:59:26 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
 <eb7b413b-4e58-d509-eab2-758b3090eb74@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7f9b98e-8173-4ad6-b6ea-e5232d96d684@suse.com>
Date: Mon, 16 Dec 2019 16:59:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <eb7b413b-4e58-d509-eab2-758b3090eb74@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] gnttab: don't expose host physical
 address without need
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxNToxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA1LzEyLzIwMTkg
MTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUcmFuc2xhdGVkIGRvbWFpbnMgc2hvdWxkbid0
IHNlZSBob3N0IHBoeXNpY2FsIGFkZHJlc3Nlcy4gV2hpbGUgdGhlCj4+IGFkZHJlc3MgaXMgYWxz
byBub3Qgc3VwcG9zZWQgdG8gYmUgaGFuZGVkIGJhY2sgZXZlbiB0byBub24tdHJhbnNsYXRlZAo+
PiBkb21haW5zIHdoZW4gR05UTUFQX2RldmljZV9tYXAgaXMgbm90IHNldCAoYXMgZXhwbGljaXRs
eSBzdGF0ZWQgYnkgYQo+PiBjb21tZW50IGluIHRoZSBwdWJsaWMgaGVhZGVyKSwgUFYga2VybmVs
cyAoTGludXggYXQgbGVhc3QpIGFzc3VtZSB0aGUKPj4gZmllbGQgdG8gZ2V0IHBvcHVsYXRlZCBu
ZXZlcnRoZWxlc3MuIChTaW1pbGFybHkgbWFwa2luZCgpIHNob3VsZCBjaGVjawo+PiBvbmx5IEdO
VE1BUF9kZXZpY2VfbWFwLikKPj4KPj4gQWxvbmcgdGhlc2UgbGluZXMgc3BsaXQgdGhlIHBhZ2lu
ZyBtb2RlIHJlbGF0ZWQgY2hlY2sgbmVhciB0aGUgdG9wIG9mCj4+IG1hcF9ncmFudF9yZWYoKSB0
byBoYW5kbGUgdGhlICJleHRlcm5hbCIgYW5kICJ0cmFuc2xhdGVkIiBjYXNlcwo+PiBzZXBhcmF0
ZWx5IChHTlRNQVBfZGV2aWNlX21hcCB1c2UgZ2V0dGluZyB0aWVkIHRvIGJlaW5nIG5vbi10cmFu
c2xhdGVkCj4+IHJhdGhlciB0aGFuIG5vbi1leHRlcm5hbCkuCj4+Cj4+IFN0aWxsIGFsb25nIHRo
ZXNlIGxpbmVzIGluIHRoZSB1bm1hcHBpbmcgY2FzZSB0aGVyZSdzIG5vIHBvaW50IGNoZWNraW5n
Cj4+IC0+ZGV2X2J1c19hZGRyIHdoZW4gR05UTUFQX2RldmljZV9tYXAgaXNuJ3Qgc2V0IChhbmQg
aGVuY2UgdGhlIGZpZWxkCj4+IGlzbid0IGdvaW5nIHRvIGJlIGNvbnN1bWVkKS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gdjQ6
IFJlLWJhc2Ugb3ZlciBkcm9wcGVkIHBhdGNoZXMuCj4+IHYzOiBOZXcuCj4+Cj4+IC0tLSBhL3hl
bi9jb21tb24vZ3JhbnRfdGFibGUuYwo+PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
Pj4gQEAgLTk2NywxMCArOTY3LDE2IEBAIG1hcF9ncmFudF9yZWYoCj4+ICAgICAgIH0KPj4gICAK
Pj4gICAgICAgaWYgKCB1bmxpa2VseShwYWdpbmdfbW9kZV9leHRlcm5hbChsZCkgJiYKPj4gLSAg
ICAgICAgICAgICAgICAgIChvcC0+ZmxhZ3MgJiAoR05UTUFQX2RldmljZV9tYXB8R05UTUFQX2Fw
cGxpY2F0aW9uX21hcHwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBHTlRNQVBfY29u
dGFpbnNfcHRlKSkpICkKPj4gKyAgICAgICAgICAgICAgICAgIChvcC0+ZmxhZ3MgJiAoR05UTUFQ
X2FwcGxpY2F0aW9uX21hcHxHTlRNQVBfY29udGFpbnNfcHRlKSkpICkKPj4gICAgICAgewo+PiAt
ICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5GTywgIk5vIGRldmljZSBtYXBwaW5nIGluIEhWTSBk
b21haW5cbiIpOwo+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5GTywgIk5vIGFwcC9wdGUg
bWFwcGluZyBpbiBIVk0gZG9tYWluXG4iKTsKPj4gKyAgICAgICAgb3AtPnN0YXR1cyA9IEdOVFNU
X2dlbmVyYWxfZXJyb3I7Cj4+ICsgICAgICAgIHJldHVybjsKPj4gKyAgICB9Cj4+ICsKPj4gKyAg
ICBpZiAoIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShsZCkgJiYgdW5saWtlbHkob3AtPmZsYWdzICYg
R05UTUFQX2RldmljZV9tYXApICkKPiAKPiBUaGVyZSBpcyBhdCBsZWFzdCBvbmUgaW5zdGFuY2Ug
aW4gTGludXggd2hlcmUgR05UTUFQX2RldmljZV9tYXAgbWF5IGJlIAo+IGdpdmVuIHJlZ2FyZGxl
c3MgdGhlIHR5cGUgb2YgdGhlIGd1ZXN0LiBTZWUgZG1hYnVmX2V4cF9mcm9tX3JlZnMoKSBpbiAK
PiBkcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMuCj4gCj4gSG93IGFyZSB5b3UgZ29pbmcgdG8g
ZGVhbCB3aXRoIHRoZW0/CgpJIGRpZG4ndCBzcG90IHRoYXQgY2FzZSwgbm9yIC4uLgoKPj4gQEAg
LTEyMTMsNyArMTIxOSw4IEBAIG1hcF9ncmFudF9yZWYoCj4+ICAgICAgIGlmICggbmVlZF9pb21t
dSApCj4+ICAgICAgICAgICBkb3VibGVfZ3RfdW5sb2NrKGxndCwgcmd0KTsKPj4gICAKPj4gLSAg
ICBvcC0+ZGV2X2J1c19hZGRyID0gbWZuX3RvX21hZGRyKG1mbik7Cj4+ICsgICAgb3AtPmRldl9i
dXNfYWRkciA9IHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShsZCkgPyBvcC0+aG9zdF9hZGRyCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBtZm5fdG9f
bWFkZHIobWZuKTsKPiAKPiBUaGUgImhvc3RfYWRkciIgaXMgcHJldHR5IGNvbmZ1c2luZy4gSSBm
aXJzdCB0aG91Z2h0IGl0IHdvdWxkIGJlIGEgIkhvc3QgCj4gUGh5c2ljYWwgQWRkcmVzcyIgYnV0
IGl0IHNlZW1zIHRvIGJlIGEgIkd1ZXN0IFBoeXNpY2FsIGFkZHJlc3MiCj4gCj4gSWYgc28sIHRo
aXMgaXMgZ29pbmcgdG8gYnJlYWsgTGludXggRG9tMCBvbiBBcm0gd2hlcmUgaXQgaXMgZXhwZWN0
ZWQgdG8gCj4gcmV0dXJuIHRoZSBtYWNoaW5lIHBoeXNpY2FsIGFkZHJlc3MgdG8gaGF2ZSBhIERN
QSBmdWxseSB3b3JraW5nLgoKLi4uIHRoaXMuCgo+IEkgZG9uJ3QgYWJpZGUgd2l0aCB0aGUgY3Vy
cmVudCBiZWhhdmlvciBvbiBBcm0sIGJ1dCBJIGRvbid0IHRoaW5rIHdlIAo+IHNob3VsZCBicmVh
ayB0aGVtIHdoZW4gdGhlcmUgYXJlIG5vIHJlcGxhY2VtZW50IGZvciBpdC4KCkkgYWdyZWU7IEkg
ZGlkbid0IG1lYW4gdG8gYnJlYWsgYW55dGhpbmcgaGVyZS4gVGhlIHN0YXRlIG9mIHRoaW5ncwp0
aGVuIG1lYW5zIHRoYXQgSSBuZWVkIHRvIHdpdGhkcmF3IHRoaXMgcGF0Y2gsIC4uLgoKPiBTbyBp
dCB3b3VsZCBiZSBiZXR0ZXIgaWYgd2UgbG9vayBhdCBhIGRpZmZlcmVudCBhcHByb2FjaCAoaS5l
IGEgbmV3IGZsYWcgCj4gb3Igc3RyaWN0IG1vZGUpIGluIG9yZGVyIHRvIGF2b2lkIGJyZWFrYWdl
LgoKLi4uIHdpdGhvdXQgYW55IHJlcGxhY2VtZW50IChhdCBsZWFzdCBmb3IgdGhlIHRpbWUgYmVp
bmcpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
