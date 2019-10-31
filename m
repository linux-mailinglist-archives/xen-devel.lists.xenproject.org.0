Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86EEB39C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5J-0006h5-EZ; Thu, 31 Oct 2019 15:10:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5H-0006fZ-CW
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:09:59 +0000
X-Inumbo-ID: 7cf7f202-fbf0-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7cf7f202-fbf0-11e9-bbab-bc764e2007e4;
 Thu, 31 Oct 2019 15:09:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9C107B9;
 Thu, 31 Oct 2019 08:09:51 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D204D3F71E;
 Thu, 31 Oct 2019 08:09:50 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:18 +0000
Message-Id: <20191031150922.22938-16-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 15/19] xen/arm: Allow insn.h to be
 called from assembly
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCByZXF1aXJlIHRvIGluY2x1ZGUgaW5zbi5oIGZyb20gYXNz
ZW1ibHkgY29kZS4gU28Kd2UgbmVlZCB0byBwcm90ZWN0IGFueSBDLXNwZWNpZmljIGRlZmluaXRp
b24gdG8gYXZvaWQgY29tcGlsYXRpb24KZXJyb3JzIHdoZW4gdXNlZCBpbiBhc3NlbWJseSBjb2Rl
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0t
LQoKICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5
CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEZpeCB0eXBvCiAgICAgICAgLSBSZW1vdmUg
aW4tY29kZSBjb21tZW50Ci0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9pbnNuLmggfCA0ICsrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL2luc24uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCmluZGV4IDE5Mjc3
MjEyZTEuLjI3MjcxZTk1ZjkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCkBAIC0xLDYgKzEsOCBAQAogI2lmbmRl
ZiBfX0FSQ0hfQVJNX0lOU04KICNkZWZpbmUgX19BUkNIX0FSTV9JTlNOCiAKKyNpZm5kZWYgX19B
U1NFTUJMWV9fCisKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KIAogI2lmIGRlZmluZWQoQ09ORklH
X0FSTV82NCkKQEAgLTExLDYgKzEzLDggQEAKICMgZXJyb3IgInVua25vd24gQVJNIHZhcmlhbnQi
CiAjZW5kaWYKIAorI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLworCiAvKiBPbiBBUk0zMiw2NCBp
bnN0cnVjdGlvbnMgYXJlIGFsd2F5cyA0IGJ5dGVzIGxvbmcuICovCiAjZGVmaW5lIEFSQ0hfUEFU
Q0hfSU5TTl9TSVpFIDQKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
