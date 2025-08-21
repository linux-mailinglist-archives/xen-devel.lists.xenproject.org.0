Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C260B2FFF2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089050.1446744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up85y-000369-SE; Thu, 21 Aug 2025 16:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089050.1446744; Thu, 21 Aug 2025 16:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up85y-00033O-P4; Thu, 21 Aug 2025 16:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1089050;
 Thu, 21 Aug 2025 16:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fS9d=3B=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1up85y-0002m3-0J
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:24:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5dab4b95-7eab-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 18:24:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A32152B;
 Thu, 21 Aug 2025 09:24:43 -0700 (PDT)
Received: from [10.57.1.220] (unknown [10.57.1.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595D03F738;
 Thu, 21 Aug 2025 09:24:48 -0700 (PDT)
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
X-Inumbo-ID: 5dab4b95-7eab-11f0-b898-0df219b8e170
Message-ID: <9974c597-cc03-42d2-ba3a-3dd05f1a782c@arm.com>
Date: Thu, 21 Aug 2025 17:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] entry: Add arch_irqentry_exit_need_resched() for
 arm64
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
 <20250815030633.448613-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 sstabellini@kernel.org, mark.rutland@arm.com, mbenes@suse.cz,
 broonie@kernel.org, anshuman.khandual@arm.com, ryan.roberts@arm.com,
 chenl311@chinatelecom.cn, liaochang1@huawei.com, kristina.martsenko@arm.com,
 leitao@debian.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250815030633.448613-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 15/08/2025 04:06, Jinjie Ruan wrote:
> Compared to the generic entry code, ARM64 does additional checks
> when deciding to reschedule on return from interrupt. So introduce
> arch_irqentry_exit_need_resched() in the need_resched()
> condition of the generic raw_irqentry_exit_cond_resched(), with
> a NOP default. This will allow ARM64 to implement the architecture
> specific version for switching over to the generic entry code.
>
> Suggested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Looks good to me, thanks for the changes ! Reviewed-by: Ada Couprie Diaz 
<ada.coupriediaz@arm.com>

