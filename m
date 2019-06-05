Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17E35ADE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:07:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTjr-000154-Ei; Wed, 05 Jun 2019 11:05:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYTjq-00014z-OY
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:05:50 +0000
X-Inumbo-ID: e04ed2fa-8781-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e04ed2fa-8781-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 11:05:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E27E374;
 Wed,  5 Jun 2019 04:05:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50BFE3F690;
 Wed,  5 Jun 2019 04:05:48 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
 <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
 <5CF7727D02000078002355C9@prv1-mh.provo.novell.com>
 <a6b9a144-f3b6-2c32-eb23-01723ed760ae@arm.com>
 <5CF7929D02000078002356CE@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <075ebf37-1e7b-bc01-82ee-6f9b720f61ce@arm.com>
Date: Wed, 5 Jun 2019 12:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF7929D02000078002356CE@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 3/4] Arm64: further speed-up to
 hweight{32, 64}()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNS8wNi8yMDE5IDEwOjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNS4wNi4x
OSBhdCAxMToyNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMDUvMDYvMjAx
OSAwODo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwNC4wNi4xOSBhdCAxODoxMSwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBPbiA1LzMxLzE5IDEwOjUzIEFNLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gQWNjb3JkaW5nIHRvIExpbnV4IGNvbW1pdCBlNzViZWYy
YTRmICgiYXJtNjQ6IFNlbGVjdAo+Pj4+PiBBUkNIX0hBU19GQVNUX01VTFRJUExJRVIiKSB0aGlz
IGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVyIHRoZQo+Pj4+PiB2YXJpYW50IHVzaW5nIG9u
bHkgYml0d2lzZSBvcGVyYXRpb25zIG9uIGF0IGxlYXN0IHNvbWUgaGFyZHdhcmUsIGFuZCBubwo+
Pj4+PiB3b3JzZSBvbiBvdGhlci4KPj4+Pj4KPj4+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBSRkM6IFRvIGJlIGhv
bmVzdCBJJ20gbm90IGZ1bGx5IGNvbnZpbmNlZCB0aGlzIGlzIGEgd2luIGluIHBhcnRpY3VsYXIg
aW4KPj4+Pj4gICAgICAgICB0aGUgaHdlaWdodDMyKCkgY2FzZSwgYXMgdGhlcmUncyBubyBhY3R1
YWwgc2hpZnQgaW5zbiB3aGljaCBnZXRzCj4+Pj4+ICAgICAgICAgcmVwbGFjZWQgYnkgdGhlIG11
bHRpcGxpY2F0aW9uLiBFdmVuIGZvciBod2VpZ2h0NjQoKSB0aGUgY29tcGlsZXIKPj4+Pj4gICAg
ICAgICBjb3VsZCBlbWl0IGJldHRlciBjb2RlIGFuZCBhdm9pZCB0aGUgZXhwbGljaXQgc2hpZnQg
YnkgMzIgKHdoaWNoIGl0Cj4+Pj4+ICAgICAgICAgZW1pdHMgYXQgbGVhc3QgZm9yIG1lKS4KPj4+
Pgo+Pj4+IEkgY2FuIHNlZSBtdWx0aXBsaWNhdGlvbiBpbnN0cnVjdGlvbiB1c2VkIGluIGJvdGgg
aHdlaWdodDMyKCkgYW5kCj4+Pj4gaHdlaWdodDY0KCkgd2l0aCB0aGUgY29tcGlsZXIgSSBhbSB1
c2luZy4KPj4+Cj4+PiBUaGF0IGlzIGZvciB3aGljaCBleGFjdCBpbXBsZW1lbnRhdGlvbj8KPj4K
Pj4gQSBzaW1wbGUgY2FsbCBod2VpZ2h0NjQoKS4KPiAKPiBUaGF0J3MgYXMgYW1iaWd1b3VzIGFz
IGl0IHdhcyBiZWZvcmU6IEFyZSB5b3UgdGFsa2luZyBhYm91dAo+IHVuLXBhdGNoZWQgY29kZSAo
YmVmb3JlIHRoaXMgc2VyaWVzKSwgb3IgcGF0Y2hlcyB1cCB0byBhdAo+IGxlYXN0IHRoaXMgb25l
IGFwcGxpZWQuIFdoYXQgSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIGlzIGlmIHlvdXIKPiBjb21w
aWxlciBpcyBzbWFydCBlbm91Z2ggdG8gdXNlIE1VTCB3aXRob3V0IHVzIHRlbGxpbmcgaXQgdG8u
Cgp1bnNpZ25lZCBpbnQgdGVzdF9od2VpZ2h0NjQodWludDY0X3QgdCkKewogICAgIHJldHVybiBo
d2VpZ2h0NjQodCk7Cn0KCkkgbG9va2VkIGF0IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYmVmb3Jl
IGFuZCBhZnRlciB0aGlzIHBhdGNoLiBCZWZvcmUgdGhlIAptdWx0aXBsaWNhdGlvbiBpcyBub3Qg
dXNlZC4gQWZ0ZXIsIGl0IHdhcyB1c2VkIHdpdGggbGVzcyBpbnN0cnVjdGlvbnMgZW1pdHRlZC4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
