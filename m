Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C68D80A1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734816.1140900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5bc-0001Ap-DL; Mon, 03 Jun 2024 11:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734816.1140900; Mon, 03 Jun 2024 11:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5bc-00018T-AL; Mon, 03 Jun 2024 11:12:00 +0000
Received: by outflank-mailman (input) for mailman id 734816;
 Mon, 03 Jun 2024 11:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5ba-00016a-Hs
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:11:58 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170103e2-219a-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:11:57 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id E9B4A315F7;
 Mon,  3 Jun 2024 07:11:55 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id E1FF9315F6;
 Mon,  3 Jun 2024 07:11:55 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0CA89315F5;
 Mon,  3 Jun 2024 07:11:52 -0400 (EDT)
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
X-Inumbo-ID: 170103e2-219a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=md4/Z52UulaNXfs7DDM6MqdCK
	uKZsNgFQ+L4Xd1y2gc=; b=xQ5QuPr/nIZwTMBYH0J0WoqHEmpCXlUZni/x4ZfM5
	JtszSZP01QQEGfglBenuK9WZ4Gbrj07+g/3f0jagYh7ojJAExxJlnd3pOBa6mk0I
	dN8kib1imh0nWiGQ462buSFsyUpUw2TV3J0yO9tyD+U9YobK/5m8OH62OcukD9LA
	3U=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v3 03/16] x86/p2m: guard altp2m routines
Date: Mon,  3 Jun 2024 14:11:49 +0300
Message-Id: <acb98c1c52613555a59cd27aad853a24caef0e19.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 14E00040-219A-11EF-B614-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Initialize and bring down altp2m only when it is supported by the platfor=
m,
e.g. VMX. Also guard p2m_altp2m_propagate_change().
The puspose of that is the possiblity to disable altp2m support and exclu=
de its
code from the build completely, when it's not supported by the target pla=
tform.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - put hvm_altp2m_supported() first
 - rewrite changes to p2m_init() with less code
 - add tag
---
 xen/arch/x86/mm/p2m-basic.c | 9 +++++----
 xen/arch/x86/mm/p2m-ept.c   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

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
index f83610cb8c..c261ba02db 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -986,7 +986,7 @@ out:
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


