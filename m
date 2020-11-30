Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84782C823F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40824.73839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgU6-0001A9-Sr; Mon, 30 Nov 2020 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40824.73839; Mon, 30 Nov 2020 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgU6-00019N-PJ; Mon, 30 Nov 2020 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 40824;
 Mon, 30 Nov 2020 10:32:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgU4-0000Uu-Cl
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:40 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe4ec96c-4b2d-4290-ac68-1104e63198e9;
 Mon, 30 Nov 2020 10:32:07 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y7so17018339lji.8
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:07 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:05 -0800 (PST)
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
X-Inumbo-ID: fe4ec96c-4b2d-4290-ac68-1104e63198e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Cc66UPW5H7v9UJ3Wv0uf40SoC8B/Dy8enJYvxK9l3es=;
        b=Qb/ZibRigsTp1//JPm1gDde4wRxyyl2Jt+50ox4r4LS55UTDorgGU2J+ImajEKFr3A
         LT4DGSCAq8iDWY8ktxIRaIvZjfQaY5IUUW7VT4JtG7zEF2RC9KAcrArtEE2Ov5Ea01Dr
         AnJLobw4U//72RCmCFyn0U530UlRBEgxZhyzfatdFmGpnGOjskXbHx7kjz3r/pKLyMtS
         PByPlWILbdJAgXbXMkiUffPqqDs3OlPF5PLUkIKvmDiNzV5W3w56T8HkaXBPOy8Is1Eh
         37GaQPemxndRug59hSIfSV+Ru/9P9DXOP6nrhiGLyBJ1mhqSqNrubKlMMZluSdjsxnt7
         BfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Cc66UPW5H7v9UJ3Wv0uf40SoC8B/Dy8enJYvxK9l3es=;
        b=a0Xg2fUkyzYREigLLgqPD0qR+AAXnVqAe8IgsmSGkLDQCGwsnEyFw/Ej1BEZ+7oO50
         mwjLDmxJjxRo/0PnKMwhQvxF33Nx+8tY9vfWu+zWkwV0uEPf4nHj+Q4HfEs4HIvcz04Q
         z8dgIWSol7jBxRmdUWOkgqwAcMbFd3gokvF/vhTZ/PinisNn19czxg9o7JY7YQCmtPox
         mKueAJH8V1lZZoEUbQpKgpElSkDOmIfo2XFhKgvIeGRwAXKQQw3w2+Yrwz+Mdg1Zoq8C
         S+RgziSI7QaOz02inOoaW+f5KaeRRFG1J3pyLEocMwsr+jsNDHoJ7Wh/bCezZ7EYbnjQ
         zm1Q==
X-Gm-Message-State: AOAM5306fTC9Mz4zKx02OQWzMEAX1AO3HOx02t1nA/2firyguKq7Y443
	rnWnB7AY3J5GjVhxJZgCAsdY9gEWPL47Bg==
X-Google-Smtp-Source: ABdhPJy4eNMMohOGq2GH4e3eHmtQqcMmMO2w2jZDZccMSVyUoPMx30MpFl7/aZncoaaYDZOAduEAhQ==
X-Received: by 2002:a2e:7203:: with SMTP id n3mr9504708ljc.86.1606732326102;
        Mon, 30 Nov 2020 02:32:06 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 08/23] xen/ioreq: Move x86's ioreq_server to struct domain
Date: Mon, 30 Nov 2020 12:31:23 +0200
Message-Id: <1606732298-22107-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and this struct will be used
on Arm as is. Move it to common struct domain. This also
significantly reduces the layering violation in the common code
(*arch.hvm* usage).

We don't move ioreq_gfn since it is not used in the common code
(the "legacy" mechanism is x86 specific).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch

Changes V2 -> V3:
   - remove the mention of "ioreq_gfn" from patch subject/description
   - update patch according the "legacy interface" is x86 specific
   - drop hvm_params related changes in arch/x86/hvm/hvm.c
   - leave ioreq_gfn in hvm_domain
---
---
 xen/common/ioreq.c               | 60 ++++++++++++++++++++--------------------
 xen/include/asm-x86/hvm/domain.h |  8 ------
 xen/include/xen/sched.h          | 10 +++++++
 3 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 3e80fc6..b7c2d5a 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -38,13 +38,13 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct ioreq_server *s)
 {
     ASSERT(id < MAX_NR_IOREQ_SERVERS);
-    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
+    ASSERT(!s || !d->ioreq_server.server[id]);
 
-    d->arch.hvm.ioreq_server.server[id] = s;
+    d->ioreq_server.server[id] = s;
 }
 
 #define GET_IOREQ_SERVER(d, id) \
-    (d)->arch.hvm.ioreq_server.server[id]
+    (d)->ioreq_server.server[id]
 
 static struct ioreq_server *get_ioreq_server(const struct domain *d,
                                              unsigned int id)
@@ -285,7 +285,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     unsigned int id;
     bool found = false;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -296,7 +296,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
         }
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return found;
 }
@@ -606,7 +606,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
         return -ENOMEM;
 
     domain_pause(d);
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     for ( i = 0; i < MAX_NR_IOREQ_SERVERS; i++ )
     {
@@ -634,13 +634,13 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     if ( id )
         *id = i;
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
     domain_unpause(d);
 
     return 0;
 
  fail:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
     domain_unpause(d);
 
     xfree(s);
@@ -652,7 +652,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -684,7 +684,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -697,7 +697,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -731,7 +731,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -744,7 +744,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
 
     ASSERT(is_hvm_domain(d));
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -782,7 +782,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     }
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -798,7 +798,7 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     if ( start > end )
         return -EINVAL;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -834,7 +834,7 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     rc = rangeset_add_range(r, start, end);
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -850,7 +850,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     if ( start > end )
         return -EINVAL;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -886,7 +886,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     rc = rangeset_remove_range(r, start, end);
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -911,7 +911,7 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
     if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
         return -EINVAL;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -926,7 +926,7 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
     rc = arch_ioreq_server_map_mem_type(d, s, flags);
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -937,7 +937,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -961,7 +961,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
     return rc;
 }
 
@@ -971,7 +971,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
     unsigned int id;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -980,7 +980,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
             goto fail;
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return 0;
 
@@ -995,7 +995,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
         hvm_ioreq_server_remove_vcpu(s, v);
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -1005,12 +1005,12 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
     struct ioreq_server *s;
     unsigned int id;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
         hvm_ioreq_server_remove_vcpu(s, v);
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
 void hvm_destroy_all_ioreq_servers(struct domain *d)
@@ -1021,7 +1021,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     if ( !arch_ioreq_server_destroy_all(d) )
         return;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     /* No need to domain_pause() as the domain is being torn down */
 
@@ -1039,7 +1039,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
         xfree(s);
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
 struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
@@ -1271,7 +1271,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
 
 void hvm_ioreq_init(struct domain *d)
 {
-    spin_lock_init(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_init(&d->ioreq_server.lock);
 
     arch_ioreq_domain_init(d);
 }
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 1c4ca47..b8be1ad 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -63,8 +63,6 @@ struct hvm_pi_ops {
     void (*vcpu_block)(struct vcpu *);
 };
 
-#define MAX_NR_IOREQ_SERVERS 8
-
 struct hvm_domain {
     /* Guest page range used for non-default ioreq servers */
     struct {
@@ -73,12 +71,6 @@ struct hvm_domain {
         unsigned long legacy_mask; /* indexed by HVM param number */
     } ioreq_gfn;
 
-    /* Lock protects all other values in the sub-struct and the default */
-    struct {
-        spinlock_t              lock;
-        struct ioreq_server *server[MAX_NR_IOREQ_SERVERS];
-    } ioreq_server;
-
     /* Cached CF8 for guest PCI config cycles */
     uint32_t                pci_cf8;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a345cc0..62cbcdb 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -316,6 +316,8 @@ struct sched_unit {
 
 struct evtchn_port_ops;
 
+#define MAX_NR_IOREQ_SERVERS 8
+
 struct domain
 {
     domid_t          domain_id;
@@ -523,6 +525,14 @@ struct domain
     /* Argo interdomain communication support */
     struct argo_domain *argo;
 #endif
+
+#ifdef CONFIG_IOREQ_SERVER
+    /* Lock protects all other values in the sub-struct and the default */
+    struct {
+        spinlock_t              lock;
+        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
+    } ioreq_server;
+#endif
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.7.4


