Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8EF39F8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 22:01:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSoq5-00030L-2o; Thu, 07 Nov 2019 20:57:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EOb2=Y7=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1iSoq3-00030G-ES
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 20:57:07 +0000
X-Inumbo-ID: 1c113834-01a1-11ea-a1cb-12813bfff9fa
Received: from hqemgate15.nvidia.com (unknown [216.228.121.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c113834-01a1-11ea-a1cb-12813bfff9fa;
 Thu, 07 Nov 2019 20:56:46 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc484d00000>; Thu, 07 Nov 2019 12:55:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 07 Nov 2019 12:56:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 07 Nov 2019 12:56:45 -0800
Received: from [10.2.174.146] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Nov
 2019 20:56:40 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107200604.GB21728@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <9dc2b3c7-f945-b645-b3a3-313a21d2fdfc@nvidia.com>
Date: Thu, 7 Nov 2019 12:53:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107200604.GB21728@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573160145; bh=0o7ET/y25KDp83qUXLZmAimWzQOXiF76Ve9Y+FzALFM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JYP9fwhlxIm5SsWjFushBYq1+VcYPhITepY0rqKtsp43p7cbnw2DVntkJ2D7ZXjN9
 9RFMy0+hTlJ0asJ6SsFHmIq2wiyqj/mDk7puyUOaOgRHDj21gGnWZHyzEORCxkYZLy
 74a5AfKJh2kMafXBVhLtO6AvoPbuLMyIZGVSYKEJggnRxhufdbR6VdL4O2pQPpa+U1
 jqgmSV6LJsRB5SIp7co1IbRQP4ckPA57lwPmdlgWmNauzyrbOExEmwpyHBMSTxwN4S
 7EmycUtOJ+PIgA1H5cW9YZIpCVy2Aq2XVcoPj57OTL9kVR/s89nIgeqjdpFuNKHFgt
 wFwSrwWLRZ3Uw==
Subject: Re: [Xen-devel] [PATCH v2 02/15] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNy8xOSAxMjowNiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgouLi4KPj4KPj4gQWxz
bywgaXQgaXMgYmVzdCBtb3ZlZCBkb3duIHRvIGJlIG5leHQgdG8gdGhlIG5ldyBNTlIgc3RydWN0
cywgc28gdGhhdCBhbGwgdGhlCj4+IE1OUiBzdHVmZiBpcyBpbiBvbmUgZ3JvdXAuCj4gCj4gSSBh
Z3JlZSB3aXRoIEplcm9tZSwgdGhpcyBlbnVtIGlzIHBhcnQgb2YgdGhlICdzdHJ1Y3QKPiBtbXVf
bm90aWZpZXJfcmFuZ2UnIChpZSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIGludmFsaWRhdGlvbikg
YW5kIGl0Cj4gZG9lc24ndCByZWFsbHkgbWF0dGVyIHRoYXQgb25seSB0aGVzZSBuZXcgbm90aWZp
ZXJzIGNhbiBiZSBjYWxsZWQgd2l0aAo+IHRoaXMgdHlwZSwgaXQgaXMgc3RpbGwgcGFydCBvZiB0
aGUgbW11X25vdGlmaWVyX3JhbmdlLgo+IAoKT0suCgo+IFRoZSBjb21tZW50IGFscmVhZHkgc2F5
cyBpdCBvbmx5IGFwcGxpZXMgdG8gdGhlIG1tdV9yYW5nZV9ub3RpZmllcgo+IHNjaGVtZS4uCj4g
Cj4+PiAgICNkZWZpbmUgTU1VX05PVElGSUVSX1JBTkdFX0JMT0NLQUJMRSAoMSA8PCAwKQo+Pj4g
QEAgLTIyMiw2ICsyMjgsMjYgQEAgc3RydWN0IG1tdV9ub3RpZmllciB7Cj4+PiAgIAl1bnNpZ25l
ZCBpbnQgdXNlcnM7Cj4+PiAgIH07Cj4+PiAgIAo+Pgo+PiBUaGF0IHNob3VsZCBhbHNvIGJlIG1v
dmVkIGRvd24sIG5leHQgdG8gdGhlIG5ldyBzdHJ1Y3RzLgo+IAo+IFdoaWNoIHRoaXM/CgpJIHdh
cyByZWZlcnJpbmcgdG8gTU1VX05PVElGSUVSX1JBTkdFX0JMT0NLQUJMRSwgYWJvdmUuIFRyeWlu
Zwp0byBwdXQgYWxsIHRoZSBuZXcgcmFuZ2Ugbm90aWZpZXIgc3R1ZmYgaW4gb25lIHBsYWNlLiBC
dXQgbWF5YmUgbm90LAppZiB0aGVzZSBhcmUgcmVhbGx5IG5vdCBhcyBzZXBhcmF0ZSBhcyBJIHRo
b3VnaHQuCgo+IAo+Pj4gKy8qKgo+Pj4gKyAqIHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXJfb3Bz
Cj4+PiArICogQGludmFsaWRhdGU6IFVwb24gcmV0dXJuIHRoZSBjYWxsZXIgbXVzdCBzdG9wIHVz
aW5nIGFueSBTUFRFcyB3aXRoaW4gdGhpcwo+Pj4gKyAqICAgICAgICAgICAgICByYW5nZSwgdGhp
cyBmdW5jdGlvbiBjYW4gc2xlZXAuIFJldHVybiBmYWxzZSBpZiBibG9ja2luZyB3YXMKPj4+ICsg
KiAgICAgICAgICAgICAgcmVxdWlyZWQgYnV0IHJhbmdlIGlzIG5vbi1ibG9ja2luZwo+Pj4gKyAq
Lwo+Pgo+PiBIb3cgYWJvdXQgdGhpcyAoSSdtIG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdGFuZCB0
aGUgcmV0dXJuIHZhbHVlLCB0aG91Z2gpOgo+Pgo+PiAvKioKPj4gICAqIHN0cnVjdCBtbXVfcmFu
Z2Vfbm90aWZpZXJfb3BzCj4+ICAgKiBAaW52YWxpZGF0ZTogVXBvbiByZXR1cm4gdGhlIGNhbGxl
ciBtdXN0IHN0b3AgdXNpbmcgYW55IFNQVEVzIHdpdGhpbiB0aGlzCj4+ICAgKiAJCXJhbmdlLgo+
PiAgICoKPj4gICAqIAkJVGhpcyBmdW5jdGlvbiBpcyBwZXJtaXR0ZWQgdG8gc2xlZXAuCj4+ICAg
Kgo+PiAgICogICAgICAJQFJldHVybjogZmFsc2UgaWYgYmxvY2tpbmcgd2FzIHJlcXVpcmVkLCBi
dXQgQHJhbmdlIGlzCj4+ICAgKgkJCW5vbi1ibG9ja2luZy4KPj4gICAqCj4+ICAgKi8KPiAKPiBJ
cyB0aGlzIGtkb2MgZm9ybWF0IGZvciBmdW5jdGlvbiBwb2ludGVycz8KCmhlaCwgSSdtIHNvcnQg
b2Ygd2luZ2luZyBpdCwgSSdtIG5vdCBzdXJlIGhvdyBmdW5jdGlvbiBwb2ludGVycyBhcmUgc3Vw
cG9zZWQKdG8gYmUgZG9jdW1lbnRlZCBpbiBrZG9jLiBBY3R1YWxseSB0aGUgb25seSBrZXkgdGFr
ZS1hd2F5IGhlcmUgaXMgdG8gd3JpdGUKCiJUaGlzIGZ1bmN0aW9uIGNhbiBzbGVlcCIKCmFzIGEg
c2VwYXJhdGUgc2VudGVuY2UuLgoKLi4uCj4+IGMpIFJlbmFtZSBuZXcgb25lLiBJZGVhczoKPj4K
Pj4gICAgICBzdHJ1Y3QgbW11X2ludGVydmFsX25vdGlmaWVyCj4+ICAgICAgc3RydWN0IG1tdV9y
YW5nZV9pbnRlcnNlY3Rpb24KPj4gICAgICAuLi5vdGhlciBpZGVhcz8KPiAKPiBUaGlzIG9kZCBk
dWFsaXR5IGhhcyBhbHJlYWR5IGNhdXNlIHNvbWUgY29uZnVzaW9uLCBidXQgbmFtZXMgaGVyZSBh
cmUKPiBoYXJkLiAgbW11X2ludGVydmFsX25vdGlmaWVyIGlzIHRoZSBiZXN0IGFsdGVybmF0aXZl
IEkndmUgaGVhcmQuCj4gCj4gQ2hhbmdpbmcgdGhpcyBuYW1lIGlzIGEgbG90IG9mIHdvcmsgLSBh
cmUgd2UgaGFwcHkKPiAnbW11X2ludGVydmFsX25vdGlmaWVyJyBpcyB0aGUgcmlnaHQgY2hvaWNl
PwoKClllcywgaXQncyBteSBmYXZvcml0ZSB0b28uIEknZCB2b3RlIGZvciBnb2luZyB3aXRoIHRo
YXQuCgouLi4KPj4KPj4KPj4gT0ssIHRoaXMgZWl0aGVyIG5lZWRzIG1vcmUgZG9jdW1lbnRhdGlv
biBhbmQgYXNzZXJ0aW9ucywgb3IgYSBkaWZmZXJlbnQKPj4gYXBwcm9hY2guIEJlY2F1c2UgSSBz
ZWUgYWRkaXRpb24sIHN1YnRyYWN0aW9uLCBBTkQsIE9SIGFuZCBib29sZWFucwo+PiBhbGwgYmVp
bmcgYXBwbGllZCB0byB0aGlzIGZpZWxkLCBhbmQgaXQncyBkYXJuIG5lYXIgaG9wZWxlc3MgdG8g
ZmlndXJlCj4+IG91dCB3aGV0aGVyIG9yIG5vdCBpdCByZWFsbHkgaXMgZXZlbiBvciBvZGQgYXQg
dGhlIHJpZ2h0IHRpbWVzLgo+IAo+IFRoaXMgaXMgYSBzdGFuZGFyZCBkZXNpZ24gZm9yIGEgc2Vx
bG9jayBzY2hlbWUgYW5kIGZvbGxvd3MgdGhlCj4gZXhpc3RpbmcgZGVzaWduIG9mIHRoZSBsaW51
eCBzZXEgbG9jay4KPiAKPiBUaGUgbG93ZXIgYml0IGluZGljYXRlcyB0aGUgbG9jaydkIHN0YXRl
IGFuZCB0aGUgdXBwZXIgYml0cyBpbmRpY2F0ZQo+IHRoZSBnZW5lcmF0aW9uIG9mIHRoZSBsb2Nr
Cj4gCj4gVGhlIG9wZXJhdGlvbnMgb24gdGhlIGxvY2sgaXRzZWxmIGFyZSB0aGVuOgo+ICAgICBz
ZXEgfD0gMSAgIyBUYWtlIHRoZSBsb2NrCj4gICAgIHNlcSsrICAgICAjIFJlbGVhc2UgYW4gYWNx
dWlyZWQgbG9jawo+ICAgICBzZXEgJiAxICAgIyBUcnVlIGlmIGxvY2tlZAo+IAo+IFdoaWNoIGlz
IGhvdyB0aGlzIGlzIHdyaXR0ZW4KClZlcnkgbmljZSwgd291bGQgeW91IGJlIG9wZW4gdG8gcHV0
dGluZyB0aGF0IGludG8gKGFueSkgb25lIG9mIHRoZSBjb21tZW50CmhlYWRlcnM/IFRoYXQncyBh
biB1bnVzdWFsbHkgY2xlYXIgYW5kIGNvbmNpc2UgZGVzY3JpcHRpb246CgovKgogICogVGhpcyBp
cyBhIHN0YW5kYXJkIGRlc2lnbiBmb3IgYSBzZXFsb2NrIHNjaGVtZSBhbmQgZm9sbG93cyB0aGUK
ICAqIGV4aXN0aW5nIGRlc2lnbiBvZiB0aGUgbGludXggc2VxIGxvY2suCiAgKgogICogVGhlIGxv
d2VyIGJpdCBpbmRpY2F0ZXMgdGhlIGxvY2snZCBzdGF0ZSBhbmQgdGhlIHVwcGVyIGJpdHMgaW5k
aWNhdGUKICAqIHRoZSBnZW5lcmF0aW9uIG9mIHRoZSBsb2NrCiAgKgogICogVGhlIG9wZXJhdGlv
bnMgb24gdGhlIGxvY2sgaXRzZWxmIGFyZSB0aGVuOgogICogICAgc2VxIHw9IDEgICMgVGFrZSB0
aGUgbG9jawogICogICAgc2VxKysgICAgICMgUmVsZWFzZSBhbiBhY3F1aXJlZCBsb2NrCiAgKiAg
ICBzZXEgJiAxICAgIyBUcnVlIGlmIGxvY2tlZAogICovCgoKPiAKPj4gRGlmZmVyZW50IGFwcHJv
YWNoOiB3aHkgbm90IGp1c3QgYWRkIGEgbW1uX21tLT5pc19pbnZhbGlkYXRpbmcKPj4gbWVtYmVy
IHZhcmlhYmxlPyBJdCdzIG5vdCBsaWtlIHlvdSdyZSBzaG9ydCBvZiBzcGFjZSBpbiB0aGF0IHN0
cnVjdC4KPiAKPiBTcGxpdHRpbmcgaXQgbWFrZXMgYWxvdCBvZiBzdHVmZiBtb3JlIGNvbXBsZXgg
YW5kIHVubmF0dXJhbC4KPiAKCk9LLCBhZ3JlZWQuCgo+IFRoZSBvcHMgYWJvdmUgY291bGQgYmUg
cHV0IGluIGlubGluZSB3cmFwcGVycywgYnV0IHRoZXkgb25seSBvY2N1cgo+IG9ubHkgaW4gZnVu
Y3Rpb25zIGFscmVhZHkgY2FsbGVkIG1uX2l0cmVlX2ludl9zdGFydF9yYW5nZSgpIGFuZAo+IG1u
X2l0cmVlX2ludl9lbmQoKSBhbmQgbW5faXRyZWVfaXNfaW52YWxpZGF0aW5nKCkuCj4gCj4gVGhl
cmUgaXMgdGhlIG9uZSAndGFrZSB0aGUgbG9jaycgb3V0bGllciBpbgo+IF9fbW11X3JhbmdlX25v
dGlmaWVyX2luc2VydCgpIHRob3VnaAo+IAo+Pj4gK3N0YXRpYyB2b2lkIG1uX2l0cmVlX2ludl9l
bmQoc3RydWN0IG1tdV9ub3RpZmllcl9tbSAqbW1uX21tKQo+Pj4gK3sKPj4+ICsJc3RydWN0IG1t
dV9yYW5nZV9ub3RpZmllciAqbXJuOwo+Pj4gKwlzdHJ1Y3QgaGxpc3Rfbm9kZSAqbmV4dDsKPj4+
ICsJYm9vbCBuZWVkX3dha2UgPSBmYWxzZTsKPj4+ICsKPj4+ICsJc3Bpbl9sb2NrKCZtbW5fbW0t
PmxvY2spOwo+Pj4gKwlpZiAoLS1tbW5fbW0tPmFjdGl2ZV9pbnZhbGlkYXRlX3JhbmdlcyB8fAo+
Pj4gKwkgICAgIW1uX2l0cmVlX2lzX2ludmFsaWRhdGluZyhtbW5fbW0pKSB7Cj4+PiArCQlzcGlu
X3VubG9jaygmbW1uX21tLT5sb2NrKTsKPj4+ICsJCXJldHVybjsKPj4+ICsJfQo+Pj4gKwo+Pj4g
KwltbW5fbW0tPmludmFsaWRhdGVfc2VxKys7Cj4+Cj4+IElzIHRoaXMgdGhlIHJpZ2h0IHBsYWNl
IGZvciBhbiBhc3NlcnRpb24gdGhhdCB0aGlzIGlzIG5vdyBhbiBldmVuIHZhbHVlPwo+IAo+IFll
cywgYnV0IEknbSByZWx1Y3RhbnQgdG8gYWRkIHN1Y2ggYSBydW50aW1lIGNoZWNrIG9uIHRoaXMg
ZmFzdGlzaCBwYXRoLi4KPiBIb3cgYWJvdXQgYSBjb21tZW50PwoKU3VyZS4KCj4gCj4+PiArCW5l
ZWRfd2FrZSA9IHRydWU7Cj4+PiArCj4+PiArCS8qCj4+PiArCSAqIFRoZSBpbnZfZW5kIGluY29y
cG9yYXRlcyBhIGRlZmVycmVkIG1lY2hhbmlzbSBsaWtlCj4+PiArCSAqIHJ0bmxfbG9jaygpLiBB
ZGRzIGFuZCByZW1vdmVzIGFyZSBxdWV1ZWQgdW50aWwgdGhlIGZpbmFsIGludl9lbmQKPj4KPj4g
TGV0IG1lIHBvaW50IG91dCB0aGF0IHJ0bmxfbG9jaygpIGl0c2VsZiBpcyBhIG9uZS1saW5lciB0
aGF0IGNhbGxzIG11dGV4X2xvY2soKS4KPj4gQnV0IEkgc3VwcG9zZSBpZiBvbmUgc3R1ZGllcyB0
aGF0IGZpbGUgY2xvc2VseSB0aGVyZSBpcyBtb3JlLiA6KQo+IAo+IExldHMgY2hhbmdlIHRoYXQg
dG8gcnRubF91bmxvY2soKSB0aGVuCgoKVGhhbmtzIDopCgoKLi4uCj4+PiArCSAqIG1ybi0+aW52
YWxpZGF0ZV9zZXEgaXMgYWx3YXlzIHNldCB0byBhbiBvZGQgdmFsdWUuIFRoaXMgZW5zdXJlcwo+
Pgo+PiBUaGlzIGNsYWltIGp1c3QgbG9va3Mgd3JvbmcgdGhlIGZpcnN0IE4gdGltZXMgb25lIHJl
YWRzIHRoZSBjb2RlLCBnaXZlbiB0aGF0Cj4+IHRoZXJlIGlzIG1tdV9yYW5nZV9zZXRfc2VxKCkg
dG8gc2V0IGl0IHRvIGFuIGFyYml0cmFyeSB2YWx1ZSEgIE1heWJlCj4+IHlvdSBtZWFuCj4gCj4g
bW11X3JhbmdlX3NldF9zZXEoKSBpcyBOT1QgdG8gYmUgdXNlZCB0byBzZXQgdG8gYW4gYXJiaXRh
cnkgdmFsdWUsIGl0Cj4gbXVzdCBvbmx5IGJlIHVzZWQgdG8gc2V0IHRvIHRoZSB2YWx1ZSBwcm92
aWRlZCBpbiB0aGUgaW52YWxpZGF0ZSgpCj4gY2FsbGJhY2sgYW5kIHRoYXQgdmFsdWUgaXMgYWx3
YXlzIG9kZC4gTGV0cyBtYWtlIHRoaXMgc3VwZXIgY2xlYXI6Cj4gCj4gCS8qCj4gCSAqIG1ybi0+
aW52YWxpZGF0ZV9zZXEgbXVzdCBhbHdheXMgYmUgc2V0IHRvIGFuIG9kZCB2YWx1ZSB2aWEKPiAJ
ICogbW11X3JhbmdlX3NldF9zZXEoKSB1c2luZyB0aGUgcHJvdmlkZWQgY3VyX3NlcSBmcm9tCj4g
CSAqIG1uX2l0cmVlX2ludl9zdGFydF9yYW5nZSgpLiBUaGlzIGVuc3VyZXMgdGhhdCBpZiBzZXEg
ZG9lcyB3cmFwIHdlCj4gCSAqIHdpbGwgYWx3YXlzIGNsZWFyIHRoZSBiZWxvdyBzbGVlcCBpbiBz
b21lIHJlYXNvbmFibGUgdGltZSBhcwo+IAkgKiBtbW5fbW0tPmludmFsaWRhdGVfc2VxIGlzIGV2
ZW4gaW4gdGhlIGlkbGUgc3RhdGUuCj4gCSAqLwo+IAoKT0ssIHRoYXQgaGVscHMgYSBsb3QuCgou
Li4KPj4+ICsJCW1ybi0+aW52YWxpZGF0ZV9zZXEgPSBtbW5fbW0tPmludmFsaWRhdGVfc2VxIC0g
MTsKPj4KPj4gT2hoaCwgY2hlY2ttYXRlLiBJIGxvc2UuIFdoeSBpcyAqc3VidHJhY3RpbmcqIHRo
ZSByaWdodCB0aGluZyB0byBkbwo+PiBmb3Igc2VxIG51bWJlcnMgaGVyZT8gIEknbSBhY3V0ZWx5
IHVuaGFwcHkgdHJ5aW5nIHRvIGZpZ3VyZSB0aGlzIG91dC4KPj4gSSBzdXNwZWN0IGl0J3MgYW5v
dGhlciB1bmZvcnR1bmF0ZSBzaWRlIGVmZmVjdCBvZiB0cnlpbmcgdG8gdXNlIHRoZQo+PiBsb3dl
ciBiaXQgb2YgdGhlIHNlcSBudW1iZXIgKGV2ZW4vb2RkKSBmb3Igc29tZXRoaW5nIGVsc2UuCj4g
Cj4gTm8sIHRoaXMgaXMgYWN0dWFsbHkgZG9uZSBmb3IgdGhlIHNlcSBudW1iZXIgaXRzZWxmLiBX
ZSBuZWVkIHRvCj4gZ2VuZXJhdGUgYSBzZXEgbnVtYmVyIHRoYXQgaXMgIT0gdGhlIGN1cnJlbnQg
aW52YWxpZGF0ZV9zZXEgYXMgdGhpcwo+IG5ldyBtcm4gaXMgbm90IGludmFsaWRhdGluZy4KPiAK
PiBUaGUgYmVzdCBzZXEgdG8gdXNlIGlzIG9uZSB0aGF0IHRoZSBpbnZhbGlkYXRlX3NlcSB3aWxs
IG5vdCByZWFjaCBmb3IKPiBhIGxvbmcgdGltZSwgaWUgJ2ludmFsaWRhdGVfc2VxICsgTUFYJyB3
aGljaCBpcyBleHByZXNzZWQgYXMgLTEKPiAKPiBUaGUgZXZlbi9vZGQgdGhpbmcganVzdCB0YWtl
cyBjYXJlIG9mIGl0c2VsZiBuYXR1cmFsbHkgaGVyZSBhcwo+IGludmFsaWRhdGVfc2VxIGlzIGd1
YXJlbnRlZWQgZXZlbiBhbmQgLTEgY3JlYXRlcyBib3RoIGFuIG9kZCBtcm4gdmFsdWUKPiBhbmQg
YSBnb29kIHNlcSBudW1iZXIuCj4gCj4gVGhlIGFsZ29yaXRobSB3b3VsZCBhY3R1YWxseSB3b3Jr
IGNvcnJlY3RseSBpZiB0aGlzIHdhcwo+ICdtcm4tPmludmFsaWRhdGVfc2VxID0gMScsIGJ1dCBv
Y2Nhc2lvbmFsbHkgdGhpbmdzIHdvdWxkIGJsb2NrIHdoZW4KPiB0aGV5IGRvbid0IG5lZWQgdG8g
YmxvY2suCj4gCj4gTGV0cyBhZGQgYSBjb21tZW50Ogo+IAo+IAkJLyoKPiAJCSAqIFRoZSBzdGFy
dGluZyBzZXEgZm9yIGEgbXJuIG5vdCB1bmRlciBpbnZhbGlkYXRpb24gc2hvdWxkIGJlCj4gCQkg
KiBvZGQsIG5vdCBlcXVhbCB0byB0aGUgY3VycmVudCBpbnZhbGlkYXRlX3NlcSBhbmQKPiAJCSAq
IGludmFsaWRhdGVfc2VxIHNob3VsZCBub3QgJ3dyYXAnIHRvIHRoZSBuZXcgc2VxIGFueSB0aW1l
Cj4gCQkgKiBzb29uLgo+IAkJICovCgpWZXJ5IGhlbHBmdWwuIEhvdyBhYm91dCB0aGlzIGFkZGl0
aW9uYWwgdHdlYWs6CgovKgogICogVGhlIHN0YXJ0aW5nIHNlcSBmb3IgYSBtcm4gbm90IHVuZGVy
IGludmFsaWRhdGlvbiBzaG91bGQgYmUKICAqIG9kZCwgbm90IGVxdWFsIHRvIHRoZSBjdXJyZW50
IGludmFsaWRhdGVfc2VxIGFuZAogICogaW52YWxpZGF0ZV9zZXEgc2hvdWxkIG5vdCAnd3JhcCcg
dG8gdGhlIG5ldyBzZXEgYW55IHRpbWUKICAqIHNvb24uIFN1YnRyYWN0aW5nIDEgZnJvbSB0aGUg
Y3VycmVudCAoZXZlbikgdmFsdWUgYWNoaWV2ZXMgdGhhdC4KICAqLwoKCj4gCj4+PiAraW50IG1t
dV9yYW5nZV9ub3RpZmllcl9pbnNlcnQoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuLAo+
Pj4gKwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgbGVuZ3RoLAo+
Pj4gKwkJCSAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+Pj4gK3sKPj4+ICsJc3RydWN0IG1t
dV9ub3RpZmllcl9tbSAqbW1uX21tOwo+Pj4gKwlpbnQgcmV0Owo+Pgo+PiBIbW1tLCBJIHRoaW5r
IGEgbGF0ZXIgcGF0Y2ggaW1wcm9wZXJseSBjaGFuZ2VzIHRoZSBhYm92ZSB0byAiaW50IHJldCA9
IDA7Ii4KPj4gSSdsbCBjaGVjayBvbiB0aGF0LiBJdCdzIGNvcnJlY3QgaGVyZSwgdGhvdWdoLgo+
IAo+IExvb2tzIE9LIGluIG15IHRyZWU/CgpOb3BlLCB0aGF0J3MgaG93IEkgZm91bmQgaXQuIFRo
ZSB0b3Agb2YgeW91ciBtbXVfbm90aWZpZXIgYnJhbmNoIGhhcyB0aGlzOgoKaW50IF9fbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAq
cmFuZ2UpCnsKICAgICAgICAgc3RydWN0IG1tdV9ub3RpZmllcl9tbSAqbW1uX21tID0gcmFuZ2Ut
Pm1tLT5tbXVfbm90aWZpZXJfbW07CiAgICAgICAgIGludCByZXQgPSAwOwoKICAgICAgICAgaWYg
KG1tbl9tbS0+aGFzX2ludGVydmFsKSB7CiAgICAgICAgICAgICAgICAgcmV0ID0gbW5faXRyZWVf
aW52YWxpZGF0ZShtbW5fbW0sIHJhbmdlKTsKICAgICAgICAgICAgICAgICBpZiAocmV0KQogICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKICAgICAgICAgfQogICAgICAgICBpZiAo
IWhsaXN0X2VtcHR5KCZtbW5fbW0tPmxpc3QpKQogICAgICAgICAgICAgICAgIHJldHVybiBtbl9o
bGlzdF9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KG1tbl9tbSwgcmFuZ2UpOwogICAgICAgICByZXR1
cm4gMDsKfQoKCj4gCj4+PiArCW1pZ2h0X2xvY2soJm1tLT5tbWFwX3NlbSk7Cj4+PiArCj4+PiAr
CW1tbl9tbSA9IHNtcF9sb2FkX2FjcXVpcmUoJm1tLT5tbXVfbm90aWZpZXJfbW0pOwo+Pgo+PiBX
aGF0IGRvZXMgdGhlIGFib3ZlIHBhaXIgd2l0aD8gU2hvdWxkIGhhdmUgYSBjb21tZW50IHRoYXQg
c3BlY2lmaWVzIHRoYXQuCj4gCj4gc21wX2xvYWRfYWNxdWlyZSgpIGFsd2F5cyBwYWlycyB3aXRo
IHNtcF9zdG9yZV9yZWxlYXNlKCkgdG8gdGhlIHNhbWUKPiBtZW1vcnksIHRoZXJlIGlzIG9ubHkg
b25lIHN0b3JlLCBpcyBhIGNvbW1lbnQgcmVhbGx5IG5lZWRlZD8KPiAKPiBCZWxvdyBhcmUgdGhl
IGNvbW1lbnQgdXBkYXRlcyBJIG1hZGUsIHRoYW5rcyEKPiAKPiBKYXNvbgo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIGIvaW5jbHVkZS9saW51eC9tbXVfbm90
aWZpZXIuaAo+IGluZGV4IDUxYjkyYmEwMTNkZGNlLi4wNjVjOTUwMDJlOTYwMiAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9t
bXVfbm90aWZpZXIuaAo+IEBAIC0zMDIsMTUgKzMwMiwxNSBAQCB2b2lkIG1tdV9yYW5nZV9ub3Rp
Zmllcl9yZW1vdmUoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuKTsKPiAgIC8qKgo+ICAg
ICogbW11X3JhbmdlX3NldF9zZXEgLSBTYXZlIHRoZSBpbnZhbGlkYXRpb24gc2VxdWVuY2UKPiAg
ICAqIEBtcm4gLSBUaGUgbXJuIHBhc3NlZCB0byBpbnZhbGlkYXRlCj4gLSAqIEBjdXJfc2VxIC0g
VGhlIGN1cl9zZXEgcGFzc2VkIHRvIGludmFsaWRhdGUKPiArICogQGN1cl9zZXEgLSBUaGUgY3Vy
X3NlcSBwYXNzZWQgdG8gdGhlIGludmFsaWRhdGUoKSBjYWxsYmFjawo+ICAgICoKPiAgICAqIFRo
aXMgbXVzdCBiZSBjYWxsZWQgdW5jb25kaXRpb25hbGx5IGZyb20gdGhlIGludmFsaWRhdGUgY2Fs
bGJhY2sgb2YgYQo+ICAgICogc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllcl9vcHMgdW5kZXIgdGhl
IHNhbWUgbG9jayB0aGF0IGlzIHVzZWQgdG8gY2FsbAo+ICAgICogbW11X3JhbmdlX3JlYWRfcmV0
cnkoKS4gSXQgdXBkYXRlcyB0aGUgc2VxdWVuY2UgbnVtYmVyIGZvciBsYXRlciB1c2UgYnkKPiAt
ICogbW11X3JhbmdlX3JlYWRfcmV0cnkoKS4KPiArICogbW11X3JhbmdlX3JlYWRfcmV0cnkoKS4g
VGhlIHByb3ZpZGVkIGN1cl9zZXEgd2lsbCBhbHdheXMgYmUgb2RkLgo+ICAgICoKPiAtICogSWYg
dGhlIHVzZXIgZG9lcyBub3QgY2FsbCBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpIG9yIG1tdV9yYW5n
ZV9yZWFkX3JldHJ5KCkKPiAtICogdGhlbiB0aGlzIGNhbGwgaXMgbm90IHJlcXVpcmVkLgo+ICsg
KiBJZiB0aGUgY2FsbGVyIGRvZXMgbm90IGNhbGwgbW11X3JhbmdlX3JlYWRfYmVnaW4oKSBvcgo+
ICsgKiBtbXVfcmFuZ2VfcmVhZF9yZXRyeSgpIHRoZW4gdGhpcyBjYWxsIGlzIG5vdCByZXF1aXJl
ZC4KPiAgICAqLwo+ICAgc3RhdGljIGlubGluZSB2b2lkIG1tdV9yYW5nZV9zZXRfc2VxKHN0cnVj
dCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybiwKPiAgIAkJCQkgICAgIHVuc2lnbmVkIGxvbmcgY3Vy
X3NlcSkKPiBAQCAtMzQ4LDggKzM0OCw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBtbXVfcmFuZ2Vf
cmVhZF9yZXRyeShzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4sCj4gICAgKiBjb2xsaWRl
ZCB3aXRoIHRoaXMgbG9jayBhbmQgYSBmdXR1cmUgbW11X3JhbmdlX3JlYWRfcmV0cnkoKSB3aWxs
IHJldHVybgo+ICAgICogdHJ1ZS4KPiAgICAqCj4gLSAqIEZhbHNlIGlzIG5vdCByZWxpYWJsZSBh
bmQgb25seSBzdWdnZXN0cyBhIGNvbGxpc2lvbiBoYXMgbm90IGhhcHBlbmVkLiBJdAo+IC0gKiBj
YW4gYmUgY2FsbGVkIG1hbnkgdGltZXMgYW5kIGRvZXMgbm90IGhhdmUgdG8gaG9sZCB0aGUgdXNl
ciBwcm92aWRlZCBsb2NrLgo+ICsgKiBGYWxzZSBpcyBub3QgcmVsaWFibGUgYW5kIG9ubHkgc3Vn
Z2VzdHMgYSBjb2xsaXNpb24gbWF5IG5vdCBoYXZlCj4gKyAqIG9jY3VyZWQuIEl0IGNhbiBiZSBj
YWxsZWQgbWFueSB0aW1lcyBhbmQgZG9lcyBub3QgaGF2ZSB0byBob2xkIHRoZSB1c2VyCj4gKyAq
IHByb3ZpZGVkIGxvY2suCj4gICAgKgo+ICAgICogVGhpcyBjYWxsIGNhbiBiZSB1c2VkIGFzIHBh
cnQgb2YgbG9vcHMgYW5kIG90aGVyIGV4cGVuc2l2ZSBvcGVyYXRpb25zIHRvCj4gICAgKiBleHBl
ZGl0ZSBhIHJldHJ5Lgo+IGRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9u
b3RpZmllci5jCj4gaW5kZXggMmI3NDg1OTE5ZWNmZWIuLmFmZTFlMmQ5NDE4M2Y4IDEwMDY0NAo+
IC0tLSBhL21tL21tdV9ub3RpZmllci5jCj4gKysrIGIvbW0vbW11X25vdGlmaWVyLmMKPiBAQCAt
NTEsNyArNTEsOCBAQCBzdHJ1Y3QgbW11X25vdGlmaWVyX21tIHsKPiAgICAqIFRoaXMgaXMgYSBj
b2xsaXNpb24tcmV0cnkgcmVhZC1zaWRlL3dyaXRlLXNpZGUgJ2xvY2snLCBhIGxvdCBsaWtlIGEK
PiAgICAqIHNlcWNvdW50LCBob3dldmVyIHRoaXMgYWxsb3dzIG11bHRpcGxlIHdyaXRlLXNpZGVz
IHRvIGhvbGQgaXQgYXQKPiAgICAqIG9uY2UuIENvbmNlcHR1YWxseSB0aGUgd3JpdGUgc2lkZSBp
cyBwcm90ZWN0aW5nIHRoZSB2YWx1ZXMgb2YgdGhlIFBURXMgaW4KPiAtICogdGhpcyBtbSwgc3Vj
aCB0aGF0IFBURVMgY2Fubm90IGJlIHJlYWQgaW50byBTUFRFcyB3aGlsZSBhbnkgd3JpdGVyIGV4
aXN0cy4KPiArICogdGhpcyBtbSwgc3VjaCB0aGF0IFBURVMgY2Fubm90IGJlIHJlYWQgaW50byBT
UFRFcyAoc2hhZG93IFBURXMpIHdoaWxlIGFueQo+ICsgKiB3cml0ZXIgZXhpc3RzLgo+ICAgICoK
PiAgICAqIE5vdGUgdGhhdCB0aGUgY29yZSBtbSBjcmVhdGVzIG5lc3RlZCBpbnZhbGlkYXRlX3Jh
bmdlX3N0YXJ0KCkvZW5kKCkgcmVnaW9ucwo+ICAgICogd2l0aGluIHRoZSBzYW1lIHRocmVhZCwg
YW5kIHJ1bnMgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpL2VuZCgpIGluIHBhcmFsbGVsCj4gQEAg
LTY0LDEyICs2NSwxMyBAQCBzdHJ1Y3QgbW11X25vdGlmaWVyX21tIHsKPiAgICAqCj4gICAgKiBU
aGUgd3JpdGUgc2lkZSBoYXMgdHdvIHN0YXRlcywgZnVsbHkgZXhjbHVkZWQ6Cj4gICAgKiAgLSBt
bS0+YWN0aXZlX2ludmFsaWRhdGVfcmFuZ2VzICE9IDAKPiAtICogIC0gbW5uLT5pbnZhbGlkYXRl
X3NlcSAmIDEgPT0gVHJ1ZQo+ICsgKiAgLSBtbm4tPmludmFsaWRhdGVfc2VxICYgMSA9PSBUcnVl
IChvZGQpCj4gICAgKiAgLSBzb21lIHJhbmdlIG9uIHRoZSBtbV9zdHJ1Y3QgaXMgYmVpbmcgaW52
YWxpZGF0ZWQKPiAgICAqICAtIHRoZSBpdHJlZSBpcyBub3QgYWxsb3dlZCB0byBjaGFuZ2UKPiAg
ICAqCj4gICAgKiBBbmQgcGFydGlhbGx5IGV4Y2x1ZGVkOgo+ICAgICogIC0gbW0tPmFjdGl2ZV9p
bnZhbGlkYXRlX3JhbmdlcyAhPSAwCj4gKyAqICAtIG1ubi0+aW52YWxpZGF0ZV9zZXEgJiAxID09
IEZhbHNlIChldmVuKQo+ICAgICogIC0gc29tZSByYW5nZSBvbiB0aGUgbW1fc3RydWN0IGlzIGJl
aW5nIGludmFsaWRhdGVkCj4gICAgKiAgLSB0aGUgaXRyZWUgaXMgYWxsb3dlZCB0byBjaGFuZ2UK
PiAgICAqCj4gQEAgLTEzMSwxMiArMTMzLDEzIEBAIHN0YXRpYyB2b2lkIG1uX2l0cmVlX2ludl9l
bmQoc3RydWN0IG1tdV9ub3RpZmllcl9tbSAqbW1uX21tKQo+ICAgCQlyZXR1cm47Cj4gICAJfQo+
ICAgCj4gKwkvKiBNYWtlIGludmFsaWRhdGVfc2VxIGV2ZW4gKi8KPiAgIAltbW5fbW0tPmludmFs
aWRhdGVfc2VxKys7Cj4gICAJbmVlZF93YWtlID0gdHJ1ZTsKPiAgIAo+ICAgCS8qCj4gICAJICog
VGhlIGludl9lbmQgaW5jb3Jwb3JhdGVzIGEgZGVmZXJyZWQgbWVjaGFuaXNtIGxpa2UKPiAtCSAq
IHJ0bmxfbG9jaygpLiBBZGRzIGFuZCByZW1vdmVzIGFyZSBxdWV1ZWQgdW50aWwgdGhlIGZpbmFs
IGludl9lbmQKPiArCSAqIHJ0bmxfdW5sb2NrKCkuIEFkZHMgYW5kIHJlbW92ZXMgYXJlIHF1ZXVl
ZCB1bnRpbCB0aGUgZmluYWwgaW52X2VuZAo+ICAgCSAqIGhhcHBlbnMgdGhlbiB0aGV5IGFyZSBw
cm9ncmVzc2VkLiBUaGlzIGFycmFuZ2VtZW50IGZvciB0cmVlIHVwZGF0ZXMKPiAgIAkgKiBpcyB1
c2VkIHRvIGF2b2lkIHVzaW5nIGEgYmxvY2tpbmcgbG9jayBkdXJpbmcKPiAgIAkgKiBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0Lgo+IEBAIC0yMzAsMTAgKzIzMywxMSBAQCB1bnNpZ25lZCBsb25nIG1t
dV9yYW5nZV9yZWFkX2JlZ2luKHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybikKPiAgIAlz
cGluX3VubG9jaygmbW1uX21tLT5sb2NrKTsKPiAgIAo+ICAgCS8qCj4gLQkgKiBtcm4tPmludmFs
aWRhdGVfc2VxIGlzIGFsd2F5cyBzZXQgdG8gYW4gb2RkIHZhbHVlLiBUaGlzIGVuc3VyZXMKPiAt
CSAqIHRoYXQgaWYgc2VxIGRvZXMgd3JhcCB3ZSB3aWxsIGFsd2F5cyBjbGVhciB0aGUgYmVsb3cg
c2xlZXAgaW4gc29tZQo+IC0JICogcmVhc29uYWJsZSB0aW1lIGFzIG1tbl9tbS0+aW52YWxpZGF0
ZV9zZXEgaXMgZXZlbiBpbiB0aGUgaWRsZQo+IC0JICogc3RhdGUuCj4gKwkgKiBtcm4tPmludmFs
aWRhdGVfc2VxIG11c3QgYWx3YXlzIGJlIHNldCB0byBhbiBvZGQgdmFsdWUgdmlhCj4gKwkgKiBt
bXVfcmFuZ2Vfc2V0X3NlcSgpIHVzaW5nIHRoZSBwcm92aWRlZCBjdXJfc2VxIGZyb20KPiArCSAq
IG1uX2l0cmVlX2ludl9zdGFydF9yYW5nZSgpLiBUaGlzIGVuc3VyZXMgdGhhdCBpZiBzZXEgZG9l
cyB3cmFwIHdlCj4gKwkgKiB3aWxsIGFsd2F5cyBjbGVhciB0aGUgYmVsb3cgc2xlZXAgaW4gc29t
ZSByZWFzb25hYmxlIHRpbWUgYXMKPiArCSAqIG1tbl9tbS0+aW52YWxpZGF0ZV9zZXEgaXMgZXZl
biBpbiB0aGUgaWRsZSBzdGF0ZS4KPiAgIAkgKi8KPiAgIAlsb2NrX21hcF9hY3F1aXJlKCZfX21t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7Cj4gICAJbG9ja19tYXBfcmVs
ZWFzZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwo+IEBAIC04
OTIsNiArODk2LDEyIEBAIHN0YXRpYyBpbnQgX19tbXVfcmFuZ2Vfbm90aWZpZXJfaW5zZXJ0KHN0
cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybiwKPiAgIAkJbXJuLT5pbnZhbGlkYXRlX3NlcSA9
IG1tbl9tbS0+aW52YWxpZGF0ZV9zZXE7Cj4gICAJfSBlbHNlIHsKPiAgIAkJV0FSTl9PTihtbl9p
dHJlZV9pc19pbnZhbGlkYXRpbmcobW1uX21tKSk7Cj4gKwkJLyoKPiArCQkgKiBUaGUgc3RhcnRp
bmcgc2VxIGZvciBhIG1ybiBub3QgdW5kZXIgaW52YWxpZGF0aW9uIHNob3VsZCBiZQo+ICsJCSAq
IG9kZCwgbm90IGVxdWFsIHRvIHRoZSBjdXJyZW50IGludmFsaWRhdGVfc2VxIGFuZAo+ICsJCSAq
IGludmFsaWRhdGVfc2VxIHNob3VsZCBub3QgJ3dyYXAnIHRvIHRoZSBuZXcgc2VxIGFueSB0aW1l
Cj4gKwkJICogc29vbi4KPiArCQkgKi8KPiAgIAkJbXJuLT5pbnZhbGlkYXRlX3NlcSA9IG1tbl9t
bS0+aW52YWxpZGF0ZV9zZXEgLSAxOwo+ICAgCQlpbnRlcnZhbF90cmVlX2luc2VydCgmbXJuLT5p
bnRlcnZhbF90cmVlLCAmbW1uX21tLT5pdHJlZSk7Cj4gICAJfQo+IAoKTG9va3MgZ29vZC4gV2Un
cmUganVzdCBwb2xpc2hpbmcgdXAgbWlub3IgcG9pbnRzIG5vdywgc28geW91IGNhbiBhZGQ6CgpS
ZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKCgp0aGFua3Ms
Ci0tIApKb2huIEh1YmJhcmQKTlZJRElBCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
