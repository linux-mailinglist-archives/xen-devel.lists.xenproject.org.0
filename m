Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1A17DC90
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 10:38:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBEol-000355-Jb; Mon, 09 Mar 2020 09:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eS/D=42=xen.org=prvs=330d716a0=paul@srs-us1.protection.inumbo.net>)
 id 1jBEoj-00034B-Hl
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 09:35:21 +0000
X-Inumbo-ID: 4b34329e-61e9-11ea-b52f-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b34329e-61e9-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 09:35:21 +0000 (UTC)
IronPort-SDR: G9YbFJXgEyh8vGFiMH96/b8V4JGb1O8LfXN5mkzjAEWD4t0XaEdiQqnak2WAEowTGb0kKLMcgG
 0AnAlXTPE9xQ==
X-IronPort-AV: E=Sophos;i="5.70,532,1574121600"; d="scan'208";a="31422991"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Mar 2020 09:35:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8E169A2C1C; Mon,  9 Mar 2020 09:35:19 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 9 Mar 2020 09:35:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 09:35:17 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 9 Mar 2020 09:35:16 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 09:35:07 +0000
Message-ID: <20200309093511.1727-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309093511.1727-1-paul@xen.org>
References: <20200309093511.1727-1-paul@xen.org>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 2/6] x86 / p2m: remove page_list check in
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

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKLi4uIGFuZCByZXBsYWNl
IHdpdGggYSBjaGVjayBvZiBkb21haW5fdG90X3BhZ2VzKCkuCgpUaGUgY2hlY2sgb2YgcGFnZV9s
aXN0IHByZXZlbnRzIHRoZSBwcmlvciBhbGxvY2F0aW9uIG9mIFBHQ19leHRyYSBwYWdlcywKd2hl
cmVhcyB3aGF0IHRoZSBjb2RlIGlzIHRyeWluZyB0byB2ZXJpZnkgaXMgdGhhdCB0aGUgdG9vbHN0
YWNrIGhhcyBub3QKYWxyZWFkeSBSQU0gZm9yIHRoZSBkb21haW4uCgpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpD
YzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cgp2NDoKIC0gUmUtd29ya2VkIHNvIGFzIG5vdCB0byBjb21wbGV0ZWx5IHJlbW92ZSB0aGUgY2hl
Y2sKCnYyOgogLSBOZXcgaW4gdjIKLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgfCAzICstLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCAz
NzE5ZGVhZTc3Li45ZjUxMzcwMzI3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC02OTUsOCArNjk1LDcgQEAgaW50IHAybV9h
bGxvY190YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQogCiAgICAgcDJtX2xvY2socDJtKTsK
IAotICAgIGlmICggcDJtX2lzX2hvc3RwMm0ocDJtKQotICAgICAgICAgJiYgIXBhZ2VfbGlzdF9l
bXB0eSgmZC0+cGFnZV9saXN0KSApCisgICAgaWYgKCBwMm1faXNfaG9zdHAybShwMm0pICYmIGRv
bWFpbl90b3RfcGFnZXMoZCkgKQogICAgIHsKICAgICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxy
ZWFkeSBoYXMgbWVtb3J5IGFsbG9jYXRlZFxuIiwgZC0+ZG9tYWluX2lkKTsKICAgICAgICAgcDJt
X3VubG9jayhwMm0pOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
