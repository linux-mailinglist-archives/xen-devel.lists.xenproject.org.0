Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F22FF72F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72425.130413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUY-00055i-Mw; Thu, 21 Jan 2021 21:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72425.130413; Thu, 21 Jan 2021 21:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUY-00054a-Gi; Thu, 21 Jan 2021 21:27:46 +0000
Received: by outflank-mailman (input) for mailman id 72425;
 Thu, 21 Jan 2021 21:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUW-0004xo-Pn
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34d0ff5b-f912-4506-b4bd-4183fb09ef45;
 Thu, 21 Jan 2021 21:27:39 +0000 (UTC)
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
X-Inumbo-ID: 34d0ff5b-f912-4506-b4bd-4183fb09ef45
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ULMuNKqMqja/nwuazQayF1mJYFYLgopMHXg6OvP+G2w=;
  b=hiT0WFxFfwotWHZ6qCB/0HqnaRZ4WQHfV7UZEJnm2HfGJk/enjrLAHsu
   jIFza//YwTz+iiwJ1blaxnxf5048SCafVa35uiQ2ZtArnRF5b5zkVT89d
   ssMNhbNUnUIPU//bITCThDaYAj63I1KlIXFios/cvS2emxFJLJDeCDC+C
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pUDmeMzBzRUQ5LTuG7vLz88SRopKYd+75Ncm4urmXpHutgRACRYa+VamcvP0TWw/Fo1GROtlJr
 PWVvoh999Y1SDb/1b5WMtSn0ovR3pofDNrSEyOurvccaZqjK2y07Lh9NxCIyzDpyAYYGo37R6k
 dpJ5XK62w2YR88xMxstJlfkSG1aRTxITQ1/JI1KR5Nz2/JXExMSbHaaYHZxxsVRG2RwRwem3yo
 4L2ARqoLjqKd6PJONXwV7huOUiMpsqo5C8kO6Rtj9NYi14Enolf1VmD4V4RNDbfxgvMLNxc5zr
 z1Q=
X-SBRS: 5.1
X-MesageID: 35977341
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35977341"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v7 02/10] xen/domain: Add vmtrace_frames domain creation parameter
Date: Thu, 21 Jan 2021 21:27:10 +0000
Message-ID: <20210121212718.2441-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
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

v7:
 * Major chop&change within the series.
 * Use the name 'vmtrace' consistently.
 * Use the (new) common vcpu_teardown() functionality, rather than leaving a
   latent memory leak on ARM.
---
 xen/arch/x86/domain.c       | 23 +++++++++++++++++++
 xen/common/domain.c         | 56 +++++++++++++++++++++++++++++++++++++++++++++
 xen/include/public/domctl.h |  1 +
 xen/include/xen/sched.h     |  7 ++++++
 4 files changed, 87 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b9ba04633e..3f12d68e9e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -660,6 +660,29 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->vmtrace_frames )
+    {
+        unsigned int frames = config->vmtrace_frames;
+
+        ASSERT(vmtrace_available); /* Checked by common code. */
+
+        /*
+         * For now, vmtrace is restricted to HVM guests, and using a
+         * power-of-2 buffer up to 64M in size.
+         */
+        if ( !hvm )
+        {
+            dprintk(XENLOG_INFO, "vmtrace not supported for PV\n");
+            return -EINVAL;
+        }
+
+        if ( frames > (MB(64) >> PAGE_SHIFT) || (frames & (frames - 1)) )
+        {
+            dprintk(XENLOG_INFO, "Unsupported vmtrace frames: %u\n", frames);
+            return -EINVAL;
+        }
+    }
+
     return 0;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index d1e94d88cf..a844bc7b78 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -132,6 +132,48 @@ static void vcpu_info_reset(struct vcpu *v)
     v->vcpu_info_mfn = INVALID_MFN;
 }
 
+static void vmtrace_free_buffer(struct vcpu *v)
+{
+    const struct domain *d = v->domain;
+    struct page_info *pg = v->vmtrace.buf;
+    unsigned int i;
+
+    if ( !pg )
+        return;
+
+    for ( i = 0; i < d->vmtrace_frames; i++ )
+    {
+        put_page_alloc_ref(&pg[i]);
+        put_page_and_type(&pg[i]);
+    }
+
+    v->vmtrace.buf = NULL;
+}
+
+static int vmtrace_alloc_buffer(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct page_info *pg;
+    unsigned int i;
+
+    if ( !d->vmtrace_frames )
+        return 0;
+
+    pg = alloc_domheap_pages(d, get_order_from_pages(d->vmtrace_frames),
+                             MEMF_no_refcount);
+    if ( !pg )
+        return -ENOMEM;
+
+    v->vmtrace.buf = pg;
+
+    for ( i = 0; i < d->vmtrace_frames; i++ )
+        /* Domain can't know about this page yet - something fishy going on. */
+        if ( !get_page_and_type(&pg[i], d, PGT_writable_page) )
+            BUG();
+
+    return 0;
+}
+
 /*
  * Release resources held by a vcpu.  There may or may not be live references
  * to the vcpu, and it may or may not be fully constructed.
@@ -140,6 +182,8 @@ static void vcpu_info_reset(struct vcpu *v)
  */
 static int vcpu_teardown(struct vcpu *v)
 {
+    vmtrace_free_buffer(v);
+
     return 0;
 }
 
@@ -201,6 +245,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( sched_init_vcpu(v) != 0 )
         goto fail_wq;
 
+    if ( vmtrace_alloc_buffer(v) != 0 )
+        goto fail_wq;
+
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
@@ -449,6 +496,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
+    if ( config->vmtrace_frames && !vmtrace_available )
+    {
+        dprintk(XENLOG_INFO, "vmtrace requested but not available\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
@@ -474,7 +527,10 @@ struct domain *domain_create(domid_t domid,
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
     if ( config )
+    {
         d->options = config->flags;
+        d->vmtrace_frames = config->vmtrace_frames;
+    }
 
     /* Sort out our idea of is_control_domain(). */
     d->is_privileged = is_priv;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf..1585678d50 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -94,6 +94,7 @@ struct xen_domctl_createdomain {
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
+    uint32_t vmtrace_frames;
 
     struct xen_arch_domainconfig arch;
 };
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index da19f4e9f6..03905f6246 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -257,6 +257,10 @@ struct vcpu
     /* vPCI per-vCPU area, used to store data for long running operations. */
     struct vpci_vcpu vpci;
 
+    struct {
+        struct page_info *buf;
+    } vmtrace;
+
     struct arch_vcpu arch;
 };
 
@@ -470,6 +474,9 @@ struct domain
     unsigned    pbuf_idx;
     spinlock_t  pbuf_lock;
 
+    /* Used by vmtrace features */
+    uint32_t    vmtrace_frames;
+
     /* OProfile support. */
     struct xenoprof *xenoprof;
 
-- 
2.11.0


