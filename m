Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62198C635D
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722028.1125820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AYP-0000EP-R3; Wed, 15 May 2024 09:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722028.1125820; Wed, 15 May 2024 09:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AYP-0000BA-O1; Wed, 15 May 2024 09:04:05 +0000
Received: by outflank-mailman (input) for mailman id 722028;
 Wed, 15 May 2024 09:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AYN-0000AC-St
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:04:03 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 131bb5d6-129a-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:04:03 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 665621AEBA;
 Wed, 15 May 2024 05:04:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 5F0061AEB9;
 Wed, 15 May 2024 05:04:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 3AA061AEB5;
 Wed, 15 May 2024 05:04:01 -0400 (EDT)
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
X-Inumbo-ID: 131bb5d6-129a-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=8cHhszYK7gh07npz053WlMjUF
	pjZMrbumLTp0bEkDA8=; b=gGb2MAXvbOitMXo/4x42RkhX1u793PsoDq7gFhhlb
	ULcmUOnDUObjxDPLQKtEQuz6HM05+yM7rjDCEUP/zAPFDVEeXJt/OFCXVIMl0vLk
	N+Jw6PNtJmS/oPWmvgzaTBjyjTzntAuS163wlN8pOcxAhizyOB5tUjE+uG5A0V8e
	ro=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v2 03/15] x86/p2m: guard altp2m routines
Date: Wed, 15 May 2024 12:03:59 +0300
Message-Id: <d4c537b1bcac4b301b16336ea3407834fc3076b1.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 12469D44-129A-11EF-9194-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Initialize and bring down altp2m only when it is supported by the platfor=
m,
e.g. VMX. Also guard p2m_altp2m_propagate_change().
The puspose of that is the possiblity to disable altp2m support and exclu=
de its
code from the build completely, when it's not supported by the target pla=
tform.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/mm/p2m-basic.c | 19 +++++++++++--------
 xen/arch/x86/mm/p2m-ept.c   |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)

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
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index f83610cb8c..d264df5b14 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -986,7 +986,7 @@ out:
     if ( is_epte_present(&old_entry) )
         ept_free_entry(p2m, &old_entry, target);
=20
-    if ( entry_written && p2m_is_hostp2m(p2m) )
+    if ( entry_written && p2m_is_hostp2m(p2m) && hvm_altp2m_supported())
     {
         ret =3D p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2=
mt, p2ma);
         if ( !rc )
--=20
2.25.1


