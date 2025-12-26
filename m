Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3653CDEB46
	for <lists+xen-devel@lfdr.de>; Fri, 26 Dec 2025 13:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193436.1512189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZ76N-0000Y6-8a; Fri, 26 Dec 2025 12:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193436.1512189; Fri, 26 Dec 2025 12:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZ76N-0000Wo-4k; Fri, 26 Dec 2025 12:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1193436;
 Fri, 26 Dec 2025 12:39:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vZ76L-0000Wi-Hp
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 12:39:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vZ76K-00AzAT-2f;
 Fri, 26 Dec 2025 12:39:25 +0000
Received: from [2a02:8012:3a1:0:7185:a579:c:f908]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vZ76K-003IZT-2n;
 Fri, 26 Dec 2025 12:39:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=fsQznIkrg6H7tvIDni1EPby3qUwh9TCBqZdL0/wLRLY=; b=HdKGgCR+VHy7fZY5lrcOAdbuI6
	AbdFW+6m7xee7lAQfj3nCPlxI1XwaVLANtYSkYgRCsGULCy5hht7hdCquyiD57268l8tqQHnjtaqI
	/tiDPtkPTef8zzvlOJhgGtYD0Am4wjBQD6lHIG+dlqZ9YwdCNItKK/vCwenaNkzhDn34=;
Message-ID: <a2be5ae1-7e4a-4137-9e36-6c5845a93ca1@xen.org>
Date: Fri, 26 Dec 2025 12:39:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <9f084beff76e40fed2138ba2d59145a96b930c63.1765472890.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9f084beff76e40fed2138ba2d59145a96b930c63.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 11/12/2025 18:43, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
> 
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V7:
> - restore LPI regs on resume
> - add timeout during redist disabling
> - squash with suspend/resume handling for GICv3 eSPI registers
> - drop ITS guard paths so suspend/resume always runs; switch missing ctx
>    allocation to panic
> - trim TODO comments; narrow redistributor storage to PPI icfgr
> - keep distributor context allocation even without ITS; adjust resume
>    to use GENMASK(31, 0) for clearing enables
> - drop storage of the SGI configuration register, as SGIs are always
>    edge-triggered
> ---
>   xen/arch/arm/gic-v3-lpi.c              |   3 +
>   xen/arch/arm/gic-v3.c                  | 319 ++++++++++++++++++++++++-
>   xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
>   3 files changed, 320 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index de5052e5cf..61a6e18303 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>       switch ( action )
>       {
>       case CPU_UP_PREPARE:
> +        if ( system_state == SYS_STATE_resume )
> +            break;

Do we need this check because we don't free the LPI pending table when 
the CPU is turned off?

If so, don't we already have a problem for CPU hotplug because the 
percpu area will be freed but not the pending table?

Cheers,

-- 
Julien Grall


