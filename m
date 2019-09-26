Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D5BEEBA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNM-0003nQ-Ul; Thu, 26 Sep 2019 09:47:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNK-0003mj-Ie
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:47:50 +0000
X-Inumbo-ID: b3c657de-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id b3c657de-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491270; x=1601027270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JByvjWRTQDqIZJNIb36YOya7+MZMs5J4FP69RDCf1ls=;
 b=QXB3ierzAEe9F1JxbjerYBuoSamr3bydVn6vRW/o01umdmlx/Wlg7rF/
 hlUwrMwVJEKwqVv44LMkXKZ8qIsV2WU1+RKMBX8mgJb4adhGmKJw/DiU4
 cBg/BMc8J9a3wfYn2jJFgRSjqMzHUsjJVVGKCyFoWK0miVJUO0pmdejSx k=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788087"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:47:47 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 63283A2455; Thu, 26 Sep 2019 09:47:47 +0000 (UTC)
Received: from EX13D07UWA004.ant.amazon.com (10.43.160.32) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D07UWA004.ant.amazon.com (10.43.160.32) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:15 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:14 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:35 +0100
Message-ID: <db8a30d99ebb21f732aaa8b1bf71ed4228acf3bc.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 12/84] x86/mm: change pl3e to l3t in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
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
