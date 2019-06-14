Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF345B94
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkWw-0001X6-Q9; Fri, 14 Jun 2019 11:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbkWv-0001Wz-Cs
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:38:01 +0000
X-Inumbo-ID: da6831f6-8e98-11e9-a542-8b41a1c61c36
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da6831f6-8e98-11e9-a542-8b41a1c61c36;
 Fri, 14 Jun 2019 11:37:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 05:37:55 -0600
Message-Id: <5D03870E0200007800238473@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 05:37:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
In-Reply-To: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH RFC 2/3] x86/ACPI: restore VESA mode upon resume
 from S3
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
 Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgZm9yICJhY3BpX3NsZWVwPXMzX21vZGUiIHRvIGhhdmUgYW55IGVmZmVjdCwgd2Ug
c2hvdWxkIHJlY29yZAp0aGUgdmlkZW8gbW9kZSB3ZSBzd2l0Y2hlZCB0byBkdXJpbmcgYm9vdC4g
U2luY2UgcmlnaHQgbm93IHRoZXJlJ3MgbW9kZQpzZXR0aW5nIGNvZGUgZm9yIFZFU0EgbW9kZXMg
b25seSBpbiB0aGUgcmVzdW1lIGNhc2UsIHJlY29yZCB0aGUgbW9kZQpqdXN0IGluIHRoYXQgb25l
IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0t
LQpSRkM6IE9uIHRoZSBib3ggdGhhdCBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIHRlc3QgdGhpcyBvbiB0
aGlzIGRpZG4ndCByZWFsbHkKICAgICBtYWtlIGEgZGlmZmVyZW5jZSAoaW4gdGhlIHJhbmRvbSBj
YXNlcyB3aGVyZSByZXN1bWUgd29ya3MgaW4gdGhlCiAgICAgZmlyc3QgcGxhY2UgdGhlcmUpOiBU
aGUgZ3JhcGhpY3MgY2FyZCBsb29rcyB0byByZW1haW4gcG93ZXJlZCBvZmYKICAgICBldmVuIGFm
dGVyIHRoZSBEb20wIGtlcm5lbCBoYXMgcmVzdW1lZC4gQWRkaXRpb25hbGx5IHVzaW5nCiAgICAg
ImFjcGlfc2xlZXA9czNfYmlvcyIgZGlkbid0IG1ha2UgYSBkaWZmZXJlbmNlIGVpdGhlci4gRnVy
dGhlcm1vcmUKICAgICBpdCBsb29rcyBsaWtlIHRoZSBzZXJpYWwgY29uc29sZSAoY29ubmVjdGVk
IHZpYSBQQ0kgY2FyZCkgZG9lc24ndAogICAgIHdvcmsgKHlldCkgaW1tZWRpYXRlbHkgYWZ0ZXIg
cmVzdW1lIChJIHN1cHBvc2UgaXQgdG9vIGlzIHBvd2VyZWQKICAgICBkb3duKSwgYW5kIHJlc3Vt
ZSBoYW5ncyBhbHRvZ2V0aGVyIHdpdGggaXQgaW4gdXNlLiBIZW5jZSBpdCdzIHNvcnQKICAgICBv
ZiBkaWZmaWN1bHQgdG8gYWN0dWFsbHkgZGVidWcgYW55dGhpbmcgaGVyZS4KLS0tCkknbSB3b25k
ZXJpbmcgYWN0dWFsbHkgd2hldGhlciB0aGUgdXNlciBoYXZpbmcgdG8gZXhwbGljaXRseSByZXF1
ZXN0IHRoZQptb2RlIHJlc3RvcmF0aW9uIGlzIGEgZ29vZCBtb2RlbDogV2h5IHdvdWxkIHdlIF9u
b3RfIHdhbnQgdG8gcmVzdG9yZSB0aGUKbW9kZSB3ZSd2ZSBzZXQgZHVyaW5nIGJvb3Q/IEluIHRo
ZSB3b3JzdCBjYXNlIERvbTAga2VybmVsIG9yIFggd2lsbApjaGFuZ2UgdGhlIG1vZGUgYW5vdGhl
ciB0aW1lLgoKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdmlkZW8uUworKysgYi94ZW4vYXJjaC94
ODYvYm9vdC92aWRlby5TCkBAIC00NTUsMTQgKzQ1NSwxNyBAQCBjaGVja192ZXNhOgogICAgICAg
ICBjbXBiICAgICQweDk5LCAlYWwKICAgICAgICAgam56ICAgICBfc2V0YmFkICAgICAgICAgICAg
ICAgICAjIERvaCEgTm8gbGluZWFyIGZyYW1lIGJ1ZmZlci4KIAorICAgICAgICBwdXNodyAgICVi
eAogICAgICAgICBzdWJiICAgICRWSURFT19GSVJTVF9WRVNBPj44LCAlYmgKICAgICAgICAgb3J3
ICAgICAkMHg0MDAwLCAlYnggICAgICAgICAgICAjIFVzZSBsaW5lYXIgZnJhbWUgYnVmZmVyCiAg
ICAgICAgIG1vdncgICAgJDB4NGYwMiwgJWF4ICAgICAgICAgICAgIyBWRVNBIEJJT1MgbW9kZSBz
ZXQgY2FsbAogICAgICAgICBpbnQgICAgICQweDEwCisgICAgICAgIHBvcHcgICAgJWJ4CiAgICAg
ICAgIGNtcHcgICAgJDB4MDA0ZiwgJWF4ICAgICAgICAgICAgIyBBTD00ZiBpZiBpbXBsZW1lbnRl
ZAogICAgICAgICBqbnogICAgIF9zZXRiYWQgICAgICAgICAgICAgICAgICMgQUg9MCBpZiBPSwog
CiAgICAgICAgIG1vdmIgICAgJDEsIGJvb3RzeW0oZ3JhcGhpY19tb2RlKSAgIyBmbGFnIGdyYXBo
aWMgbW9kZQorICAgICAgICBtb3Z3ICAgICVieCwgYm9vdHN5bSh2aWRlb19tb2RlKQogICAgICAg
ICBzdGMKICAgICAgICAgcmV0CiAKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
