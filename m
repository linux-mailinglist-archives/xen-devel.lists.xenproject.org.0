Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98F2EB696
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 00:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62234.110094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwwDE-0000Xh-LI; Tue, 05 Jan 2021 23:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62234.110094; Tue, 05 Jan 2021 23:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwwDE-0000XI-Ho; Tue, 05 Jan 2021 23:58:04 +0000
Received: by outflank-mailman (input) for mailman id 62234;
 Tue, 05 Jan 2021 23:58:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBUl=GI=merlin.srs.infradead.org=batv+0bced0ab9dcc91656173+6344+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kwwDC-0000XD-Ca
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 23:58:03 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4711cb5e-3905-4f64-91be-f7748cd7014b;
 Tue, 05 Jan 2021 23:57:58 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwwCz-0002IN-46; Tue, 05 Jan 2021 23:57:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kwwCx-001NAA-5k; Tue, 05 Jan 2021 23:57:47 +0000
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
X-Inumbo-ID: 4711cb5e-3905-4f64-91be-f7748cd7014b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SleIGNuBIkcJy/BuzaYlQ36nlrAW+Se74wmuZZts4Ek=; b=WWlEYHCy85R/FFTF9dse/4uOWn
	69q0oDCx3QogTFEtX3QRLMJWT+iSZCYOdDYz3gtFbc6gZf6yoaIkboa7jKyPVi9DL7QWH/qFD7Ht1
	PRAKKvAq4XXgNJnFCRG1P/68w664Al30+sxiJ5wJgtGpdo3aXbRUkQDbH76DzWgfYLQt+XfOvIPT9
	6jw2Kd8lkhOFtd+OWeekBy+3KbDIoq6tEW4d6xSUZE3ErutqMfAgoBpf4Ufz7K7k2u/3jIlm6Zlph
	qQ/rzbfJjHTDI/GOUJlCTqbXxhrVdHiZW8Uo2tfuRTHBOki2CPcFbtl1GoDmWpuCR9ayYl3CXObM2
	jqUQPZaQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/5] x86/xen: Add a no_vector_callback option to test PCI INTX delivery
Date: Tue,  5 Jan 2021 23:57:34 +0000
Message-Id: <20210105235736.326797-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105235736.326797-1-dwmw2@infradead.org>
References: <20210105235736.326797-1-dwmw2@infradead.org>
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
 Documentation/admin-guide/kernel-parameters.txt |  4 ++++
 arch/x86/xen/enlighten_hvm.c                    | 11 ++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c722ec19cd00..35b10982d363 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3389,6 +3389,10 @@
 
 	nosync		[HW,M68K] Disables sync negotiation for all devices.
 
+	no_vector_callback
+			[KNL,X86,XEN] Disable the vector callback for Xen
+			event channel interrupts.
+
 	nowatchdog	[KNL] Disable both lockup detectors, i.e.
 			soft-lockup and NMI watchdog (hard-lockup).
 
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
2.29.2


