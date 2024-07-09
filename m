Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0A92AFAD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755776.1164241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3uT-0004nu-RN; Tue, 09 Jul 2024 06:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755776.1164241; Tue, 09 Jul 2024 06:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3uT-0004lN-Oe; Tue, 09 Jul 2024 06:01:05 +0000
Received: by outflank-mailman (input) for mailman id 755776;
 Tue, 09 Jul 2024 06:01:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3uS-0004lH-Uf
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:01:04 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dbf5e01-3db8-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:01:01 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id AE848382B5;
 Tue,  9 Jul 2024 02:00:59 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id A7047382B4;
 Tue,  9 Jul 2024 02:00:59 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 40C5A382B3;
 Tue,  9 Jul 2024 02:00:56 -0400 (EDT)
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
X-Inumbo-ID: 9dbf5e01-3db8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=HOwAYjPRmMki8TMFevxWhhW05
	eW/GeGVd0EhWHsG0rw=; b=OgOMcdEHMLni2UJHhjuqploQhRzpi1kzlV7zhN5Ws
	1nmsFG4xBaYSKWmi9C0J7khuFcHzJYxgHdq83JqePHikXd3uYvKBeZRaF0nYC9b4
	euvLXKqBJ3JklZM1FZSxMp79yyIg27HCv1YVoBpSsLRSO0h91tpHs0PRkJJkHo6A
	SM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v4 08/14] x86/PV: guard svm specific functions with usinc_svm() check
Date: Tue,  9 Jul 2024 09:00:52 +0300
Message-Id: <d637fa54d982251ff031c5d99f0e22aad561e015.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 9B6FE0D2-3DB8-11EF-8CCD-C38742FD603B-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_svm check with using_svm(), so that not only SVM support =
in CPU
is being checked at runtime, but also at build time we ensure the availab=
ility
of functions svm_load_segs() and svm_load_segs_prefetch().

Since SVM depends on HVM, it can be used alone.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - changed patch subject line
 - adjusted call to using_svm(), as it has become an inline function
 - use #ifdef CONFIG_PV
 - description changed a bit for more clarity
 - added tag
changes in v3:
 - using_svm instead of IS_ENABLED(CONFIG_SVM)
 - updated description
---
 xen/arch/x86/domain.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ccadfe0c9e..05cb9f7a4c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1732,11 +1732,9 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
=20
-#ifdef CONFIG_HVM
-        if ( cpu_has_svm && (uregs->fs | uregs->gs) <=3D 3 )
+        if ( using_svm() && (uregs->fs | uregs->gs) <=3D 3 )
             fs_gs_done =3D svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_S=
TART(n),
                                        n->arch.pv.fs_base, gsb, gss);
-#endif
     }
=20
     if ( !fs_gs_done )
@@ -2049,9 +2047,9 @@ static void __context_switch(void)
=20
     write_ptbase(n);
=20
-#if defined(CONFIG_PV) && defined(CONFIG_HVM)
+#ifdef CONFIG_PV
     /* Prefetch the VMCB if we expect to use it later in the context swi=
tch */
-    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
+    if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
 #endif
=20
--=20
2.25.1


