Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CED8A6425
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706642.1103927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcU2-0007W7-K2; Tue, 16 Apr 2024 06:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706642.1103927; Tue, 16 Apr 2024 06:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcU2-0007Ud-HF; Tue, 16 Apr 2024 06:39:58 +0000
Received: by outflank-mailman (input) for mailman id 706642;
 Tue, 16 Apr 2024 06:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcU0-0007UT-N8
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:39:56 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2249d11b-fbbc-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 08:39:55 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id AC5072D94C;
 Tue, 16 Apr 2024 02:39:53 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id A527C2D94B;
 Tue, 16 Apr 2024 02:39:53 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 93C3E2D94A;
 Tue, 16 Apr 2024 02:39:50 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2249d11b-fbbc-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Zov7P26ovoeyz12WpNWta0tTBMaGMTqH9ir2jv5nGU8=; b=BVpW
	s5Fn0VKS4FkDq+TxfFi26d+8QhJ4OCqBuMdnjNUQ8HiBe0QSL7YBS2blU4fZrq9k
	VDiKaObLGrrMC1RKjQAX1wkVK+o5DkzSy/akmgajKlf3KEhZ0uXY6LFiFzIylKoX
	f2YBrxZ3PjgA+XGMFzhcQybFjNPmIj62iXab4g0=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 10/15] x86/domain: guard svm specific functions with CONFIG_SVM
Date: Tue, 16 Apr 2024 09:39:47 +0300
Message-Id: <20240416063947.3469718-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 201CACFA-FBBC-11EE-8CD0-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

The functions svm_load_segs() and svm_load_segs_prefetch() are AMD-V spec=
ific
so guard their calls in common code with CONFIG_SVM.

Since SVM depends on HVM, it can be used alone.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/domain.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 33a2830d9d..e10e453aa1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1702,11 +1702,10 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
=20
-#ifdef CONFIG_HVM
-        if ( cpu_has_svm && (uregs->fs | uregs->gs) <=3D 3 )
+        if ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm &&
+             (uregs->fs | uregs->gs) <=3D 3 )
             fs_gs_done =3D svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_S=
TART(n),
                                        n->arch.pv.fs_base, gsb, gss);
-#endif
     }
=20
     if ( !fs_gs_done )
@@ -2019,11 +2018,10 @@ static void __context_switch(void)
=20
     write_ptbase(n);
=20
-#if defined(CONFIG_PV) && defined(CONFIG_HVM)
     /* Prefetch the VMCB if we expect to use it later in the context swi=
tch */
-    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
+    if ( IS_ENABLED(CONFIG_PV) && IS_ENABLED(CONFIG_SVM) &&
+         cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
-#endif
=20
     if ( need_full_gdt(nd) && !per_cpu(full_gdt_loaded, cpu) )
         load_full_gdt(n, cpu);
--=20
2.25.1


