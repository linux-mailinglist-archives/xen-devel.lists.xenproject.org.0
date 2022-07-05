Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20656795C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361589.591178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8q8l-00033Y-Cn; Tue, 05 Jul 2022 21:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361589.591178; Tue, 05 Jul 2022 21:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8q8l-00031D-9x; Tue, 05 Jul 2022 21:31:27 +0000
Received: by outflank-mailman (input) for mailman id 361589;
 Tue, 05 Jul 2022 21:31:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8q8k-000317-3w
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:31:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8q8j-00063v-Q1; Tue, 05 Jul 2022 21:31:25 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8q8j-0006Wh-L2; Tue, 05 Jul 2022 21:31:25 +0000
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
	bh=kcwx3drdFvcIqoy3tO7a+MHWkz6BwSqPPHI0d1+8BOk=; b=TeDOJ6P/a4cwrfhFNtFJOv/wWz
	YKtetnAj2t9Fu1GunpS6wwEsqOWSCvlG1feksTj5DQtXWcKJwfUnahENpUBcpW/+Y7XpIIo3nE85w
	j6OteGesTz5TDXutJQga8mzobLATxfc9xtsmbVZc5tpxQQUUh4O6eDkHF6lu0jLRQMnE=;
Message-ID: <b333cb5e-5b68-0abb-5a9a-f7d77d39bcf0@xen.org>
Date: Tue, 5 Jul 2022 22:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220705210218.483854-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 05/07/2022 22:02, Xenia Ragiadakou wrote:
> The function idle_loop() is referenced only in domain.c.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definitions.
> 
> Since idle_loop() is referenced only in inline assembly, add the 'used'
> attribute to suppress unused-function compiler warning.
> 
> Also, this patch resolves indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/domain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2f8eaab7b5..2fa67266d0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -63,7 +63,7 @@ static void do_idle(void)
>       rcu_idle_exit(cpu);
>   }
>   
> -void idle_loop(void)
> +static __used void idle_loop(void)
>   {
>       unsigned int cpu = smp_processor_id();
>   

-- 
Julien Grall

