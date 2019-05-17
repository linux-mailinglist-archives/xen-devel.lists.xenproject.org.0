Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC021744
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaQa-0005u5-BP; Fri, 17 May 2019 10:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaQY-0005rZ-Bg
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:49:26 +0000
X-Inumbo-ID: 6ddd7446-7891-11e9-a68e-9bcd808cf7cf
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ddd7446-7891-11e9-a68e-9bcd808cf7cf;
 Fri, 17 May 2019 10:49:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:49:21 -0600
Message-Id: <5CDE91B002000078002300AB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:49:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 08/15] x86/IRQs: correct/tighten vector check
 in _clear_irq_vector()
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

SWYgYW55IHBhcnRpY3VsYXIgdmFsdWUgd2FzIHRvIGJlIGNoZWNrZWQgYWdhaW5zdCwgaXQgd291
bGQgbmVlZCB0byBiZQpJUlFfVkVDVE9SX1VOQVNTSUdORUQuCgpSZXBvcnRlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpCZSBtb3JlIHN0cmljdCB0aG91Z2gg
YW5kIHVzZSB2YWxpZF9pcnFfdmVjdG9yKCkgaW5zdGVhZC4KClRha2UgdGhlIG9wcG9ydHVuaXR5
IGFuZCBhbHNvIGNvbnZlcnQgbG9jYWwgdmFyaWFibGVzIHRvIHVuc2lnbmVkIGludC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KdjI6IE5ldy4KCi0tLSBh
L3hlbi9hcmNoL3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTI3NiwxNCAr
Mjc2LDEzIEBAIHZvaWQgZGVzdHJveV9pcnEodW5zaWduZWQgaW50IGlycSkKIAogc3RhdGljIHZv
aWQgX2NsZWFyX2lycV92ZWN0b3Ioc3RydWN0IGlycV9kZXNjICpkZXNjKQogewotICAgIHVuc2ln
bmVkIGludCBjcHU7Ci0gICAgaW50IHZlY3Rvciwgb2xkX3ZlY3RvciwgaXJxID0gZGVzYy0+aXJx
OworICAgIHVuc2lnbmVkIGludCBjcHUsIG9sZF92ZWN0b3IsIGlycSA9IGRlc2MtPmlycTsKKyAg
ICB1bnNpZ25lZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC52ZWN0b3I7CiAgICAgY3B1bWFza190
IHRtcF9tYXNrOwogCi0gICAgQlVHX09OKCFkZXNjLT5hcmNoLnZlY3Rvcik7CisgICAgQlVHX09O
KCF2YWxpZF9pcnFfdmVjdG9yKHZlY3RvcikpOwogCiAgICAgLyogQWx3YXlzIGNsZWFyIGRlc2Mt
PmFyY2gudmVjdG9yICovCi0gICAgdmVjdG9yID0gZGVzYy0+YXJjaC52ZWN0b3I7CiAgICAgY3B1
bWFza19hbmQoJnRtcF9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrLCAmY3B1X29ubGluZV9tYXAp
OwogCiAgICAgZm9yX2VhY2hfY3B1KGNwdSwgJnRtcF9tYXNrKSB7CgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
