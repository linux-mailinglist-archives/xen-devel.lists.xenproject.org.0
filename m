Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0537F1680
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636972.992686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hd-00009u-EW; Mon, 20 Nov 2023 14:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636972.992686; Mon, 20 Nov 2023 14:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hd-0008Uc-9g; Mon, 20 Nov 2023 14:56:45 +0000
Received: by outflank-mailman (input) for mailman id 636972;
 Mon, 20 Nov 2023 14:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r55hb-0008PM-Oj
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:56:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0179c436-87b5-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 15:56:40 +0100 (CET)
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
X-Inumbo-ID: 0179c436-87b5-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700492199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0pubRcIMm5BDoQD5UTgfI84P4ODA1vnZq+5DPaO8C8Y=;
  b=UmQ8gnDi6rljnCfOvvVX6BvyBLHTb33ZndW80nUm9nLtCRlu+ZoC62Hs
   /VYdEtsDveG8N+chXwd2SvV8tg8VT3DtRwn4hiiA6XAaZK+I8JL1dSYKv
   kWWwpBoPJCvIlaw8hJnf0PRqhO97/OttHrIczgZ13sHUeSBOb2vCPjSo9
   s=;
X-CSE-ConnectionGUID: YxgkUgEXQvaxEBofcrPFUw==
X-CSE-MsgGUID: IIJeF/HIQQCnvq1dR+NJuQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127427129
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Fut3RqJM+/6QMriZFE+RupUlxSXFcZb7ZxGr2PjKsXjdYENS3zEOn
 GVLWWvUbvnZZjGmctolbN60/RsPuMLWmtBhHAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrfwP9TlK6q4mhB5wZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GEW5Ny
 PM1GAkTZwCureW4y6iDZNRz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQGpkPwR/C9
 woq+UzYIzMXGpu/6AO82XSyn7bDp2Ddep8rQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyLzflTqWEIwlSvTsyISoSHevm
 1hmsRTSmZ0incEI6qqWzWnZiiKBjJ/HRRQNyDjICzfNAhxCWGK1W2C5wQGEta4cdNfHHgnpg
 ZQSpySJAAkz4XCxeM+lGrxl8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJmexP
 BaD6F4PuMUIVJdPUUOQS9jpY/nGMIC6TYi1PhwqRocmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu71ZUv2/Z9PlWLsL89EiO9D+8zL7T+LLXwN50j9gOX2ib/8YettDWZimchjvf7e+12Pq
 I8DXyZIoj0GONDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:6RUpO6wYSiPgcjmyZ3QoKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: 9a23:HXZgP2zhIQcnHup1Was0BgUlCs8mT3Lw/E7OKl+VI2FnQ6etZ2KPrfY=
X-Talos-MUID: 9a23:tA1d6AS9s+5MGrb5RXTNpRNvGoBIwp2XI0YTiMwKgYqiFzFJbmI=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127427129"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] xen/treewide: Switch bool_t to bool
Date: Mon, 20 Nov 2023 14:56:22 +0000
Message-ID: <20231120145623.167383-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120145623.167383-1-andrew.cooper3@citrix.com>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... as part of cleaning up the types used.  Minor style and/or MISRA cleanup
on some altered lines.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/device_tree.c              | 34 ++++++++++-----------
 xen/common/domain.c                   |  2 +-
 xen/common/domctl.c                   |  4 +--
 xen/common/event_fifo.c               |  4 +--
 xen/common/grant_table.c              | 14 ++++-----
 xen/common/kernel.c                   |  2 +-
 xen/common/kexec.c                    |  4 +--
 xen/common/keyhandler.c               |  4 +--
 xen/common/kimage.c                   |  8 ++---
 xen/common/livepatch.c                | 20 ++++++------
 xen/common/memory.c                   |  2 +-
 xen/common/notifier.c                 |  2 +-
 xen/common/preempt.c                  |  2 +-
 xen/common/rangeset.c                 | 12 ++++----
 xen/common/shutdown.c                 |  2 +-
 xen/common/symbols.c                  |  2 +-
 xen/common/sysctl.c                   |  4 +--
 xen/common/tasklet.c                  |  4 +--
 xen/common/timer.c                    |  8 ++---
 xen/common/trace.c                    | 12 ++++----
 xen/drivers/acpi/apei/apei-base.c     |  2 +-
 xen/drivers/acpi/apei/apei-internal.h |  2 +-
 xen/drivers/acpi/apei/erst.c          |  2 +-
 xen/drivers/acpi/apei/hest.c          |  2 +-
 xen/drivers/char/console.c            |  8 ++---
 xen/drivers/char/ehci-dbgp.c          | 10 +++---
 xen/drivers/char/ns16550.c            | 14 ++++-----
 xen/drivers/char/pl011.c              |  2 +-
 xen/drivers/char/serial.c             |  2 +-
 xen/drivers/cpufreq/cpufreq.c         |  2 +-
 xen/drivers/video/vesa.c              |  2 +-
 xen/include/acpi/cpufreq/cpufreq.h    | 10 +++---
 xen/include/xen/device_tree.h         | 44 +++++++++++++--------------
 xen/include/xen/domain.h              |  4 +--
 xen/include/xen/gdbstub.h             |  2 +-
 xen/include/xen/irq.h                 |  2 +-
 xen/include/xen/kernel.h              |  2 +-
 xen/include/xen/kimage.h              |  8 ++---
 xen/include/xen/livepatch.h           |  6 ++--
 xen/include/xen/mm-frame.h            |  4 +--
 xen/include/xen/mm.h                  |  6 ++--
 xen/include/xen/preempt.h             |  2 +-
 xen/include/xen/rangeset.h            |  8 ++---
 xen/include/xen/rwlock.h              |  2 +-
 xen/include/xen/serial.h              |  2 +-
 xen/include/xen/shutdown.h            |  2 +-
 xen/include/xen/tasklet.h             |  6 ++--
 47 files changed, 152 insertions(+), 152 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index b1c29529514f..8d1017a49d80 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -78,7 +78,7 @@ struct dt_bus
 {
     const char *name;
     const char *addresses;
-    bool_t (*match)(const struct dt_device_node *node);
+    bool (*match)(const struct dt_device_node *node);
     void (*count_cells)(const struct dt_device_node *child,
                         int *addrc, int *sizec);
     u64 (*map)(__be32 *addr, const __be32 *range, int na, int ns, int pna);
@@ -162,8 +162,8 @@ const void *dt_get_property(const struct dt_device_node *np,
     return pp ? pp->value : NULL;
 }
 
-bool_t dt_property_read_u32(const struct dt_device_node *np,
-                         const char *name, u32 *out_value)
+bool dt_property_read_u32(const struct dt_device_node *np,
+                          const char *name, u32 *out_value)
 {
     u32 len;
     const __be32 *val;
@@ -178,8 +178,8 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
 }
 
 
-bool_t dt_property_read_u64(const struct dt_device_node *np,
-                         const char *name, u64 *out_value)
+bool dt_property_read_u64(const struct dt_device_node *np,
+                          const char *name, u64 *out_value)
 {
     u32 len;
     const __be32 *val;
@@ -297,8 +297,8 @@ int dt_property_match_string(const struct dt_device_node *np,
     return -ENODATA;
 }
 
-bool_t dt_device_is_compatible(const struct dt_device_node *device,
-                               const char *compat)
+bool dt_device_is_compatible(const struct dt_device_node *device,
+                             const char *compat)
 {
     const char* cp;
     u32 cplen, l;
@@ -318,10 +318,10 @@ bool_t dt_device_is_compatible(const struct dt_device_node *device,
     return 0;
 }
 
-bool_t dt_machine_is_compatible(const char *compat)
+bool dt_machine_is_compatible(const char *compat)
 {
     const struct dt_device_node *root;
-    bool_t rc = 0;
+    bool rc = false;
 
     root = dt_find_node_by_path("/");
     if ( root )
@@ -408,9 +408,9 @@ dt_match_node(const struct dt_device_match *matches,
         return NULL;
 
     while ( matches->path || matches->type ||
-            matches->compatible || matches->not_available || matches->prop)
+            matches->compatible || matches->not_available || matches->prop )
     {
-        bool_t match = 1;
+        bool match = true;
 
         if ( matches->path )
             match &= dt_node_path_is_equal(node, matches->path);
@@ -481,7 +481,7 @@ dt_find_matching_node(struct dt_device_node *from,
     return NULL;
 }
 
-static int __dt_n_addr_cells(const struct dt_device_node *np, bool_t parent)
+static int __dt_n_addr_cells(const struct dt_device_node *np, bool parent)
 {
     const __be32 *ip;
 
@@ -498,7 +498,7 @@ static int __dt_n_addr_cells(const struct dt_device_node *np, bool_t parent)
     return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
 }
 
-static int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
+static int __dt_n_size_cells(const struct dt_device_node *np, bool parent)
 {
     const __be32 *ip;
 
@@ -558,7 +558,7 @@ int dt_child_n_size_cells(const struct dt_device_node *parent)
 /*
  * Default translator (generic bus)
  */
-static bool_t dt_bus_default_match(const struct dt_device_node *node)
+static bool dt_bus_default_match(const struct dt_device_node *node)
 {
     /* Root node doesn't have "ranges" property */
     if ( node->parent == NULL )
@@ -636,7 +636,7 @@ static bool dt_node_is_pci(const struct dt_device_node *np)
     return is_pci;
 }
 
-static bool_t dt_bus_pci_match(const struct dt_device_node *np)
+static bool dt_bus_pci_match(const struct dt_device_node *np)
 {
     /*
      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
@@ -1662,7 +1662,7 @@ int dt_device_get_irq(const struct dt_device_node *device, unsigned int index,
     return dt_irq_translate(&raw, out_irq);
 }
 
-bool_t dt_device_is_available(const struct dt_device_node *device)
+bool dt_device_is_available(const struct dt_device_node *device)
 {
     const char *status;
     u32 statlen;
@@ -1680,7 +1680,7 @@ bool_t dt_device_is_available(const struct dt_device_node *device)
     return 0;
 }
 
-bool_t dt_device_for_passthrough(const struct dt_device_node *device)
+bool dt_device_for_passthrough(const struct dt_device_node *device)
 {
     return (dt_find_property(device, "xen,passthrough", NULL) != NULL);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f9ab01c0cb7..f15c2f1e95d5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -51,7 +51,7 @@
 unsigned int xen_processor_pmbits = XEN_PROCESSOR_PM_PX;
 
 /* opt_dom0_vcpus_pin: If true, dom0 VCPUs are pinned. */
-bool_t opt_dom0_vcpus_pin;
+bool opt_dom0_vcpus_pin;
 boolean_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
 
 /* Protect updates/reads (resp.) of domain_list and domain_hash. */
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 505e29c0dcc2..f5a71ee5f78d 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -126,7 +126,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     arch_get_domain_info(d, info);
 }
 
-bool_t domctl_lock_acquire(void)
+bool domctl_lock_acquire(void)
 {
     /*
      * Caller may try to pause its own VCPUs. We must prevent deadlock
@@ -281,7 +281,7 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
 long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
-    bool_t copyback = 0;
+    bool copyback = false;
     struct xen_domctl curop, *op = &curop;
     struct domain *d;
 
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 6cebc3868a07..37cba9bc4564 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -124,8 +124,8 @@ static int try_set_link(event_word_t *word, event_word_t *w, uint32_t link)
  * We block unmasking by the guest by marking the tail word as BUSY,
  * therefore, the cmpxchg() may fail at most 4 times.
  */
-static bool_t evtchn_fifo_set_link(struct domain *d, event_word_t *word,
-                                   uint32_t link)
+static bool evtchn_fifo_set_link(struct domain *d, event_word_t *word,
+                                 uint32_t link)
 {
     event_word_t w;
     unsigned int try;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 89b7811c51c3..5721eab22561 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2272,7 +2272,7 @@ gnttab_transfer(
 
     for ( i = 0; i < count; i++ )
     {
-        bool_t okay;
+        bool okay;
         int rc;
 
         if ( i && hypercall_preempt_check() )
@@ -2858,9 +2858,9 @@ struct gnttab_copy_buf {
     mfn_t mfn;
     struct page_info *page;
     void *virt;
-    bool_t read_only;
-    bool_t have_grant;
-    bool_t have_type;
+    bool read_only;
+    bool have_grant;
+    bool have_type;
 };
 
 static int gnttab_copy_lock_domain(domid_t domid, bool is_gref,
@@ -3006,9 +3006,9 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
     return rc;
 }
 
-static bool_t gnttab_copy_buf_valid(const struct gnttab_copy_ptr *p,
-                                    const struct gnttab_copy_buf *b,
-                                    bool_t has_gref)
+static bool gnttab_copy_buf_valid(
+    const struct gnttab_copy_ptr *p, const struct gnttab_copy_buf *b,
+    bool has_gref)
 {
     if ( !b->virt )
         return 0;
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e928d0b23128..08dbaa2a054c 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -504,7 +504,7 @@ __initcall(param_init);
 
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
+    bool deny = xsm_xen_version(XSM_OTHER, cmd);
 
     switch ( cmd )
     {
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 3ee5f05c2c1a..84fe8c35976e 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -937,7 +937,7 @@ static int kexec_segments_add_segment(unsigned int *nr_segments,
 static int kexec_segments_from_ind_page(mfn_t mfn,
                                         unsigned int *nr_segments,
                                         xen_kexec_segment_t *segments,
-                                        bool_t compat)
+                                        bool compat)
 {
     void *page;
     kimage_entry_t *entry;
@@ -1215,7 +1215,7 @@ static int kexec_status(XEN_GUEST_HANDLE_PARAM(void) uarg)
 
 static int do_kexec_op_internal(unsigned long op,
                                 XEN_GUEST_HANDLE_PARAM(void) uarg,
-                                bool_t compat)
+                                bool compat)
 {
     int ret = -EINVAL;
 
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index f4752859cc7c..99a2d72a0202 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -24,7 +24,7 @@
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
-static bool_t alt_key_handling;
+static bool alt_key_handling;
 
 static keyhandler_fn_t cf_check show_handlers, cf_check dump_hwdom_registers,
     cf_check dump_domains, cf_check read_clocks;
@@ -39,7 +39,7 @@ static struct keyhandler {
     };
 
     const char *desc;    /* Description for help message.                 */
-    bool_t irq_callback, /* Call in irq context? if not, tasklet context. */
+    bool irq_callback,   /* Call in irq context? if not, tasklet context. */
         diagnostic;      /* Include in 'dump all' handler.                */
 } key_table[128] __read_mostly =
 {
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 210241dfb76c..9961eac187e9 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -833,21 +833,21 @@ int kimage_load_segments(struct kexec_image *image)
     return 0;
 }
 
-kimage_entry_t *kimage_entry_next(kimage_entry_t *entry, bool_t compat)
+kimage_entry_t *kimage_entry_next(kimage_entry_t *entry, bool compat)
 {
     if ( compat )
         return (kimage_entry_t *)((uint32_t *)entry + 1);
     return entry + 1;
 }
 
-mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool_t compat)
+mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat)
 {
     if ( compat )
         return maddr_to_mfn(*(uint32_t *)entry);
     return maddr_to_mfn(*entry);
 }
 
-unsigned long kimage_entry_ind(kimage_entry_t *entry, bool_t compat)
+unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat)
 {
     if ( compat )
         return *(uint32_t *)entry & 0xf;
@@ -855,7 +855,7 @@ unsigned long kimage_entry_ind(kimage_entry_t *entry, bool_t compat)
 }
 
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
-                     bool_t compat)
+                     bool compat)
 {
     void *page;
     kimage_entry_t *entry;
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d89a904bd4e1..845340c7f398 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -55,8 +55,8 @@ struct livepatch_work
                                     check_for_livepatch_work. */
     uint32_t timeout;            /* Timeout to do the operation. */
     struct payload *data;        /* The payload on which to act. */
-    volatile bool_t do_work;     /* Signals work to do. */
-    volatile bool_t ready;       /* Signals all CPUs synchronized. */
+    volatile bool do_work;       /* Signals work to do. */
+    volatile bool ready;         /* Signals all CPUs synchronized. */
     unsigned int cmd;            /* Action request: LIVEPATCH_ACTION_* */
 };
 
@@ -69,7 +69,7 @@ static struct livepatch_work livepatch_work;
  * would hammer a global livepatch_work structure on every guest VMEXIT.
  * Having an per-cpu lessens the load.
  */
-static DEFINE_PER_CPU(bool_t, work_to_do);
+static DEFINE_PER_CPU(bool, work_to_do);
 static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
 
 static int get_name(const struct xen_livepatch_name *name, char *n)
@@ -106,10 +106,10 @@ static int verify_payload(const struct xen_sysctl_livepatch_upload *upload, char
     return 0;
 }
 
-bool_t is_patch(const void *ptr)
+bool is_patch(const void *ptr)
 {
     const struct payload *data;
-    bool_t r = 0;
+    bool r = false;
 
     /*
      * Only RCU locking since this list is only ever changed during apply
@@ -936,8 +936,8 @@ static int prepare_payload(struct payload *payload,
     return 0;
 }
 
-static bool_t is_payload_symbol(const struct livepatch_elf *elf,
-                                const struct livepatch_elf_sym *sym)
+static bool is_payload_symbol(const struct livepatch_elf *elf,
+                              const struct livepatch_elf_sym *sym)
 {
     if ( sym->sym->st_shndx == SHN_UNDEF ||
          sym->sym->st_shndx >= elf->hdr->e_shnum )
@@ -1018,7 +1018,7 @@ static int build_symbol_table(struct payload *payload,
 
     for ( i = 0; i < nsyms; i++ )
     {
-        bool_t found = 0;
+        bool found = 0;
 
         for ( j = 0; j < payload->nfuncs; j++ )
         {
@@ -1576,7 +1576,7 @@ static void livepatch_do_action(void)
     data->rc = rc;
 }
 
-static bool_t is_work_scheduled(const struct payload *data)
+static bool is_work_scheduled(const struct payload *data)
 {
     ASSERT(spin_is_locked(&payload_lock));
 
@@ -1864,7 +1864,7 @@ void check_for_livepatch_work(void)
  * Unless the 'internal' parameter is used - in which case we only
  * check against the hypervisor.
  */
-static int build_id_dep(struct payload *payload, bool_t internal)
+static int build_id_dep(struct payload *payload, bool internal)
 {
     const void *id = NULL;
     unsigned int len = 0;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index fa165ebc144b..b3b05c2ec090 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -757,7 +757,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                              MEMF_no_refcount) )
             {
                 unsigned long dec_count;
-                bool_t drop_dom_ref;
+                bool drop_dom_ref;
 
                 /*
                  * Pages in in_chunk_list is stolen without
diff --git a/xen/common/notifier.c b/xen/common/notifier.c
index c9ea44db419a..0f9aa0f93fb0 100644
--- a/xen/common/notifier.c
+++ b/xen/common/notifier.c
@@ -72,7 +72,7 @@ int notifier_call_chain(
     int ret = NOTIFY_DONE;
     struct list_head *cursor;
     struct notifier_block *nb = NULL;
-    bool_t reverse = !!(val & NOTIFY_REVERSE);
+    bool reverse = val & NOTIFY_REVERSE;
 
     cursor = pcursor && *pcursor ? &(*pcursor)->chain : &nh->head;
 
diff --git a/xen/common/preempt.c b/xen/common/preempt.c
index 3b4178fd44ac..0d2dd51ac241 100644
--- a/xen/common/preempt.c
+++ b/xen/common/preempt.c
@@ -25,7 +25,7 @@
 
 DEFINE_PER_CPU(unsigned int, __preempt_count);
 
-bool_t in_atomic(void)
+bool in_atomic(void)
 {
     return preempt_count() || in_irq() || !local_irq_is_enabled();
 }
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index f3baf52ab6f9..27ba6099b582 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -248,11 +248,11 @@ int rangeset_remove_range(
     return rc;
 }
 
-bool_t rangeset_contains_range(
+bool rangeset_contains_range(
     struct rangeset *r, unsigned long s, unsigned long e)
 {
     struct range *x;
-    bool_t contains;
+    bool contains;
 
     ASSERT(s <= e);
 
@@ -267,11 +267,11 @@ bool_t rangeset_contains_range(
     return contains;
 }
 
-bool_t rangeset_overlaps_range(
+bool rangeset_overlaps_range(
     struct rangeset *r, unsigned long s, unsigned long e)
 {
     struct range *x;
-    bool_t overlaps;
+    bool overlaps;
 
     ASSERT(s <= e);
 
@@ -408,13 +408,13 @@ int rangeset_remove_singleton(
     return rangeset_remove_range(r, s, s);
 }
 
-bool_t rangeset_contains_singleton(
+bool rangeset_contains_singleton(
     struct rangeset *r, unsigned long s)
 {
     return rangeset_contains_range(r, s, s);
 }
 
-bool_t rangeset_is_empty(
+bool rangeset_is_empty(
     const struct rangeset *r)
 {
     return ((r == NULL) || list_empty(&r->range_list));
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index a933ee001ea4..37901a4f3391 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -12,7 +12,7 @@
 #include <public/sched.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
-bool_t __read_mostly opt_noreboot;
+bool __read_mostly opt_noreboot;
 boolean_param("noreboot", opt_noreboot);
 
 static void noreturn maybe_reboot(void)
diff --git a/xen/common/symbols.c b/xen/common/symbols.c
index 691e61792506..133b58076823 100644
--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -98,7 +98,7 @@ static unsigned int get_symbol_offset(unsigned long pos)
     return name - symbols_names;
 }
 
-bool_t is_active_kernel_text(unsigned long addr)
+bool is_active_kernel_text(unsigned long addr)
 {
     return !!find_text_region(addr);
 }
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 7cabfb023053..3e2cc4906c10 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -297,8 +297,8 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     {
         unsigned int i, j, num_nodes;
         struct xen_sysctl_numainfo *ni = &op->u.numainfo;
-        bool_t do_meminfo = !guest_handle_is_null(ni->meminfo);
-        bool_t do_distance = !guest_handle_is_null(ni->distance);
+        bool do_meminfo = !guest_handle_is_null(ni->meminfo);
+        bool do_distance = !guest_handle_is_null(ni->distance);
 
         num_nodes = last_node(node_online_map) + 1;
 
diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
index 3ad67b5c2493..c8abad3c758a 100644
--- a/xen/common/tasklet.c
+++ b/xen/common/tasklet.c
@@ -20,7 +20,7 @@
 #include <xen/cpu.h>
 
 /* Some subsystems call into us before we are initialised. We ignore them. */
-static bool_t tasklets_initialised;
+static bool tasklets_initialised;
 
 DEFINE_PER_CPU(unsigned long, tasklet_work_to_do);
 
@@ -37,7 +37,7 @@ static void tasklet_enqueue(struct tasklet *t)
     if ( t->is_softirq )
     {
         struct list_head *list = &per_cpu(softirq_tasklet_list, cpu);
-        bool_t was_empty = list_empty(list);
+        bool was_empty = list_empty(list);
         list_add_tail(&t->list, list);
         if ( was_empty )
             cpu_raise_softirq(cpu, TASKLET_SOFTIRQ);
diff --git a/xen/common/timer.c b/xen/common/timer.c
index 0fddfa74879e..47e060e4e98d 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -239,7 +239,7 @@ static inline void deactivate_timer(struct timer *timer)
     list_add(&timer->inactive, &per_cpu(timers, timer->cpu).inactive);
 }
 
-static inline bool_t timer_lock(struct timer *timer)
+static inline bool timer_lock(struct timer *timer)
 {
     unsigned int cpu;
 
@@ -264,7 +264,7 @@ static inline bool_t timer_lock(struct timer *timer)
 }
 
 #define timer_lock_irqsave(t, flags) ({         \
-    bool_t __x;                                 \
+    bool __x;                                   \
     local_irq_save(flags);                      \
     if ( !(__x = timer_lock(t)) )               \
         local_irq_restore(flags);               \
@@ -358,7 +358,7 @@ void migrate_timer(struct timer *timer, unsigned int new_cpu)
 {
     unsigned int old_cpu;
 #if CONFIG_NR_CPUS > 1
-    bool_t active;
+    bool active;
     unsigned long flags;
 
     rcu_read_lock(&timer_cpu_read_lock);
@@ -580,7 +580,7 @@ static void migrate_timers_from_cpu(unsigned int old_cpu)
     unsigned int new_cpu = cpumask_any(&cpu_online_map);
     struct timers *old_ts, *new_ts;
     struct timer *t;
-    bool_t notify = 0;
+    bool notify = false;
 
     ASSERT(!cpu_online(old_cpu) && cpu_online(new_cpu));
 
diff --git a/xen/common/trace.c b/xen/common/trace.c
index 17d62f70561f..4e7b080e6154 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -433,7 +433,7 @@ int tb_control(struct xen_sysctl_tbuf_op *tbc)
     return rc;
 }
 
-static inline unsigned int calc_rec_size(bool_t cycles, unsigned int extra)
+static inline unsigned int calc_rec_size(bool cycles, unsigned int extra)
 {
     unsigned int rec_size = 4;
 
@@ -443,7 +443,7 @@ static inline unsigned int calc_rec_size(bool_t cycles, unsigned int extra)
     return rec_size;
 }
 
-static inline bool_t bogus(u32 prod, u32 cons)
+static inline bool bogus(u32 prod, u32 cons)
 {
     if ( unlikely(prod & 3) || unlikely(prod >= 2 * data_size) ||
          unlikely(cons & 3) || unlikely(cons >= 2 * data_size) )
@@ -546,7 +546,7 @@ static unsigned char *next_record(const struct t_buf *buf, uint32_t *next,
 static inline void __insert_record(struct t_buf *buf,
                                    unsigned long event,
                                    unsigned int extra,
-                                   bool_t cycles,
+                                   bool cycles,
                                    unsigned int rec_size,
                                    const void *extra_data)
 {
@@ -617,7 +617,7 @@ static inline void insert_wrap_record(struct t_buf *buf,
 {
     u32 space_left = calc_bytes_to_wrap(buf);
     unsigned int extra_space = space_left - sizeof(u32);
-    bool_t cycles = 0;
+    bool cycles = false;
 
     BUG_ON(space_left > size);
 
@@ -674,14 +674,14 @@ static DECLARE_SOFTIRQ_TASKLET(trace_notify_dom0_tasklet,
  *
  * Logs a trace record into the appropriate buffer.
  */
-void __trace_var(u32 event, bool_t cycles, unsigned int extra,
+void __trace_var(u32 event, bool cycles, unsigned int extra,
                  const void *extra_data)
 {
     struct t_buf *buf;
     unsigned long flags;
     u32 bytes_to_tail, bytes_to_wrap;
     unsigned int rec_size, total_size;
-    bool_t started_below_highwater;
+    bool started_below_highwater;
 
     if( !tb_init_done )
         return;
diff --git a/xen/drivers/acpi/apei/apei-base.c b/xen/drivers/acpi/apei/apei-base.c
index de75c1cef992..053a92c307bb 100644
--- a/xen/drivers/acpi/apei/apei-base.c
+++ b/xen/drivers/acpi/apei/apei-base.c
@@ -154,7 +154,7 @@ int cf_check apei_exec_noop(
  * execute all instructions belong to the action.
  */
 int __apei_exec_run(struct apei_exec_context *ctx, u8 action,
-		    bool_t optional)
+		    bool optional)
 {
 	int rc = -ENOENT;
 	u32 i, ip;
diff --git a/xen/drivers/acpi/apei/apei-internal.h b/xen/drivers/acpi/apei/apei-internal.h
index 360e94b9c877..90233077b7f9 100644
--- a/xen/drivers/acpi/apei/apei-internal.h
+++ b/xen/drivers/acpi/apei/apei-internal.h
@@ -48,7 +48,7 @@ static inline u64 apei_exec_ctx_get_output(struct apei_exec_context *ctx)
 	return ctx->value;
 }
 
-int __apei_exec_run(struct apei_exec_context *ctx, u8 action, bool_t optional);
+int __apei_exec_run(struct apei_exec_context *ctx, u8 action, bool optional);
 
 static inline int apei_exec_run(struct apei_exec_context *ctx, u8 action)
 {
diff --git a/xen/drivers/acpi/apei/erst.c b/xen/drivers/acpi/apei/erst.c
index 40d8f00270d0..e006b3def2be 100644
--- a/xen/drivers/acpi/apei/erst.c
+++ b/xen/drivers/acpi/apei/erst.c
@@ -58,7 +58,7 @@
 #define FIRMWARE_MAX_STALL	50			/* 50us */
 
 static struct acpi_table_erst *__read_mostly erst_tab;
-static bool_t __read_mostly erst_enabled;
+static bool __read_mostly erst_enabled;
 
 /* ERST Error Log Address Range atrributes */
 #define ERST_RANGE_RESERVED	0x0001
diff --git a/xen/drivers/acpi/apei/hest.c b/xen/drivers/acpi/apei/hest.c
index 5881275d2f37..4ec28c3c11ba 100644
--- a/xen/drivers/acpi/apei/hest.c
+++ b/xen/drivers/acpi/apei/hest.c
@@ -39,7 +39,7 @@
 
 #define HEST_PFX "HEST: "
 
-static bool_t hest_disable;
+static bool hest_disable;
 boolean_param("hest_disable", hest_disable);
 
 /* HEST table parsing */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 4824d4a91d45..946af5e62535 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -54,7 +54,7 @@ static unsigned char __read_mostly opt_conswitch[3] = "a";
 string_runtime_param("conswitch", opt_conswitch);
 
 /* sync_console: force synchronous console output (useful for debugging). */
-static bool_t __initdata opt_sync_console;
+static bool __initdata opt_sync_console;
 boolean_param("sync_console", opt_sync_console);
 static const char __initconst warning_sync_console[] =
     "WARNING: CONSOLE OUTPUT IS SYNCHRONOUS\n"
@@ -64,7 +64,7 @@ static const char __initconst warning_sync_console[] =
     "timekeeping. It is NOT recommended for production use!\n";
 
 /* console_to_ring: send guest (incl. dom 0) console data to console ring. */
-static bool_t __read_mostly opt_console_to_ring;
+static bool __read_mostly opt_console_to_ring;
 boolean_param("console_to_ring", opt_console_to_ring);
 
 /* console_timestamps: include a timestamp prefix on every Xen console line. */
@@ -760,7 +760,7 @@ long do_console_io(
  * *****************************************************
  */
 
-static bool_t console_locks_busted;
+static bool console_locks_busted;
 
 static void __putstr(const char *str)
 {
@@ -911,7 +911,7 @@ static void printk_start_of_line(const char *prefix)
 static void vprintk_common(const char *prefix, const char *fmt, va_list args)
 {
     struct vps {
-        bool_t continued, do_print;
+        bool continued, do_print;
     }            *state;
     static DEFINE_PER_CPU(struct vps, state);
     static char   buf[1024];
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 00cbdd5454dd..72e1beabbbcd 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -332,7 +332,7 @@ struct ehci_dbgp {
     unsigned long timeout;
     struct timer timer;
     spinlock_t *lock;
-    bool_t reset_run;
+    bool reset_run;
     u8 bus, slot, func, bar;
     u16 pci_cr;
     u32 bar_val;
@@ -639,7 +639,7 @@ static int dbgp_control_msg(struct ehci_dbgp *dbgp, unsigned int devnum,
 {
     u32 addr, pids, ctrl;
     struct usb_ctrlrequest req;
-    bool_t read = (requesttype & USB_DIR_IN) != 0;
+    bool read = (requesttype & USB_DIR_IN) != 0;
     int ret;
 
     if ( size > (read ? DBGP_MAX_PACKET : 0) )
@@ -873,7 +873,7 @@ static int ehci_dbgp_external_startup(struct ehci_dbgp *dbgp)
     unsigned int dbg_port = dbgp->phys_port;
     unsigned int tries = 3;
     unsigned int reset_port_tries = 1;
-    bool_t try_hard_once = 1;
+    bool try_hard_once = true;
 
 try_port_reset_again:
     ret = ehci_dbgp_startup(dbgp);
@@ -1252,7 +1252,7 @@ static void cf_check _ehci_dbgp_poll(struct cpu_user_regs *regs)
     struct ehci_dbgp *dbgp = port->uart;
     unsigned long flags;
     unsigned int timeout = MICROSECS(DBGP_CHECK_INTERVAL);
-    bool_t empty = 0;
+    bool empty = false;
 
     if ( !dbgp->ehci_debug )
         return;
@@ -1300,7 +1300,7 @@ static void cf_check ehci_dbgp_poll(void *data)
 #endif
 }
 
-static bool_t ehci_dbgp_setup_preirq(struct ehci_dbgp *dbgp)
+static bool ehci_dbgp_setup_preirq(struct ehci_dbgp *dbgp)
 {
     if ( !ehci_dbgp_setup(dbgp) )
         return 1;
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 28ddedd50d44..ddf2a48be6e7 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -58,12 +58,12 @@ static struct ns16550 {
     struct timer timer;
     struct timer resume_timer;
     unsigned int timeout_ms;
-    bool_t intr_works;
-    bool_t dw_usr_bsy;
+    bool intr_works;
+    bool dw_usr_bsy;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
-    bool_t pb_bdf_enable;   /* if =1, pb-bdf effective, port behind bridge */
-    bool_t ps_bdf_enable;   /* if =1, ps_bdf effective, port on pci card */
+    bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
+    bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
     unsigned int pb_bdf[3]; /* pci bridge BDF */
     unsigned int ps_bdf[3]; /* pci serial port BDF */
     u32 bar;
@@ -101,8 +101,8 @@ struct ns16550_config_param {
     unsigned int reg_width;
     unsigned int fifo_size;
     u8 lsr_mask;
-    bool_t mmio;
-    bool_t bar0;
+    bool mmio;
+    bool bar0;
     unsigned int max_ports;
     unsigned int base_baud;
     unsigned int uart_offset;
@@ -1172,7 +1172,7 @@ static const struct ns16550_config __initconst uart_config[] =
 };
 
 static int __init
-pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
+pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
 {
     u64 orig_base = uart->io_base;
     unsigned int b, d, f, nextf, i;
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index f7bf3ad117af..513b373b2e23 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -39,7 +39,7 @@ static struct pl011 {
     /* /\* UART with no IRQ line: periodically-polled I/O. *\/ */
     /* struct timer timer; */
     /* unsigned int timeout_ms; */
-    /* bool_t probing, intr_works; */
+    /* bool probing, intr_works; */
     bool sbsa;  /* ARM SBSA generic interface */
     bool mmio32; /* 32-bit only MMIO */
 } pl011_com = {0};
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 00efe69574f3..6d792f06dd7d 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -29,7 +29,7 @@ static struct serial_port com[SERHND_IDX + 1] = {
     }
 };
 
-static bool_t __read_mostly post_irq;
+static bool __read_mostly post_irq;
 
 static inline void serial_start_tx(struct serial_port *port)
 {
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 8d1e789eab8e..430351b775db 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -139,7 +139,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 }
 custom_param("cpufreq", setup_cpufreq_option);
 
-bool_t __read_mostly cpufreq_verbose;
+bool __read_mostly cpufreq_verbose;
 
 struct cpufreq_governor *__find_governor(const char *governor)
 {
diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
index b007ff5678ef..70feca21ac4f 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -145,7 +145,7 @@ static void cf_check lfb_flush(void)
     __asm__ __volatile__ ("sfence" : : : "memory");
 }
 
-void __init vesa_endboot(bool_t keep)
+void __init vesa_endboot(bool keep)
 {
     if ( keep )
     {
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 281e3f513d66..b0c860f0ec21 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -22,7 +22,7 @@
 
 DECLARE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
 
-extern bool_t cpufreq_verbose;
+extern bool cpufreq_verbose;
 
 enum cpufreq_xen_opt {
     CPUFREQ_none,
@@ -52,8 +52,8 @@ struct cpufreq_cpuinfo {
 };
 
 struct perf_limits {
-    bool_t no_turbo;
-    bool_t turbo_disabled;
+    bool no_turbo;
+    bool turbo_disabled;
     uint32_t turbo_pct;
     uint32_t max_perf_pct; /* max performance in percentage */
     uint32_t min_perf_pct; /* min performance in percentage */
@@ -77,7 +77,7 @@ struct cpufreq_policy {
     struct perf_limits  limits;
     struct cpufreq_governor     *governor;
 
-    bool_t              resume; /* flag for cpufreq 1st run
+    bool                resume; /* flag for cpufreq 1st run
                                  * S3 wakeup, hotplug cpu, etc */
     s8                  turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
@@ -114,7 +114,7 @@ struct cpufreq_governor {
     char    name[CPUFREQ_NAME_LEN];
     int     (*governor)(struct cpufreq_policy *policy,
                         unsigned int event);
-    bool_t  (*handle_option)(const char *name, const char *value);
+    bool    (*handle_option)(const char *name, const char *value);
     struct list_head governor_list;
 };
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a262bba2edaf..3ae7b45429b6 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -29,7 +29,7 @@ struct dt_device_match {
     const char *path;
     const char *type;
     const char *compatible;
-    const bool_t not_available;
+    const bool not_available;
     /*
      * Property name to search for. We only search for the property's
      * existence.
@@ -95,7 +95,7 @@ struct dt_device_node {
     bool is_protected;
 
     /* HACK: Remove this if there is a need of space */
-    bool_t static_evtchn_created;
+    bool static_evtchn_created;
 
     /*
      * The main purpose of this list is to link the structure in the list
@@ -138,7 +138,7 @@ struct dt_irq {
 };
 
 /* If type == DT_IRQ_TYPE_NONE, assume we use level triggered */
-static inline bool_t dt_irq_is_level_triggered(const struct dt_irq *irq)
+static inline bool dt_irq_is_level_triggered(const struct dt_irq *irq)
 {
     unsigned int type = irq->type;
 
@@ -319,19 +319,19 @@ static inline const char *dt_node_name(const struct dt_device_node *np)
     return (np && np->name) ? np->name : "<no-node>";
 }
 
-static inline bool_t dt_node_name_is_equal(const struct dt_device_node *np,
-                                           const char *name)
+static inline bool dt_node_name_is_equal(const struct dt_device_node *np,
+                                         const char *name)
 {
     return !dt_node_cmp(np->name, name);
 }
 
-static inline bool_t dt_node_path_is_equal(const struct dt_device_node *np,
-                                           const char *path)
+static inline bool dt_node_path_is_equal(const struct dt_device_node *np,
+                                         const char *path)
 {
     return !dt_node_cmp(np->full_name, path);
 }
 
-static inline bool_t
+static inline bool
 dt_device_type_is_equal(const struct dt_device_node *device,
                         const char *type)
 {
@@ -360,8 +360,8 @@ static inline bool dt_device_is_protected(const struct dt_device_node *device)
     return device->is_protected;
 }
 
-static inline bool_t dt_property_name_is_equal(const struct dt_property *pp,
-                                               const char *name)
+static inline bool dt_property_name_is_equal(const struct dt_property *pp,
+                                             const char *name)
 {
     return !dt_prop_cmp(pp->name, name);
 }
@@ -372,7 +372,7 @@ dt_device_set_static_evtchn_created(struct dt_device_node *device)
     device->static_evtchn_created = true;
 }
 
-static inline bool_t
+static inline bool
 dt_device_static_evtchn_created(const struct dt_device_node *device)
 {
     return device->static_evtchn_created;
@@ -414,8 +414,8 @@ const struct dt_property *dt_find_property(const struct dt_device_node *np,
  *
  * Return true if get the desired value.
  */
-bool_t dt_property_read_u32(const struct dt_device_node *np,
-                            const char *name, u32 *out_value);
+bool dt_property_read_u32(const struct dt_device_node *np,
+                          const char *name, u32 *out_value);
 /**
  * dt_property_read_u64 - Helper to read a u64 property.
  * @np: node to get the value
@@ -424,8 +424,8 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
  *
  * Return true if get the desired value.
  */
-bool_t dt_property_read_u64(const struct dt_device_node *np,
-                            const char *name, u64 *out_value);
+bool dt_property_read_u64(const struct dt_device_node *np,
+                          const char *name, u64 *out_value);
 
 
 /**
@@ -491,8 +491,8 @@ static inline int dt_property_read_u32_array(const struct dt_device_node *np,
  * Search for a property in a device node.
  * Return true if the property exists false otherwise.
  */
-static inline bool_t dt_property_read_bool(const struct dt_device_node *np,
-                                           const char *name)
+static inline bool dt_property_read_bool(const struct dt_device_node *np,
+                                         const char *name)
 {
     const struct dt_property *prop = dt_find_property(np, name, NULL);
 
@@ -536,8 +536,8 @@ int dt_property_match_string(const struct dt_device_node *np,
  * Checks if the given "compat" string matches one of the strings in
  * the device's "compatible" property
  */
-bool_t dt_device_is_compatible(const struct dt_device_node *device,
-                               const char *compat);
+bool dt_device_is_compatible(const struct dt_device_node *device,
+                             const char *compat);
 
 /**
  * dt_machine_is_compatible - Test root of device tree for a given compatible value
@@ -546,7 +546,7 @@ bool_t dt_device_is_compatible(const struct dt_device_node *device,
  * Returns true if the root node has the given value in its
  * compatible property.
  */
-bool_t dt_machine_is_compatible(const char *compat);
+bool dt_machine_is_compatible(const char *compat);
 
 /**
  * dt_find_node_by_name - Find a node by its "name" property
@@ -764,7 +764,7 @@ int dt_child_n_addr_cells(const struct dt_device_node *parent);
  * Returns true if the status property is absent or set to "okay" or "ok",
  * false otherwise.
  */
-bool_t dt_device_is_available(const struct dt_device_node *device);
+bool dt_device_is_available(const struct dt_device_node *device);
 
 /**
  * dt_device_for_passthrough - Check if a device will be used for
@@ -775,7 +775,7 @@ bool_t dt_device_is_available(const struct dt_device_node *device);
  * Return true if the property "xen,passthrough" is present in the node,
  * false otherwise.
  */
-bool_t dt_device_for_passthrough(const struct dt_device_node *device);
+bool dt_device_for_passthrough(const struct dt_device_node *device);
 
 /**
  * dt_match_node - Tell if a device_node has a matching of dt_device_match
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 54d88bf5e34b..460c8c3d27b3 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -124,7 +124,7 @@ void arch_dump_domain_info(struct domain *d);
 
 int arch_vcpu_reset(struct vcpu *);
 
-bool_t domctl_lock_acquire(void);
+bool domctl_lock_acquire(void);
 void domctl_lock_release(void);
 
 /*
@@ -144,7 +144,7 @@ void arch_hypercall_tasklet_result(struct vcpu *v, long res);
 
 extern unsigned int xen_processor_pmbits;
 
-extern bool_t opt_dom0_vcpus_pin;
+extern bool opt_dom0_vcpus_pin;
 extern cpumask_t dom0_cpus;
 extern bool dom0_affinity_relaxed;
 
diff --git a/xen/include/xen/gdbstub.h b/xen/include/xen/gdbstub.h
index 18c960969b76..d2efeb0e3ae1 100644
--- a/xen/include/xen/gdbstub.h
+++ b/xen/include/xen/gdbstub.h
@@ -30,7 +30,7 @@ struct cpu_user_regs;
 struct gdb_context {
     int                 serhnd;           /* handle on our serial line */
     int                 console_steal_id; /* handle on stolen console */
-    bool_t              currently_attached;
+    bool                currently_attached;
     atomic_t            running;
     unsigned long       connected;
     u8                  signum;
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 58d462e8e6c9..0bdfe2957640 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -21,7 +21,7 @@ struct irqaction {
     void (*handler)(int irq, void *dev_id, struct cpu_user_regs *regs);
     const char *name;
     void *dev_id;
-    bool_t free_on_release;
+    bool free_on_release;
 #ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
     struct irqaction *next;
 #endif
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index 2c5ed7736c99..560b1c28322f 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -102,7 +102,7 @@ extern enum system_state {
     SYS_STATE_resume
 } system_state;
 
-bool_t is_active_kernel_text(unsigned long addr);
+bool is_active_kernel_text(unsigned long addr);
 
 extern const char xen_config_data[];
 extern const unsigned int xen_config_data_size;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index cbfb9e9054df..348f07f5c881 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -47,11 +47,11 @@ int kimage_load_segments(struct kexec_image *image);
 struct page_info *kimage_alloc_control_page(struct kexec_image *image,
                                             unsigned memflags);
 
-kimage_entry_t *kimage_entry_next(kimage_entry_t *entry, bool_t compat);
-mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool_t compat);
-unsigned long kimage_entry_ind(kimage_entry_t *entry, bool_t compat);
+kimage_entry_t *kimage_entry_next(kimage_entry_t *entry, bool compat);
+mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat);
+unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
-                     bool_t compat);
+                     bool compat);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 9fdb29c382b6..458eef57a7d1 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -48,13 +48,13 @@ struct livepatch_symbol {
     const char *name;
     unsigned long value;
     unsigned int size;
-    bool_t new_symbol;
+    bool new_symbol;
 };
 
 int livepatch_op(struct xen_sysctl_livepatch_op *);
 void check_for_livepatch_work(void);
 unsigned long livepatch_symbols_lookup_by_name(const char *symname);
-bool_t is_patch(const void *addr);
+bool is_patch(const void *addr);
 
 /* Arch hooks. */
 int arch_livepatch_verify_elf(const struct livepatch_elf *elf);
@@ -169,7 +169,7 @@ static inline int livepatch_op(struct xen_sysctl_livepatch_op *op)
 }
 
 static inline void check_for_livepatch_work(void) { };
-static inline bool_t is_patch(const void *addr)
+static inline bool is_patch(const void *addr)
 {
     return 0;
 }
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index 0105ed01300a..922ae418807a 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -38,7 +38,7 @@ static inline mfn_t mfn_min(mfn_t x, mfn_t y)
     return _mfn(min(mfn_x(x), mfn_x(y)));
 }
 
-static inline bool_t mfn_eq(mfn_t x, mfn_t y)
+static inline bool mfn_eq(mfn_t x, mfn_t y)
 {
     return mfn_x(x) == mfn_x(y);
 }
@@ -77,7 +77,7 @@ static inline gfn_t gfn_min(gfn_t x, gfn_t y)
     return _gfn(min(gfn_x(x), gfn_x(y)));
 }
 
-static inline bool_t gfn_eq(gfn_t x, gfn_t y)
+static inline bool gfn_eq(gfn_t x, gfn_t y)
 {
     return gfn_x(x) == gfn_x(y);
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8b9618609f77..595629cf3fda 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -254,7 +254,7 @@ struct page_list_head
 # define INIT_PAGE_LIST_HEAD(head) ((head)->tail = (head)->next = NULL)
 # define INIT_PAGE_LIST_ENTRY(ent) ((ent)->prev = (ent)->next = PAGE_LIST_NULL)
 
-static inline bool_t
+static inline bool
 page_list_empty(const struct page_list_head *head)
 {
     return !head->next;
@@ -313,7 +313,7 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
     }
     head->tail = page;
 }
-static inline bool_t
+static inline bool
 __page_list_del_head(struct page_info *page, struct page_list_head *head,
                      struct page_info *next, struct page_info *prev)
 {
@@ -427,7 +427,7 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
 # define INIT_PAGE_LIST_HEAD             INIT_LIST_HEAD
 # define INIT_PAGE_LIST_ENTRY            INIT_LIST_HEAD
 
-static inline bool_t
+static inline bool
 page_list_empty(const struct page_list_head *head)
 {
     return !!list_empty(head);
diff --git a/xen/include/xen/preempt.h b/xen/include/xen/preempt.h
index bef83135a1b8..aa059b497b29 100644
--- a/xen/include/xen/preempt.h
+++ b/xen/include/xen/preempt.h
@@ -26,7 +26,7 @@ DECLARE_PER_CPU(unsigned int, __preempt_count);
     preempt_count()--;                          \
 } while (0)
 
-bool_t in_atomic(void);
+bool in_atomic(void);
 
 #ifndef NDEBUG
 void ASSERT_NOT_IN_ATOMIC(void);
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 135f33f6066f..a211e3dfac1d 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -52,7 +52,7 @@ void rangeset_limit(
 #define _RANGESETF_prettyprint_hex 0
 #define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
 
-bool_t __must_check rangeset_is_empty(
+bool __must_check rangeset_is_empty(
     const struct rangeset *r);
 
 /* Add/claim/remove/query a numeric range. */
@@ -62,9 +62,9 @@ int __must_check rangeset_claim_range(struct rangeset *r, unsigned long size,
                                       unsigned long *s);
 int __must_check rangeset_remove_range(
     struct rangeset *r, unsigned long s, unsigned long e);
-bool_t __must_check rangeset_contains_range(
+bool __must_check rangeset_contains_range(
     struct rangeset *r, unsigned long s, unsigned long e);
-bool_t __must_check rangeset_overlaps_range(
+bool __must_check rangeset_overlaps_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
@@ -88,7 +88,7 @@ int __must_check rangeset_add_singleton(
     struct rangeset *r, unsigned long s);
 int __must_check rangeset_remove_singleton(
     struct rangeset *r, unsigned long s);
-bool_t __must_check rangeset_contains_singleton(
+bool __must_check rangeset_contains_singleton(
     struct rangeset *r, unsigned long s);
 
 /* swap contents */
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index e0d2b41c5c7e..08ba46de1552 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -293,7 +293,7 @@ typedef struct percpu_rwlock percpu_rwlock_t;
 
 struct percpu_rwlock {
     rwlock_t            rwlock;
-    bool_t              writer_activating;
+    bool                writer_activating;
 #ifndef NDEBUG
     percpu_rwlock_t     **percpu_owner;
 #endif
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index f0aff7ea7661..cf9701986fe1 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -48,7 +48,7 @@ struct serial_port {
     /* Transmit data buffer (interrupt-driven uart). */
     char               *txbuf;
     unsigned int        txbufp, txbufc;
-    bool_t              tx_quench;
+    bool                tx_quench;
     int                 tx_log_everything;
     /* Force synchronous transmit. */
     int                 sync;
diff --git a/xen/include/xen/shutdown.h b/xen/include/xen/shutdown.h
index b3f7e30cde5c..668aed0be580 100644
--- a/xen/include/xen/shutdown.h
+++ b/xen/include/xen/shutdown.h
@@ -4,7 +4,7 @@
 #include <xen/compiler.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
-extern bool_t opt_noreboot;
+extern bool opt_noreboot;
 
 void noreturn hwdom_shutdown(u8 reason);
 
diff --git a/xen/include/xen/tasklet.h b/xen/include/xen/tasklet.h
index 193acf8f42c1..1362d4af27c8 100644
--- a/xen/include/xen/tasklet.h
+++ b/xen/include/xen/tasklet.h
@@ -18,9 +18,9 @@ struct tasklet
 {
     struct list_head list;
     int scheduled_on;
-    bool_t is_softirq;
-    bool_t is_running;
-    bool_t is_dead;
+    bool is_softirq;
+    bool is_running;
+    bool is_dead;
     void (*func)(void *);
     void *data;
 };
-- 
2.30.2


