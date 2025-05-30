Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEDAC96D7
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 23:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001536.1381665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6qY-0004DO-5u; Fri, 30 May 2025 21:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001536.1381665; Fri, 30 May 2025 21:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6qY-0004Ai-1h; Fri, 30 May 2025 21:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1001536;
 Fri, 30 May 2025 21:00:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uL6qW-0004Ac-Lw
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 21:00:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6qW-00AEUg-0d;
 Fri, 30 May 2025 21:00:56 +0000
Received: from [2a02:8012:3a1:0:ec4a:d3ec:7374:b46c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6qW-00A9nz-0s;
 Fri, 30 May 2025 21:00:55 +0000
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
	bh=tsFCzeJijD1OjBWGjnm40a6P1PZgr8TgAkuaou6vF0g=; b=pAEoxu/k/Ai55F+8xruEjP35hR
	zzNMqjhEzX7hCE5PmJ8UbmCJT/iTwOeQlgtQPYdbtaA3NhAK0eB8grAQn1UUSOn8Z6tolEhvLA7rB
	03HgCXG+vcv/AKt/drg7WkgvZLupMEgEJw/sF1/1E2ctVrl/eaRVlBb90Qu6vaeqPiLM=;
Message-ID: <d39763dd-0154-4c0e-97a0-fa3db2a8d943@xen.org>
Date: Fri, 30 May 2025 22:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] xen/arm: ffa: Introduce VM to VM support
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1747925287.git.bertrand.marquis@arm.com>
 <3405d6a545c5ad8fadf7b252c98ce4120fe63fd2.1747925287.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3405d6a545c5ad8fadf7b252c98ce4120fe63fd2.1747925287.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 22/05/2025 16:08, Bertrand Marquis wrote:
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
> index dfa0b23eaf38..66ea1860e97a 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -150,6 +150,67 @@ out:
>       return ret;
>   }
>   
> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
> +{
> +    struct ffa_ctx *curr_ctx = current->domain->arch.tee;
> +    struct ffa_ctx *dest_ctx, *tmp;
> +    uint32_t count = 0;
> +
> +    /*
> +     * There could potentially be a lot of VMs in the system and we could
> +     * hold the CPU for long here.
> +     * Right now there is no solution in FF-A specification to split
> +     * the work in this case.
> +     * TODO: Check how we could delay the work or have preemption checks.
> +     */
> +    list_for_each_entry_safe(dest_ctx, tmp, &ffa_ctx_head, ctx_list)

Looking at this code again, I am a bit puzzled why we don't seem to take 
any lock and use list_for_each_entry_safe().

I was under the impression that list_for_each_entry_safe() is used if we
delete an entry within the loop. But it is not used to protect against a 
deletion from another core.

Did I misunderstand the logic? If not, we possibly want to use a 
readlock (over the existing spinlock).

Cheers,

-- 
Julien Grall


