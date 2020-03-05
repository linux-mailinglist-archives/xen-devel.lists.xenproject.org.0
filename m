Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84CA17A59D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:48:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9pst-00008w-TN; Thu, 05 Mar 2020 12:45:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9pss-00008X-6D
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:45:50 +0000
X-Inumbo-ID: 3c4fe123-5edf-11ea-a5ab-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c4fe123-5edf-11ea-a5ab-12813bfff9fa;
 Thu, 05 Mar 2020 12:45:49 +0000 (UTC)
IronPort-SDR: zZOrVuJ/CmK1rDTTlmHwh+HBGTzlQ96vPhhgWufdMoyMeDFDehlybuI+0jQIgveS4w4SVQXi9+
 dBAtExKMG/sw==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="20189940"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Mar 2020 12:45:48 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 33ABBA285B; Thu,  5 Mar 2020 12:45:47 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 12:45:22 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 12:45:21 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 12:45:18 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 12:45:01 +0000
Message-ID: <20200305124504.3564-4-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305124504.3564-1-pdurrant@amzn.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra pages
 as RAM when constructing dom0
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

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKVGhlIHdhbGsgb2YgcGFn
ZV9saXN0IGluIGRvbTBfY29uc3RydWN0X3B2KCkgc2hvdWxkIGlnbm9yZSBQR0NfZXh0cmEgcGFn
ZXMKYXMgdGhleSBhcmUgb25seSBjcmVhdGVkIGZvciBzcGVjaWFsIHB1cnBvc2VzIGFuZCwgaWYg
bWFwcGVkLCB3aWxsIGJlIG1hcHBlZApleHBsaWNpdGx5IGZvciB3aGF0ZXZlciBwdXJwb3NlIGlz
IHJlbGV2YW50LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCnYyOgogLSBO
ZXcgaW4gdjIKLS0tCiB4ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2
L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggZGMxNmVm
MmU3OS4uZjhmMWJiZTJmNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQu
YworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCkBAIC03OTIsNiArNzkyLDEwIEBA
IGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwKICAgICB7CiAg
ICAgICAgIG1mbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKICAgICAgICAgQlVHX09OKFNI
QVJFRF9NMlAoZ2V0X2dwZm5fZnJvbV9tZm4obWZuKSkpOworCisgICAgICAgIGlmICggcGFnZS0+
Y291bnRfaW5mbyAmIFBHQ19leHRyYSApCisgICAgICAgICAgICBjb250aW51ZTsKKwogICAgICAg
ICBpZiAoIGdldF9ncGZuX2Zyb21fbWZuKG1mbikgPj0gY291bnQgKQogICAgICAgICB7CiAgICAg
ICAgICAgICBCVUdfT04oaXNfcHZfMzJiaXRfZG9tYWluKGQpKTsKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
