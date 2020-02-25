Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C681C16C0EB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:36:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZPO-0002xp-Cp; Tue, 25 Feb 2020 12:33:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoxS=4N=amazon.co.uk=prvs=317b3ba57=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6ZPM-0002xk-O2
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:33:52 +0000
X-Inumbo-ID: 1434f1fc-57cb-11ea-a490-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1434f1fc-57cb-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582634033; x=1614170033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2zcWvrYUpJNW3wb59B1PDmoQniAYTrqFYhv5/JF0Y6E=;
 b=VfSdu3gw+XC1F8u9WkZ6uGY+/uHAo9KAPvOmtCRBd4Vwxn2U4nj/XjJj
 JbXczrTweL2Xhau7l3X0kREs0NSAimCWcl6j6oBGf5wZ+IGz6csWHc+KU
 tywgRgRTRfdOPl3Vyj7iH9hTwDlnTTrcfFX3360xjyCw2ckc3rkO9VM0u I=;
IronPort-SDR: aUN6gpk2XP8esq21UP6RBh9oQ0DFICJIW4MIMn4zxT16hjSQUinP8bEodJt2Y2p4Teesmmohvz
 ojdagaTUI9jA==
X-IronPort-AV: E=Sophos;i="5.70,484,1574121600"; d="scan'208";a="27333009"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 25 Feb 2020 12:33:50 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A87C1427E6; Tue, 25 Feb 2020 12:33:48 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 25 Feb 2020 12:33:47 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 25 Feb 2020 12:33:46 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 25 Feb 2020 12:33:44 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 25 Feb 2020 12:33:43 +0000
Message-ID: <20200225123343.26619-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] libxl: fix build with older glibc
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDJiMDI4ODJlYmJiYyAibGlieGw6IGFkZCBpbmZyYXN0cnVjdHVyZSB0byB0cmFjayBh
bmQgcXVlcnkKJ3JlY2VudCcgZG9taWRzIiBhZGRlZCBhIGNhbGwgdG8gY2xvY2tfZ2V0dGltZSgp
IGludG8gbGlieGwuIFRoZSBtYW4tCnBhZ2UgZm9yIHRoaXMgc3RhdGVzOgoKIkxpbmsgd2l0aCAt
bHJ0IChvbmx5IGZvciBnbGliYyB2ZXJzaW9ucyBiZWZvcmUgMi4xNykuIgoKVW5mb3J0dW5hdGVs
eSBDZW50b3MgNiBkb2VzIGhhdmUgYW4gZ2xpYmMgcHJpb3IgdG8gdGhhdCB2ZXJzaW9uLCBhbmQg
dGhlCmxpYnhsIE1ha2VmaWxlIHdhcyBub3QgdXBkYXRlZCB0byBhZGQgJy1scnQnIHNvIHRoZSBi
dWlsZCB3aWxsIGZhaWwgaW4KdGhhdCBlbnZpcm9ubWVudC4KClRoaXMgcGF0Y2ggc2ltcGx5IGFk
ZHMgJy1scnQnIHRvIExJQlhMX0xJQlMgdW5jb25kaXRpb25hbGx5LCBhcyBpdCBkb2VzCm5vIGhh
cm0gaW4gbmV3ZXIgZW52aXJvbm1lbnRzLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgpGaXhlczogMmIwMjg4MmViYmJjICgibGlieGw6IGFkZCBpbmZy
YXN0cnVjdHVyZSB0byB0cmFjayBhbmQgcXVlcnkgJ3JlY2VudCcgZG9taWRzIikKLS0tCkNjOiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0t
CiB0b29scy9saWJ4bC9NYWtlZmlsZSB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvTWFrZWZpbGUgYi90b29scy9saWJ4bC9N
YWtlZmlsZQppbmRleCBlZDQxZTRlZTNlLi42OWZjZjIxNTc3IDEwMDY0NAotLS0gYS90b29scy9s
aWJ4bC9NYWtlZmlsZQorKysgYi90b29scy9saWJ4bC9NYWtlZmlsZQpAQCAtMjQsNiArMjQsOSBA
QCBMSUJYTF9MSUJTID0gJChMRExJQlNfbGlieGVudG9vbGxvZykgJChMRExJQlNfbGlieGVuZXZ0
Y2huKSAkKExETElCU19saWJ4ZW5jdHJsKQogaWZlcSAoJChDT05GSUdfTElCTkwpLHkpCiBMSUJY
TF9MSUJTICs9ICQoTElCTkwzX0xJQlMpCiBlbmRpZgoraWZlcSAoJChDT05GSUdfTGludXgpLHkp
CitMSUJYTF9MSUJTICs9IC1scnQKK2VuZGlmCiAKIENGTEFHU19MSUJYTCArPSAkKENGTEFHU19s
aWJ4ZW50b29sbG9nKQogQ0ZMQUdTX0xJQlhMICs9ICQoQ0ZMQUdTX2xpYnhlbnRvb2xjb3JlKQot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
