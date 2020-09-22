Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E96274927
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKnzS-0007nR-GV; Tue, 22 Sep 2020 19:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKnzR-0007nI-0c
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:30:13 +0000
X-Inumbo-ID: 079d98f1-8230-4d3d-a3b2-c67b44f27000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 079d98f1-8230-4d3d-a3b2-c67b44f27000;
 Tue, 22 Sep 2020 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=ZHUO+GPhWx2yVKFqvxAA5NFgwlzGacWkYZHdkBHym+s=; b=6l7t60dp5BIzjZKumFwxA+hVRo
 SXK6pFcL20z04hu84Z3HbVAttvJfjNVsGRhPtsohBNuriJ/2EvrmkA5XdGQZY01ucx9YommqbO/1o
 RFXOm1Y+Q4sQewR49OYH7UEWHEQVHC69IvPEbv9jfZ3xsvM6Idskpu1cIsx9jRSi4hpM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKnzL-0006u5-O9; Tue, 22 Sep 2020 19:30:07 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKnzL-0001Lb-Ff; Tue, 22 Sep 2020 19:30:07 +0000
Subject: Re: [PATCH] xen/arm: sched: Ensure the vCPU context is seen before
 vcpu_pause() returns
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20200922192824.19619-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7a5c761f-d71c-dc8d-1860-7ca978e05a53@xen.org>
Date: Tue, 22 Sep 2020 20:30:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922192824.19619-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Doh, I forgot to CC Stefano on the e-mail. I will resend it.

Sorry for the inconvenience.

On 22/09/2020 20:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Some callers of vcpu_pause() will expect to access the latest vcpu
> context when the function returns (see XENDOMCTL_{set,get}vcpucontext}.
> 
> However, the latest vCPU context can only be observed after
> v->is_running has been observed to be false.
> 
> As there is no memory barrier instruction generated, a processor could
> try to speculatively access the vCPU context before it was observed.
> 
> To prevent the corruption of the vCPU context, we need to insert a
> memory barrier instruction after v->is_running is observed and before
> the context is accessed. This barrier is added in sync_vcpu_execstate()
> as it seems to be the place where we expect the synchronization to
> happen.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Dario Faggioli <dfaggioli@suse.com>
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> 
> I am also adding the x86 and scheduler maintainers because I am not sure
> whether this barrier should be part of the common code instead.
> ---
>   xen/arch/arm/domain.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 9258f6d3faa2..3b37f899b9da 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -371,7 +371,20 @@ void sync_local_execstate(void)
>   
>   void sync_vcpu_execstate(struct vcpu *v)
>   {
> -    /* Nothing to do -- no lazy switching */
> +    /*
> +     * We don't support lazy switching.
> +     *
> +     * However the context may have been saved from a remote pCPU so we
> +     * need a barrier to ensure it is observed before continuing.
> +     *
> +     * Per vcpu_context_saved(), the context can be observed when
> +     * v->is_running is false (the caller should check it before calling
> +     * this function).
> +     *
> +     * Note this is a full barrier to also prevent update of the context
> +     * to happen before it was observed.
> +     */
> +    smp_mb();
>   }
>   
>   #define NEXT_ARG(fmt, args)                                                 \
> 

-- 
Julien Grall

