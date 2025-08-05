Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38FBB1B766
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070587.1434193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSg-0001EX-Be; Tue, 05 Aug 2025 15:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070587.1434193; Tue, 05 Aug 2025 15:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSg-0001CE-7g; Tue, 05 Aug 2025 15:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1070587;
 Tue, 05 Aug 2025 15:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jti+=2R=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ujJEl-0007Ir-Dk
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:05:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b060329f-720d-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 17:05:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C11B1424;
 Tue,  5 Aug 2025 08:05:48 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55FA3F673;
 Tue,  5 Aug 2025 08:05:51 -0700 (PDT)
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
X-Inumbo-ID: b060329f-720d-11f0-a321-13f23c93f187
Message-ID: <beb7e8f2-39f8-499f-a173-b8bf2d3296ea@arm.com>
Date: Tue, 5 Aug 2025 16:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/7] arm64: ptrace: Replace interrupts_enabled()
 with regs_irqs_disabled()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-2-ruanjinjie@huawei.com>
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
In-Reply-To: <20250729015456.3411143-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code expects architecture code to provide
> regs_irqs_disabled(regs) function, but arm64 does not have this and
> provides inerrupts_enabled(regs), which has the opposite polarity.
Nit: "interrupts_enabled(regs)"
> In preparation for moving arm64 over to the generic entry code,
> relace arm64's interrupts_enabled() with regs_irqs_disabled() and
> update its callers under arch/arm64.
>
> For the moment, a definition of interrupts_enabled() is provided for
> the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
> can be removed.
>
> Delete the fast_interrupts_enabled() macro as it is unused and we
> don't want any new users to show up.
>
> No functional changes.
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Otherwise looks good to me !
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

