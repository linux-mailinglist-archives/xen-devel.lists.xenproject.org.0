Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A410AEB1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:29:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvSq-0002yF-T6; Wed, 27 Nov 2019 11:26:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZvSp-0002y5-Ma
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:26:31 +0000
X-Inumbo-ID: c0d5e754-1108-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0d5e754-1108-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 11:26:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AE5E0AC23;
 Wed, 27 Nov 2019 11:26:27 +0000 (UTC)
To: Julien Grall <jgrall@amazon.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191126171715.10881-1-pdurrant@amazon.com>
 <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
 <06f26e5b-d921-1796-391e-d0ec2ae0a3a4@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a9aa78a-bab1-e37a-d027-88bc1c5e2a00@suse.com>
Date: Wed, 27 Nov 2019 12:26:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <06f26e5b-d921-1796-391e-d0ec2ae0a3a4@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when
 the domain is destroyed
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMjoxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI3
LzExLzIwMTkgMDk6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyNi4xMS4yMDE5IDE4OjE3
LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPgo+Pj4KPj4+IEEgZ3Vlc3Qgd2lsbCBzZXR1cCBhIHNoYXJlZCBwYWdlIHdpdGggdGhl
IGh5cGVydmlzb3IgZm9yIGVhY2ggdkNQVSB2aWEKPj4+IFhFTlBNVV9pbml0LiBUaGUgcGFnZSB3
aWxsIHRoZW4gZ2V0IG1hcHBlZCBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgb25seQo+Pj4gcmVsZWFz
ZWQgd2hlbiBYRU1QTVVfZmluaXNoIGlzIGNhbGxlZC4KPj4+Cj4+PiBUaGlzIG1lYW5zIHRoYXQg
aWYgdGhlIGd1ZXN0IGlzIG5vdCBzaHV0ZG93biBncmFjZWZ1bGx5IChzdWNoIGFzIHZpYSB4bAo+
Pj4gZGVzdHJveSksIHRoZSBwYWdlIHdpbGwgc3RheSBtYXBwZWQgaW4gdGhlIGh5cGVydmlzb3Iu
Cj4+Cj4+IElzbid0IHRoaXMgc3RpbGwgdG9vIHdlYWsgYSBkZXNjcmlwdGlvbj8gSXQncyBub3Qg
dGhlIHRvb2wgc3RhY2sKPj4gaW52b2tpbmcgWEVOUE1VX2ZpbmlzaCwgYnV0IHRoZSBndWVzdCBp
dHNlbGYgYWZhaWNzLiBJLmUuIGEKPj4gbWlzYmVoYXZpbmcgZ3Vlc3QgY291bGQgcHJldmVudCBw
cm9wZXIgY2xlYW51cCBldmVuIHdpdGggZ3JhY2VmdWwKPj4gc2h1dGRvd24uCj4+Cj4+PiBAQCAt
MjIyNCw2ICsyMjIxLDkgQEAgaW50IGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3Qg
ZG9tYWluICpkKQo+Pj4gICAgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICkKPj4+ICAgICAgICAg
ICBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKGQpOwo+Pj4gICAKPj4+ICsgICAgZm9y
X2VhY2hfdmNwdSAoIGQsIHYgKQo+Pj4gKyAgICAgICAgdnBtdV9kZXN0cm95KHYpOwo+Pj4gKwo+
Pj4gICAgICAgcmV0dXJuIDA7Cj4+PiAgIH0KPj4KPj4gSSB0aGluayBzaW1wbGUgdGhpbmdzIHdo
aWNoIG1heSBhbGxvdyBzaHJpbmtpbmcgdGhlIHBhZ2UgbGlzdHMKPj4gc2hvdWxkIGJlIGRvbmUg
ZWFybHkgaW4gdGhlIGZ1bmN0aW9uLiBBcyB2cG11X2Rlc3Ryb3koKSBsb29rcwo+PiB0byBiZSBp
ZGVtcG90ZW50LCBob3cgYWJvdXQgbGV2ZXJhZ2luZyB0aGUgdmVyeSBmaXJzdAo+PiBmb3JfZWFj
aF92Y3B1KCkgbG9vcCBpbiB0aGUgZnVuY3Rpb24gKHRoZXJlIGFyZSB0b28gbWFueSBvZiB0aGVt
Cj4+IHRoZXJlIGFueXdheSwgYXQgbGVhc3QgZm9yIG15IHRhc3RlKT8KPiAKPiBUaGlzIGlzIG5v
dCBlbnRpcmVseSBvYnZpb3VzIHRoYXQgdnBtdV9kZXN0cm95KCkgaXMgaWRlbXBvdGVudC4KPiAK
PiBGb3IgaW5zdGFuY2UsIEkgY2FuJ3QgZmluZCBvdXQgd2hvIGlzIGNsZWFyaW5nIFZDUFVfQ09O
VEVYVF9BTExPQ0FURUQuIAo+IHNvIEkgdGhpbmsgdmNwdV9hcmNoX2Rlc3Ryb3koKSB3b3VsZCBi
ZSBleGVjdXRlZCBvdmVyIGFuZCBvdmVyLgo+IAo+IEkgZG9uJ3Qga25vdyB3aGV0aGVyIHRoaXMg
aXMgYW4gaXNzdWUsIGJ1dCBJIGNhbid0IGZpZ3VyZSBvdXQgdGhhdCBpcyBpdCAKPiBub3Qgb25l
LiBEaWQgSSBtaXNzIGFueXRoaW5nPwoKSWYgdGhlIGZ1bmN0aW9uIHdhc24ndCBpZGVtcG90ZW50
LCB0aGVuIGNhbGxpbmcgaXQgdW5jb25kaXRpb25hbGx5CmZyb20gZG9tYWluX3JlbGlucXVpc2hf
cmVzb3VyY2VzKCkgd291bGQgYmUgd3JvbmcgdG9vLiBBZnRlciBhbGwKdGhlIGd1ZXN0IG1heSBo
YXZlIGludm9rZWQgWEVOUE1VX2ZpbmlzaC4KCkFzIHRvIFZDUFVfQ09OVEVYVF9BTExPQ0FURUQg
LSBJIGRvbid0IHRoaW5rIHRoaXMgZXZlciBnZXRzIGNsZWFyZWQKYW55d2hlcmUuIEJ1dCB0aGlz
IGJ5IGl0c2VsZiBkb2Vzbid0IG1ha2UgdGhlIGZ1bmN0aW9uIG5vbi0KaWRlbXBvdGVudC4gVGhl
IHZwbXVfY2xlYXJfbGFzdCBpbnZvY2F0aW9uLCBmb3IgZXhhbXBsZSwgd2lsbApoYXBwZW4ganVz
dCBvbmNlLiBBbmQge2FtZCxjb3JlMn1fdnBtdV9kZXN0cm95KCkgbG9vayBva2F5IGF0IHRoZQpm
aXJzdCBnbGFuY2UsIHRvby4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
