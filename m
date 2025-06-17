Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1637ADDD46
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 22:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018503.1395380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRd1i-0005M6-0U; Tue, 17 Jun 2025 20:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018503.1395380; Tue, 17 Jun 2025 20:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRd1h-0005K6-TL; Tue, 17 Jun 2025 20:35:25 +0000
Received: by outflank-mailman (input) for mailman id 1018503;
 Tue, 17 Jun 2025 20:35:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uRd1g-0005K0-Ua
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 20:35:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRd1g-006MO8-0S;
 Tue, 17 Jun 2025 20:35:24 +0000
Received: from [2a02:8012:3a1:0:e9a3:882d:7e0:8b9]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRd1f-008qG6-2k;
 Tue, 17 Jun 2025 20:35:23 +0000
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
	bh=cwpUiem4Y2hMK+oqZ3xRDxR+R9xAKA/gte+4qjDW5qM=; b=2MyZlxNyBoqqSVHghdnCSn7+yS
	ZFlllUP3h/bv4eDuc+hqpfqIyk/UxgNT42qTnhu3Wo2Z+AqfxtxqhVqTSW2urP8qPFRIKXLgEVU+v
	HUgPlgIJC2tKCpJoFoKSY7JVavOs9daX2A14TQTVGf12O791CiEP2vXYItszxOHQPeMQ=;
Message-ID: <8e7f1680-0747-4640-b35b-cdd2468dbfdd@xen.org>
Date: Tue, 17 Jun 2025 21:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Remove loop in dt_read_number()
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250617110741.34648-1-agarciav@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250617110741.34648-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

On 17/06/2025 12:07, Alejandro Vallejo wrote:
> The DT spec declares only two number types for a property: u32 and u64,
> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
> with a switch statement. Default to a size of 1 cell in the nonsensical
> size case, with a warning printed on the Xen console.
> 
> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> Based on this suggestion by Daniel:
> 
>      https://lore.kernel.org/xen-devel/a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com/
> 
> I'd be happier panicking there, seeing how DTs are by their very nature
> trusted blobs. But I suspect defaulting to something will find less
> resistance in review. I don't care much either way.
> ---
>   xen/include/xen/device_tree.h | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..2daef8659e 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,19 @@ void intc_dt_preinit(void);
>   /* Helper to read a big number; size is in cells (not bytes) */
>   static inline u64 dt_read_number(const __be32 *cell, int size)
>   {
> -    u64 r = 0;
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +    default:
> +        // Nonsensical size. default to 1.
> +        printk(XENLOG_WARNING "dt_read_number(%d) bad size", size);

Aside what Andrew wrote. I would consider to use at least 
ASSERT_UNREACHABLE() for debug build. I am not sure what's the best 
approach for release build. But this likely want to a XENLOG_ERR.

Cheers,

-- 
Julien Grall


