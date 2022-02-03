Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0C34A8587
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264778.458005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcTJ-0002tq-9w; Thu, 03 Feb 2022 13:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264778.458005; Thu, 03 Feb 2022 13:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcTJ-0002rI-6w; Thu, 03 Feb 2022 13:48:25 +0000
Received: by outflank-mailman (input) for mailman id 264778;
 Thu, 03 Feb 2022 13:48:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFcTH-0002rC-KI
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:48:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFcTH-0006lu-40; Thu, 03 Feb 2022 13:48:23 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.236.11])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFcTG-0006qW-TH; Thu, 03 Feb 2022 13:48:23 +0000
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
	bh=IPEnVc8uiuVpQx36uc7O4QQ1mw9c3xlX/S0zt16aMBg=; b=zmIfi7Jn3m0+QONoW8KUG+8ltI
	RlilTlrT4LSKIhVxmNMRoPU91eQNFg7BzHACIND7uRuylHKieRl7vqzsnQcttNqvXKG4TBGcihIhx
	C2u9sbWSKpOY5pSTl1qL3ecw4RlH6QxRAeYR8iLtL7BCcIO3TL94n94E7gDJdlP09LoU=;
Message-ID: <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
Date: Thu, 3 Feb 2022 13:48:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220203133829.7913-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/02/2022 13:38, Andrew Cooper wrote:
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 37f78cc4c4c9..38b390d20371 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *v);
>    * from any processor.
>    */
>   void __domain_crash(struct domain *d);
> -#define domain_crash(d) do {                                              \
> -    printk("domain_crash called from %s:%d\n", __FILE__, __LINE__);       \
> -    __domain_crash(d);                                                    \
> -} while (0)
> +#define domain_crash(d, ...)                            \
> +    do {                                                \
> +        if ( count_args(__VA_ARGS__) == 0 )             \
> +            printk("domain_crash called from %s:%d\n",  \
> +                   __FILE__, __LINE__);                 \

I find a bit odd that here you are using a normal printk but...


> +        else                                            \
> +            printk(XENLOG_G_ERR __VA_ARGS__);           \

here it is XENLOG_G_ERR. In fact, isn't it ratelimited? If so, wouldn't 
it be better to only use XENLOG_ERR so they can always be seen? (A 
domain shouldn't be able to abuse it).

Cheers,

-- 
Julien Grall

