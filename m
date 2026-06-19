Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GVqxFLI+NWqHpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294A6A5F30
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EJ8dzguC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342210.1602512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuW-0003I0-E3; Fri, 19 Jun 2026 13:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342210.1602512; Fri, 19 Jun 2026 13:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuW-0003AG-2E; Fri, 19 Jun 2026 13:05:28 +0000
Received: by outflank-mailman (input) for mailman id 1342210;
 Fri, 19 Jun 2026 13:05:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuT-0002g9-Sb
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuT-00D4eo-8R
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-2eae-0a2a0a5409dd-0a2a450ba98e-42
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:25 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e95-5e53-0a2a450b0019-d155d031d165-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:25 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f35so3063436a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:25 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874325; x=1782479125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4GbNTJWWlsCX/SdHZdLeLVQ6qJfL6Y1RCmWUuA0EmY=;
        b=EJ8dzguCRr6U8zSKQmMMdzyLHRyT2qiVRwecqJV3Zd6o4phmjfmw18EDCwfkpwmS95
         9X4C723tFtgvnohIFXUkBWuqx0Kh29842nBLhtPTP9zTB+qppxU9+4km/hDcJ1z9KBey
         bUXLLS4EThkhpBfyJGpISxitIQJTWn4HpsT6ZwBjAVeL6XvxJOFbESTfYnCwC4Bwsi4d
         HXg/BoGNOfQ4rHqK40RUy5Km2vS5UhnLcgv8DsmWyrKvdxwO33v2Gpv551aaKGMFeRlO
         Hj0QWurEG0PONphN1k4jUMCMIEMO+IUdP3x/9c1GK5EDbL4qYS7DvXOYfRm0y00riIrj
         cvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874325; x=1782479125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4GbNTJWWlsCX/SdHZdLeLVQ6qJfL6Y1RCmWUuA0EmY=;
        b=Ohb7a4O3SPd5iv1dxs1+ZMt/YmfRMr2BE5CUNk6VeIM0eDkINoNSefvVnwK2BqPfVO
         VZExhF0R4C/L4u8SaPjTYRZG89SYidc4IBFPzt8pk+yJqWb4hJRvsAcwUFUurZwlhEj2
         ARlZ88hB43q0+W8KsCT2vkZX5hig/Xlg9xlpEFWBGnNAT7/7oiGSrIr/XsTgEHruVEH2
         NbZOXJPtT52g0xxT5DGn5m+z7NW+vWpKeVA2HxMMYz+xBU5RqQUUtPMvblqAj4jfdQZ6
         T+r4cODWP2Yd+HPKzdrlE15lunlyldCcgerR6hF6NyVUr4yXlrieOjIQbQGqnAfVaEjo
         KvcQ==
X-Gm-Message-State: AOJu0YwIeerq7fAxRWAWC8UtfwSu8ebwFG2TxZCp8xYOcX9TWXy4zKib
	EE2yaUZsrjjppUAxYkzJ211ldwhA9weWqhUb8bc0xxFXRu8lOONTz1crGWNAg678nJM=
X-Gm-Gg: AfdE7cnjmDDqxCC2pjBmbNCGL+O8arH2a9joeyqC3O28Ax/S8gkEgie+SAfeG0DvwA7
	xLYKr991M9jra1Uj6JstuJVxQI9EuydT4Vcj2/eE5hsk0CCevLEE5CHRKikb5brI8TT5ioEP0cU
	FtR8iDhJ2CTGoSRj3dC+emARBwk+uBvIMortbh4vYMgBxbTEPwPhxkVpUaIIxwcsIL/l/U3XmMg
	g5buaw032wVZYNqjHNfBoclyjzcrfP2ectzD3NJICs5ti7VTGmbd/NcVEJCeCrJhoqbUP4WkJFo
	UfT9ty16b5xNGzjsPByeqITnRfH0KTdEW3tbCPjRRLDH8cmbBwvXfAxrnLgzb1fgeD8pq9ObZE3
	Rmc1PL3wEoCpsJp1TVMF3zvpuIhO2skPGNuUe93VLZffr1WxayHPMoUunkt5Ou+hzvv+PCJ+TLC
	Jt8xDTtWvaXif0DbE3OW4lmpzl9vPuyxfS/445O2NCQNXfoEe4NtSimpotYpcQFXpOeNimeUCzY
	lMfJWU6
X-Received: by 2002:a17:907:d01:b0:bfe:ed06:5a14 with SMTP id a640c23a62f3a-c0986e2ad05mr195244766b.50.1781874324572;
        Fri, 19 Jun 2026 06:05:24 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 12/16] xen: implement new foreign copy hypercall
Date: Fri, 19 Jun 2026 14:04:57 +0100
Message-ID: <20260619130501.272832-13-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781874325-4FBEF00E-1715F220/0/0
X-purgate-type: clean
X-purgate-size: 7582
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0294A6A5F30

Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
memory from/to a foreign domain.

Extending MMUEXT_COPY_PAGE seems better on first sight but considering
that MMUEXT is meant for PV only and trying to change that sub-op this
solution is better.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v4:
- Fix typo in comment.

Changes since v5:
- update xen_foreigncopy structure comments;
- move check for no frames after checking the domain;
- use mnemonic instead of 1U;
- fix page type checks;
- do not overwrite error copying back structure;
- latch MFN value;
- improved commit message.
---
 xen/common/memory.c         | 145 ++++++++++++++++++++++++++++++++++++
 xen/include/public/memory.h |  44 ++++++++++-
 2 files changed, 188 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3672bda025..98726766bf 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1545,6 +1545,139 @@ static int acquire_resource(
     return rc;
 }
 
+/*
+ * The "noinline" qualifier avoids the compiler to create a large function
+ * consuming quite a lot of stack.
+ */
+static int noinline mem_foreigncopy(
+    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
+{
+    struct domain *d, *const currd = current->domain;
+    xen_foreigncopy_t copy;
+    int rc, direction;
+
+    if ( copy_from_guest(&copy, arg, 1) )
+        return -EFAULT;
+
+    if ( copy.flags & ~XENMEM_foreigncopy_direction )
+        return -EINVAL;
+
+    direction = copy.flags & XENMEM_foreigncopy_direction;
+
+    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
+    if ( rc )
+        return rc;
+
+    if ( copy.nr_frames == 0 )
+    {
+        rcu_unlock_domain(d);
+        return 0;
+    }
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
+        for ( unsigned int i = 0; i < todo; i++ )
+        {
+            struct page_info *foreign_page;
+            mfn_t foreign_mfn;
+            void *foreign;
+            p2m_type_t p2mt;
+            const unsigned long valid_mask =
+#ifdef CONFIG_X86
+                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
+#else
+                p2m_to_mask(p2m_ram_rw);
+#endif
+
+            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
+
+            if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )
+            {
+                put_page(foreign_page);
+                foreign_page = NULL;
+            }
+            if ( unlikely(!foreign_page) )
+            {
+                gdprintk(XENLOG_WARNING,
+                         "Error accessing foreign gfn %" PRI_gfn "\n",
+                         gfn_list[i]);
+                rc = -EINVAL;
+                copy.nr_frames -= i;
+                guest_handle_add_offset(copy.frame_list, i);
+                goto out;
+            }
+
+            foreign_mfn = page_to_mfn(foreign_page);
+
+            /* A page is dirtied when it's being copied to. */
+            if ( direction == XENMEM_foreigncopy_to )
+                paging_mark_dirty(d, foreign_mfn);
+
+            foreign = map_domain_page(foreign_mfn);
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
+                         "Error %d copying gfn %" PRI_gfn "\n",
+                         -rc, gfn_list[i]);
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
+    /*
+     * Update in all cases, it allows the caller to know how many
+     * frames were successfully copied and the continuation to
+     * continue correctly.
+     */
+    if ( __copy_to_guest(arg, &copy, 1) && rc >= 0 )
+        rc = -EFAULT;
+
+    return rc;
+}
+
 long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d, *curr_d = current->domain;
@@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             start_extent);
         break;
 
+    case XENMEM_foreigncopy:
+        /*
+         * Instead of using "start_extent" we update the structure back,
+         * we update it back in anyway to tell caller were the copy
+         * stopped.
+         */
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
index bd9fc37b52..dbf86fd595 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -740,7 +740,49 @@ struct xen_vnuma_topology_info {
 typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
 DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
 
-/* Next available subop number is 29 */
+/*
+ * Copy memory from/to a given domain.
+ * As this call requires target access and guest with target access won't be
+ * compat guests supported for compat guests this is not implemented.
+ */
+#define XENMEM_foreigncopy 29
+struct xen_foreigncopy {
+    /* IN - The domain whose memory is to be copied. */
+    domid_t domid;
+
+    /* IN - Flags. */
+#define XENMEM_foreigncopy_from 0
+#define XENMEM_foreigncopy_to 1
+#define XENMEM_foreigncopy_direction 1
+    uint16_t flags;
+
+    /*
+     * IN/OUT
+     *
+     * As an IN parameter number of frames of the domain to be copied.
+     * On output on error updated number of frames left.
+     */
+    uint32_t nr_frames;
+
+    /*
+     * IN/OUT
+     *
+     * Frames to be copied.
+     * On output on error updated to point to first frame unhandled.
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
2.43.0


