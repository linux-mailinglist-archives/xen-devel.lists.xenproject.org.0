Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB68C8A63CF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706630.1103897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcNu-0004qd-Ir; Tue, 16 Apr 2024 06:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706630.1103897; Tue, 16 Apr 2024 06:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcNu-0004o2-GB; Tue, 16 Apr 2024 06:33:38 +0000
Received: by outflank-mailman (input) for mailman id 706630;
 Tue, 16 Apr 2024 06:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcNt-0004ma-0c
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:33:37 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 403c5eaa-fbbb-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 08:33:36 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 9A5C83655F;
 Tue, 16 Apr 2024 02:33:34 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 92F663655E;
 Tue, 16 Apr 2024 02:33:34 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id AF7E53655D;
 Tue, 16 Apr 2024 02:33:31 -0400 (EDT)
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
X-Inumbo-ID: 403c5eaa-fbbb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=8JG4PNjuvlxmdEd1LlKmhuuWXf6XUwBh7cHi41Twr6g=; b=rtoh
	MLRLrV8RqFLvqfgTLdqf/eHbxNbZmOEHfGtPhCX3rKhD5/5NCWZaLWa7SU0UDbTp
	0NQMuhf7HESJsx82uKS0PlmrrdA8wfcOxt9ZL8o8VifMsH8C5nyy3nCO4S+PghNK
	tzErVXbV64L3RlAo99ui58otxtTr+rj8MU45xlE=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 07/15] x86/p2m: guard vmx specific ept functions with CONFIG_VMX
Date: Tue, 16 Apr 2024 09:33:28 +0300
Message-Id: <20240416063328.3469386-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3E467702-FBBB-11EE-81EF-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

The functions ept_p2m_init() and ept_p2m_uninit() are VT-x specific.
Do build-time checks and skip these functions execution when !VMX.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/mm/p2m-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 90106997d7..6810941c30 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -38,7 +38,7 @@ static int p2m_initialise(struct domain *d, struct p2m_=
domain *p2m)
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
=20
-    if ( hap_enabled(d) && cpu_has_vmx )
+    if ( IS_ENABLED(CONFIG_VMX) && hap_enabled(d) && cpu_has_vmx )
         ret =3D ept_p2m_init(p2m);
     else
         p2m_pt_init(p2m);
@@ -70,7 +70,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 void p2m_free_one(struct p2m_domain *p2m)
 {
     p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
+    if ( IS_ENABLED(CONFIG_VMX) && hap_enabled(p2m->domain) && cpu_has_v=
mx )
         ept_p2m_uninit(p2m);
     free_cpumask_var(p2m->dirty_cpumask);
     xfree(p2m);
--=20
2.25.1


