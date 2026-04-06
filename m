Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDHLLJPK02nomAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 17:00:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187133A476B
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 17:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274219.1560391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9lQA-0005b9-Dy; Mon, 06 Apr 2026 14:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274219.1560391; Mon, 06 Apr 2026 14:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9lQA-0005Zi-B6; Mon, 06 Apr 2026 14:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1274219;
 Mon, 06 Apr 2026 14:59:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rafael@kernel.org>) id 1w9lQ8-0005Za-Hn
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 14:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9lQ6-001A8P-Qa
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 16:59:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rafael@kernel.org>)
 id 69d3c9e9-e002-0a2a0a5209dd-0a2a450ae32c-44
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 16:59:18 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <rafael@kernel.org>)
 id 69d3ca44-ee98-0a2a450a0019-aceafc1f8362-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 16:59:18 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E4B394456D
 for <xen-devel@lists.xenproject.org>; Mon,  6 Apr 2026 14:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA74EC2BCAF
 for <xen-devel@lists.xenproject.org>; Mon,  6 Apr 2026 14:59:15 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-470145d7e6fso691448b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 07:59:15 -0700 (PDT)
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
	s=k20201202; t=1775487555;
	bh=xQ7o66TtbbwulQnJW5l2ZtOfYQA79hhGSfn9VhPlO6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MLkaENd1y02jG6YsphOhuZTp0iQI96L6WFY5DEmo/DZ6WCfvoSBDZJV2ohYZSu1N9
	 ac4WV6CKVr3vtjWO5PyYEkAdXK0hp0G+RobW161z0dcu3s/VU0gY22kCs+MYXqUHBH
	 Liz1EHAuKjE4fTRx4+YsiI+t4vTTDKeLdDI2YZy0dAHG/YzL3nR/Rt8+yoiTCr6Y7R
	 31IDqYUjMqFbupJ1fx/4xFWsQpHeFVPqQZdMM9fWEudaIkvMRtjafaQw7H2b7xvoYg
	 xYFQlwgI/yUaOmD2NLJlqgiOeQ45VmSMD64YK+4sRFnv7nXs5NX2dbzF574dvLBFqO
	 XtniXv49RXROw==
X-Forwarded-Encrypted: i=1; AJvYcCU51LRlYmWTCYBjiS/bjkT9ql4tNGOEY6NcTvJ8Z2Nm+kVowu+C0zb9v1qaVSMgLjzaDu/SZk+JDQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKOfxsclLcyuqDDA9OgUVaLOPDta6cLHRj7l7qwWuGEwmTeH6u
	B/hZFKMpn1qX5YrPlfw62E0KbC5UlITqn6wBWTFYUxCZgTEbLpFTaJRX4pdGxO908N7omtEPdjk
	zT9IFfK4asM5RtRD2M1z//rHtZeBYcrI=
X-Received: by 2002:a05:6808:1910:b0:468:776:1ead with SMTP id
 5614622812f47-46ef5af739fmr6450744b6e.21.1775487554002; Mon, 06 Apr 2026
 07:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260401081640.26875-1-fengchengwen@huawei.com>
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 6 Apr 2026 16:58:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gE9jLbaGy0yJhNZdpQJTR9stE-ABNQVvP5jqss3LQpFw@mail.gmail.com>
X-Gm-Features: AQROBzDy996ma1a9twY_5lJC3Avr9hchzSyUdEAhSG92k1NHCBaaPp2eIIIoft4
Message-ID: <CAJZ5v0gE9jLbaGy0yJhNZdpQJTR9stE-ABNQVvP5jqss3LQpFw@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 0/8] ACPI: Unify CPU UID interface and fix
 ARM64 TPH steer-tag issue
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
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
	linux-perf-users@vger.kernel.org, stable@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1775487558-BE3510B1-C94A14ED/0/0
X-purgate-type: clean
X-purgate-size: 3276
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:kernel@xen0n.name,m:tglx@kernel.org,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:r
 yan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[62];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.252.31:received,100.75.92.58:received];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 187133A476B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 10:16=E2=80=AFAM Chengwen Feng <fengchengwen@huawei.=
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
> unified interface required for the ARM64 TPH fix
>
> ---
> Changes in v10-resend:
> - Add Catalin's ack-by for arm64 commit
> - Add CC to x86@kernel.org
>
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

Applied as 7.1 material, but please note that I haven't tagged it
explicitly for "stable".

The last patch carries a Fixes: tag which should be suitable for
"stable" to pick it up and you may as well request the whole series to
be picked up by "stable" when it hits the mainline.

Thanks!

