Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F414473CE8F
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 07:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554742.866139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDIKS-0005nW-Ds; Sun, 25 Jun 2023 05:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554742.866139; Sun, 25 Jun 2023 05:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDIKS-0005ll-BH; Sun, 25 Jun 2023 05:30:28 +0000
Received: by outflank-mailman (input) for mailman id 554742;
 Sun, 25 Jun 2023 05:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRE/=CN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDIKQ-0005lf-Tf
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 05:30:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5fc24630-1319-11ee-8611-37d641c3527e;
 Sun, 25 Jun 2023 07:30:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4283B2F4;
 Sat, 24 Jun 2023 22:31:03 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC7E43F64C;
 Sat, 24 Jun 2023 22:30:16 -0700 (PDT)
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
X-Inumbo-ID: 5fc24630-1319-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1] xen/docs: design doc for GICv4.0 vLPI support
Date: Sun, 25 Jun 2023 13:29:58 +0800
Message-Id: <20230625052958.2835531-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a design doc for GICv4.0 vLPI support.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/designs/gicv4_vlpi.md | 333 +++++++++++++++++++++++++++++++++++++
 1 file changed, 333 insertions(+)
 create mode 100644 docs/designs/gicv4_vlpi.md

diff --git a/docs/designs/gicv4_vlpi.md b/docs/designs/gicv4_vlpi.md
new file mode 100644
index 0000000000..9a1969d7cc
--- /dev/null
+++ b/docs/designs/gicv4_vlpi.md
@@ -0,0 +1,333 @@
+# GICv4.0 Virtual LPI Support
+
+We will have four stages to add GICv4.0/GICv4.1 support to Xen.
+
+   * Stage#1: Add GICv4.0 Virtual LPI support
+   * Stage#2: Add GICv4.0 Virtual SGI support
+   * Stage#3: Add GICv4.1 Virtual LPI support
+   * Stage#4: Add GICv4.1 Virtual SGI support
+
+This design doc is only for "Stage#1: Add GICv4.0 Virtual LPI support".
+
+# Introduction
+
+In GICv3, the hypervisor uses the system registers to present LPIs to a
+virtualized system. A virtual LPI (vLPI) is generated when the hypervisor
+writes to a List register. Now with GICv4.0, it provides support for the direct
+injection of vLPIs, with no hypervisor involvement at runtime.
+
+With the direct injection of vLPIs, the GICR_* registers use structures in
+memory for each vPE to hold virtual LPI configuration and virtual pending
+configuration for vLPIs in the same way that they use structures in memory to
+hold LPI configuration and pending configuration for physical LPIs.
+
+The following summarises the hardware and serves as a set of assumptions
+for the GICv4.0 virtual LPI support software design. For full details see
+the "GIC Architecture Specification"[1].
+
+This design refers to the Linux KVM GICv4 patches[2] and we adapt them to
+Xen gic virtualization framework.
+
+# Hardware background
+
+## 4.0 ITS with direct injection of virtual LPI interrupts
+
+The 4.0 ITS could maps an EventID and a DeviceID to an vINTID associated
+with a vPE.
+
+### vPE table
+
+The vPE table consists of vPE table entries that provide a mapping from the
+vPEID generated by the ITS to:
+
+  * The target Redistributor, in the format defined by GITS_TYPER.PTA.
+  * The base address of the virtual LPI Pending table associated with the target
+vPE.
+
+An area of memory defined by GITS_BASER2 holds the vPE table and indicates
+the size of each entry in the table.
+
+### Doorbell interrupt
+
+Virtual interrupts can be directly injected for the *scheduled vPE*.
+If the target vPE is not scheduled, the virtual interrupt is recorded as
+being pending in the appropriate VPT(Virtual Pending Table).
+
+Besides this, We can configure a physical LPI that is sent to a PE when the
+vLPI becomes pending and the vPE is not scheduled on that PE. This physical LPI
+is a Doorbell Interrupt.
+
+### ITT table with vLPI and doorbell interrupt support
+
+We could use ITS VMAPTI command to write an new ITTE(Interruption Translation
+Table Entry) entry in ITT(Interruption Translation Table) for a direct
+event/vLPI pair. The new ITS interruption translation table entry is
+updated to be configured with:
+
+   * A control flag that indicates that the EventID is associated with a
+virtual LPI.
+   * A vPEID to index into the ITS vPE table.
+   * A virtual INTID (vINTID) that indicates which vLPI becomes pending.
+   * A physical INTID (pINTID) that can be used as a doorbell interrupt to the
+hypervisor if the vPE is not scheduled on a PE. The value 1023 is used where a
+doorbell interrupt is not required, otherwise an INTID in the physical LPI
+range must be provided
+
+### New ITS commands summary
+
+The commands used to control the handling of virtual LPIs are as follows:
+
+    * VINVALL
+    * VMAPI
+    * VMAPP GICv4.0
+    * VMAPTI
+    * VMOVI
+    * VMOVP GICv4.0
+    * VSYNC
+
+## 4.0 Redistributor with direct injection of virtual LPI interrupts
+
+### GICR_VPROPBASER
+
+This register sets the address of the virtual LPI Configuration table, which
+records the configuration of vLPIs.
+
+The configuration of vLPIs is global to all vPEs in the same VM, so we shall
+assume that all vPEs in a VM will use the same copy of the virtual
+Configuration Table.
+
+### GICR_VPENDBASER
+
+This register sets the address of the virtual LPI Pending table(VPT), which
+records the pending state of the vLPIs. Each vPE has its own private VPT.
+
+# Implementation on Xen
+
+## Probe GICv4.0
+
+The GICv4.0 is just an augmented GICv3, and it is reusing quantities of
+GICv3 routines.
+The way to probe whether the hardware supports GICv4.0 is to check whether the
+Redistributors support direct injection of virtual LPIs(vLPIs), through
+GICR_TYPER.VLPIS.
+
+## vPE initialization
+
+In Xen, we assign a vPE instance for each vCPU. When creating a VM, the low
+level GICv4 code is responsible for creating vPE instance for each vcpu, which
+includes:
+
+  * allocating each vPE a unique VPEID. In Xen, we simply use the VCPUID
+as VPEID.
+  * allocating a doorbell interrupt for each vPE, which follows the current
+allocation of a free physical LPI.
+  * allocating the virtual pending table for each vPE. Virtual pending table
+and pending table share the same format.
+  * allocating the virtual property table for the VM. Virtual property table
+and property table share the same format.
+
+At initialization stage, we eagerly inform all the v4 ITSes and map vPE to the
+first possible CPU using ITS VMAPP GICv4.0 command.
+In GICv4.0, VMAPP GICv4.0 maps the vPE table entry defined by vPEID to the
+target RDbase, including an associated virtual LPI Pending table.
+
+All of these have to be reversed when the VM is brought down.
+
+## vLPI configuration
+
+In GICv3, when trapping from guest MAPD command, we map all the events within
+this device with host LPIs through MAPTI command. This part stays the same in
+GICv4.0.
+
+Later when trapping from guest MAPTI command, we record the connection
+between the event ID and the given VCPU/vLPI pair, for properly injecting vLPI
+with List Register if the event fires in the future.
+While in GICv4.0, we drop the original physical mapping(eventID -> host LPI),
+and issue VMAPTI command to establish the connection between the virtual
+interrupt and the target VCPU/vLPI pair through VMAPTI command.
+In Xen, We add an flag field "bool hw" in "struct pending_irq" to tell the
+different type of vLPI on GICv3 and GICv4.0, and set it "true" on GICv4.0
+hardware to indicate the interrupt is tied to HW.
+
+e.g.
+```
+struct pending_irq
+{
+...
+bool hw;
+}
+
+its_handle_mapti() -> gicv3_assign_guest_event() -> if ( pirq_is_tied_to_hw(p) )
+                                                        -> gicv4_assign_guest_event()
+```
+
+In GICv4.0, VMAPTI command maps the event defined by DeviceID and EventID into
+an ITT entry with vPEID and vINTID, and Dbell_pINTID, a doorbell provision.
+Now later when the event arrives, the vLPI will be directly injected into the
+guest.
+
+## Change vLPI configuration
+
+Any guest invalidation, INV and INVALL, triggers vLPI property update.
+In current GICv3 codeflow, we read the enabled bit and priority from the
+virtual property table in guest memory and update the virtual IRQ's state in
+the given pending_irq.
+
+In GICv4.0, other than above operations, it shall also include the following
+changes:
+    * Virtual configuration table update.
+    * If guest issues INV, then an INV command is also required for the
+vLPI that is modified. As SYNC only synchronises physical LPI, we send an
+INV+VSYNC for forwarded VLPIs, ensuring that the ITS can properly synchronise
+the invalidation of VLPIs.
+    * If guest issues INVALL, besides iterating over the VM's vlpi radix
+tree to find all vLPIs on the target vPE and update the configuration, the
+same as GICv3 does, An extra VINVALL command is required to ensure
+any cached Redistributor information associated with vPEID is consistent with
+the associated virtual LPI configuration table held in memory.
+
+e.g.
+```
+its_handle_inv() -> update_lpi_property() -> if ( pirq_is_tied_to_hw(p) )
+                                                -> its_vlpi_prop_update()
+```
+
+## Guest ITS Command Translation
+
+A number of guest ITS commands are simply sharing the same routine with GICv3.
+For example, MAPD is still translated to assign device to the guest. Same goes
+for things like MAPC, as we don't rely on the concept of collection to deal
+with the actual vPE affinity.
+
+But the following ITS commands guest performs on its LPI through the vITS shall
+have different hooks to communicate to the HW:
+
+  * The INT command generates an actual INT on the corresponding VLPI.
+  * The CLEAR command generates an actual CLEAR on the corresponding VLPI.
+  * When guest frees an LPI(on a DISCARD command, for example), we need
+to unmap the vLPI by generating an actual DISCARD on the corresponding vLPI.
+  * MOVI is translated to an update of the existing vLPI mapping, changing the
+target vPE, and resulting in a VMOVI being generated.
+
+In above path, as we need to treat guest LPI differently for GICv3 and GICv4,
+we are using the previous introduced "hw" flag in "struct pending_irq" to tell
+the difference, whether guest LPI is an emulated one in GICv3, or a real one
+tied to HW in GICv4.0.
+
+## Scheduled in/out vPE
+
+The GIC hardware determines whether the vPE is scheduled on a PE when:
+
+    * GICR_VPENDBASER.Valid == 1.
+    * GICR_VPENDBASER.Physical_Address holds the same value as defined in the
+VPT_addr field in the VMAPP GICv4.0 command for the vPE that is the target of
+the vLPI.
+
+Anytime when vcpu blocks/unblocks(e.g. trap from WFI), or get scheduled out/
+scheduled in, hypervisor must update the according Redistributor registers.
+
+### vPE descheduling
+
+The whole process about descheduling vPE includes the following steps:
+
+#### Clear GICR_VPENDBASER.Valid
+
+Clearing the Valid bit informs the Redistributor that a context switch is
+taking place. The Redistributor will retrieve any pending virtual interrupts
+from the virtual CPU interface, and ensure that the VPT in memory is correct.
+
+#### Poll GICR_VPENDBASER.Dirty until it reads 0
+
+The Dirty bit reports that the Redistributor has finished updating the VPT.
+The new vPE cannot be scheduled until this bit reads 0.
+
+#### Read GICR_VPENDBASER.PendingLast
+
+The Redstributor retrieves any pending virtual interrupts from the virtual
+CPU interface and updates it in PendingLast bit.
+So we could read PendingLast bit to tell whether there are pending and enabled
+interrupts for the last scheduled vPE.
+
+### vPE scheduling
+
+The whole process about scheduling vPE includes the following steps:
+
+#### Change vPE affinity if needed through VMOVP command
+
+Before making the VPE resident, we need to make sure the redistributor
+expects us here.
+Changing vPE affinity could be done through VMOVP command, and it is up
+to GITS_TYPER.VMOVP feature bit to tell whether software is responsible
+for propagating the updated mapping or the hardware is.
+
+A system can include multiple ITSs. Where more than one ITS has mappings for a
+vPE, any change must be applied to all ITSs that contain the original mappings.
+GICv4.0 supports two models for doing this, and GITS_TYPER.VMOVP indicates
+which model is used.
+
+##### GITS_TYPER.VMOVP == 0
+
+The VMOVP command must be issued on all ITSs with a mapping for the vPE.
+It is software's responsibility to propagate the change and handle
+synchronization.
+
+##### GITS_TYPER.VMOVP == 1
+
+The VMOVP command must be issued on only one ITS.
+It is hardware's responsibility to propagate the change and handle
+synchronization.
+
+#### Write GICR_VPROPBASER.Physical_Address
+
+GICR_VPROPBASER.Physical_Address contains the physical address of virtual
+LPI Configuration table for scheduling vPE.
+
+#### Write GICR_VPENDBASER.Physical_Address
+
+GICR_VPENDBASER.Physical_Address contains the physical address of virtual
+LPI pending table.
+
+#### Set GICR_VPENDBASER.Valid 1
+
+Setting the Valid bit to 1 informs the Redistributor that the new vPE is
+now valid, and that virtual interrupts for that vPE can be forwarded to the
+virtual CPU interface.
+
+## Doorbell handling
+
+Each vPE is allocated and configured with a doorbell interrupt through VMAPTI
+command in GICv4.0, which is a physical LPI and gets fired by hardware each
+time a VLPI is made pending whilst the vcpu is not running.
+
+The hypervisor monitor the doorbell the same way we listen to a normal physical
+LPI. Each time we catch a doorbell, we let hypervisor handle it by kicking its
+target, not-running vPE.
+
+In GICv4.0, in order to utilize doorbell interrupt, each time the vPE gets
+scheduled out/blocked, the doorbell interrupt need to be enabled. And when
+the vPE gets scheduled in/unblocked, the doorbell interrupt need to be disabled.
+
+# Main drawback on GICv4.0
+    * Doorbell gets enabled on entering vPE blocked state, like trapping from
+WFI, and disabled on leaving it. It requires frequently reconfiguring the
+doorbell(physical LPI) at runtime, which at most requires 6 ITS commands in
+one way and send the cost of a WFI to the roof.
+    * Doorbells are per-vLPI in GICv4.0. We use VMAPTI command to configure
+doorbell for a vLPI mapping(DevID/EventID -> vLPI). However, it shall be
+per-vPE to conform to semantic logic.
+    * GICv4.0 makes a point in always having the half information at the place.
+The ITS knows about the vLPI mapping, the doorbell and the target redistributor,
+but not the property and pending table. While the redistributor only knows
+about the tables when the vcpu is resident.
+
+All Above drawbacks will be fixed in GICv4.1 hardware.
+
+# Limitations
+
+   * Since current GICv3 vLPI support is only applicable on hardware domain,
+this restriction applies to current GICv4.0 design too.
+
+# Reference
+
+[1] https://developer.arm.com/documentation/ihi0069/latest/
+[2] https://lore.kernel.org/linux-arm-kernel/20170628150411.15846-1-marc.zyngier@arm.com/
-- 
2.25.1


