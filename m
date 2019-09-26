Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368EDBFBB0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 01:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDcvP-0004fo-7b; Thu, 26 Sep 2019 23:11:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDcvN-0004fa-To
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 23:11:49 +0000
X-Inumbo-ID: 0485ea02-e0b3-11e9-9665-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 0485ea02-e0b3-11e9-9665-12813bfff9fa;
 Thu, 26 Sep 2019 23:11:49 +0000 (UTC)
Received: from localhost.localdomain (c-67-164-102-47.hsd1.ca.comcast.net
 [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 654C920835;
 Thu, 26 Sep 2019 23:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569539508;
 bh=oioZ80YmDh5BZ2RY3omy5UQgF74fXkxFb7JblL6TNrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qud55tRliVQt25lmcbduGXchlosJDgjke5CC2DWSwglsX8f/0BzLH1VwFWRE03nV2
 oC69oMfGuXf5aFOVijdv5v48BNj7fCcB1LpQ7Zmba3MPz5tWRq9EmmhQtCn6+reJ2e
 iu4XsnekcT9WyCK+dqJu2YejDFbHCNWJAMNUgzpw=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Thu, 26 Sep 2019 16:11:38 -0700
Message-Id: <20190926231144.16297-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v6 2/8] xen/arm: export device_tree_get_reg and
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
IFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCkNoYW5nZXMgaW4gdjU6Ci0gbW92ZSBkZWNsYXJh
dGlvbnMgdG8geGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oCgpDaGFuZ2VzIGluIHY0OgotIG5l
dyBwYXRjaAotLS0KIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICB8IDggKysrKy0tLS0KIHhl
bi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKaW5kZXggNjIzMTczYmM3Zi4uYTc4
MTBhYmIxNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYworKysgYi94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jCkBAIC01NSwxNSArNTUsMTUgQEAgc3RhdGljIGJvb2wgX19pbml0IGRl
dmljZV90cmVlX25vZGVfY29tcGF0aWJsZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogICAg
IHJldHVybiBmYWxzZTsKIH0KIAotc3RhdGljIHZvaWQgX19pbml0IGRldmljZV90cmVlX2dldF9y
ZWcoY29uc3QgX19iZTMyICoqY2VsbCwgdTMyIGFkZHJlc3NfY2VsbHMsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgc2l6ZV9jZWxscywgdTY0ICpzdGFydCwgdTY0
ICpzaXplKQordm9pZCBfX2luaXQgZGV2aWNlX3RyZWVfZ2V0X3JlZyhjb25zdCBfX2JlMzIgKipj
ZWxsLCB1MzIgYWRkcmVzc19jZWxscywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dTMyIHNpemVfY2VsbHMsIHU2NCAqc3RhcnQsIHU2NCAqc2l6ZSkKIHsKICAgICAqc3RhcnQgPSBk
dF9uZXh0X2NlbGwoYWRkcmVzc19jZWxscywgY2VsbCk7CiAgICAgKnNpemUgPSBkdF9uZXh0X2Nl
bGwoc2l6ZV9jZWxscywgY2VsbCk7CiB9CiAKLXN0YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVl
X2dldF91MzIoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCB1MzIgZGZsdCkKK3UzMiBf
X2luaXQgZGV2aWNlX3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnByb3BfbmFtZSwgdTMyIGRm
bHQpCiB7CiAgICAgY29uc3Qgc3RydWN0IGZkdF9wcm9wZXJ0eSAqcHJvcDsKIApkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1
cC5oCmluZGV4IGVmY2JhNTQ1YzIuLmZhMGE4NzIxYjIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vc2V0dXAuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKQEAgLTEx
NSw2ICsxMTUsMTIgQEAgY29uc3QgY2hhciAqYm9vdF9tb2R1bGVfa2luZF9hc19zdHJpbmcoYm9v
dG1vZHVsZV9raW5kIGtpbmQpOwogZXh0ZXJuIHVpbnQzMl90IGh5cF90cmFwc192ZWN0b3JbXTsK
IHZvaWQgaW5pdF90cmFwcyh2b2lkKTsKIAordm9pZCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0
IF9fYmUzMiAqKmNlbGwsIHUzMiBhZGRyZXNzX2NlbGxzLAorICAgICAgICAgICAgICAgICAgICAg
ICAgIHUzMiBzaXplX2NlbGxzLCB1NjQgKnN0YXJ0LCB1NjQgKnNpemUpOworCit1MzIgZGV2aWNl
X3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAorICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCB1MzIgZGZsdCk7CisKICNlbmRpZgogLyoK
ICAqIExvY2FsIHZhcmlhYmxlczoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
