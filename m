Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF8AA135AD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873239.1284220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTm-0004tP-CB; Thu, 16 Jan 2025 08:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873239.1284220; Thu, 16 Jan 2025 08:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTl-0004kw-U5; Thu, 16 Jan 2025 08:43:53 +0000
Received: by outflank-mailman (input) for mailman id 873239;
 Thu, 16 Jan 2025 08:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jK+=UI=casper.srs.infradead.org=BATV+cabf69696ff47aa9dee2+7816+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tYLTj-0004BI-87
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:51 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9e0e15-d3e5-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 09:43:46 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tYLTd-0000000Akbc-0hzA; Thu, 16 Jan 2025 08:43:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYLTc-00000007pIP-3i2w; Thu, 16 Jan 2025 08:43:44 +0000
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
X-Inumbo-ID: ff9e0e15-d3e5-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tjqHi7zeaRi1ZPcfAv+eUnMUtGpd7kq8NDwOvC3nsVk=; b=bSv6dzL1vdg3gqEa+FP0eVjouM
	j1nwqH+kRmJ+mY1u3/gaLep/NqlwSpdMpOcYt1dytUykeQJVgUuDnW4v49K4RgJNc1dx01+0jassk
	JhfKQKY5znnu+hthvlM4rlvAL7lOcloj9F/r3RlWMgiPSzFm/nh/QaAZWfD39v3o2hNz6zOeabUBz
	iOU0OF5os3V/ZMvjShsLmfv83KQ99Fhq7pJ/v1xsw+hZYc7c0qoRIKFqE2/q5yXXsUWMrvUMsP4l4
	VDN+WWnfDRy1TysjP3lpzq4ulph49cnnjXzdy+j4ZY6W56keXvTz9FkFo8EXnhsclB1dGNdfwLaZO
	I9gZjIXw==;
From: David Woodhouse <dwmw2@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PULL 8/8] system/runstate: Fix regression, clarify BQL status of exit notifiers
Date: Thu, 16 Jan 2025 08:43:32 +0000
Message-ID: <20250116084332.1864967-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116084332.1864967-1-dwmw2@infradead.org>
References: <20250116084332.1864967-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: Phil Dennis-Jordan <phil@philjordan.eu>

By changing the way the main QEMU event loop is invoked, I inadvertently
changed the BQL status of exit notifiers: some of them implicitly
assumed they would be called with the BQL held; the BQL is however
not held during the exit(status) call in qemu_default_main().

Instead of attempting to ensuring we always call exit() from the BQL -
including any transitive calls - this change adds a BQL lock guard to
qemu_run_exit_notifiers, ensuring the BQL will always be held in the
exit notifiers.

Additionally, the BQL promise is now documented at the
qemu_{add,remove}_exit_notifier() declarations.

Fixes: f5ab12caba4f ("ui & main loop: Redesign of system-specific main
thread event handling")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2771
Reported-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Tested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/system/system.h | 1 +
 system/runstate.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/system/system.h b/include/system/system.h
index 5364ad4f27..0cbb43ec30 100644
--- a/include/system/system.h
+++ b/include/system/system.h
@@ -15,6 +15,7 @@ extern bool qemu_uuid_set;
 
 const char *qemu_get_vm_name(void);
 
+/* Exit notifiers will run with BQL held. */
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
diff --git a/system/runstate.c b/system/runstate.c
index 3a8fe866bc..272801d307 100644
--- a/system/runstate.c
+++ b/system/runstate.c
@@ -850,6 +850,7 @@ void qemu_remove_exit_notifier(Notifier *notify)
 
 static void qemu_run_exit_notifiers(void)
 {
+    BQL_LOCK_GUARD();
     notifier_list_notify(&exit_notifiers, NULL);
 }
 
-- 
2.47.0


