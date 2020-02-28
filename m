Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13A173861
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:31:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fgx-0006UG-1f; Fri, 28 Feb 2020 13:28:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7fgv-0006Tz-QF
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:28:33 +0000
X-Inumbo-ID: 345865b2-5a2e-11ea-9c17-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 345865b2-5a2e-11ea-9c17-bc764e2007e4;
 Fri, 28 Feb 2020 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582896509; x=1614432509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FLFrd5BqWuxEnRZrNNFJx3LfPVqiZQmgQS2zwXc0o+s=;
 b=VkwCIlgT9zJM8ZUkYc5IBNxIKuDWxepOUTCkYMhcfgzp6WbsS+6Pnw/d
 YuUzbdm8AuzUd1RN3WV/Nx+mJ3Q618xLcYgyNQEOMXGd/+G31IstOx28K
 z6CooZmtPeMStcSSt+SOUEaqmAfQ4mwDvQQfCQ6PeX6F5IexGR9JNpqCl U=;
IronPort-SDR: VgJRPltPgwCTLWq6D22IzOdTtCkp1dQ+toI0h13nXaS/3QpcCJoOxWUW0y7CtL77IJeTTIE4X0
 m03iW6Ri7V/w==
X-IronPort-AV: E=Sophos;i="5.70,496,1574121600"; d="scan'208";a="28113527"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 Feb 2020 13:28:28 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 65FA2A2A3C; Fri, 28 Feb 2020 13:28:27 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 13:28:14 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 13:28:13 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 28 Feb 2020 13:28:11 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:27:46 +0000
Message-ID: <20200228132749.2929-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228132749.2929-1-pdurrant@amazon.com>
References: <20200228132749.2929-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 3/6] x86 / pv: do not treat PGC_extra pages as
 RAM when constructing dom0
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

VGhlIHdhbGsgb2YgcGFnZV9saXN0IGluIGRvbTBfY29uc3RydWN0X3B2KCkgc2hvdWxkIGlnbm9y
ZSBQR0NfZXh0cmEgcGFnZXMKYXMgdGhleSBhcmUgb25seSBjcmVhdGVkIGZvciBzcGVjaWFsIHB1
cnBvc2VzIGFuZCwgaWYgbWFwcGVkLCB3aWxsIGJlIG1hcHBlZApleHBsaWNpdGx5IGZvciB3aGF0
ZXZlciBwdXJwb3NlIGlzIHJlbGV2YW50LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCnYyOgogLSBOZXcgaW4gdjIKLS0tCiB4ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5j
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxk
LmMKaW5kZXggZGMxNmVmMmU3OS4uZjhmMWJiZTJmNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCkBAIC03
OTIsNiArNzkyLDEwIEBAIGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFp
biAqZCwKICAgICB7CiAgICAgICAgIG1mbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKICAg
ICAgICAgQlVHX09OKFNIQVJFRF9NMlAoZ2V0X2dwZm5fZnJvbV9tZm4obWZuKSkpOworCisgICAg
ICAgIGlmICggcGFnZS0+Y291bnRfaW5mbyAmIFBHQ19leHRyYSApCisgICAgICAgICAgICBjb250
aW51ZTsKKwogICAgICAgICBpZiAoIGdldF9ncGZuX2Zyb21fbWZuKG1mbikgPj0gY291bnQgKQog
ICAgICAgICB7CiAgICAgICAgICAgICBCVUdfT04oaXNfcHZfMzJiaXRfZG9tYWluKGQpKTsKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
