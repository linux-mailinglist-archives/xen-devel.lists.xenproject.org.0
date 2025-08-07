Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023BCB1CFF4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 02:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072373.1435522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujowM-0002Og-L6; Thu, 07 Aug 2025 00:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072373.1435522; Thu, 07 Aug 2025 00:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujowM-0002MW-Hz; Thu, 07 Aug 2025 00:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1072373;
 Thu, 07 Aug 2025 00:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ujowK-0002MQ-8T
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 00:57:05 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d53cdbf-7329-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 02:57:01 +0200 (CEST)
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
X-Inumbo-ID: 6d53cdbf-7329-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754528220; x=1754787420;
	bh=P/uJF2I+/KJAt6ncOt5yYlEaL/c7E+bXRDVVyFEWzB8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EXuQ1y5CdRSAV8l5kxILMTb8uISVMPvxv//bsokOsVeJfS2oqVtuASjMOiHo55Eoq
	 FP+VSjRijB5QxYCs5HiFiYkjB3gihvBGwloN5+OfuWqc8hQRA0i9U5Olal567SoNPS
	 +7OWsmcomxMGr0yfY3jRYzr5K6cloKp7KU+U+A/42j4/4xs5FtaNFDNWtZQ80eLp6V
	 wLcSb95NjYNpDvFw1ObVkJLzblxvs/yMmFfhXtirnQzLsVwQCKABtlSi/QKMsPmHNp
	 w/AROMLwMhnISz4BOECDhYYynWeP4tUdE+dCQkFT0xrU1idw/0zO5ImSMvqwdx1XFq
	 A3oSl1138kFjA==
Date: Thu, 07 Aug 2025 00:56:56 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v11] xen/console: introduce domain_console struct
Message-ID: <20250807005649.551704-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7ec9725bafe790d2733de93fa46e97f887f259dc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Introduce domain_console for grouping data structures used for integrating
domain's diagnostic console with Xen's console driver.

Group all pbuf-related data structures under domain_console. Rename the mov=
ed
fields to plain .buf, .idx and .lock names, since all uses of the fields ar=
e
touched.

Ensure accesses to domain_console pointer are valid in console_switch_input=
().

Bump the domain console buffer allocation size to 256. No extra symbol for =
the
value since it is used only once during data structure declaration. All siz=
e
checks use ARRAY_SIZE().

Allocate domain_console from the heap so that the parent domain struct size
stays below PAGE_SIZE boundary to account for more console-related fields
added in the future.

Finally, update the domain_console allocation and initialization code. Make
sure domain_console is not allocated for system domains.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v10:
- use XVFREE()
- ensured that domain_console is not allocated for system domains
- corrected comment in sched.h
- Link to v10: https://lore.kernel.org/xen-devel/20250725210525.736706-1-dm=
ukhin@ford.com/
---
 xen/arch/arm/vpl011.c      |  2 +-
 xen/arch/x86/hvm/hvm.c     | 16 +++++++++-------
 xen/arch/x86/pv/shim.c     |  2 +-
 xen/common/domain.c        | 19 +++++++++----------
 xen/drivers/char/console.c | 28 ++++++++++++++++------------
 xen/include/xen/sched.h    | 24 +++++++++++++-----------
 6 files changed, 49 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 480fc664fc62..d0d17c76b72c 100644
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
index cb8ecd050d41..c0673325143d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -560,6 +560,7 @@ static int cf_check hvm_print_line(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct domain *cd =3D current->domain;
+    struct domain_console *cons =3D cd->console;
     char c =3D *val;
=20
     ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
@@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
     if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
=20
-    spin_lock(&cd->pbuf_lock);
+    spin_lock(&cons->lock);
+    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
     if ( c !=3D '\n' )
-        cd->pbuf[cd->pbuf_idx++] =3D c;
-    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n') )
+        cons->buf[cons->idx++] =3D c;
+    if ( (cons->idx =3D=3D (ARRAY_SIZE(cons->buf) - 1)) || (c =3D=3D '\n')=
 )
     {
-        cd->pbuf[cd->pbuf_idx] =3D '\0';
-        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
-        cd->pbuf_idx =3D 0;
+        cons->buf[cons->idx] =3D '\0';
+        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
+        cons->idx =3D 0;
     }
-    spin_unlock(&cd->pbuf_lock);
+    spin_unlock(&cons->lock);
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
index 5241a1629eeb..8b20daa57d62 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -680,7 +680,7 @@ static void _domain_destroy(struct domain *d)
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
=20
-    xfree(d->pbuf);
+    XVFREE(d->console);
=20
     argo_destroy(d);
=20
@@ -846,8 +846,6 @@ struct domain *domain_create(domid_t domid,
         flags |=3D CDF_hardware;
         if ( old_hwdom )
             old_hwdom->cdf &=3D ~CDF_hardware;
-
-        d->console.input_allowed =3D true;
     }
=20
     /* Holding CDF_* internal flags. */
@@ -877,8 +875,6 @@ struct domain *domain_create(domid_t domid,
     spin_lock_init(&d->shutdown_lock);
     d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
=20
-    spin_lock_init(&d->pbuf_lock);
-
     rwlock_init(&d->vnuma_rwlock);
=20
 #ifdef CONFIG_HAS_PCI
@@ -924,6 +920,14 @@ struct domain *domain_create(domid_t domid,
     if ( is_system_domain(d) )
         return d;
=20
+    err =3D -ENOMEM;
+    d->console =3D xvzalloc(typeof(*d->console));
+    if ( !d->console )
+        goto fail;
+
+    spin_lock_init(&d->console->lock);
+    d->console->input_allowed =3D is_hardware_domain(d);
+
     /*
      * This assertion helps static analysis tools infer that config cannot=
 be
      * NULL in this branch, which in turn means that it can be safely
@@ -976,11 +980,6 @@ struct domain *domain_create(domid_t domid,
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
index 9bd5b4825da6..a99605103552 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -526,7 +526,7 @@ struct domain *console_get_domain(void)
     if ( !d )
         return NULL;
=20
-    if ( d->console.input_allowed )
+    if ( d->console->input_allowed )
         return d;
=20
     rcu_unlock_domain(d);
@@ -567,10 +567,13 @@ static void console_switch_input(void)
         d =3D rcu_lock_domain_by_id(domid);
         if ( d )
         {
-            rcu_unlock_domain(d);
-
-            if ( !d->console.input_allowed )
+            if ( !d->console->input_allowed )
+            {
+                rcu_unlock_domain(d);
                 continue;
+            }
+
+            rcu_unlock_domain(d);
=20
             console_rx =3D next_rx;
             printk("*** Serial input to DOM%u", domid);
@@ -749,6 +752,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
         else
         {
             char *kin =3D kbuf, *kout =3D kbuf, c;
+            struct domain_console *cons =3D cd->console;
=20
             /* Strip non-printable characters */
             do
@@ -761,22 +765,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
             } while ( --kcount > 0 );
=20
             *kout =3D '\0';
-            spin_lock(&cd->pbuf_lock);
+            spin_lock(&cons->lock);
             kcount =3D kin - kbuf;
             if ( c !=3D '\n' &&
-                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
+                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1))=
 )
             {
                 /* buffer the output until a newline */
-                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
-                cd->pbuf_idx +=3D (kout - kbuf);
+                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
+                cons->idx +=3D kout - kbuf;
             }
             else
             {
-                cd->pbuf[cd->pbuf_idx] =3D '\0';
-                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
-                cd->pbuf_idx =3D 0;
+                cons->buf[cons->idx] =3D '\0';
+                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf)=
;
+                cons->idx =3D 0;
             }
-            spin_unlock(&cd->pbuf_lock);
+            spin_unlock(&cons->lock);
         }
=20
         guest_handle_add_offset(buffer, kcount);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fd5c9f933373..dab3fe59263e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -371,6 +371,17 @@ struct evtchn_port_ops;
=20
 #define MAX_NR_IOREQ_SERVERS 8
=20
+/* Domain console settings. */
+struct domain_console {
+    /* Permission to take ownership of the physical console input. */
+    bool input_allowed;
+
+    /* hvm_print_line() and guest_console_write() logging. */
+    unsigned int idx;
+    spinlock_t lock;
+    char buf[256];
+};
+
 struct domain
 {
     domid_t          domain_id;
@@ -562,12 +573,6 @@ struct domain
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
@@ -652,11 +657,8 @@ struct domain
     unsigned int *llc_colors;
 #endif
=20
-    /* Console settings. */
-    struct {
-        /* Permission to take ownership of the physical console input. */
-        bool input_allowed;
-    } console;
+    /* Pointer to console settings; NULL for system domains. */
+    struct domain_console *console;
 } __aligned(PAGE_SIZE);
=20
 static inline struct page_list_head *page_to_list(
--=20
2.34.1



