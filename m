Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5215BC1F0C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0b-0006zH-TU; Mon, 30 Sep 2019 10:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0a-0006yh-Qc
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:24 +0000
X-Inumbo-ID: d8f7c5aa-e36d-11e9-96cc-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id d8f7c5aa-e36d-11e9-96cc-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839654; x=1601375654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JByvjWRTQDqIZJNIb36YOya7+MZMs5J4FP69RDCf1ls=;
 b=jRd2fIZp17RmeYFImpr+aO9u7oYrHcK1NOAutUQyEl+QgGL0PCtANve/
 rCRWyaCAIMFVrsquf4QGpeIgu+zU8FDkON3xc3A04qXYtSpsctYUJowDZ
 ah41Rbnc2Gm3EZBrDR44t/KYaffqabgB7x651x3de0VRmRkL4frGq9LlV 4=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630047"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id ABF76A2EC0; Mon, 30 Sep 2019 10:34:12 +0000 (UTC)
Received: from EX13D21UEE002.ant.amazon.com (10.43.62.64) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:00 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D21UEE002.ant.amazon.com (10.43.62.64) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:59 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:59 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:04 +0100
Message-ID: <088da2d07a2e95892b469c88ac66420e53549ca0.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 12/55] x86/mm: change pl3e to l3t in
 virt_to_xen_l3e
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
IGEgdmFyaWFibGUgbmFtZWQgcGwzZSB3aGVuIHdlIHJld3JpdGUKdmlydF90b194ZW5fbDNlLiBD
aGFuZ2UgcGwzZSB0byBsM3QgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuClRoaXMgd2ls
bCBtYWtlIHJldmlld2luZyBsYXRlciBwYXRjaCBlYXNpZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0u
YyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDdhNTIyZDkwZmUuLmY4YThmOTdmODEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00OTA0
LDI1ICs0OTA0LDI1IEBAIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wzZSh1bnNp
Z25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3MoKnBsNGUpICYgX1BBR0VfUFJF
U0VOVCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lT
X1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IGFsbG9jX3hlbl9wYWdl
dGFibGUoKTsKKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBhbGxvY194ZW5fcGFnZXRhYmxl
KCk7CiAKLSAgICAgICAgaWYgKCAhcGwzZSApCisgICAgICAgIGlmICggIWwzdCApCiAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsKICAgICAgICAgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgIHNw
aW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICBpZiAoICEobDRlX2dldF9mbGFncygq
cGw0ZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGw0X3BnZW50
cnlfdCBsNGUgPSBsNGVfZnJvbV9wYWRkcihfX3BhKHBsM2UpLCBfX1BBR0VfSFlQRVJWSVNPUik7
CisgICAgICAgICAgICBsNF9wZ2VudHJ5X3QgbDRlID0gbDRlX2Zyb21fcGFkZHIoX19wYShsM3Qp
LCBfX1BBR0VfSFlQRVJWSVNPUik7CiAKLSAgICAgICAgICAgIGNsZWFyX3BhZ2UocGwzZSk7Cisg
ICAgICAgICAgICBjbGVhcl9wYWdlKGwzdCk7CiAgICAgICAgICAgICBsNGVfd3JpdGUocGw0ZSwg
bDRlKTsKICAgICAgICAgICAgIGVmaV91cGRhdGVfbDRfcGd0YWJsZShsNF90YWJsZV9vZmZzZXQo
diksIGw0ZSk7Ci0gICAgICAgICAgICBwbDNlID0gTlVMTDsKKyAgICAgICAgICAgIGwzdCA9IE5V
TEw7CiAgICAgICAgIH0KICAgICAgICAgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7Ci0gICAgICAgIGlmICggcGwzZSApCi0gICAgICAgICAg
ICBmcmVlX3hlbl9wYWdldGFibGUocGwzZSk7CisgICAgICAgIGlmICggbDN0ICkKKyAgICAgICAg
ICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShsM3QpOwogICAgIH0KIAogICAgIHJldHVybiBsNGVfdG9f
bDNlKCpwbDRlKSArIGwzX3RhYmxlX29mZnNldCh2KTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
