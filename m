Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD77FBF0B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 17:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643310.1003372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80iv-0006WY-QA; Tue, 28 Nov 2023 16:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643310.1003372; Tue, 28 Nov 2023 16:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80iv-0006Tr-LS; Tue, 28 Nov 2023 16:14:09 +0000
Received: by outflank-mailman (input) for mailman id 643310;
 Tue, 28 Nov 2023 16:14:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r80it-0006Tl-My
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 16:14:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r80is-0004FS-Fe; Tue, 28 Nov 2023 16:14:06 +0000
Received: from static-css-csq-252138.business.bouyguestelecom.com
 ([176.175.252.138] helo=[172.20.7.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r80is-0001XS-A8; Tue, 28 Nov 2023 16:14:06 +0000
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
	bh=0b62E3Wu7bp1doEaICe08WH5iUL1XCaUrt0vt92nGsg=; b=b6AXVQesRkYAquLOGgHSxoXNX/
	6lH2l4b5ub3NC1Y9RI0lkCwcDHnpVQO1Z94I7cXmFOTD3dYIAdmZ0AaLrK7BTUJceaVMJ/qZ42eNy
	oKsDKI30kOjBe04phMTAkOweChVNFhxriRjxgRWVTGG1Np0lBZr0SyhpZJeZ0ET6H5rc=;
Message-ID: <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
Date: Tue, 28 Nov 2023 17:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231127144156.361656-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/11/2023 15:41, Michal Orzel wrote:
> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
> attention to undefined behavior issues, notably during CI test runs, is
> essential. When enabled, this option causes Xen to panic upon detecting
> UBSAN failure (as the last step in ubsan_epilogue()).

I have mixed opinions on this patch. This would be a good one if we had 
a Xen mostly free from UBSAN behavior. But this is not the case at least 
on arm32. So we would end up to stop at the first error. IOW, we would 
need to fix the first error before we can see the next one.

So I feel it would be best if the gitlab CI jobs actually check for 
USBAN in the logs and fail if there are any. With that, we can get the 
full list of UBSAN issues on each job.

Cheers,

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/Kconfig.debug        | 7 +++++++
>   xen/common/ubsan/ubsan.c | 4 ++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index 94e818ee09b5..e19e9d48817c 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -107,6 +107,13 @@ config UBSAN
>   
>   	  If unsure, say N here.
>   
> +config UBSAN_FATAL
> +	bool "Panic on UBSAN failure"
> +	depends on UBSAN
> +	help
> +	  Enabling this option will cause Xen to panic when an undefined behavior
> +	  is detected by UBSAN. If unsure, say N here.
> +
>   config DEBUG_TRACE
>   	bool "Debug trace support"
>   	---help---
> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
> index a3a80fa99eec..dd5ee0013648 100644
> --- a/xen/common/ubsan/ubsan.c
> +++ b/xen/common/ubsan/ubsan.c
> @@ -174,6 +174,10 @@ static void ubsan_epilogue(unsigned long *flags)
>   		"========================================\n");
>   	spin_unlock_irqrestore(&report_lock, *flags);
>   	current->in_ubsan--;
> +
> +#ifdef CONFIG_UBSAN_FATAL
> +	panic("UBSAN failure detected\n");
> +#endif
>   }
>   
>   static void handle_overflow(struct overflow_data *data, unsigned long lhs,

-- 
Julien Grall

