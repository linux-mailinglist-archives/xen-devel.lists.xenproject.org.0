Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC28A63BA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706607.1103855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcHn-0001dz-U8; Tue, 16 Apr 2024 06:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706607.1103855; Tue, 16 Apr 2024 06:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcHn-0001am-Qu; Tue, 16 Apr 2024 06:27:19 +0000
Received: by outflank-mailman (input) for mailman id 706607;
 Tue, 16 Apr 2024 06:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcHm-0001ag-WE
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:27:19 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e658636-fbba-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:27:17 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id B7057364F3;
 Tue, 16 Apr 2024 02:27:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id B0040364F2;
 Tue, 16 Apr 2024 02:27:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C9B78364F1;
 Tue, 16 Apr 2024 02:27:12 -0400 (EDT)
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
X-Inumbo-ID: 5e658636-fbba-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=j8hR43uHFMb8E6XMwU16iGhVgjg2xCVf92GTagxy/BY=; b=V49X
	akXpWQvpcVLLPgqcy8Bvj6a11dKW1hTJta3/pATKuXvX/HHd6ke75Q8hOopWV4i5
	IwqBwK5h/2Gp54dABlAIvt61DZpcpyRZsVXAkQyRsE1W+ITP8aB1zXs5DW4UWKzN
	vE1LD2oG6usRz0fFItG6emsVk/MgjqGPOrKdkSk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 04/15] x86/p2m: guard altp2m init/teardown
Date: Tue, 16 Apr 2024 09:27:09 +0300
Message-Id: <20240416062709.3469044-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 5C70952E-FBBA-11EE-B4EA-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Initialize and bring down altp2m only when it is supported by the platfor=
m,
i.e. VMX. The puspose of that is the possiblity to disable VMX support an=
d
exclude its code from the build completely.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/mm/p2m-basic.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 8599bd15c6..90106997d7 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -126,13 +126,15 @@ int p2m_init(struct domain *d)
         return rc;
     }
=20
-    rc =3D p2m_init_altp2m(d);
-    if ( rc )
+    if ( hvm_altp2m_supported() )
     {
-        p2m_teardown_hostp2m(d);
-        p2m_teardown_nestedp2m(d);
+        rc =3D p2m_init_altp2m(d);
+        if ( rc )
+        {
+            p2m_teardown_hostp2m(d);
+            p2m_teardown_nestedp2m(d);
+        }
     }
-
     return rc;
 }
=20
@@ -195,11 +197,12 @@ void p2m_final_teardown(struct domain *d)
 {
     if ( is_hvm_domain(d) )
     {
+        if ( hvm_altp2m_supported() )
+            p2m_teardown_altp2m(d);
         /*
-         * We must tear down both of them unconditionally because
-         * we initialise them unconditionally.
+         * We must tear down nestedp2m unconditionally because
+         * we initialise it unconditionally.
          */
-        p2m_teardown_altp2m(d);
         p2m_teardown_nestedp2m(d);
     }
=20
--=20
2.25.1


