Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BFF14CF2E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 18:06:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwqkY-0005So-7u; Wed, 29 Jan 2020 17:03:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwqkX-0005Rt-Bd
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 17:03:33 +0000
X-Inumbo-ID: 476ff75a-42b9-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 476ff75a-42b9-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 17:03:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15B8FAE24;
 Wed, 29 Jan 2020 17:03:31 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9fba71e-9caa-45d7-385a-b5ca7c52303c@suse.com>
Date: Wed, 29 Jan 2020 18:03:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: undo part of "refine link time stub area
 related assertion"
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

VGhlIG9yaWdpbmFsIGNoZWNrIHdhcyBub3QgdG9vIHN0cmljdDogV2hpbGUgd2UgZG9uJ3QgdXNl
IG9uZSBwYWdlIG9mCm1lbW9yeSBwZXIgQ1BVLCB3ZSBkbyB1c2Ugb25zIHBhZ2Ugb2YgVkEgc3Bh
Y2UgcGVyIENQVS4gSXQgaXMgdGhlCmxhdHRlciB3aGljaCBtYXR0ZXJzIGhlcmUuCgpVbmRvIHRo
YXQgcGFydCBvZiB0aGUgY2hhbmdlLCBidXQgbGVhdmUgZXZlcnl0aGluZyBlbHNlIGluIHBsYWNl
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0y
LDcgKzIsNiBAQAogLyogTW9kaWZpZWQgZm9yIGkzODYveDg2LTY0IFhlbiBieSBLZWlyIEZyYXNl
ciAqLwogCiAjaW5jbHVkZSA8eGVuL2NhY2hlLmg+Ci0jaW5jbHVkZSA8eGVuL2xpYi5oPgogI2lu
Y2x1ZGUgPGFzbS9wYWdlLmg+CiAjdW5kZWYgRU5UUlkKICN1bmRlZiBBTElHTgpAQCAtMzUzLDcg
KzM1Miw3IEBAIFNFQ1RJT05TCiB9CiAKIEFTU0VSVChfXzJNX3J3ZGF0YV9lbmQgPD0gWEVOX1ZJ
UlRfRU5EIC0gWEVOX1ZJUlRfU1RBUlQgKyBfX1hFTl9WSVJUX1NUQVJUIC0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgRElWX1JPVU5EX1VQKE5SX0NQVVMsIFNUVUJTX1BFUl9QQUdFKSAqIFBB
R0VfU0laRSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgTlJfQ1BVUyAqIFBBR0VfU0laRSwK
ICAgICAgICAiWGVuIGltYWdlIG92ZXJsYXBzIHN0dWJzIGFyZWEiKQogCiAjaWZkZWYgQ09ORklH
X0tFWEVDCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
