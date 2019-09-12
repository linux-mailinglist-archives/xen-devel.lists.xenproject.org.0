Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F2B113E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QBx-0004QJ-01; Thu, 12 Sep 2019 14:35:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8QBu-0004QE-TS
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:35:22 +0000
X-Inumbo-ID: 8c90ef22-d56a-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c90ef22-d56a-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 14:35:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E7839AD45;
 Thu, 12 Sep 2019 14:35:20 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-23-jgross@suse.com>
 <61e63336-affb-ca2b-944a-a6cb8e3c2862@suse.com>
 <e9edfb7c-17b8-f997-2b5c-52a17e73b698@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ced1cfc6-9d71-8268-ac56-d5d71e0d75c9@suse.com>
Date: Thu, 12 Sep 2019 16:34:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e9edfb7c-17b8-f997-2b5c-52a17e73b698@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 22/48] xen/sched: switch schedule() from
 vcpus to sched_units
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNTo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOS4wOS4xOSAx
NjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gQEAgLTI0OCw2ICsyNDgsMjAgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHZjcHVfcnVuc3RhdGVfY2hhbmdlKAo+Pj4gICAgICAgdi0+cnVuc3RhdGUuc3RhdGUg
PSBuZXdfc3RhdGU7Cj4+PiAgIH0KPj4+ICAgCj4+PiArc3RhdGljIGlubGluZSB2b2lkIHNjaGVk
X3VuaXRfcnVuc3RhdGVfY2hhbmdlKHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAo+Pj4gKyAgICBi
b29sIHJ1bm5pbmcsIHNfdGltZV90IG5ld19lbnRyeV90aW1lKQo+Pj4gK3sKPj4+ICsgICAgc3Ry
dWN0IHZjcHUgKnYgPSB1bml0LT52Y3B1X2xpc3Q7Cj4+PiArCj4+PiArICAgIGlmICggcnVubmlu
ZyApCj4+PiArICAgICAgICB2Y3B1X3J1bnN0YXRlX2NoYW5nZSh2LCBSVU5TVEFURV9ydW5uaW5n
LCBuZXdfZW50cnlfdGltZSk7Cj4+PiArICAgIGVsc2UKPj4+ICsgICAgICAgIHZjcHVfcnVuc3Rh
dGVfY2hhbmdlKHYsCj4+PiArICAgICAgICAgICAgKCh2LT5wYXVzZV9mbGFncyAmIFZQRl9ibG9j
a2VkKSA/IFJVTlNUQVRFX2Jsb2NrZWQgOgo+Pj4gKyAgICAgICAgICAgICAodmNwdV9ydW5uYWJs
ZSh2KSA/IFJVTlNUQVRFX3J1bm5hYmxlIDogUlVOU1RBVEVfb2ZmbGluZSkpLAo+Pj4gKyAgICAg
ICAgICAgIG5ld19lbnRyeV90aW1lKTsKPj4+ICt9Cj4+Cj4+IEkgZmluZCBpdCBwdXp6bGluZyB0
aGF0IHRoaXMgZ2V0cyBpbnRyb2R1Y2VkLCBidXQgd29uJ3Qgc3Vydml2ZSB0aWxsCj4+IHRoZSBl
bmQgb2YgdGhlIHNlcmllcy4gSSBjYW4gb25seSBndWVzcyB0aGF0IHlvdSBjYW4ndCBkbyB3aXRo
b3V0IHRoZQo+PiBzZXBhcmF0aW9uIGludGVybWVkaWF0ZWx5LiBNYWtpbmcgc3VjaCB0cmFuc2ll
bnQgc3RhdGUgbW9yZSBhcHBhcmVudAo+PiBmcm9tIHRoZSBkZXNjcmlwdGlvbiB3b3VsZCBiZSBu
aWNlIGltby4KPiAKPiBUaGUgZnVuY3Rpb25hbGl0eSB3aWxsIHN0YXksIGJ1dCBpdCB3aWxsIGJl
IHN1YnN1bWVkIGluIHBhdGNoIDM1LiBJCj4gZG9uJ3QgdGhpbmsgSSBzaG91bGQgbWVudGlvbiB0
aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZSwgc28gZG8geW91IHdhbnQKPiBtZSB0byBqdXN0IGFk
ZCBpdCBiZWxvdyB0aGUgIi0tLSIgbWFya2VyPwoKRG9uJ3Qga25vdywgdG8gYmUgaG9uZXN0LiBB
cHBhcmVudGx5IG9kZCB0aGluZ3MgbGlrZSB0aGlzIG9uZSBhcmUKbWFraW5nIHJldmlldyBtb3Jl
IGRpZmZpY3VsdC4gSSBkb24ndCB0eXBpY2FsbHkgcmVzb3J0IHRvIGxvb2tpbmcgYXQKdGhlIGZp
bmFsIHJlc3VsdGluZyBjb2RlLCBidXQgaWYgZXZlbiB0aGF0IGVuZHMgdXAgY29uZnVzaW5nLCBp
dCdzCmNlcnRhaW5seSBzb21ldGhpbmcgd2hlcmUgYSBoaW50IHNvbWV3aGVyZSB3b3VsZCBiZSBu
aWNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
