Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB7A3515A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 23:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888166.1297565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiho8-0003MB-AR; Thu, 13 Feb 2025 22:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888166.1297565; Thu, 13 Feb 2025 22:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiho8-0003JD-7Q; Thu, 13 Feb 2025 22:35:44 +0000
Received: by outflank-mailman (input) for mailman id 888166;
 Thu, 13 Feb 2025 22:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bpFt=VE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiho5-0003J7-Ra
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 22:35:43 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ca6de0-ea5a-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 23:35:39 +0100 (CET)
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
X-Inumbo-ID: d9ca6de0-ea5a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=csz3xcbhsvgp5kzq7ltnkjm3ku.protonmail; t=1739486136; x=1739745336;
	bh=sfVBT18Oy2o31UQzF0FnXAELcoie/RTqv5icCjyNat8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=iNX68spUprxXDYGAKZwxeVOZJC14sTyNdSpoX5W5hFVIuM1KFQzsCInXY0nckGtGe
	 80GLOyXj7buXqt3ihrozu0PnQo1PJuWZ/C2ErpZgrW+vjxi2uC2D3jL4JDaSdqWt/D
	 AxntPaUHWNsU721ofCTTCsQcSB9+FMxEYPVBwWLKAyn5ND/ROtjEsCVx68x4TFttN1
	 uaHe6SieNGWNDfN8maNxeAZPtg6juknlAwfisighcL/KRZK48LmZ2+m135H+3JLus3
	 SDHFzQWwsEI52s0z7aDK9YV+JErxezbJIxE7Sk29LIB7Vn5VBdMULZiwvfJOAZm1IM
	 bbrTQz5nUqg5Q==
Date: Thu, 13 Feb 2025 22:35:30 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/console: pre-compute domain prefix for printouts
Message-ID: <20250213214350.1745843-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2600cdc07e24ccea33cd599b66684f3a13b5b82b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Every guest_printk() call computes "(d%d) " prefix on every call.
Move prefix generation to the domain creation time.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/pv/shim.c     | 2 ++
 xen/common/domain.c        | 2 ++
 xen/drivers/char/console.c | 6 +-----
 xen/include/xen/sched.h    | 1 +
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 81e4a0516d..b9c034ccff 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -329,6 +329,8 @@ int pv_shim_shutdown(uint8_t reason)
=20
     /* Update domain id. */
     d->domain_id =3D get_initial_domain_id();
+    snprintf(d->domain_prefix, sizeof(d->domain_prefix),
+             "(d%d) ", d->domain_id);
=20
     /* Clean the iomem range. */
     BUG_ON(iomem_deny_access(d, 0, ~0UL));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc77111..49d4cb8221 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -681,6 +681,8 @@ struct domain *domain_create(domid_t domid,
=20
     /* Sort out our idea of is_system_domain(). */
     d->domain_id =3D domid;
+    snprintf(d->domain_prefix, sizeof(d->domain_prefix),
+             "(d%d) ", d->domain_id);
     d->unique_id =3D get_unique_id();
=20
     /* Holding CDF_* internal flags. */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 235d55bbff..2e23910dfa 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -965,12 +965,8 @@ void printk(const char *fmt, ...)
 void guest_printk(const struct domain *d, const char *fmt, ...)
 {
     va_list args;
-    char prefix[16];
-
-    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
-
     va_start(args, fmt);
-    vprintk_common(prefix, fmt, args);
+    vprintk_common(d->domain_prefix, fmt, args);
     va_end(args);
 }
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 037c83fda2..e90921dbd1 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -368,6 +368,7 @@ struct evtchn_port_ops;
 struct domain
 {
     domid_t          domain_id;
+    char             domain_prefix[16]; /* '(dX) ' prefix for printouts */
=20
     unsigned int     max_vcpus;
=20
--=20
2.34.1



