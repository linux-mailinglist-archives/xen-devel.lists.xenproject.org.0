Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4B309196
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78642.143228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gU2-00011G-3Z; Sat, 30 Jan 2021 02:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78642.143228; Sat, 30 Jan 2021 02:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gU1-000109-SY; Sat, 30 Jan 2021 02:59:33 +0000
Received: by outflank-mailman (input) for mailman id 78642;
 Sat, 30 Jan 2021 02:59:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gU0-0000YD-Qc
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c0b585b-f587-468e-bc95-4c5c8fe3e30e;
 Sat, 30 Jan 2021 02:59:13 +0000 (UTC)
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
X-Inumbo-ID: 2c0b585b-f587-468e-bc95-4c5c8fe3e30e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EqYl0Kb4/COUva2GRLaJjCYsAtWQEco55jqghSs9xRU=;
  b=a7H8g3sYNXSxEIlc3QNQDFoTJm6SNUtwZ0OJpoLRVCO9VQf2LNHezGlh
   iM7k0P+UMe91OmHmlwlC1I84gXL+ZfbSC9021phD0odwmS9NiKrTOaXej
   s2Ted7lBX2IKMT9s+OqoiWYMiM2yiz2Ai0FF/P46ftubng1z964Br6Vie
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ISuLahzRvGoRGi4NrvKUugJTJrfABpKQhnld6WCRriWnFjzGC6pCRZHfVsmb2dMD5Imm1sU2+m
 Xc3d3pYnvN1VyW4rNYjsbP+58qjbwneTEVVcV4FifCbzgoGWXgsy+M5S7ruJX6Ly6pOquyNSms
 qRKumJSOZPyjNnmNH21bUjXeGoFlXH7iPhGtc2IQ/6cIUeQF03jcPM08h7FVfmGxETAffthZ3I
 acB/+NfHK1dvleJX8BwDx/wZ7giqe8ZSbZ9gpYrCW/5G0EqcuYAAoqTczCLH5PvgNTp0at/LpA
 FjU=
X-SBRS: 5.1
X-MesageID: 36195186
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36195186"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v8 08/16] xen/domain: Add vmtrace_size domain creation parameter
Date: Sat, 30 Jan 2021 02:58:44 +0000
Message-ID: <20210130025852.12430-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

To use vmtrace, buffers of a suitable size need allocating, and different
tasks will want different sizes.

Add a domain creation parameter, and audit it appropriately in the
{arch_,}sanitise_domain_config() functions.

For now, the x86 specific auditing is tuned to Processor Trace running in
Single Output mode, which requires a single contiguous range of memory.

The size is given an arbitrary limit of 64M which is expected to be enough for
anticipated usecases, but not large enough to get into long-running-hypercall
problems.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

When support for later generations of IPT get added, we can in principle start
to use ToTP which is a scatter list of smaller trace regions to use, if we
need to massively up the buffer size available.

v8:
 * Rename vmtrace_frames to vmtrace_size.  Reposition to fill a hole.
 * Rename vmtrace.buf to vmtrace.pg.
 * Rework the refcounting logic and comment it *very* clearly.

v7:
 * Major chop&change within the series.
 * Use the name 'vmtrace' consistently.
 * Use the (new) common vcpu_teardown() functionality, rather than leaving a
   latent memory leak on ARM.
---
 xen/arch/x86/domain.c       | 23 +++++++++++++
 xen/common/domain.c         | 79 +++++++++++++++++++++++++++++++++++++++++++++
 xen/include/public/domctl.h |  3 ++
 xen/include/xen/sched.h     |  6 ++++
 4 files changed, 111 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b9ba04633e..6c7ee25f3b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -660,6 +660,29 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->vmtrace_size )
+    {
+        unsigned int size = config->vmtrace_size;
+
+        ASSERT(vmtrace_available); /* Checked by common code. */
+
+        /*
+         * For now, vmtrace is restricted to HVM guests, and using a
+         * power-of-2 buffer between 4k and 64M in size.
+         */
+        if ( !hvm )
+        {
+            dprintk(XENLOG_INFO, "vmtrace not supported for PV\n");
+            return -EINVAL;
+        }
+
+        if ( size < PAGE_SIZE || size > MB(64) || (size & (size - 1)) )
+        {
+            dprintk(XENLOG_INFO, "Unsupported vmtrace size: %#x\n", size);
+            return -EINVAL;
+        }
+    }
+
     return 0;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index d1e94d88cf..491b32812e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -132,6 +132,71 @@ static void vcpu_info_reset(struct vcpu *v)
     v->vcpu_info_mfn = INVALID_MFN;
 }
 
+static void vmtrace_free_buffer(struct vcpu *v)
+{
+    const struct domain *d = v->domain;
+    struct page_info *pg = v->vmtrace.pg;
+    unsigned int i;
+
+    if ( !pg )
+        return;
+
+    v->vmtrace.pg = NULL;
+
+    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
+    {
+        put_page_alloc_ref(&pg[i]);
+        put_page_and_type(&pg[i]);
+    }
+}
+
+static int vmtrace_alloc_buffer(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct page_info *pg;
+    unsigned int i;
+
+    if ( !d->vmtrace_size )
+        return 0;
+
+    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
+                             MEMF_no_refcount);
+    if ( !pg )
+        return -ENOMEM;
+
+    /*
+     * Getting the reference counting correct here is hard.
+     *
+     * All pages are now on the domlist.  They, or subranges within, will be
+     * freed when their reference count drops to zero, which may any time
+     * between now and the domain teardown path.
+     */
+
+    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
+        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
+            goto refcnt_err;
+
+    /*
+     * We must only let vmtrace_free_buffer() take any action in the success
+     * case when we've taken all the refs it intends to drop.
+     */
+    v->vmtrace.pg = pg;
+
+    return 0;
+
+ refcnt_err:
+    /*
+     * In the failure case, we must drop all the acquired typerefs thus far,
+     * skip vmtrace_free_buffer(), and leave domain_relinquish_resources() to
+     * drop the alloc refs on any remaining pages - some pages could already
+     * have been freed behind our backs.
+     */
+    while ( i-- )
+        put_page_and_type(&pg[i]);
+
+    return -ENODATA;
+}
+
 /*
  * Release resources held by a vcpu.  There may or may not be live references
  * to the vcpu, and it may or may not be fully constructed.
@@ -140,6 +205,8 @@ static void vcpu_info_reset(struct vcpu *v)
  */
 static int vcpu_teardown(struct vcpu *v)
 {
+    vmtrace_free_buffer(v);
+
     return 0;
 }
 
@@ -201,6 +268,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( sched_init_vcpu(v) != 0 )
         goto fail_wq;
 
+    if ( vmtrace_alloc_buffer(v) != 0 )
+        goto fail_wq;
+
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
@@ -449,6 +519,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
+    if ( config->vmtrace_size && !vmtrace_available )
+    {
+        dprintk(XENLOG_INFO, "vmtrace requested but not available\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
@@ -474,7 +550,10 @@ struct domain *domain_create(domid_t domid,
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
     if ( config )
+    {
         d->options = config->flags;
+        d->vmtrace_size = config->vmtrace_size;
+    }
 
     /* Sort out our idea of is_control_domain(). */
     d->is_privileged = is_priv;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf..88a5b1ef5d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -95,6 +95,9 @@ struct xen_domctl_createdomain {
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
+    /* Per-vCPU buffer size in bytes.  0 to disable. */
+    uint32_t vmtrace_size;
+
     struct xen_arch_domainconfig arch;
 };
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 06dba1a397..bc78a09a53 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -272,6 +272,10 @@ struct vcpu
     /* vPCI per-vCPU area, used to store data for long running operations. */
     struct vpci_vcpu vpci;
 
+    struct {
+        struct page_info *pg; /* One contiguous allocation of d->vmtrace_size */
+    } vmtrace;
+
     struct arch_vcpu arch;
 
 #ifdef CONFIG_IOREQ_SERVER
@@ -547,6 +551,8 @@ struct domain
         unsigned int guest_request_sync          : 1;
     } monitor;
 
+    unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */
+
 #ifdef CONFIG_ARGO
     /* Argo interdomain communication support */
     struct argo_domain *argo;
-- 
2.11.0


