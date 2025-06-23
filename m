Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9EAE3341
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 03:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021977.1397693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTVnd-000431-5c; Mon, 23 Jun 2025 01:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021977.1397693; Mon, 23 Jun 2025 01:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTVnd-00041d-2d; Mon, 23 Jun 2025 01:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1021977;
 Mon, 23 Jun 2025 01:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3i4=ZG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTVna-00041X-Gt
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 01:16:39 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4a98339-4fcf-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 03:16:35 +0200 (CEST)
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
X-Inumbo-ID: b4a98339-4fcf-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750641394; x=1750900594;
	bh=PMAd4zFxcXv5vGZUSDMj0BvN3PyFw2OdCgQnVuQcNh0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mhtiPvKs4CuQXBO9Ueh+xug38LpA8Me19CNUKoB8nOHtLSHwJVlkeVCpKBsU3EtUX
	 jXwVfKL1hQjnKaBkc8yjjEvQmrIfLtKh7zgUsrgbYsqUF25wdDOj2OT8p5p49PesWC
	 1A14oq42f1Egab+4G3qpM3taOzvY69/FLDWD2cP2rl4MG0lw2jm64PBgHEaK2fjBFM
	 Bdc7SNaddOBEw0rf9oJgQCt178F7fYSvQX1uEeUU//s/YuGOi58JUhxuh+2sZKo13h
	 946SoGElXoIcfqWxPrLp+zAUeL1PGVlOAJZn4O/qk5YemJu4dcu7zi66wpDwmre96k
	 opcbEM5aK1NYA==
Date: Mon, 23 Jun 2025 01:16:28 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1] xen/domain: fix memory leak in domain_create()
Message-ID: <20250623011514.173367-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: afa7b6199ee8a1cf08082bdff2dc07f5930bfacf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Fix potential memory leak in domain_create() in late hardware domain case.

Fixes: b959f3b820f5 ("xen: introduce hardware domain create flag")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
I think that no memory allocation is required before performing late hwdom
checks (ID range and hwdom existance).

Looks like sanitise_domain_config() could better fit for performing such
configuration checks.

Alternatively, hardware_domid range could be checked via custom parser
instead of code in domain_create() and then hwdom existance can be moved
before alloc_domain_struct().

Thoughts?
---
 xen/common/domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2f6b0af50dd3..5ad1ac872798 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -825,7 +825,10 @@ struct domain *domain_create(domid_t domid,
=20
         /* late_hwdom is only allowed for dom0. */
         if ( hardware_domain && hardware_domain->domain_id )
+        {
+            free_domain_struct(d);
             return ERR_PTR(-EINVAL);
+        }
=20
         old_hwdom =3D hardware_domain;
         hardware_domain =3D d;
--=20
2.34.1



