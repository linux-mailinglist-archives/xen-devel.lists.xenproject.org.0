Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143977FB94
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXwR-0002a2-UQ; Fri, 02 Aug 2019 13:49:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htXwQ-0002Zx-Hd
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:49:54 +0000
X-Inumbo-ID: 67cce754-b52c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 67cce754-b52c-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:49:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 682591570;
 Fri,  2 Aug 2019 06:49:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B88B3F71F;
 Fri,  2 Aug 2019 06:49:52 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
 <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
 <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c20b6a42-d8e4-379f-f0c7-56ad008ce653@arm.com>
Date: Fri, 2 Aug 2019 14:49:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgovIVwvIVwvIVwKCkkgYW0gbm90IGEgc2NoZWR1bGVyIGV4cGVydCBzbyBteSB2aWV3IG1h
eWJlIGJlIHdyb25nLiBEYXJpbyBmZWVsIGZyZWUgdG8gCmNvcnJlY3QgbWUgOikuCgovIVwvIVwv
IVwKCk9uIDAyLzA4LzIwMTkgMTQ6MDcsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gCj4gCj4gT24g
MDIuMDguMTkgMTI6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEkgY2FuIG1ha2Ugc3VjaCBh
IGxpc3QsIGhvdyBpdCBpcyBkb25lIGluIHRoaXMgc2VyaWVzOgo+Pgo+PiDCoEZyb20gdGhlIGxp
c3QgYmVsb3cgaXQgaXMgbm90IGNsZWFyIHdoYXQgaXMgdGhlIHNwbGl0IGJldHdlZW4gaHlwZXJ2
aXNvciB0aW1lIAo+PiBhbmQgZ3Vlc3QgdGltZS4gU2VlIHNvbWUgb2YgdGhlIGV4YW1wbGVzIGJl
bG93Lgo+IAo+IEkgZ3Vlc3MgeW91ciBxdWVzdGlvbiBpcyAqd2h5KiBkbyBJIHNwbGl0IGh5cC9n
dWVzdCB0aW1lIGluIHN1Y2ggYSB3YXkuCj4gCj4gU28gZm9yIHRoZSBndWVzdCBJIGNvdW50IHRp
bWUgc3BlbnQgaW4gdGhlIGd1ZXN0IG1vZGUuIFBsdXMgdGltZSBzcGVudCBpbiAKPiBoeXBlcnZp
c29yIG1vZGUgdG8gc2VydmUgZXhwbGljaXQgcmVxdWVzdHMgYnkgZ3Vlc3QuCj4gCj4gVGhhdCB0
aW1lIG1heSBiZSBxdWl0ZSBkZXRlcm1pbmlzdGljIGZyb20gdGhlIGd1ZXN0J3MgcG9pbnQgb2Yg
dmlldy4KPiAKPiBCdXQgdGhlIHRpbWUgc3BlbnQgYnkgaHlwZXJ2aXNvciB0byBoYW5kbGUgaW50
ZXJydXB0cywgdXBkYXRlIHRoZSBoYXJkd2FyZSBzdGF0ZSAKPiBpcyBub3QgcmVxdWVzdGVkIGJ5
IHRoZSBndWVzdCBpdHNlbGYuIEl0IGlzIGEgdmlydHVhbGl6YXRpb24gb3ZlcmhlYWQuIEFuZCB0
aGUgCj4gb3ZlcmhlYWQgaGVhdmlseSBkZXBlbmRzIG9uIHRoZSBzeXN0ZW0gY29uZmlndXJhdGlv
biAoZS5nLiBob3cgbWFueSBndWVzdHMgYXJlIAo+IHJ1bm5pbmcpLgoKV2hpbGUgY29udGV4dCBz
d2l0Y2ggY29zdCB3aWxsIGRlcGVuZCBvbiB5b3VyIHN5c3RlbSBjb25maWd1cmF0aW9uLiBUaGUg
SFcgc3RhdGUgCnN5bmNocm9uaXphdGlvbiBvbiBlbnRyeSB0byB0aGUgaHlwZXJ2aXNvciBhbmQg
ZXhpdCBmcm9tIHRoZSBoeXBlcnZpc29yIHdpbGwgCmFsd2F5cyBiZSB0aGVyZS4gVGhpcyBpcyBl
dmVuIGlmIHlvdSBoYXZlIG9uZSBndWVzdCBydW5uaW5nIG9yIHBhcnRpdGlvbmluZyB5b3VyIApz
eXN0ZW0uCgpGdXJ0aGVybW9yZSwgWGVuIGlzIGltcGxlbWVudGluZyBhIHZvbHVudGFyeSBwcmVl
bXB0aW9uIG1vZGVsLiBUaGUgbWFpbiAKcHJlZW1wdGlvbiBwb2ludCBmb3IgQXJtIGlzIG9uIHJl
dHVybiB0byB0aGUgZ3Vlc3QuIFNvIGlmIHlvdSBoYXZlIHdvcmsgCmluaXRpYXRlZCBieSB0aGUg
Z3Vlc3QgdGhhdCB0YWtlcyBsb25nLCB0aGVuIHlvdSBuZWVkIG1heSB3YW50IHRvIGRlZmVyIHVu
dGlsIAp5b3UgY2FuIHByZWVtcHQgd2l0aG91dCBtdWNoIHRyb3VibGUuCgpZb3VyIGRlZmluaXRp
b24gb2YgInZpcnR1YWxpemF0aW9uIG92ZXJoZWFkIiBpcyBzb21ld2hhdCB1bmNsZWFyLiBBIGd1
ZXN0IGlzIG5vdCAKYXdhcmUgdGhhdCBhIGRldmljZSBtYXkgYmUgZW11bGF0ZWQuIFNvIGVtdWxh
dGluZyBhbnkgSS9PIGlzIHBlciBzZSBhbiBvdmVyaGVhZC4KCj4gVGhhdCBvdmVyaGVhZCBtYXkg
YmUgYWNjb3VudGVkIGZvciBhIGd1ZXN0IG9yIGZvciBoeXAsIGRlcGVuZGluZyBvbiB0aGUgbW9k
ZWwgCj4gYWdyZWVkLgoKVGhlcmUgYXJlIHNvbWUgaXNzdWVzIHRvIGFjY291bnQgc29tZSBvZiB0
aGUgd29yayBvbiBleGl0IHRvIHRoZSBoeXBlcnZpc29yIAp0aW1lLiBMZXQncyB0YWtlIHRoZSBl
eGFtcGxlIG9mIHRoZSBQMk0sIHRoaXMgdGFzayBpcyBhIGRlZmVycmVkIHdvcmsgZnJvbSBhbiAK
c3lzdGVtIHJlZ2lzdGVyIGVtdWxhdGlvbiBiZWNhdXNlIHdlIG5lZWQgcHJlZW1wdGlvbi4KClRo
ZSB0YXNrIGNhbiBiZSBsb25nIHJ1bm5pbmcgKHNldmVyYWwgaHVuZHJlZCBtaWxsaXNlY29uZHMp
LiBBIHNjaGVkdWxlciBtYXkgCm9ubHkgdGFrZSBpbnRvIGFjY291bnQgdGhlIGd1ZXN0IHRpbWUg
YW5kIGNvbnNpZGVyIHRoYXQgdkNQVSBkb2VzIG5vdCBuZWVkIHRvIGJlIAp1bnNjaGVkdWxlZC4g
WW91IGFyZSBhdCB0aGUgcmlzayBhIHZDUFUgd2lsbCBob2cgYSBwQ1BVIGFuZCBkZWxheSBhbnkg
b3RoZXIgCnZDUFUuIFRoaXMgaXMgbm90IHNvbWV0aGluZyBpZGVhbCBldmVuIGZvciBSVCB0YXNr
LgoKT3RoZXIgd29yayBkb25lIG9uIGV4aXQgKGUuZyBzeW5jaW5nIHRoZSB2R0lDIHN0YXRlIHRv
IEhXKSB3aWxsIGJlIGxlc3MgYSAKY29uY2VybiB3aGVyZSB0aGV5IGFyZSBhY2NvdW50ZWQgYmVj
YXVzZSBpdCBjYW5ub3QgcG9zc2libHkgaG9nIGEgcENQVS4KCkkgdW5kZXJzdGFuZCB5b3Ugd2Fu
dCB0byBnZXQgdGhlIHZpcnR1YWxpemF0aW9uIG92ZXJoZWFkLiBJdCBmZWVscyB0byBtZSwgdGhp
cyAKbmVlZHMgdG8gYmUgYSBkaWZmZXJlbnQgY2F0ZWdvcnkgKGkuZSBuZWl0aGVyIGh5cGVydmlz
b3IgdGltZSwgbm9yIGd1ZXN0IHRpbWUpLgoKPiAKPiBNeSBpZGVhIGlzIGFzIGZvbGxvd2luZzoK
PiBBY2NvdW50aW5nIHRoYXQgb3ZlcmhlYWQgZm9yIGd1ZXN0cyBpcyBxdWl0ZSBPSyBmb3Igc2Vy
dmVyIGFwcGxpY2F0aW9ucywgeW91IHB1dCAKPiBzZXJ2ZXIgb3ZlcmhlYWQgdGltZSBvbiBndWVz
dHMgYW5kIGNoYXJnZSBtb25leSBmcm9tIHRoZWlyIGJ1ZGdldC4KPiBZZXQgZm9yIFJUIGFwcGxp
Y2F0aW9ucyB5b3Ugd2lsbCBoYXZlIG1vcmUgYWNjdXJhdGUgdmlldyBvbiB0aGUgZ3Vlc3QgZXhl
Y3V0aW9uIAo+IHRpbWUgaWYgeW91IGRyb3AgdGhhdCBvdmVyaGVhZC4KPiAKPiBPdXIgdGFyZ2V0
IGlzIFhFTiBpbiBzYWZldHkgY3JpdGljYWwgc3lzdGVtcy4gU28gSSBjaG9zZW4gbW9yZSBkZXRl
cm1pbmlzdGljIAo+IChmcm9tIG15IHBvaW50IG9mIHZpZXcpIGFwcHJvYWNoLgoKU2VlIGFib3Zl
LCBJIGJlbGlldmUgeW91IGFyZSBidWlsZGluZyBhbiBzZWN1cmUgc3lzdGVtIHdpdGggYWNjb3Vu
dGluZyBzb21lIG9mIAp0aGUgZ3Vlc3Qgd29yayB0byB0aGUgaHlwZXJ2aXNvci4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
