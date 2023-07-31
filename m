Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281F7697BB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573060.897401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3n-0000eR-VA; Mon, 31 Jul 2023 13:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573060.897401; Mon, 31 Jul 2023 13:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3n-0000cP-RQ; Mon, 31 Jul 2023 13:35:43 +0000
Received: by outflank-mailman (input) for mailman id 573060;
 Mon, 31 Jul 2023 13:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQT3l-0000Co-VQ
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:35:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 240bf8d7-2fa7-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:35:40 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id AFD544EE0742;
 Mon, 31 Jul 2023 15:35:39 +0200 (CEST)
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
X-Inumbo-ID: 240bf8d7-2fa7-11ee-b255-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/4] xen: rename variables and parameters to address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 15:35:01 +0200
Message-Id: <8aebc67a150cb4116affdd6da755a8e82c827ffa.1690810346.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690810346.git.nicola.vetrini@bugseng.com>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

Local variables have been suitably renamed to address some violations
of this rule:
- s/cmp/c/ because it shadows the union declared at line 87.
- s/nodes/numa_nodes/ shadows the static variable declared at line 18.
- s/ctrl/controller/ because the homonymous function parameter is later
  read.
- s/baud/baud_rate/ to avoid shadowing the enum constant defined
  at line 1391.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/compat/memory.c   |  6 +++---
 xen/common/numa.c            | 36 ++++++++++++++++++------------------
 xen/drivers/char/ehci-dbgp.c |  4 ++--
 xen/drivers/char/ns16550.c   |  4 ++--
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 8ca63ceda6..3cf0a37d00 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -321,12 +321,12 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
         case XENMEM_remove_from_physmap:
         {
-            struct compat_remove_from_physmap cmp;
+            struct compat_remove_from_physmap c;
 
-            if ( copy_from_guest(&cmp, compat, 1) )
+            if ( copy_from_guest(&c, compat, 1) )
                 return -EFAULT;
 
-            XLAT_remove_from_physmap(nat.xrfp, &cmp);
+            XLAT_remove_from_physmap(nat.xrfp, &c);
 
             break;
         }
diff --git a/xen/common/numa.c b/xen/common/numa.c
index fc1f7f665b..301f2cf374 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -382,7 +382,7 @@ static bool __init numa_process_nodes(paddr_t start, paddr_t end)
  * 0 if memnodmap[] too small (or shift too small)
  * -1 if node overlap or lost ram (shift too big)
  */
-static int __init populate_memnodemap(const struct node *nodes,
+static int __init populate_memnodemap(const struct node *numa_nodes,
                                       unsigned int numnodes, unsigned int shift,
                                       const nodeid_t *nodeids)
 {
@@ -393,8 +393,8 @@ static int __init populate_memnodemap(const struct node *nodes,
 
     for ( i = 0; i < numnodes; i++ )
     {
-        unsigned long spdx = paddr_to_pdx(nodes[i].start);
-        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
+        unsigned long spdx = paddr_to_pdx(numa_nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(numa_nodes[i].end - 1);
 
         if ( spdx > epdx )
             continue;
@@ -440,7 +440,7 @@ static int __init allocate_cachealigned_memnodemap(void)
  * The LSB of all start addresses in the node map is the value of the
  * maximum possible shift.
  */
-static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
+static unsigned int __init extract_lsb_from_nodes(const struct node *numa_nodes,
                                                   nodeid_t numnodes,
                                                   const nodeid_t *nodeids)
 {
@@ -449,8 +449,8 @@ static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
 
     for ( i = 0; i < numnodes; i++ )
     {
-        unsigned long spdx = paddr_to_pdx(nodes[i].start);
-        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        unsigned long spdx = paddr_to_pdx(numa_nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(numa_nodes[i].end - 1) + 1;
 
         if ( spdx >= epdx )
             continue;
@@ -475,10 +475,10 @@ static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
     return i;
 }
 
-int __init compute_hash_shift(const struct node *nodes,
+int __init compute_hash_shift(const struct node *numa_nodes,
                               unsigned int numnodes, const nodeid_t *nodeids)
 {
-    unsigned int shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
+    unsigned int shift = extract_lsb_from_nodes(numa_nodes, numnodes, nodeids);
 
     if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
         memnodemap = _memnodemap;
@@ -487,7 +487,7 @@ int __init compute_hash_shift(const struct node *nodes,
 
     printk(KERN_DEBUG "NUMA: Using %u for the hash shift\n", shift);
 
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    if ( populate_memnodemap(numa_nodes, numnodes, shift, nodeids) != 1 )
     {
         printk(KERN_INFO "Your memory is not aligned you need to "
                "rebuild your hypervisor with a bigger NODEMAPSIZE "
@@ -541,7 +541,7 @@ static int __init numa_emulation(unsigned long start_pfn,
 {
     int ret;
     unsigned int i;
-    struct node nodes[MAX_NUMNODES];
+    struct node numa_nodes[MAX_NUMNODES];
     uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
@@ -556,22 +556,22 @@ static int __init numa_emulation(unsigned long start_pfn,
         sz = x;
     }
 
-    memset(&nodes, 0, sizeof(nodes));
+    memset(&numa_nodes, 0, sizeof(numa_nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+        numa_nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
 
         if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - numa_nodes[i].start;
 
-        nodes[i].end = nodes[i].start + sz;
+        numa_nodes[i].end = numa_nodes[i].start + sz;
         printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i, nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
+               i, numa_nodes[i].start, numa_nodes[i].end,
+               (numa_nodes[i].end - numa_nodes[i].start) >> 20);
         node_set_online(i);
     }
 
-    ret = compute_hash_shift(nodes, numa_fake, NULL);
+    ret = compute_hash_shift(numa_nodes, numa_fake, NULL);
     if ( ret < 0 )
     {
         printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
@@ -580,7 +580,7 @@ static int __init numa_emulation(unsigned long start_pfn,
     memnode_shift = ret;
 
     for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+        setup_node_bootmem(i, numa_nodes[i].start, numa_nodes[i].end);
 
     numa_init_array();
 
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 4d8d765122..22650663dc 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -424,9 +424,9 @@ static void dbgp_issue_command(struct ehci_dbgp *dbgp, u32 ctrl,
          * checks to see if ACPI or some other initialization also
          * reset the EHCI debug port.
          */
-        u32 ctrl = readl(&dbgp->ehci_debug->control);
+        u32 controller = readl(&dbgp->ehci_debug->control);
 
-        if ( ctrl & DBGP_ENABLED )
+        if ( controller & DBGP_ENABLED )
         {
             cmd |= CMD_RUN;
             writel(cmd, &dbgp->ehci_regs->command);
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 212a9c49ae..61c7a19c4d 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1473,7 +1473,7 @@ static enum __init serial_param_type get_token(char *token, char **value)
 
 static bool __init parse_positional(struct ns16550 *uart, char **str)
 {
-    int baud;
+    int baud_rate;
     const char *conf;
     char *name_val_pos;
 
@@ -1504,7 +1504,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         uart->baud = BAUD_AUTO;
         conf += 4;
     }
-    else if ( (baud = simple_strtoul(conf, &conf, 10)) != 0 )
+    else if ( (baud_rate = simple_strtoul(conf, &conf, 10)) != 0 )
         uart->baud = baud;
 
     if ( *conf == '/' )
-- 
2.34.1


