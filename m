Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P7bC9kau2k+fAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 22:36:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F92C3146
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 22:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256550.1551112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2yXp-0002Bp-3C; Wed, 18 Mar 2026 21:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256550.1551112; Wed, 18 Mar 2026 21:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2yXo-00029J-VN; Wed, 18 Mar 2026 21:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1256550;
 Wed, 18 Mar 2026 21:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BOk=BS=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1w2yXn-00029D-C9
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 21:35:11 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517af195-2312-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Mar 2026 22:35:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 98F88444AA;
 Wed, 18 Mar 2026 21:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426C5C19421;
 Wed, 18 Mar 2026 21:34:59 +0000 (UTC)
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
X-Inumbo-ID: 517af195-2312-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773869699;
	bh=Z0sKaJzTVL625RHeAqUXkWbk+PwyTXe6rgvq5zdqspk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=enhKUZI1jj3ieMY8eJQdZfts0UzqIVpSvb7BNpwyEo6cCVUZVq3lzrQXsNun9R5Xp
	 zd1CJufEu7ggTl02IPQL02vxNO8ijzyn4l07satVwgFMF1cs1W5f73zso2t4w92x37
	 nW9Kzojr52ITf2ngCjyoU4hz3kfWo+O19Dc0ZQK0o8gIVL13XBhMcjbxkgr0GHNqIu
	 hEJuTBn5+/ESMFoAFZ6lP1pdiNYZWtgiw9hZDF+BjOitYdv5OaH9l66Jisr4d8N69E
	 931It9dGXXcbbh64ru+9TYZtZ9D7WNdsZ1R2sNYyXF+JT++5BxxX6xv1zaHGAsLqPN
	 Qgvd979U3ojbw==
Date: Wed, 18 Mar 2026 16:34:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Zheyun Shen <szy0127@sjtu.edu.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Xin Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Clark <james.clark@linaro.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
	Wei Huang <wei.huang2@amd.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>,
	punit.agrawal@oss.qualcomm.com, guohanjun@huawei.com,
	suzuki.poulose@arm.com, ryan.roberts@arm.com,
	chenl311@chinatelecom.cn, masahiroy@kernel.org,
	wangyuquan1236@phytium.com.cn, anshuman.khandual@arm.com,
	heinrich.schuchardt@canonical.com, Eric.VanTassell@amd.com,
	wangzhou1@hisilicon.com, wanghuiqiang@huawei.com,
	liuyonglong@huawei.com, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 1/3] ACPI: Refactor get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
Message-ID: <20260318213458.GA474040@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318060151.29438-2-fengchengwen@huawei.com>
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:mingo@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel
 .org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,huawei.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6E8F92C3146
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:01:49PM +0800, Chengwen Feng wrote:
> Unify CPU ACPI ID retrieval interface across architectures by
> refactoring get_acpi_id_for_cpu() to acpi_get_cpu_uid() on
> arm64/riscv/loongarch:
> - Add input parameter validation
> - Adjust interface to int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>   (old: u32 get_acpi_id_for_cpu(unsigned int cpu), no input check)
> 
> This refactoring (not a pure rename) enhances interface robustness while
> preparing for consistent ACPI Processor UID retrieval across all
> ACPI-enabled platforms. Valid inputs retain original behavior.
> 
> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>       arch/arm64/kernel/acpi.c to fix compilation errors from circular
>       header dependencies introduced by the rename.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/arm64/include/asm/acpi.h      | 16 +---------
>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++
>  arch/loongarch/include/asm/acpi.h  |  5 ---
>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>  arch/riscv/include/asm/acpi.h      |  4 ---
>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>  arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>  drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>  include/linux/acpi.h               | 13 ++++++++
>  11 files changed, 122 insertions(+), 43 deletions(-)

There's a lot going on in this single patch, which makes it hard to
review.  I think this might make more sense as several patches:

  - arm64: declare acpi_get_cpu_uid() in arch/arm64/include, implement
    it, and use in drivers/perf/arm_cspmu/arm_cspmu.c

  - loongarch: declare acpi_get_cpu_uid() in arch/loongarch/include
    and implement

  - riscv: declare acpi_get_cpu_uid() in arch/riscv/include, implement
    it, and use in rhct.c, riscv/kernel/acpi_numa.c

  - x86: declare acpi_get_cpu_uid() in arch/x86/include, implement it,
    and use in xen

  - declare acpi_get_cpu_uid() in include/linux/acpi.h, remove
    declarations from arm64, loongarch, riscv, x86

  - convert acpi/pptt.c to use acpi_get_cpu_uid(), remove unused
    get_acpi_id_for_cpu() from arm64, loongarch, riscv

  - use acpi_get_cpu_uid() in tph.c

Doc nit below.

> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
> index c07a58b96329..106a08556cbf 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -114,22 +114,8 @@ static inline bool acpi_has_cpu_in_madt(void)
>  }
>  
>  struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu);
> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
> -{
> -	return	acpi_cpu_get_madt_gicc(cpu)->uid;
> -}
> -
> -static inline int get_cpu_for_acpi_id(u32 uid)
> -{
> -	int cpu;
> -
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (acpi_cpu_get_madt_gicc(cpu) &&
> -		    uid == get_acpi_id_for_cpu(cpu))
> -			return cpu;
>  
> -	return -EINVAL;
> -}
> +int get_cpu_for_acpi_id(u32 uid);
>  
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  void __init acpi_init_cpus(void);
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index af90128cfed5..24b9d934be54 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -458,3 +458,33 @@ int acpi_unmap_cpu(int cpu)
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_generic_interrupt *gicc;
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	gicc = acpi_cpu_get_madt_gicc(cpu);
> +	if (!gicc)
> +		return -ENODEV;
> +
> +	*uid = gicc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> +
> +int get_cpu_for_acpi_id(u32 uid)
> +{
> +	u32 cpu_uid;
> +	int ret;
> +
> +	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret == 0 && uid == cpu_uid)
> +			return cpu;
> +	}
> +
> +	return -EINVAL;
> +}
> diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
> index 7376840fa9f7..eda9d4d0a493 100644
> --- a/arch/loongarch/include/asm/acpi.h
> +++ b/arch/loongarch/include/asm/acpi.h
> @@ -40,11 +40,6 @@ extern struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
>  
>  extern int __init parse_acpi_topology(void);
>  
> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
> -{
> -	return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
> -}
> -
>  #endif /* !CONFIG_ACPI */
>  
>  #define ACPI_TABLE_UPGRADE_MAX_PHYS ARCH_LOW_ADDRESS_LIMIT
> diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
> index 1367ca759468..058f0dbe8e8f 100644
> --- a/arch/loongarch/kernel/acpi.c
> +++ b/arch/loongarch/kernel/acpi.c
> @@ -385,3 +385,12 @@ int acpi_unmap_cpu(int cpu)
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>  
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +	*uid = acpi_core_pic[cpu_logical_map(cpu)].processor_id;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 6e13695120bc..26ab37c171bc 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -61,10 +61,6 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  
>  void acpi_init_rintc_map(void);
>  struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> -static inline u32 get_acpi_id_for_cpu(int cpu)
> -{
> -	return acpi_cpu_get_madt_rintc(cpu)->uid;
> -}
>  
>  int acpi_get_riscv_isa(struct acpi_table_header *table,
>  		       unsigned int cpu, const char **isa);
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 71698ee11621..322ea92aa39f 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -337,3 +337,19 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
>  }
>  
>  #endif	/* CONFIG_PCI */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_rintc *rintc;
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	rintc = acpi_cpu_get_madt_rintc(cpu);
> +	if (!rintc)
> +		return -ENODEV;
> +
> +	*uid = rintc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 130769e3a99c..6a2d4289f806 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -37,11 +37,14 @@ static int __init acpi_numa_get_nid(unsigned int cpu)
>  
>  static inline int get_cpu_for_acpi_id(u32 uid)
>  {
> -	int cpu;
> +	u32 cpu_uid;
> +	int ret;
>  
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (uid == get_acpi_id_for_cpu(cpu))
> +	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret == 0 && uid == cpu_uid)
>  			return cpu;
> +	}
>  
>  	return -EINVAL;
>  }
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index de5f8c018333..7bd5bc1f225a 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -459,11 +459,14 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>  {
>  	struct acpi_pptt_cache *found_cache;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> -	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	u32 acpi_cpu_id;
>  	struct cacheinfo *this_leaf;
>  	unsigned int index = 0;
>  	struct acpi_pptt_processor *cpu_node = NULL;
>  
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +		return;
> +
>  	while (index < get_cpu_cacheinfo(cpu)->num_leaves) {
>  		this_leaf = this_cpu_ci->info_list + index;
>  		found_cache = acpi_find_cache_node(table, acpi_cpu_id,
> @@ -546,7 +549,10 @@ static int topology_get_acpi_cpu_tag(struct acpi_table_header *table,
>  				     unsigned int cpu, int level, int flag)
>  {
>  	struct acpi_pptt_processor *cpu_node;
> -	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	u32 acpi_cpu_id;
> +
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +		return -ENOENT;
>  
>  	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  	if (cpu_node) {
> @@ -614,18 +620,22 @@ static int find_acpi_cpu_topology_tag(unsigned int cpu, int level, int flag)
>   *
>   * Check the node representing a CPU for a given flag.
>   *
> - * Return: -ENOENT if the PPTT doesn't exist, the CPU cannot be found or
> - *	   the table revision isn't new enough.
> + * Return: -ENOENT if can't get CPU's ACPI Processor UID, the PPTT doesn't
> + *	   exist, the CPU cannot be found or the table revision isn't new
> + *	   enough.
>   *	   1, any passed flag set
>   *	   0, flag unset
>   */
>  static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>  {
>  	struct acpi_table_header *table;
> -	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	u32 acpi_cpu_id;
>  	struct acpi_pptt_processor *cpu_node = NULL;
>  	int ret = -ENOENT;
>  
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +		return -ENOENT;
> +
>  	table = acpi_get_pptt();
>  	if (!table)
>  		return -ENOENT;
> @@ -651,7 +661,8 @@ static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>   * in the PPTT. Errors caused by lack of a PPTT table, or otherwise, return 0
>   * indicating we didn't find any cache levels.
>   *
> - * Return: -ENOENT if no PPTT table or no PPTT processor struct found.
> + * Return: -ENOENT if no PPTT table, can't get CPU's ACPI Process UID or no PPTT
> + *	   processor struct found.
>   *	   0 on success.
>   */
>  int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
> @@ -671,7 +682,9 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>  
>  	pr_debug("Cache Setup: find cache levels for CPU=%d\n", cpu);
>  
> -	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id))
> +		return -ENOENT;
> +
>  	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  	if (!cpu_node)
>  		return -ENOENT;
> @@ -780,8 +793,9 @@ int find_acpi_cpu_topology_package(unsigned int cpu)
>   * It may not exist in single CPU systems. In simple multi-CPU systems,
>   * it may be equal to the package topology level.
>   *
> - * Return: -ENOENT if the PPTT doesn't exist, the CPU cannot be found
> - * or there is no toplogy level above the CPU..
> + * Return: -ENOENT if the PPTT doesn't exist, can't get CPU's ACPI
> + * Processor UID, the CPU cannot be found or there is no toplogy level
> + * above the CPU.
>   * Otherwise returns a value which represents the package for this CPU.
>   */
>  
> @@ -797,7 +811,9 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu)
>  	if (!table)
>  		return -ENOENT;
>  
> -	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +		return -ENOENT;
> +
>  	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  	if (!cpu_node || !cpu_node->parent)
>  		return -ENOENT;
> @@ -872,7 +888,9 @@ static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
>  	cpumask_clear(cpus);
>  
>  	for_each_possible_cpu(cpu) {
> -		acpi_id = get_acpi_id_for_cpu(cpu);
> +		if (acpi_get_cpu_uid(cpu, &acpi_id) != 0)
> +			continue;
> +
>  		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
>  
>  		while (cpu_node) {
> @@ -966,10 +984,13 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>  	for_each_possible_cpu(cpu) {
>  		bool empty;
>  		int level = 1;
> -		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		u32 acpi_cpu_id;
>  		struct acpi_pptt_cache *cache;
>  		struct acpi_pptt_processor *cpu_node;
>  
> +		if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +			continue;
> +
>  		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  		if (!cpu_node)
>  			continue;
> @@ -1030,10 +1051,13 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
>  	for_each_possible_cpu(cpu) {
>  		bool empty;
>  		int level = 1;
> -		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		u32 acpi_cpu_id;
>  		struct acpi_pptt_cache *cache;
>  		struct acpi_pptt_processor *cpu_node;
>  
> +		if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) != 0)
> +			continue;
> +
>  		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>  		if (!cpu_node)
>  			continue;
> diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> index caa2c16e1697..8f3f38c64a88 100644
> --- a/drivers/acpi/riscv/rhct.c
> +++ b/drivers/acpi/riscv/rhct.c
> @@ -44,10 +44,15 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
>  	struct acpi_rhct_isa_string *isa_node;
>  	struct acpi_table_rhct *rhct;
>  	u32 *hart_info_node_offset;
> -	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +	u32 acpi_cpu_id;
> +	int ret;
>  
>  	BUG_ON(acpi_disabled);
>  
> +	ret = acpi_get_cpu_uid(cpu, &acpi_cpu_id);
> +	if (ret != 0)
> +		return ret;
> +
>  	if (!table) {
>  		rhct = acpi_get_rhct();
>  		if (!rhct)
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 34430b68f602..ed72c3d1f796 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1107,15 +1107,17 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>  {
>  	struct acpi_apmt_node *apmt_node;
>  	int affinity_flag;
> +	u32 cpu_uid;
>  	int cpu;
> +	int ret;
>  
>  	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
>  	affinity_flag = apmt_node->flags & ACPI_APMT_FLAGS_AFFINITY;
>  
>  	if (affinity_flag == ACPI_APMT_FLAGS_AFFINITY_PROC) {
>  		for_each_possible_cpu(cpu) {
> -			if (apmt_node->proc_affinity ==
> -			    get_acpi_id_for_cpu(cpu)) {
> +			ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +			if (ret == 0 && apmt_node->proc_affinity == cpu_uid) {
>  				cpumask_set_cpu(cpu, &cspmu->associated_cpus);
>  				break;
>  			}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4d2f0bed7a06..035094a55f18 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -324,6 +324,19 @@ int acpi_unmap_cpu(int cpu);
>  
>  acpi_handle acpi_get_processor_handle(int cpu);
>  
> +#ifndef CONFIG_X86
> +/*
> + * acpi_get_cpu_uid() - Get ACPI Processor UID of a specified CPU from MADT table
> + * @cpu: Logical CPU number (0-based)
> + * @uid: Pointer to store the ACPI Processor UID (valid only on successful return)

This would normally go at the implementation, but it probably does
make sense here because each arch has its own implementation.

Should start with "/**" to make it kernel-doc though.

Wrap to fit in 78 columns, like other comments in this file.

> + * Return: 0 on successful retrieval (the ACPI Processor ID is stored in *uid);
> + *         -EINVAL if the CPU number is invalid or out of range;
> + *         -ENODEV if the ACPI Processor UID for the specified CPU is not found.
> + */
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
> +#endif

