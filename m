Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D938C15D0
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 16:30:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEa9R-0003uv-0f; Sun, 29 Sep 2019 14:26:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEa9P-0003uq-PH
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 14:26:15 +0000
X-Inumbo-ID: 166f6f4b-e2c5-11e9-96b8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 166f6f4b-e2c5-11e9-96b8-12813bfff9fa;
 Sun, 29 Sep 2019 14:26:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20B028;
 Sun, 29 Sep 2019 07:26:12 -0700 (PDT)
Received: from [10.37.12.74] (unknown [10.37.12.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72F183F706;
 Sun, 29 Sep 2019 07:26:11 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
 <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <441ce7f6-7907-dc23-b0e6-7503ba888953@arm.com>
Date: Sun, 29 Sep 2019 15:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpTb3JyeSwgSSBhbSBwaWNraW5nIHVwIHRoaXMgc2VyaWVzIGFnYWluLgoKT24gNC8xOC8x
OSA3OjAzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2VkLCAxNyBBcHIgMjAx
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNC8xNy8xOSA5OjQ1IFBNLCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBXZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+Pj4gQ2xhbmcgdW5kZXJzdGFuZHMgdGhlIEdDQ2lzbSBpbiB1c2UgaGVy
ZSwgYnV0IHN0aWxsIGNvbXBsYWlucyB0aGF0IHNwIGlzCj4+Pj4gdW5pdGlhbGlzZWQuIEluIHN1
Y2ggY2FzZXMsIHJlc29ydCB0byB0aGUgb2xkZXIgdmVyc2lvbnMgb2YgdGhpcyBjb2RlLAo+Pj4+
IHdoaWNoIGRpcmVjdGx5IHJlYWQgc3AgaW50byB0aGUgdGVtcG9yYXJ5IHZhcmlhYmxlLgo+Pj4+
Cj4+Pj4gTm90ZSB0aGF0IHdlIHN0aWxsIGtlZXAgdGhlIEdDQ2lzbSBpbiB0aGUgZGVmYXVsdCBj
YXNlLCBhcyBpdCBjYXVzZXMgR0NDCj4+Pj4gdG8gY3JlYXRlIHJhdGhlciBiZXR0ZXIgYXNzZW1i
bHkuCj4+Pj4KPj4+PiBUaGlzIGlzIGJhc2VkIG9uIHRoZSB4ODYgY291bnRlcnBhcnQuCj4+Pgo+
Pj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgYmFzZWQgb24gYW4gZXhpc3RpbmcgYXBwcm9hY2ggYnV0
IHdoYXQgYWJvdXQgb3RoZXIKPj4+IGNvbXBpbGVycz8gSSBoYXZlIGEgc3VnZ2VzdGlvbiBiZWxv
dy4KPj4KPj4gV2hhdCBpZiB0aGUgY29tcGlsZXIgYWN0dWFsbHkgc3VwcG9ydCBuYW1lZCByZWdp
c3RlcnM/IFdoeSB3b3VsZCB3ZSBtYWtlIHRoZQo+PiBjb2RlIGxlc3MgZWZmaWNpZW50Pwo+IAo+
IEl0IGlzIG5vdCBteSBpbnRlbnRpb24gdG8gbWFrZSB0aGUgY29kZSBsZXNzIGVmZmljaWVudCBm
b3Igb3RoZXIKPiBjb21waWxlcnMuIEhvd2V2ZXIsIHJlYWRpbmcgdGhlIGNvbW1pdCBtZXNzYWdl
IGFuZCB0aGUgcGF0Y2ggSSBoYXZlIHRoZQo+IGltcHJlc3Npb24gdGhhdCB0aGUgY2xhbmcgdmVy
c2lvbiBpcyBtb3JlIGxpa2VseSB0byBiZSBhcHBsaWNhYmxlIHRvCj4gb3RoZXIgY29tcGlsZXJz
LCBjb21wYXJlZCB0byB0aGUgZ2NjIHZlcnNpb24uIE1vcmUgInN0YW5kYXJkIi4gVGhlCj4gcmVh
c29uIGlzIHRoYXQgdGhlIGNsYW5nIHZlcnNpb24gb25seSByZXF1aXJlcyBhc20gaW5saW5lLCB3
aGlsZSB0aGUgZ2NjCj4gdmVyc2lvbiByZXF1aXJlcyBib3RoIGFzbSBpbmxpbmUgYW5kIG5hbWVk
IHJlZ2lzdGVycy4gRm9yIHRoZSBzYWtlIG9mCj4gZ2V0dGluZyBYZW4gdG8gY29tcGlsZSBvdXQg
b2YgdGhlIGJveCB3aXRoIGFueSBDIGNvbXBpbGVyLCBJIHRoaW5rIGl0IGlzCj4gYmVzdCBpZiB3
ZSBkZWZhdWx0IHRvIHRoZSBsZXNzIGRlbWFuZGluZyB2ZXJzaW9uIG9mIHRoZSBpbXBsZW1lbnRh
dGlvbgo+IGZvciB1bmtub3duIGNvbXBpbGVycy4KV2hpbGUgYnVpbGRpbmcgWGVuIG91dCBvZiBi
b3ggaXMgbmljZSBnb2FsIHRvIGhhdmUsIHRoaXMgaXMgbGlrZWx5IGJlIAp2ZXJ5IGhhcmQgdG8g
cmVhY2ggb3V0IGJlY2F1c2UgWGVuIGlzIHVzaW5nIGEgbG90IG9mIEdDQ2lzbS4gSXQgbW9zdGx5
IAp3b3JrIHdpdGggQ2xhbmcgYmVjYXVzZSB0aGV5IGhhdmUgYWRvcHRlZCBzb21lIG9mIHRoZW0u
CgpJIHdvdWxkIGJlIGhhcHB5IHRvIHJldmVydCB0aGUgY29uZGl0aW9uLCBidXQgdGhlbiBBRkFJ
Q1QgdGhlcmUgYXJlIG5vIApwcmV0dHkgd2F5IHRvIG5vdyB0aGF0IHdlIGFyZSB1c2luZyBHQ0Mu
IFdoaWxlIHRoZSBkZWZpbmUgX19HTlVDX18gaXMgCm1lYW50IHRvIHRlbGwgeW91IHRoaXMgaXMg
Y29tcGlsZWQgd2l0aCBHQ0MsIGNsYW5nIGlzIGFsc28gZGVmaW5pbmcgaXQuCgpTbyB0aGUgY29u
ZGl0aW9uIHdvdWxkIGhhdmUgdG8gYmUKCiNpZiAhZGVmaW5lZChfX2NsYW5nX18pICYmIGRlZmlu
ZWQoX19HTlVDX18pCgpCdXQgdGhlbiBpZiBjbGFuZyBpcyBhbHJlYWR5IGRlZmluaW5nIF9fR05V
Q19fLCB3aGF0IGFjdHVhbGx5IHByZXZlbnRzIAphbnkgb3RoZXIgdG8gZG8gaXQ/CgpJIGhhdmUg
eWV0IHRvIHNlZSBhbnlvbmUgd2FudGVkIHRvIGJ1aWxkIFhlbiB3aXRoIGFub3RoZXIgY29tcGls
ZXIgb3RoZXIgCnRoYW4gY2xhbmcgYW5kIEdDQy4gU28gSSB3aWxsIGxlYXZlIHRoaXMgcGF0Y2gg
YXMgaXMuIEZlZWwgZnJlZSB0byAKc3VnZ2VzdCBhIGRpZmZlcmVudCBhcHByb2FjaCBpZiB5b3Ug
YXJlIG5vdCBoYXBweSB3aXRoIHRoaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
