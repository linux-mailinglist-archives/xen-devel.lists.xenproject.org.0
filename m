Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B336AA7E73
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5R0S-0007wH-KF; Wed, 04 Sep 2019 08:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5R0Q-0007vt-MN
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:51:10 +0000
X-Inumbo-ID: 23040352-cef1-11e9-abad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23040352-cef1-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 08:51:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB913B624;
 Wed,  4 Sep 2019 08:51:07 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
 <a5bbc347-a876-17d2-4fae-06b98818e565@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f552186e-4f5d-f0df-d44d-51a8f2fa5a7e@suse.com>
Date: Wed, 4 Sep 2019 10:51:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a5bbc347-a876-17d2-4fae-06b98818e565@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMDo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNC4wOS4xOSAx
MDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjA5LjIwMTkgMTA6MjUsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwMy4wOS4xOSAxNzowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDMuMDkuMjAxOSAxNzowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMDMu
MDkuMTkgMTY6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjkuMDguMjAxOSAxMjox
OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiBJbiBvcmRlciB0byBoYXZlIHVuaXF1ZSBu
YW1lcyB3aGVuIGRvaW5nIGxvY2sgcHJvZmlsaW5nIHNldmVyYWwgbG9jYWwKPj4+Pj4+PiBsb2Nr
cyAibG9jayIgbmVlZCB0byBiZSByZW5hbWVkLgo+Pj4+Pj4KPj4+Pj4+IEJ1dCB0aGVzZSBhcmUg
YWxsIG5hbWVkIHNpbXBseSAibG9jayIgZm9yIGEgZ29vZCByZWFzb24sIGluY2x1ZGluZwo+Pj4+
Pj4gYmVjYXVzZSB0aGV5J3JlIGFsbCBmdW5jdGlvbiBzY29wZSBzeW1ib2xzIChhbmQgdHlwaWNh
bGx5IHRoZQo+Pj4+Pj4gZnVuY3Rpb25zIGFyZSBhbGwgc3VmZmljaWVudGx5IHNob3J0KS4gVGhl
IGlzc3VlIHN0ZW1zIGZyb20gdGhlCj4+Pj4+PiBkdWFsIHVzZSBvZiAibmFtZSIgaW4KPj4+Pj4+
Cj4+Pj4+PiAjZGVmaW5lIF9MT0NLX1BST0ZJTEUobmFtZSkgeyAwLCAjbmFtZSwgJm5hbWUsIDAs
IDAsIDAsIDAsIDAgfQo+Pj4+Pj4KPj4+Pj4+IHNvIEknZCByYXRoZXIgc3VnZ2VzdCBtYWtpbmcg
dGhpcyBhIGRlcml2YXRpb24gb2YgYSBuZXcKPj4+Pj4+Cj4+Pj4+PiAjZGVmaW5lIF9MT0NLX1BS
T0ZJTEVfTkFNRShsb2NrLCBuYW1lKSB7IDAsICNuYW1lLCAmbG9jaywgMCwgMCwgMCwgMCwgMCB9
Cj4+Pj4+Pgo+Pj4+Pj4gaWYgdGhlcmUncyBubyBvdGhlciAodHJhbnNwYXJlbnQpIHdheSBvZiBk
aXNhbWJpZ3VhdGluZyB0aGUgbmFtZXMuCj4+Pj4+Cj4+Pj4+IFRoaXMgd2lsbCByZXF1aXJlIHRv
IHVzZSBhIGRpZmZlcmVudCBERUZJTkVfU1BJTkxPQ0soKSB2YXJpYW50LCBzbyBlLmcuCj4+Pj4+
IERFRklORV9TUElOTE9DS19MT0NBTCgpLCB3aGljaCB3aWxsIHRoZW4gaW5jbHVkZSB0aGUgbmVl
ZGVkICJzdGF0aWMiIGFuZAo+Pj4+PiBhZGQgIkA8ZnVuYz4iIHRvIHRoZSBsb2NrIHByb2ZpbGlu
ZyBuYW1lLiBJcyB0aGlzIG9rYXk/Cj4+Pj4KPj4+PiBUbyBiZSBmcmFuayAtIG5vdCByZWFsbHku
IEkgZGlzbGlrZSBib3RoLCBhbmQgd291bGQgaGVuY2UgcHJlZmVyIHRvCj4+Pj4gc3RpY2sgdG8g
d2hhdCB0aGVyZSBpcyBjdXJyZW50bHksIHVudGlsIHNvbWVvbmUgaW52ZW50cyBhIHRyYW5zcGFy
ZW50Cj4+Pj4gd2F5IHRvIGRpc2FtYmlndWF0ZSB0aGVzZS4gSSdtIHNvcnJ5IGZvciBiZWluZyB1
bmhlbHBmdWwgaGVyZS4KPj4+Cj4+PiBJIHRoaW5rIEkgaGF2ZSBmb3VuZCBhIHdheTogSSBjb3Vs
ZCBhZGQgX19GSUxFX18gYW5kIF9fTElORV9fIGRhdGEgdG8KPj4+IHN0cnVjdCBsb2NrX3Byb2Zp
bGUuIEluIGxvY2tfcHJvZl9pbml0KCkgSSBjb3VsZCBsb29rIGZvciBub24tdW5pcXVlCj4+PiBs
b2NrIG5hbWVzIGFuZCBtYXJrIHRob3NlIHRvIGJlIHByaW50ZWQgd2l0aCB0aGUgX19GSUxFX18g
YW5kIF9fTElORV9fCj4+PiBkYXRhIGFkZGVkIHRvIHRoZSBuYW1lcy4KPj4+Cj4+PiBXb3VsZCB5
b3UgYmUgZmluZSB3aXRoIHRoaXMgYXBwcm9hY2g/Cj4+Cj4+IEkgd291bGQgYmUsIGJ1dCBJJ20g
YWZyYWlkIEFuZHJldyB3b24ndCAoYXMgd2l0aCBhbnkgbmV3IHVzZXMgb2YgX19MSU5FX18pLgo+
PiBJIHdvbmRlciBpZiBfX2Z1bmNfXyBvciBfX0ZVTkNUSU9OX18gY291bGQgYmUgdXNlZCAtIHRo
ZSBtYWluIHF1ZXN0aW9uIGlzCj4+IGhvdyB0aGV5IGJlaGF2ZSB3aGVuIHVzZWQgb3V0c2lkZSBv
ZiBhIGZ1bmN0aW9uLiBJZiBlaXRoZXIgd291bGQgYmUgTlVMTAo+PiAocmF0aGVyIHRoYW4gdHJp
Z2dlcmluZyBhIGRpYWdub3N0aWMpLCBpdCBtaWdodCBiZSB1c2FibGUgaGVyZS4gT2YgY291cnNl
Cj4+IHRoaXMgd291bGQgYmUgZnJhZ2lsZSBpZiBqdXN0IGJhc2VkIG9uIG9ic2VydmVkIChyYXRo
ZXIgdGhhbiBkb2N1bWVudGVkKQo+PiBiZWhhdmlvci4KPiAKPiBXaXRoIGdjYyA3LjQuMSBpdCBm
YWlsczoKPiAKPiAvaG9tZS9ncm9zcy94ZW4veGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmg6ODA6
NDE6IGVycm9yOiDigJhfX2Z1bmNfX+KAmSBpcyAKPiBub3QgZGVmaW5lZCBvdXRzaWRlIG9mIGZ1
bmN0aW9uIHNjb3BlIFstV2Vycm9yXQo+ICAgI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsg
MCwgI25hbWUsIF9fZnVuY19fLCAmbmFtZSwgMCwgMCwgMCwgMCwgMCB9CgpSaWdodCwgYXMgSSB3
YXMgYWZyYWlkIG9mLiBCdXQgX19QUkVUVFlfRlVOQ1RJT05fXyBsb29rcyB0byBiZSBzdWl0YWJs
ZQooYXMgcGVyIHRoZSBnY2MgZG9jLCBhbmQgYXMgcGVyIHRoZXJlIGJlaW5nIGNsZWFyIGluZGlj
YXRpb25zIHRoYXQgY2xhbmcKYWxzbyBzdXBwb3J0cyB0aGlzKS4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
