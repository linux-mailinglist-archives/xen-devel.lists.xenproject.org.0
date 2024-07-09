Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8892AF96
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755741.1164190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3kH-0000Ny-13; Tue, 09 Jul 2024 05:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755741.1164190; Tue, 09 Jul 2024 05:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3kG-0000MA-UN; Tue, 09 Jul 2024 05:50:32 +0000
Received: by outflank-mailman (input) for mailman id 755741;
 Tue, 09 Jul 2024 05:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3kF-0000M0-Fv
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 05:50:31 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252f2dee-3db7-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 07:50:29 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 04C9520061;
 Tue,  9 Jul 2024 01:50:28 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id F084320060;
 Tue,  9 Jul 2024 01:50:27 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 8A5FA20027;
 Tue,  9 Jul 2024 01:50:24 -0400 (EDT)
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
X-Inumbo-ID: 252f2dee-3db7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=Fx6tEFqIZ8N4WzkD6Tx5NtM2/
	EN8ecpPQC+N2RVvBqo=; b=WJEr9HTBxSnfKO8EXyk60R6SrD5rfwoh6exu9ULsi
	tQVHWArYF1sZPXM9MVmsrHuppP1xGpnRoRqOcXBxt4DsrDt3/KHc+muzPXm/Q2Q1
	DIc+99EgsuejSH/UOyFd5iSV1nbJ1SsdviDtmD8EZdI9NrVUEFqzC2ZIXHRKphDS
	Lc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v4 03/14] x86/p2m: guard altp2m routines
Date: Tue,  9 Jul 2024 08:50:21 +0300
Message-Id: <c5c61affddf8eef9b0d3a67314ba5d09163531aa.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 22EA3956-3DB7-11EF-A2A2-DFF1FEA446E2-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Initialize and bring down altp2m only when it is supported by the platfor=
m,
e.g. VMX. Also guard p2m_altp2m_propagate_change().
The purpose of that is the possibility to disable altp2m support and excl=
ude its
code from the build completely, when it's not supported by the target pla=
tform.

Here hvm_altp2m_supported() is being used to check for ALTP2M availabilit=
y,
which is only defined if HVM enabled, so a stub for that routine added fo=
r
!HVM configuration as well.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
New changes were made to patch after Jan reviewed it, namely hvm_altp2m_s=
upported()
added for !HVM config, so I didn't put his Acked-by tag here.
---
changes in v4:
 - added stub for hvm_altp2m_supported() and description updated accordin=
gly
changes in v3:
 - put hvm_altp2m_supported() first
 - rewrite changes to p2m_init() with less code
 - add tag
---
 xen/arch/x86/include/asm/hvm/hvm.h | 5 +++++
 xen/arch/x86/mm/p2m-basic.c        | 9 +++++----
 xen/arch/x86/mm/p2m-ept.c          | 2 +-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
index 1c01e22c8e..277648dd18 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -828,6 +828,11 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
=20
+static inline bool hvm_altp2m_supported(void)
+{
+    return false;
+}
+
 static inline bool hvm_nested_virt_supported(void)
 {
     return false;
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 25d27a0a9f..08007a687c 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -128,7 +128,7 @@ int p2m_init(struct domain *d)
         return rc;
     }
=20
-    rc =3D p2m_init_altp2m(d);
+    rc =3D hvm_altp2m_supported() ? p2m_init_altp2m(d) : 0;
     if ( rc )
     {
         p2m_teardown_hostp2m(d);
@@ -197,11 +197,12 @@ void p2m_final_teardown(struct domain *d)
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
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 469e27ee93..49b76e9d16 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -991,7 +991,7 @@ out:
     if ( is_epte_present(&old_entry) )
         ept_free_entry(p2m, &old_entry, target);
=20
-    if ( entry_written && p2m_is_hostp2m(p2m) )
+    if ( hvm_altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) =
)
     {
         ret =3D p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2=
mt, p2ma);
         if ( !rc )
--=20
2.25.1


