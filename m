Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A721757
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:55:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaTf-0006zq-A2; Fri, 17 May 2019 10:52:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaTe-0006zk-BD
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:52:38 +0000
X-Inumbo-ID: df7f79f0-7891-11e9-9429-bbaec451148c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df7f79f0-7891-11e9-9429-bbaec451148c;
 Fri, 17 May 2019 10:52:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:52:32 -0600
Message-Id: <5CDE927002000078002300BA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:52:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 13/15] x86/IRQ: tighten vector checks
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

VXNlIHZhbGlkX2lycV92ZWN0b3IoKSByYXRoZXIgdGhhbiAiPiAwIi4KCkFsc28gcmVwbGFjZSBh
biBvcGVuLWNvZGVkIHVzZSBvZiBJUlFfVkVDVE9SX1VOQVNTSUdORUQuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MzogTmV3LgoKLS0tIGEveGVu
L2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAtMzQyLDcgKzM0Miw3
IEBAIHZvaWQgY2xlYXJfaXJxX3ZlY3RvcihpbnQgaXJxKQogCiBpbnQgaXJxX3RvX3ZlY3Rvcihp
bnQgaXJxKQogewotICAgIGludCB2ZWN0b3IgPSAtMTsKKyAgICBpbnQgdmVjdG9yID0gSVJRX1ZF
Q1RPUl9VTkFTU0lHTkVEOwogCiAgICAgQlVHX09OKGlycSA+PSBucl9pcnFzIHx8IGlycSA8IDAp
OwogCkBAIC00NTIsMTUgKzQ1MiwxOCBAQCBzdGF0aWMgdm1hc2tfdCAqaXJxX2dldF91c2VkX3Zl
Y3Rvcl9tYXNrCiAgICAgICAgICAgICBpbnQgdmVjdG9yOwogICAgICAgICAgICAgCiAgICAgICAg
ICAgICB2ZWN0b3IgPSBpcnFfdG9fdmVjdG9yKGlycSk7Ci0gICAgICAgICAgICBpZiAoIHZlY3Rv
ciA+IDAgKQorICAgICAgICAgICAgaWYgKCB2YWxpZF9pcnFfdmVjdG9yKHZlY3RvcikgKQogICAg
ICAgICAgICAgewotICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiSVJRICVkIGFs
cmVhZHkgYXNzaWduZWQgdmVjdG9yICVkXG4iLAorICAgICAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfSU5GTyAiSVJRJWQgYWxyZWFkeSBhc3NpZ25lZCB2ZWN0b3IgJTAyeFxuIiwKICAgICAgICAg
ICAgICAgICAgICAgICAgaXJxLCB2ZWN0b3IpOwogICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgIEFTU0VSVCghdGVzdF9iaXQodmVjdG9yLCByZXQpKTsKIAogICAgICAgICAgICAgICAg
IHNldF9iaXQodmVjdG9yLCByZXQpOwogICAgICAgICAgICAgfQorICAgICAgICAgICAgZWxzZSBp
ZiAoIHZlY3RvciAhPSBJUlFfVkVDVE9SX1VOQVNTSUdORUQgKQorICAgICAgICAgICAgICAgIHBy
aW50ayhYRU5MT0dfV0FSTklORyAiSVJRJWQgbWFwcGVkIHRvIGJvZ3VzIHZlY3RvciAlMDJ4XG4i
LAorICAgICAgICAgICAgICAgICAgICAgICBpcnEsIHZlY3Rvcik7CiAgICAgICAgIH0KICAgICB9
CiAgICAgZWxzZSBpZiAoIElPX0FQSUNfSVJRKGlycSkgJiYKQEAgLTQ5MSw3ICs0OTQsNyBAQCBz
dGF0aWMgaW50IF9hc3NpZ25faXJxX3ZlY3RvcihzdHJ1Y3QgaXJxCiAgICAgdm1hc2tfdCAqaXJx
X3VzZWRfdmVjdG9ycyA9IE5VTEw7CiAKICAgICBvbGRfdmVjdG9yID0gaXJxX3RvX3ZlY3Rvcihp
cnEpOwotICAgIGlmICggb2xkX3ZlY3RvciA+IDAgKQorICAgIGlmICggdmFsaWRfaXJxX3ZlY3Rv
cihvbGRfdmVjdG9yKSApCiAgICAgewogICAgICAgICBjcHVtYXNrX3QgdG1wX21hc2s7CiAKQEAg
LTU1NSw3ICs1NTgsNyBAQCBuZXh0OgogICAgICAgICBjdXJyZW50X3ZlY3RvciA9IHZlY3RvcjsK
ICAgICAgICAgY3VycmVudF9vZmZzZXQgPSBvZmZzZXQ7CiAKLSAgICAgICAgaWYgKCBvbGRfdmVj
dG9yID4gMCApCisgICAgICAgIGlmICggdmFsaWRfaXJxX3ZlY3RvcihvbGRfdmVjdG9yKSApCiAg
ICAgICAgIHsKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2gub2xkX2NwdV9tYXNr
LCBkZXNjLT5hcmNoLmNwdV9tYXNrLAogICAgICAgICAgICAgICAgICAgICAgICAgJmNwdV9vbmxp
bmVfbWFwKTsKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
