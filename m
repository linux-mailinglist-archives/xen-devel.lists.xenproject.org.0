Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0364CCC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 21:29:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlIDv-0005af-0W; Wed, 10 Jul 2019 19:25:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlIDt-0005aa-C2
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 19:25:49 +0000
X-Inumbo-ID: 855c6455-a348-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 855c6455-a348-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 19:25:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13BB22B;
 Wed, 10 Jul 2019 12:25:48 -0700 (PDT)
Received: from [10.119.48.17] (unknown [10.119.48.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 546963F246;
 Wed, 10 Jul 2019 12:25:47 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 xen-devel@lists.xenproject.org
References: <1562159202-11316-1-git-send-email-vrd@amazon.de>
 <3badf43d-4bd8-9492-247b-7429253c0996@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d0729146-a930-4de7-b765-6b0f0ab65e3a@arm.com>
Date: Wed, 10 Jul 2019 20:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3badf43d-4bd8-9492-247b-7429253c0996@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: Get rid of p2m_host array allocation
 for HVM guests
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Amit Shah <aams@amazon.de>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNy8zLzE5IDg6MzkgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24g
MDMvMDcvMjAxOSAxNDowNiwgVmFyYWQgR2F1dGFtIHdyb3RlOgo+PiBXaGVuIGFsbG9jYXRpbmcg
dGhlIGd1ZXN0IG1lbW9yeSBmb3IgYW4gSFZNIGRvbWFpbiwgbGlieGMga2VlcHMgdGhlIFAyTQo+
PiBtYXBwaW5nIGZvciB0aGUgZW50aXJldHkgb2YgdGhlIGd1ZXN0IG1lbW9yeSBhcm91bmQgZm9y
IHRoZSB0aW1lIG9mIHRoZQo+PiBsYXVuY2ggYXMgeGNfZG9tX2ltYWdlLT5wMm1faG9zdC4gRm9y
IGd1ZXN0cyB0aGF0IGhhdmUgYSBsYXJnZSBtZW1vcnkKPj4gKDM5MDQgR2lCKSwKPiAKPiBUaGlz
IGlzIHNsaWdodGx5IGF3a3dhcmQgcGhyYXNpbmcuwqAgSG93IGFib3V0ICJGb3IgbGFyZ2UgbWVt
b3J5IGd1ZXN0cwo+IChlLmcuIDM5MDQgR2lCKSwgIgo+IAo+PiAgIHRoZSBwMm1faG9zdCBhbGxv
Y2F0aW9uIHRha2VzIG1vcmUgdGhhbiA3LjUgR2lCIG9mIHNwYWNlLCBhbmQKPj4gbGVhdmVzIHhs
IHN1c2NlcHRpYmxlIHRvIGdldHRpbmcgT09NLWtpbGxlZCBvbiBndWVzdCBjcmVhdGlvbi4KPj4K
Pj4gQ29udmVydCB0aGUgcDJtX2hvc3QgdGFibGUgbG9va3VwcyB0byBhbiBhcmNoLXNwZWNpZmlj
IGZ1bmN0aW9uIHRoYXQKPj4gcmV0dXJucyB0aGUgbWFwcGluZyBvbi10aGUtZmx5IGZvciB4ODYg
SFZNIGd1ZXN0cyB0byBhdm9pZCB0aGlzCj4+IGFsbG9jYXRpb24sIGJyaW5naW5nIGRvd24geGwn
cyBtZW1vcnkgdXNhZ2UgZnJvbSA+IDhHaUIgdG8gPCA3ME1pYiBmb3IKPj4gc3VjaCBsYXVuY2hl
cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVmFyYWQgR2F1dGFtIDx2cmRAYW1hem9uLmRlPgo+IAo+
IEkgY2FuIGRlZmluaXRlbHkgc2VlIHdoeSB5b3Ugd2FudCB0byBhdm9pZCB0aGlzIG92ZXJoZWFk
Lgo+IAo+IEluIHByYWN0aWNlLCBwMm1faG9zdCBsb29rcyB0byBiZSBhIHJlbGljIG9mIHg4NiBQ
ViBndWVzdHMuCj4gCj4gTm93IC0gZmlyc3QgdGhpbmdzIGZpcnN0LsKgIEV4YWN0bHkgdGhlIHNh
bWUgcmVhc29uaW5nIGFwcGxpZXMgdG8gYWxsIEFSTQo+IGd1ZXN0cy7CoCAoQ0MnaW5nIHRoZSBB
Uk0gbWFpbnRhaW5lcnMgZm9yIHZpc2liaWxpdHkpCgpJdCBpcyBhbHJlYWR5IGluIG15IHRvZG8g
bGlzdCB0byByZW1vdmUgcDJtX2hvc3QgZm9yIEFybSwgdGhhbmtzIHRvIGEgCmRpc2N1c3Npb24g
d2l0aCBXZWkgbGFzdCB5ZWFyIDopLiBJIGhhdmUgbmV2ZXIgaGFkIHRoZSBjaGFuY2UgdG8gd29y
ayBvbiAKaXQgc28gd291bGQgYmUgaGFwcHkgaWYgc29tZW9uZSBwaWNrIGl0IHVwIQoKPiAKPiBI
b3dldmVyLCBpbiBhdHRlbXB0aW5nIHRvIHJldmlldyB0aGlzLCBJJ3ZlIGdvdCBzb21lIGJpZ2dl
ciBxdWVzdGlvbnMuCj4gCj4gQWxsIEFSTSBhbmQgeDg2IEhWTSAoYW5kIFBWSCkgZ3Vlc3RzIHJl
dHVybiB0cnVlIGZvcgo+IHhjX2RvbV90cmFuc2xhdGVkKCksIHNvIHNob3VsZCB0YWtlIHRoZSBm
YXN0cGF0aCBvdXQgb2YgeGNfZG9tX3AybSgpIGFuZAo+IG5ldmVyIHJlYWQgZnJvbSBkb20tPnAy
bV9ob3N0W10uwqAgVGhlcmVmb3JlLCBJIGRvbid0IHNlZSB3aHkgdGhlCj4gbWFqb3JpdHkgb2Yg
dGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkuCgpJIGFncmVlIHRoYXQgcDJtX2hvc3Qgd2lsbCBuZXZl
ciBnZXQgdXNlZCBieSBBcm0uIFNvIHRoaXMgaXMgYSB3YXN0ZSBvZiAKbWVtb3J5LgoKPsKgIE9u
IHRoZSBBUk0gc2lkZSwgdGhpcyBhbHNvIG1lYW5zCj4gdGhhdCBkb20tPnJhbWJhc2VfcGZuIGlz
bid0IGJlaW5nIHVzZWQgYXMgaW50ZW5kZWQsIHdoaWNoIHN1Z2dlc3RzIHRoZXJlCj4gaXMgZnVy
dGhlciBjbGVhbnVwL2NvcnJlY3Rpb24gdG8gYmUgZG9uZSBoZXJlLgoKSSBhbSBub3Qgc3VyZSB0
byBmb2xsb3cgdGhpcy4gQ291bGQgeW91IGV4cGFuZCBpdD8KCj4gCj4geGNfZG9tX3VwZGF0ZV9n
dWVzdF9wMm0oKSBpcyBjbGVhcmx5IHNwZWNpZmljIHRvIHg4NiBQViBndWVzdHMuwqAgTm8KPiBv
dGhlciBndWVzdCB0eXBlcyBzZXQgZG9tLT5wMm1fZ3Vlc3QuCj4gCj4gSSBkb24ndCBzZWUgd2h5
IGFueXRoaW5nIGlzIG5lZWRlZCB3aXRoIHRoZSB2bWVtcmFuZ2VzW10uwqAgVGhlIHJlc3VsdCBv
Zgo+IHRoZSBuZXcgcDJtX2hvc3QoKSBob29rIG5ldmVyIGhhcyBpdHMgcmV0dXJuIHZhbHVlIGNo
ZWNrZWQsIGFuZAo+IGRvbS0+cDJtX2hvc3QgaXMgc3RpbGwgYW4gaWRlbnRpdHkgdHJhbnNmb3Jt
IHdpdGhpbiB0aG9zZSByYW5nZXMuCj4gCj4gVW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZywg
SSB0aGluayB0aGUgcmVzdWx0IGNhbiBiZSByYXRoZXIgbW9yZQo+IHNpbXBsZSwgYW5kIHN0cmlw
IG91dCBhIGZhaXIgYW1vdW50IG9mIGNvZGUsIGJ5IG1vdmluZwo+IHAybV9ob3N0L3AybV9ndWVz
dCBpbnRvIHg4NiBQVidzIGFyY2hfcHJpdmF0ZSBhcmVhLgo+IAo+IH5BbmRyZXcKPiAKCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
