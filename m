Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E595017A59F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:48:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9ptD-0000Jy-CS; Thu, 05 Mar 2020 12:46:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9ptC-0000JL-5x
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:46:10 +0000
X-Inumbo-ID: 45d35ad0-5edf-11ea-a5ab-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45d35ad0-5edf-11ea-a5ab-12813bfff9fa;
 Thu, 05 Mar 2020 12:46:03 +0000 (UTC)
IronPort-SDR: kmwkjSpi7nyQdAyvgGyGweJWpAMUll9j5zNw65ztZ7f7yXRU+rL4RzNc5VbeZqHpu8s6Kg/ad+
 ER2Wq35AWVyg==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="21158385"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Mar 2020 12:45:51 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id ACBB5141A19; Thu,  5 Mar 2020 12:45:49 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 12:45:25 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 12:45:24 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 12:45:21 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 12:45:02 +0000
Message-ID: <20200305124504.3564-5-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305124504.3564-1-pdurrant@amzn.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 4/6] x86 / ioreq: use a MEMF_no_refcount
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
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
Z2VzIHRvIGJlIGFsbG9jYXRlZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KLS0tCkNjOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKIC0gTmV3IGluIHYy
Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCmluZGV4IGY4YTVjODE1NDYuLjY0
OGVmOTEzN2YgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMKQEAgLTM3NSw3ICszNzUsNyBAQCBzdGF0aWMgaW50IGh2bV9h
bGxvY19pb3JlcV9tZm4oc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMsIGJvb2wgYnVmKQogICAg
ICAgICByZXR1cm4gMDsKICAgICB9CiAKLSAgICBwYWdlID0gYWxsb2NfZG9taGVhcF9wYWdlKHMt
PnRhcmdldCwgMCk7CisgICAgcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShzLT50YXJnZXQsIE1F
TUZfbm9fcmVmY291bnQpOwogCiAgICAgaWYgKCAhcGFnZSApCiAgICAgICAgIHJldHVybiAtRU5P
TUVNOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
