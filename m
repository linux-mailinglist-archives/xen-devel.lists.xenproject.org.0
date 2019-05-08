Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51757179D3
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:02:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMAu-0005NK-9b; Wed, 08 May 2019 12:59:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMAt-0005NF-Cp
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:59:55 +0000
X-Inumbo-ID: 2bf57e58-7191-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2bf57e58-7191-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 12:59:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 06:59:52 -0600
Message-Id: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 06:59:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 00/12] x86: IRQ management adjustments
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
aGlsZSBsb29raW5nIGF0IHZhcmlvdXMgcGllY2VzCm9mIGludm9sdmVkIGNvZGUuCgowMTogZGVh
bCB3aXRoIG1vdmUtaW4tcHJvZ3Jlc3Mgc3RhdGUgaW4gZml4dXBfaXJxcygpCjAyOiBkZWFsIHdp
dGggbW92ZSBjbGVhbnVwIGNvdW50IHN0YXRlIGluIGZpeHVwX2lycXMoKQowMzogYXZvaWQgVUIg
KG9yIHdvcnNlKSBpbiB0cmFjZV9pcnFfbWFzaygpCjA0OiBpbXByb3ZlIGR1bXBfaXJxcygpCjA1
OiBkZXNjLT5hZmZpbml0eSBzaG91bGQgc3RyaWN0bHkgcmVwcmVzZW50IHRoZSByZXF1ZXN0ZWQg
dmFsdWUKMDY6IGNvbnNvbGlkYXRlIHVzZSBvZiAtPmFyY2guY3B1X21hc2sKMDc6IGZpeCBsb2Nr
aW5nIGFyb3VuZCB2ZWN0b3IgbWFuYWdlbWVudAowODogY29ycmVjdC90aWdodGVuIHZlY3RvciBj
aGVjayBpbiBfY2xlYXJfaXJxX3ZlY3RvcigpCjA5OiBtYWtlIGZpeHVwX2lycXMoKSBza2lwIHVu
Y29ubmVjdGVkIGludGVybmFsbHkgdXNlZCBpbnRlcnJ1cHRzCjEwOiByZWR1Y2UgdW51c2VkIHNw
YWNlIGluIHN0cnVjdCBhcmNoX2lycV9kZXNjCjExOiBkcm9wIHJlZHVuZGFudCBjcHVtYXNrX2Vt
cHR5KCkgZnJvbSBtb3ZlX21hc2tlZF9pcnEoKQoxMjogc2ltcGxpZnkgYW5kIHJlbmFtZSBwaXJx
X2Fja3R5cGUoKQoKSW4gcHJpbmNpcGxlIHBhdGNoZXMgMS0zLCA1LTcsIGFuZCBtYXliZSA5IGFy
ZSBiYWNrcG9ydGluZyBjYW5kaWRhdGVzLgpUaGVpciBpbnRydXNpdmUgbmF0dXJlIG1ha2VzIHdh
bnRpbmcgdG8gZG8gc28gcXVlc3Rpb25hYmxlLCB0aG91Z2guCgpJJ20gb21pdHRpbmcgdGhlIGZp
bmFsIHYxICJ4ODYvSU8tQVBJQzogZHJvcCBhbiB1bnVzZWQgdmFyaWFibGUgZnJvbQpzZXR1cF9J
T19BUElDX2lycXMoKSIgaGVyZSwgYXMgaXQgd2FzIGFja2VkIGFscmVhZHkgYW5kIGlzIGVudGly
ZWx5CmluZGVwZW5kZW50IG9mIHRoaXMgc2VyaWVzLiBGb3Igb3RoZXIgdjIgc3BlY2lmaWMgaW5m
b3JtYXRpb24gcGxlYXNlCnNlZSB0aGUgaW5kaXZpZHVhbCBwYXRjaGVzLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
