Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD976C1D1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 03:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574659.900147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR0FM-0007Ce-Vt; Wed, 02 Aug 2023 01:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574659.900147; Wed, 02 Aug 2023 01:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR0FM-00078h-T9; Wed, 02 Aug 2023 01:01:52 +0000
Received: by outflank-mailman (input) for mailman id 574659;
 Wed, 02 Aug 2023 01:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qR0FM-0006sE-7Q
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 01:01:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ac7f5a-30d0-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 03:01:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AEC461781;
 Wed,  2 Aug 2023 01:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB19C433C7;
 Wed,  2 Aug 2023 01:01:46 +0000 (UTC)
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
X-Inumbo-ID: 28ac7f5a-30d0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690938107;
	bh=b8ZTI0DUyypX2jJSHtf2hriCyizM8M3M0RYQ+M4v/YA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A7kTImnC2LsEX0aY+x2+ZLnBYazmGEpgL2PlR6uND+YzoC6ZaBWOnST7EMeJtaGMH
	 jTR+336XRJo6pVtBMutRIooXSS6dgNvpXppd9O9mUoeHCK1o/lsnZNACBkWVnJBx7M
	 /4pVtFtuMa21J50jCvvk0T4ee5dkfANUfGiOgaIuDfMrAWBQ5HteBhX6prUCfu3iYa
	 yYp0o3GKPl6jpJ9uw4irXl2EJ8lJ6TDK/t1ZHJ04VDFC1uXm176M90gauxp/EctY3q
	 HZaaDxiH8i3EqPF6z/3++yhIHvzQy1TW+T+nE+SlBee+x/2qhbKSZWLalFl02Dk7AO
	 +X2si9ICrZx1A==
Date: Tue, 1 Aug 2023 18:01:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
In-Reply-To: <20230801202006.20322-5-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308011757400.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-5-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> The field `is_console` suggests that the field represents a state of being or
> posession, not that it reflects the privilege to access the console. In this
  ^ possession

> patch the field is renamed to capabilities to encapsulate the capabilities a
> domain has been granted. The first capability being the ability to read/write
> the Xen console.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Patch looks fine to me aside the two minor nits. I am not sure I
understand 100% the difference between capabilities and roles but I am
OK with the patch. I'd like to hear Julien's feedback on this as well. 


> ---
>  xen/arch/arm/domain_build.c |  4 +++-
>  xen/include/xen/sched.h     | 25 +++++++++++++++++++++++--
>  xen/include/xsm/dummy.h     |  2 +-
>  3 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 51b4daefe1..ad7432b029 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -4076,7 +4076,9 @@ void __init create_domUs(void)
>              panic("Error creating domain %s (rc = %ld)\n",
>                    dt_node_name(node), PTR_ERR(d));
>  
> -        d->is_console = true;
> +        if ( ! domain_set_cap(d, CAP_CONSOLE_IO) )

code style


> +            printk("failed setting console_io on %pd\n", d);
> +
>          dt_device_set_used_by(node, d->domain_id);
>  
>          rc = construct_domU(d, node);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ec0f9baff6..b04fbe0565 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -472,8 +472,8 @@ struct domain
>  #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>  #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>      uint8_t          role;
> -    /* Can this guest access the Xen console? */
> -    bool             is_console;
> +#define CAP_CONSOLE_IO  (1U<<0)
> +    uint8_t          capabilities;
>      /* Is this guest being debugged by dom0? */
>      bool             debugger_attached;
>      /*
> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>      return is_hvm_domain(v->domain);
>  }
>  
> +static always_inline bool domain_has_cap(
> +    const struct domain *d, uint8_t cap)
> +{
> +    return d->capabilities & cap;
> +}
> +
> +static always_inline bool domain_set_cap(
> +    struct domain *d, uint8_t cap)
> +{
> +    switch ( cap )
> +    {
> +    case CAP_CONSOLE_IO:
> +        d->capabilities |= cap;
> +        break;
> +    default:
> +        return false;
> +    }
> +
> +    return domain_has_cap(d, cap);
> +}
> +
>  static always_inline bool hap_enabled(const struct domain *d)
>  {
>      /* sanitise_domain_config() rejects HAP && !HVM */
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 18f1ddd127..067ff1d111 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -268,7 +268,7 @@ static XSM_INLINE int cf_check xsm_console_io(
>      XSM_DEFAULT_ARG struct domain *d, int cmd)
>  {
>      XSM_ASSERT_ACTION(XSM_OTHER);
> -    if ( d->is_console )
> +    if ( domain_has_cap(d, CAP_CONSOLE_IO) )
>          return xsm_default_action(XSM_HOOK, d, NULL);
>  #ifdef CONFIG_VERBOSE_DEBUG
>      if ( cmd == CONSOLEIO_write )
> -- 
> 2.20.1
> 

