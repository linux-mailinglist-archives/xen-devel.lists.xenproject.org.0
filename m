Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA357BEEE1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPB-0006oH-DH; Thu, 26 Sep 2019 09:49:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQP9-0006ku-59
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:43 +0000
X-Inumbo-ID: f1597b94-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id f1597b94-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491374; x=1601027374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iM0pBRhHPqSu1d/F9uL8ZRB9EnCqA5i0SQPBpzKDfcA=;
 b=mg4OCw6XPvRdMU/LNsiFEKyriJaVIpWUWNTcMesE60Kw08V+p7A/92Qy
 AZWIbRFB/oXecaebpM9Cn5lg9YrB7fCClwBzTL/x1BlYvJdmHWmGlV0kv
 4XXSk21zZ4zdLqO6Ksdd7yGgwjIIMwmNIXnK7jDOuuGmHsUKiOM78nabd 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637261"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:48:00 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 34C6BA2443; Thu, 26 Sep 2019 09:47:44 +0000 (UTC)
Received: from EX13D18UWA003.ant.amazon.com (10.43.160.238) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA003.ant.amazon.com (10.43.160.238) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:12 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:10 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:33 +0100
Message-ID: <78ad85ad08e14a59d7e6aa59b5aeac0bfa7bf82a.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 10/84] x86/mm: change pl2e to l2t in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
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
