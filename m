Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E898917DC8F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 10:38:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBEog-000340-21; Mon, 09 Mar 2020 09:35:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eS/D=42=xen.org=prvs=330d716a0=paul@srs-us1.protection.inumbo.net>)
 id 1jBEoe-00033v-DA
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 09:35:16 +0000
X-Inumbo-ID: 47a70e95-61e9-11ea-abf0-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47a70e95-61e9-11ea-abf0-12813bfff9fa;
 Mon, 09 Mar 2020 09:35:15 +0000 (UTC)
IronPort-SDR: 1ErE4cshvXrEbsTFEbKHQM5fFofp+9aw1EEpZ/kDqaYWJqjGmt2UcG5XSBnF/2hR4WQ3ZNDsxS
 h254EAeL5vPg==
X-IronPort-AV: E=Sophos;i="5.70,532,1574121600"; d="scan'208";a="20373415"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 09 Mar 2020 09:35:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com (Postfix) with ESMTPS
 id 504F4A28A0; Mon,  9 Mar 2020 09:35:14 +0000 (UTC)
Received: from EX13D10UEA001.ant.amazon.com (10.43.61.5) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 9 Mar 2020 09:35:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D10UEA001.ant.amazon.com (10.43.61.5) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Mar 2020 09:35:13 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 9 Mar 2020 09:35:13 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 09:35:05 +0000
Message-ID: <20200309093511.1727-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/6] remove one more shared xenheap page:
 shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpQYXVsIER1cnJhbnQgKDYpOgogIGRv
bWFpbjogaW50cm9kdWNlIGFsbG9jL2ZyZWVfc2hhcmVkX2luZm8oKSBoZWxwZXJzLi4uCiAgeDg2
IC8gcDJtOiByZW1vdmUgcGFnZV9saXN0IGNoZWNrIGluIHAybV9hbGxvY190YWJsZS4uLgogIHg4
NiAvIHB2OiBkbyBub3QgdHJlYXQgUEdDX2V4dHJhIHBhZ2VzIGFzIFJBTQogIHg4NiAvIGlvcmVx
OiB1c2UgYSBNRU1GX25vX3JlZmNvdW50IGFsbG9jYXRpb24gZm9yIHNlcnZlciBwYWdlcy4uLgog
IG1tOiBhZGQgJ2lzX3NwZWNpYWxfcGFnZScgaW5saW5lIGZ1bmN0aW9uLi4uCiAgZG9tYWluOiB1
c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZSBmb3Igc2hhcmVkX2luZm8KCiB4ZW4vYXJjaC9hcm0v
ZG9tYWluLmMgICAgICAgICAgIHwgMTAgKysrLS0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAg
ICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgIHwgMTggKysr
KysrKy0tLS0tLQogeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICAgICB8ICAyICstCiB4ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS5jICAg
ICAgICAgICAgICAgfCAxMSArKysrLS0tLQogeGVuL2FyY2gveDg2L21tL2FsdHAybS5jICAgICAg
ICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyAgIHwgIDMgKy0tCiB4ZW4v
YXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgIHwgIDYgKysrLS0KIHhlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvY29tbW9uLmMgfCAxMyArKysrKystLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L211
bHRpLmMgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9udW1hLmMgICAgICAgICAgICAgfCAgMyArKysK
IHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgICAgfCAgNiArKysrLQogeGVuL2FyY2gveDg2
L3B2L3NoaW0uYyAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvdGJvb3QuYyAgICAgICAg
ICAgIHwgMTEgKysrKystLS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgfCA0NiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9jb21tb24vZG9tY3RsLmMgICAg
ICAgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMgICAgICB8ICAzICsr
KwogeGVuL2NvbW1vbi90aW1lLmMgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKy0tCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3NoYXJlZC5oICAgIHwgMTUgKysrKysrLS0tLS0KIHhlbi9pbmNs
dWRlL3hlbi9kb21haW4uaCAgICAgICAgfCAgMyArKysKIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAg
ICAgICAgICAgfCAgNSArKysrCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgIHwgIDUg
KysrLQogeGVuL2luY2x1ZGUveGVuL3NoYXJlZC5oICAgICAgICB8ICAyICstCiAyNCBmaWxlcyBj
aGFuZ2VkLCAxNDIgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
