Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25872C1F00
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0R-0006rR-LG; Mon, 30 Sep 2019 10:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0Q-0006r9-Qp
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:14 +0000
X-Inumbo-ID: d5e9f434-e36d-11e9-96cc-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id d5e9f434-e36d-11e9-96cc-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839649; x=1601375649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Mauyqd924PdT/m+H441U/gI5RxdAY067bvDgJxjGF/A=;
 b=U/72sVq/+I7o1MJMffkMtZEiSxZPPlzKzgdhZHjpAi6aphsToanccjZ5
 MX8e172rRcPZp1KUBXf1L2pr+Z0JhoLGTXq3/Af4csmmvRGylpBPcjj2a
 j+AcAS/Rg75sxQgNsqOaI0veix6y56fkciDGklqgy+sHBIOJ7Sx4dmVzK U=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630033"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0A58BA1F92; Mon, 30 Sep 2019 10:34:07 +0000 (UTC)
Received: from EX13D14UEE002.ant.amazon.com (10.43.62.144) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:56 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D14UEE002.ant.amazon.com (10.43.62.144) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:56 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:55 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:00 +0100
Message-ID: <2def1647db2dfdf49b00f462acc32b98358feb9c.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 08/55] x86/mm: make sure there is one exit
 path for modify_xen_mappings
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGhhbmRsZSBkeW5hbWljYWxseSBtYXBwaW5nIC8gdW5tYXBwaW5nIHBhZ2UKdGFibGVzIGluIHRo
ZSBzYWlkIGZ1bmN0aW9uLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTgg
KysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4
Ni9tbS5jCmluZGV4IDA5MTZhYTc0YWUuLjNhNzk5ZTE3ZTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC01NDI1LDYgKzU0MjUsNyBAQCBp
bnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwg
dW5zaWduZWQgaW50IG5mKQogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICB1bnNpZ25lZCBp
bnQgIGk7CiAgICAgdW5zaWduZWQgbG9uZyB2ID0gczsKKyAgICBpbnQgcmMgPSAtRU5PTUVNOwog
CiAgICAgLyogU2V0IG9mIHZhbGlkIFBURSBiaXRzIHdoaWNoIG1heSBiZSBhbHRlcmVkLiAqLwog
I2RlZmluZSBGTEFHU19NQVNLIChfUEFHRV9OWHxfUEFHRV9SV3xfUEFHRV9QUkVTRU5UKQpAQCAt
NTQ2OCw3ICs1NDY5LDExIEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcg
cywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAgICAgICAvKiBQQUdF
MUdCOiBzaGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KICAgICAgICAg
ICAgIGwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKICAgICAgICAgICAgIGlmICggIWwydCAp
Ci0gICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAgICAgICB7CisgICAgICAg
ICAgICAgICAgQVNTRVJUKHJjID09IC1FTk9NRU0pOworICAgICAgICAgICAgICAgIGdvdG8gb3V0
OworICAgICAgICAgICAgfQorCiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VU
QUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4oKnBsM2Up
ICsKQEAgLTU1MjUsNyArNTUzMCwxMSBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25l
ZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgICAgICAgICAg
ICAgIC8qIFBTRTogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCB0cnkgYWdhaW4uICovCiAgICAg
ICAgICAgICAgICAgbDF0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogICAgICAgICAgICAgICAg
IGlmICggIWwxdCApCi0gICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAg
ICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgQVNTRVJUKHJjID09IC1FTk9NRU0pOwor
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgICAgICB9CisKICAgICAg
ICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwxX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQog
ICAgICAgICAgICAgICAgICAgICBsMWVfd3JpdGUoJmwxdFtpXSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGwxZV9mcm9tX3BmbihsMmVfZ2V0X3BmbigqcGwyZSkgKyBpLApAQCAtNTY1
OCw3ICs1NjY3LDEwIEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywg
dW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgZmx1c2hfYXJlYShOVUxMLCBG
TFVTSF9UTEJfR0xPQkFMKTsKIAogI3VuZGVmIEZMQUdTX01BU0sKLSAgICByZXR1cm4gMDsKKyAg
ICByYyA9IDA7CisKKyBvdXQ6CisgICAgcmV0dXJuIHJjOwogfQogCiAjdW5kZWYgZmx1c2hfYXJl
YQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
