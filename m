Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7068A63B7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706600.1103844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcFn-00013p-IN; Tue, 16 Apr 2024 06:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706600.1103844; Tue, 16 Apr 2024 06:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcFn-00010v-Fl; Tue, 16 Apr 2024 06:25:15 +0000
Received: by outflank-mailman (input) for mailman id 706600;
 Tue, 16 Apr 2024 06:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcFl-00010p-JS
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:25:13 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 139b1886-fbba-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:25:11 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 3A83F364E2;
 Tue, 16 Apr 2024 02:25:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 2595B364E1;
 Tue, 16 Apr 2024 02:25:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 19A2E364E0;
 Tue, 16 Apr 2024 02:25:06 -0400 (EDT)
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
X-Inumbo-ID: 139b1886-fbba-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=4n89nVeeX4nXJeA9AycHq/YmU87NztPR/Mi/SSF7NXg=; b=RQL0
	nzpDEpVxb3uyUwjiBEdibwUPoKLzs5hoVcT4gE2VPgw8bZPW9/fQc1zAXObGP3OU
	bV+atRL2g965dqbYwmQhX8vJKDIU+xAVv6xmJenKW5U2a6rghwRKnUsnfsCjTWoR
	LaXtQHCMuxC/T1fw4Pfm66m8HGj6YJipQggiE50=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 03/15] x86/monitor: guard altp2m usage
Date: Tue, 16 Apr 2024 09:25:03 +0300
Message-Id: <20240416062503.3468942-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 1183DA58-FBBA-11EE-B03F-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Use altp2m index only when it is supported by the platform, i.e. VMX.
The puspose of that is the possiblity to disable VMX support and
exclude its code from the build completely.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/monitor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 4f500beaf5..192a721403 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t g=
fn, uint32_t pfec,
     struct vcpu *curr =3D current;
     vm_event_request_t req =3D {};
     paddr_t gpa =3D (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
+    unsigned int altp2m_idx =3D hvm_altp2m_supported() ?
+                              altp2m_vcpu_idx(curr) : 0;
     int rc;
=20
     ASSERT(curr->arch.vm_event->send_event);
@@ -270,7 +272,7 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t g=
fn, uint32_t pfec,
      * p2m_get_mem_access() can fail from a invalid MFN and return -ESRC=
H
      * in which case access must be restricted.
      */
-    rc =3D p2m_get_mem_access(curr->domain, gfn, &access, altp2m_vcpu_id=
x(curr));
+    rc =3D p2m_get_mem_access(curr->domain, gfn, &access, altp2m_idx);
=20
     if ( rc =3D=3D -ESRCH )
         access =3D XENMEM_access_n;
--=20
2.25.1


