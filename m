Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593297BEDA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsmNG-00008T-AQ; Wed, 31 Jul 2019 11:02:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsmNE-00008O-SG
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 11:02:24 +0000
X-Inumbo-ID: ac2ba10e-b382-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ac2ba10e-b382-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 11:02:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92AE7337;
 Wed, 31 Jul 2019 04:02:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1C763F71F;
 Wed, 31 Jul 2019 04:02:21 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
 <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
 <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
Date: Wed, 31 Jul 2019 12:02:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMzAvMDcvMjAxOSAxODozNSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiBPbiAyNi4wNy4xOSAxMzo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24g
MjYvMDcvMjAxOSAxMTozNywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+IEZyb206IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Pgo+Pj4gT24gQVJNNjQgd2Uga25vdyBl
eGFjdGx5IGlmIHRyYXAgaGFwcGVuZWQgZnJvbSBoeXBlcnZpc29yIG9yIGd1ZXN0LCBzbwo+Pj4g
d2UgZG8gbm90IG5lZWQgdG8gdGFrZSB0aGF0IGRlY2lzaW9uLiBUaGlzIHJlZHVjZXMgYSBjb25k
aXRpb24gZm9yCj4+PiBhbGwgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkIGNhbGxzIGFuZCB0aGUgZnVu
Y3Rpb24gY2FsbCBmb3IgdHJhcHMgZnJvbQo+Pj4gdGhlIGh5cGVydmlzb3IgbW9kZS4KPj4KPj4g
T25lIGNvbmRpdGlvbiBsb3N0IGJ1dCAuLi4KPiAKPiAuLi5JbiB0aGUgaG90IHBhdGggKGFjdHVh
bGx5IGF0IGFueSB0cmFwKS4KCkV2ZXJ5dGhpbmcgaXMgaW4gdGhlIGhvdCBwYXRoIGhlcmUsIHll
dCB0aGVyZSBhcmUgYSBsb3Qgb2Ygb3RoZXIgYnJhbmNoZXMuIFNvIAp3aHkgdGhpcyBicmFuY2gg
aW4gcGFydGljdWxhcj8KCkFzIEkgaGF2ZSBtZW50aW9uZWQgYSBmZXcgdGltZXMgYmVmb3JlLCB0
aGVyZSBhcmUgYSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIAp0aGVvcnkgYW5kIHRoZSBwcmFjdGlj
ZS4gSW4gdGhlb3J5LCByZW1vdmluZyBhIGJyYW5jaCBsb29rcyBuaWNlLiBCdXQgaW4gCnByYWN0
aWNlIHRoaXMgbWF5IG5vdCBiZSB0aGUgY2FzZS4KCkluIHRoaXMgcGFydGljdWxhciBjYXNlLCBJ
IGRvbid0IGJlbGlldmUgdGhpcyBpcyBnb2luZyB0byBoYXZlIGEgcmVhbCBpbXBhY3Qgb24gCnRo
ZSBwZXJmb3JtYW5jZS4KClRoZSBQU1RBVEUgaGFzIGJlZW4gc2F2ZWQgYSBmZXcgaW5zdHJ1Y3Rp
b25zIGJlZm9yZSBpbiBjcHVfdXNlcl9yZWdzLCBzbyB0aGVyZQphcmUgaGlnaCBjaGFuY2UgdGhl
IHZhbHVlIHdpbGwgc3RpbGwgYmUgaW4gdGhlIEwxIGNhY2hlLgoKVGhlIGNvbXBpbGVyIG1heSBh
bHNvIGRlY2lkZSB0byBkbyB0aGUgZGlyZWN0IGJyYW5jaCB3aGVuIG5vdCBpbiBndWVzdF9tb2Rl
LiBBIAp0cmFwIGZyb20gdGhlIGh5cGVydmlzb3IgaXMgbW9zdGx5IGZvciBpbnRlcnJ1cHRzLiBT
byB0aGVyZSBhcmUgY2hhbmNlIHRoaXMgaXMgCm5vdCBnb2luZyB0byBoYXZlIGEgcmVhbCBpbXBh
Y3Qgb24gdGhlIG92ZXJhbGwgb2YgdGhlIGludGVycnVwdCBoYW5kbGluZy4KCklmIHlvdSBhcmUg
cmVhbGx5IHdvcnJ5IG9mIHRoZSBpbXBhY3Qgb2YgYnJhbmNoIHRoZW4gdGhlcmUgYXJlIGEgZmV3
IG1vcmUgCmltcG9ydGFudCBwbGFjZXMgKHdpdGggYSBncmVhdGVyIGJlbmVmaXRzKSB0byBsb29r
OgogICAgIDEpIEl0IHNlZW1zIHRoZSBjb21waWxlciB1c2UgYSBqdW1wIHRhYmxlIGZvciB0aGUg
c3dpdGNoIGNhc2UgaW4gCmRvX3RyYXBfZ3Vlc3Rfc3luYygpLCBzbyBpdCB3aWxsIHJlc3VsdCB0
byBtdWx0aXBsZSBkaXJlY3QgYnJhbmNoIGV2ZXJ5dGltZS4KICAgICAyKSBJbmRpcmVjdCBicmFu
Y2ggaGF2ZSBhIG5vbi1uZWdsaWdpYmxlIGNvc3QgY29tcGFyZSB0byBkaXJlY3QgYnJhbmNoLiAK
VGhpcyBpcyBhIGxvdCB1c2VkIGluIHRoZSBpbnRlcnJ1cHQgY29kZSAoc2VlIGdpY19od19vcHMt
PnJlYWRfaXJxKCkpLiBBbGwgb2YgCnRoZW0gYXJlIGtub3duIGF0IGJvb3QgdGltZSwgc28gdGhl
eSBjb3VsZCBiZSByZXBsYWNlIHdpdGggZGlyZWN0IGJyYW5jaC4geDg2IApyZWNlbnRseSBpbnRy
b2R1Y2VkIGFsdGVybmF0aXZlX2NhbGwoKSBmb3IgdGhpcyBwdXJwb3NlLiBUaGlzIGNvdWxkIGJl
IHJlLXVzZWQgCm9uIEFybS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
