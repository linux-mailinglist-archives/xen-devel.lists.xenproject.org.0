Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38276A2ADB
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 17:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501790.773546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxhl-0006Bi-Qt; Sat, 25 Feb 2023 16:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501790.773546; Sat, 25 Feb 2023 16:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxhl-00068s-OD; Sat, 25 Feb 2023 16:47:25 +0000
Received: by outflank-mailman (input) for mailman id 501790;
 Sat, 25 Feb 2023 16:47:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVxhl-00068m-2N
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 16:47:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxhj-0004G8-JU; Sat, 25 Feb 2023 16:47:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxhj-0002ub-D6; Sat, 25 Feb 2023 16:47:23 +0000
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
	bh=t1wX7JafYQ1v/6etPxbCgSpxNr++juIZFmc5pU5b214=; b=cRq0JmJD6+o9sNLvxO7KV2lCtM
	gAR45IZ0xBbLXjS3vKcPcfkczoqkE/QuSgkGIV+6pWRrHIxhcN/9E/l+7EqWJtTq2M/VpX23sB3ZQ
	1cs7/vbyw0BCWE1h8w7kuyEWLV4qXNN+bSk+A2pq/B94DsoqLlMgyK6wZGLtmzkruB4Q=;
Message-ID: <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
Date: Sat, 25 Feb 2023 16:47:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 24/02/2023 11:31, Oleksii Kurochko wrote:
> Since the generic version of bug.h stuff was introduced use <xen/bug.h>
> instead of unnecessary <asm/bug.h>
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>   * Update patch 2 not to break compilation: move some parts from patches 3 and 4
>     to patch 2:
>     * move some generic parts from <asm/bug.h> to <xen/bug.h>
>     * add define BUG_FRAME_STRUCT in ARM's <asm/bug.h>
> ---
> Changes in V2:
>   * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as second patch,
>     update the patch to change all <asm/bug.h> to <xen/bug.h> among the whole project
>     to not break build.
>   * Update the commit message.
> ---
>   xen/arch/arm/include/asm/bug.h       | 19 +++----------------
>   xen/arch/arm/include/asm/div64.h     |  2 +-
>   xen/arch/arm/vgic/vgic-v2.c          |  2 +-
>   xen/arch/arm/vgic/vgic.c             |  2 +-
>   xen/arch/x86/acpi/cpufreq/cpufreq.c  |  2 +-
>   xen/arch/x86/include/asm/asm_defns.h |  2 +-
>   xen/arch/x86/include/asm/bug.h       | 19 ++-----------------
>   xen/drivers/cpufreq/cpufreq.c        |  2 +-
>   xen/include/xen/lib.h                |  2 +-
>   9 files changed, 12 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
> index f4088d0913..cacaf014ab 100644
> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -1,6 +1,8 @@
>   #ifndef __ARM_BUG_H__
>   #define __ARM_BUG_H__
>   
> +#include <xen/types.h>

You are not adding new code in bug.h, so can you explain why this is now 
necessary?

> +
>   #if defined(CONFIG_ARM_32)
>   # include <asm/arm32/bug.h>
>   #elif defined(CONFIG_ARM_64)
> @@ -9,9 +11,7 @@
>   # error "unknown ARM variant"
>   #endif
>   
> -#define BUG_DISP_WIDTH    24
> -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)

Even if the values are the same as the one you defined in the common 
bug.h, it doesn't feel right to remove them as long as...

> +#define BUG_FRAME_STRUCT

the arch is defining BUG_FRAME_STRUCT. So I would say the generic one 
should be defined within BUG_FRAME_STRUCT.

Cheers,

-- 
Julien Grall

