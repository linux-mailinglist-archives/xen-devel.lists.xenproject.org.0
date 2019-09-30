Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B59C1F0F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0X-0006vG-0R; Mon, 30 Sep 2019 10:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0V-0006ul-R0
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:19 +0000
X-Inumbo-ID: d7cb3be5-e36d-11e9-96cc-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id d7cb3be5-e36d-11e9-96cc-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839653; x=1601375653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iM0pBRhHPqSu1d/F9uL8ZRB9EnCqA5i0SQPBpzKDfcA=;
 b=rYSqiBGXdtQeBzxytnV+xRkTxTlg+aq8Otgyb+GmELGZnRMGGFVdr1Wj
 nB6QjnfFbR09aSExQW2PwZsLYsXLqNfuaK690pn7VkmNuZHsD4DuRlNMI
 b2TLsNoFfSMI1mzJW+o+1KdJGJHeazjlVKG0pNGjLcNUGPhJ8ftKkud6j c=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="788414632"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 30 Sep 2019 10:34:11 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5D85DA28C2; Mon, 30 Sep 2019 10:34:10 +0000 (UTC)
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:58 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:58 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:57 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:02 +0100
Message-ID: <61e6298a7016d793bb103e01fb309148d737376b.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 10/55] x86/mm: change pl2e to l2t in
 virt_to_xen_l2e
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgbmVlZCB0byBoYXZl
IGEgdmFyaWFibGUgbmFtZWQgcGwyZSB3aGVuIHdlIHJld3JpdGUKdmlydF90b194ZW5fbDJlLiBD
aGFuZ2UgcGwyZSB0byBsMnQgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuClRoaXMgd2ls
bCBtYWtlIHJldmlld2luZyBsYXRlciBwYXRjaCBlYXNpZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0u
YyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGIyMGQ0MTdmZWMuLmVhNjkzMWUwNTIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00OTM5
LDIyICs0OTM5LDIyIEBAIHN0YXRpYyBsMl9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wyZSh1bnNp
Z25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJF
U0VOVCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lT
X1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IGFsbG9jX3hlbl9wYWdl
dGFibGUoKTsKKyAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxl
KCk7CiAKLSAgICAgICAgaWYgKCAhcGwyZSApCisgICAgICAgIGlmICggIWwydCApCiAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsKICAgICAgICAgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgIHNw
aW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICBpZiAoICEobDNlX2dldF9mbGFncygq
cGwzZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGNsZWFyX3Bh
Z2UocGwyZSk7Ci0gICAgICAgICAgICBsM2Vfd3JpdGUocGwzZSwgbDNlX2Zyb21fcGFkZHIoX19w
YShwbDJlKSwgX19QQUdFX0hZUEVSVklTT1IpKTsKLSAgICAgICAgICAgIHBsMmUgPSBOVUxMOwor
ICAgICAgICAgICAgY2xlYXJfcGFnZShsMnQpOworICAgICAgICAgICAgbDNlX3dyaXRlKHBsM2Us
IGwzZV9mcm9tX3BhZGRyKF9fcGEobDJ0KSwgX19QQUdFX0hZUEVSVklTT1IpKTsKKyAgICAgICAg
ICAgIGwydCA9IE5VTEw7CiAgICAgICAgIH0KICAgICAgICAgaWYgKCBsb2NraW5nICkKICAgICAg
ICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7Ci0gICAgICAgIGlmICggcGwyZSAp
Ci0gICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUocGwyZSk7CisgICAgICAgIGlmICggbDJ0
ICkKKyAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShsMnQpOwogICAgIH0KIAogICAgIEJV
R19PTihsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BTRSk7Ci0tIAoyLjE3LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
