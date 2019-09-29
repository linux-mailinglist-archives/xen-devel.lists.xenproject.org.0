Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EFC1608
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 17:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEbYo-0002Nl-JS; Sun, 29 Sep 2019 15:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEbYm-0002Ng-Vi
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 15:56:33 +0000
X-Inumbo-ID: b497b310-e2d1-11e9-96b9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b497b310-e2d1-11e9-96b9-12813bfff9fa;
 Sun, 29 Sep 2019 15:56:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8185A1000;
 Sun, 29 Sep 2019 08:56:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9853F706;
 Sun, 29 Sep 2019 08:56:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 29 Sep 2019 16:56:25 +0100
Message-Id: <20190929155627.23493-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] xen/arm: domain_build: Avoid
 implicit conversion from ULL to UL
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgaXMgaGVyZSB0byBhdm9pZCBhbiBpbXBs
aWNpdCBjb252ZXJzaW9uIGZyb20gVUxMIHRvIFVMCndoZW4gYnVpbGRpbmcgd2l0aCBBcm0zMiAo
c2VlIHBhdGNoICMxKS4gVGhpcyBwYXRjaCBpcyBjYW5kaWRhdGUgZm9yIFhlbiA0LjEzLgoKVGhl
IHNlY29uZCBwYXRjaCBpcyBvbmx5IGEgY29kaW5nIHN0eWxlIGZpeC4gU28gY291bGQgYmUgZGVm
ZXJyZWQgdG8gbmV4dC4KCkNoZWVycywKCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgpKdWxpZW4gR3JhbGwgKDIpOgogIHhlbi9hcm06IGRvbWFpbl9idWlsZDogQXZvaWQgaW1w
bGljaXQgY29udmVyc2lvbiBmcm9tIFVMTCB0byBVTAogIHhlbi9hcm06IGRvbWFpbl9idWlsZDog
SW5kZW50IGNvcnJlY3RseSBwYXJhbWV0ZXJzIG9mCiAgICBhbGxvY19iYW5rX21lbW9yeSgpCgog
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
