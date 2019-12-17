Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE1122CF9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 14:35:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihCxx-0005tr-Re; Tue, 17 Dec 2019 13:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qn7z=2H=amazon.com=prvs=247c3a56a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihCxw-0005tX-0o
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 13:32:44 +0000
X-Inumbo-ID: b3fab072-20d1-11ea-8ec5-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3fab072-20d1-11ea-8ec5-12813bfff9fa;
 Tue, 17 Dec 2019 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576589564; x=1608125564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xFBgFF359VKnRAXaxtzuRfTSQoaKQ3ji8za7lRotgcg=;
 b=AWR/XfLj2i712Y91SUdGpna+PaCcV2fgUFrz77n+3wHxYVZgORxSlTTq
 eKFZEuSxfdkFN+34LYqz3FzHOv96hk1yScByTOKIZX6xYFTMrnv7Wzcrv
 VtwE1B1lVu3H+vc8ei1mKVDCLcE333vyual2L4/S3uYEbXXpZMq0Kh2DT k=;
IronPort-SDR: 97FMGiWWh4D2HG4sFPz60bCjTRTep23ZDvDxTj7NuVeDDXnY0adm9qcQvFrCAQnLxQcJRhgZia
 6Iqi+PNSLcLg==
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="14007166"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 17 Dec 2019 13:32:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9B9ABA1CFC; Tue, 17 Dec 2019 13:32:29 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 13:32:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 13:32:28 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 17 Dec 2019 13:32:26 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 17 Dec 2019 13:32:18 +0000
Message-ID: <20191217133218.27085-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217133218.27085-1-pdurrant@amazon.com>
References: <20191217133218.27085-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH net-next 3/3] xen-netback: remove
 'hotplug-status' once it has served its purpose
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, "David S. Miller" <davem@davemloft.net>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVtb3ZpbmcgdGhlICdob3RwbHVnLXN0YXR1cycgbm9kZSBpbiBuZXRiYWNrX3JlbW92ZSgpIGlz
IHdyb25nOyB0aGUgc2NyaXB0Cm1heSBub3QgaGF2ZSBjb21wbGV0ZWQuIE9ubHkgcmVtb3ZlIHRo
ZSBub2RlIG9uY2UgdGhlIHdhdGNoIGhhcyBmaXJlZCBhbmQKaGFzIGJlZW4gdW5yZWdpc3RlcmVk
LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0K
Q2M6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4
ZW4ub3JnPgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Ci0tLQog
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay94ZW5idXMuYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jCmlu
ZGV4IDY4MmU1ZTIwOTcxYi4uMTdiNDk1MGVjMDUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMu
YwpAQCAtNjQ4LDYgKzY0OCw3IEBAIHN0YXRpYyB2b2lkIGhvdHBsdWdfc3RhdHVzX2NoYW5nZWQo
c3RydWN0IHhlbmJ1c193YXRjaCAqd2F0Y2gsCiAKIAkJLyogTm90IGludGVyZXN0ZWQgaW4gdGhp
cyB3YXRjaCBhbnltb3JlLiAqLwogCQl1bnJlZ2lzdGVyX2hvdHBsdWdfc3RhdHVzX3dhdGNoKGJl
KTsKKwkJeGVuYnVzX3JtKFhCVF9OSUwsIGJlLT5kZXYtPm5vZGVuYW1lLCAiaG90cGx1Zy1zdGF0
dXMiKTsKIAl9CiAJa2ZyZWUoc3RyKTsKIH0KQEAgLTk1OSw3ICs5NjAsNiBAQCBzdGF0aWMgaW50
IG5ldGJhY2tfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCiAJaWYgKGJlLT52aWYp
IHsKIAkJa29iamVjdF91ZXZlbnQoJmRldi0+ZGV2LmtvYmosIEtPQkpfT0ZGTElORSk7CiAJCXhl
bl91bnJlZ2lzdGVyX3dhdGNoZXJzKGJlLT52aWYpOwotCQl4ZW5idXNfcm0oWEJUX05JTCwgZGV2
LT5ub2RlbmFtZSwgImhvdHBsdWctc3RhdHVzIik7CiAJCXhlbnZpZl9mcmVlKGJlLT52aWYpOwog
CQliZS0+dmlmID0gTlVMTDsKIAl9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
