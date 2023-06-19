Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459C735158
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550947.860182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBhR-0001JE-V9; Mon, 19 Jun 2023 10:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550947.860182; Mon, 19 Jun 2023 10:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBhR-0001HB-SX; Mon, 19 Jun 2023 10:01:29 +0000
Received: by outflank-mailman (input) for mailman id 550947;
 Mon, 19 Jun 2023 10:01:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBBhP-0001H5-UI
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:01:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBBhP-000132-2R; Mon, 19 Jun 2023 10:01:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBBhO-0007jW-Sm; Mon, 19 Jun 2023 10:01:27 +0000
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
	bh=bvIXkD7jOr5izIafa/FlJWd8O9xrJs73AJhW30q3tL8=; b=aS4L3nl6YDJtf71hA31JqDV8vi
	S3H+55UJ9iHECqV1GVaarK8fT9aU4n53xX4O+H07tDR3YIxExc0hg9paYWKrhSf1pyr2qNWzmi0AW
	V50vwVVwMBvkjdVEikLrcz3HfyDx+5aExBeYQr5uFNBHuibOLMhUth4DwveXtnEvzWt0=;
Message-ID: <51501199-80e6-e33f-e70a-7a36d26c1894@xen.org>
Date: Mon, 19 Jun 2023 11:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <e2b7f377d1467833d9ae2cd897c962561e54fb02.1687167502.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e2b7f377d1467833d9ae2cd897c962561e54fb02.1687167502.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/06/2023 10:56, Nicola Vetrini wrote:
> In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
> few occurrences of nested '//' character sequences inside C-style comment
> blocks, which violate Rule 3.1. The patch aims to resolve those by removing
> the nested comments.

As I wrote in 
https://lore.kernel.org/xen-devel/f3fc1848-68ca-37a1-add2-e100b4773190@xen.org/, 
I am against replacing '//' with nothing. I have proposed to use ';' 
because this is also a valid way to comment in assembly.

> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com

There is a missing '>' at the end of the list.

> ---
> Changes:
> - Resending the patch with the right maintainers in CC.
> Changes in V2:
> - Split the patch into a series and reworked the fix.
> - Apply the fix to the arm32 `flushtlb.h' file, for consistency
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   xen/arch/arm/include/asm/arm32/flushtlb.h | 8 ++++----
>   xen/arch/arm/include/asm/arm64/flushtlb.h | 8 ++++----
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
> index 22ee3b317b..bcbeac590b 100644
> --- a/xen/arch/arm/include/asm/arm32/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
> @@ -4,10 +4,10 @@
>   /*
>    * Every invalidation operation use the following patterns:
>    *
> - * DSB ISHST        // Ensure prior page-tables updates have completed
> - * TLBI...          // Invalidate the TLB
> - * DSB ISH          // Ensure the TLB invalidation has completed
> - * ISB              // See explanation below
> + * DSB ISHST        Ensure prior page-tables updates have completed
> + * TLBI...          Invalidate the TLB
> + * DSB ISH          Ensure the TLB invalidation has completed
> + * ISB              See explanation below
>    *
>    * For Xen page-tables the ISB will discard any instructions fetched
>    * from the old mappings.
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
> index 56c6fc763b..6066a2d703 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -4,10 +4,10 @@
>   /*
>    * Every invalidation operation use the following patterns:
>    *
> - * DSB ISHST        // Ensure prior page-tables updates have completed
> - * TLBI...          // Invalidate the TLB
> - * DSB ISH          // Ensure the TLB invalidation has completed
> - * ISB              // See explanation below
> + * DSB ISHST        Ensure prior page-tables updates have completed
> + * TLBI...          Invalidate the TLB
> + * DSB ISH          Ensure the TLB invalidation has completed
> + * ISB              See explanation below
>    *
>    * ARM64_WORKAROUND_REPEAT_TLBI:
>    * Modification of the translation table for a virtual address might lead to

Cheers,

-- 
Julien Grall

