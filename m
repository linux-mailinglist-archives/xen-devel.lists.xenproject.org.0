Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAD8AE733
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710585.1109868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFkR-0006fN-VP; Tue, 23 Apr 2024 12:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710585.1109868; Tue, 23 Apr 2024 12:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFkR-0006d1-R4; Tue, 23 Apr 2024 12:59:47 +0000
Received: by outflank-mailman (input) for mailman id 710585;
 Tue, 23 Apr 2024 12:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yhCQ=L4=bounce.vates.tech=bounce-md_30504962.6627b0be.v1-a90600d2b2d24dcab1bd6d9db8887a42@srs-se1.protection.inumbo.net>)
 id 1rzFkQ-0006OV-5g
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 12:59:46 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a9b047e-0171-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 14:59:44 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4VP2JZ4bsbz3sN6NV
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 12:59:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a90600d2b2d24dcab1bd6d9db8887a42; Tue, 23 Apr 2024 12:59:42 +0000
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
X-Inumbo-ID: 5a9b047e-0171-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713877182; x=1714137682;
	bh=FZ8fO939DisgVuzXrAUrqZKRIIElHa8Z6UMr6icNfJc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GE/dNvYPhjlr1bq+hJSW97tASmNuqnIiQGx8ktdLxzfhdExXTsI+4HjYhMJdqE0gu
	 de7PJtYm9WaiFYFQ8FKmPP1Svy6DtD4Gq7MQpIJH9gHMEzJtd6WslxtLCHZ2B/CkzW
	 IyK5vYz+MlMtAu2u/+2Y0ZtqItrzQJbhlnQexLwF/psobQRtJAmtMTwCnK2H79/TU4
	 WXgY8bsln4A0f26LaLTojv2TBUpJGBxCmjSAlMq/vlVE5ZtsOLnGMqvIu2HoKuuBA/
	 UOaEXW4wdaDbtaX8mLTgO9TFIyKzj+GxSNz5+gb2NG4LFncjA8g1Ki0s6jgOJCfJpg
	 Ayj/BWMOzmkgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713877182; x=1714137682; i=teddy.astie@vates.tech;
	bh=FZ8fO939DisgVuzXrAUrqZKRIIElHa8Z6UMr6icNfJc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ASD+xfUgJShYi1bo+zqJWPQ/5/w/gWYsfaMsK/v6C4dkTa4JrkpkERcTvEgU49fwr
	 SqOvqR5pK92n7QXP9gZ4PnFpPIsTKgrsHMdbSk3u+UH7YRJjOWsJ3l0MMDXpSpqVFq
	 nXUHHnjJoBUcRdpk9FyDHnmRM1qoR3/25p8D2ki7+p4e8IChYYlt+GRv89sGxZWTSn
	 SC8LsL1KPng9LCATamQr2EF97qRjySBJm8i6M9I1Ez6T1L59t8eI6kdCsdwlS5u+qM
	 Y1MipzeDAoyYJI1hfYXszMzoz0sAbpR51ymxRh9PREqndnU2409XefUWZJWi6vo+1H
	 534KicZeQyvxw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20v1]=20docs/designs:=20Introduce=20IOMMU=20context=20management?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713877179395
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Message-Id: <5c7c76f29726d377e3ff8a22ba2e3eb01dfa4c3b.1713876394.git.teddy.astie@vates.tech>
In-Reply-To: <1cdd746f1af79970f8c7151d23854d33416772e0.1713876394.git.teddy.astie@vates.tech>
References: <1cdd746f1af79970f8c7151d23854d33416772e0.1713876394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a90600d2b2d24dcab1bd6d9db8887a42?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240423:md
Date: Tue, 23 Apr 2024 12:59:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

This RFC patch introduce a design proposal for changes in the IOMMU subsyst=
em
to allow existence of "IOMMU contexts" (aka hardware IOMMU domains) within
a single Xen domain.
In addition to this, redesign and simplify the existing Xen IOMMU subsystem
with these new uses in mind, using IOMMU contexts as main objects and
reimplementing current features in a more platform agnostic way (e.g
quarantine).

The implementation of this design is needed for the PV-IOMMU interface
implementation. [1]

This design is still incomplete on some aspects (notably platforms that use=
s
device-tree nodes), and I am looking for some feedback regarding the whole
approach, and if there is anything worth noting I missed out.

Teddy

---

[1] https://xcp-ng.org/blog/2024/04/18/iommu-paravirtualization-for-xen/

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Rahul Singh <rahul.singh@arm.com>

---
 docs/designs/iommu-contexts.md | 373 +++++++++++++++++++++++++++++++++
 1 file changed, 373 insertions(+)
 create mode 100644 docs/designs/iommu-contexts.md

diff --git a/docs/designs/iommu-contexts.md b/docs/designs/iommu-contexts.m=
d
new file mode 100644
index 0000000000..fb9301c398
--- /dev/null
+++ b/docs/designs/iommu-contexts.md
@@ -0,0 +1,373 @@
+# IOMMU context management in Xen
+
+Status: Experimental
+Revision: 0
+
+# Background
+
+The design for *IOMMU paravirtualization for Dom0* [1] explains that some =
guests may
+want to access to IOMMU features. In order to implement this in Xen, sever=
al adjustments 
+needs to be made to the IOMMU subsystem.
+
+This "hardware IOMMU domain" is currently implemented on a per-domain basi=
s such as each
+domain actually has a specific *hardware IOMMU domain*, this design aims t=
o allow a
+single Xen domain to manage several "IOMMU context", and allow some domain=
s (e.g Dom0
+[1]) to modify their IOMMU contexts.
+
+In addition to this, quarantine feature can be refactored into using IOMMU=
 contexts
+to reduce the complexity of platform-specific implementations and ensuring=
 more
+consistency across platforms.
+
+# IOMMU context
+
+We define a "IOMMU context" as being a *hardware IOMMU domain*, but named =
as a context
+to avoid confusion with Xen domains.
+It represents some hardware-specific data structure that contains mappings=
 from a device
+frame-number to a machine frame-number (e.g using a pagetable) that can be=
 applied to
+a device using IOMMU hardware.
+
+This structure is bound to a Xen domain, but a Xen domain may have several=
 IOMMU context.
+These contexts may be modifiable using the interface as defined in [1] asi=
de some
+specific cases (e.g modifying default context).
+
+This is implemented in Xen as a new structure that will hold context-speci=
fic
+data.
+
+```c
+struct iommu_context {
+    u16 id; /* Context id (0 means default context) */
+    struct list_head devices;
+
+    struct arch_iommu_context arch;
+
+    bool opaque; /* context can't be modified nor accessed (e.g HAP) */
+};
+```
+
+A context is identified by a number that is domain-specific and may be use=
d by IOMMU
+users such as PV-IOMMU by the guest.
+
+struct arch_iommu_context is splited from struct arch_iommu
+
+```c
+struct arch_iommu_context
+{
+    spinlock_t pgtables_lock;
+    struct page_list_head pgtables;
+
+    union {
+        /* Intel VT-d */
+        struct {
+            uint64_t pgd_maddr; /* io page directory machine address */
+            domid_t *didmap; /* per-iommu DID */
+            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the co=
ntext uses */
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            struct page_info *root_table;
+        } amd;
+    };
+};
+
+struct arch_iommu
+{
+    spinlock_t mapping_lock; /* io page table lock */
+    struct {
+        struct page_list_head list;
+        spinlock_t lock;
+    } pgtables;
+
+    struct list_head identity_maps;
+
+    union {
+        /* Intel VT-d */
+        struct {
+            /* no more context-specific values */
+            unsigned int agaw; /* adjusted guest address width, 0 is level=
 2 30-bit */
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            unsigned int paging_mode;
+            struct guest_iommu *g_iommu;
+        } amd;
+    };
+};
+```
+
+IOMMU context information is now carried by iommu_context rather than bein=
g integrated to
+struct arch_iommu.
+
+# Xen domain IOMMU structure
+
+`struct domain_iommu` is modified to allow multiples context within a sing=
le Xen domain 
+to exist :
+
+```c
+struct iommu_context_list {
+    uint16_t count; /* Context count excluding default context */
+    
+    /* if count > 0 */
+
+    uint64_t *bitmap; /* bitmap of context allocation */
+    struct iommu_context *map; /* Map of contexts */
+};
+
+struct domain_iommu {
+    /* ... */
+
+    struct iommu_context default_ctx;
+    struct iommu_context_list other_contexts;
+
+    /* ... */
+}
+```
+
+default_ctx is a special context with id=3D0 that holds the page table map=
ping the entire
+domain, which basically preserve the previous behavior. All devices are ex=
pected to be
+bound to this context during initialization.
+
+Along with this default context that always exist, we use a pool of contex=
ts that has a
+fixed size at domain initialization, where contexts can be allocated (if p=
ossible), and
+have a id matching their position in the map (considering that id !=3D 0).
+These contexts may be used by IOMMU contexts users such as PV-IOMMU or qua=
rantine domain
+(DomIO).
+
+# Platform independent context management interface
+
+A new platform independant interface is introduced in Xen hypervisor to al=
low
+IOMMU contexts users to create and manage contexts within domains.
+
+```c
+/* Direct context access functions (not supposed to be used directly) */
+#define iommu_default_context(d) (&dom_iommu(d)->default_ctx)
+struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_no);
+int iommu_context_init(struct domain *d, struct iommu_context *ctx, u16 ct=
x_no, u32 flags);
+int iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u3=
2 flags);
+
+/* Check if a specific context exist in the domain, note that ctx_no=3D0 a=
lways
+    exists */
+bool iommu_check_context(struct domain *d, u16 ctx_no);
+
+/* Flag for default context initialization */
+#define IOMMU_CONTEXT_INIT_default (1 << 0)
+
+/* Flag for quarantine contexts (scratch page, DMA Abort mode, ...) */
+#define IOMMU_CONTEXT_INIT_quarantine (1 << 1)
+
+/* Flag to specify that devices will need to be reattached to default doma=
in */
+#define IOMMU_TEARDOWNF_REATTACH_DEFAULT (1 << 0)
+
+/* Allocate a new context, uses CONTEXT_INIT flags */
+int iommu_context_alloc(struct domain *d, u16 *ctx_no, u32 flags);
+
+/* Free a context, uses CONTEXT_TEARDOWNF flags */
+int iommu_context_free(struct domain *d, u16 ctx_no, u32 flags);
+
+/* Move a device from one context to another, including between different =
domains. */
+int iommu_reattach_context(struct domain *prev_dom, struct domain *next_do=
m,
+                            device_t *dev, u16 ctx_no);
+
+/* Add a device to a context for first initialization */
+int iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no);
+
+/* Remove a device from a context, effectively removing it from the IOMMU.=
 */
+int iommu_dettach_context(struct domain *d, device_t *dev);
+```
+
+This interface will use a new interface with drivers to implement these fe=
atures.
+
+Some existing functions will have a new parameter to specify on what conte=
xt to do the operation.
+- iommu_map (iommu_legacy_map untouched)
+- iommu_unmap (iommu_legacy_unmap untouched)
+- iommu_lookup_page
+- iommu_iotlb_flush
+
+These functions will modify the iommu_context structure to accomodate with=
 the
+operations applied, these functions will be used to replace some operation=
s previously
+made in the IOMMU driver.
+
+# IOMMU platform_ops interface changes
+
+The IOMMU driver needs to expose a way to create and manage IOMMU contexts=
, the approach
+taken here is to modify the interface to allow specifying a IOMMU context =
on operations,
+and at the same time, simplifying the interface by relying more on iommu
+platform-independent code.
+
+Added functions in iommu_ops
+
+```c
+/* Initialize a context (creating page tables, allocating hardware, struct=
ures, ...) */
+int (*context_init)(struct domain *d, struct iommu_context *ctx,
+                    u32 flags);
+/* Destroy a context, assumes no device is bound to the context. */
+int (*context_teardown)(struct domain *d, struct iommu_context *ctx,
+                        u32 flags);
+/* Put a device in a context (assumes the device is not attached to anothe=
r context) */
+int (*attach)(struct domain *d, device_t *dev,
+                struct iommu_context *ctx);
+/* Remove a device from a context, and from the IOMMU. */
+int (*dettach)(struct domain *d, device_t *dev,
+                struct iommu_context *prev_ctx);
+/* Move the device from a context to another, including if the new context=
 is in
+   another domain. d corresponds to the target domain. */
+int (*reattach)(struct domain *d, device_t *dev,
+                struct iommu_context *prev_ctx,
+                struct iommu_context *ctx);
+
+#ifdef CONFIG_HAS_PCI
+/* Specific interface for phantom function devices. */
+int (*add_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                    struct iommu_context *ctx);
+int (*remove_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                struct iommu_context *ctx);
+#endif
+
+/* Changes in existing to use a specified iommu_context. */
+int __must_check (*map_page)(struct domain *d, dfn_t dfn, mfn_t mfn,
+                                unsigned int flags,
+                                unsigned int *flush_flags,
+                                struct iommu_context *ctx);
+int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
+                                unsigned int order,
+                                unsigned int *flush_flags,
+                                struct iommu_context *ctx);
+int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
+                                unsigned int *flags,
+                                struct iommu_context *ctx);
+
+int __must_check (*iotlb_flush)(struct iommu_context *ctx, dfn_t dfn,
+                                unsigned long page_count,
+                                unsigned int flush_flags);
+
+void (*clear_root_pgtable)(struct domain *d, struct iommu_context *ctx);
+```
+
+These functions are redundant with existing functions, therefore, the foll=
owing functions
+are replaced with new equivalents :
+- quarantine_init : platform-independent code and IOMMU_CONTEXT_INIT_quara=
ntine flag
+- add_device : attach and add_devfn (phantom)
+- assign_device : attach and add_devfn (phantom)
+- remove_device : dettach and remove_devfn (phantom)
+- reassign_device : reattach
+
+Some functionnal differences with previous functions, the following should=
 be handled
+by platform-independent/arch-specific code instead of IOMMU driver :
+- identity mappings (unity mappings and rmrr)
+- device list in context and domain
+- domain of a device
+- quarantine
+
+The idea behind this is to implement IOMMU context features while simplify=
ing IOMMU
+drivers implementations and ensuring more consistency between IOMMU driver=
s.
+
+## Phantom function handling
+
+PCI devices may use additionnal devfn to do DMA operations, in order to su=
pport such
+devices, an interface is added to map specific device functions without im=
plying that
+the device is mapped to a new context (that may cause duplicates in Xen da=
ta structures).
+
+Functions add_devfn and remove_devfn allows to map a iommu context on spec=
ific devfn
+for a pci device, without altering platform-independent data structures.
+
+It is important for the reattach operation to care about these devices, in=
 order
+to prevent devices from being partially reattached to the new context (see=
 XSA-449 [2])
+by using a all-or-nothing approach for reattaching such devices.
+
+# Quarantine refactoring using IOMMU contexts
+
+The quarantine mecanism can be entirely reimplemented using IOMMU context,=
 making
+it simpler, more consistent between platforms, 
+
+Quarantine is currently only supported with x86 platforms and works by cre=
ating a
+single *hardware IOMMU domain* per quarantined device. All the quarantine =
logic is
+the implemented in a platform-specific fashion while actually implementing=
 the same
+concepts :
+
+The *hardware IOMMU context* data structures for quarantine are currently =
stored in
+the device structure itself (using arch_pci_dev) and IOMMU driver needs to=
 care about
+whether we are dealing with quarantine operations or regular operations (o=
ften dealt 
+using macros such as QUARANTINE_SKIP or DEVICE_PGTABLE).
+
+The page table that will apply on the quarantined device is created reserv=
ed device
+regions, and adding mappings to a scratch page if enabled (quarantine=3Dsc=
ratch-page).
+
+A new approach we can use is allowing the quarantine domain (DomIO) to man=
age IOMMU
+contexts, and implement all the quarantine logic using IOMMU contexts.
+
+That way, the quarantine implementation can be platform-independent, thus =
have a more
+consistent implementation between platforms. It will also allows quarantin=
e to work
+with other IOMMU implementations without having to implement platform-spec=
ific behavior.
+Moreover, quarantine operations can be implemented using regular context o=
perations
+instead of relying on driver-specific code.
+
+Quarantine implementation can be summarised as
+
+```c
+int iommu_quarantine_dev_init(device_t *dev)
+{
+    int ret;
+    u16 ctx_no;
+
+    if ( !iommu_quarantine )
+        return -EINVAL;
+
+    ret =3D iommu_context_alloc(dom_io, &ctx_no, IOMMU_CONTEXT_INIT_quaran=
tine);
+
+    if ( ret )
+        return ret;
+
+    /** TODO: Setup scratch page, mappings... */
+
+    ret =3D iommu_reattach_context(dev->domain, dom_io, dev, ctx_no);
+
+    if ( ret )
+    {
+        ASSERT(!iommu_context_free(dom_io, ctx_no, 0));
+        return ret;
+    }
+
+    return ret;
+}
+```
+
+# Platform-specific considerations
+
+## IOMMUs based on page tables
+
+TODO
+
+## x86 Architecture
+
+TODO
+
+### Intel VT-d
+
+VT-d uses DID to tag the *IOMMU domain* applied to a device and assumes th=
at all entries
+with the same DID uses the same page table (i.e same IOMMU context).
+Under certain circonstances (e.g DRHD with DID limit below 16-bits), the *=
DID* is
+transparently converted into a DRHD-specific DID using a map managed inter=
nally.
+
+The current implementation of the code reuses the Xen domain_id as DID.
+However, by using multiples IOMMU contexts per domain, we can't use the do=
main_id for
+contexts (otherwise, different page tables will be mapped with the same DI=
D).
+The following strategy is used : 
+- on the default context, reuse the domain_id (the default context is uniq=
ue per domain)
+- on non-default context, use a id allocated in the pseudo_domid map, (act=
ually used by
+quarantine) which is a DID outside of Xen domain_id range
+
+### AMD-Vi
+
+TODO
+
+## Device-tree platforms
+
+### SMMU and SMMUv3
+
+TODO
+
+* * *
+
+[1] See pv-iommu.md
+
+[2] pci: phantom functions assigned to incorrect contexts
+https://xenbits.xen.org/xsa/advisory-449.html
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


