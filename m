Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFlWHLa5jGlJsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:17:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406B1268B7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228066.1534460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDqD-0001ke-6q; Wed, 11 Feb 2026 17:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228066.1534460; Wed, 11 Feb 2026 17:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDqD-0001hS-1x; Wed, 11 Feb 2026 17:17:29 +0000
Received: by outflank-mailman (input) for mailman id 1228066;
 Wed, 11 Feb 2026 17:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDp1-0004tt-Lr
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5d6d71a8-076d-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:16:12 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA4F0339;
 Wed, 11 Feb 2026 09:16:05 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12D563F63F;
 Wed, 11 Feb 2026 09:16:10 -0800 (PST)
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
X-Inumbo-ID: 5d6d71a8-076d-11f1-b162-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 11/12] xen/arm: ffa: Add MEM_SHARE page diagnostics
Date: Wed, 11 Feb 2026 18:15:35 +0100
Message-ID: <4fa6736cbe35b060cf34b2978bbf9b3481d9266a.1770826406.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770826406.git.bertrand.marquis@arm.com>
References: <cover.1770826406.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 2406B1268B7
X-Rspamd-Action: no action

MEM_SHARE failures in get_shm_pages() are silent, which makes malformed
ranges and page mapping failures hard to diagnose.

Add debug logging for page validation failures:
- descriptor validation failures (unaligned, range short/overflow)
- per-page mapping failures (unmapped GFN, wrong p2m type)
- address overflow detection in range walks

Ratelimit temporary reclaim failures and log permanent reclaim failures
as errors.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- use one print per error case instead of the previous system using
  variables to classify and a single print site.
---
 xen/arch/arm/tee/ffa_shm.c | 39 +++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 070babce9627..3d61caaeba78 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -161,32 +161,62 @@ static int32_t get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
         addr = ACCESS_ONCE(range[n].address);
 
         if ( !IS_ALIGNED(addr, FFA_PAGE_SIZE) )
+        {
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: mem share pages invalid: unaligned range %u address %#lx\n",
+                     n, (unsigned long)addr);
             return FFA_RET_INVALID_PARAMETERS;
+        }
 
         for ( m = 0; m < page_count; m++ )
         {
             if ( pg_idx >= shm->page_count )
+            {
+                gdprintk(XENLOG_DEBUG,
+                         "ffa: mem share pages invalid: range overflow rg %u pg %u\n",
+                         n, m);
                 return FFA_RET_INVALID_PARAMETERS;
+            }
 
             if ( !ffa_safe_addr_add(addr, m) )
+            {
+                gdprintk(XENLOG_DEBUG,
+                         "ffa: mem share pages invalid: addr overflow rg %u pg %u base %#lx\n",
+                         n, m, (unsigned long)addr);
                 return FFA_RET_INVALID_PARAMETERS;
+            }
 
             gaddr = addr + m * FFA_PAGE_SIZE;
             gfn = gaddr_to_gfn(gaddr);
             shm->pages[pg_idx] = get_page_from_gfn(d, gfn_x(gfn), &t,
 						   P2M_ALLOC);
             if ( !shm->pages[pg_idx] )
+            {
+                gdprintk(XENLOG_DEBUG,
+                         "ffa: mem share pages invalid: gfn unmapped rg %u pg %u addr %#lx\n",
+                         n, m, (unsigned long)gaddr);
                 return FFA_RET_DENIED;
+            }
             /* Only normal RW RAM for now */
             if ( t != p2m_ram_rw )
+            {
+                gdprintk(XENLOG_DEBUG,
+                         "ffa: mem share pages invalid: p2m type %u rg %u pg %u addr %#lx\n",
+                         t, n, m, (unsigned long)gaddr);
                 return FFA_RET_DENIED;
+            }
             pg_idx++;
         }
     }
 
     /* The ranges must add up */
     if ( pg_idx < shm->page_count )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: mem share pages invalid: range short pg %u\n",
+                 pg_idx);
         return FFA_RET_INVALID_PARAMETERS;
+    }
 
     return FFA_RET_OK;
 }
@@ -741,8 +771,10 @@ bool ffa_shm_domain_destroy(struct domain *d)
              * A temporary error that may get resolved a bit later, it's
              * worth retrying.
              */
-            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
-                   d, shm->handle, res);
+            if ( printk_ratelimit() )
+                printk(XENLOG_G_WARNING
+                       "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
+                       d, shm->handle, res);
             break; /* We will retry later */
         default:
             /*
@@ -754,7 +786,8 @@ bool ffa_shm_domain_destroy(struct domain *d)
              * FFA_RET_NO_MEMORY might be a temporary error as it it could
              * succeed if retried later, but treat it as permanent for now.
              */
-            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim handle %#lx : %d\n",
+            printk(XENLOG_G_ERR
+                   "%pd: ffa: Permanent failure to reclaim handle %#lx : %d\n",
                    d, shm->handle, res);
 
             /*
-- 
2.52.0


