Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C15B1B76B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070593.1434212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSh-0001YZ-9z; Tue, 05 Aug 2025 15:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070593.1434212; Tue, 05 Aug 2025 15:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSh-0001Q3-1u; Tue, 05 Aug 2025 15:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1070593;
 Tue, 05 Aug 2025 15:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jti+=2R=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ujJFY-0007Kl-DX
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:06:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ce744366-720d-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 17:06:47 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7B542BCD;
 Tue,  5 Aug 2025 08:06:38 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7233B3F673;
 Tue,  5 Aug 2025 08:06:42 -0700 (PDT)
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
X-Inumbo-ID: ce744366-720d-11f0-a321-13f23c93f187
Message-ID: <3fd74c08-2950-46a9-a191-a635f379a8f7@arm.com>
Date: Tue, 5 Aug 2025 16:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 4/7] arm64: entry: Use preempt_count() and
 need_resched() helper
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-5-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>, will@kernel.org,
 oleg@redhat.com, sstabellini@kernel.org, mark.rutland@arm.com,
 puranjay@kernel.org, broonie@kernel.org, mbenes@suse.cz,
 ryan.roberts@arm.com, akpm@linux-foundation.org, chenl311@chinatelecom.cn,
 anshuman.khandual@arm.com, kristina.martsenko@arm.com,
 liaochang1@huawei.com, ardb@kernel.org, leitao@debian.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, catalin.marinas@arm.com
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code uses preempt_count() and need_resched() helpers to
> check if it should do preempt_schedule_irq(). Currently, arm64 use its own
> check logic, that is "READ_ONCE(current_thread_info()->preempt_count == 0",
> which is equivalent to "preempt_count() == 0 && need_resched()".
>
> In preparation for moving arm64 over to the generic entry code, use
> these helpers to replace arm64's own code and move it ahead.
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


