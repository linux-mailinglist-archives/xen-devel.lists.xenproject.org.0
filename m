Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0B8C6389
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722073.1125909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AmX-0006s8-Rb; Wed, 15 May 2024 09:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722073.1125909; Wed, 15 May 2024 09:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AmX-0006pX-Ot; Wed, 15 May 2024 09:18:41 +0000
Received: by outflank-mailman (input) for mailman id 722073;
 Wed, 15 May 2024 09:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AmV-0006pP-T5
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:18:39 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c97be60-129c-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:18:38 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id B52891B823;
 Wed, 15 May 2024 05:18:36 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id ABE891B822;
 Wed, 15 May 2024 05:18:36 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 754F41B821;
 Wed, 15 May 2024 05:18:32 -0400 (EDT)
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
X-Inumbo-ID: 1c97be60-129c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=fy/w8iemesK+0sMkUtfBzP+Xq
	P828REQrPH5zx3qcTg=; b=Q3VLjGZbU7sn/9aAeJU9fMnGgN4K8zE0a09b+taR+
	nRuV90Rc40+i49K7NkjmPJV3JPrGZkiKyLJwAPV8foMCVwwFjBAPJ4tqRoF+5EcH
	F6YsmFjfI4043X4RKlIs29J/uwbmdQ6NJLZGkPWt1Hi20cLJ4sJ0VmcnQ6jQjFwo
	X8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v2 10/15] x86/domain: clean up superfluous #idef-s
Date: Wed, 15 May 2024 12:18:29 +0300
Message-Id: <67d6604e8f66468c02f0c2e60315fc9251b69beb.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 1992272E-129C-11EF-BDB2-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Remove preprocessor checks for CONFIG_HVM option, because expressions cov=
ered
by these checks are already guarded by cpu_has_svm, which itself depends
on CONFIG_HVM option (via CONFIG_SVM).

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/domain.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 20e83cf38b..5c7fb7fc73 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1708,11 +1708,9 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
=20
-#ifdef CONFIG_HVM
         if ( cpu_has_svm && (uregs->fs | uregs->gs) <=3D 3 )
             fs_gs_done =3D svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_S=
TART(n),
                                        n->arch.pv.fs_base, gsb, gss);
-#endif
     }
=20
     if ( !fs_gs_done )
@@ -2025,7 +2023,7 @@ static void __context_switch(void)
=20
     write_ptbase(n);
=20
-#if defined(CONFIG_PV) && defined(CONFIG_HVM)
+#if defined(CONFIG_PV)
     /* Prefetch the VMCB if we expect to use it later in the context swi=
tch */
     if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
--=20
2.25.1


