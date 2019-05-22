Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E276272FC
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 01:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTacv-0004Ih-GY; Wed, 22 May 2019 23:26:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hTacu-0004Ic-27
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 23:26:28 +0000
X-Inumbo-ID: 04a8cb30-7ce9-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 04a8cb30-7ce9-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 23:26:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3326B20881;
 Wed, 22 May 2019 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558567585;
 bh=wCdM3AvrhUhfJUpVQhYWXALTPt0dXlRc4Yx6aMltnxQ=;
 h=Date:From:To:cc:Subject:From;
 b=cAZP7Bc1ySrquQwX4HblyhPC73702bAiiesb0NNs8Rxs2VojqZV4/p82Llhu8aANJ
 fHFrCDfcrTxWF1wk4yhmUZ8YIV/9zRWA9mXy/IR8yU/Vxlz2lUGVkInZsQabaKNiE1
 /NfZWfaaQqAmh811T36ESGoegvGAFSEXdLRgrt3Y=
Date: Wed, 22 May 2019 16:26:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com
Message-ID: <alpine.DEB.2.21.1905221622190.20440@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/swiotlb: don't initialize swiotlb twice on
 arm64
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
Cc: xen-devel@lists.xenproject.org, Julien.Grall@arm.com,
 sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKT24gYXJtNjQg
c3dpb3RsYiBpcyBhbHJlYWR5IGluaXRpYWxpemVkIGJ5IG1lbV9pbml0LiBXZSBkb24ndCB3YW50
IHRvCmluaXRpYWxpemUgaXQgdHdpY2UsIHRoZSBtZW1vcnkgaXMgYWxyZWFkeSBhbGxvY2F0ZWQu
IERldGVjdCB0aGlzCmNvbmRpdGlvbiBpbiBzd2lvdGxiLXhlbiBhbmQgc2tpcCB0aGUgc2Vjb25k
IGluaXRpYWxpemF0aW9uLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vc0B4aWxpbnguY29tPgoKLS0tCgpUaGVyZSBhcmUgb3RoZXIgaXNzdWVzIHdoaWNoIEkgZm91
bmQgcmVjZW50bHkgYWZmZWN0aW5nIHRoZSBzd2lvdGxiIG9uCmFybTY0IC0tIEknbGwgc2VuZCB0
aGUgb3RoZXIgcGF0Y2hlcyBzZXBhcmF0ZWx5LgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3
aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCmluZGV4IDg3N2JhZjIuLjhm
Y2RhMmJmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9kcml2
ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC0yMDYsNiArMjA2LDcgQEAgaW50IF9fcmVmIHhlbl9z
d2lvdGxiX2luaXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCiAJaW50IHJjID0gLUVOT01FTTsK
IAllbnVtIHhlbl9zd2lvdGxiX2VyciBtX3JldCA9IFhFTl9TV0lPVExCX1VOS05PV047CiAJdW5z
aWduZWQgaW50IHJlcGVhdCA9IDM7CisJYm9vbCBwcmVfaW5pdGlhbGl6ZWQgPSBmYWxzZTsKIAog
CXhlbl9pb190bGJfbnNsYWJzID0gc3dpb3RsYl9ucl90YmwoKTsKIHJldHJ5OgpAQCAtMjE0LDcg
KzIxNSwxMCBAQCBpbnQgX19yZWYgeGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBl
YXJseSkKIAkvKgogCSAqIEdldCBJTyBUTEIgbWVtb3J5IGZyb20gYW55IGxvY2F0aW9uLgogCSAq
LwotCWlmIChlYXJseSkgeworCWlmIChpb190bGJfc3RhcnQgIT0gMCkgeworCQl4ZW5faW9fdGxi
X3N0YXJ0ID0gcGh5c190b192aXJ0KGlvX3RsYl9zdGFydCk7CisJCXByZV9pbml0aWFsaXplZCA9
IHRydWU7CisJfSBlbHNlIGlmIChlYXJseSkgewogCQl4ZW5faW9fdGxiX3N0YXJ0ID0gbWVtYmxv
Y2tfYWxsb2MoUEFHRV9BTElHTihieXRlcyksCiAJCQkJCQkgIFBBR0VfU0laRSk7CiAJCWlmICgh
eGVuX2lvX3RsYl9zdGFydCkKQEAgLTI2NCw3ICsyNjgsNyBAQCBpbnQgX19yZWYgeGVuX3N3aW90
bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBlYXJseSkKIAkJCSB2ZXJib3NlKSkKIAkJCXBhbmlj
KCJDYW5ub3QgYWxsb2NhdGUgU1dJT1RMQiBidWZmZXIiKTsKIAkJcmMgPSAwOwotCX0gZWxzZQor
CX0gZWxzZSBpZiAoIXByZV9pbml0aWFsaXplZCkKIAkJcmMgPSBzd2lvdGxiX2xhdGVfaW5pdF93
aXRoX3RibCh4ZW5faW9fdGxiX3N0YXJ0LCB4ZW5faW9fdGxiX25zbGFicyk7CiAKIAlpZiAoIXJj
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
