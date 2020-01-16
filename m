Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9C13D701
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:38:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1ZX-0006cW-Lh; Thu, 16 Jan 2020 09:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TxvK=3F=amazon.co.uk=prvs=27736368b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1is1ZW-0006cP-A0
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:36:14 +0000
X-Inumbo-ID: a32fd2b6-3843-11ea-86d6-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a32fd2b6-3843-11ea-86d6-12813bfff9fa;
 Thu, 16 Jan 2020 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579167375; x=1610703375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=efU3VlGXTVjqmw3jYRrO8kEfGbTZ4DtOzJo7P1wuncg=;
 b=oclJVgTVj+Q0DVdh6rxCCnpLVzWDqal7bTbNRn9lOMjzfoWD/rfDB2Cb
 r7Vjbf3R40h5xsyKavK2HY35OZpdYpNZaCSbetQqp3TA2Hv0/vC+nVCKG
 rOLqvUfJurpvB3rNZjDUzZSKS/RENF2pCJ2jiESAFimqzfTGU4uUV41N8 g=;
IronPort-SDR: u304MDMTBJkqs37GqDamXgVHdVmwgFkPnbfOPLEaQCwuFfscoz6qKc5vanMoYHrEdAJfY9lBUi
 30sYrup0DcSA==
X-IronPort-AV: E=Sophos;i="5.70,325,1574121600"; d="scan'208";a="12699619"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 16 Jan 2020 09:36:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 35CB0A26E2; Thu, 16 Jan 2020 09:36:10 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 16 Jan 2020 09:36:09 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 Jan 2020 09:36:08 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 16 Jan 2020 09:36:05 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 16 Jan 2020 09:35:56 +0000
Message-ID: <20200116093602.4203-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/6] xl/libxl: domid allocation/preservation
 changes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, jandryuk@gmail.com,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgd2FzIHByZXZpb3VzbHkgbmFtZWQgInhsL2xpYnhsOiBhbGxvdyBjcmVhdGlv
biBvZiBkb21haW5zIHdpdGgKYSBzcGVjaWZpZWQgZG9taWQiLgoKUGF1bCBEdXJyYW50ICg2KToK
ICBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YgSU5WQUxJRF9ET01JRCB0byB0aGUgQVBJCiAgbGli
eGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdAogIGxpYnhsOiBhZGQgaW5mcmFz
dHJ1Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZXRpcmVkJyBkb21pZHMKICBsaWJ4bDogYWxs
b3cgY3JlYXRpb24gb2YgZG9tYWlucyB3aXRoIGEgc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZAog
IHhsLmNvbmY6IGludHJvZHVjZSAnZG9taWRfcG9saWN5JwogIHhsOiBhbGxvdyBkb21pZCB0byBi
ZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUKCiBkb2NzL21hbi94bC4xLnBv
ZC5pbiAgICAgICAgIHwgIDE0ICsrKysKIGRvY3MvbWFuL3hsLmNvbmYuNS5wb2QgICAgICAgfCAg
MTAgKysrCiB0b29scy9leGFtcGxlcy94bC5jb25mICAgICAgIHwgICA0ICsrCiB0b29scy9saWJ4
bC9saWJ4bC5oICAgICAgICAgIHwgIDEzICsrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
ICAgfCAgOTQgKysrKysrKysrKysrKysrKysrLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZG0u
YyAgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICB8IDEzMiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuYyB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAxNiArKysrLQog
dG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICB8ICAgMSArCiB0b29scy94bC94bC5jICAgICAg
ICAgICAgICAgIHwgIDEwICsrKwogdG9vbHMveGwveGwuaCAgICAgICAgICAgICAgICB8ICAgMiAr
CiB0b29scy94bC94bF9jbWR0YWJsZS5jICAgICAgIHwgICA2ICstCiB0b29scy94bC94bF9taWdy
YXRlLmMgICAgICAgIHwgIDE1ICsrLS0KIHRvb2xzL3hsL3hsX3NhdmVyZXN0b3JlLmMgICAgfCAg
MTkgKysrLS0KIHRvb2xzL3hsL3hsX3V0aWxzLmggICAgICAgICAgfCAgIDIgLQogdG9vbHMveGwv
eGxfdm1jb250cm9sLmMgICAgICB8ICAgMyArCiB4ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggICAg
IHwgICAzICsKIDE4IGZpbGVzIGNoYW5nZWQsIDMwNCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlv
bnMoLSkKLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpD
YzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQ2M6IGphbmRyeXVrQGdtYWlsLmNvbQpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
