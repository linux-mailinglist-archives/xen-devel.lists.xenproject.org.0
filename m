Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE8846EA9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 12:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674995.1050183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVrO1-0003yW-Ux; Fri, 02 Feb 2024 11:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674995.1050183; Fri, 02 Feb 2024 11:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVrO1-0003wF-R1; Fri, 02 Feb 2024 11:07:09 +0000
Received: by outflank-mailman (input) for mailman id 674995;
 Fri, 02 Feb 2024 11:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVrNz-0003w5-QL
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 11:07:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3294e83d-c1bb-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 12:07:04 +0100 (CET)
Received: from [192.168.1.9] (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id E42604EE0737;
 Fri,  2 Feb 2024 12:07:03 +0100 (CET)
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
X-Inumbo-ID: 3294e83d-c1bb-11ee-98f5-efadbce2ee36
Message-ID: <97949032-6c87-4a02-a239-700ac8468968@bugseng.com>
Date: Fri, 2 Feb 2024 12:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] eclair: add and manage properties
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
 <bc9bdf2b16a6131f476e6e1f491cf04629f431cf.1706700228.git.maria.celeste.cesario@bugseng.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <bc9bdf2b16a6131f476e6e1f491cf04629f431cf.1706700228.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/24 10:37, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add JSON file containing properties.
> Add rst file containing explanation on how to update properties.json.
> Add instruction to eclair_analysis/prepare.sh to parse the JSON file.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> ---
>   .../eclair_analysis/ECLAIR/analysis.ecl       |   1 +
>   automation/eclair_analysis/prepare.sh         |   2 +
>   docs/properties.json                          | 841 ++++++++++++++++++
>   docs/properties.rst                           |  58 ++
>   4 files changed, 902 insertions(+)
>   create mode 100644 docs/properties.json
>   create mode 100644 docs/properties.rst
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index a604582da3..684c5b0b39 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -30,6 +30,7 @@ if(not(scheduled_analysis),
>   -eval_file=deviations.ecl
>   -eval_file=call_properties.ecl
>   -eval_file=tagging.ecl
> +-eval_file=properties.ecl
>   -eval_file=concat(set,".ecl")
>   
>   -doc="Hide reports in external code."
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> index fe9d16e48e..47b2a2f32a 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -43,4 +43,6 @@ fi
>       make -f "${script_dir}/Makefile.prepare" prepare
>       # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
>       scripts/xen-analysis.py --run-eclair --no-build --no-clean
> +    # Translate function-properties.json into ECLAIR properties
> +    python3 ${script_dir}/propertyparser.py
>   )
> diff --git a/docs/properties.json b/docs/properties.json
> new file mode 100644
> index 0000000000..74058297b5
> --- /dev/null
> +++ b/docs/properties.json
> @@ -0,0 +1,841 @@
> +{
> +   "version": "1.0",
> +   "content": [
> +      {
> +         "type": "function",
> +         "value": "^printk.*$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^debugtrace_printk.*$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^panic.*$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^domain_crash$",
> +         "properties":{
> +            "pointee_write": "2..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^(g?d|mm_)?printk$",
> +         "properties":{
> +            "pointee_write": "2..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^guest_bug_on_failed$",
> +         "properties":{
> +            "pointee_write": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^spin_lock_init_prof$",
> +         "properties":{
> +            "pointee_write": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^sched_test_func$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^dev_(info|warn)$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^PAGING_DEBUG$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^ACPI_(WARNING|ERROR|INFO)$",
> +         "properties":{
> +            "pointee_write": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^fdt_get_property_by_offset_.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^read_atomic_size.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^device_tree_get_reg.*$",
> +         "properties":{
> +            "pointee_write": "4..=always",
> +            "pointee_read": "4..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^dt_get_range.*$",
> +         "properties":{
> +            "pointee_write": "3..=always",
> +            "pointee_read": "3..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^parse_static_mem_prop.*$",
> +         "properties":{
> +            "pointee_write": "2..=always",
> +            "pointee_read": "2..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_ttbr_and_gran_64bit.*$",
> +         "properties":{
> +            "pointee_write": "1..2=always",
> +            "pointee_read": "1..2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^hvm_emulate_init_once.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^__vmread.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^hvm_pci_decode_addr.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^vpci_mmcfg_decode_addr.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^x86emul_decode.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^unmap_grant_ref.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^arm_smmu_cmdq_build_cmd.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^pci_size_mem_bar.*$",
> +         "properties":{
> +            "pointee_write": "4=always",
> +            "pointee_read": "4=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^_hvm_read_entry.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^hvm_map_guest_frame_rw.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^guest_cpuid.*$",
> +         "properties":{
> +            "pointee_write": "4=always",
> +            "pointee_read": "4=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^epte_get_entry_emt.*$",
> +         "properties":{
> +            "pointee_write": "5=always",
> +            "pointee_read": "5=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^mcheck_mca_logout.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^set_field_in_reg_u32.*$",
> +         "properties":{
> +            "pointee_write": "5=always",
> +            "pointee_read": "5=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^alloc_affinity_masks.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^xasprintf.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^find_non_smt.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^call_rcu.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^getdomaininfo.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^MAPPING_(INSERT|SEARCH)\\(.*$",
> +         "properties":{
> +            "pointee_write": "2..=always",
> +            "pointee_read": "2..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^FormatDec.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^FormatHex.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^p2m_get_ioreq_server.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^elf_memset_unchecked.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^set_iommu_pte_present.*$",
> +         "properties":{
> +            "pointee_write": "7=always",
> +            "pointee_read": "7=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^clear_iommu_pte_present.*$",
> +         "properties":{
> +            "pointee_write": "4=always",
> +            "pointee_read": "4=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^vcpu_runstate_get.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^va_start.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^sgi_target_init.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_hw_residencies.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^x86_cpu_policy_to_featureset.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^simple_strtou?ll?\\(.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^msi_compose_msg.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^print_tainted.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_hvm_registers.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^x86_insn_modrm.*$",
> +         "properties":{
> +            "pointee_write": "2..3=always",
> +            "pointee_read": "2..3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^cpuid_count_leaf.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^rcu_lock_remote_domain_by_id.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^cpuid_count.*$",
> +         "properties":{
> +            "pointee_write": "3..=always",
> +            "pointee_read": "3..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^.*efi_boot_mem_unused.*$",
> +         "properties":{
> +            "pointee_write": "1..=always",
> +            "pointee_read": "1..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^collect_time_info.*$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^setup_xstate_comp.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^map_domain_gfn.*$",
> +         "properties":{
> +            "pointee_read": "5=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^fdt_getprop.*$",
> +         "properties":{
> +            "pointee_read": "4=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^fdt_get_name.*$",
> +         "properties":{
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^fdt_get_property.*$",
> +         "properties":{
> +            "pointee_read": "4=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^pci_get_host_bridge_segment.*$",
> +         "properties":{
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^dt_get_property.*$",
> +         "properties":{
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^dt_property_read_u32.*$",
> +         "properties":{
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^dt_device_get_paddr.*$",
> +         "properties":{
> +            "pointee_read": "3..4=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_evtchn_dt_property.*$",
> +         "properties":{
> +            "pointee_write": "2..3=maybe",
> +            "pointee_read": "2..3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^setup_chosen_node.*$",
> +         "properties":{
> +            "pointee_write": "2..3=maybe",
> +            "pointee_read": "2..3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^queue_remove_raw.*$",
> +         "properties":{
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^memset$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^va_start$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^memcmp$",
> +         "properties":{
> +            "pointee_write": "1..2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "macro",
> +         "value": "^memcpy$",
> +         "properties":{
> +            "pointee_write": "1=always&&2..=never",
> +            "pointee_read": "1=never&&2..=always",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_cpu_info.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^pdx_to_pfn.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^is_pci_passthrough_enabled.*$",
> +         "properties":{
> +            "attribute": "const"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_cycles.*$",
> +         "properties":{
> +            "attribute": "noeffect"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^msi_gflags.*$",
> +         "properties":{
> +            "attribute": "const"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^hvm_save_size.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^cpu_has.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^boot_cpu_has.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^get_cpu_info.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^put_pte_flags.*$",
> +         "properties":{
> +            "attribute": "const"
> +         }
> +      },
> +      {
> +         "type": "function",
> +         "value": "^is_pv_cpu.*$",
> +         "properties":{
> +            "attribute": "pure"
> +         }
> +      },
> +      {
> +         "description": "Property inferred as a consequence of the semantics of device_tree_get_reg",
> +         "type": "function",
> +         "value": "^acquire_static_memory_bank.*$",
> +         "properties":{
> +            "pointee_write": "4..=always",
> +            "pointee_read": "4..=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "Property inferred as a consequence of the semantics of dt_set_cell",
> +         "type": "function",
> +         "value": "^set_interrupt.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description":"Property inferred as a consequence of the semantics of __p2m_get_mem_access",
> +         "type": "function",
> +         "value": "^p2m_get_mem_access.*$",
> +         "properties":{
> +            "pointee_write": "3=always",
> +            "pointee_read": "3=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "This function has alternative definitions with props {write=always,read=never} and {write=never,read=never}",
> +         "type": "function",
> +         "value": "^alloc_cpumask_var.*$",
> +         "properties":{
> +            "pointee_write": "1=maybe",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "Property inferred as a consequence of the semantics of alloc_cpumask_var",
> +         "type": "function",
> +         "value": "^xenctl_bitmap_to_cpumask.*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "The call to bitmap_and causes the pointee of dstp to be always written",
> +         "type": "function",
> +         "value": "^cpumask_(and|andnot|clear|copy|complement).*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "The call to bitmap_and causes the pointee of dstp to be always written",
> +         "type": "function",
> +         "value": "^bitmap_(andnot|complement|fill).*$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "The .*copy_(to|from).* helpers all have a memcpy-like expectation that the destination is a copy of the source. Furthermore, their uses do initialize the involved variables as needed by futher uses in the caller.",
> +         "type": "macro",
> +         "value": "^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$",
> +         "properties":{
> +            "pointee_write": "1=always",
> +            "pointee_read": "1=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description":"The .*copy_(to|from).* helpers all have a memcpy-like expectation that the destination is a copy of the source. Furthermore, their uses do initialize the involved variables as needed by futher uses in the caller.",
> +         "type": "macro",
> +         "value": "^(__)?copy_to_(guest|compat)(_offset)?$",
> +         "properties":{
> +            "pointee_write": "2=always",
> +            "pointee_read": "2=never",
> +            "taken": ""
> +         }
> +      },
> +      {
> +         "description": "Functions generated by build_atomic_read cannot be considered pure since the input pointer is volatile, but they do not produce any persistent side effect.",
> +         "type": "function",
> +         "value": "^read_u(8|16|32|64|int)_atomic.*$",
> +         "properties":{
> +            "attribute": "noeffect"
> +         }
> +      },
> +      {
> +         "description": "Functions generated by TYPE_SAFE are const.",
> +         "type": "function",
> +         "value": "^(mfn|gfn|pfn)_x\\(.*$",
> +         "properties":{
> +            "attribute": "const"
> +         }
> +      },
> +      {
> +         "description": "Functions generated by TYPE_SAFE are const.",
> +         "type": "function",
> +         "value": "^_(mfn|gfn|pfn)\\(.*$",
> +         "properties":{
> +            "attribute": "const"
> +         }
> +      }
> +   ]
> +}
> diff --git a/docs/properties.rst b/docs/properties.rst
> new file mode 100644
> index 0000000000..790f1ede1e
> --- /dev/null
> +++ b/docs/properties.rst
> @@ -0,0 +1,58 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Properties list for Xen
> +=======================
> +
> +Some functions and macros are found to have properties relevant to
> +the Xen codebase. For this reason, the file docs/properties.json
> +contains all the needed properties.
> +
> +Here is an example of the properties.json file::
> +
> +  {
> +     "version": "1.0",
> +     "content": [
> +        {
> +           "description": ""
> +           "type": "function",       // required
> +           "value:": "^printk*.$",   // required
> +           "properties":{
> +              "pointee_write": "1..2=never",
> +              "pointee_read": "",
> +              "taken": ""
> +              "attribute": ""
> +           }
> +        }
> +     ]
> +  }
> +
> +Here is an explanation of the fields inside an object of the "content" array:
> +
> + - description: a brief description of why the properties apply
> + - type: this is the kind of the element called: it may be either ``macro`` or ``function``
> + - value: must be a regex, starting with ^ and ending with $ and matching function fully
> +   qualified name or macro name.
> + - properties: a list of properties applied to said function.
> +   Possible values are:
> +
> +    - pointee_write: indicate the write use for call arguments that correspond to
> +      parameters whose pointee types are non-const
> +    - pointee_read: indicate the read use for call arguments that correspond to
> +      parameters whose pointee types are non-const
> +    - taken: indicates that the specified address arguments may be stored in objects
> +      that persist after the function has ceased to exist (excluding the returned value);
> +      address arguments not listed are never taken
> +    - attribute: attributes a function may have. Possible values are pure, const and noeffect.
> +
> +   pointee_read and pointee_write use a specific kind of argument, structured as pointee_arg=rw:
> +
> +    - pointee_arg: argument index for callee. Index 0 refers to the return value,
> +      the indices of the arguments start from 1. It can be either a single value or a range.
> +    - rw: a value that's either always, maybe or never
> +
> +       - always: for pointee_read: argument pointee is expected to be fully initialized at function enter,
> +         for pointee_write: argument pointee is fully initialized at function exit
> +       - maybe: for pointee_read: argument pointee may be expected to be initialized at function enter,
> +         for pointee_write: argument pointee may be written by function body
> +       - never: for pointee_read: argument pointee is not expected to be read in the functions's body,
> +         for pointee_write: argument pointee is never written by function body


The script for converting the JSON in an ECL file (propertyparse.py) is missing,
so the patch as it is incomplete. Please ignore it for the moment I will provide
a v4 with the missing script.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


