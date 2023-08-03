Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C276F463
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 23:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576616.902949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfTt-0001Zw-6d; Thu, 03 Aug 2023 21:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576616.902949; Thu, 03 Aug 2023 21:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfTt-0001Y3-3B; Thu, 03 Aug 2023 21:03:37 +0000
Received: by outflank-mailman (input) for mailman id 576616;
 Thu, 03 Aug 2023 21:03:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRfTr-0001Xx-TZ
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 21:03:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfTp-0001po-OV; Thu, 03 Aug 2023 21:03:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfTp-0007Sk-FS; Thu, 03 Aug 2023 21:03:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=7NJgIuBBaorRvBuuZNfLjpOMs0awr/mZgat3dL+uQ/c=; b=AD1caAMM4tVHDRUnYmtP0Heqka
	IT8BrsiQYq+YVZZaUxIz6+a8nt/rLy/L0PX8JAwu9F0mgumV3m+vvVzWHoWWlHfZUNqwZmALPaa2i
	ZNpS9BUUUOy8eUH7JTCQu6dwpit4fSe0DbQF2ra/2VfhfCqabpC3+0JIM4C/9y2pmhUg=;
Message-ID: <8951f722-6949-b2b5-f6d4-2d515f085cde@xen.org>
Date: Thu, 3 Aug 2023 22:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
In-Reply-To: <20230801202006.20322-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/08/2023 21:20, Daniel P. Smith wrote:
> The field `is_console` suggests that the field represents a state of being or
> posession, not that it reflects the privilege to access the console. In this
> patch the field is renamed to capabilities to encapsulate the capabilities a
> domain has been granted. The first capability being the ability to read/write
> the Xen console.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/arm/domain_build.c |  4 +++-
>   xen/include/xen/sched.h     | 25 +++++++++++++++++++++++--
>   xen/include/xsm/dummy.h     |  2 +-
>   3 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 51b4daefe1..ad7432b029 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -4076,7 +4076,9 @@ void __init create_domUs(void)
>               panic("Error creating domain %s (rc = %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));
>   
> -        d->is_console = true;
> +        if ( ! domain_set_cap(d, CAP_CONSOLE_IO) )

Coding style: We don't usually add a space after '!'.

> +            printk("failed setting console_io on %pd\n", d);

I find a bit odd that we would continue even if the cap cannot be set. 
Can you clarify?

> +
>           dt_device_set_used_by(node, d->domain_id);
>   
>           rc = construct_domU(d, node);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ec0f9baff6..b04fbe0565 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -472,8 +472,8 @@ struct domain
>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>   #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>       uint8_t          role;
> -    /* Can this guest access the Xen console? */
> -    bool             is_console;
> +#define CAP_CONSOLE_IO  (1U<<0)
Coding style: Space before and after <<.

> +    uint8_t          capabilities;
>       /* Is this guest being debugged by dom0? */
>       bool             debugger_attached;
>       /*
> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>       return is_hvm_domain(v->domain);
>   }
>   
> +static always_inline bool domain_has_cap(
> +    const struct domain *d, uint8_t cap)

Coding style: We don't usually wrap the arguments this way. See 
domain_create() for an example.

> +{
> +    return d->capabilities & cap;
> +}
> +
> +static always_inline bool domain_set_cap(
> +    struct domain *d, uint8_t cap)

Same about the coding style here.

Also, do you expect the cap to be set only when the domain is created? 
If not, would you prevent potentially concurrent update to d->capabilities?


> +{
> +    switch ( cap )
> +    {
> +    case CAP_CONSOLE_IO:
> +        d->capabilities |= cap;
> +        break;
> +    default:

Is this meant to be reached? If not, maybe add ASSERT_UNREACHABLE()?

> +        return false;
> +    }
> +
> +    return domain_has_cap(d, cap);
> +} > +
>   static always_inline bool hap_enabled(const struct domain *d)
>   {
>       /* sanitise_domain_config() rejects HAP && !HVM */
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 18f1ddd127..067ff1d111 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -268,7 +268,7 @@ static XSM_INLINE int cf_check xsm_console_io(
>       XSM_DEFAULT_ARG struct domain *d, int cmd)
>   {
>       XSM_ASSERT_ACTION(XSM_OTHER);
> -    if ( d->is_console )
> +    if ( domain_has_cap(d, CAP_CONSOLE_IO) )
>           return xsm_default_action(XSM_HOOK, d, NULL);
>   #ifdef CONFIG_VERBOSE_DEBUG
>       if ( cmd == CONSOLEIO_write )

Cheers,

-- 
Julien Grall

