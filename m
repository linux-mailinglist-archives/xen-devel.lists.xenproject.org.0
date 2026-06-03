Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VSVTAeEmIGqoxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0E637DD6
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sq+qKER7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326238.1591749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIn-0007mE-8p; Wed, 03 Jun 2026 13:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326238.1591749; Wed, 03 Jun 2026 13:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIn-0007h7-1v; Wed, 03 Jun 2026 13:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1326238;
 Wed, 03 Jun 2026 13:06:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIl-0007Kr-1A
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIk-00Fz4z-Dt
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d4-5cb7-0a2a0a5109dd-0a2a4507892e-12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:30 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d6-229c-0a2a45070019-d1558033b1f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:30 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso9395445e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:30 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:29 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491990; x=1781096790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL0N3KKHtVrvo4ntoGJtN+QrR4yck3sAmYsmSdPB7So=;
        b=sq+qKER79/oD4gYV7VydoZGgdzu+oAKmQCr1Uzgvv7ngbZ7Shg4EfpPBKkcG7dFG10
         keA0372FZkxS16s8wfM44cJ3UkDP3OzFgrwfW0QolTXb2lcPZZ71BpF7x2EWAbjYpIJz
         /WZtJJbgEqcqKgM+XNQYamNrelCuItvoEwX3qnk0q7wJgYPwCyTtAk9jvtNgZSHNfXCM
         pF7s+v2eqfMKdMFIm8CgDtt21LijlLnJ7XrRSF4170zxe/nx1pPOjhzeuHRI+1eZqrNh
         m+y5fi0g4F2TdgK4zLBxeeaigy9WipA2LVSInj632z/HRADkqwWanyqteNLXh9q+ge9e
         k1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491990; x=1781096790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UL0N3KKHtVrvo4ntoGJtN+QrR4yck3sAmYsmSdPB7So=;
        b=ef8N16gpnizmKNe+gGs07fdHE2q+f8FhCWRzOm3WFO1tItva+PFGoRcxOv9hMLhHn7
         pCqogIIGELNk3v35aZ7RYErbkTWN3DA0XjggpC+45ljTZHEFctlQzZ1m14JlLiSSphdm
         DNbE/CCnPp+GmR6uMJRJ0QhAbdX7aPohCcLYBsXihH1dzWTIPnd7+Y2Lm508EOQjyLJL
         XhYtWqIzySamTWIbR4XlThGcR+PVXJvpA0y3zTmOFhd4bWap54MU4rv2bLEm2r2yqqr+
         LZVcJHbIR2wC96u9s3ElKum0H4o3+ghld+yRcjAvNBMIg4IW4SBK0fjj2mPwjAHHQhnO
         a5+g==
X-Gm-Message-State: AOJu0YyPieG9VXnSOjSBh/rCLeXYLLyTC0/WZPAmyU4aJ+CL3pAkNwOV
	HO4g87pMIzHhxMX8iYXPSErqCI94NWF5QNaRdCTe2X6UPAoTLBu4YTRxVoejdJjQ
X-Gm-Gg: Acq92OHVpmSiawF9NKbWnk3jv+uryUqtaxb9+YI195IjnZwF9zgY8xLZL8wlZgQEgnK
	ObNnFEB/7xqOooLZoCOax/+VT4plFFWvcRUCmdf04GziX1YvFzSI4zC12Sq8tVxb6u15MYUQVwv
	mjznohvTc0qISnmIrfdZDA3KpeijiCsX4ik9iUirQ4nIaTy/LRFuW+wUs4M25HJeAdiU1uCXVJ6
	NsA0MPi748lAHloK0f8XwhaulrzWqG8ACtBKjj3LwlRU+vKbgfM9LMVuFaGtUtZYp4sFSDDIkOE
	2SPAbMXwVuyelYjqYaAzsu48uWOb2KHR8WT6WpNu7bWzseDwOUmqJoFtxMFYTOjqm4yP/coD+aD
	A+RRvjzUqPgwv7UIVp/dAeQHchYrd4Jzwg5QpJm9rv7tHcEzJzWUHc8nKXrnblYg0SsLB+zgPq8
	YtuZR5Isux4DAqyKWq9EWIpDZRquMO1Pbip/9jjipOHqKja9gWDyZU+iQCB9vQCDzG0uJWfG3oO
	c4eZDVO2z/9ip3IS5e+UL5UA8U0f4pXlPeS
X-Received: by 2002:a05:600c:810c:b0:490:47e3:929a with SMTP id 5b1f17b1804b1-490b5e7961fmr59382775e9.6.1780491989710;
        Wed, 03 Jun 2026 06:06:29 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 12/16] xen: implement new foreign copy hypercall
Date: Wed,  3 Jun 2026 14:05:59 +0100
Message-ID: <20260603130603.776452-13-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780491990-0AD77C48-08B014AF/0/0
X-purgate-type: clean
X-purgate-size: 6426
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DF0E637DD6

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Add a sub hypercall to __HYPERVISOR_memory_op to allow to
read/write memory from/to a foreign domain.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 xen/common/memory.c         | 133 ++++++++++++++++++++++++++++++++++++
 xen/include/public/memory.h |  40 ++++++++++-
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3672bda025..6a2d9c3190 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1545,6 +1545,132 @@ static int acquire_resource(
     return rc;
 }
 
+/*
+ * The "noinline" qualifier avoid the compiler to create a large function
+ * consuming quite a lot of stack.
+ */
+static int noinline mem_foreigncopy(
+    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
+{
+    struct domain *d, *const currd = current->domain;
+    xen_foreigncopy_t copy;
+    int rc, direction;
+
+    if ( !arch_acquire_resource_check(currd) )
+        return -EACCES;
+
+    if ( copy_from_guest(&copy, arg, 1) )
+        return -EFAULT;
+
+    if ( copy.flags & ~1u )
+        return -EINVAL;
+
+    direction = copy.flags & XENMEM_foreigncopy_direction;
+
+    if ( copy.nr_frames == 0 )
+        return 0;
+
+    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
+    if ( rc )
+        return rc;
+
+    /*
+     * Check we are allowed to map and access these foreign pages.
+     */
+    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
+    if ( rc )
+        goto out;
+
+    do {
+        /*
+         * Arbitrary size.  Not too much stack space, and a reasonable stride
+         * for continuation checks.
+         */
+        xen_pfn_t gfn_list[32];
+        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
+
+        rc = -EFAULT;
+        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
+            goto out;
+
+        for ( unsigned i = 0; i < todo; i++ )
+        {
+            struct page_info *foreign_page;
+            void *foreign;
+            p2m_type_t p2mt;
+
+            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
+
+            if ( unlikely(p2mt != p2m_ram_rw
+#ifdef CONFIG_X86
+                 && p2mt != p2m_ram_logdirty
+#endif
+                 ) && foreign_page )
+            {
+                put_page(foreign_page);
+                foreign_page = NULL;
+            }
+            if ( unlikely(!foreign_page) )
+            {
+                gdprintk(XENLOG_WARNING,
+                         "Error accessing foreign mfn %" PRI_mfn "\n",
+                         gfn_list[i]);
+                rc = -EINVAL;
+                copy.nr_frames -= i;
+                guest_handle_add_offset(copy.frame_list, i);
+                goto out;
+            }
+
+            /* A page is dirtied when it's being copied to. */
+            if ( direction == XENMEM_foreigncopy_to )
+                paging_mark_dirty(d, page_to_mfn(foreign_page));
+
+            foreign = map_domain_page(page_to_mfn(foreign_page));
+            if ( direction == XENMEM_foreigncopy_from )
+                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
+            else
+                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
+            unmap_domain_page(foreign);
+            put_page(foreign_page);
+
+            if ( unlikely(rc) )
+            {
+                gdprintk(XENLOG_WARNING,
+                         "Error copying to mfn %" PRI_mfn "\n", gfn_list[i]);
+                copy.nr_frames -= i;
+                guest_handle_add_offset(copy.frame_list, i);
+                goto out;
+            }
+
+            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
+        }
+
+        copy.nr_frames -= todo;
+        guest_handle_add_offset(copy.frame_list, todo);
+
+        if ( copy.nr_frames && hypercall_preempt_check() )
+        {
+            rc = hypercall_create_continuation(
+                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
+            goto out;
+        }
+    } while ( copy.nr_frames );
+
+    rc = 0;
+
+ out:
+    rcu_unlock_domain(d);
+
+    /* Update in all cases, it allows the caller to know how many
+     * frames were successfully copied and the continuation to
+     * continue correctly.
+     */
+    if ( copy_to_guest(arg, &copy, 1) )
+        rc = -EFAULT;
+
+    return rc;
+}
+
 long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d, *curr_d = current->domain;
@@ -2012,6 +2138,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             start_extent);
         break;
 
+    case XENMEM_foreigncopy:
+        if ( unlikely(start_extent) )
+            return -EINVAL;
+
+        rc = mem_foreigncopy(guest_handle_cast(arg, xen_foreigncopy_t));
+        break;
+
     default:
         rc = arch_memory_op(cmd, arg);
         break;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b52..b48d1f378f 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
 typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
 DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
 
-/* Next available subop number is 29 */
+/*
+ * Copy memory from/to a given domain.
+ */
+#define XENMEM_foreigncopy 29
+struct xen_foreigncopy {
+    /* IN - The domain whose resource is to be copied. */
+    domid_t domid;
+
+    /* IN - Flags. */
+#define XENMEM_foreigncopy_from 0
+#define XENMEM_foreigncopy_to 1
+#define XENMEM_foreigncopy_direction 1
+    uint16_t flags;
+
+    /*
+     * IN
+     *
+     * As an IN parameter number of frames of the domain to be copied.
+     */
+    uint32_t nr_frames;
+
+    /*
+     * IN
+     *
+     * Frames to be copied.
+     */
+    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
+
+    /*
+     * IN/OUT
+     *
+     * Userspace buffer to read/write from.
+     */
+    XEN_GUEST_HANDLE(uint8) buffer;
+};
+typedef struct xen_foreigncopy xen_foreigncopy_t;
+DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);
+
+/* Next available subop number is 30 */
 
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
 
-- 
2.54.0


