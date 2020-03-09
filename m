Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB417DD79
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:26:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFZ8-00006S-38; Mon, 09 Mar 2020 10:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eS/D=42=xen.org=prvs=330d716a0=paul@srs-us1.protection.inumbo.net>)
 id 1jBFZ6-00006D-Hp
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 10:23:16 +0000
X-Inumbo-ID: fcf6a920-61ef-11ea-abfc-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcf6a920-61ef-11ea-abfc-12813bfff9fa;
 Mon, 09 Mar 2020 10:23:16 +0000 (UTC)
IronPort-SDR: ZRUhVsFsfKkw+4LnGrodeMbFgYVm19wV6EGf/Hh/sXtXUWxL1ys7v0hW+s0+xgyTC5YAKzZkqb
 2cOeS/aMnkWw==
X-IronPort-AV: E=Sophos;i="5.70,532,1574121600"; d="scan'208";a="21678794"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 09 Mar 2020 10:23:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9F338A245B; Mon,  9 Mar 2020 10:23:12 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 9 Mar 2020 10:23:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 10:23:11 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Mon, 9 Mar 2020 10:23:09 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 10:23:00 +0000
Message-ID: <20200309102304.1251-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309102304.1251-1-paul@xen.org>
References: <20200309102304.1251-1-paul@xen.org>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 2/6] x86 / p2m: replace page_list check in
 p2m_alloc_table...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKLi4uIHdpdGggYSBjaGVj
ayBvZiBkb21haW5fdG90X3BhZ2VzKCkuCgpUaGUgY2hlY2sgb2YgcGFnZV9saXN0IHByZXZlbnRz
IHRoZSBwcmlvciBhbGxvY2F0aW9uIG9mIFBHQ19leHRyYSBwYWdlcywKd2hlcmVhcyB3aGF0IHRo
ZSBjb2RlIGlzIHRyeWluZyB0byB2ZXJpZnkgaXMgdGhhdCB0aGUgdG9vbHN0YWNrIGhhcyBub3QK
YWxyZWFkeSBSQU0gZm9yIHRoZSBkb21haW4uCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2
NDoKIC0gUmUtd29ya2VkIHNvIGFzIG5vdCB0byBjb21wbGV0ZWx5IHJlbW92ZSB0aGUgY2hlY2sK
CnYyOgogLSBOZXcgaW4gdjIKLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCAzNzE5
ZGVhZTc3Li45ZjUxMzcwMzI3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysr
IGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC02OTUsOCArNjk1LDcgQEAgaW50IHAybV9hbGxv
Y190YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQogCiAgICAgcDJtX2xvY2socDJtKTsKIAot
ICAgIGlmICggcDJtX2lzX2hvc3RwMm0ocDJtKQotICAgICAgICAgJiYgIXBhZ2VfbGlzdF9lbXB0
eSgmZC0+cGFnZV9saXN0KSApCisgICAgaWYgKCBwMm1faXNfaG9zdHAybShwMm0pICYmIGRvbWFp
bl90b3RfcGFnZXMoZCkgKQogICAgIHsKICAgICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxyZWFk
eSBoYXMgbWVtb3J5IGFsbG9jYXRlZFxuIiwgZC0+ZG9tYWluX2lkKTsKICAgICAgICAgcDJtX3Vu
bG9jayhwMm0pOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
