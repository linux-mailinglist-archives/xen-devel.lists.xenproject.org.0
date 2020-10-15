Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AB28F713
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7579.19989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6Nf-0005Y5-VB; Thu, 15 Oct 2020 16:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7579.19989; Thu, 15 Oct 2020 16:45:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6Nf-0005XK-NP; Thu, 15 Oct 2020 16:45:31 +0000
Received: by outflank-mailman (input) for mailman id 7579;
 Thu, 15 Oct 2020 16:45:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6Ne-0004yr-64
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:30 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c3f3660-c6ec-4475-97e7-0649efa3f0a1;
 Thu, 15 Oct 2020 16:45:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f29so3870725ljo.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:00 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:58 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6Ne-0004yr-64
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:30 +0000
X-Inumbo-ID: 7c3f3660-c6ec-4475-97e7-0649efa3f0a1
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7c3f3660-c6ec-4475-97e7-0649efa3f0a1;
	Thu, 15 Oct 2020 16:45:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f29so3870725ljo.3
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/4N5432elpoCFCTQOFacUfSDjBxB67QedZM20URUDaY=;
        b=eXOMmNq1BoDmsLtsgbPKkshMqC5uNq7eP/4RsyTKNtjGB2u1Onj9Rvy9osZjcYZ6lG
         X8V6fniQ0m9KsZbJ/ohQFnFz55Ot8p7JUpBkpFlC9P+lFK+ndFFktGZorKuy1wW5kcvD
         Z836JZ3kv2CRw2dWI7IMc7hHmXu35RAJUMsUsejuARTeCgJbhrXwbfJDIocfGj5oBuDk
         rcvMeLf65qxUwC7pGZxFfyu9C1bOpTBRvjDng4YQPPViDIOB6i3Jnoixdu11en9Lv1SQ
         1TpqrJde0BzbzuzvtPVbIIvL2iDGFI+NpWWOaMZxcNVefkqqIZPkpk7ZkMEBNinQx3Iq
         SrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/4N5432elpoCFCTQOFacUfSDjBxB67QedZM20URUDaY=;
        b=OY3VyiqYSYdPIGs7UVg8fb+USTLowCstxJrNRtjf6aduqyw3ue6b28dDZ5Ys4xkUOd
         SfUrcyO8fXAylVFsI9pLqi8umlRO5RH4YrqSxzV081MyJHZMJ2oZEG4k231lVg6cmrB2
         LdAKa4gieQ6v3xagCeyfWNQPEarCsb7H1/P2sIv6c4uHp0U37lbEVHOXrqZcb3QB/acW
         mwkDLFmPMNb2O+V533u3C+wetDAJfps7lq68XDtZcDycqHQcgdYRf+3vNTCvpM19THbA
         cHAgRoi60qt/fYDP+u5LzugNyS/L8yfQ7qoYx83Ddw7L9c2m0IJIGZkgzk2IGjt26kaQ
         rWDg==
X-Gm-Message-State: AOAM530qlLalFOnfPDdH5FX8jp7mxJowCLG/mO3pHswCEIWYIE74UQk2
	2a24sd1n25kkQaPxCFt3kC73QYIcy6+AAQ==
X-Google-Smtp-Source: ABdhPJyGbG38G+DinLf0m/SSKtu4fphOzSZb8YAqDDXWMGNemxvpmbSJY6E4O5YzMID/CuL1sbHY2A==
X-Received: by 2002:a2e:b557:: with SMTP id a23mr1746654ljn.5.1602780299477;
        Thu, 15 Oct 2020 09:44:59 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:58 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 07/23] xen/ioreq: Move x86's ioreq_gfn(server) to struct domain
Date: Thu, 15 Oct 2020 19:44:18 +0300
Message-Id: <1602780274-29141-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these structs will be used
on Arm as is. Move them to common struct domain. This also
significantly reduces the layering violation in the common code
(*arch.hvm* usage).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch
---
 xen/arch/x86/hvm/hvm.c           | 12 +++----
 xen/common/ioreq.c               | 72 ++++++++++++++++++++--------------------
 xen/include/asm-x86/hvm/domain.h | 15 ---------
 xen/include/asm-x86/hvm/ioreq.h  |  4 +--
 xen/include/xen/sched.h          | 17 ++++++++++
 5 files changed, 61 insertions(+), 59 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 54e32e4..20376ce 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4218,20 +4218,20 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
             rc = -EINVAL;
         break;
     case HVM_PARAM_IOREQ_SERVER_PFN:
-        d->arch.hvm.ioreq_gfn.base = value;
+        d->ioreq_gfn.base = value;
         break;
     case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
     {
         unsigned int i;
 
         if ( value == 0 ||
-             value > sizeof(d->arch.hvm.ioreq_gfn.mask) * 8 )
+             value > sizeof(d->ioreq_gfn.mask) * 8 )
         {
             rc = -EINVAL;
             break;
         }
         for ( i = 0; i < value; i++ )
-            set_bit(i, &d->arch.hvm.ioreq_gfn.mask);
+            set_bit(i, &d->ioreq_gfn.mask);
 
         break;
     }
@@ -4239,11 +4239,11 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     case HVM_PARAM_IOREQ_PFN:
     case HVM_PARAM_BUFIOREQ_PFN:
         BUILD_BUG_ON(HVM_PARAM_IOREQ_PFN >
-                     sizeof(d->arch.hvm.ioreq_gfn.legacy_mask) * 8);
+                     sizeof(d->ioreq_gfn.legacy_mask) * 8);
         BUILD_BUG_ON(HVM_PARAM_BUFIOREQ_PFN >
-                     sizeof(d->arch.hvm.ioreq_gfn.legacy_mask) * 8);
+                     sizeof(d->ioreq_gfn.legacy_mask) * 8);
         if ( value )
-            set_bit(index, &d->arch.hvm.ioreq_gfn.legacy_mask);
+            set_bit(index, &d->ioreq_gfn.legacy_mask);
         break;
 
     case HVM_PARAM_X87_FIP_WIDTH:
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 1d62d13..7f91bc2 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -37,13 +37,13 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
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
 
 struct ioreq_server *get_ioreq_server(const struct domain *d,
                                       unsigned int id)
@@ -222,7 +222,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
 
     for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
     {
-        if ( !test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
+        if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
             return _gfn(d->arch.hvm.params[i]);
     }
 
@@ -234,10 +234,10 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
     struct domain *d = s->target;
     unsigned int i;
 
-    for ( i = 0; i < sizeof(d->arch.hvm.ioreq_gfn.mask) * 8; i++ )
+    for ( i = 0; i < sizeof(d->ioreq_gfn.mask) * 8; i++ )
     {
-        if ( test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.mask) )
-            return _gfn(d->arch.hvm.ioreq_gfn.base + i);
+        if ( test_and_clear_bit(i, &d->ioreq_gfn.mask) )
+            return _gfn(d->ioreq_gfn.base + i);
     }
 
     /*
@@ -261,21 +261,21 @@ static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
     if ( i > HVM_PARAM_BUFIOREQ_PFN )
         return false;
 
-    set_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask);
+    set_bit(i, &d->ioreq_gfn.legacy_mask);
     return true;
 }
 
 static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
 {
     struct domain *d = s->target;
-    unsigned int i = gfn_x(gfn) - d->arch.hvm.ioreq_gfn.base;
+    unsigned int i = gfn_x(gfn) - d->ioreq_gfn.base;
 
     ASSERT(!gfn_eq(gfn, INVALID_GFN));
 
     if ( !hvm_free_legacy_ioreq_gfn(s, gfn) )
     {
-        ASSERT(i < sizeof(d->arch.hvm.ioreq_gfn.mask) * 8);
-        set_bit(i, &d->arch.hvm.ioreq_gfn.mask);
+        ASSERT(i < sizeof(d->ioreq_gfn.mask) * 8);
+        set_bit(i, &d->ioreq_gfn.mask);
     }
 }
 
@@ -400,7 +400,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     unsigned int id;
     bool found = false;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -411,7 +411,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
         }
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return found;
 }
@@ -781,7 +781,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
         return -ENOMEM;
 
     domain_pause(d);
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     for ( i = 0; i < MAX_NR_IOREQ_SERVERS; i++ )
     {
@@ -809,13 +809,13 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
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
@@ -827,7 +827,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -859,7 +859,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -872,7 +872,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -906,7 +906,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -919,7 +919,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
 
     ASSERT(is_hvm_domain(d));
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -957,7 +957,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     }
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -973,7 +973,7 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     if ( start > end )
         return -EINVAL;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -1009,7 +1009,7 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     rc = rangeset_add_range(r, start, end);
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -1025,7 +1025,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     if ( start > end )
         return -EINVAL;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -1061,7 +1061,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     rc = rangeset_remove_range(r, start, end);
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -1072,7 +1072,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -1096,7 +1096,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
     return rc;
 }
 
@@ -1106,7 +1106,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
     unsigned int id;
     int rc;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -1115,7 +1115,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
             goto fail;
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return 0;
 
@@ -1130,7 +1130,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
         hvm_ioreq_server_remove_vcpu(s, v);
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -1140,12 +1140,12 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
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
@@ -1156,7 +1156,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     if ( !arch_hvm_ioreq_destroy(d) )
         return;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     /* No need to domain_pause() as the domain is being torn down */
 
@@ -1174,7 +1174,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
         xfree(s);
     }
 
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
 struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
@@ -1406,7 +1406,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
 
 void hvm_ioreq_init(struct domain *d)
 {
-    spin_lock_init(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_init(&d->ioreq_server.lock);
 
     arch_hvm_ioreq_init(d);
 }
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 3b36c2f..5d60737 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -63,22 +63,7 @@ struct hvm_pi_ops {
     void (*vcpu_block)(struct vcpu *);
 };
 
-#define MAX_NR_IOREQ_SERVERS 8
-
 struct hvm_domain {
-    /* Guest page range used for non-default ioreq servers */
-    struct {
-        unsigned long base;
-        unsigned long mask; /* indexed by GFN minus base */
-        unsigned long legacy_mask; /* indexed by HVM param number */
-    } ioreq_gfn;
-
-    /* Lock protects all other values in the sub-struct and the default */
-    struct {
-        spinlock_t              lock;
-        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
-    } ioreq_server;
-
     /* Cached CF8 for guest PCI config cycles */
     uint32_t                pci_cf8;
 
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index d2d64a8..0fccac5 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -77,7 +77,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
     if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
         return -EINVAL;
 
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_lock_recursive(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -92,7 +92,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
     rc = p2m_set_ioreq_server(d, flags, s);
 
  out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    spin_unlock_recursive(&d->ioreq_server.lock);
 
     if ( rc == 0 && flags == 0 )
     {
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d8ed83f..78761cd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -314,6 +314,8 @@ struct sched_unit {
 
 struct evtchn_port_ops;
 
+#define MAX_NR_IOREQ_SERVERS 8
+
 struct domain
 {
     domid_t          domain_id;
@@ -521,6 +523,21 @@ struct domain
     /* Argo interdomain communication support */
     struct argo_domain *argo;
 #endif
+
+#ifdef CONFIG_IOREQ_SERVER
+    /* Guest page range used for non-default ioreq servers */
+    struct {
+        unsigned long base;
+        unsigned long mask;
+        unsigned long legacy_mask; /* indexed by HVM param number */
+    } ioreq_gfn;
+
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


