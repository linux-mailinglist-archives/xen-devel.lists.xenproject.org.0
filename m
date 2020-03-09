Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447FD17DC8E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 10:38:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBEpN-0003Fn-LH; Mon, 09 Mar 2020 09:36:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eS/D=42=xen.org=prvs=330d716a0=paul@srs-us1.protection.inumbo.net>)
 id 1jBEpM-0003F7-1f
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 09:36:00 +0000
X-Inumbo-ID: 5f3bd04f-61e9-11ea-abf1-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f3bd04f-61e9-11ea-abf1-12813bfff9fa;
 Mon, 09 Mar 2020 09:35:54 +0000 (UTC)
IronPort-SDR: Tdj9L72BGZN3sk7zP5lB8SlFZwyIcnjXBHW5nuTnZ80anp9c+UzSNvnYEmRfSQns8sa6W8saRp
 Fvtpxq3Jn+MA==
X-IronPort-AV: E=Sophos;i="5.70,532,1574121600"; d="scan'208";a="31423124"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Mar 2020 09:35:54 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 77AE3A18E4; Mon,  9 Mar 2020 09:35:53 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 9 Mar 2020 09:35:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 09:35:21 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 9 Mar 2020 09:35:20 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 09:35:09 +0000
Message-ID: <20200309093511.1727-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309093511.1727-1-paul@xen.org>
References: <20200309093511.1727-1-paul@xen.org>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 4/6] x86 / ioreq: use a MEMF_no_refcount
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
