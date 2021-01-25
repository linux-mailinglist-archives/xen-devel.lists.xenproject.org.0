Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF82302B2A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74306.133600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47F3-0000aw-03; Mon, 25 Jan 2021 19:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74306.133600; Mon, 25 Jan 2021 19:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47F2-0000a6-Rg; Mon, 25 Jan 2021 19:09:36 +0000
Received: by outflank-mailman (input) for mailman id 74306;
 Mon, 25 Jan 2021 19:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47F1-0008N7-GW
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:35 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e928a5-a02d-446b-840c-138bd6d88fb1;
 Mon, 25 Jan 2021 19:09:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g10so14126606wrx.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:02 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:00 -0800 (PST)
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
X-Inumbo-ID: 57e928a5-a02d-446b-840c-138bd6d88fb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WXYwiN3dYkxs2ItAbEK7clRgBID+kN/cztiUPQCB6UM=;
        b=Zzjx+qG0CtVKWbhpDzOa/ZbGehbgh0a5J3yewHX7TR06y/MA5aXWnRhxrpJEL378+R
         gxABx92HyCU1YGkZl9CxqK29y5aLpQOoTOh1hp6/njGwZNwQyS7ApHAUiU8RlpR5YSlc
         9g6YICYeHmK1zMtDhhMprunhCBZ8wRnuZBIJSbKfr800lebxKGeUfP2en9Npw58e9SgA
         vsJmmW3/kyi0U0XnkvXL7XkFMHMaNEVYjTzIqPE+9TyuqLRnZ5PbjP5fYoZ7jkZpKCTy
         qwwchDQfAyT/0oHNwMbZs//sw4L6h+9Ate7uTTEoCW6B8mh7BHmT7A2mPBSkc6fTE3Sc
         jfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WXYwiN3dYkxs2ItAbEK7clRgBID+kN/cztiUPQCB6UM=;
        b=NTCHJKJJbrvALhwQa0HciaYM0qCpKnt0bCoDpCrrxUe1MpAdWbydsNm1qfX+cfcy3n
         Lx61iBqWNIroh5jHe5GMdlRsDr7+iJft2awLEfsWF46ExbwJQEN4KUkVDz3w/bq6iNpB
         MfRdTCzJ2WIxMmyxmO8cN9TwRXgyRy08x1DO5Hz0RrfGILHok8W2qcM2PwsX6GeHCX9t
         7IhXdXdG+cuDIhKTwXk9n14iaaN2s9l4TKonBzIxBJ9C6gJ3ZYwk1mCstNxF9lBcliVh
         4mJVbcL5sEYoJSehqLfY3j+c3dAyk0ELExi9AxroT7YfDVk0yXrZMkaWb/n648GVhb+N
         kvhA==
X-Gm-Message-State: AOAM531IzOD9d7xDIHDZFCKugLcypNuBluZFagCkeAdeY7h5Jw5hm+1b
	LwY1b6HpOfJ4gF5itAd4bRJi+1zRmhxM+w==
X-Google-Smtp-Source: ABdhPJxMlQeyE6eQ2sYCm8DaJIzIl5PuEeAXb1GklBXXJsYAfCsff6PMXMzTZP16GF2R916XqXqQyg==
X-Received: by 2002:a05:6000:1142:: with SMTP id d2mr2596225wrx.307.1611601741237;
        Mon, 25 Jan 2021 11:09:01 -0800 (PST)
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
Subject: [PATCH V5 08/22] xen/ioreq: Move x86's ioreq_server to struct domain
Date: Mon, 25 Jan 2021 21:08:15 +0200
Message-Id: <1611601709-28361-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and this struct will be used
on Arm as is. Move it to common struct domain. This also
significantly reduces the layering violation in the common code
(*arch.hvm* usage).

We don't move ioreq_gfn since it is not used in the common code
(the "legacy" mechanism is x86 specific).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V3 -> V4:
   - rebase
   - drop the stale part of the comment above struct ioreq_server
   - add Jan's A-b

Changes V4 -> V5:
   - add Julien's, Alex's and Paul's R-b
---
---
 xen/common/ioreq.c               | 60 ++++++++++++++++++++--------------------
 xen/include/asm-x86/hvm/domain.h |  8 ------
 xen/include/xen/sched.h          | 10 +++++++
 3 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 7320f23..4cb26e6 100644
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
 
     if ( rc == 0 )
         arch_ioreq_server_map_mem_type_completed(d, s, flags);
@@ -940,7 +940,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -964,7 +964,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
     return rc;
 }
 
@@ -974,7 +974,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
     unsigned int id;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -983,7 +983,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
             goto fail;
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return 0;
 
@@ -998,7 +998,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
         hvm_ioreq_server_remove_vcpu(s, v);
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -1008,12 +1008,12 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
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
@@ -1024,7 +1024,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     if ( !arch_ioreq_server_destroy_all(d) )
         return;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     /* No need to domain_pause() as the domain is being torn down */
 
@@ -1042,7 +1042,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
         xfree(s);
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
 struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
@@ -1274,7 +1274,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
 
 void hvm_ioreq_init(struct domain *d)
 {
-    spin_lock_init(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_init(&d->ioreq_server.lock);
 
     arch_ioreq_domain_init(d);
 }
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 3b36c2f..b8be1ad 100644
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
-        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
-    } ioreq_server;
-
     /* Cached CF8 for guest PCI config cycles */
     uint32_t                pci_cf8;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index da19f4e..f437ee3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -318,6 +318,8 @@ struct sched_unit {
 
 struct evtchn_port_ops;
 
+#define MAX_NR_IOREQ_SERVERS 8
+
 struct domain
 {
     domid_t          domain_id;
@@ -534,6 +536,14 @@ struct domain
         unsigned int val;
         struct vcpu *vcpu;
     } teardown;
+
+#ifdef CONFIG_IOREQ_SERVER
+    /* Lock protects all other values in the sub-struct */
+    struct {
+        spinlock_t              lock;
+        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
+    } ioreq_server;
+#endif
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.7.4


