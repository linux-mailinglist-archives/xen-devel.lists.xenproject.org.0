Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFyUKsvasGmsnwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 04:00:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9425B37E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 04:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250780.1548158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w09o2-0000dX-Eh; Wed, 11 Mar 2026 03:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250780.1548158; Wed, 11 Mar 2026 03:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w09o2-0000bv-Bv; Wed, 11 Mar 2026 03:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1250780;
 Wed, 11 Mar 2026 03:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFBt=BL=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w09o1-0000bn-NE
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 03:00:17 +0000
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com
 [113.46.200.222]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6fdc8e-1cf6-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 04:00:13 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.214])
 by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fVwMy3T5lzLlSf;
 Wed, 11 Mar 2026 10:55:10 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 7FEF34056C;
 Wed, 11 Mar 2026 11:00:05 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Mar 2026 11:00:03 +0800
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
X-Inumbo-ID: 6a6fdc8e-1cf6-11f1-b164-2bf370ae4941
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DUKycpPzpFIpG0env8jwSvfK5sQZJJ1YY0eqvDa9Ls4=;
	b=UIuMwL2ZnQBHKt0OSz5st4Og2VYIGREkqW4SE+XsyKkbHXGhNjJEsAWrxVSqy6OOZJ3NLbK9Z
	kP8s3Xd0pnLT2F4QMacoWnfn19/NxFuvNNLMkzdoJPW46wBbTVsZOQsEtjgpquwRCBs94A0/o7e
	g1HUZD+aWdwNP2wFTTnfWEY=
Message-ID: <9ef9b529-839b-4cf0-a294-5b68fe8aa768@huawei.com>
Date: Wed, 11 Mar 2026 11:00:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
To: Bjorn Helgaas <helgaas@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H . Peter Anvin"
	<hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, Sunil V L
	<sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, Yanteng
 Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>, Kai Huang
	<kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth
	<thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>, Kevin Loughlin
	<kevinloughlin@google.com>, Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra
	<peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin
 Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta
	<sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Robin
 Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>, Besar
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Ajit Khaparde
	<ajit.khaparde@broadcom.com>, Wei Huang <wei.huang2@amd.com>, Andy Gospodarek
	<andrew.gospodarek@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
	<linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<stable@vger.kernel.org>, Wathsala Vithanage <wathsala.vithanage@arm.com>
References: <20260310220920.GA826995@bhelgaas>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260310220920.GA826995@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-Rspamd-Queue-Id: 1FA9425B37E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:jeremy.linton@arm.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono
 @nvidia.com,m:make24@iscas.ac.cn,m:ajit.khaparde@broadcom.com,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,m:wathsala.vithanage@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid];
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On 3/11/2026 6:09 AM, Bjorn Helgaas wrote:
> On Tue, Mar 10, 2026 at 10:58:49AM -0500, Jeremy Linton wrote:
>> On 3/9/26 10:20 PM, Chengwen Feng wrote:
>>> pcie_tph_get_cpu_st() is broken on ARM64:
>>> 1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
>>>     cpu_uid should be the ACPI Processor UID [1].
>>> 2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
>>>     cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
>>>     generated and managed by kernel (e.g., [0,255] for a system  with 256
>>>     logical CPU cores).
>>> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>>>     MADT table, and this UID may not match the kernel's logical CPU ID.
>>>     When this occurs, the mismatch results in the wrong CPU steer-tag.
>>> 4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
>>>     so the mismatch is not seen.
> 
>>>   int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
>>> -			unsigned int cpu_uid, u16 *tag)
>>> +			unsigned int cpu, u16 *tag)
>>>   {
>>>   #ifdef CONFIG_ACPI
>>> +	u32 cpu_uid = acpi_get_cpu_acpi_id(cpu);
> 
> From AI review (gemini/gemini-3.1-pro-preview):
> 
>   Does this code need to validate that `cpu` is within bounds before
>   using it?  Before this change, the `cpu_uid` parameter was passed
>   opaquely to the ACPI firmware via `tph_invoke_dsm()`, which would
>   gracefully handle invalid values.
> 
>   Now, `cpu` is treated as a logical CPU index and passed to
>   `acpi_get_cpu_acpi_id(cpu)`. On architectures like arm64 and riscv,
>   `acpi_get_cpu_acpi_id()` uses `cpu` directly as an array index
>   (`&cpu_madt_gicc[cpu]` and `&cpu_madt_rintc[cpu]`). On x86, it uses
>   `per_cpu(x86_cpu_to_acpiid, cpu)`.
> 
>   If a caller passes an out-of-bounds `cpu` index (for example, if an
>   IRQ affinity mask is empty and `cpumask_first()` returns
>   `nr_cpu_ids`, or if userspace passes an arbitrary ID via
>   `mlx5_st_alloc_index()`), this will result in an out-of-bounds
>   memory read.
> 
>   Consider adding a bounds check:
> 
>     if (cpu >= nr_cpu_ids)
>       return -EINVAL;
> 
> I agree that this is an issue, and I think implementations of
> acpi_get_cpu_acpi_id() should validate their inputs.
> 
> I don't know if there's a value that can never be a valid ACPI CPU UID
> and could be used as an error value from acpi_get_cpu_acpi_id().  I do
> see a few mentions of a ~0 value meaning "all processors" (ACPI r6.6,
> sec 5.2.12.13).  

I only have the ACPI Specification Version 6.5, so I will use v6.5 as an example.

The ACPI specification does not define invalid value ranges for the ACPI UID.
For the arm64 platform (Section 5.2.12.14):
  ACPI Processor UID: The OS associates this GICC Structure with a processor device
                      object in the namespace when the _UID child object of the
                      processor device evaluates to a numeric value that matches
                      the numeric value in this field.

I am concerned that we cannot implement it like this:
	int acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		...
	}
or:
	u32 acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return U32_MAX;
		...
	}

How about implementing it as follows:
	s64 acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		...
	}
or
	int acpi_get_cpu_uid(unsigned int cpu, u32 *uid) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		*uid = xxx;
		return 0;
	}



Another issue: This commit also provides an implementation for the x86 platform.
However, further code analysis revealed a potential problem in the implementation:

The acpi_get_cpu_acpi_id() retrieves uid from x86_cpu_to_acpiid in SMP, and
x86_cpu_to_acpiid is set through the call chain: acpi_parse_lapic() ->
topology_register_apic() -> topo_register_apic() -> topo_set_cpuids() ->
x86_cpu_to_acpiid. It appears to retrieve the "ACPI Processor UID" from
ACPI Section 5.2.12.2, but the problem is that this field is only one byte in length,
which may cause issues in huge-core systems.

Therefore, I suggest re-implementing the acpi_get_cpu_uid function for the x86
platform. Either I provide a default implementation (shown below), or x86 guys
contribute to the implementation:

	s64 acpi_get_cpu_uid(unsigned int cpu) {
		if (cpu >= nr_cpu_ids)
			return -EINVAL;
		return cpu;
	}

Thanks

> 


