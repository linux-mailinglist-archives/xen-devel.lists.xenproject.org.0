Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E3724AF5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 20:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544141.849694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6b8E-00066l-8K; Tue, 06 Jun 2023 18:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544141.849694; Tue, 06 Jun 2023 18:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6b8E-00064k-5J; Tue, 06 Jun 2023 18:10:10 +0000
Received: by outflank-mailman (input) for mailman id 544141;
 Tue, 06 Jun 2023 18:10:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6b8D-00064e-0Z
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 18:10:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6b8C-0002n1-Cy; Tue, 06 Jun 2023 18:10:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.10.142]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6b8C-0003gC-5g; Tue, 06 Jun 2023 18:10:08 +0000
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
	bh=JGyN/+il3mBdNr/Umj+UI2DDBp0eFeJfQ0NJPbnbFf8=; b=ciIj+JuMBpDpI7OOagSa3sYfcr
	TB+IodKNarIIuFExQnrWfB6oW4N/sfMVA70LTUuZ+5qy08cRPgQ/kyykWPRUY7BSKgrR8sXb2Dze7
	hsOHwF22S7ZHmUEII2+WWxjWwiJPlI8RV7KFrCUIuK/TMaxTU0TqDNgw3TwfQk8WJX74=;
Message-ID: <0fd63050-7592-c308-51d1-f8445d3fbd4b@xen.org>
Date: Tue, 6 Jun 2023 19:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20230606172307.38857-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230606172307.38857-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 06/06/2023 18:23, Roger Pau Monne wrote:
> Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
> using _apply_alternatives().
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/alternative.c             | 2 ++
>   xen/arch/arm/include/asm/alternative.h | 2 ++
>   xen/arch/x86/alternative.c             | 5 +++--
>   xen/arch/x86/include/asm/alternative.h | 2 ++
>   4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index 7366af4ea646..016e66978b6d 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -223,6 +223,7 @@ void __init apply_alternatives_all(void)
>       vunmap(xenmap);
>   }
>   
> +#ifdef CONFIG_LIVEPATCH
>   int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end)
>   {
>       const struct alt_region region = {
> @@ -232,6 +233,7 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
>   
>       return __apply_alternatives(&region, 0);
>   }
> +#endif
>   
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
> index d3210e82f9e5..ce82dc1ca0d2 100644
> --- a/xen/arch/arm/include/asm/alternative.h
> +++ b/xen/arch/arm/include/asm/alternative.h
> @@ -29,7 +29,9 @@ typedef void (*alternative_cb_t)(const struct alt_instr *alt,
>   				 int nr_inst);
>   
>   void apply_alternatives_all(void);
> +#ifdef CONFIG_LIVEPATCH
>   int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end);
> +#endif
>   
>   #define ALTINSTR_ENTRY(feature, cb)					      \
>   	" .word 661b - .\n"				/* label           */ \
> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> index 99482766b51f..21af0e825822 100644
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>       }
>   }
>   
> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
> -                                          struct alt_instr *end)

NIT: It sounds like the init_* was a left-over after commit 67d01cdb5518 
("x86: infrastructure to allow converting certain indirect calls to 
direct ones").

Cheers,

-- 
Julien Grall

