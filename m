Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F56A42AF7E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 00:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207703.363601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPvq-0002sH-Nt; Tue, 12 Oct 2021 22:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207703.363601; Tue, 12 Oct 2021 22:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maPvq-0002pG-JM; Tue, 12 Oct 2021 22:07:34 +0000
Received: by outflank-mailman (input) for mailman id 207703;
 Tue, 12 Oct 2021 22:07:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maPvp-0002pA-KM
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 22:07:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maPvp-0002wP-93; Tue, 12 Oct 2021 22:07:33 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maPvp-0006qZ-3L; Tue, 12 Oct 2021 22:07:33 +0000
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
	bh=wz7KqvDGMXaU/Hab4xQzpQ+6eQFpSZptb6ArSemFLaU=; b=whb7wICAWlvXegQqWzTQt73OH/
	kDY8z41rqFjHhdoMwIVkXqt1vcxYcR6CXxvcz4OfPzMaSyFMZlmzwESVvbC5sYS06WyP7hwQrYdAs
	50HGj5HQHvUwggmRAvBRXcbm0rJp7tsTEC9w1riBJbZ1OMcSTGOezNRRlViuYgSO0OaM=;
Message-ID: <6ea907cc-0e85-6d86-9219-837c2e98ec3d@xen.org>
Date: Tue, 12 Oct 2021 23:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 2/3] xen/arm: Check for PMU platform support
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20211012081323.14141-1-michal.orzel@arm.com>
 <20211012081323.14141-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211012081323.14141-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/10/2021 09:13, Michal Orzel wrote:
> ID_AA64DFR0_EL1/ID_DFR0_EL1 registers provide
> information about PMU support. Replace structure
> dbg64/dbg32 with a union and fill in all the
> register fields according to document:
> ARM Architecture Registers(DDI 0595, 2021-06).
> 
> Add macros boot_dbg_feature64/boot_dbg_feature32
> to check for a debug feature. Add macro
> cpu_has_pmu to check for PMU support.
> Any value higher than 0 and less than 15 means
> that PMU is supported (we do not care about its
> version for now).
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v4:
> -improve checks for PMU
> Changes since v3:
> -none
> Changes since v2:
> -none
> Changes since v1:
> -new in v2
> ---
>   xen/include/asm-arm/cpufeature.h | 51 ++++++++++++++++++++++++++++++--
>   1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 5ca09b0bff..0ddf38858a 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -4,6 +4,7 @@
>   #ifdef CONFIG_ARM_64
>   #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
>   #define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
> +#define boot_dbg_feature64(feat)       (system_cpuinfo.dbg64.feat)
>   
>   #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
>   
> @@ -22,6 +23,7 @@
>   
>   #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
>   #define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
> +#define boot_dbg_feature32(feat)       (system_cpuinfo.dbg32.feat)
>   
>   #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
>   #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
> @@ -32,8 +34,12 @@
>   
>   #ifdef CONFIG_ARM_32
>   #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
> +#define cpu_has_pmu       ((boot_dbg_feature32(perfmon) >= 1) && \
> +                           (boot_dbg_feature32(perfmon) < 15))

So I am happy with this check for arm32. But I would still like to have 
a comment explaining the fact that on Armv7 perfmon == 0 may mean PMUv1 
is may be used. Something like:

"On Armv7, the value 0 is used to indicate that PMUv2 is not supported. 
IOW this doesn't tell us whether the PMU is not supported (a processor 
may implement PMUv1).

For convenience, we treat 0 as not supported which this match the 
meaning on Armv8".

The rest of the code looks fine to me.

Cheers,

-- 
Julien Grall

