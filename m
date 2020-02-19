Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138FE164092
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 10:41:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Lo1-000815-H1; Wed, 19 Feb 2020 09:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0CPD=4H=amazon.co.uk=prvs=311145cb7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4Lo0-00080x-EX
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 09:38:08 +0000
X-Inumbo-ID: 88d6df18-52fb-11ea-ade5-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88d6df18-52fb-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582105088; x=1613641088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yg7o8S8w/OaiAsKObTFlQkRRM3fJgBa2l/qu3NlRATY=;
 b=QlK8jNcdgMidc7GJFpQEc6SAsaa2WepXf7mWZMdA7Ow8idzoooXOdhFZ
 TOq/dSX+8rMK8Aror8Iz3c7OfrjfxwmBBX9y1eq76jFZOe/d/dwxAg5WY
 1jOyVGdJuMx8Pwxj3a7tgF2XhuvkD3ESiJdtVNI532lZUc+Nzl1nd+Q/0 E=;
IronPort-SDR: uvzvtUT91hMfbvKOpjkDTYQYwmzu6LZsvaqLYogOb5uWyRZUwuV1JDEmBKrhiebEjeVpSxiJAD
 IghCh5soJN7w==
X-IronPort-AV: E=Sophos;i="5.70,459,1574121600"; d="scan'208";a="17657431"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 19 Feb 2020 09:38:05 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 252F3A311B; Wed, 19 Feb 2020 09:38:01 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 19 Feb 2020 09:38:00 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 19 Feb 2020 09:38:00 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 19 Feb 2020 09:37:57 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 09:37:48 +0000
Message-ID: <20200219093754.2924-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 0/6] xl/libxl: domid allocation/preservation
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
bGlieGwvbGlieGxfZG9tYWluLmMgICAgfCAyMjIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyAgfCAgMTIgKy0KIHRvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggIHwgIDE0ICsrKwogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMu
aWRsICAgfCAgIDEgKwogdG9vbHMveGwveGwuYyAgICAgICAgICAgICAgICAgfCAgMTAgKysKIHRv
b2xzL3hsL3hsLmggICAgICAgICAgICAgICAgIHwgICAyICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxl
LmMgICAgICAgIHwgICA2ICstCiB0b29scy94bC94bF9taWdyYXRlLmMgICAgICAgICB8ICAxNSAr
Ky0KIHRvb2xzL3hsL3hsX3NhdmVyZXN0b3JlLmMgICAgIHwgIDE5ICsrLQogdG9vbHMveGwveGxf
dm1jb250cm9sLmMgICAgICAgfCAgIDMgKwogeGVuL2luY2x1ZGUvcHVibGljL3hlbi5oICAgICAg
fCAgIDMgKwogMTcgZmlsZXMgY2hhbmdlZCwgNDM5IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
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
