Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946E180579
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:51:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBj0i-0008S1-Cb; Tue, 10 Mar 2020 17:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YNok=43=xen.org=prvs=33108a8dd=paul@srs-us1.protection.inumbo.net>)
 id 1jBj0g-0008RY-SB
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:49:42 +0000
X-Inumbo-ID: 859d9eac-62f7-11ea-b34e-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 859d9eac-62f7-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 17:49:42 +0000 (UTC)
IronPort-SDR: Ewdmq+jBdS+B15WwhRCq0Chu8i6osimEdbuOHOpcDSO/vNukae4TpwOO6LnKAVZYY43nDwpNkx
 5g/iMiCHSvhA==
X-IronPort-AV: E=Sophos;i="5.70,537,1574121600"; d="scan'208";a="20628547"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 10 Mar 2020 17:49:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id BD10FA179B; Tue, 10 Mar 2020 17:49:40 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 10 Mar 2020 17:49:28 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 10 Mar 2020 17:49:27 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 10 Mar 2020 17:49:25 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 17:49:15 +0000
Message-ID: <20200310174917.1514-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310174917.1514-1-paul@xen.org>
References: <20200310174917.1514-1-paul@xen.org>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 3/5] x86 / ioreq: use a MEMF_no_refcount
 allocation for server pages...
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
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKLi4uIG5vdyB0aGF0IGl0
IGlzIHNhZmUgdG8gYXNzaWduIHRoZW0uCgpUaGlzIGF2b2lkcyByZWx5aW5nIG9uIGxpYnhsIChv
ciB3aGF0ZXZlciB0b29sc3RhY2sgaXMgaW4gdXNlKSBzZXR0aW5nCm1heF9wYWdlcyB1cCB3aXRo
IHN1ZmZpY2llbnQgJ3Nsb3AnIHRvIGFsbG93IGFsbCBuZWNlc3NhcnkgaW9yZXEgc2VydmVyCnBh
Z2VzIHRvIGJlIGFsbG9jYXRlZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4
ZW4ub3JnPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KCnYyOgogLSBOZXcgaW4gdjIKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMK
aW5kZXggZjhhNWM4MTU0Ni4uNjQ4ZWY5MTM3ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtMzc1LDcgKzM3NSw3
IEBAIHN0YXRpYyBpbnQgaHZtX2FsbG9jX2lvcmVxX21mbihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZl
ciAqcywgYm9vbCBidWYpCiAgICAgICAgIHJldHVybiAwOwogICAgIH0KIAotICAgIHBhZ2UgPSBh
bGxvY19kb21oZWFwX3BhZ2Uocy0+dGFyZ2V0LCAwKTsKKyAgICBwYWdlID0gYWxsb2NfZG9taGVh
cF9wYWdlKHMtPnRhcmdldCwgTUVNRl9ub19yZWZjb3VudCk7CiAKICAgICBpZiAoICFwYWdlICkK
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
