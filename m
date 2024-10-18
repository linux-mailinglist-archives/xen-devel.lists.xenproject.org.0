Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DBA9A4015
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821937.1235914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nEE-0000Ys-KJ; Fri, 18 Oct 2024 13:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821937.1235914; Fri, 18 Oct 2024 13:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nEE-0000XO-Hf; Fri, 18 Oct 2024 13:41:18 +0000
Received: by outflank-mailman (input) for mailman id 821937;
 Fri, 18 Oct 2024 13:41:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1nEC-0000XG-Iq
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:41:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1nEB-00059T-Id; Fri, 18 Oct 2024 13:41:15 +0000
Received: from [2a02:8012:3a1:0:ecee:6c05:256c:cbd3]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1nEB-0007dI-CE; Fri, 18 Oct 2024 13:41:15 +0000
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
	bh=DCYuUNL/RfjODf9RJJh+G33KsZmG9bSdX/moEd97n2o=; b=k1NPDV4ZFPVvrQJXSTG4gOyY4/
	cl7TMzInemGqv6TW0JrRjfkx1SiCFxLxsFX7wgcne5eObgVotQHvh5ktadz4Z7/IlGr+cNMH5rQGz
	DMK2eDWdLQM1pdV97PTHHXvwKPGvHiKy/6k8JC3NImP1qBHQeZ5INt6z4gEVhFjY/rF4=;
Message-ID: <7ee1579b-f1e8-4dd4-8540-e6c0858c6999@xen.org>
Date: Fri, 18 Oct 2024 14:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241010140351.309922-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/10/2024 15:03, Ayan Kumar Halder wrote:
> If the BSS section is empty, then the function can just return.

This is more than "can", right? If we don't do it, we will end up to 
zero outside of BSS. This could be critical data...

Also, I am tempted to suggest to add a Fixes tag because even if it is 
unlikely BSS will be zero in the current Xen, it is also not unlikely.

The tag would be:

Fixes: dac84b66cc9a ("xen: arm64: initial build + config changes, start 
of day code")

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

I saw the discussion. I don't have a strong opinion on the exact 
approach choosen for zeroing. With the commit message updated:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes from :-
> 
> v1..v2 - New patch introduced in v3.
> 
>   xen/arch/arm/arm64/head.S | 2 ++

Don't we need a similar change on the arm32 code?

>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 14c3720d80..72c7b24498 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
>           PRINT("- Zero BSS -\r\n")
>           ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
>           ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
> +        cmp   x1, x0
> +        beq   skip_bss
>   
>   1:      str   xzr, [x0], #8
>           cmp   x0, x1

Cheers,

-- 
Julien Grall


