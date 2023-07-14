Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9641753A20
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563583.880880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ4-0005ZZ-CJ; Fri, 14 Jul 2023 11:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563583.880880; Fri, 14 Jul 2023 11:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ4-0005Xa-97; Fri, 14 Jul 2023 11:49:54 +0000
Received: by outflank-mailman (input) for mailman id 563583;
 Fri, 14 Jul 2023 11:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKHJ2-0005Gy-OM
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 11:49:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89fcd3e5-223c-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 13:49:50 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id A002C4EE0C89;
 Fri, 14 Jul 2023 13:49:48 +0200 (CEST)
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
X-Inumbo-ID: 89fcd3e5-223c-11ee-8611-37d641c3527e
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
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 1/4] xen/arm: justify or initialize conditionally uninitialized variables
Date: Fri, 14 Jul 2023 13:49:18 +0200
Message-Id: <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689329728.git.nicola.vetrini@bugseng.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aims to fix some occurrences of possibly uninitialized
variables, that may be read before being written. This behaviour would
violate MISRA C:2012 Rule 9.1, besides being generally undesirable.

In all the analyzed cases, such accesses were actually safe, but it's
quite difficult to prove so by automatic checking, therefore a safer
route is to change the code so as to avoid the behaviour from occurring,
while preserving the semantics.

To achieve this goal, I adopted the following strategies:

- Add a suitably formatted local deviation comment
  (as indicated in 'docs/misra/documenting-violations.rst')
  to exempt the following line from checking.

- Provide an initialization for the variable at the declaration.

- Substitute a goto breaking out of control flow logic with a semantically
  equivalent do { .. } while(0).

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/safe.json                   |  8 +++++++
 xen/arch/arm/arm64/lib/find_next_bit.c |  1 +
 xen/arch/arm/bootfdt.c                 |  6 +++++
 xen/arch/arm/decode.c                  |  2 ++
 xen/arch/arm/domain_build.c            | 29 ++++++++++++++++++----
 xen/arch/arm/efi/efi-boot.h            |  6 +++--
 xen/arch/arm/gic-v3-its.c              |  9 ++++---
 xen/arch/arm/mm.c                      |  1 +
 xen/arch/arm/p2m.c                     | 33 +++++++++++++++-----------
 9 files changed, 69 insertions(+), 26 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e3c8a1d8eb..244001f5be 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -12,6 +12,14 @@
         },
         {
             "id": "SAF-1-safe",
+            "analyser": {
+                "eclair": "MC3R1.R9.1"
+            },
+            "name": "Rule 9.1: initializer not needed",
+            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
+        },
+        {
+            "id": "SAF-2-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/arm64/lib/find_next_bit.c b/xen/arch/arm/arm64/lib/find_next_bit.c
index ca6f82277e..51b852c595 100644
--- a/xen/arch/arm/arm64/lib/find_next_bit.c
+++ b/xen/arch/arm/arm64/lib/find_next_bit.c
@@ -67,6 +67,7 @@ unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
 {
 	const unsigned long *p = addr + BIT_WORD(offset);
 	unsigned long result = offset & ~(BITS_PER_LONG-1);
+	/* SAF-1-safe MC3R1.R9.1 */
 	unsigned long tmp;
 
 	if (offset >= size)
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 2673ad17a1..1292a64e8d 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -34,6 +34,7 @@ static bool __init device_tree_node_matches(const void *fdt, int node,
 static bool __init device_tree_node_compatible(const void *fdt, int node,
                                                const char *match)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     int len, l;
     const void *prop;
 
@@ -169,7 +170,9 @@ int __init device_tree_for_each_node(const void *fdt, int node,
      */
     int depth = 0;
     const int first_node = node;
+    /* SAF-1-safe MC3R1.R9.1 */
     u32 address_cells[DEVICE_TREE_MAX_DEPTH];
+    /* SAF-1-safe MC3R1.R9.1 */
     u32 size_cells[DEVICE_TREE_MAX_DEPTH];
     int ret;
 
@@ -249,8 +252,10 @@ static void __init process_multiboot_node(const void *fdt, int node,
     const __be32 *cell;
     bootmodule_kind kind;
     paddr_t start, size;
+    /* SAF-1-safe MC3R1.R9.1 */
     int len;
     /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
+    /* SAF-1-safe MC3R1.R9.1*/
     char path[92];
     int parent_node, ret;
     bool domU;
@@ -326,6 +331,7 @@ static int __init process_chosen_node(const void *fdt, int node,
 {
     const struct fdt_property *prop;
     paddr_t start, end;
+    /* SAF-1-safe MC3R1.R9.1 */
     int len;
 
     if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 2537dbebc1..b3ea504356 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -27,6 +27,7 @@ static void update_dabt(struct hsr_dabt *dabt, int reg,
 
 static int decode_thumb2(register_t pc, struct hsr_dabt *dabt, uint16_t hw1)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     uint16_t hw2;
     uint16_t rt;
 
@@ -151,6 +152,7 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
 
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     uint16_t instr;
 
     if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof (instr)) )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d0d6be922d..d43f86c2f0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -62,7 +62,7 @@ custom_param("dom0_mem", parse_dom0_mem);
 
 int __init parse_arch_dom0_param(const char *s, const char *e)
 {
-    long long val;
+    long long val = LLONG_MAX;
 
     if ( !parse_signed_integer("sve", s, e, &val) )
     {
@@ -1077,6 +1077,7 @@ static void __init assign_static_memory_11(struct domain *d,
 static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     uint16_t segment;
     int res;
 
@@ -1351,6 +1352,7 @@ static int __init make_memory_node(const struct domain *d,
     unsigned int i;
     int res, reg_size = addrcells + sizecells;
     int nr_cells = 0;
+    /* SAF-1-safe MC3R1.R9.1*/
     __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
     __be32 *cells;
 
@@ -1578,6 +1580,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     struct rangeset *unalloc_mem;
     paddr_t start, end;
     unsigned int i;
+    /* SAF-1-safe MC3R1.R9.1 */
     int res;
 
     dt_dprintk("Find unallocated memory for extended regions\n");
@@ -1727,6 +1730,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     dt_for_each_device_node( dt_host, np )
     {
         unsigned int naddr;
+        /* SAF-1-safe MC3R1.R9.1 */
         paddr_t addr, size;
 
         naddr = dt_number_of_address(np);
@@ -1976,9 +1980,11 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
     const struct dt_device_node *npcpu;
     unsigned int cpu;
     const void *compatible = NULL;
+    /* SAF-1-safe MC3R1.R9.1 */
     u32 len;
     /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
     char buf[13];
+    /* SAF-1-safe MC3R1.R9.1 */
     u32 clock_frequency;
     /* Keep the compiler happy with -Og */
     bool clock_valid = false;
@@ -2104,6 +2110,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
     const struct dt_device_node *gic = dt_interrupt_controller;
     int res = 0;
     const void *addrcells, *sizecells;
+    /* SAF-1-safe MC3R1.R9.1 */
     u32 addrcells_len, sizecells_len;
 
     /*
@@ -2179,6 +2186,7 @@ static int __init make_timer_node(const struct kernel_info *kinfo)
     int res;
     unsigned int irq[MAX_TIMER_PPI];
     gic_interrupt_t intrs[3];
+    /* SAF-1-safe MC3R1.R9.1 */
     u32 clock_frequency;
     bool clock_valid;
 
@@ -2511,6 +2519,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int naddr;
     unsigned int i;
     int res;
+    /* SAF-1-safe MC3R1.R9.1 */
     paddr_t addr, size;
     bool own_device = !dt_device_for_passthrough(dev);
     /*
@@ -2779,6 +2788,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
+    /* SAF-1-safe MC3R1.R9.1*/
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
     const struct domain *d = kinfo->d;
@@ -2914,6 +2924,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     void *fdt = kinfo->fdt;
     int res;
     gic_interrupt_t intr;
+    /* SAF-1-safe MC3R1.R9.1*/
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
     struct domain *d = kinfo->d;
@@ -3435,6 +3446,7 @@ static void __init initrd_load(struct kernel_info *kinfo)
     paddr_t paddr, len;
     int node;
     int res;
+    /* SAF-1-safe MC3R1.R9.1 */
     __be32 val[2];
     __be32 *cellp;
     void __iomem *initrd;
@@ -3514,6 +3526,7 @@ static int __init get_evtchn_dt_property(const struct dt_device_node *np,
                                          uint32_t *port, uint32_t *phandle)
 {
     const __be32 *prop = NULL;
+    /* SAF-1-safe MC3R1.R9.1 */
     uint32_t len;
 
     prop = dt_get_property(np, "xen,evtchn", &len);
@@ -3538,10 +3551,13 @@ static int __init get_evtchn_dt_property(const struct dt_device_node *np,
 static int __init alloc_domain_evtchn(struct dt_device_node *node)
 {
     int rc;
+    /* SAF-1-safe MC3R1.R9.1 */
     uint32_t domU1_port, domU2_port, remote_phandle;
     struct dt_device_node *remote_node;
     const struct dt_device_node *p1_node, *p2_node;
+    /* SAF-1-safe MC3R1.R9.1 */
     struct evtchn_alloc_unbound alloc_unbound;
+    /* SAF-1-safe MC3R1.R9.1 */
     struct evtchn_bind_interdomain bind_interdomain;
     struct domain *d1 = NULL, *d2 = NULL;
 
@@ -3789,11 +3805,12 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
 static int __init alloc_xenstore_evtchn(struct domain *d)
 {
-    evtchn_alloc_unbound_t alloc;
+    evtchn_alloc_unbound_t alloc = {
+        .dom = d->domain_id,
+        .remote_dom = hardware_domain->domain_id
+    };
     int rc;
 
-    alloc.dom = d->domain_id;
-    alloc.remote_dom = hardware_domain->domain_id;
     rc = evtchn_alloc_unbound(&alloc, 0);
     if ( rc )
     {
@@ -3810,8 +3827,9 @@ static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
     struct kernel_info kinfo = {};
-    const char *dom0less_enhanced;
+    const char *dom0less_enhanced = NULL;
     int rc;
+    /* SAF-1-safe MC3R1.R9.1 */
     u64 mem;
     u32 p2m_mem_mb;
     unsigned long p2m_pages;
@@ -3939,6 +3957,7 @@ void __init create_domUs(void)
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
         unsigned int flags = 0U;
+        /* SAF-1-safe MC3R1.R9.1 */
         uint32_t val;
         int rc;
 
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index bb64925d70..25f39364d1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -117,6 +117,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
 static int __init fdt_set_reg(void *fdt, int node, int addr_cells,
                               int size_cells, uint64_t addr, uint64_t len)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     __be32 val[4]; /* At most 2 64 bit values to be stored */
     __be32 *cellp;
 
@@ -308,7 +309,7 @@ fdt_set_fail:
 static void __init *fdt_increase_size(struct file *fdtfile, int add_size)
 {
     EFI_STATUS status;
-    EFI_PHYSICAL_ADDRESS fdt_addr;
+    EFI_PHYSICAL_ADDRESS fdt_addr = 0;
     int fdt_size;
     int pages;
     void *new_fdt;
@@ -433,7 +434,7 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
 
 static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
 {
-    void *ptr;
+    void *ptr = NULL;
     EFI_STATUS status;
 
     status = efi_bs->AllocatePool(EfiLoaderData, map_size, &ptr);
@@ -538,6 +539,7 @@ static void __init efi_arch_handle_module(const struct file *file,
 {
     int node;
     int chosen;
+    /* SAF-1-safe MC3R1.R9.1 */
     int addr_len, size_len;
 
     if ( file == &dtbfile )
diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 3aa4edda10..aa0180ab5b 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -192,8 +192,7 @@ static int its_send_cmd_mapc(struct host_its *its, uint32_t collection_id,
 
     cmd[0] = GITS_CMD_MAPC;
     cmd[1] = 0x00;
-    cmd[2] = encode_rdbase(its, cpu, collection_id);
-    cmd[2] |= GITS_VALID_BIT;
+    cmd[2] = encode_rdbase(its, cpu, collection_id) | GITS_VALID_BIT;
     cmd[3] = 0x00;
 
     return its_send_command(its, cmd);
@@ -215,9 +214,7 @@ static int its_send_cmd_mapd(struct host_its *its, uint32_t deviceid,
     }
     cmd[0] = GITS_CMD_MAPD | ((uint64_t)deviceid << 32);
     cmd[1] = size_bits;
-    cmd[2] = itt_addr;
-    if ( valid )
-        cmd[2] |= GITS_VALID_BIT;
+    cmd[2] = itt_addr | (valid ? GITS_VALID_BIT : 0x00);
     cmd[3] = 0x00;
 
     return its_send_command(its, cmd);
@@ -911,6 +908,7 @@ int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
                                   const struct dt_device_node *gic,
                                   void *fdt)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     uint32_t len;
     int res;
     const void *prop = NULL;
@@ -1004,6 +1002,7 @@ static void gicv3_its_dt_init(const struct dt_device_node *node)
      */
     dt_for_each_child_node(node, its)
     {
+        /* SAF-1-safe MC3R1.R9.1 */
         paddr_t addr, size;
 
         if ( !dt_device_is_compatible(its, "arm,gic-v3-its") )
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c688227abd..a36068b2d8 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -935,6 +935,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
                                mfn_t mfn, unsigned int target,
                                unsigned int flags)
 {
+    /* SAF-1-safe MC3R1.R9.1 */
     int rc;
     unsigned int level;
     lpae_t *table;
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index de32a2d638..83c56cf1cb 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -496,16 +496,18 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     lpae_t entry, *table;
     int rc;
     mfn_t mfn = INVALID_MFN;
-    p2m_type_t _t;
+    p2m_type_t _t = p2m_invalid;
     DECLARE_OFFSETS(offsets, addr);
 
     ASSERT(p2m_is_locked(p2m));
     BUILD_BUG_ON(THIRD_MASK != PAGE_MASK);
 
     /* Allow t to be NULL */
-    t = t ?: &_t;
-
-    *t = p2m_invalid;
+    if( t ) {
+        *t = _t;
+    } else {
+        t = &_t;
+    }
 
     if ( valid )
         *valid = false;
@@ -1031,6 +1033,7 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
     unsigned int level = 0;
     unsigned int target = 3 - (page_order / XEN_PT_LPAE_SHIFT);
     lpae_t *entry, *table, orig_pte;
+    /* SAF-1-safe MC3R1.R9.1 */
     int rc;
     /* A mapping is removed if the MFN is invalid. */
     bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
@@ -1483,6 +1486,7 @@ static inline int p2m_remove_mapping(struct domain *d,
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long i;
+    /* SAF-1-safe MC3R1.R9.1 */
     int rc;
 
     p2m_write_lock(p2m);
@@ -1685,20 +1689,21 @@ static int p2m_alloc_vmid(struct domain *d)
 
     ASSERT(nr != INVALID_VMID);
 
-    if ( nr == MAX_VMID )
-    {
-        rc = -EBUSY;
-        printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
-        goto out;
-    }
+    do {
+      if ( nr == MAX_VMID )
+      {
+          rc = -EBUSY;
+          printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
+          break;
+      }
 
-    set_bit(nr, vmid_mask);
+      set_bit(nr, vmid_mask);
 
-    p2m->vmid = nr;
+      p2m->vmid = nr;
 
-    rc = 0;
+			rc = 0;
+		} while ( 0 );
 
-out:
     spin_unlock(&vmid_alloc_lock);
     return rc;
 }
-- 
2.34.1


