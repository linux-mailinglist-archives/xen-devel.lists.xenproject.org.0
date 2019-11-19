Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDD10250F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 14:01:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX35O-0008Ii-Ge; Tue, 19 Nov 2019 12:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX35N-0008Id-9V
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 12:58:25 +0000
X-Inumbo-ID: 4556ace0-0acc-11ea-a2fa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4556ace0-0acc-11ea-a2fa-12813bfff9fa;
 Tue, 19 Nov 2019 12:58:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF8BFB1DC;
 Tue, 19 Nov 2019 12:58:23 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
Message-ID: <09359c00-5769-0e0d-4af9-963897d3b498@suse.com>
Date: Tue, 19 Nov 2019 13:58:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH 0/2] x86/Xen/32: xen_iret_crit_fixup
 adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMjAxOSAxNTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGZpcnN0IHBhdGNo
IGhlcmUgZml4ZXMgYW5vdGhlciByZWdyZXNzaW9uIGZyb20gM2M4OGM2OTJjMjg3Cj4gKCJ4ODYv
c3RhY2tmcmFtZS8zMjogUHJvdmlkZSBjb25zaXN0ZW50IHB0X3JlZ3MiKSwgYmVzaWRlcyB0aGUK
PiBvbmUgYWxyZWFkeSBhZGRyZXNzZWQgYnkKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE5ODguaHRtbC4KPiBUaGUgc2Vj
b25kIHBhdGNoIGlzIGEgbWluaW1hbCBiaXQgb2YgY2xlYW51cCBvbiB0b3AuCj4gCj4gMTogbWFr
ZSB4ZW5faXJldF9jcml0X2ZpeHVwIGluZGVwZW5kZW50IG9mIGZyYW1lIGxheW91dAo+IDI6IHNp
bXBsaWZ5IHhlbl9pcmV0X2NyaXRfZml4dXAncyByaW5nIGNoZWNrCgpTZWVpbmcgdGhhdCB0aGUg
b3RoZXIgcmVncmVzc2lvbiBmaXggaGFzIGJlZW4gdGFrZW4gaW50byAtdGlwLAp3aGF0IGlzIHRo
ZSBzaXR1YXRpb24gaGVyZT8gU2hvdWxkIDUuNCByZWFsbHkgc2hpcCB3aXRoIHRoaXMKc3RpbGwg
dW5maXhlZD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
