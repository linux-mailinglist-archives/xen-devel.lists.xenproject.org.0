Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3DE129
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 13:19:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4Gx-00070B-KS; Mon, 29 Apr 2019 11:16:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Gv-000706-SG
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:16:33 +0000
X-Inumbo-ID: 3c5ba8cc-6a70-11e9-8861-87f25eb6f7f3
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c5ba8cc-6a70-11e9-8861-87f25eb6f7f3;
 Mon, 29 Apr 2019 11:16:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 05:16:28 -0600
Message-Id: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 05:16:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/9] x86: IRQ management adjustments
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rmlyc3QgYW5kIGZvcmVtb3N0IHRoaXMgc2VyaWVzIGlzIHRyeWluZyB0byBkZWFsIHdpdGggQ1BV
IG9mZmxpbmluZwppc3N1ZXMsIHdoaWNoIGhhdmUgYmVjb21lIG1vcmUgcHJvbWluZW50IHdpdGgg
dGhlIHJlY2VudGx5CmFkZGVkIFNNVCBlbmFibGUvZGlzYWJsZSBvcGVyYXRpb24gaW4geGVuLWhw
dG9vbC4gTGF0ZXIgcGF0Y2hlcwppbiB0aGUgc2VyaWVzIHRoZW4gY2Fycnkgb3V0IG1vcmUgb3Ig
bGVzcyB1bnJlbGF0ZWQgY2hhbmdlcwooaG9wZWZ1bGx5IGltcHJvdmVtZW50cykgbm90aWNlZCB3
aGlsZSBsb29raW5nIGF0IHZhcmlvdXMgcGllY2VzCm9mIGludm9sdmVkIGNvZGUuCgpUaGUgZmly
c3QgcGF0Y2ggaW50cm9kdWNlcyBhbiBBU1NFUlQoKSB3aGljaCBJJ3ZlIG9ic2VydmVkIHRvCnRy
aWdnZXIgZXZlcnkgb25jZSBpbiBhIHdoaWxlLiBJJ20gc3RpbGwgdHJ5aW5nIHRvIGZpbmQgdGhl
IGNhdXNlIG9mCnRoaXMsIGhlbmNlIHRoZSBSRkMgZm9yIHRoYXQgb25lIHBhdGNoLgoKMTogeDg2
L0lSUTogZGVhbCB3aXRoIG1vdmUtaW4tcHJvZ3Jlc3Mgc3RhdGUgaW4gZml4dXBfaXJxcygpCjI6
IHg4Ni9JUlE6IGRlYWwgd2l0aCBtb3ZlIGNsZWFudXAgY291bnQgc3RhdGUgaW4gZml4dXBfaXJx
cygpCjM6IHg4Ni9JUlE6IGltcHJvdmUgZHVtcF9pcnFzKCkKNDogeDg2L0lSUTogZGVzYy0+YWZm
aW5pdHkgc2hvdWxkIHN0cmljdGx5IHJlcHJlc2VudCB0aGUgcmVxdWVzdGVkIHZhbHVlCjU6IHg4
Ni9JUlE6IGZpeCBsb2NraW5nIGFyb3VuZCB2ZWN0b3IgbWFuYWdlbWVudAo2OiB4ODYvSVJROiBy
ZWR1Y2UgdW51c2VkIHNwYWNlIGluIHN0cnVjdCBhcmNoX2lycV9kZXNjCjc6IHg4Ni9JUlE6IGRy
b3AgcmVkdW5kYW50IGNwdW1hc2tfZW1wdHkoKSBmcm9tIG1vdmVfbWFza2VkX2lycSgpCjg6IHg4
Ni9JUlE6IG1ha2UgZml4dXBfaXJxcygpIHNraXAgdW5jb25uZWN0ZWQgaW50ZXJuYWxseSB1c2Vk
IGludGVycnVwdHMKOTogeDg2L0lPLUFQSUM6IGRyb3AgYW4gdW51c2VkIHZhcmlhYmxlIGZyb20g
c2V0dXBfSU9fQVBJQ19pcnFzKCkKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
