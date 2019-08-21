Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1F97089
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 05:55:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0HgY-0007XJ-7c; Wed, 21 Aug 2019 03:53:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0HgW-0007X7-4G
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 03:53:20 +0000
X-Inumbo-ID: 36123bba-c3c7-11e9-ac23-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36123bba-c3c7-11e9-ac23-bc764e2007e4;
 Wed, 21 Aug 2019 03:53:19 +0000 (UTC)
Received: from localhost.localdomain (c-67-164-102-47.hsd1.ca.comcast.net
 [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C44552332B;
 Wed, 21 Aug 2019 03:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566359598;
 bh=SNGQV1FRvvnk1EbxM0rXZvy7bRJiTL03suL/GJScJ0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmPmx8yw3Vzss0+vBBhVqr1czSpPbcwZquoS2Fm25YcMiCCHgp5Zlx0M8BnOoG4w4
 bkAQkSV4NKMpJsMfn/B62cBD/n6iwSSxY+K5W2V/IldPPHJNwY/yNFPFznjN1N14zD
 1BCXr8sxZnl7DJDO4GkHf7pmPxuIZ+6a+ZoKHeCM=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Tue, 20 Aug 2019 20:53:09 -0700
Message-Id: <20190821035315.12812-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 2/8] xen/arm: export device_tree_get_reg and
 device_tree_get_u32
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 andrii_anisov@epam.com, Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSdsbCBiZSB1c2VkIGluIGxhdGVyIHBhdGNoZXMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBu
ZXcgcGF0Y2gKLS0tCiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICB8IDggKysrKy0tLS0K
IHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgNiArKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwppbmRleCA4OTFiNGI2NmZm
Li40Yjc4OThiZTEzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCisrKyBiL3hl
bi9hcmNoL2FybS9ib290ZmR0LmMKQEAgLTU1LDE1ICs1NSwxNSBAQCBzdGF0aWMgYm9vbCBfX2lu
aXQgZGV2aWNlX3RyZWVfbm9kZV9jb21wYXRpYmxlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUs
CiAgICAgcmV0dXJuIGZhbHNlOwogfQogCi1zdGF0aWMgdm9pZCBfX2luaXQgZGV2aWNlX3RyZWVf
Z2V0X3JlZyhjb25zdCBfX2JlMzIgKipjZWxsLCB1MzIgYWRkcmVzc19jZWxscywKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBzaXplX2NlbGxzLCB1NjQgKnN0YXJ0
LCB1NjQgKnNpemUpCit2b2lkIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0IF9fYmUz
MiAqKmNlbGwsIHUzMiBhZGRyZXNzX2NlbGxzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1MzIgc2l6ZV9jZWxscywgdTY0ICpzdGFydCwgdTY0ICpzaXplKQogewogICAgICpzdGFy
dCA9IGR0X25leHRfY2VsbChhZGRyZXNzX2NlbGxzLCBjZWxsKTsKICAgICAqc2l6ZSA9IGR0X25l
eHRfY2VsbChzaXplX2NlbGxzLCBjZWxsKTsKIH0KIAotc3RhdGljIHUzMiBfX2luaXQgZGV2aWNl
X3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIHUzMiBkZmx0KQor
dTMyIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCB1
MzIgZGZsdCkKIHsKICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOwogCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCBiL3hlbi9pbmNsdWRlL3hlbi9k
ZXZpY2VfdHJlZS5oCmluZGV4IDgzMTU2Mjk3ZTIuLjQ1MTBkOWI1ODAgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2Vf
dHJlZS5oCkBAIC0xNjIsNiArMTYyLDEyIEBAIGludCBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2Rl
KGNvbnN0IHZvaWQgKmZkdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
ZXZpY2VfdHJlZV9ub2RlX2Z1bmMgZnVuYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICpkYXRhKTsKIAordm9pZCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0IF9f
YmUzMiAqKmNlbGwsIHUzMiBhZGRyZXNzX2NlbGxzLAorICAgICAgICAgICAgICAgICAgICAgICAg
IHUzMiBzaXplX2NlbGxzLCB1NjQgKnN0YXJ0LCB1NjQgKnNpemUpOworCit1MzIgZGV2aWNlX3Ry
ZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAorICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCB1MzIgZGZsdCk7CisKIC8qKgogICogZHRfdW5m
bGF0dGVuX2hvc3RfZGV2aWNlX3RyZWUgLSBVbmZsYXR0ZW4gdGhlIGhvc3QgZGV2aWNlIHRyZWUK
ICAqCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
