Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827C2E2682
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 12:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58700.103400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBh-0002Wd-Ah; Thu, 24 Dec 2020 11:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58700.103400; Thu, 24 Dec 2020 11:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBh-0002WH-7d; Thu, 24 Dec 2020 11:53:45 +0000
Received: by outflank-mailman (input) for mailman id 58700;
 Thu, 24 Dec 2020 11:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kri=F4=merlin.srs.infradead.org=batv+2cb6e212460c613e05ba+6332+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ksPBf-0002WC-Du
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 11:53:44 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 186c498a-2b40-4594-ae2b-41b1da3537ec;
 Thu, 24 Dec 2020 11:53:39 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPBO-0002b0-ID; Thu, 24 Dec 2020 11:53:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ksPBN-00Er3p-Gl; Thu, 24 Dec 2020 11:53:25 +0000
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
X-Inumbo-ID: 186c498a-2b40-4594-ae2b-41b1da3537ec
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=O3AtkiW5GTt6yxuiaTLnSJ1UIhL9jkFSRWxqdPyBQOk=; b=sWR9MZNWda/BBmFcp64YqtZ00E
	4V4+DwxHPnL8bLzOe6a3GelxX58UVJamvHqE4ViZl592hb49tYRUtDHGLmC0PWs4U8KE1lF5tcD5c
	GaIDIwo+VVocX3BnTEyDrDW/VTvbKOTNpdixlLNYcphIxUag+PhA7rk9gR5ZAsSSHi7/WorD358J5
	o3Thps3ZSEYhqopE+5aikVYvbBKDnWz0Q0amjd8fKrveC2GXrKIzPEsDsVfDvxpWQ4soIAdp2M2oP
	GXKiQ7WScUa7BXhYpA5ve8mXjGmNeNdN+LL3DFvuKPeVAyDGUywsFpW520hofBBpmIjpIM36JyQdX
	wVXk806Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/5] x86/xen: Add a no_vector_callback option to test PCI INTX delivery
Date: Thu, 24 Dec 2020 11:53:21 +0000
Message-Id: <20201224115323.3540130-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224115323.3540130-1-dwmw2@infradead.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

It's useful to be able to test non-vector event channel delivery, to make
sure Linux will work properly on older Xen which doesn't have it.

It's also useful for those working on Xen and Xen-compatible hypervisors,
because there are guest kernels still in active use which use PCI INTX
even when vector delivery is available.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/xen/enlighten_hvm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 9e87ab010c82..a1c07e0c888e 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -188,6 +188,8 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
        return 0;
 }
 
+static bool no_vector_callback __initdata;
+
 static void __init xen_hvm_guest_init(void)
 {
 	if (xen_pv_domain())
@@ -207,7 +209,7 @@ static void __init xen_hvm_guest_init(void)
 
 	xen_panic_handler_init();
 
-	if (xen_feature(XENFEAT_hvm_callback_vector))
+	if (!no_vector_callback && xen_feature(XENFEAT_hvm_callback_vector))
 		xen_have_vector_callback = 1;
 
 	xen_hvm_smp_init();
@@ -233,6 +235,13 @@ static __init int xen_parse_nopv(char *arg)
 }
 early_param("xen_nopv", xen_parse_nopv);
 
+static __init int xen_parse_no_vector_callback(char *arg)
+{
+	no_vector_callback = true;
+	return 0;
+}
+early_param("no_vector_callback", xen_parse_no_vector_callback);
+
 bool __init xen_hvm_need_lapic(void)
 {
 	if (xen_pv_domain())
-- 
2.26.2


