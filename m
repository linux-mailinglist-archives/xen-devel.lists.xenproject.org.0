Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BD260B2
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 11:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTNov-0006WW-4l; Wed, 22 May 2019 09:46:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTNot-0006Vo-Vl
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:46:00 +0000
X-Inumbo-ID: 63e2fc0c-7c76-11e9-9cbe-4347524bb1c0
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63e2fc0c-7c76-11e9-9cbe-4347524bb1c0;
 Wed, 22 May 2019 09:45:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2ABA5AF11;
 Wed, 22 May 2019 09:45:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 22 May 2019 11:45:47 +0200
Message-Id: <20190522094549.28397-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190522094549.28397-1-jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZXJlIGlzIG9ubHkgb25lIHVzZXIgb2YgaW5fYXRvbWljKCksIGFuZCB0aGF0
IGlzIGluIGFuCiNpZmRlZiAwIHNlY3Rpb24uIFRoaXMgaGFzIGJlZW4gc28gc2luY2UgWGVuIDQu
MSwgc28gY2hhbmNlcyBhcmUKcmF0aGVyIHNsaW0gd2Ugc3VkZGVubHkgd2FudCB0byBlbmFibGUg
aXQgYWdhaW4uCgpEcm9wcGluZyBpbl9hdG9taWMoKSB3aWxsIHJlbW92ZSB0aGUgbGFzdCB1c2Vy
IG9mIHByZWVtcHRfY291bnQoKQppbiBub24tZGVidWcgYnVpbGRzIGVuYWJsaW5nIGZ1cnRoZXIg
b3B0aW1pemF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0t
LQogeGVuL2NvbW1vbi9wcmVlbXB0LmMgICAgICB8ICA1IC0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4v
cHJlZW1wdC5oIHwgIDIgLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMK
aW5kZXggODk5M2MyYWE1Ny4uN2IzNjc2NWI5NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC0zMTg1LDIyICszMTg1LDYg
QEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KAogCiAgICAg
QVNTRVJUKGlzX2h2bV92Y3B1KHYpKTsKIAotICAgIC8qCi0gICAgICogWFhYIERpc2FibGUgZm9y
IDQuMS4wOiBQVi1vbi1IVk0gZHJpdmVycyB3aWxsIGRvIGdyYW50LXRhYmxlIG9wcwotICAgICAq
IHN1Y2ggYXMgcXVlcnlfc2l6ZS4gR3JhbnQtdGFibGUgY29kZSBjdXJyZW50bHkgZG9lcyBjb3B5
X3RvL2Zyb21fZ3Vlc3QKLSAgICAgKiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1kb21haW4g
bG9jaywgd2hpY2ggdGhpcyB0ZXN0IHdvdWxkIGRpc2FsbG93LgotICAgICAqIFRoZSB0ZXN0IGlz
IG5vdCBuZWVkZWQgdW50aWwgd2UgaW1wbGVtZW50IHNsZWVwaW5nLW9uLXdhaXRxdWV1ZSB3aGVu
Ci0gICAgICogd2UgYWNjZXNzIGEgcGFnZWQtb3V0IGZyYW1lLCBhbmQgdGhhdCdzIHBvc3QgNC4x
LjAgbm93LgotICAgICAqLwotI2lmIDAKLSAgICAvKgotICAgICAqIElmIHRoZSByZXF1aXJlZCBn
dWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0LCB0aGlzIGZ1bmN0aW9uIG1heSBzbGVlcC4KLSAgICAg
KiBIZW5jZSB3ZSBiYWlsIGltbWVkaWF0ZWx5IGlmIGNhbGxlZCBmcm9tIGF0b21pYyBjb250ZXh0
LgotICAgICAqLwotICAgIGlmICggaW5fYXRvbWljKCkgKQotICAgICAgICByZXR1cm4gSFZNVFJB
TlNfdW5oYW5kbGVhYmxlOwotI2VuZGlmCi0KICAgICB3aGlsZSAoIHRvZG8gPiAwICkKICAgICB7
CiAgICAgICAgIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCByZXM7CmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3ByZWVtcHQuYyBiL3hlbi9jb21tb24vcHJlZW1wdC5jCmluZGV4IDNiNDE3OGZk
NDQuLjIwOTEzZTIwZDMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcHJlZW1wdC5jCisrKyBiL3hl
bi9jb21tb24vcHJlZW1wdC5jCkBAIC0yNSwxMSArMjUsNiBAQAogCiBERUZJTkVfUEVSX0NQVSh1
bnNpZ25lZCBpbnQsIF9fcHJlZW1wdF9jb3VudCk7CiAKLWJvb2xfdCBpbl9hdG9taWModm9pZCkK
LXsKLSAgICByZXR1cm4gcHJlZW1wdF9jb3VudCgpIHx8IGluX2lycSgpIHx8ICFsb2NhbF9pcnFf
aXNfZW5hYmxlZCgpOwotfQotCiAjaWZuZGVmIE5ERUJVRwogdm9pZCBBU1NFUlRfTk9UX0lOX0FU
T01JQyh2b2lkKQogewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3ByZWVtcHQuaCBiL3hl
bi9pbmNsdWRlL3hlbi9wcmVlbXB0LmgKaW5kZXggYmVmODMxMzVhMS4uZjcxNWNhMDliYyAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3ByZWVtcHQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4v
cHJlZW1wdC5oCkBAIC0yNiw4ICsyNiw2IEBAIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQs
IF9fcHJlZW1wdF9jb3VudCk7CiAgICAgcHJlZW1wdF9jb3VudCgpLS07ICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiB9IHdoaWxlICgwKQogCi1ib29sX3QgaW5fYXRvbWljKHZvaWQpOwotCiAj
aWZuZGVmIE5ERUJVRwogdm9pZCBBU1NFUlRfTk9UX0lOX0FUT01JQyh2b2lkKTsKICNlbHNlCi0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
