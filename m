Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B091686CAA5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687129.1070069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgmw-0004VN-GI; Thu, 29 Feb 2024 13:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687129.1070069; Thu, 29 Feb 2024 13:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgmw-0004TC-CU; Thu, 29 Feb 2024 13:49:30 +0000
Received: by outflank-mailman (input) for mailman id 687129;
 Thu, 29 Feb 2024 13:49:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfgmu-0004SY-Md
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:49:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfgmu-0005RW-D9; Thu, 29 Feb 2024 13:49:28 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfgmu-0005vb-5G; Thu, 29 Feb 2024 13:49:28 +0000
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
	bh=b4vchcwnMvTdcQ1H7CWGgZ5zgDInDgGoaXp1bDf4v+4=; b=el/PSrQO3sXTfSy4NOkzaxOHG/
	6UFOcxJOtM7iWYq8HQD5SKsFOIgx5TOZ/DhdYp6oBmfCikE5wVxYqRZoqU9i2fzn8nSD9UljOWhMe
	xVoYPHlJn9pOUx5xXaR3yDo3bi+pP9DTuRF5Oh08sC7PIsXBYoYY8kRc8SiT6Mtgw3HM=;
Message-ID: <e44a8bcf-a037-441c-b85c-651784df020a@xen.org>
Date: Thu, 29 Feb 2024 13:49:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/23] xen/riscv: introduce nospec.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 26/02/2024 17:38, Oleksii Kurochko wrote:
>  From the unpriviliged doc:
>    No standard hints are presently defined.
>    We anticipate standard hints to eventually include memory-system spatial
>    and temporal locality hints, branch prediction hints, thread-scheduling
>    hints, security tags, and instrumentation flags for simulation/emulation.
> 
> Also, there are no speculation execution barriers.
> 
> Therefore, functions evaluate_nospec() and block_speculation() should
> remain empty until a specific platform has an extension to deal with
> speculation execution.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   Changes in V5:
>     - new patch
> ---
>   xen/arch/riscv/include/asm/nospec.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/nospec.h
> 
> diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
> new file mode 100644
> index 0000000000..4fb404a0a2
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/nospec.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

New file should use the SPDX tag GPL-2.0-only. I guess this could be 
fixed on commit?

Cheers,

-- 
Julien Grall

