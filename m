Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1937D6FB7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622962.970282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDs-0000j5-I9; Wed, 25 Oct 2023 14:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622962.970282; Wed, 25 Oct 2023 14:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDs-0000eN-EW; Wed, 25 Oct 2023 14:51:04 +0000
Received: by outflank-mailman (input) for mailman id 622962;
 Wed, 25 Oct 2023 14:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfDo-0008W8-Oj
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:03 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9274ceb-7345-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:50:59 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvfDY-009NmZ-68; Wed, 25 Oct 2023 14:50:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDX-002dDz-2J; Wed, 25 Oct 2023 15:50:43 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: e9274ceb-7345-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QOmUYFl3LA5suJXP4FpVRY+eqhPYL8puoFjgeKxcxDM=; b=fW1SfEY/kvSu1hhyw5jhHozZpT
	BGCnYlGkAE2crCuUIrcAsTx0w2hlaPkPVBCLIW1ibbhQ1+XtaPnSzex7Pwu+dAF85JQh7gFQdRjAl
	zIgIUCJax3Hmo7ZWdVrPibJwFgj/48XN7bfTRy7/1VR7fcKk5P2QtSGQCha29pjfT9P6uWKjnwOFz
	CmE1gauXLgd3P/27RuSd02cs3boi2x8wg6syoT/b3j9EG0XA7N7a30s6t9nSsIPX+TLBfmQHyiKh/
	hY1QDNMjspLKxlgPapPDCCTdDer8uGg/doLugfSf7hGpYr7KPoHrgSRFm9u+mz9ajGjS4L8OFHHGA
	ZwVHPHgA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 01/28] i386/xen: Don't advertise XENFEAT_supervisor_mode_kernel
Date: Wed, 25 Oct 2023 15:50:15 +0100
Message-Id: <20231025145042.627381-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This confuses lscpu into thinking it's running in PVH mode.

Fixes: bedcc139248 ("i386/xen: implement HYPERVISOR_xen_version")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 76348f9d5d..0055441b2e 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -267,7 +267,6 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
             fi.submap |= 1 << XENFEAT_writable_page_tables |
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
-                         1 << XENFEAT_supervisor_mode_kernel |
                          1 << XENFEAT_hvm_callback_vector |
                          1 << XENFEAT_hvm_safe_pvclock |
                          1 << XENFEAT_hvm_pirqs;
-- 
2.40.1


