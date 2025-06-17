Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F84ADBE89
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 03:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017641.1394629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRL6n-0007Ya-9C; Tue, 17 Jun 2025 01:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017641.1394629; Tue, 17 Jun 2025 01:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRL6n-0007Wi-6U; Tue, 17 Jun 2025 01:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1017641;
 Tue, 17 Jun 2025 01:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Ip9=ZA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uRL6l-0007Wc-BI
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 01:27:28 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39603728-4b1a-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 03:27:25 +0200 (CEST)
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
X-Inumbo-ID: 39603728-4b1a-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750123644; x=1750382844;
	bh=2Ql7A9stfIaDn/0b3h4dzkJ7F54TB/MRgBtbMPWnly0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=SdRSNcQR7twDiO800mXT6Ch37nANzPBfAzhup6JNT0GYtIs3OGsQqiup7t3e/T8mz
	 c5UKwN5Dn9vsEdYMV7z0wQokdc1yA01MmsY3wDDuDPuIdWkwztcLcJcyOTIV/giyc9
	 6bFGayCsfr5BN/Hwz7Gj9yE0D5Xnl3SGZS2Mzr8OPCyyaGsRP2QnQbETYyRKQtFkh/
	 5Vbi5Gvg+RPn+hK/4Uy7p+oKtvCbkLDWUwQ6NP30jvwHJ9w1noFLbfw3oEHeEQiQ7M
	 abC06hBhlXwKFoSOQAJoDE7L7GXPcqUKMe2Ocff6bWMsJ6oOQT/+vfoLJD9emqQSPA
	 lHtnr5Jyo6/eA==
Date: Tue, 17 Jun 2025 01:27:19 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v2] xen/console: introduce domain_console struct
Message-ID: <20250617012713.57074-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 823db6e1ad105196514db47a508dd2a404e48605
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce domain_console for grouping data structures used for integrating
domain's diagnostic console with Xen's console driver.

Group all pbuf-related data structures under domain_console. Rename the mov=
ed
fields to plain .buf, .idx and .lock names, since all uses of the fields ar=
e
touched.

Bump the domain console buffer size to the closest power of 2 (256) and
rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.

Move d->console->buf management under CONFIG_VERBOSE_DEBUG when the
HYPERCALL_console_io handler is enabled.

Finally, update the domain_console allocation code.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- added new struct domain_console
- updated allocation code for domain's console data structure
- bumped the size of the domain's output buffer to 256
- put domain's console buffer treatment under CONFIG_VERBOSE_DEBUG

I addressed most of the v1 feedback here, since all fields of the domain's
console data structures are touched.

Domain's console input buffer question is not addressed because it looks li=
ke a
separate (big) patch.

Link to v1: https://lore.kernel.org/xen-devel/20250606194937.2412579-1-dmuk=
hin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
870179848
---
 xen/arch/arm/vpl011.c      |  2 +-
 xen/arch/x86/hvm/hvm.c     | 26 ++++++++++++++++----------
 xen/arch/x86/pv/shim.c     |  2 +-
 xen/common/domain.c        | 18 ++++++++++--------
 xen/drivers/char/console.c | 24 ++++++++++++++----------
 xen/include/xen/sched.h    | 27 +++++++++++++++++----------
 6 files changed, 59 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 2b6f2a09bca6..f4a840da10c5 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_=
init_info *info)
     }
     else
     {
-        d->console.input_allowed =3D true;
+        d->console->input_allowed =3D true;
         vpl011->backend_in_domain =3D false;
=20
         vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 056360d5fe50..4295d98ddeb1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -559,7 +559,6 @@ void hvm_do_resume(struct vcpu *v)
 static int cf_check hvm_print_line(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
-    struct domain *cd =3D current->domain;
     char c =3D *val;
=20
     ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
@@ -570,17 +569,24 @@ static int cf_check hvm_print_line(
=20
     if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
-
-    spin_lock(&cd->pbuf_lock);
-    if ( c !=3D '\n' )
-        cd->pbuf[cd->pbuf_idx++] =3D c;
-    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n') )
+#ifdef CONFIG_VERBOSE_DEBUG
+    else
     {
-        cd->pbuf[cd->pbuf_idx] =3D '\0';
-        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
-        cd->pbuf_idx =3D 0;
+        struct domain *cd =3D current->domain;
+        struct domain_console *cons =3D cd->console;
+
+        spin_lock(&cons->lock);
+        if ( c !=3D '\n' )
+            cons->buf[cons->idx++] =3D c;
+        if ( (cons->idx =3D=3D (DOMAIN_CONSOLE_BUF_SIZE - 1)) || (c =3D=3D=
 '\n') )
+        {
+            cons->buf[cons->idx] =3D '\0';
+            guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
+            cons->idx =3D 0;
+        }
+        spin_unlock(&cons->lock);
     }
-    spin_unlock(&cd->pbuf_lock);
+#endif
=20
     return X86EMUL_OKAY;
 }
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index bc2a7dd5fae5..bd29c53a2d34 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgen=
try_t *l4start,
      */
     d->max_pages =3D domain_tot_pages(d);
=20
-    d->console.input_allowed =3D true;
+    d->console->input_allowed =3D true;
 }
=20
 static void write_start_info(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e566a1874795..578eb587e27e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
=20
-    xfree(d->pbuf);
+    xfree(d->console);
=20
     argo_destroy(d);
=20
@@ -800,6 +800,11 @@ struct domain *domain_create(domid_t domid,
     if ( (d =3D alloc_domain_struct()) =3D=3D NULL )
         return ERR_PTR(-ENOMEM);
=20
+    err =3D -ENOMEM;
+    d->console =3D xvzalloc(typeof(*d->console));
+    if ( !d->console )
+        goto fail;
+
     /* Sort out our idea of is_system_domain(). */
     d->domain_id =3D domid;
     d->unique_id =3D get_unique_id();
@@ -832,7 +837,7 @@ struct domain *domain_create(domid_t domid,
         if ( old_hwdom )
             old_hwdom->cdf &=3D ~CDF_hardware;
=20
-        d->console.input_allowed =3D true;
+        d->console->input_allowed =3D true;
     }
=20
     /* Holding CDF_* internal flags. */
@@ -862,7 +867,9 @@ struct domain *domain_create(domid_t domid,
     spin_lock_init(&d->shutdown_lock);
     d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
=20
-    spin_lock_init(&d->pbuf_lock);
+#ifdef CONFIG_VERBOSE_DEBUG
+    spin_lock_init(&d->console->lock);
+#endif
=20
     rwlock_init(&d->vnuma_rwlock);
=20
@@ -955,11 +962,6 @@ struct domain *domain_create(domid_t domid,
     if ( (err =3D argo_init(d)) !=3D 0 )
         goto fail;
=20
-    err =3D -ENOMEM;
-    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
-    if ( !d->pbuf )
-        goto fail;
-
     if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
         goto fail;
=20
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 616f4968b004..61a804c09a50 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -524,7 +524,7 @@ struct domain *console_get_domain(void)
     if ( !d )
         return NULL;
=20
-    if ( d->console.input_allowed )
+    if ( d->console->input_allowed )
         return d;
=20
     rcu_unlock_domain(d);
@@ -567,7 +567,7 @@ static void console_switch_input(void)
         {
             rcu_unlock_domain(d);
=20
-            if ( !d->console.input_allowed )
+            if ( !d->console->input_allowed )
                 continue;
=20
             console_rx =3D next_rx;
@@ -754,9 +754,11 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
(char) buffer,
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
+#ifdef CONFIG_VERBOSE_DEBUG
         else
         {
             char *kin =3D kbuf, *kout =3D kbuf, c;
+            struct domain_console *cons =3D cd->console;
=20
             /* Strip non-printable characters */
             do
@@ -769,23 +771,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
             } while ( --kcount > 0 );
=20
             *kout =3D '\0';
-            spin_lock(&cd->pbuf_lock);
+            spin_lock(&cons->lock);
             kcount =3D kin - kbuf;
             if ( c !=3D '\n' &&
-                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
+                 cons->idx + kout - kbuf < DOMAIN_CONSOLE_BUF_SIZE - 1 )
             {
                 /* buffer the output until a newline */
-                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
-                cd->pbuf_idx +=3D (kout - kbuf);
+                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
+                cons->idx +=3D (kout - kbuf);
             }
             else
             {
-                cd->pbuf[cd->pbuf_idx] =3D '\0';
-                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
-                cd->pbuf_idx =3D 0;
+                cons->buf[cons->idx] =3D '\0';
+                guest_printk(cd,
+                             XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);
+                cons->idx =3D 0;
             }
-            spin_unlock(&cd->pbuf_lock);
+            spin_unlock(&cons->lock);
         }
+#endif
=20
         guest_handle_add_offset(buffer, kcount);
         count -=3D kcount;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7ba..388ba70a41a9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -371,6 +371,22 @@ struct evtchn_port_ops;
=20
 #define MAX_NR_IOREQ_SERVERS 8
=20
+/* Arbitrary value; must be a multiple of the cacheline size. */
+#define DOMAIN_CONSOLE_BUF_SIZE 256
+
+/* Domain console settings. */
+struct domain_console {
+#ifdef CONFIG_VERBOSE_DEBUG
+    /* hvm_print_line() and guest_console_write() logging. */
+    char *buf;
+    unsigned int idx;
+    spinlock_t lock;
+#endif /* CONFIG_VERBOSE_DEBUG */
+
+    /* Permission to take ownership of the physical console input. */
+    bool input_allowed;
+};
+
 struct domain
 {
     domid_t          domain_id;
@@ -562,12 +578,6 @@ struct domain
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
@@ -653,10 +663,7 @@ struct domain
 #endif
=20
     /* Console settings. */
-    struct {
-        /* Permission to take ownership of the physical console input. */
-        bool input_allowed;
-    } console;
+    struct domain_console *console;
 } __aligned(PAGE_SIZE);
=20
 static inline struct page_list_head *page_to_list(
--=20
2.34.1



