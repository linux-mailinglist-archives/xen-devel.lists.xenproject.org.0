Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D177C9059
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFivn-0005HD-97; Wed, 02 Oct 2019 18:00:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFivl-0005H3-2W
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:00:53 +0000
X-Inumbo-ID: 92a8edae-e53e-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 92a8edae-e53e-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 18:00:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CDBE1000;
 Wed,  2 Oct 2019 11:00:52 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 213EE3F706;
 Wed,  2 Oct 2019 11:00:51 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:41 +0100
Message-Id: <20191002180047.17144-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 0/6] xen/arm: Add support to build with
 clang
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
Cc: Artem_Mygaiev@epam.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKQWZ0ZXIgdGhpcyBzZXJpZXMsIEkgYW0gYWJsZSB0byBidWlsZCBYZW4gb24gQXJt
NjQgd2l0aCBjbGFuZyA3LjAuIFRoZXJlCmFyZSBzdGlsbCBzb21lIGlzc3VlcyB3aGVuIGJ1aWxk
aW5nIFhlbiBvbiBBcm0zMiBhbmQgYWxzbyB1c2luZyBsbGQuCgpDcm9zcy1jb21waWxhdGlvbiBp
cyBsZWZ0IG91dHNpZGUgZm9yIG5vdywgYnV0IHRoaXMgaXMgc3RpbGwgYSBnb29kIHN0YXJ0CmZv
ciBjbGFuZyAoYW5kIGFybWNsYW5nKS4KCkNoZWVycywKCkp1bGllbiBHcmFsbCAoNik6CiAgeGVu
L2FybTogZml4IGdldF9jcHVfaW5mbygpIHdoZW4gYnVpbHQgd2l0aCBjbGFuZwogIHhlbi9hcm02
NDogYml0b3BzOiBNYXRjaCB0aGUgcmVnaXN0ZXIgc2l6ZSB3aXRoIHRoZSB2YWx1ZSBzaXplIGlu
IGZsc2wKICB4ZW4vYXJtOiBjcHVlcnJhdGE6IE1hdGNoIHJlZ2lzdGVyIHNpemUgd2l0aCB2YWx1
ZSBzaXplIGluCiAgICBjaGVja193b3JrYXJvdW5kXyoKICB4ZW4vYXJtOiBjcHVmZWF0dXJlOiBN
YXRjaCByZWdpc3RlciBzaXplIHdpdGggdmFsdWUgc2l6ZSBpbgogICAgY3B1c19oYXZlX2NvbnN0
X2NhcAogIHhlbi9hcm06IG1tOiBNYXJrIGNoZWNrX21lbW9yeV9sYXlvdXRfYWxpZ25tZW50X2Nv
bnN0cmFpbnRzIGFzIHVudXNlZAogIHhlbi9hcm06IHRyYXBzOiBNYXJrIGNoZWNrX3N0YWNrX2Fs
aWdubWVudF9jb25zdHJhaW50cyBhcyB1bnVzZWQKCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAg
ICAgICAgICAgIHwgIDMgKystCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgICAgICAgIHwg
IDMgKystCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oIHwgIDMgKystCiB4ZW4v
aW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oICAgIHwgIDQgKystLQogeGVuL2luY2x1ZGUvYXNt
LWFybS9jcHVmZWF0dXJlLmggICB8ICA0ICsrLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vY3VycmVu
dC5oICAgICAgfCAxMCArKysrKysrKystCiA2IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
