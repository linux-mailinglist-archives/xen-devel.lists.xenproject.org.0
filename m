Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CoCLkK9y2kwKwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 14:25:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17717369718
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 14:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268894.1558083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Y9E-0006Js-I2; Tue, 31 Mar 2026 12:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268894.1558083; Tue, 31 Mar 2026 12:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Y9E-0006Gp-Ex; Tue, 31 Mar 2026 12:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1268894;
 Tue, 31 Mar 2026 12:24:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rafael@kernel.org>) id 1w7Y9C-0006Gj-T2
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 12:24:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Y9C-00GUsy-4u
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:24:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rafael@kernel.org>)
 id 69cbbd08-5cb7-0a2a0a5109dd-0a2a4503da2a-8
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 14:24:42 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <rafael@kernel.org>)
 id 69cbbd08-1947-0a2a45030019-aceafc1fcf0c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 14:24:41 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C23B44054
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7809EC2BCB2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:24:39 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-4042fe53946so2173781fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 05:24:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774959879;
	bh=+v0lsG31lmz9yOKp4sThWdLD00iDG9mSDxn4BdCze+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=omuA/iF4+/FkdTsRVxIQoSSk6EjrGq0GdFZvkmVdYBhdF9aSJsS3owD2CZrk8EmAQ
	 xyqPWZppC48aFkIIBxuXGNwQPeZfMOH5oF6HXLDLIZHJohFCDhEZjBZoT49L9yEQ+v
	 eBeS+3VkRaNHQ7xAiMvumxAbPbsGEfeKqFIm+Rr+plAZ2rIPNy9cUvuyzSIPdYCCVI
	 eKaHGME1nzobiO5Bovw9QyQWVlHZkO2LmTuo8IFDhEHXPkzEXWfGDcb7CeP/P4Lijg
	 PtYrJPJYxyq+D3waEB2Obf6vekVjZgfeMDUrfbAk6WvpyPtcRN8IUkWtbrtxFD27Ds
	 atJCJpRptuMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNuW/P44DabtIk9FKfjRgs7uvTdRg9K3jS84x/0znadlUlMqGd8xFww97yhEI4BITRR4RjM7+0rVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCoLu0zTHc0KdFut4ZFjrFZjtw94AYQ630xxJXj9+scoFcKF6Y
	gV+H7Gho5310Mc2Qfruuo9d3MIw9lw/Zp3IlaXdUXjwSKAzW91mGHEWRopxmlLpZvSrVXFdFpmE
	7soxS7KGDJDWhvFl7nPPIpCPMfBghqNQ=
X-Received: by 2002:a05:6870:3212:b0:41c:5212:2c7e with SMTP id
 586e51a60fabf-41cec149624mr8736242fac.20.1774959878527; Tue, 31 Mar 2026
 05:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260320031737.35048-1-fengchengwen@huawei.com>
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 31 Mar 2026 14:24:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
X-Gm-Features: AQROBzDL-JtY7QC0BpuyBPGCuLquO5-Gf9GrQy5Yvy_4yGsymDKEHbc8tb9l0x0
Message-ID: <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH
 steer-tag issue
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Kai Huang <kai.huang@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Kevin Loughlin <kevinloughlin@google.com>, 
	Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin Li <xin@zytor.com>, 
	"Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta <sohil.mehta@intel.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Robin Murphy <robin.murphy@arm.com>, 
	James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>, 
	Ma Ke <make24@iscas.ac.cn>, Wei Huang <wei.huang2@amd.com>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, 
	punit.agrawal@oss.qualcomm.com, guohanjun@huawei.com, suzuki.poulose@arm.com, 
	ryan.roberts@arm.com, chenl311@chinatelecom.cn, masahiroy@kernel.org, 
	wangyuquan1236@phytium.com.cn, anshuman.khandual@arm.com, 
	heinrich.schuchardt@canonical.com, Eric.VanTassell@amd.com, 
	wangzhou1@hisilicon.com, wanghuiqiang@huawei.com, liuyonglong@huawei.com, 
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1774959882-7768972C-F4345EC5/0/0
X-purgate-type: clean
X-purgate-size: 3160
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:palmer@dabbelt.com,m:bp@alien8.de,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,
 m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,huawei.com:email];
	FORGED_SENDER(0.00)[rafael@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 17717369718
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 4:17=E2=80=AFAM Chengwen Feng <fengchengwen@huawei.=
com> wrote:
>
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
>  arch/loongarch/include/asm/acpi.h  |  5 ---
>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>  arch/riscv/include/asm/acpi.h      |  4 ---
>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>  arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>  arch/x86/include/asm/cpu.h         |  1 -
>  arch/x86/include/asm/smp.h         |  1 -
>  arch/x86/kernel/acpi/boot.c        | 20 ++++++++++++
>  arch/x86/xen/enlighten_hvm.c       |  5 +--
>  drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>  drivers/pci/tph.c                  | 16 +++++++---
>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>  include/linux/acpi.h               | 11 +++++++
>  include/linux/pci-tph.h            |  4 +--
>  18 files changed, 158 insertions(+), 57 deletions(-)
>
> --

It doesn't look like anyone has a particular heartburn related to this
series, so I could apply it in principle, but I'd appreciate some ACKs
from arch maintainers.

Why don't you resend it with all of the tags collected so far (and
please add x86@kernel.org to the CC list)?

