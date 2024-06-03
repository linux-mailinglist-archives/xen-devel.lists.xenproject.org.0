Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7E8D812C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734856.1140970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5pp-0006kW-1V; Mon, 03 Jun 2024 11:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734856.1140970; Mon, 03 Jun 2024 11:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5po-0006j1-Us; Mon, 03 Jun 2024 11:26:40 +0000
Received: by outflank-mailman (input) for mailman id 734856;
 Mon, 03 Jun 2024 11:26:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5po-0006it-Ay
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:26:40 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a22ae2-219c-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:26:38 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 8F8752A8E7;
 Mon,  3 Jun 2024 07:26:36 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 8748B2A8E6;
 Mon,  3 Jun 2024 07:26:36 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id A7C7F2A8E5;
 Mon,  3 Jun 2024 07:26:35 -0400 (EDT)
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
X-Inumbo-ID: 23a22ae2-219c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=C9i/Ss0viC+/vS6vrwKhCdgvC
	fQtFhYi+LVOUd2WOmY=; b=F827fVDOG7PTj68DkUpBmH/hc3C5ZKUSls6qCAvlV
	5zMwJ35Zcgfn39w5fuxXIteq/W7dscCVEfunGa7ZWDR5GJbMEWNYxVsoeQgVwZYi
	MsiK/LWrlDAEcJwXnAhBF2byjltBHb8QykidMNzP3NnASUbnqybM9PiUJL7VczeK
	Rc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 10/16] x86/domain: guard svm specific functions with usinc_svm macro
Date: Mon,  3 Jun 2024 14:26:33 +0300
Message-Id: <e03693d1daa386a31e09794b0167d282df5a8bfe.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 22F79E52-219C-11EF-8278-6488940A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_svm check with using_svm, so that not only SVM support in=
 CPU
gets checked, but also presence of functions svm_load_segs() and
svm_load_segs_prefetch() in the build checked as well.

Since SVM depends on HVM, it can be used alone.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - using_svm instead of IS_ENABLED(CONFIG_SVM)
 - updated description
---
 xen/arch/x86/domain.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 536542841e..a2f19f8b46 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1731,11 +1731,9 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
=20
-#ifdef CONFIG_HVM
-        if ( cpu_has_svm && (uregs->fs | uregs->gs) <=3D 3 )
+        if ( using_svm && (uregs->fs | uregs->gs) <=3D 3 )
             fs_gs_done =3D svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_S=
TART(n),
                                        n->arch.pv.fs_base, gsb, gss);
-#endif
     }
=20
     if ( !fs_gs_done )
@@ -2048,9 +2046,9 @@ static void __context_switch(void)
=20
     write_ptbase(n);
=20
-#if defined(CONFIG_PV) && defined(CONFIG_HVM)
+#if defined(CONFIG_PV)
     /* Prefetch the VMCB if we expect to use it later in the context swi=
tch */
-    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
+    if ( using_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
 #endif
=20
--=20
2.25.1


