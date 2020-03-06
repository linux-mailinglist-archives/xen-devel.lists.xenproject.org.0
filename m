Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375217C0E6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:51:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAEIc-00042h-I1; Fri, 06 Mar 2020 14:50:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAEIb-0003x1-DP
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:50:01 +0000
X-Inumbo-ID: c0cd765a-5fb9-11ea-a7fa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0cd765a-5fb9-11ea-a7fa-12813bfff9fa;
 Fri, 06 Mar 2020 14:50:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 415E5B352;
 Fri,  6 Mar 2020 14:49:59 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
 <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
 <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
 <c192ccd1-daed-2e8c-36f1-adac6cd71822@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e14cbcb2-f1c7-9cf9-c3a7-2feb14d02ba6@suse.com>
Date: Fri, 6 Mar 2020 15:50:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c192ccd1-daed-2e8c-36f1-adac6cd71822@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, Paul Durrant <xadimgnik@gmail.com>,
 'Tim Deegan' <tim@xen.org>, 'Tamas K Lengyel' <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org, pdurrant@amzn.com,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNToyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA2LzAzLzIwMjAg
MTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNi4wMy4yMDIwIDEzOjM1LCBQYXVsIER1
cnJhbnQgd3JvdGU6Cj4+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoCj4+Pj4gU2VudDogMDYg
TWFyY2ggMjAyMCAxMjoyMAo+Pj4+Cj4+Pj4gT24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRA
YW16bi5jb20gd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9u
LmMKPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+Pj4+PiBAQCAt
MjA4NywxOSArMjA4NywyMiBAQCBzdGF0aWMgaW50IHNoX3JlbW92ZV9hbGxfbWFwcGluZ3Moc3Ry
dWN0IGRvbWFpbiAqZCwgbWZuX3QgZ21mbiwgZ2ZuX3QgZ2ZuKQo+Pj4+PiAgICAgICAgICAgICog
VGhlIHFlbXUgaGVscGVyIHByb2Nlc3MgaGFzIGFuIHVudHlwZWQgbWFwcGluZyBvZiB0aGlzIGRv
bSdzIFJBTQo+Pj4+PiAgICAgICAgICAgICogYW5kIHRoZSBIVk0gcmVzdG9yZSBwcm9ncmFtIHRh
a2VzIGFub3RoZXIuCj4+Pj4+ICAgICAgICAgICAgKiBBbHNvIGFsbG93IG9uZSB0eXBlZCByZWZj
b3VudCBmb3IKPj4+Pj4gLSAgICAgICAgICogLSBYZW4gaGVhcCBwYWdlcywgdG8gbWF0Y2ggc2hh
cmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgpLAo+Pj4+PiAtICAgICAgICAgKiAtIGlvcmVxIHNlcnZl
ciBwYWdlcywgdG8gbWF0Y2ggcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPj4+Pj4gKyAgICAg
ICAgICogLSBzcGVjaWFsIHBhZ2VzLCB3aGljaCBhcmUgZXhwbGljaXRseSByZWZlcmVuY2VkIGFu
ZCBtYXBwZWQgYnkKPj4+Pj4gKyAgICAgICAgICogICBYZW4uCj4+Pj4+ICsgICAgICAgICAqIC0g
aW9yZXEgc2VydmVyIHBhZ2VzLCB3aGljaCBtYXkgYmUgc3BlY2lhbCBwYWdlcyBvciBub3JtYWwK
Pj4+Pj4gKyAgICAgICAgICogICBndWVzdCBwYWdlcyB3aXRoIGFuIGV4dHJhIHJlZmVyZW5jZSB0
YWtlbiBieQo+Pj4+PiArICAgICAgICAgKiAgIHByZXBhcmVfcmluZ19mb3JfaGVscGVyKCkuCj4+
Pj4+ICAgICAgICAgICAgKi8KPj4+Pj4gICAgICAgICAgIGlmICggIShzaGFkb3dfbW9kZV9leHRl
cm5hbChkKQo+Pj4+PiAgICAgICAgICAgICAgICAgICYmIChwYWdlLT5jb3VudF9pbmZvICYgUEdD
X2NvdW50X21hc2spIDw9IDMKPj4+Pj4gICAgICAgICAgICAgICAgICAmJiAoKHBhZ2UtPnUuaW51
c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAg
PT0gKGlzX3hlbl9oZWFwX3BhZ2UocGFnZSkgfHwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICA9
PSAoaXNfc3BlY2lhbF9wYWdlKHBhZ2UpIHx8Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAoaXNfaHZtX2RvbWFpbihkKSAmJiBpc19pb3JlcV9zZXJ2ZXJfcGFnZShkLCBwYWdlKSkpKSkg
KQo+Pj4+Cj4+Pj4gU2hvdWxkbid0IHlvdSBkZWxldGUgbW9zdCBvZiB0aGlzIGxpbmUsIGFmdGVy
IHRoZSBwcmV2aW91cyBwYXRjaAo+Pj4+IGNvbnZlcnRlZCB0aGUgaW9yZXEgc2VydmVyIHBhZ2Vz
IHRvIFBHQ19leHRyYSBvbmVzPwo+Pj4KPj4+IEkgdGhvdWdodCB0aGF0IHRvbyBvcmlnaW5hbGx5
IGJ1dCB0aGVuIEkgcmVhbGlzZSB3ZSBzdGlsbCBoYXZlIHRvCj4+PiBjYXRlciBmb3IgdGhlICds
ZWdhY3knIGVtdWxhdG9ycyB0aGF0IHN0aWxsIHJlcXVpcmUgSU9SRVEgc2VydmVyCj4+PiBwYWdl
cyB0byBiZSBtYXBwZWQgdGhyb3VnaCB0aGUgcDJtLCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBu
b3QKPj4+IGJlIFBHQ19leHRyYSBwYWdlcy4KPj4KPj4gT2gsIGluZGVlZC4gKEkgZG9uJ3Qgc3Vw
cG9zZSB3ZSBjYW4gZXZlciBkbyBhd2F5IHdpdGggdGhpcyBsZWdhY3kKPj4gbWVjaGFuaXNtPykK
Pj4KPj4+PiBBbHNvIEkgbm90aWNlIHRoaXMgY29uc3RydWN0IGlzIHVzZWQgYnkgeDg2IGNvZGUg
b25seSAtIGlzIHRoZXJlCj4+Pj4gYSBwYXJ0aWN1bGFyIHJlYXNvbiBpdCBkb2Vzbid0IGdldCBw
bGFjZWQgaW4gYW4geDg2IGhlYWRlciAoYXQKPj4+PiBsZWFzdCBmb3IgdGhlIHRpbWUgYmVpbmcp
Pwo+Pj4KPj4+IFBHQ19leHRyYSBwYWdlcyBhcmUgY29tbW9uIHNvIG1heWJlIGl0IGlzIGJldHRl
ciBvZmYgZGVmaW5lZCBoZXJlCj4+PiBzbyBpdCBpcyBhdmFpbGFibGUgdG8gQVJNIGNvZGU/Cj4+
Cj4+IFRvIGJlIGhvbmVzdCwgbXkgcXVlc3Rpb24gd2FzIG1haW5seSBiYXNlZCBvbiBtZSBiZWlu
ZyBwdXp6bGVkIHRoYXQKPj4gQXJtIChvciBjb21tb24pIGNvZGUgZG9lc24ndCBuZWVkIGFueSBz
dWNoIGFkanVzdG1lbnQuIEFzIGEgcmVzdWx0Cj4+IEknbSB3b25kZXJpbmcgd2hldGhlciB0aGF0
J3MganVzdCAibHVjayIgKGluIHdoaWNoIGNhc2UgSSdkIGFncmVlCj4+IHRoZSBwbGFjZW1lbnQg
Y291bGQgcmVtYWluIGFzIGlzKSwgb3Igd2hldGhlciB0aGVyZSdzIGEgZGVlcGVyCj4+IHJlYXNv
biBiZWhpbmQgdGhhdCwgbGFyZ2VseSBndWFyYW50ZWVpbmcgQXJtIHdvdWxkIGFsc28gbmV2ZXIg
bmVlZAo+PiBpdC4KPiAKPiBpc19zcGVjaWFsX3BhZ2UoKSBpcyB1c2VkIGluIGZlYXR1cmVzIHRo
YXQgYXJlIG5vdCBzdXBwb3J0ZWQgb24gQXJtIHlldCAKPiAoZS5nIG1pZ3JhdGlvbikuIFNvIHdl
IHdpbGwgbmVlZCBpdCBpbiB0aGUgZnV0dXJlIGFuZCB0aGVyZWZvcmUgdGhlIAo+IGhlbHBlciBz
aG91bGQgYmUgZGVmaW5lZCBpbiBjb21tb24gaGVhZGVyLgoKT2theSB0aGVuLCB0aGFua3MgZm9y
IGNsYXJpZnlpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
