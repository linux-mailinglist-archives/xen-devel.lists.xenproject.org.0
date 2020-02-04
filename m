Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E700151D2A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:25:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz01v-0000Gg-0o; Tue, 04 Feb 2020 15:22:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iz01t-0000GY-Ar
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:22:21 +0000
X-Inumbo-ID: 22844178-4762-11ea-8f83-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22844178-4762-11ea-8f83-12813bfff9fa;
 Tue, 04 Feb 2020 15:22:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E986CAAFD;
 Tue,  4 Feb 2020 15:22:18 +0000 (UTC)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
Date: Tue, 4 Feb 2020 16:22:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNjoxNCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IEZyb206IEpl
ZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgo+IAo+IFRoZSBYZW4g
aGVhcCBpcyBzcGxpdCB1cCBpbnRvIG5vZGVzIGFuZCB6b25lcy4gRWFjaCBub2RlICsgem9uZSBp
cwo+IG1hbmFnZWQgYXMgYSBzZXBhcmF0ZSBwb29sIG9mIG1lbW9yeS4KPiAKPiBXaGVuIHJldHVy
bmluZyBwYWdlcyB0byB0aGUgaGVhcCwgZnJlZV9oZWFwX3BhZ2VzIHdpbGwgY2hlY2sgYWRqYWNl
bnQKPiBibG9ja3MgdG8gc2VlIGlmIHRoZXkgY2FuIGJlIGNvbWJpbmVkIGludG8gYSBsYXJnZXIg
YmxvY2suIEhvd2V2ZXIsIHRoZQo+IHpvbmUgb2YgdGhlIGFkamFjZW50IGJsb2NrIGlzIG5vdCBj
aGVja2VkLiBUaGlzIHJlc3VsdHMgaW4gYmxvY2tzIHRoYXQKPiBtaWdyYXRlIGZyb20gb25lIHpv
bmUgdG8gYW5vdGhlci4KPiAKPiBXaGVuIGEgYmxvY2sgbWlncmF0ZXMgdG8gdGhlIGFkamFjZW50
IHpvbmUsIHRoZSBhdmFpbCBjb3VudGVycyBmb3IgdGhlCj4gb2xkIGFuZCBuZXcgbm9kZSArIHpv
bmUgaXMgbm90IHVwZGF0ZWQgYWNjb3JkaW5nbHkuIFRoZSBhdmFpbCBjb3VudGVyCj4gaXMgdXNl
ZCB3aGVuIGFsbG9jYXRpbmcgcGFnZXMgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdG8gc2tpcCBvdmVy
IGEgem9uZS4KPiBXaXRoIHRoaXMgYmVoYXZpb3IsIGl0IGlzIHBvc3NpYmxlIGZvciBmcmVlIHBh
Z2VzIHRvIGNvbGxlY3QgaW4gYSB6b25lCj4gd2l0aCB0aGUgYXZhaWwgY291bnRlciBzbWFsbGVy
IHRoYW4gdGhlIGFjdHVhbCBwYWdlIGNvdW50LCByZXN1bHRpbmcKPiBpbiBmcmVlIHBhZ2VzIHRo
YXQgYXJlIG5vdCBhbGxvY2FibGUuCgoiV2hlbiBhIGJsb2NrIG1pZ3JhdGVzIiAtIGZpbmUuIEJ1
dCBpcyB0aGlzIHNpdHVhdGlvbiBwb3NzaWJsZSB0bwpvY2N1ciwgd2l0aG91dCAieGVuL3BhZ2Vf
YWxsb2M6IEtlZXAgYXdheSBNRk4gMCBmcm9tIHRoZSBidWRkeQphbGxvY2F0b3IiIHJldmVydGVk
PyBJZiBub3QsIHRoZXJlJ3Mgbm8gYnVnLCBubyBuZWVkIGZvciBhIGNoYW5nZSwKYW5kIGV2ZW4g
bGVzcyBzbyAuLi4KCj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiArKysgYi94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBAIC0xNDYyLDYgKzE0NjIsNyBAQCBzdGF0aWMgdm9pZCBm
cmVlX2hlYXBfcGFnZXMoCj4gICAgICAgICAgICAgIGlmICggIW1mbl92YWxpZChwYWdlX3RvX21m
bihwcmVkZWNlc3NvcikpIHx8Cj4gICAgICAgICAgICAgICAgICAgIXBhZ2Vfc3RhdGVfaXMocHJl
ZGVjZXNzb3IsIGZyZWUpIHx8Cj4gICAgICAgICAgICAgICAgICAgKFBGTl9PUkRFUihwcmVkZWNl
c3NvcikgIT0gb3JkZXIpIHx8Cj4gKyAgICAgICAgICAgICAgICAgKHBhZ2VfdG9fem9uZShwcmVk
ZWNlc3NvcikgIT0gem9uZSkgfHwKPiAgICAgICAgICAgICAgICAgICAocGh5c190b19uaWQocGFn
ZV90b19tYWRkcihwcmVkZWNlc3NvcikpICE9IG5vZGUpICkKPiAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAKPiBAQCAtMTQ4NSw2ICsxNDg2LDcgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3Bh
Z2VzKAo+ICAgICAgICAgICAgICBpZiAoICFtZm5fdmFsaWQocGFnZV90b19tZm4oc3VjY2Vzc29y
KSkgfHwKPiAgICAgICAgICAgICAgICAgICAhcGFnZV9zdGF0ZV9pcyhzdWNjZXNzb3IsIGZyZWUp
IHx8Cj4gICAgICAgICAgICAgICAgICAgKFBGTl9PUkRFUihzdWNjZXNzb3IpICE9IG9yZGVyKSB8
fAo+ICsgICAgICAgICAgICAgICAgIChwYWdlX3RvX3pvbmUoc3VjY2Vzc29yKSAhPSB6b25lKSB8
fAo+ICAgICAgICAgICAgICAgICAgIChwaHlzX3RvX25pZChwYWdlX3RvX21hZGRyKHN1Y2Nlc3Nv
cikpICE9IG5vZGUpICkKPiAgICAgICAgICAgICAgICAgIGJyZWFrOwoKLi4uIGZvciBvbmUgdGhh
dCBzbG93cyBkb3duIG1hbnkgZnJlZSBvcGVyYXRpb25zLCBldmVuIGlmIGp1c3QKc2xpZ2h0bHku
IElPVyBhZmFpY3QgZWl0aGVyIHRoZSBjaGFuZ2UgaXMgbm90IG5lZWRlZCwgb3IgaXRzCmRlc2Ny
aXB0aW9uIG5lZWRzIHVwZGF0aW5nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
