Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78B1BEF12
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:54:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQRY-0003NE-BU; Thu, 26 Sep 2019 09:52:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQRW-0003LS-Ic
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:52:10 +0000
X-Inumbo-ID: 4dbf6b6e-e043-11e9-964d-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 4dbf6b6e-e043-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491529; x=1601027529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=M4xZGI3sG3gLLgUNWWpn0VT0zlxORA27r6JiOSmnYMw=;
 b=vAcER24bNxWGPjW5stUr3nOfyK9GZNiyW/cGbJLopdCe4UUVanHWawcB
 /sD7/w38horWqfMuIzsIIHGAbNP5O3/4SpOzHIe8Yr0qidHvKg6sjhlct
 AGYp79+Ng4ytndq63X8G2mkti0MnFSDjyP1bPa8H6zEpq1smwLinTzGG0 0=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836989235"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:50:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id E64E4A02B6; Thu, 26 Sep 2019 09:49:55 +0000 (UTC)
Received: from EX13D28EUC002.ant.amazon.com (10.43.164.254) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:39 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC002.ant.amazon.com (10.43.164.254) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:38 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:34 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:36 +0100
Message-ID: <8f017ae92757547e7b3492357d305045cffb5650.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 73/84] x86/mm: Move vmap_to_mfn() to mm.c
 and rename to virt_to_mfn_walk().
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyax@amazon.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCk9idmlvdXNseSwgdm1hcF90
b19tZm4gaXMgYSBnZW5lcmljIG1lY2hhbmlzbSB0byB3YWxrIHRoZSBwYWdlIHRhYmxlIHRvCmZp
bmQgdGhlIG1mbiwgbm90IHZtYXAgc3BlY2lmaWMuIEFsc28gdGhlIGRpZmZlcmVuY2UgZnJvbSB2
aXJ0X3RvX21mbigpCmlzIHRoYXQgaXQgYWN0dWFsbHkgd2Fsa3MgdGhlIHBhZ2UgdGFibGUgaW5z
dGVhZCBvZiByZWx5aW5nIG9uIGEgZGlyZWN0Cm1hcC4KClNpZ25lZC1vZmYtYnk6IEhvbmd5YW4g
WGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgIHwg
MTMgKysrKysrKysrKysrKwogeGVuL2NvbW1vbi92bWFwLmMgICAgICAgIHwgMTUgKy0tLS0tLS0t
LS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggfCAgMiArKwogeGVuL2luY2x1ZGUveGVu
L3ZtYXAuaCAgIHwgIDMgLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gv
eDg2L21tLmMKaW5kZXggZjMwYjViMzk1MS4uYWI3NjBlY2MxZiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTUwNTYsNiArNTA1NiwxOSBA
QCBsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25lZCBsb25nIHYpCiAgICAgcmV0
dXJuIHBsMWU7CiB9CiAKK3Vuc2lnbmVkIGxvbmcgdmlydF90b19tZm5fd2Fsayh2b2lkICp2YSkK
K3sKKyAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSB2aXJ0X3RvX3hlbl9sMWUoKHVuc2lnbmVkIGxv
bmcpKHZhKSk7CisgICAgdW5zaWduZWQgbG9uZyByZXQgPSBsMWVfZ2V0X3BmbigqcGwxZSk7Cisg
ICAgdW5tYXBfeGVuX3BhZ2V0YWJsZShwbDFlKTsKKyAgICByZXR1cm4gcmV0OworfQorCitzdHJ1
Y3QgcGFnZV9pbmZvICp2aXJ0X3RvX3BhZ2Vfd2Fsayh2b2lkICp2YSkKK3sKKyAgICByZXR1cm4g
bWZuX3RvX3BhZ2UoX21mbih2aXJ0X3RvX21mbl93YWxrKHZhKSkpOworfQorCiAvKiBDb252ZXJ0
IHRvIGZyb20gc3VwZXJwYWdlLW1hcHBpbmcgZmxhZ3MgZm9yIG1hcF9wYWdlc190b194ZW4oKS4g
Ki8KICNkZWZpbmUgbDFmX3RvX2xOZihmKSAoKChmKSAmIF9QQUdFX1BSRVNFTlQpID8gKChmKSB8
ICBfUEFHRV9QU0UpIDogKGYpKQogI2RlZmluZSBsTmZfdG9fbDFmKGYpICgoKGYpICYgX1BBR0Vf
UFJFU0VOVCkgPyAoKGYpICYgfl9QQUdFX1BTRSkgOiAoZikpCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3ZtYXAuYyBiL3hlbi9jb21tb24vdm1hcC5jCmluZGV4IGZjZGI4NDk1YzguLjQzMjNjNjgx
MWYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdm1hcC5jCisrKyBiL3hlbi9jb21tb24vdm1hcC5j
CkBAIC0xOSwxOSArMTksNiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgdm1f
ZW5kW1ZNQVBfUkVHSU9OX05SXTsKIC8qIGxvd2VzdCBrbm93biBjbGVhciBiaXQgaW4gdGhlIGJp
dG1hcCAqLwogc3RhdGljIHVuc2lnbmVkIGludCB2bV9sb3dbVk1BUF9SRUdJT05fTlJdOwogCi1t
Zm5fdCB2bWFwX3RvX21mbih2b2lkICp2YSkKLXsKLSAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSB2
aXJ0X3RvX3hlbl9sMWUoKHVuc2lnbmVkIGxvbmcpKHZhKSk7Ci0gICAgbWZuX3QgcmV0ID0gX21m
bihsMWVfZ2V0X3BmbigqcGwxZSkpOwotICAgIHVubWFwX3hlbl9wYWdldGFibGUocGwxZSk7Ci0g
ICAgcmV0dXJuIHJldDsKLX0KLQotc3RydWN0IHBhZ2VfaW5mbyAqdm1hcF90b19wYWdlKHZvaWQg
KnZhKQotewotICAgIHJldHVybiBtZm5fdG9fcGFnZSh2bWFwX3RvX21mbih2YSkpOwotfQotCiB2
b2lkIF9faW5pdCB2bV9pbml0X3R5cGUoZW51bSB2bWFwX3JlZ2lvbiB0eXBlLCB2b2lkICpzdGFy
dCwgdm9pZCAqZW5kKQogewogICAgIHVuc2lnbmVkIGludCBpLCBucjsKQEAgLTMzMiw3ICszMTks
NyBAQCB2b2lkIHZmcmVlKHZvaWQgKnZhKQogCiAgICAgZm9yICggaSA9IDA7IGkgPCBwYWdlczsg
aSsrICkKICAgICB7Ci0gICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UgPSB2bWFwX3RvX3Bh
Z2UodmEgKyBpICogUEFHRV9TSVpFKTsKKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSA9
IHZpcnRfdG9fcGFnZV93YWxrKHZhICsgaSAqIFBBR0VfU0laRSk7CiAKICAgICAgICAgQVNTRVJU
KHBhZ2UpOwogICAgICAgICBwYWdlX2xpc3RfYWRkKHBhZ2UsICZwZ19saXN0KTsKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApp
bmRleCBhNGIzYzliN2FmLi43NmJhNTZiZGMzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L21tLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCkBAIC02NDMsNiArNjQzLDgg
QEAgdm9pZCBmcmVlX3hlbl9wYWdldGFibGUobWZuX3QgbWZuKTsKICAgICB9IHdoaWxlICgwKQog
CiBsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25lZCBsb25nIHYpOwordW5zaWdu
ZWQgbG9uZyB2aXJ0X3RvX21mbl93YWxrKHZvaWQgKnZhKTsKK3N0cnVjdCBwYWdlX2luZm8gKnZp
cnRfdG9fcGFnZV93YWxrKHZvaWQgKnZhKTsKIAogREVDTEFSRV9QRVJfQ1BVKG1mbl90LCByb290
X3BndF9tZm4pOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3ZtYXAuaAppbmRleCAzZDY5NzI3YTlkLi4zNjk1NjBlNjIwIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi92bWFwLmgKQEAg
LTIzLDkgKzIzLDYgQEAgdm9pZCAqdm1hbGxvY194ZW4oc2l6ZV90IHNpemUpOwogdm9pZCAqdnph
bGxvYyhzaXplX3Qgc2l6ZSk7CiB2b2lkIHZmcmVlKHZvaWQgKnZhKTsKIAotbWZuX3Qgdm1hcF90
b19tZm4odm9pZCAqdmEpOwotc3RydWN0IHBhZ2VfaW5mbyAqdm1hcF90b19wYWdlKHZvaWQgKnZh
KTsKLQogdm9pZCBfX2lvbWVtICppb3JlbWFwKHBhZGRyX3QsIHNpemVfdCk7CiAKIHN0YXRpYyBp
bmxpbmUgdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqdmEpCi0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
