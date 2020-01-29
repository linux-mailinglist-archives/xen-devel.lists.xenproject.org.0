Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD214C8AA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:19:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkP5-0003md-RB; Wed, 29 Jan 2020 10:16:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwkP4-0003mW-Ef
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:16:58 +0000
X-Inumbo-ID: 7b6f8248-4280-11ea-8869-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b6f8248-4280-11ea-8869-12813bfff9fa;
 Wed, 29 Jan 2020 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580293019; x=1611829019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jWP/Kr2Ts6Val7nfm7XrDb112aC13m4+y12u2fDJXsQ=;
 b=YoVyxukQx+Gc3V9AXVjt1U8kxgjTrSWr7UIBqnJ410M64jiEwY/oIMPE
 2j9geQnpq1HtB0ftsS6jhczDAL0WqaMVNaSJb3/X6e+cYFxVl4zxYPXM8
 VV3P+vut2PJPZyptB003vkJcD6CgFV5IX5FK/KkQEuIyxleFJCih9KSZs Y=;
IronPort-SDR: DTVC7Mo5UqWYR3w9zGvZsN9dNurF0PUxd0oHwp11NkqYaxQJaTWqUfB8+2SZgTxbLGWSwZ2PHk
 ZsQfppxoyDZQ==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="14732781"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 29 Jan 2020 10:16:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4C1CBA24E1; Wed, 29 Jan 2020 10:16:55 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 10:16:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 10:16:54 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 10:16:52 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 10:16:40 +0000
Message-ID: <20200129101643.1394-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129101643.1394-1-pdurrant@amazon.com>
References: <20200129101643.1394-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 1/4] x86 / vmx: move teardown from
 domain_destroy()...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpLgoKVGhlIHRlYXJkb3duIGNvZGUg
ZnJlZXMgdGhlIEFQSUN2IHBhZ2UuIFRoaXMgZG9lcyBub3QgbmVlZCB0byBiZSBkb25lIGxhdGUK
c28gZG8gaXQgaW4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgcmF0aGVyIHRoYW4gZG9t
YWluX2Rlc3Ryb3koKS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KLS0tCkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNj
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KCnY0OgogIC0gTmV3IGluIHY0IChkaXNhZ2dyZWdhdGVkIGZyb20gdjMgcGF0Y2ggIzMp
Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCBiMjYy
ZDM4YTdjLi42MDZmM2RjMmViIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
YworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtNDE5LDcgKzQxOSw3IEBAIHN0
YXRpYyBpbnQgdm14X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpCiAgICAgcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIHZteF9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWlu
ICpkKQorc3RhdGljIHZvaWQgdm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3Qg
ZG9tYWluICpkKQogewogICAgIGlmICggIWhhc192bGFwaWMoZCkgKQogICAgICAgICByZXR1cm47
CkBAIC0yMjQwLDcgKzIyNDAsNyBAQCBzdGF0aWMgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBf
X2luaXRkYXRhIHZteF9mdW5jdGlvbl90YWJsZSA9IHsKICAgICAuY3B1X3VwX3ByZXBhcmUgICAg
ICAgPSB2bXhfY3B1X3VwX3ByZXBhcmUsCiAgICAgLmNwdV9kZWFkICAgICAgICAgICAgID0gdm14
X2NwdV9kZWFkLAogICAgIC5kb21haW5faW5pdGlhbGlzZSAgICA9IHZteF9kb21haW5faW5pdGlh
bGlzZSwKLSAgICAuZG9tYWluX2Rlc3Ryb3kgICAgICAgPSB2bXhfZG9tYWluX2Rlc3Ryb3ksCisg
ICAgLmRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyA9IHZteF9kb21haW5fcmVsaW5xdWlzaF9y
ZXNvdXJjZXMsCiAgICAgLnZjcHVfaW5pdGlhbGlzZSAgICAgID0gdm14X3ZjcHVfaW5pdGlhbGlz
ZSwKICAgICAudmNwdV9kZXN0cm95ICAgICAgICAgPSB2bXhfdmNwdV9kZXN0cm95LAogICAgIC5z
YXZlX2NwdV9jdHh0ICAgICAgICA9IHZteF9zYXZlX3ZtY3NfY3R4dCwKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
