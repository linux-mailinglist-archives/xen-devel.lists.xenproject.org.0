Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454529828
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 14:38:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU9RD-0003An-7r; Fri, 24 May 2019 12:36:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU9RB-0003Ag-Au
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 12:36:41 +0000
X-Inumbo-ID: 92d2f714-7e20-11e9-972b-13702c0ed696
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92d2f714-7e20-11e9-972b-13702c0ed696;
 Fri, 24 May 2019 12:36:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 06:36:37 -0600
Message-Id: <5CE7E555020000780023204E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 06:36:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/CPUID: adjust SSEn dependencies
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

QWxvbmcgdGhlIGxpbmVzIG9mIGI5ZjYzOTU1OTAgKCJ4ODYvY3B1aWQ6IGFkanVzdCBkZXBlbmRl
bmNpZXMgb2YKcG9zdC1TU0UgSVNBIGV4dGVuc2lvbnMiKSBmdXJ0aGVyIGNvbnZlcnQgU1NFbiBk
ZXBlbmRlbmNpZXMgdG8gYmUgbW9yZQpjaGFpbiBsaWtlLCB3aXRoIGVhY2ggc3VjY2Vzc29yIGFk
ZGl0aW9uIGRlcGVuZGluZyBvbiBpdHMgaW1tZWRpYXRlCnByZWRlY2Vzc29yLiBUaGlzIGlzIG1v
cmUgaW4gbGluZSB3aXRoIGhvdyBoYXJkd2FyZSBoYXMgaW52b2x2ZWQsIGFuZApob3cgb3RoZXIg
cHJvamVjdHMgbGlrZSBnY2MgYW5kIGJpbnV0aWxzIGNvbm5lY3QgdGhpbmdzIHRvZ2V0aGVyLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L3Rvb2xzL2dlbi1jcHVpZC5weQorKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5CkBAIC0xOTYs
MTggKzE5NiwxNiBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgogICAgICAgICAjIGluc3Ry
dWN0aW9ucy4gIFNldmVyYWwgZnV0aGVyIGluc3RydWN0aW9uIHNldHMgYXJlIGJ1aWx0IG9uIGNv
cmUKICAgICAgICAgIyAlWE1NIHN1cHBvcnQsIHdpdGhvdXQgc3BlY2lmaWMgaW50ZXItZGVwZW5k
ZW5jaWVzLiAgQWRkaXRpb25hbGx5CiAgICAgICAgICMgQU1EIGhhcyBhIHNwZWNpYWwgbWlzLWFs
aWdubWVudCBzdWItbW9kZS4KLSAgICAgICAgU1NFOiBbU1NFMiwgU1NFMywgU1NTRTMsIFNTRTRB
LCBNSVNBTElHTlNTRV0sCisgICAgICAgIFNTRTogW1NTRTIsIE1JU0FMSUdOU1NFXSwKIAogICAg
ICAgICAjIFNTRTIgd2FzIHJlLXNwZWNpZmllZCBhcyBjb3JlIGluc3RydWN0aW9ucyBmb3IgNjRi
aXQuICBBbHNvIElTQQogICAgICAgICAjIGV4dGVuc2lvbnMgZGVhbGluZyB3aXRoIHZlY3RvcnMg
b2YgaW50ZWdlcnMgYXJlIGFkZGVkIGhlcmUgcmF0aGVyCiAgICAgICAgICMgdGhhbiB0byBTU0Uu
Ci0gICAgICAgIFNTRTI6IFtMTSwgQUVTTkksIFBDTE1VTFFEUSwgU0hBXSwKKyAgICAgICAgU1NF
MjogW1NTRTMsIExNLCBBRVNOSSwgUENMTVVMUURRLCBTSEFdLAogCi0gICAgICAgICMgU1NFNC4x
IGV4cGxpY2l0bHkgZGVwZW5kcyBvbiBTU0UzIGFuZCBTU1NFMwotICAgICAgICBTU0UzOiBbU1NF
NF8xXSwKLSAgICAgICAgU1NTRTM6IFtTU0U0XzFdLAotCi0gICAgICAgICMgU1NFNC4yIGV4cGxp
Y2l0bHkgZGVwZW5kcyBvbiBTU0U0LjEKKyAgICAgICAgIyBPdGhlciBTU0VuIGVhY2ggZGVwZW5k
IG9uIHRoZWlyIHByZWRlY2Vzc29yIHZlcnNpb25zLgorICAgICAgICBTU0UzOiBbU1NTRTNdLAor
ICAgICAgICBTU1NFMzogW1NTRTRfMSwgU1NFNEFdLAogICAgICAgICBTU0U0XzE6IFtTU0U0XzJd
LAogCiAgICAgICAgICMgQU1EIHNwZWNpZnkgbm8gcmVsYXRpb25zaGlwIGJldHdlZW4gUE9QQ05U
IGFuZCBTU0U0LjIuICBJbnRlbAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
