Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNOpNDwFzGnPNQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 19:32:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78036EE6D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 19:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269219.1558314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7cwN-0000Il-Mw; Tue, 31 Mar 2026 17:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269219.1558314; Tue, 31 Mar 2026 17:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7cwN-0000Fx-JN; Tue, 31 Mar 2026 17:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1269219;
 Tue, 31 Mar 2026 17:31:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <catalin.marinas@arm.com>) id 1w7cwL-0000Fr-Ir
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:31:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7cwJ-00GC7q-85
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:31:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <catalin.marinas@arm.com>)
 id 69cc04f8-5cb7-0a2a0a5109dd-0a2a4507bf18-28
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 19:31:43 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.55.2)
 (envelope-from <catalin.marinas@arm.com>)
 id 69cc04ff-fd74-0a2a45070019-d98c6eacb23c-1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 19:31:43 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA1C1E5E;
 Tue, 31 Mar 2026 10:31:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDE373F915;
 Tue, 31 Mar 2026 10:31:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774978302; bh=3i1Gq4JAIizBknxjSLlecxNj8YdouZQOldf/Gi8SPcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDzivK/ay0BT4/Mfila47ssOCUKcoC8mcE1OJ3YzJDm9s79Zs686E4kzJf4HRuKB6
	 lpHJ/DyPCzQqdZR0SBq1PcmDDq9UF0avGeThJW47JsQ4fAL+D9oqkCMCvB+7zuGSCf
	 u5jO9aDk1QLnYCQi+3kmjhvfmGJUmFBpQyUk3kzE=
Date: Tue, 31 Mar 2026 18:31:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
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
Subject: Re: [PATCH v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH
 steer-tag issue
Message-ID: <acwE9V-r63-W2wby@arm.com>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
X-purgate-ID: tlsNG-ef75cf/1774978303-578A4303-814D3AD7/0/0
X-purgate-type: clean
X-purgate-size: 2086
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:palmer@dabbelt.com,m:bp@alien8.de,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy
 @kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7C78036EE6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:17:29AM +0800, Chengwen Feng wrote:
> This patchset unifies ACPI Processor UID retrieval across
> arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
> and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:
> 
> 1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
>      respective users)
> 5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
> 6: Clean up perf/arm_cspmu
> 7: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
> 8: Pass ACPI Processor UID to Cache Locality _DSM
> 
> The interface refactor ensures consistent CPU UID retrieval across
> architectures (no functional changes for valid inputs) and provides the
> unified interface required for the ARM64 TPH fix.
> 
> ---
> Changes in v10:
> - Refine commit header&log according to Punit's and Bjorn's review
> - Split perf/arm_cspmu as a separate commit which address Punit's
>   review
> 
> Changes in v9:
> - Address Bjorn's review: split commits to each platform so that make
>   them easy to review
> 
> Changes in v8:
> - Moving arm64's get_cpu_for_acpi_id() to kernel/acpi.c which address
>   Jeremy's review
> 
> Chengwen Feng (8):
>   arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>   LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>   RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID
>     retrieval
>   x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>   ACPI: Centralize acpi_get_cpu_uid() declaration in
>     include/linux/acpi.h
>   perf: arm_cspmu: Switch to acpi_get_cpu_uid() from
>     get_acpi_id_for_cpu()
>   ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
>   PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM
> 
>  Documentation/PCI/tph.rst          |  4 +--
>  arch/arm64/include/asm/acpi.h      | 17 +---------
>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++

For the arm64 bits:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

