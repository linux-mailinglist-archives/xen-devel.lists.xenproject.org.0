Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK2yIcdasGmMiQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:54:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D1255F74
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250671.1548113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w01GZ-0001FW-5D; Tue, 10 Mar 2026 17:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250671.1548113; Tue, 10 Mar 2026 17:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w01GZ-0001Cc-2T; Tue, 10 Mar 2026 17:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1250671;
 Tue, 10 Mar 2026 17:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vylx=BK=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1w01GY-0001CW-2E
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:53:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feea9b16-1ca9-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:53:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDE8460054;
 Tue, 10 Mar 2026 17:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72949C19423;
 Tue, 10 Mar 2026 17:53:06 +0000 (UTC)
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
X-Inumbo-ID: feea9b16-1ca9-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773165186;
	bh=WO2FOycvuuimWf2BBulOdnsAjAo+YazNHVVwxkp7CTQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eBcXb+X80rgKqCBvLspNlTOV1vd/pku+H6vrMwjnIUc1EPld/SwvI87VOk2v9spAk
	 mQwzcYlSAluwZ68uAzim6BOLYhwuR8hvCczaCcrGemVxRjRgvMRz7of7bwaxtz6kRd
	 8qySGXq8grwSK5TKxbSjaXWiTsWNvgZx6eHB/8xZY8WWUeaScw3fMAM7MDLDfNxl7z
	 tuQvq86WkhT8OZAzrXBsWUK0J89R9XxcjJg1hqWabtJJwZex+dDwXjeMi63lPBbZNv
	 qOKy8IvjIYCvJ2lP43twwYPykiMiWqj4+PjF4xTACYlgH5VX2O6O8QN3kfkzkExPxm
	 ckaiF6BuuSr7Q==
Date: Tue, 10 Mar 2026 12:53:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
	Ajit Khaparde <ajit.khaparde@broadcom.com>,
	Wei Huang <wei.huang2@amd.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, wangzhou1@hisilicon.com,
	wanghuiqiang@huawei.com, liuyonglong@huawei.com,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
Message-ID: <20260310175305.GA730372@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310032049.25387-2-fengchengwen@huawei.com>
X-Rspamd-Queue-Id: 309D1255F74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make2
 4@iscas.ac.cn,m:ajit.khaparde@broadcom.com,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 11:20:48AM +0800, Chengwen Feng wrote:
> To unify the CPU ACPI ID retrieval interface across architectures,
> rename the existing get_acpi_id_for_cpu() function to
> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
> 
> This is a pure rename with no functional change, preparing for a
> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
> platforms.

Really a question for the ACPI folks, but my preferences would be:

  - Simpler name for the interface, e.g., "acpi_get_cpu_id()"

  - Single prototype in generic header, e.g., include/linux/acpi.h

  - Split the x86 part to a separate patch and maybe (a tangent, but
    looks dubious to me) figure out whether/why xen needs xen_vcpu_id
    to be ACPI CPU IDs

> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/arm64/include/asm/acpi.h      |  4 ++--
>  arch/loongarch/include/asm/acpi.h  |  2 +-
>  arch/riscv/include/asm/acpi.h      |  2 +-
>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>  drivers/acpi/pptt.c                | 16 ++++++++--------
>  drivers/acpi/riscv/rhct.c          |  2 +-
>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>  7 files changed, 15 insertions(+), 15 deletions(-)

