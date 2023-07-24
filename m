Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D835760245
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 00:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569255.889630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO433-0001C7-He; Mon, 24 Jul 2023 22:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569255.889630; Mon, 24 Jul 2023 22:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO433-00019W-EP; Mon, 24 Jul 2023 22:29:01 +0000
Received: by outflank-mailman (input) for mailman id 569255;
 Mon, 24 Jul 2023 22:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO432-00019Q-0V
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 22:29:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a3f6c7c-2a71-11ee-8612-37d641c3527e;
 Tue, 25 Jul 2023 00:28:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14A906144E;
 Mon, 24 Jul 2023 22:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6977AC433C8;
 Mon, 24 Jul 2023 22:28:54 +0000 (UTC)
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
X-Inumbo-ID: 7a3f6c7c-2a71-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690237735;
	bh=UGSJRNRJY2sX+WOaCRfEkNafNwXKK+QCD1M7K1RX084=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QKtS6FvrcwLehzVyxzzuRo+LTK2wd+UxHDfeQIE3ts82ji4ooE+k6S+MoQTAv/ol/
	 byuzgdvl27DpzDNrVcNRBDaIDu7HgTP02/GV0u5ZWgI/84y6ib1UmXvwyFn3e4vgMp
	 wHCoBdFke6Xqtgt0mFY8shxm6j0gLjcsWKjB8H/m6Zm630/l0qOhMr8JZOYo9V6BK9
	 muN+bQs3iD6vN4W7NSEn4iBKMYeL2XnhUOG+EZxkyhzzaejZjFyq6WxWKeu9LV/5fU
	 SVm/Cgr5ra3Z7TEmuPgtDH66L3uU0GidkzjcUTAw2VRv4Plgdl0scq6sincqAps0QX
	 hk1es57F1kLmg==
Date: Mon, 24 Jul 2023 15:28:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/dt: Rework the prototype of dt_property_read_string()
 to help Eclair
In-Reply-To: <20230724102443.91894-1-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2307241528150.3118466@ubuntu-linux-20-04-desktop>
References: <20230724102443.91894-1-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Eclair vXXX is unable to prove the parameter out_string will only be
> used the return of dt_property_read_string() is 0. So it will consider
> that MISRA C:2012 Rule 9.1 was violated.
> 
> Rework the prototype so the string is returned and use ERR_PTR() to
> embed the error code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I'll let you sort out the best commit message. For the code changes:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> The XXX should be replaced with the version of Eclair. Nicola, can you
> provide it?
> ---
>  xen/arch/arm/domain_build.c   |  4 +++-
>  xen/arch/arm/psci.c           | 10 +++++-----
>  xen/common/device_tree.c      | 15 +++++++--------
>  xen/drivers/char/arm-uart.c   | 10 ++++++----
>  xen/include/xen/device_tree.h | 16 ++++++++--------
>  5 files changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 39b4ee03a505..2f98f0b1bd9c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3850,7 +3850,9 @@ static int __init construct_domU(struct domain *d,
>  
>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>  
> -    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
> +    dom0less_enhanced = dt_property_read_string(node, "xen,enhanced");
> +
> +    rc = IS_ERR(dom0less_enhanced) ? PTR_ERR(dom0less_enhanced) : 0;
>      if ( rc == -EILSEQ ||
>           rc == -ENODATA ||
>           (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 695d2fa1f1b5..8e01b5962c63 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -8,7 +8,7 @@
>   * Copyright (c) 2013 Linaro Limited.
>   */
>  
> -
> +#include <xen/err.h>
>  #include <xen/types.h>
>  #include <xen/init.h>
>  #include <xen/mm.h>
> @@ -85,13 +85,13 @@ static int __init psci_features(uint32_t psci_func_id)
>  
>  static int __init psci_is_smc_method(const struct dt_device_node *psci)
>  {
> -    int ret;
>      const char *prop_str;
>  
> -    ret = dt_property_read_string(psci, "method", &prop_str);
> -    if ( ret )
> +    prop_str = dt_property_read_string(psci, "method");
> +    if ( IS_ERR(prop_str) )
>      {
> -        printk("/psci node does not provide a method (%d)\n", ret);
> +        printk("/psci node does not provide a method (%ld)\n",
> +               PTR_ERR(prop_str));
>          return -EINVAL;
>      }
>  
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 0677193ab370..11222c3a8abf 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -191,21 +191,20 @@ bool_t dt_property_read_u64(const struct dt_device_node *np,
>  
>      return 1;
>  }
> -int dt_property_read_string(const struct dt_device_node *np,
> -                            const char *propname, const char **out_string)
> +
> +const char *dt_property_read_string(const struct dt_device_node *np,
> +                                    const char *propname)
>  {
>      const struct dt_property *pp = dt_find_property(np, propname, NULL);
>  
>      if ( !pp )
> -        return -EINVAL;
> +        return ERR_PTR(-EINVAL);
>      if ( !pp->length )
> -        return -ENODATA;
> +        return ERR_PTR(-ENODATA);
>      if ( strnlen(pp->value, pp->length) >= pp->length )
> -        return -EILSEQ;
> -
> -    *out_string = pp->value;
> +        return ERR_PTR(-EILSEQ);
>  
> -    return 0;
> +    return pp->value;
>  }
>  
>  /**
> diff --git a/xen/drivers/char/arm-uart.c b/xen/drivers/char/arm-uart.c
> index 8098a968c285..b76d8063beee 100644
> --- a/xen/drivers/char/arm-uart.c
> +++ b/xen/drivers/char/arm-uart.c
> @@ -21,6 +21,7 @@
>  
>  #include <xen/console.h>
>  #include <xen/device_tree.h>
> +#include <xen/err.h>
>  #include <xen/param.h>
>  #include <xen/serial.h>
>  #include <xen/errno.h>
> @@ -55,16 +56,17 @@ static void __init dt_uart_init(void)
>          {
>              const char *stdout;
>  
> -            ret = dt_property_read_string(chosen, "stdout-path", &stdout);
> -            if ( ret >= 0 )
> +            stdout = dt_property_read_string(chosen, "stdout-path");
> +            if ( !IS_ERR(stdout) )
>              {
>                  printk("Taking dtuart configuration from /chosen/stdout-path\n");
>                  if ( strlcpy(opt_dtuart, stdout, sizeof(opt_dtuart))
>                       >= sizeof(opt_dtuart) )
>                      printk("WARNING: /chosen/stdout-path too long, truncated\n");
>              }
> -            else if ( ret != -EINVAL /* Not present */ )
> -                printk("Failed to read /chosen/stdout-path (%d)\n", ret);
> +            else if ( PTR_ERR(stdout) != -EINVAL /* Not present */ )
> +                printk("Failed to read /chosen/stdout-path (%ld)\n",
> +                       PTR_ERR(stdout));
>          }
>      }
>  
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index c2eada748915..492204b4feda 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -486,18 +486,18 @@ static inline bool_t dt_property_read_bool(const struct dt_device_node *np,
>   *              if return value if 0.
>   *
>   * Search for a property in a device tree node and retrieve a null
> - * terminated string value (pointer to data, not a copy). Returns 0 on
> - * success, -EINVAL if the property does not exist, -ENODATA if property
> - * doest not have value, and -EILSEQ if the string is not
> - * null-terminated with the length of the property data.
> + * terminated string value (pointer to data, not a copy). Returns a
> + * pointer to a null terminated string on success, -EINVAL if the property
> + * does not exist, -ENODATA if property doest not have value, and -EILSEQ
> + * if the string is not null-terminated with the length of the property data.
> + *
> + * The caller should use IS_ERR(...) to check if an error is returned.
>   *
>   * Note that the empty string "" has length of 1, thus -ENODATA cannot
>   * be interpreted as an empty string.
> - *
> - * The out_string pointer is modified only if a valid string can be decoded.
>   */
> -int dt_property_read_string(const struct dt_device_node *np,
> -                            const char *propname, const char **out_string);
> +const char *dt_property_read_string(const struct dt_device_node *np,
> +                                    const char *propname);
>  
>  /**
>   * dt_property_match_string() - Find string in a list and return index
> -- 
> 2.40.1
> 

