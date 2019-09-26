Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64943BEEF4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQP9-0006jy-FP; Thu, 26 Sep 2019 09:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQP6-0006gg-QV
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:40 +0000
X-Inumbo-ID: dd4b39b4-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id dd4b39b4-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491340; x=1601027340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=W9PzwUfjSXRL4r6oD5FHM2BfgE+AdiBZBwN49R8r3mM=;
 b=L3BrHHSJri84FOybN41H3Nb4hFyganCynfTebEJZLzXzOvbxDbuHzGGO
 eCCBtycat0ak9GfoJkUMZ89rdo/RLegkfy6xc7fHRzjpirmgfwA68p2Ya
 PWdQbkCj14wpnFwyurpghYAvC6WPzR+Rz4YyLYMm6nDd/dT+p7aiy1MdR k=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354289"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:49:00 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2F7D0A2A39; Thu, 26 Sep 2019 09:49:00 +0000 (UTC)
Received: from EX13D18UWA004.ant.amazon.com (10.43.160.45) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:33 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA004.ant.amazon.com (10.43.160.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:32 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:31 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:17 +0100
Message-ID: <4295599137290de85e7964b7a2dd7311a5d52ff3.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 54/84] x86/mm: drop old page table APIs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk5vdyB0aGF0IHdlJ3ZlIHN3aXRj
aGVkIGFsbCB1c2VycyB0byB0aGUgbmV3IEFQSXMsIHRoZSBvbGQgb25lcyBhcmVuJ3QKbmVlZGVk
IGFueW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgfCAgMiAtLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdl
LmggfCAgNSAtLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDMwMjQyM2Ex
MWYuLmQ1OTRiNjE3MDIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC00ODUwLDIyICs0ODUwLDYgQEAgaW50IG1tY2ZnX2ludGVyY2VwdF93
cml0ZSgKICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwogfQogCi12b2lkICphbGxvY194ZW5fcGFn
ZXRhYmxlKHZvaWQpCi17Ci0gICAgbWZuX3QgbWZuOwotCi0gICAgbWZuID0gYWxsb2NfeGVuX3Bh
Z2V0YWJsZV9uZXcoKTsKLSAgICBBU1NFUlQoIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSk7Ci0K
LSAgICByZXR1cm4gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7Ci19Ci0KLXZvaWQgZnJlZV94
ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCi17Ci0gICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NU
QVRFX2Vhcmx5X2Jvb3QgKQotICAgICAgICBmcmVlX3hlbl9wYWdldGFibGVfbmV3KHZpcnRfdG9f
bWZuKHYpKTsKLX0KLQogbWZuX3QgYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcodm9pZCkKIHsKICAg
ICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5k
ZXggMTJhMTBiMjcwZC4uNGZiNzlhYjhmMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtNjMxLDggKzYzMSw2IEBA
IGludCBhcmNoX2FjcXVpcmVfcmVzb3VyY2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50
IHR5cGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mcmFtZXMs
IHhlbl9wZm5fdCBtZm5fbGlzdFtdKTsKIAogLyogQWxsb2NhdG9yIGZ1bmN0aW9ucyBmb3IgWGVu
IHBhZ2V0YWJsZXMuICovCi12b2lkICphbGxvY194ZW5fcGFnZXRhYmxlKHZvaWQpOwotdm9pZCBm
cmVlX3hlbl9wYWdldGFibGUodm9pZCAqdik7CiBtZm5fdCBhbGxvY194ZW5fcGFnZXRhYmxlX25l
dyh2b2lkKTsKIHZvaWQgKm1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pOwogdm9pZCB1
bm1hcF94ZW5fcGFnZXRhYmxlX25ldyh2b2lkICp2KTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvcGFnZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKaW5kZXggMDVhOGIx
ZWZhNi4uOTA2ZWM3MDFhMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKQEAgLTE4NywxMSArMTg3LDYgQEAgc3Rh
dGljIGlubGluZSBsNF9wZ2VudHJ5X3QgbDRlX2Zyb21fcGFkZHIocGFkZHJfdCBwYSwgdW5zaWdu
ZWQgaW50IGZsYWdzKQogI2RlZmluZSBsNGVfaGFzX2NoYW5nZWQoeCx5LGZsYWdzKSBcCiAgICAg
KCAhISgoKHgpLmw0IF4gKHkpLmw0KSAmICgoUEFERFJfTUFTSyZQQUdFX01BU0spfHB1dF9wdGVf
ZmxhZ3MoZmxhZ3MpKSkgKQogCi0vKiBQYWdldGFibGUgd2Fsa2luZy4gKi8KLSNkZWZpbmUgbDJl
X3RvX2wxZSh4KSAgICAgICAgICAgICAgKChsMV9wZ2VudHJ5X3QgKilfX3ZhKGwyZV9nZXRfcGFk
ZHIoeCkpKQotI2RlZmluZSBsM2VfdG9fbDJlKHgpICAgICAgICAgICAgICAoKGwyX3BnZW50cnlf
dCAqKV9fdmEobDNlX2dldF9wYWRkcih4KSkpCi0jZGVmaW5lIGw0ZV90b19sM2UoeCkgICAgICAg
ICAgICAgICgobDNfcGdlbnRyeV90ICopX192YShsNGVfZ2V0X3BhZGRyKHgpKSkKLQogI2RlZmlu
ZSBtYXBfbDF0X2Zyb21fbDJlKHgpICAgICAgICAobDFfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9w
YWdlKGwyZV9nZXRfbWZuKHgpKQogI2RlZmluZSBtYXBfbDJ0X2Zyb21fbDNlKHgpICAgICAgICAo
bDJfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9wYWdlKGwzZV9nZXRfbWZuKHgpKQogI2RlZmluZSBt
YXBfbDN0X2Zyb21fbDRlKHgpICAgICAgICAobDNfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9wYWdl
KGw0ZV9nZXRfbWZuKHgpKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
