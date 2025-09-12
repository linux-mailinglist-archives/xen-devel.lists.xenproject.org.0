Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7CAB55957
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122722.1466250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCPy-00007F-Dm; Fri, 12 Sep 2025 22:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122722.1466250; Fri, 12 Sep 2025 22:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCPy-000053-AT; Fri, 12 Sep 2025 22:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1122722;
 Fri, 12 Sep 2025 22:38:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxCPw-00004w-Rp
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:38:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCPw-006fOu-0k;
 Fri, 12 Sep 2025 22:38:56 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCPw-006Ebm-0Z;
 Fri, 12 Sep 2025 22:38:55 +0000
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
	bh=/UZytuTqwTQZKP0akQ05+kyvh35/kIXdYoAHrinw1Hg=; b=6pxpQZcKLTGGmNSYdccGMuIEHO
	qJ14wpzJRUbTN3CL0dXfuUI9mOXyqiDMmYU8nWP6P95nEAEJbM8sQA/rGKqPmKptQD0ZeJvy9NRsW
	SPeOkjmlqUWWzdaUaDeIne5yKgCJGFRa7tLbqg4wJXlxU+Xie9oN6ymizZcmRjqi8+ic=;
Message-ID: <86aec3a8-a4aa-40e4-9542-9d291c2c119e@xen.org>
Date: Fri, 12 Sep 2025 23:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1756803419.git.mykola_kvach@epam.com>
 <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 02/09/2025 10:03, Mykola Kvach wrote:
> @@ -880,6 +883,40 @@ void arch_domain_creation_finished(struct domain *d)
>       p2m_domain_creation_finished(d);
>   }
>   
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    typeof(d->arch.resume_ctx) *ctx = &d->arch.resume_ctx;

I know this is v13, but I don't think we should use typeof() is in this 
context. "struct resume_info" is much shorter and help the review (I 
don't have to grep resume_ctx to figure out the type).

> +
> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend reason
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
> +     * In these cases, the resume context will be empty.
> +     * This is not expected to cause any issues, so we just warn about the
> +     * situation and return without error, allowing the existing logic to
> +     * proceed as expected.

I think this odd to warn if something is expected. It would be best to 
use "XENLOG_INFO".

> +     */
> +    if ( !ctx->wake_cpu )
> +    {
> +        dprintk(XENLOG_WARNING, "%pd: Invalid wake CPU pointer for resume\n",

As you wrote above, there is nothing wrong. So "Invalid" is not correct. 
I think a better wording is "Wake CPU pointer context was not provided").

Also note that dprintk() will be a NOP in release build. I am guessing 
this is intended?

I will answer you Jan's comment separately. The rest looks good to me.

Cheers,

-- 
Julien Grall


