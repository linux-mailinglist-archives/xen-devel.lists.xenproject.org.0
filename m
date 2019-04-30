Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0110159
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 23:05:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLZu1-0007hs-Lp; Tue, 30 Apr 2019 21:03:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLZtz-0007fc-Fr
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 21:02:59 +0000
X-Inumbo-ID: 54f87a72-6b8b-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54f87a72-6b8b-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 21:02:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4EB5217D7;
 Tue, 30 Apr 2019 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556658178;
 bh=Ck4HAdpRo/MJVybB0NXOKUYB51jhM+Sseutc5JUzyu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ce13DguK4B/HWhRk2ucZWpdLgiwx1EQXfNCL0ytZuDo2p7JptkdxgPhNZx3QVEw8a
 NLU4iOJU1U7AACVHgYLtmdRzXKZm2F54XUb9QM8JUoXbHR2vM1EdwmUJ7BH5gaejin
 gpcuDC9zJCW7DRqRtyrXnuSMqLZq6xjtAW1aME14=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Apr 2019 14:02:49 -0700
Message-Id: <1556658172-8824-7-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH v2 07/10] xen/arm: make process_memory_node a
 device_tree_node_func
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlIHRoZSBzaWduYXR1cmUgb2YgcHJvY2Vzc19tZW1vcnlfbm9kZSB0byBtYXRjaApkZXZp
Y2VfdHJlZV9ub2RlX2Z1bmMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0
ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIG5ldwotLS0KIHhlbi9hcmNo
L2FybS9ib290ZmR0LmMgfCAxNiArKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
Ym9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwppbmRleCBlN2IwOGVkLi5iNjYwMGFi
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCisrKyBiL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKQEAgLTEyNCw5ICsxMjQsMTAgQEAgaW50IF9faW5pdCBkZXZpY2VfdHJlZV9mb3Jf
ZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKICAgICByZXR1cm4gMDsKIH0KIAotc3RhdGljIHZv
aWQgX19pbml0IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxs
cywgdTMyIHNpemVfY2VsbHMpCitzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNzX21lbW9yeV9ub2Rl
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGludCBkZXB0aCwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3NfY2VsbHMsIHUzMiBzaXplX2NlbGxzLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQogewogICAg
IGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnByb3A7CiAgICAgaW50IGk7CkBAIC0xMzksMTQg
KzE0MCwxNCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2
b2lkICpmZHQsIGludCBub2RlLAogICAgIHsKICAgICAgICAgcHJpbnRrKCJmZHQ6IG5vZGUgYCVz
JzogaW52YWxpZCAjYWRkcmVzcy1jZWxscyBvciAjc2l6ZS1jZWxscyIsCiAgICAgICAgICAgICAg
ICBuYW1lKTsKLSAgICAgICAgcmV0dXJuOworICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKICAg
ICBwcm9wID0gZmR0X2dldF9wcm9wZXJ0eShmZHQsIG5vZGUsICJyZWciLCBOVUxMKTsKICAgICBp
ZiAoICFwcm9wICkKICAgICB7CiAgICAgICAgIHByaW50aygiZmR0OiBub2RlIGAlcyc6IG1pc3Np
bmcgYHJlZycgcHJvcGVydHlcbiIsIG5hbWUpOwotICAgICAgICByZXR1cm47CisgICAgICAgIHJl
dHVybiAwOwogICAgIH0KIAogICAgIGNlbGwgPSAoY29uc3QgX19iZTMyICopcHJvcC0+ZGF0YTsK
QEAgLTE2MSw2ICsxNjIsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9k
ZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogICAgICAgICBib290aW5mby5tZW0uYmFua1ti
b290aW5mby5tZW0ubnJfYmFua3NdLnNpemUgPSBzaXplOwogICAgICAgICBib290aW5mby5tZW0u
bnJfYmFua3MrKzsKICAgICB9CisKKyAgICByZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQgX19p
bml0IHByb2Nlc3NfbXVsdGlib290X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKQEAg
LTI5Myw3ICsyOTYsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qg
dm9pZCAqZmR0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEp
CiB7CiAgICAgaWYgKCBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLCAibWVtb3J5
IikgKQotICAgICAgICBwcm9jZXNzX21lbW9yeV9ub2RlKGZkdCwgbm9kZSwgbmFtZSwgYWRkcmVz
c19jZWxscywgc2l6ZV9jZWxscyk7CisgICAgICAgIHByb2Nlc3NfbWVtb3J5X25vZGUoZmR0LCBu
b2RlLCBuYW1lLCBkZXB0aCwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscywKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBOVUxMKTsKICAgICBlbHNlIGlmICggZGVwdGggPD0gMyAmJiAoZGV2
aWNlX3RyZWVfbm9kZV9jb21wYXRpYmxlKGZkdCwgbm9kZSwgInhlbixtdWx0aWJvb3QtbW9kdWxl
IiApIHx8CiAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfY29tcGF0aWJsZShmZHQsIG5v
ZGUsICJtdWx0aWJvb3QsbW9kdWxlIiApKSkKICAgICAgICAgcHJvY2Vzc19tdWx0aWJvb3Rfbm9k
ZShmZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMpOwotLSAKMS45LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
