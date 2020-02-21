Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE79167BED
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 12:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j56Mp-00053V-D8; Fri, 21 Feb 2020 11:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9FNp=4J=amazon.co.uk=prvs=313f46acb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j56Mn-00053O-AW
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 11:21:09 +0000
X-Inumbo-ID: 3f5c9146-549c-11ea-bc8e-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f5c9146-549c-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582284064; x=1613820064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=edx7W9k/e3omvlIGn9o2Y9yHKSx4Qr0UVJaC1GKNb74=;
 b=EQSYplKd1118ZrA4eFv28gwJwNEhN4wZoBVXWPMkmqRD0V2KIx0wWDZQ
 bDYBOPRN1rV4x+gPkNxQeqgJPYhYmuaSlX12gSaGBN1ncmj6IXN//0kyz
 U1NqWa0MFmctU3HEV+4a2hQoviisMX/p0Ml15az+nI/Mc7qfn/FjuRLCa I=;
IronPort-SDR: gQS4aChIQUYQTHPZE4C/jbB1bsvN+bbK2DCGd7DBBkH3rG1zhqFRKYKcSIVLX+BJu66uLNKMpz
 bv0B8NH5fqVQ==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="18290021"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Feb 2020 11:21:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 42EB0243F8C; Fri, 21 Feb 2020 11:20:58 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 11:20:58 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 11:20:56 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 21 Feb 2020 11:20:54 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Feb 2020 11:20:43 +0000
Message-ID: <20200221112049.3077-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v7 0/6] xl/libxl: domid allocation/preservation
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
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICg2KToKICBsaWJ4bDogYWRkIGluZnJhc3RydWN0dXJlIHRvIHRyYWNrIGFu
ZCBxdWVyeSAncmVjZW50JyBkb21pZHMKICBsaWJ4bDogbW9kaWZ5IGxpYnhsX19sb2d2KCkgdG8g
b25seSBsb2cgdmFsaWQgZG9taWQgdmFsdWVzCiAgcHVibGljL3hlbi5oOiBhZGQgYSBkZWZpbml0
aW9uIGZvciBhICd2YWxpZCBkb21pZCcgbWFzawogIGxpYnhsOiBhbGxvdyBjcmVhdGlvbiBvZiBk
b21haW5zIHdpdGggYSBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkCiAgeGwuY29uZjogaW50cm9k
dWNlICdkb21pZF9wb2xpY3knCiAgeGw6IGFsbG93IGRvbWlkIHRvIGJlIHByZXNlcnZlZCBvbiBz
YXZlL3Jlc3RvcmUgb3IgbWlncmF0ZQoKIGRvY3MvbWFuL3hsLjEucG9kLmluICAgICAgICAgIHwg
IDE0ICsrKwogZG9jcy9tYW4veGwuY29uZi41LnBvZCAgICAgICAgfCAgMTAgKysKIHRvb2xzL2V4
YW1wbGVzL3hsLmNvbmYgICAgICAgIHwgICA0ICsKIHRvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9t
MC5jIHwgIDMwICsrKysrCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgICB8ICAxNiArKysK
IHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgIHwgIDc2ICsrKysrKysrKysrLQogdG9vbHMv
bGlieGwvbGlieGxfZG9tYWluLmMgICAgfCAyMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyAgfCAgMTIgKy0KIHRvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggIHwgIDE0ICsrKwogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMu
aWRsICAgfCAgIDEgKwogdG9vbHMveGwveGwuYyAgICAgICAgICAgICAgICAgfCAgMTAgKysKIHRv
b2xzL3hsL3hsLmggICAgICAgICAgICAgICAgIHwgICAyICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxl
LmMgICAgICAgIHwgICA2ICstCiB0b29scy94bC94bF9taWdyYXRlLmMgICAgICAgICB8ICAxNSAr
Ky0KIHRvb2xzL3hsL3hsX3NhdmVyZXN0b3JlLmMgICAgIHwgIDE5ICsrLQogdG9vbHMveGwveGxf
dm1jb250cm9sLmMgICAgICAgfCAgIDMgKwogeGVuL2luY2x1ZGUvcHVibGljL3hlbi5oICAgICAg
fCAgIDMgKwogMTcgZmlsZXMgY2hhbmdlZCwgNDQzIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgpDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
