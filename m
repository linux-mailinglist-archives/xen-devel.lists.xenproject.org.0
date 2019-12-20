Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F29127BA9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:29:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIIm-0005PO-Ks; Fri, 20 Dec 2019 13:26:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIIk-0005PJ-Vv
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:26:43 +0000
X-Inumbo-ID: 5b400ff6-232c-11ea-9359-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b400ff6-232c-11ea-9359-12813bfff9fa;
 Fri, 20 Dec 2019 13:26:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11B48AE3A;
 Fri, 20 Dec 2019 13:26:40 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20efd995-9346-4b0c-f927-ad1152f6ccfe@suse.com>
Date: Fri, 20 Dec 2019 14:27:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/6] x86: IRQ handling adjustments
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZpcnN0IHR3byBJJ3ZlIGJlZW4gbWVhbmluZyB0byBkbyBmb3IgYSBsb25nIHRpbWUuIFRo
ZSAzcmQgaXMKKG9wdGlvbmFsKSBmb2xsb3ctdXAgdG8gYSBwcmV0dHkgbGF0ZSA0LjEzIGNoYW5n
ZS4gVGhlIG5leHQgdHdvCndlcmUgc3VnZ2VzdGVkIGJ5IEFuZHJldyB0byBzbGlnaHRseSBpbmNy
ZWFzZSB0aGUgbnVtYmVyIG9mIElSUXMKd2UgY291bGQgaGFuZGxlIGluIHRvdGFsLCBzZWVpbmcg
dGhhdCBJUlEgdmVjdG9ycyBhcmUgYSByZWxhdGl2ZWx5CnNjYXJjZSByZXNvdXJjZS4gVGhlIGxh
c3Qgb25lIGlzIGEgcmVzdWx0IG9mIG1lIG5vdGljaW5nLCB3aGlsZQpkb2luZyB0aGUgZWFybGll
ciBvbmVzLCBwb2ludGxlc3MgcmVwZWF0ZWQgcmUtYnVpbGRpbmcgb2YsIGluCnBhcnRpY3VsYXIs
IHRoZSByZWxhdGl2ZSBzbG93IHRvIGJ1aWxkIGluc24gZW11bGF0b3IgKHdoaWNoCnNob3VsZCBi
ZSB1bmNvbmNlcm5lZCBvZiBJUlEgdmVjdG9yIGFycmFuZ2VtZW50IGFkanVzdG1lbnRzKS4KCjE6
IElSUTogbW92ZSBkb19JUlEoKQoyOiBJUlE6IG1vdmUgYW5kIHJlbmFtZSBfX2RvX0lSUV9ndWVz
dCgpCjM6IElSUTogc2ltcGxpZnkgcGVuZGluZyBFT0kgc3RhY2sgbG9naWMgZm9yIGludGVybmFs
bHkgdXNlZCBJUlFzCjQ6IElSUTogZmxpcCBsZWdhY3kgYW5kIGR5bmFtaWMgdmVjdG9yIHJhbmdl
cwo1OiBJUlE6IHJlLXVzZSBsZWdhY3kgdmVjdG9yIHJhbmdlcyBvbiBBUHMKNjogbW92ZSBhbmQg
cmVuYW1lIE5SX1ZFQ1RPUlMKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
