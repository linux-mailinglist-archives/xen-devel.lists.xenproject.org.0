Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB14AD08D6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 21:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008789.1387955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNd4p-00052H-O1; Fri, 06 Jun 2025 19:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008789.1387955; Fri, 06 Jun 2025 19:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNd4p-00050h-LC; Fri, 06 Jun 2025 19:50:07 +0000
Received: by outflank-mailman (input) for mailman id 1008789;
 Fri, 06 Jun 2025 19:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNd4o-0004ub-F0
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 19:50:06 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7086adf3-430f-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 21:50:04 +0200 (CEST)
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
X-Inumbo-ID: 7086adf3-430f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749239403; x=1749498603;
	bh=0LQ6dCGUKxJWJXyfgNN99Fw8rnMvgk0zd1TarhjT780=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=LqWHsDtRLIvOA8Ja+86cRfRCYiO0ytu2K0ODBgLmHfTERf6mnFPnwr+nUWaHlG7Vw
	 YWauQrL7pgMyu2R3NnDaIXW74rDYOdzXZF2QwXPiXXmGTANINj0Teh8Qqr9Zvl/u9a
	 W/ACsoL5yamhZz/agVUiI9AvyR37KRQHTj6y5iA1nHJCdrHOGIJhBDIgJP0ADlWouM
	 2oTkrtjW0ZMU+TLT+k1+X5DHRuGydgJv5jBZCFthSns5b/NoncmT5MLqFcbGV4iJ7r
	 eqdcVRFZqbL0L3VgVxi+tuXoJCo8Jk5O1kDGL+Exhlyq/0e7L+6g3M06zrPRdzHmBQ
	 WL2WeDl+E2LMQ==
Date: Fri, 06 Jun 2025 19:49:57 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1] xen/console: group pbuf under console field
Message-ID: <20250606194937.2412579-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 375e6bda5775af11fff66bdb2b858c00a6f37865
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Group all pbuf-related data structures under domain's console field.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/hvm.c     | 14 +++++++-------
 xen/common/domain.c        |  8 ++++----
 xen/drivers/char/console.c | 19 +++++++++++--------
 xen/include/xen/sched.h    | 12 ++++++------
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046..17d1fd42ce 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -571,16 +571,16 @@ static int cf_check hvm_print_line(
     if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
=20
-    spin_lock(&cd->pbuf_lock);
+    spin_lock(&cd->console.pbuf_lock);
     if ( c !=3D '\n' )
-        cd->pbuf[cd->pbuf_idx++] =3D c;
-    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n') )
+        cd->console.pbuf[cd->console.pbuf_idx++] =3D c;
+    if ( (cd->console.pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D=
 '\n') )
     {
-        cd->pbuf[cd->pbuf_idx] =3D '\0';
-        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
-        cd->pbuf_idx =3D 0;
+        cd->console.pbuf[cd->console.pbuf_idx] =3D '\0';
+        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->console.pbuf);
+        cd->console.pbuf_idx =3D 0;
     }
-    spin_unlock(&cd->pbuf_lock);
+    spin_unlock(&cd->console.pbuf_lock);
=20
     return X86EMUL_OKAY;
 }
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 153cd75340..dd1867b2fe 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
=20
-    xfree(d->pbuf);
+    xfree(d->console.pbuf);
=20
     argo_destroy(d);
=20
@@ -862,7 +862,7 @@ struct domain *domain_create(domid_t domid,
     spin_lock_init(&d->shutdown_lock);
     d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
=20
-    spin_lock_init(&d->pbuf_lock);
+    spin_lock_init(&d->console.pbuf_lock);
=20
     rwlock_init(&d->vnuma_rwlock);
=20
@@ -956,8 +956,8 @@ struct domain *domain_create(domid_t domid,
         goto fail;
=20
     err =3D -ENOMEM;
-    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
-    if ( !d->pbuf )
+    d->console.pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
+    if ( !d->console.pbuf )
         goto fail;
=20
     if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 616f4968b0..3855962af7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -769,22 +769,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
             } while ( --kcount > 0 );
=20
             *kout =3D '\0';
-            spin_lock(&cd->pbuf_lock);
+            spin_lock(&cd->console.pbuf_lock);
             kcount =3D kin - kbuf;
             if ( c !=3D '\n' &&
-                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
+                 cd->console.pbuf_idx + kout - kbuf < DOMAIN_PBUF_SIZE - 1=
 )
             {
                 /* buffer the output until a newline */
-                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
-                cd->pbuf_idx +=3D (kout - kbuf);
+                memcpy(cd->console.pbuf + cd->console.pbuf_idx,
+                       kbuf,
+                       kout - kbuf);
+                cd->console.pbuf_idx +=3D (kout - kbuf);
             }
             else
             {
-                cd->pbuf[cd->pbuf_idx] =3D '\0';
-                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
-                cd->pbuf_idx =3D 0;
+                cd->console.pbuf[cd->console.pbuf_idx] =3D '\0';
+                guest_printk(cd,
+                             XENLOG_G_DEBUG "%s%s\n", cd->console.pbuf, kb=
uf);
+                cd->console.pbuf_idx =3D 0;
             }
-            spin_unlock(&cd->pbuf_lock);
+            spin_unlock(&cd->console.pbuf_lock);
         }
=20
         guest_handle_add_offset(buffer, kcount);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..637aa09ec4 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -562,12 +562,6 @@ struct domain
     /* Control-plane tools handle for this domain. */
     xen_domain_handle_t handle;
=20
-    /* hvm_print_line() and guest_console_write() logging. */
-#define DOMAIN_PBUF_SIZE 200
-    char       *pbuf;
-    unsigned int pbuf_idx;
-    spinlock_t  pbuf_lock;
-
     /* OProfile support. */
     struct xenoprof *xenoprof;
=20
@@ -654,6 +648,12 @@ struct domain
=20
     /* Console settings. */
     struct {
+        /* hvm_print_line() and guest_console_write() logging. */
+#define DOMAIN_PBUF_SIZE 200
+        char *pbuf;
+        unsigned int pbuf_idx;
+        spinlock_t pbuf_lock;
+
         /* Permission to take ownership of the physical console input. */
         bool input_allowed;
     } console;
--=20
2.34.1



