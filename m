Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E70940EFA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767485.1178144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYk2G-00048h-Lx; Tue, 30 Jul 2024 10:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767485.1178144; Tue, 30 Jul 2024 10:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYk2G-00046l-J3; Tue, 30 Jul 2024 10:24:52 +0000
Received: by outflank-mailman (input) for mailman id 767485;
 Tue, 30 Jul 2024 10:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYk2F-00046b-L8
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:24:51 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2e2c2be-4e5d-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:24:49 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 3AEC2354A5;
 Tue, 30 Jul 2024 06:24:48 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 334A5354A4;
 Tue, 30 Jul 2024 06:24:48 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C9948354A1;
 Tue, 30 Jul 2024 06:24:44 -0400 (EDT)
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
X-Inumbo-ID: f2e2c2be-4e5d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=a9yGdN5UJg74MWMxngSXjpTTe
	p0k3IjQWp09AuJ1Dr4=; b=XwrMsGtXTcFgWsWWkAnoLbo9HfyuFdQuWG1ZFUgyT
	9qP9gHtzWXZAiX41CWso32jrJdFkHMTN+/zhpUCnS0AnPpKtEmlEfsSE7KURkg2S
	I/mUWyxbOcgS29RyZTi16gOGRA6+CxNvrQfODwptHjADsXTGvsnAlOuuRpbDlzKE
	3k=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v5 05/13] x86/p2m: guard EPT functions with using_vmx() check
Date: Tue, 30 Jul 2024 13:24:41 +0300
Message-Id: <cb0057575bcc2d31ad9929c1cfd7476100962c91.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F0AA9974-4E5D-11EF-963E-92D9AF168FA5-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_vmx check with using_vmx(), so that DCE would remove call=
s
to functions ept_p2m_init() and ept_p2m_uninit() on non-VMX build.
Since currently Intel EPT implementation depends on CONFIG_INTEL_VMX conf=
ig
option, when VMX is off these functions are unavailable.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v5:
 - changed description
changes in v4:
 - changed description a bit
 - added tag
 - adjusted call to using_vmx(), as it has become an inline function
changes in v3:
 - using_vmx instead of IS_ENABLED(CONFIG_VMX)
 - updated description
---
 xen/arch/x86/mm/p2m-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 08007a687c..e126fda267 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -40,7 +40,7 @@ static int p2m_initialise(struct domain *d, struct p2m_=
domain *p2m)
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
=20
-    if ( hap_enabled(d) && cpu_has_vmx )
+    if ( hap_enabled(d) && using_vmx() )
         ret =3D ept_p2m_init(p2m);
     else
         p2m_pt_init(p2m);
@@ -72,7 +72,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 void p2m_free_one(struct p2m_domain *p2m)
 {
     p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
+    if ( hap_enabled(p2m->domain) && using_vmx() )
         ept_p2m_uninit(p2m);
     free_cpumask_var(p2m->dirty_cpumask);
     xfree(p2m);
--=20
2.25.1


