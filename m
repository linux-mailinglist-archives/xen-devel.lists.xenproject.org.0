Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG3JCsabsmnENwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 11:56:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF59270886
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 11:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251980.1548770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dhA-0006tI-DL; Thu, 12 Mar 2026 10:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251980.1548770; Thu, 12 Mar 2026 10:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dhA-0006r6-Ac; Thu, 12 Mar 2026 10:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1251980;
 Thu, 12 Mar 2026 10:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nnrS=BM=huawei.com=jonathan.cameron@srs-se1.protection.inumbo.net>)
 id 1w0dh9-0006r0-0L
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 10:55:11 +0000
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee7ed90c-1e01-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 11:55:08 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.18.224.150])
 by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fWkyK3T4pzJ46kW;
 Thu, 12 Mar 2026 18:54:17 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
 by mail.maildlp.com (Postfix) with ESMTPS id 32AB64056B;
 Thu, 12 Mar 2026 18:55:05 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Mar
 2026 10:55:02 +0000
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
X-Inumbo-ID: ee7ed90c-1e01-11f1-b164-2bf370ae4941
Date: Thu, 12 Mar 2026 10:55:00 +0000
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
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <20260312105500.00005d7c@huawei.com>
In-Reply-To: <20260312072316.4806-3-fengchengwen@huawei.com>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
	<20260312072316.4806-3-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,huawei.com:email,huawei.com:mid]
X-Rspamd-Queue-Id: BEF59270886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 15:23:15 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> Add acpi_get_cpu_uid() implementation for x86, replacing the existing
> cpu_acpi_id() function. This completes the unified ACPI Processor UID
> retrieval interface across all ACPI-enabled architectures.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



