Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE477B1B762
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070601.1434249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSj-0002Br-42; Tue, 05 Aug 2025 15:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070601.1434249; Tue, 05 Aug 2025 15:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSi-000212-Mq; Tue, 05 Aug 2025 15:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1070601;
 Tue, 05 Aug 2025 15:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jti+=2R=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ujJHG-0007Nd-3a
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:08:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0cd5b606-720e-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:08:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1652BCE;
 Tue,  5 Aug 2025 08:08:23 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A5AA3F673;
 Tue,  5 Aug 2025 08:08:26 -0700 (PDT)
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
X-Inumbo-ID: 0cd5b606-720e-11f0-b898-0df219b8e170
Message-ID: <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
Date: Tue, 5 Aug 2025 16:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 mark.rutland@arm.com, puranjay@kernel.org, broonie@kernel.org,
 mbenes@suse.cz, ryan.roberts@arm.com, akpm@linux-foundation.org,
 chenl311@chinatelecom.cn, anshuman.khandual@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ardb@kernel.org,
 leitao@debian.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 29/07/2025 02:54, Jinjie Ruan wrote:

> Since commit a70e9f647f50 ("entry: Split generic entry into generic
> exception and syscall entry") split the generic entry into generic irq
> entry and generic syscall entry, it is time to convert arm64 to use
> the generic irq entry. And ARM64 will be completely converted to generic
> entry in the upcoming patch series.
Note : I had to manually cherry-pick a70e9f647f50 when pulling the series
on top of the Linux Arm Kernel for-next/core branch, but there might be
something I'm missing here.
>
> The main convert steps are as follows:
> - Split generic entry into generic irq entry and generic syscall to
>    make the single patch more concentrated in switching to one thing.
> - Make arm64 easier to use irqentry_enter/exit().
> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> - Switch to generic irq entry.

I reviewed the whole series and as expected it looks good ! Just a few nits
here and there and some clarifications that I think could be useful.

I'm not sure about the generic implementation of 
`arch_irqentry_exit_need_resched()`
in patch 5, I would be tempted to move it to patch 7. I detail my 
thoughts more
on the relevant patches, but I might be wrong and that feels like details :
I don't think the code itself has issues.
> It was tested ok with following test cases on QEMU virt platform:
>   - Perf tests.
>   - Different `dynamic preempt` mode switch.
>   - Pseudo NMI tests.
>   - Stress-ng CPU stress test.
>   - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
>     and all test cases in tools/testing/selftests/arm64/mte/*.
>
> The test QEMU configuration is as follows:
>
> 	qemu-system-aarch64 \
> 		-M virt,gic-version=3,virtualization=on,mte=on \
> 		-cpu max,pauth-impdef=on \
> 		-kernel Image \
> 		-smp 8,sockets=1,cores=4,threads=2 \
> 		-m 512m \
> 		-nographic \
> 		-no-reboot \
> 		-device virtio-rng-pci \
> 		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
> 			earlycon preempt=voluntary irqchip.gicv3_pseudo_nmi=1" \
> 		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
> 		-device virtio-blk-device,drive=hd0 \
>
I'll spend some time testing the series now, specifically given patch 6's
changes, but other than that everything I saw made sense and didn't look
like it would be of concern to me.

Thanks,
Ada

