Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7B1773B7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 11:16:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j94Ya-0000Vs-3b; Tue, 03 Mar 2020 10:13:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j94YX-0000Vh-Po
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 10:13:41 +0000
X-Inumbo-ID: a799a5de-5d37-11ea-82f6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a799a5de-5d37-11ea-82f6-bc764e2007e4;
 Tue, 03 Mar 2020 10:13:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9684B1B4;
 Tue,  3 Mar 2020 10:13:39 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
Date: Tue, 3 Mar 2020 11:13:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v5 0/4] x86/HVM: implement memory read caching
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RW11bGF0aW9uIHJlcXVpcmluZyBkZXZpY2UgbW9kZWwgYXNzaXN0YW5jZSB1c2VzIGEgZm9ybSBv
ZiBpbnN0cnVjdGlvbgpyZS1leGVjdXRpb24sIGFzc3VtaW5nIHRoYXQgdGhlIHNlY29uZCAoYW5k
IGFueSBmdXJ0aGVyKSBwYXNzIHRha2VzCmV4YWN0bHkgdGhlIHNhbWUgcGF0aC4gVGhpcyBpcyBh
IHZhbGlkIGFzc3VtcHRpb24gYXMgZmFyIGFzIHVzZSBvZiBDUFUKcmVnaXN0ZXJzIGdvZXMgKGFz
IHRob3NlIGNhbid0IGNoYW5nZSB3aXRob3V0IGFueSBvdGhlciBpbnN0cnVjdGlvbgpleGVjdXRp
bmcgaW4gYmV0d2VlbiksIGJ1dCBpcyB3cm9uZyBmb3IgbWVtb3J5IGFjY2Vzc2VzLiBJbiBwYXJ0
aWN1bGFyCml0IGhhcyBiZWVuIG9ic2VydmVkIHRoYXQgV2luZG93cyBtaWdodCBwYWdlIG91dCBi
dWZmZXJzIHVuZGVybmVhdGgKYW4gaW5zdHJ1Y3Rpb24gY3VycmVudGx5IHVuZGVyIGVtdWxhdGlv
biAoaGl0dGluZyBiZXR3ZWVuIHR3byBwYXNzZXMpLgpJZiB0aGUgZmlyc3QgcGFzcyB0cmFuc2xh
dGVkIGEgbGluZWFyIGFkZHJlc3Mgc3VjY2Vzc2Z1bGx5LCBhbnkgc3Vic2VxdWVudApwYXNzIG5l
ZWRzIHRvIGRvIHNvIHRvbywgeWllbGRpbmcgdGhlIGV4YWN0IHNhbWUgdHJhbnNsYXRpb24uCgpJ
bnRyb2R1Y2UgYSBjYWNoZSB0byBtYWtlIHN1cmUgYWJvdmUgZGVzY3JpYmVkIGFzc3VtcHRpb24g
aG9sZHMuIFRoaXMKaXMgYSB2ZXJ5IHNpbXBsaXN0aWMgaW1wbGVtZW50YXRpb24gZm9yIG5vdzog
T25seSBleGFjdCBtYXRjaGVzIGFyZQpzYXRpc2ZpZWQgKG5vIG92ZXJsYXBzIG9yIHBhcnRpYWwg
cmVhZHMgb3IgYW55dGhpbmcpLgoKVGhlcmUncyBhbHNvIHNvbWUgcGVyaGFwcyBzZWVtaW5nbHkg
dW5yZWxhdGVkIGNsZWFudXAgaGVyZSB3aGljaCB3YXMKZm91bmQgZGVzaXJhYmxlIG9uIHRoZSB3
YXkgLSB0aGUgMyBpbml0aWFsIHBhdGNoZXMgYXJlIHRydWx5IHByZXJlcXMKKGF0IGxlYXN0IGlu
IGEgY29udGV4dHVhbCB3YXkpLCB3aGlsZSB0aGUgMiBsYXN0IG9uZXMgYXJlIGp1c3QgZm9yCnRo
aW5ncyBub3RpY2VkIGFsb25nIHRoZSB3YXkuCgoxOiB4ODYvSFZNOiBjYW5jZWwgZW11bGF0aW9u
IHdoZW4gcmVnaXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQKMjogeDg2L0hWTTogaW1wbGVtZW50IG1l
bW9yeSByZWFkIGNhY2hpbmcgZm9yIGluc24gZW11bGF0aW9uCjM6IHg4Ni9tbTogdXNlIGNhY2hl
IGluIGd1ZXN0X3dhbGtfdGFibGVzKCkKNDogeDg2L0hWTTogX19odm1fY29weSgpJ3Mgc2l6ZSBw
YXJhbWV0ZXIgaXMgYW4gdW5zaWduZWQgcXVhbnRpdHkKClRoZSBtYWluIGRpZmZlcmVuY2UgdG8g
djQgYXJlIHRoZSBuZXcgZmlyc3QgYW5kIGxhc3QgcGF0Y2hlcyAod2l0aAp0aGUgbGF0dGVyIGJl
aW5nIGxhcmdlbHkgdW5yZWxhdGVkIGNsZWFudXApLiBGb3Igb3RoZXIgY2hhbmdlcyBzZWUKdGhl
IGluZGl2aWR1YWwgcGF0Y2hlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
