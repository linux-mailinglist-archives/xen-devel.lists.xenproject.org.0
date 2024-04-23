Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9388A8AE066
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710455.1109701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBz7-0006Cc-OB; Tue, 23 Apr 2024 08:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710455.1109701; Tue, 23 Apr 2024 08:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBz7-00069k-KO; Tue, 23 Apr 2024 08:58:41 +0000
Received: by outflank-mailman (input) for mailman id 710455;
 Tue, 23 Apr 2024 08:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBz6-00069X-0C
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:58:40 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac6e209e-014f-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 10:58:39 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 442431F0845;
 Tue, 23 Apr 2024 04:58:37 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3B3301F0844;
 Tue, 23 Apr 2024 04:58:37 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 1F5E91F0843;
 Tue, 23 Apr 2024 04:58:36 -0400 (EDT)
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
X-Inumbo-ID: ac6e209e-014f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=VFOZ78GE83950bFvFp1D2oIQO
	K0G5qlHi1q6MPGjNmw=; b=qgY84Vw7CGByYaErRK9vOYRyCeOp7oDOCm8TJ7RUN
	ua78MvChW9tdaQKm+cXTRPK7wIdTeM0SEtnmmQE0ZypGZLyRJJc31o8ylRZP+Z3S
	UtYDRdQCGETU4s1WRPmKb9ubwQzVWdD4TU1OpaUzWiMxYZYd1aKbunRQZluTl0Qr
	Wo=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 6/7] x86/MCE: guard call to Intel-specific intel_get_extended_msrs()
Date: Tue, 23 Apr 2024 11:58:34 +0300
Message-Id: <6769d564725912245cb83aaf7543933b4b5fb80d.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 AB669ED6-014F-11EF-BB0C-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Add check for CONFIG_INTEL build option to conditional call of this routi=
ne,
so that if Intel support is disabled the call would be eliminated.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/mce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
index 42e84e76b7..de2e16a6e2 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -328,7 +328,8 @@ mcheck_mca_logout(enum mca_source who, struct mca_ban=
ks *bankmask,
                 ASSERT(mig);
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
-                if ( boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL )
+                if ( IS_ENABLED(CONFIG_INTEL) &&
+                     boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL )
                     intel_get_extended_msrs(mig, mci);
             }
         }
--=20
2.25.1


