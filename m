Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7F8472E7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675080.1050292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvHj-0007Oq-IQ; Fri, 02 Feb 2024 15:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675080.1050292; Fri, 02 Feb 2024 15:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvHj-0007Ko-Ex; Fri, 02 Feb 2024 15:16:55 +0000
Received: by outflank-mailman (input) for mailman id 675080;
 Fri, 02 Feb 2024 15:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVvHi-0005mR-4D
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:16:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 174f9951-c1de-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 16:16:51 +0100 (CET)
Received: from beta.station (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id 90D444EE0740;
 Fri,  2 Feb 2024 16:16:50 +0100 (CET)
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
X-Inumbo-ID: 174f9951-c1de-11ee-98f5-efadbce2ee36
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 4/4] eclair: move function and macro properties outside ECLAIR
Date: Fri,  2 Feb 2024 16:16:05 +0100
Message-Id: <387b160ae93c221c4bc2426605b96b432b26224e.1706886631.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706886631.git.simone.ballarin@bugseng.com>
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Function and macro properties contained in ECLAIR/call_properties.ecl are of
general interest: this patch moves these annotations in a generaric JSON file
in docs. In this way, they can be exploited for other purposes (i.e. documentation,
other tools).

Add rst file containing explanation on how to update function_macro_properties.json.
Add script to convert the JSON file in ECL configurations.
Remove ECLAIR/call_properties.ecl: the file is now automatically generated from
the JSON file.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

---
Changes in v4:
- add missing script for converting the JSON file in ECL configurations;
- improve commit message;
- remove call_properties.ecs.
---
 .../eclair_analysis/ECLAIR/analysis.ecl       |   1 +
 .../ECLAIR/call_properties.ecl                | 128 ---
 automation/eclair_analysis/prepare.sh         |   2 +
 automation/eclair_analysis/propertyparser.py  |  37 +
 docs/function_macro_properties.json           | 841 ++++++++++++++++++
 docs/function_macro_properties.rst            |  58 ++
 6 files changed, 939 insertions(+), 128 deletions(-)
 delete mode 100644 automation/eclair_analysis/ECLAIR/call_properties.ecl
 create mode 100644 automation/eclair_analysis/propertyparser.py
 create mode 100644 docs/function_macro_properties.json
 create mode 100644 docs/function_macro_properties.rst

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index a604582da3..684c5b0b39 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -30,6 +30,7 @@ if(not(scheduled_analysis),
 -eval_file=deviations.ecl
 -eval_file=call_properties.ecl
 -eval_file=tagging.ecl
+-eval_file=properties.ecl
 -eval_file=concat(set,".ecl")
 
 -doc="Hide reports in external code."
diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automation/eclair_analysis/ECLAIR/call_properties.ecl
deleted file mode 100644
index c2b2a6182e..0000000000
--- a/automation/eclair_analysis/ECLAIR/call_properties.ecl
+++ /dev/null
@@ -1,128 +0,0 @@
-
--call_properties+={"name(printk)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"name(debugtrace_printk)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"name(panic)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"macro(^domain_crash$)", {"pointee_write(2..=never)", "taken()"}}
--call_properties+={"macro(^(g?d|mm_)?printk$)", {"pointee_write(2..=never)", "taken()"}}
--call_properties+={"macro(^guest_bug_on_failed$)", {"pointee_write(1=never)", "taken()"}}
--call_properties+={"macro(^spin_lock_init_prof$)", {"pointee_write(2=never)", "taken()"}}
--call_properties+={"macro(^sched_test_func$)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"macro(^dev_(info|warn)$)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"macro(^PAGING_DEBUG$)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"macro(^ACPI_(WARNING|ERROR|INFO)$)", {"pointee_write(1..=never)", "taken()"}}
--call_properties+={"name(fdt_get_property_by_offset_)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(read_atomic_size)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(device_tree_get_reg)", {"pointee_write(4..=always)", "pointee_read(4..=never)", "taken()"}}
--call_properties+={"name(dt_get_range)", {"pointee_write(3..=always)", "pointee_read(3..=never)", "taken()"}}
--call_properties+={"name(parse_static_mem_prop)", {"pointee_write(2..=always)", "pointee_read(2..=never)", "taken()"}}
--call_properties+={"name(get_ttbr_and_gran_64bit)", {"pointee_write(1..2=always)", "pointee_read(1..2=never)", "taken()"}}
--call_properties+={"name(hvm_emulate_init_once)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(__vmread)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(hvm_pci_decode_addr)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(vpci_mmcfg_decode_addr)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(x86emul_decode)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(unmap_grant_ref)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(arm_smmu_cmdq_build_cmd)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(pci_size_mem_bar)", {"pointee_write(4=always)", "pointee_read(4=never)", "taken()"}}
--call_properties+={"name(_hvm_read_entry)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(hvm_map_guest_frame_rw)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(guest_cpuid)", {"pointee_write(4=always)", "pointee_read(4=never)", "taken()"}}
--call_properties+={"name(epte_get_entry_emt)", {"pointee_write(5=always)", "pointee_read(5=never)", "taken()"}}
--call_properties+={"name(mcheck_mca_logout)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(set_field_in_reg_u32)", {"pointee_write(5=always)", "pointee_read(5=never)", "taken()"}}
--call_properties+={"name(alloc_affinity_masks)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(xasprintf)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(find_non_smt)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(call_rcu)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(getdomaininfo)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"^MAPPING_(INSERT|SEARCH)\\(.*$", {"pointee_write(2..=always)", "pointee_read(2..=never)", "taken()"}}
--call_properties+={"name(FormatDec)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(FormatHex)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(p2m_get_ioreq_server)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(elf_memset_unchecked)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(set_iommu_pte_present)", {"pointee_write(7=always)", "pointee_read(7=never)", "taken()"}}
--call_properties+={"name(clear_iommu_pte_present)", {"pointee_write(4=always)", "pointee_read(4=never)", "taken()"}}
--call_properties+={"name(vcpu_runstate_get)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(va_start)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(sgi_target_init)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(get_hw_residencies)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(x86_cpu_policy_to_featureset)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"^simple_strtou?ll?\\(.*$", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(msi_compose_msg)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(print_tainted)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(get_hvm_registers)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(x86_insn_modrm)", {"pointee_write(2..3=always)", "pointee_read(2..3=never)", "taken()"}}
--call_properties+={"name(cpuid_count_leaf)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--call_properties+={"name(rcu_lock_remote_domain_by_id)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(cpuid_count)", {"pointee_write(3..=always)", "pointee_read(3..=never)", "taken()"}}
--call_properties+={"name(efi_boot_mem_unused)", {"pointee_write(1..=always)", "pointee_read(1..=never)", "taken()"}}
--call_properties+={"name(collect_time_info)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--call_properties+={"name(setup_xstate_comp)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"name(map_domain_gfn)", {"pointee_read(5=never)", "taken()"}}
--call_properties+={"name(fdt_getprop)", {"pointee_read(4=never)", "taken()"}}
--call_properties+={"name(fdt_get_name)", {"pointee_read(3=never)", "taken()"}}
--call_properties+={"name(fdt_get_property)", {"pointee_read(4=never)", "taken()"}}
--call_properties+={"name(pci_get_host_bridge_segment)", {"pointee_read(2=never)", "taken()"}}
--call_properties+={"name(dt_get_property)", {"pointee_read(3=never)", "taken()"}}
--call_properties+={"name(dt_property_read_u32)", {"pointee_read(3=never)", "taken()"}}
--call_properties+={"name(dt_device_get_paddr)", {"pointee_read(3..4=never)", "taken()"}}
--call_properties+={"name(get_evtchn_dt_property)", {"pointee_write(2..3=maybe)", "pointee_read(2..3=never)", "taken()"}}
--call_properties+={"name(setup_chosen_node)", {"pointee_write(2..3=maybe)", "pointee_read(2..3=never)", "taken()"}}
--call_properties+={"name(queue_remove_raw)", {"pointee_read(2=never)", "taken()"}}
--call_properties+={"macro(^memset$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"macro(^va_start$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"macro(^memcmp$)", {"pointee_write(1..2=never)", "taken()"}}
--call_properties+={"macro(^memcpy$)", {"pointee_write(1=always&&2..=never)", "pointee_read(1=never&&2..=always)", "taken()"}}
--call_properties+={"name(get_cpu_info)",{pure}}
--call_properties+={"name(pdx_to_pfn)",{pure}}
--call_properties+={"name(is_pci_passthrough_enabled)",{const}}
--call_properties+={"name(get_cycles)", {"noeffect"}}
--call_properties+={"name(msi_gflags)",{const}}
--call_properties+={"name(hvm_save_size)",{pure}}
--call_properties+={"name(cpu_has)",{pure}}
--call_properties+={"name(boot_cpu_has)",{pure}}
--call_properties+={"name(get_cpu_info)",{pure}}
--call_properties+={"name(put_pte_flags)",{const}}
--call_properties+={"name(is_pv_vcpu)",{pure}}
-
--doc_begin="Property inferred as a consequence of the semantics of device_tree_get_reg"
--call_properties+={"name(acquire_static_memory_bank)", {"pointee_write(4..=always)", "pointee_read(4..=never)", "taken()"}}
--doc_end
-
--doc_begin="Property inferred as a consequence of the semantics of dt_set_cell"
--call_properties+={"name(set_interrupt)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--doc_end
-
--doc_begin="Property inferred as a consequence of the semantics of __p2m_get_mem_access"
--call_properties+={"name(p2m_get_mem_access)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
--doc_end
-
--doc_begin="This function has alternative definitions with props {write=always,read=never} and {write=never,read=never}"
--call_properties+={"name(alloc_cpumask_var)", {"pointee_write(1=maybe)", "pointee_read(1=never)", "taken()"}}
--doc_end
-
--doc_begin="Property inferred as a consequence of the semantics of alloc_cpumask_var"
--call_properties+={"name(xenctl_bitmap_to_cpumask)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--doc_end
-
--doc_begin="The call to bitmap_and causes the pointee of dstp to be always written"
--call_properties+={"^cpumask_(and|andnot|clear|copy|complement).*$", {"pointee_write(1=always)", "pointee_read(1=never)" "taken()"}}
--call_properties+={"^bitmap_(andnot|complement|fill).*$", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--doc_end
-
--doc_begin="The .*copy_(to|from).* helpers all have a memcpy-like expectation that the destination is a copy of the source.
-Furthermore, their uses do initialize the involved variables as needed by futher uses in the caller."
--call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
--call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
--doc_end
-
--doc_begin="Functions generated by build_atomic_read cannot be considered pure
-since the input pointer is volatile, but they do not produce any persistent side
-effect."
--call_properties+={"^read_u(8|16|32|64|int)_atomic.*$", {noeffect}}
--doc_end
-
--doc_begin="Functions generated by TYPE_SAFE are const."
--call_properties+={"^(mfn|gfn|pfn)_x\\(.*$",{const}}
--call_properties+={"^_(mfn|gfn|pfn)\\(.*$",{const}}
--doc_end
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index fe9d16e48e..47b2a2f32a 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -43,4 +43,6 @@ fi
     make -f "${script_dir}/Makefile.prepare" prepare
     # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
     scripts/xen-analysis.py --run-eclair --no-build --no-clean
+    # Translate function-properties.json into ECLAIR properties
+    python3 ${script_dir}/propertyparser.py
 )
diff --git a/automation/eclair_analysis/propertyparser.py b/automation/eclair_analysis/propertyparser.py
new file mode 100644
index 0000000000..0d02f505a6
--- /dev/null
+++ b/automation/eclair_analysis/propertyparser.py
@@ -0,0 +1,37 @@
+import json
+import os
+
+script_dir = os.path.dirname(__file__)
+properties_path = os.path.join(script_dir, "../../docs/function_macro_properties.json")
+output_path   = os.path.join(script_dir, "ECLAIR/call_properties.ecl")
+
+with open(properties_path) as fp:
+    properties = json.load(fp)['content']
+
+ecl = open(output_path, 'w')
+
+for record in properties:
+
+    string = "-call_properties+={\""
+    if record['type'] == "function":
+        string += f"{record['value']}\", {{".replace("\\", "\\\\")
+    else:
+        string += f"{record['type']}({record['value']})\", {{".replace("\\", "\\\\")
+
+    i=0
+    for prop in record['properties'].items():
+        if prop[0] == 'attribute':
+            string += prop[1]
+            i+=1
+        else:
+            string += f"\"{prop[0]}({prop[1]})\""
+            i+=1
+
+        if i<len(record['properties']):
+            string += ", "
+        else:
+            string +="}}\n"
+
+    ecl.write(string)
+
+ecl.close()
diff --git a/docs/function_macro_properties.json b/docs/function_macro_properties.json
new file mode 100644
index 0000000000..74058297b5
--- /dev/null
+++ b/docs/function_macro_properties.json
@@ -0,0 +1,841 @@
+{
+   "version": "1.0",
+   "content": [
+      {
+         "type": "function",
+         "value": "^printk.*$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^debugtrace_printk.*$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^panic.*$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^domain_crash$",
+         "properties":{
+            "pointee_write": "2..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^(g?d|mm_)?printk$",
+         "properties":{
+            "pointee_write": "2..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^guest_bug_on_failed$",
+         "properties":{
+            "pointee_write": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^spin_lock_init_prof$",
+         "properties":{
+            "pointee_write": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^sched_test_func$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^dev_(info|warn)$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^PAGING_DEBUG$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^ACPI_(WARNING|ERROR|INFO)$",
+         "properties":{
+            "pointee_write": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^fdt_get_property_by_offset_.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^read_atomic_size.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^device_tree_get_reg.*$",
+         "properties":{
+            "pointee_write": "4..=always",
+            "pointee_read": "4..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^dt_get_range.*$",
+         "properties":{
+            "pointee_write": "3..=always",
+            "pointee_read": "3..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^parse_static_mem_prop.*$",
+         "properties":{
+            "pointee_write": "2..=always",
+            "pointee_read": "2..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_ttbr_and_gran_64bit.*$",
+         "properties":{
+            "pointee_write": "1..2=always",
+            "pointee_read": "1..2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^hvm_emulate_init_once.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^__vmread.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^hvm_pci_decode_addr.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^vpci_mmcfg_decode_addr.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^x86emul_decode.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^unmap_grant_ref.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^arm_smmu_cmdq_build_cmd.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^pci_size_mem_bar.*$",
+         "properties":{
+            "pointee_write": "4=always",
+            "pointee_read": "4=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^_hvm_read_entry.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^hvm_map_guest_frame_rw.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^guest_cpuid.*$",
+         "properties":{
+            "pointee_write": "4=always",
+            "pointee_read": "4=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^epte_get_entry_emt.*$",
+         "properties":{
+            "pointee_write": "5=always",
+            "pointee_read": "5=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^mcheck_mca_logout.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^set_field_in_reg_u32.*$",
+         "properties":{
+            "pointee_write": "5=always",
+            "pointee_read": "5=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^alloc_affinity_masks.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^xasprintf.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^find_non_smt.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^call_rcu.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^getdomaininfo.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^MAPPING_(INSERT|SEARCH)\\(.*$",
+         "properties":{
+            "pointee_write": "2..=always",
+            "pointee_read": "2..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^FormatDec.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^FormatHex.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^p2m_get_ioreq_server.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^elf_memset_unchecked.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^set_iommu_pte_present.*$",
+         "properties":{
+            "pointee_write": "7=always",
+            "pointee_read": "7=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^clear_iommu_pte_present.*$",
+         "properties":{
+            "pointee_write": "4=always",
+            "pointee_read": "4=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^vcpu_runstate_get.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^va_start.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^sgi_target_init.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_hw_residencies.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^x86_cpu_policy_to_featureset.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^simple_strtou?ll?\\(.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^msi_compose_msg.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^print_tainted.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_hvm_registers.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^x86_insn_modrm.*$",
+         "properties":{
+            "pointee_write": "2..3=always",
+            "pointee_read": "2..3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^cpuid_count_leaf.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^rcu_lock_remote_domain_by_id.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^cpuid_count.*$",
+         "properties":{
+            "pointee_write": "3..=always",
+            "pointee_read": "3..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^.*efi_boot_mem_unused.*$",
+         "properties":{
+            "pointee_write": "1..=always",
+            "pointee_read": "1..=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^collect_time_info.*$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^setup_xstate_comp.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^map_domain_gfn.*$",
+         "properties":{
+            "pointee_read": "5=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^fdt_getprop.*$",
+         "properties":{
+            "pointee_read": "4=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^fdt_get_name.*$",
+         "properties":{
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^fdt_get_property.*$",
+         "properties":{
+            "pointee_read": "4=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^pci_get_host_bridge_segment.*$",
+         "properties":{
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^dt_get_property.*$",
+         "properties":{
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^dt_property_read_u32.*$",
+         "properties":{
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^dt_device_get_paddr.*$",
+         "properties":{
+            "pointee_read": "3..4=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_evtchn_dt_property.*$",
+         "properties":{
+            "pointee_write": "2..3=maybe",
+            "pointee_read": "2..3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^setup_chosen_node.*$",
+         "properties":{
+            "pointee_write": "2..3=maybe",
+            "pointee_read": "2..3=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^queue_remove_raw.*$",
+         "properties":{
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^memset$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^va_start$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^memcmp$",
+         "properties":{
+            "pointee_write": "1..2=never",
+            "taken": ""
+         }
+      },
+      {
+         "type": "macro",
+         "value": "^memcpy$",
+         "properties":{
+            "pointee_write": "1=always&&2..=never",
+            "pointee_read": "1=never&&2..=always",
+            "taken": ""
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_cpu_info.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^pdx_to_pfn.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^is_pci_passthrough_enabled.*$",
+         "properties":{
+            "attribute": "const"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_cycles.*$",
+         "properties":{
+            "attribute": "noeffect"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^msi_gflags.*$",
+         "properties":{
+            "attribute": "const"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^hvm_save_size.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^cpu_has.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^boot_cpu_has.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^get_cpu_info.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^put_pte_flags.*$",
+         "properties":{
+            "attribute": "const"
+         }
+      },
+      {
+         "type": "function",
+         "value": "^is_pv_cpu.*$",
+         "properties":{
+            "attribute": "pure"
+         }
+      },
+      {
+         "description": "Property inferred as a consequence of the semantics of device_tree_get_reg",
+         "type": "function",
+         "value": "^acquire_static_memory_bank.*$",
+         "properties":{
+            "pointee_write": "4..=always",
+            "pointee_read": "4..=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "Property inferred as a consequence of the semantics of dt_set_cell",
+         "type": "function",
+         "value": "^set_interrupt.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "description":"Property inferred as a consequence of the semantics of __p2m_get_mem_access",
+         "type": "function",
+         "value": "^p2m_get_mem_access.*$",
+         "properties":{
+            "pointee_write": "3=always",
+            "pointee_read": "3=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "This function has alternative definitions with props {write=always,read=never} and {write=never,read=never}",
+         "type": "function",
+         "value": "^alloc_cpumask_var.*$",
+         "properties":{
+            "pointee_write": "1=maybe",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "Property inferred as a consequence of the semantics of alloc_cpumask_var",
+         "type": "function",
+         "value": "^xenctl_bitmap_to_cpumask.*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "The call to bitmap_and causes the pointee of dstp to be always written",
+         "type": "function",
+         "value": "^cpumask_(and|andnot|clear|copy|complement).*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "The call to bitmap_and causes the pointee of dstp to be always written",
+         "type": "function",
+         "value": "^bitmap_(andnot|complement|fill).*$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "The .*copy_(to|from).* helpers all have a memcpy-like expectation that the destination is a copy of the source. Furthermore, their uses do initialize the involved variables as needed by futher uses in the caller.",
+         "type": "macro",
+         "value": "^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$",
+         "properties":{
+            "pointee_write": "1=always",
+            "pointee_read": "1=never",
+            "taken": ""
+         }
+      },
+      {
+         "description":"The .*copy_(to|from).* helpers all have a memcpy-like expectation that the destination is a copy of the source. Furthermore, their uses do initialize the involved variables as needed by futher uses in the caller.",
+         "type": "macro",
+         "value": "^(__)?copy_to_(guest|compat)(_offset)?$",
+         "properties":{
+            "pointee_write": "2=always",
+            "pointee_read": "2=never",
+            "taken": ""
+         }
+      },
+      {
+         "description": "Functions generated by build_atomic_read cannot be considered pure since the input pointer is volatile, but they do not produce any persistent side effect.",
+         "type": "function",
+         "value": "^read_u(8|16|32|64|int)_atomic.*$",
+         "properties":{
+            "attribute": "noeffect"
+         }
+      },
+      {
+         "description": "Functions generated by TYPE_SAFE are const.",
+         "type": "function",
+         "value": "^(mfn|gfn|pfn)_x\\(.*$",
+         "properties":{
+            "attribute": "const"
+         }
+      },
+      {
+         "description": "Functions generated by TYPE_SAFE are const.",
+         "type": "function",
+         "value": "^_(mfn|gfn|pfn)\\(.*$",
+         "properties":{
+            "attribute": "const"
+         }
+      }
+   ]
+}
diff --git a/docs/function_macro_properties.rst b/docs/function_macro_properties.rst
new file mode 100644
index 0000000000..ea6fb5cf1f
--- /dev/null
+++ b/docs/function_macro_properties.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Properties list for Xen
+=======================
+
+Some functions and macros are found to have properties relevant to
+the Xen codebase. For this reason, the file docs/properties.json
+contains all the needed properties.
+
+Here is an example of the properties.json file::
+
+  {
+     "version": "1.0",
+     "content": [
+        {
+           "description": ""
+           "type": "function",       // required
+           "value:": "^printk*.$",   // required
+           "properties":{
+              "pointee_write": "1..2=never",
+              "pointee_read": "",
+              "taken": ""
+              "attribute": ""
+           }
+        }
+     ]
+  }
+
+Here is an explanation of the fields inside an object of the "content" array:
+
+ - description: a brief description of why the properties apply
+ - type: this is the kind of the element called: it may be either ``macro`` or ``function``
+ - value: must be a regex, starting with ^ and ending with $ and matching function fully
+   qualified name or macro name.
+ - properties: a list of properties applied to said function.
+   Possible values are:
+
+    - pointee_write: indicate the write use for call arguments that correspond to
+      parameters whose pointee types are non-const
+    - pointee_read: indicate the read use for call arguments that correspond to
+      parameters whose pointee types are non-const
+    - taken: indicates that the specified address arguments may be stored in objects
+      that persist after the function has ceased to exist (excluding the returned value);
+      address arguments not listed are never taken
+    - attribute: attributes a function may have. Possible values are pure, const and noeffect.
+
+   pointee_read and pointee_write use a specific kind of argument, structured as pointee_arg=rw:
+
+    - pointee_arg: argument index for callee. Index 0 refers to the return value,
+      the indices of the arguments start from 1. It can be either a single value or a range.
+    - rw: a value that's either always, maybe or never
+
+       - always: for pointee_read: argument pointee is expected to be fully read in the function body,
+         for pointee_write: argument pointee is fully initialized at function exit
+       - maybe: for pointee_read: argument pointee may be expected to be read in the function body,
+         for pointee_write: argument pointee may be written by function body
+       - never: for pointee_read: argument pointee is not expected to be read in the function body,
+         for pointee_write: argument pointee is never written by function body
-- 
2.34.1


