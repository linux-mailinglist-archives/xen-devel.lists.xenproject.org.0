Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5591405E1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:14:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNfy-00048e-7n; Fri, 17 Jan 2020 09:12:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isNfx-00048Z-FM
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:12:21 +0000
X-Inumbo-ID: 72243358-3909-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72243358-3909-11ea-a2eb-bc764e2007e4;
 Fri, 17 Jan 2020 09:12:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C28EB2D9;
 Fri, 17 Jan 2020 09:12:11 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
 <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fec3f76c-c85e-1bd6-2049-c0b6031005fe@suse.com>
Date: Fri, 17 Jan 2020 10:12:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 00/18] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxNzoyNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgSmFu
IDE2LCAyMDIwIGF0IDg6NDcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMDguMDEuMjAyMCAxODoxMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
VGFtYXMgSyBMZW5neWVsICgxOCk6Cj4+PiAgIHg4Ni9odm06IGludHJvZHVjZSBodm1fY29weV9j
b250ZXh0X2FuZF9wYXJhbXMKPj4+ICAgeGVuL3g4NjogTWFrZSBoYXBfZ2V0X2FsbG9jYXRpb24g
YWNjZXNzaWJsZQo+Pj4gICB4ODYvbWVtX3NoYXJpbmc6IG1ha2UgZ2V0X3R3b19nZm5zIHRha2Ug
bG9ja3MgY29uZGl0aW9uYWxseQo+Pj4gICB4ODYvbWVtX3NoYXJpbmc6IGRyb3AgZmxhZ3MgZnJv
bSBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UKPj4+ICAgeDg2L21lbV9zaGFyaW5nOiBkb24ndCB0
cnkgdG8gdW5zaGFyZSB0d2ljZSBkdXJpbmcgcGFnZSBmYXVsdAo+Pj4gICB4ODYvbWVtX3NoYXJp
bmc6IGRlZmluZSBtZW1fc2hhcmluZ19kb21haW4gdG8gaG9sZCBzb21lIHNjYXR0ZXJlZAo+Pj4g
ICAgIHZhcmlhYmxlcwo+Pj4gICB4ODYvbWVtX3NoYXJpbmc6IFVzZSBJTlZBTElEX01GTiBhbmQg
cDJtX2lzX3NoYXJlZCBpbgo+Pj4gICAgIHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzCj4+PiAgIHg4
Ni9tZW1fc2hhcmluZzogTWFrZSBhZGRfdG9fcGh5c21hcCBzdGF0aWMgYW5kIHNob3J0ZW4gbmFt
ZQo+Pj4gICB4ODYvbWVtX3NoYXJpbmc6IENvbnZlcnQgTUVNX1NIQVJJTkdfREVTVFJPWV9HRk4g
dG8gYSBib29sCj4+Cj4+IEkndmUgbG9va2VkIGF0IHRoZXNlIHBhdGNoZXMsIGFuZCBJIHRoaW5r
IDItNCBhbmQgNy05IGNvdWxkIGdvCj4+IGluIHJpZ2h0IGF3YXkgKDYgaGFzIGEgc21hbGwgcXVl
c3Rpb24gcGVuZGluZywgYnV0IG1heSBvdGhlcndpc2UKPj4gYWxzbyBiZSByZWFkeSksIGlmIHlv
dSB3ZXJlIHRvIGdpdmUgKG9yIGRlbGVnYXRlKSB5b3VyIGFjayB0aGF0Cj4+IHRoZXkgd291bGQg
bmVlZCBhZmFpY3QuIFRob3VnaHRzPwo+Pgo+IAo+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCB5b3Vy
IHF1ZXN0aW9uLiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgc2luY2UKPiBJJ20gdGhlIG1haW50
YWluZXIgb2YgdGhlIGNvZGUgYmVpbmcgY2hhbmdlZCBieSB0aGVzZSBwYXRjaGVzIEkganVzdAo+
IG5lZWQgYSAicmV2aWV3ZWQtYnkiIGZyb20gc29tZW9uZSBpbiB0aGUgY29tbXVuaXR5IGFuZCBu
byBvdXRzdGFuZGluZwo+IGlzc3VlIG9uIHRoZW0uCgpQbGVhc2Ugbm90ZSB0aGF0IG15IHByZXZp
b3VzIG1haWwgd2FzIF90b18gR2VvcmdlLCB3aXRoIHlvdSBvbmx5Cl9jY18tZWQuIEhlbmNlIHRo
ZSBxdWVzdGlvbiB3YXMgdG8gR2VvcmdlLCBub3QgeW91LiAoSXQgaXMgYQpjb21tb24gaXNzdWUg
d2hpY2ggSSBrZWVwIG1lbnRpb25pbmcgb24gbWVldGluZ3MgdGhhdCB0aGUKZGlzdGluY3Rpb24g
b2YgVG8gYW5kIENjIGlzIG9mdGVuIG5vdCBiZWluZyBob25vcmVkLCBhbGJlaXQKdHlwaWNhbGx5
IG1vcmUgYnkgc2VuZGVycyB0aGFuIHJlY2lwaWVudHMuKQoKPiBQcm92aWRlZCB0aGlzIGlzIHY0
IG5vdyBvZiB0aGUgc2VyaWVzIGFuZCBubyBpc3N1ZXMKPiB3ZXJlIHJhaXNlZCBzbyBmYXIgZm9y
IHRoZXNlIHBhcnRpY3VsYXIgcGF0Y2hlcyB0aGV5IGNhbiBiZSBtZXJnZWQKPiB3aXRoIHlvdXIg
UmV2aWV3ZWQtYnkuCgpJIGRvbid0IHRoaW5rIHNvLCB1bmRlciB0aGUgY3VycmVudCAoc3VmZmlj
aWVudGx5KSBjb21tb24KdW5kZXJzdGFuZGluZyBvZiB0aGUgcnVsZXMuIFNlZSBHZW9yZ2UncyBw
cm9wb3NhbCB0byBjaGFuZ2UgdG8gYQptb2RlbCBsaWtlIHdoYXQgeW91IGltcGx5OgpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDEvbXNn
MDA4ODUuaHRtbAoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
