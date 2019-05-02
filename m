Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E01118E5
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 14:21:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAft-0004Nr-BA; Thu, 02 May 2019 12:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAfs-0004Nm-2Y
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:18:52 +0000
X-Inumbo-ID: 6dafb010-6cd4-11e9-8008-bf3054c97303
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dafb010-6cd4-11e9-8008-bf3054c97303;
 Thu, 02 May 2019 12:18:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:18:43 -0600
Message-Id: <5CCAE022020000780022B2E5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:18:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 1/9] x86: adjust cr3_pcid() return type
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBuZWVkIGZvciBpdCB0byBiZSA2NCBiaXRzIHdpZGUgLSBvbmx5IHRoZSBsb3cg
dHdlbHZlIGJpdHMKb2YgQ1IzIGhvbGQgdGhlIFBDSUQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwor
KysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpAQCAtMTAzLDcgKzEwMyw4IEBAIHN0YXRpYyB2
b2lkIGRvX3RsYl9mbHVzaCh2b2lkKQogCiB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxv
bmcgY3IzLCB1bnNpZ25lZCBsb25nIGNyNCkKIHsKLSAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBv
bGRfY3I0LCBvbGRfcGNpZDsKKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBvbGRfY3I0OworICAg
IHVuc2lnbmVkIGludCBvbGRfcGNpZDsKICAgICB1MzIgdDsKIAogICAgIC8qIFRoaXMgbm9uLXJl
ZW50cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVycnVwdCBjb250ZXh0
LiAqLwotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKQEAgLTI5Miw3ICsyOTIsNyBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgY3IzX3BhKHVuc2lnCiAgICAgcmV0dXJuIGNyMyAmIFg4Nl9DUjNfQURE
Ul9NQVNLOwogfQogCi1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgY3IzX3BjaWQodW5zaWdu
ZWQgbG9uZyBjcjMpCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBjcjNfcGNpZCh1bnNpZ25l
ZCBsb25nIGNyMykKIHsKICAgICByZXR1cm4gY3IzICYgWDg2X0NSM19QQ0lEX01BU0s7CiB9CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
