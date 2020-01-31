Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C014F0B8
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:40:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixZIJ-0007PP-Fa; Fri, 31 Jan 2020 16:37:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixZII-0007PK-8X
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:37:22 +0000
X-Inumbo-ID: f3cb125c-4447-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3cb125c-4447-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 16:37:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F137AD3C;
 Fri, 31 Jan 2020 16:37:20 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Date: Fri, 31 Jan 2020 17:37:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4 0/7] x86/HVM: implement memory read caching
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
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
aW5ncyBub3RpY2VkIGFsb25nIHRoZSB3YXkuCgoxOiBTVk06IGRyb3AgYXNtL2h2bS9lbXVsYXRl
LmggaW5jbHVzaW9uIGZyb20gdm1jYi5oCjI6IHg4Ni9IVk06IHJlbmFtZSBhIHZhcmlhYmxlIGlu
IF9faHZtX2NvcHkoKQozOiB4ODYvSFZNOiBpbnRyb2R1Y2UgImN1cnIiIGludG8gaHZtZW11bF9y
ZXBfe21vdixzdG99cygpCjQ6IHg4Ni9IVk06IGltcGxlbWVudCBtZW1vcnkgcmVhZCBjYWNoaW5n
IGZvciBpbnNuIGVtdWxhdGlvbgo1OiB4ODYvbW06IHVzZSBjYWNoZSBpbiBndWVzdF93YWxrX3Rh
YmxlcygpCjY6IHg4Ni9tbTogZHJvcCBwMm10IHBhcmFtZXRlciBmcm9tIG1hcF9kb21haW5fZ2Zu
KCkKNzogeDg2L0hWTTogcmVkdWNlIHNjb3BlIG9mIHBmZWMgaW4gaHZtX2VtdWxhdGVfaW5pdF9w
ZXJfaW5zbigpCgpDb21wYXJlZCB0byB2MyB0aGlzIGlzIGEgbWFqb3IgcmUtd29yayB0byBhdm9p
ZCBwYXNzaW5nIGFyb3VuZAoiY2FjaGUiIGFyZ3VtZW50cywgYXMgaXMgbXkgdW5kZXJzdGFuZGlu
ZyBvZiB0aGUgbWFpbiBmZWVkYmFjawphc3BlY3QgZm9yIHYzLiBJJ3ZlIGFsc28gZHJvcHBlZCAo
YXQgbGVhc3QgZm9yIHRoZSB0aW1lIGJlaW5nKQphZGQtb24gcGF0Y2hlcyB0byBzZWVkIHRoZSBj
YWNoZSB3aXRoIFBBRSBQRFBURSB2YWx1ZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
