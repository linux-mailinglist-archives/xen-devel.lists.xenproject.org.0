Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4455A2A9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 19:42:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgupI-0008M8-7v; Fri, 28 Jun 2019 17:38:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hgupG-0008M3-Hz
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 17:38:18 +0000
X-Inumbo-ID: 822b575a-99cb-11e9-94a9-6fa51ebdb5d2
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 822b575a-99cb-11e9-94a9-6fa51ebdb5d2;
 Fri, 28 Jun 2019 17:38:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A22D9ADEA;
 Fri, 28 Jun 2019 17:38:14 +0000 (UTC)
To: Michal Hocko <mhocko@kernel.org>
References: <20190620160821.4210-1-jgross@suse.com>
 <20190628151749.GA2880@dhcp22.suse.cz>
From: Juergen Gross <jgross@suse.com>
Message-ID: <52a8e6d9-003e-c802-b8ff-327a8c7913a5@suse.com>
Date: Fri, 28 Jun 2019 19:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628151749.GA2880@dhcp22.suse.cz>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] mm: fix regression with deferred struct
 page init
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
Cc: linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDYuMTkgMTc6MTcsIE1pY2hhbCBIb2NrbyB3cm90ZToKPiBPbiBUaHUgMjAtMDYtMTkg
MTg6MDg6MjEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IENvbW1pdCAwZTU2YWNhZTRiNGRkNGE5
ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEgdGltZQo+PiBpbnN0ZWFk
IG9mIGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpIGlzIGNhdXNpbmcgYSByZWdyZXNzaW9uIG9uIHNv
bWUKPj4gc3lzdGVtcyB3aGVuIHRoZSBrZXJuZWwgaXMgYm9vdGVkIGFzIFhlbiBkb20wLgo+Pgo+
PiBUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5IGJvb3QuCj4+Cj4+IFJlYXNvbiBp
cyBhbiBlbmRsZXNzIGxvb3AgaW4gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGluIGNhc2UgdGhl
IGZpcnN0Cj4+IHpvbmUgbG9va2VkIGF0IGhhcyBubyBmcmVlIG1lbW9yeS4gZGVmZXJyZWRfZ3Jv
d196b25lKCkgaXMgYWx3YXlzCj4gCj4gQ291bGQgeW91IGV4cGxhaW4gaG93IHdlIGVuZGVkIHVw
IHdpdGggdGhlIHpvbmUgaGF2aW5nIG5vIG1lbW9yeT8gSXMKPiB4ZW4gInN0ZWFsaW5nIiBtZW1i
bG9jayBtZW1vcnkgd2l0aG91dCBhZGRpbmcgaXQgdG8gbWVtb3J5LnJlc2VydmVkPwo+IEluIG90
aGVyIHdvcmRzLCBob3cgZG8gd2UgZW5kIHVwIHdpdGggYW4gZW1wdHkgem9uZSB0aGF0IGhhcyBu
b24gemVybwo+IGVuZF9wZm4/CgpXaHkgZG8geW91IHRoaW5rIFhlbiBpcyBzdGVhbGluZyB0aGUg
bWVtb3J5IGluIGFuIG9kZCB3YXk/CgpEb2Vzbid0IGRlZmVycmVkX2luaXRfbWVtX3Bmbl9yYW5n
ZV9pbl96b25lKCkgcmV0dXJuIGZhbHNlIHdoZW4gbm8gZnJlZQptZW1vcnkgaXMgZm91bmQ/IFNv
IGV4YWN0bHkgaWYgdGhlIG1lbW9yeSB3YXMgYWRkZWQgdG8gbWVtb3J5LnJlc2VydmVkCnRoYXQg
d2lsbCBoYXBwZW4uCgpJIGd1ZXNzIHRoZSBkaWZmZXJlbmNlIHRvIGEgYmFyZSBtZXRhbCBib290
IGlzIHRoYXQgYSBYZW4gZG9tMCB3aWxsIG5lZWQKcHJvYmFibHkgbW9yZSBtZW1vcnkgaW4gZWFy
bHkgYm9vdCBwaGFzZSwgc28gdGhhdCBpc3N1ZSBpcyBtb3JlIGxpa2VseQp0byBvY2N1ci4KCklu
IG15IGNhc2UgdGhlIHN5c3RlbSBoYWQgdHdvIHpvbmVzLCB3aGVyZSB0aGUgMm5kIHpvbmUgaGFk
IHNvbWUgZnJlZQptZW1vcnkuIFRoZSBzZWFyY2ggbmV2ZXIgbWFkZSBpdCB0byB0aGUgMm5kIHpv
bmUgYXMgdGhlIHNlYXJjaCBlbmRlZCBpbgphbiBlbmRsZXNzIGxvb3AgZm9yIHRoZSAxc3Qgem9u
ZS4KCj4gCj4+IHJldHVybmluZyB0cnVlIGR1ZSB0byB0aGUgZm9sbG93aW5nIGNvZGUgc25pcHBs
ZXQ6Cj4+Cj4+ICAgIC8qIElmIHRoZSB6b25lIGlzIGVtcHR5IHNvbWVib2R5IGVsc2UgbWF5IGhh
dmUgY2xlYXJlZCBvdXQgdGhlIHpvbmUgKi8KPj4gICAgaWYgKCFkZWZlcnJlZF9pbml0X21lbV9w
Zm5fcmFuZ2VfaW5fem9uZSgmaSwgem9uZSwgJnNwZm4sICZlcGZuLAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpcnN0X2RlZmVycmVkX3BmbikpIHsKPj4g
ICAgICAgICAgICBwZ2RhdC0+Zmlyc3RfZGVmZXJyZWRfcGZuID0gVUxPTkdfTUFYOwo+PiAgICAg
ICAgICAgIHBnZGF0X3Jlc2l6ZV91bmxvY2socGdkYXQsICZmbGFncyk7Cj4+ICAgICAgICAgICAg
cmV0dXJuIHRydWU7Cj4+ICAgIH0KPj4KPj4gVGhpcyBpbiB0dXJuIHJlc3VsdHMgaW4gdGhlIGxv
b3AgYXMgZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGlzCj4+IGFzc3VtaW5nIGZvcndhcmQgcHJv
Z3Jlc3MgY2FuIGJlIG1hZGUgYnkgZG9pbmcgc29tZSBtb3JlIHN0cnVjdCBwYWdlCj4+IGluaXRp
YWxpemF0aW9uLgo+IAo+IFRoZSBwYXRjaCBsb29rcyBjb3JyZWN0LiBUaGUgY29kZSBpcyBzdWJ0
bGUgYnV0IHRoZSBjb21tZW50IGhlbHBzLgo+IAo+PiBDYzogQWxleGFuZGVyIER1eWNrIDxhbGV4
YW5kZXIuaC5kdXlja0BsaW51eC5pbnRlbC5jb20+Cj4+IEZpeGVzOiAwZTU2YWNhZTRiNGRkNGE5
ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEgdGltZSBpbnN0ZWFkIG9m
IGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpCj4+IFN1Z2dlc3RlZC1ieTogQWxleGFuZGVyIER1eWNr
IDxhbGV4YW5kZXIuaC5kdXlja0BsaW51eC5pbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogTWljaGFsIEhvY2tv
IDxtaG9ja29Ac3VzZS5jb20+CgpUaGFua3MsCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
