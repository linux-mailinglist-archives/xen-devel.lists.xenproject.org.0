Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBTZNZmesmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:08:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B469270A6E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252001.1548788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dtR-0000bD-Kw; Thu, 12 Mar 2026 11:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252001.1548788; Thu, 12 Mar 2026 11:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dtR-0000Z8-IB; Thu, 12 Mar 2026 11:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1252001;
 Thu, 12 Mar 2026 11:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nnrS=BM=huawei.com=jonathan.cameron@srs-se1.protection.inumbo.net>)
 id 1w0dtP-0000Z2-Rb
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:07:51 +0000
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b45aed71-1e03-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:07:49 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.18.224.107])
 by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fWlFh4gmtzHnH8v;
 Thu, 12 Mar 2026 19:07:36 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
 by mail.maildlp.com (Postfix) with ESMTPS id 29C2E40584;
 Thu, 12 Mar 2026 19:07:46 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Mar
 2026 11:07:43 +0000
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
X-Inumbo-ID: b45aed71-1e03-11f1-b164-2bf370ae4941
Date: Thu, 12 Mar 2026 11:07:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, "WANG
 Xuerui" <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, "Palmer Dabbelt"
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre Ghiti"
	<alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H . Peter Anvin"
	<hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, Sunil V L
	<sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Kees Cook
	<kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Sean Christopherson
	<seanjc@google.com>, Kai Huang <kai.huang@intel.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Thorsten Blum
	<thorsten.blum@linux.dev>, Kevin Loughlin <kevinloughlin@google.com>, Zheyun
 Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra <peterz@infradead.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Xin Li <xin@zytor.com>, "Ahmed S .
 Darwish" <darwi@linutronix.de>, Sohil Mehta <sohil.mehta@intel.com>, Ilkka
 Koskinen <ilkka@os.amperecomputing.com>, Robin Murphy <robin.murphy@arm.com>,
	James Clark <james.clark@linaro.org>, Besar Wicaksono
	<bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, "Wei Huang"
	<wei.huang2@amd.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, <punit.agrawal@oss.qualcomm.com>,
	<guohanjun@huawei.com>, <suzuki.poulose@arm.com>, <ryan.roberts@arm.com>,
	<chenl311@chinatelecom.cn>, <masahiroy@kernel.org>,
	<wangyuquan1236@phytium.com.cn>, <anshuman.khandual@arm.com>,
	<heinrich.schuchardt@canonical.com>, <Eric.VanTassell@amd.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
	<linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
Message-ID: <20260312110742.00002716@huawei.com>
In-Reply-To: <20260312072316.4806-2-fengchengwen@huawei.com>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
	<20260312072316.4806-2-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-Spamd-Result: default: False [1.01 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd
 .com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jonathan.cameron@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cameron@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4B469270A6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 15:23:14 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> To unify the CPU ACPI ID retrieval interface across architectures,
> rename the existing get_acpi_id_for_cpu() function to
> acpi_get_cpu_uid() on arm64/riscv/loongarch platforms.
>=20
> This is a pure rename with no functional change, preparing for a

It's not just a rename.  This should mention that the addition of error
checks and hence the resulting signature change.

> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
> platforms.
>=20
> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>       arch/arm64/kernel/acpi_numa.c to fix compilation errors from
>       circular header dependencies introduced by the rename.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
=46rom a reread, a few minor style consistency things inline.

> ---
>  arch/arm64/include/asm/acpi.h      | 16 +---------
>  arch/arm64/kernel/acpi.c           | 16 ++++++++++
>  arch/arm64/kernel/acpi_numa.c      | 15 ++++++++++
>  arch/loongarch/include/asm/acpi.h  |  5 ----
>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>  arch/riscv/include/asm/acpi.h      |  4 ---
>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>  arch/riscv/kernel/acpi_numa.c      |  8 +++--
>  drivers/acpi/pptt.c                | 47 +++++++++++++++++++++---------
>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>  include/linux/acpi.h               | 13 +++++++++
>  12 files changed, 120 insertions(+), 42 deletions(-)

> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index af90128cfed5..984a11788265 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -458,3 +458,19 @@ int acpi_unmap_cpu(int cpu)
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_generic_interrupt *gicc;
> +
> +	if (cpu >=3D nr_cpu_ids)
> +		return -EINVAL;
> +
> +	gicc =3D acpi_cpu_get_madt_gicc(cpu);
> +	if (gicc =3D=3D NULL)

Seems local style for null pointer checks is
	if (!gicc)
Just for consistency we should follow that.

> +		return -ENODEV;
> +
> +	*uid =3D gicc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 2465f291c7e1..56e2e486e49b 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -34,6 +34,21 @@ int __init acpi_numa_get_nid(unsigned int cpu)
>  	return acpi_early_node_map[cpu];
>  }
> =20
> +int get_cpu_for_acpi_id(u32 uid)
> +{
> +	u32 cpu_uid;
> +	int cpu;
> +	int ret;
> +
> +	for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {

Given more recent acceptance of the following perhaps it is neater here.

	for (int cpu =3D 0; cpu < nr_cpu_ids; cpu++) {

Amazingly there aren't any for loops in this file so we can do what we
like from a consistency point of view.


> +		ret =3D acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret =3D=3D 0 && uid =3D=3D cpu_uid)
> +			return cpu;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int __init acpi_parse_gicc_pxm(union acpi_subtable_headers *heade=
r,
>  				      const unsigned long end)
>  {


> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 71698ee11621..bde810d02c4f 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -337,3 +337,19 @@ int raw_pci_write(unsigned int domain, unsigned int =
bus,
>  }
> =20
>  #endif	/* CONFIG_PCI */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_rintc *rintc;
> +
> +	if (cpu >=3D nr_cpu_ids)
> +		return -EINVAL;
> +
> +	rintc =3D acpi_cpu_get_madt_rintc(cpu);
> +	if (rintc =3D=3D NULL)

Similar to above. Local style for NULL checks is
	if (!rintc)
so this should follow that.
> +		return -ENODEV;
> +
> +	*uid =3D rintc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 130769e3a99c..cd8adc9857e3 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -37,11 +37,15 @@ static int __init acpi_numa_get_nid(unsigned int cpu)
> =20
>  static inline int get_cpu_for_acpi_id(u32 uid)
>  {
> +	u32 cpu_uid;
>  	int cpu;
> +	int ret;
> =20
> -	for (cpu =3D 0; cpu < nr_cpu_ids; cpu++)
> -		if (uid =3D=3D get_acpi_id_for_cpu(cpu))
> +	for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {

Can pull the int into the loop her as well.

> +		ret =3D acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret =3D=3D 0 && uid =3D=3D cpu_uid)
>  			return cpu;
> +	}
> =20
>  	return -EINVAL;
>  }
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index de5f8c018333..d034a217e85b 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c

>  static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>  {
>  	struct acpi_table_header *table;
> -	u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +	u32 acpi_cpu_id;
>  	struct acpi_pptt_processor *cpu_node =3D NULL;
>  	int ret =3D -ENOENT;
> =20
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) !=3D 0)
> +		return -ENOENT;
> +
>  	table =3D acpi_get_pptt();
>  	if (!table)
>  		return -ENOENT;
> @@ -651,7 +661,8 @@ static int check_acpi_cpu_flag(unsigned int cpu, int =
rev, u32 flag)
>   * in the PPTT. Errors caused by lack of a PPTT table, or otherwise, ret=
urn 0
>   * indicating we didn't find any cache levels.
>   *
> - * Return: -ENOENT if no PPTT table or no PPTT processor struct found.
> + * Return: -ENOENT if no PPTT table, can't get CPU's ACPI Process UID or=
 no PPTT
> + *	   processor struct found.
>   *	   0 on success.
>   */
>  int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
> @@ -671,7 +682,8 @@ int acpi_get_cache_info(unsigned int cpu, unsigned in=
t *levels,
> =20
>  	pr_debug("Cache Setup: find cache levels for CPU=3D%d\n", cpu);
> =20
> -	acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id))
> +		return -ENOENT;
I'd put a blank line here (similar to the code you added just above).
>  	cpu_node =3D acpi_find_processor_node(table, acpi_cpu_id);
>  	if (!cpu_node)
>  		return -ENOENT;
> @@ -780,8 +792,9 @@ int find_acpi_cpu_topology_package(unsigned int cpu)
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
> =20
> @@ -797,7 +810,8 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu)
>  	if (!table)
>  		return -ENOENT;
> =20
> -	acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +	if (acpi_get_cpu_uid(cpu, &acpi_cpu_id) !=3D 0)
> +		return -ENOENT;
Again, I'd put a blank line here.

>  	cpu_node =3D acpi_find_processor_node(table, acpi_cpu_id);
>  	if (!cpu_node || !cpu_node->parent)
>  		return -ENOENT;
> @@ -872,7 +886,8 @@ static void acpi_pptt_get_child_cpus(struct acpi_tabl=
e_header *table_hdr,
>  	cpumask_clear(cpus);
> =20
>  	for_each_possible_cpu(cpu) {
> -		acpi_id =3D get_acpi_id_for_cpu(cpu);
> +		if (acpi_get_cpu_uid(cpu, &acpi_id) !=3D 0)
> +			continue;
and here.
>  		cpu_node =3D acpi_find_processor_node(table_hdr, acpi_id);
> =20
>  		while (cpu_node) {



