Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHiQKiqiu2nbmAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 08:13:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EA2C7215
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 08:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256745.1551246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37ZN-0002aW-8C; Thu, 19 Mar 2026 07:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256745.1551246; Thu, 19 Mar 2026 07:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37ZN-0002Xv-5T; Thu, 19 Mar 2026 07:13:25 +0000
Received: by outflank-mailman (input) for mailman id 1256745;
 Thu, 19 Mar 2026 07:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F4ko=BT=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w37ZK-0002Xm-W1
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 07:13:24 +0000
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com
 [113.46.200.224]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 185c9dc0-2363-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 08:13:17 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.127])
 by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fbxcD4jF6z1cyPP;
 Thu, 19 Mar 2026 15:08:12 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 8543840363;
 Thu, 19 Mar 2026 15:13:12 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 15:13:10 +0800
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
X-Inumbo-ID: 185c9dc0-2363-11f1-9ccf-f158ae23cfc8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rOgEX5LRjbf3VsJc30kly4+FTpT24EGUmpEIfFvp8FU=;
	b=RRC8Qk+vDk32R8JHqebkm1tGtkV6aqC7Rw/5tqI1aHILlK2h2Fd3giMbyZt1JjR+/2C5nr3jN
	LCoxznkWL7DSqvcKp14FgIYEdmkocS9XrRO5OVujVzcsJ5/bSzagK1Q0OB6Ne0iQgcMvxD/5fTO
	P3k1x2ro3WxAtvbL88NnXM8=
Message-ID: <264525a9-aa36-4848-80c0-f8cf246f93b8@huawei.com>
Date: Thu, 19 Mar 2026 15:13:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ACPI: Refactor get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Ingo Molnar
	<mingo@redhat.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
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
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Wei Huang
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
References: <20260318213458.GA474040@bhelgaas>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260318213458.GA474040@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:mingo@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,
 m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 189EA2C7215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 5:34 AM, Bjorn Helgaas wrote:
> On Wed, Mar 18, 2026 at 02:01:49PM +0800, Chengwen Feng wrote:
>> Unify CPU ACPI ID retrieval interface across architectures by
>> refactoring get_acpi_id_for_cpu() to acpi_get_cpu_uid() on
>> arm64/riscv/loongarch:
>> - Add input parameter validation
>> - Adjust interface to int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>>   (old: u32 get_acpi_id_for_cpu(unsigned int cpu), no input check)
>>
>> This refactoring (not a pure rename) enhances interface robustness while
>> preparing for consistent ACPI Processor UID retrieval across all
>> ACPI-enabled platforms. Valid inputs retain original behavior.
>>
>> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>>       arch/arm64/kernel/acpi.c to fix compilation errors from circular
>>       header dependencies introduced by the rename.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>>  arch/arm64/include/asm/acpi.h      | 16 +---------
>>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++
>>  arch/loongarch/include/asm/acpi.h  |  5 ---
>>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>>  arch/riscv/include/asm/acpi.h      |  4 ---
>>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>>  arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>>  drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>>  include/linux/acpi.h               | 13 ++++++++
>>  11 files changed, 122 insertions(+), 43 deletions(-)
> 
> There's a lot going on in this single patch, which makes it hard to
> review.  I think this might make more sense as several patches:
> 
>   - arm64: declare acpi_get_cpu_uid() in arch/arm64/include, implement
>     it, and use in drivers/perf/arm_cspmu/arm_cspmu.c
> 
>   - loongarch: declare acpi_get_cpu_uid() in arch/loongarch/include
>     and implement
> 
>   - riscv: declare acpi_get_cpu_uid() in arch/riscv/include, implement
>     it, and use in rhct.c, riscv/kernel/acpi_numa.c
> 
>   - x86: declare acpi_get_cpu_uid() in arch/x86/include, implement it,
>     and use in xen
> 
>   - declare acpi_get_cpu_uid() in include/linux/acpi.h, remove
>     declarations from arm64, loongarch, riscv, x86
> 
>   - convert acpi/pptt.c to use acpi_get_cpu_uid(), remove unused
>     get_acpi_id_for_cpu() from arm64, loongarch, riscv
> 
>   - use acpi_get_cpu_uid() in tph.c

Thanks for the detailed guidance, done in v9

> 
> Doc nit below.
> 

...

>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index 4d2f0bed7a06..035094a55f18 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -324,6 +324,19 @@ int acpi_unmap_cpu(int cpu);
>>  
>>  acpi_handle acpi_get_processor_handle(int cpu);
>>  
>> +#ifndef CONFIG_X86
>> +/*
>> + * acpi_get_cpu_uid() - Get ACPI Processor UID of a specified CPU from MADT table
>> + * @cpu: Logical CPU number (0-based)
>> + * @uid: Pointer to store the ACPI Processor UID (valid only on successful return)
> 
> This would normally go at the implementation, but it probably does
> make sense here because each arch has its own implementation.
> 
> Should start with "/**" to make it kernel-doc though.
> 
> Wrap to fit in 78 columns, like other comments in this file.

done in v9

Thanks

> 
>> + * Return: 0 on successful retrieval (the ACPI Processor ID is stored in *uid);
>> + *         -EINVAL if the CPU number is invalid or out of range;
>> + *         -ENODEV if the ACPI Processor UID for the specified CPU is not found.
>> + */
>> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
>> +#endif
> 


