Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7316118A24
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 14:49:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iefq6-0000P4-BY; Tue, 10 Dec 2019 13:46:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iefq4-0000Oz-6K
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 13:46:08 +0000
X-Inumbo-ID: 699d0eae-1b53-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 699d0eae-1b53-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 13:46:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E842AAC82;
 Tue, 10 Dec 2019 13:46:04 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191209112954.124169-1-george.dunlap@citrix.com>
 <194245a0-fd02-25d6-289e-251c12b7532a@suse.com>
 <44621429-b626-1f01-010a-04e65ae63f3b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49c55a7a-af65-9b1c-c5db-1664571a4393@suse.com>
Date: Tue, 10 Dec 2019 14:46:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <44621429-b626-1f01-010a-04e65ae63f3b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] CODING_STYLE: Document how to handle
 unexpected conditions
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMTo1NiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi85LzE5IDE6
NTAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOS4xMi4yMDE5IDEyOjI5LCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOgo+Pj4gLS0tIGEvQ09ESU5HX1NUWUxFCj4+PiArKysgYi9DT0RJTkdfU1RZ
TEUKPj4+IEBAIC0xMzMsMyArMTMzLDk3IEBAIHRoZSBlbmQgb2YgZmlsZXMuICBJdCBzaG91bGQg
YmU6Cj4+PiAgICogaW5kZW50LXRhYnMtbW9kZTogbmlsCj4+PiAgICogRW5kOgo+Pj4gICAqLwo+
Pj4gKwo+Pj4gK0hhbmRsaW5nIHVuZXhwZWN0ZWQgY29uZGl0aW9ucwo+Pj4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gKwo+Pj4gK0dVSURFTElORVM6Cj4+PiArCj4+PiArUGFz
c2luZyBlcnJvcnMgdXAgdGhlIHN0YWNrIHNob3VsZCBiZSB1c2VkIHdoZW4gdGhlIGNhbGxlciBp
cyBhbHJlYWR5Cj4+PiArZXhwZWN0aW5nIHRvIGhhbmRsZSBlcnJvcnMsIGFuZCB0aGUgc3RhdGUg
d2hlbiB0aGUgZXJyb3Igd2FzCj4+PiArZGlzY292ZXJlZCBpc27igJl0IGJyb2tlbiwgb3IgaXNu
J3QgdG9vIGhhcmQgdG8gZml4Lgo+Pj4gKwo+Pj4gK2RvbWFpbl9jcmFzaCgpIHNob3VsZCBiZSB1
c2VkIHdoZW4gcGFzc2luZyBlcnJvcnMgdXAgdGhlIHN0YWNrIGlzIHRvbwo+Pj4gK2RpZmZpY3Vs
dCwgYW5kL29yIHdoZW4gZml4aW5nIHVwIHN0YXRlIG9mIGEgZ3Vlc3QgaXMgaW1wcmFjdGljYWws
IGJ1dAo+Pj4gK3doZXJlIGZpeGluZyB1cCB0aGUgc3RhdGUgb2YgWGVuIHdpbGwgYWxsb3cgWGVu
IHRvIGNvbnRpbnVlIHJ1bm5pbmcuCj4+PiArVGhpcyBpcyBwYXJ0aWN1bGFybHkgYXBwcm9wcmlh
dGUgd2hlbiB0aGUgZ3Vlc3QgaXMgZXhoaWJpdGluZyBiZWhhdmlvcgo+Pj4gK3dlbGwtYmVoYXZl
ZCBndWVzdCBzaG91bGQuCj4+Cj4+IERZTSAic2hvdWxkbid0Ij8KPiAKPiBJbmRlZWQuCgooQnR3
LCBub3RpY2luZyBvbmx5IG5vdyAtIHRoZXJlJ3MgYWxzbyBlaXRoZXIgYW4gImEiIG1pc3Npbmcs
IG9yIGl0CndhbnRzIHRvIGJlICJndWVzdHMiLikKCj4+PiArLSBkb21haW5fY3Jhc2goKSBpcyBz
aW1pbGFyIHRvIEJVR19PTigpLCBidXQgd2l0aCBhIG1vcmUgbGltaXRlZAo+Pj4gK2VmZmVjdDog
aXQgc3RvcHMgdGhhdCBkb21haW4gaW1tZWRpYXRlbHkuICBJbiBzaXR1YXRpb25zIHdoZXJlCj4+
PiArY29udGludWluZyBtaWdodCBjYXVzZSBndWVzdCBvciBoeXBlcnZpc29yIGNvcnJ1cHRpb24s
IGJ1dCBkZXN0cm95aW5nCj4+PiArdGhlIGd1ZXN0IGFsbG93cyB0aGUgaHlwZXJ2aXNvciB0byBj
b250aW51ZSwgdGhpcyBjYW4gY2hhbmdlIGEgbW9yZQo+Pj4gK3NlcmlvdXMgYnVnIGludG8gYSBn
dWVzdCBkZW5pYWwtb2Ytc2VydmljZS4gIEJ1dCBpbiBzaXR1YXRpb25zIHdoZXJlCj4+PiArcmV0
dXJuaW5nIGFuIGVycm9yIG1pZ2h0IGJlIHNhZmUsIHRoZW4gZG9tYWluX2NyYXNoKCkgY2FuIGNo
YW5nZSBhCj4+PiArYmVuaWduIGZhaWx1cmUgaW50byBhIGd1ZXN0IGRlbmlhbC1vZi1zZXJ2aWNl
Lgo+Pgo+PiBQZXJoYXBzIGZ1cnRoZXIgcHV0IGVtcGhhc2lzIG9uIHRoZSBjYWxsIHRyZWUgc3Rp
bGwgZ2V0dGluZyB1bndvdW5kCj4+IG5vcm1hbGx5LCB3aGljaCBtYXkgaW1wbHkgZnVydGhlciBh
Y3Rpb25zIG9uIHRoZSAobm93IGR5aW5nKSBkb21haW4KPj4gdGFrZW4uIFVuZm9ydHVuYXRlbHkg
aXQncyBub3QgdW51c3VhbCBmb3IgcGVvcGxlIHRvIGZvcmdldCB0aGlzOyBJCj4+IHRoaW5rIHRo
ZSBJT01NVSBjb2RlIGluIHBhcnRpY3VsYXIgd2FzIChob3BlZnVsbHkgaXNuJ3Qgc28gbXVjaAo+
PiBhbnltb3JlKSBhICJnb29kIiBleGFtcGxlIG9mIHRoaXMuCj4gCj4gQ2FuIHlvdSBleHBhbmQg
b24gdGhpcz8gIERvIHlvdSBtZWFuIHRvIGFkdmlzZSB0aGF0IGNhcmUgc2hvdWxkIGJlIHRha2Vu
Cj4gd2hlbiByZXR1cm5pbmcgdXAgdGhlIGNhbGxzdGFjayB0aGF0IHRoZSBkb21haW4gd2hpY2gg
d2FzIHJ1bm5pbmcgYmVmb3JlCj4gbWF5IG5vdyBiZSBkeWluZywgYW5kIHRvIGJlaGF2ZSBhcHBy
b3ByaWF0ZWx5PwoKT25lIGlzc3VlIGlzIHdpdGggZnVuY3Rpb25zIHJldHVybmluZyB2b2lkLCB3
aGVyZSB0aGUgY2FsbGVyIHdvbid0CmV2ZW4ga25vdyB0aGF0IHNvbWV0aGluZyBtYXkgaGF2ZSBn
b25lIHdyb25nLiBBbm90aGVyIGlzIHRoYXQKdHlwaWNhbGx5IGVycm9yIHBhdGhzIGFyZSBsZXNz
IGNvbW1vbmx5IHVzZWQsIGFuZCBjcmFzaGluZyBhCmRvbWFpbiB3b3VsZCB0eXBpY2FsbHkgYmUg
YWNjb21wYW5pZWQgYnkgaW5kaWNhdGluZyBhbiBlcnJvciB0bwp0aGUgdXBwZXIgbGF5ZXJzLiBI
ZW5jZSBzdWNoIGNyYXNoaW5nIG1heSB0cmlnZ2VyIHVucmVsYXRlZCBidWdzLgpBIHRoaXJkIGFz
cGVjdCBpcyB0aGF0LCBpbmRlZWQsIGR5aW5nIGd1ZXN0cyBtYXkgbmVlZCBzcGVjaWFsCnRyZWF0
bWVudCAoc2VlIHRoZSBhbHJlYWR5IGV4aXN0aW5nIC0+aXNfZHlpbmcgY2hlY2tzIHdlIGhhdmUp
LgoKSSBtZW50aW9uZWQgdGhlIGNhbGwgdHJlZSB1bndpbmRpbmcgaW4gcGFydGljdWxhciBiZWNh
dXNlIGVhcmxpZXIKb24gd2UgaGFkIGRvbWFpbl9jcmFzaF9zeW5jaHJvbm91cygpLCB3aGljaCB3
YXMgdGhlcmUgc3BlY2lmaWNhbGx5CnRvIGF2b2lkIGlzc3VlcyB3aXRoIGVycm9ycyAoYW5kIHRo
ZSBjaGFuZ2VkIHN0YXRlKSBidWJibGluZyBiYWNrCnVwLiBCdXQgdGhpcyBtb2RlbCBoYWQgb3Ro
ZXIgaXNzdWVzLCBoZW5jZSBvdXIgbW92ZW1lbnQgYXdheSBmcm9tCml0LgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
