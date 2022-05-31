Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE006539670
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 20:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339993.564924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6pF-0006ps-CS; Tue, 31 May 2022 18:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339993.564924; Tue, 31 May 2022 18:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6pF-0006nl-7y; Tue, 31 May 2022 18:42:41 +0000
Received: by outflank-mailman (input) for mailman id 339993;
 Tue, 31 May 2022 18:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw6pD-0006nf-KE
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 18:42:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70aeb73a-e111-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 20:42:37 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654022553572260.7125117426111;
 Tue, 31 May 2022 11:42:33 -0700 (PDT)
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
X-Inumbo-ID: 70aeb73a-e111-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654022555; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SCoVdfwcMNYFAGp9/KFSwNQtMswTPY/oqEmkEkXVZet6PXBzJ+CG7ib9S3Yl+1ApNBQ4s/6echjL0iEckka67tXxHWNM7eCDoDxAzHNj7R8lmtBhZyTCzyWIf8AGY4d2NEVuiq2xmCpIkYm4hHh5GDyrkU9bJylhghNWo2OnYIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654022555; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=aTwFNk7tW621SF6+ViguXLN6YsO1wyymwaU1/IXPzdQ=; 
	b=Ua295ZoyYCOHZOjTKs5OdxjFfnF2Ryy6+0hIu9+pF5XvkRd6j/BdXoRY2HI207mfmQEALCQTxT5OKOYZj6Ba2vVcnxXWUXRgbf/GzKyTxH9CkhMzD59zzl9QHQQhWdzhtIVVKUgF2bK2YSDosOk7UnjoP9Kxc0XaaQu+ds4CGlQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654022555;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aTwFNk7tW621SF6+ViguXLN6YsO1wyymwaU1/IXPzdQ=;
	b=JGHHqgLgkZncqYylYkIqGSGJQyRtlQouKabH8dGdWbTs6J1lijJ+CKF0Qvcl+mUj
	xe48sSw+vXsMWy0ov6kcRC0JYpQwK6DEdYcSqdlft6XSrxG9m3P+pV+MwJxdG3ykXsr
	/aaIAXPYLYrms45YWGeYGZ3YiR7bBtoYloPc5JuQ=
Message-ID: <6d02621e-3106-4924-3307-37b4174fe766@apertussolutions.com>
Date: Tue, 31 May 2022 14:41:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
In-Reply-To: <20220531182041.10640-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/31/22 14:20, Daniel P. Smith wrote:
> Previously, initializing the policy buffer was split between two functions,
> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
> the policy from boot modules and the former for falling back to built-in
> policy.
> 
> This patch moves all policy buffer initialization logic under the
> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
> message is printed for every error condition that may occur in the functions.
> With all policy buffer init contained and only called when the policy buffer
> must be populated, the respective xsm_{mb,dt}_init() functions will panic for
> all errors except ENOENT. An ENOENT signifies that a policy file could not be
> located. Since it is not possible to know if late loading of the policy file is
> intended, a warning is reported and XSM initialization is continued.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/include/xsm/xsm.h |  2 +-
>  xen/xsm/xsm_core.c    | 51 ++++++++++++++++++++-----------------------
>  xen/xsm/xsm_policy.c  | 34 ++++++++++++++++++++++++-----
>  3 files changed, 54 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 3e2b7fe3db..1676c261c9 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -775,7 +775,7 @@ int xsm_multiboot_init(
>      unsigned long *module_map, const multiboot_info_t *mbi);
>  int xsm_multiboot_policy_init(
>      unsigned long *module_map, const multiboot_info_t *mbi,
> -    void **policy_buffer, size_t *policy_size);
> +    const unsigned char *policy_buffer[], size_t *policy_size);
>  #endif
>  
>  #ifdef CONFIG_HAS_DEVICE_TREE
> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
> index 675e4f552c..a3715fa239 100644
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -92,14 +92,6 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>  {
>      const struct xsm_ops *ops = NULL;
>  
> -#ifdef CONFIG_XSM_FLASK_POLICY
> -    if ( policy_size == 0 )
> -    {
> -        policy_buffer = xsm_flask_init_policy;
> -        policy_size = xsm_flask_init_policy_size;
> -    }
> -#endif
> -
>      if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
>      {
>          printk(XENLOG_ERR
> @@ -154,28 +146,29 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>  int __init xsm_multiboot_init(
>      unsigned long *module_map, const multiboot_info_t *mbi)
>  {
> -    int ret = 0;
> -    void *policy_buffer = NULL;
> +    const unsigned char *policy_buffer;
>      size_t policy_size = 0;
>  
>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>  
>      if ( policy_file_required )
>      {
> -        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
> +        int ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>                                          &policy_size);
> -        if ( ret )
> -        {
> -            bootstrap_map(NULL);
> -            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
> -            return -EINVAL;
> -        }
> +        bootstrap_map(NULL);
> +
> +        if ( ret == -ENOENT )
> +            /*
> +             * The XSM module needs a policy file but one was not located.
> +             * Report as a warning and continue as the XSM module may late
> +             * load a policy file.
> +             */
> +            printk(XENLOG_WARNING "xsm: starting without a policy loaded!\n");
> +        else
> +            panic("Error %d initializing XSM policy\n", ret);
>      }
>  
> -    ret = xsm_core_init(policy_buffer, policy_size);
> -    bootstrap_map(NULL);
> -
> -    return 0;
> +    return xsm_core_init(policy_buffer, policy_size);
>  }
>  #endif
>  
> @@ -183,7 +176,7 @@ int __init xsm_multiboot_init(
>  int __init xsm_dt_init(void)
>  {
>      int ret = 0;
> -    void *policy_buffer = NULL;
> +    const unsigned char *policy_buffer;
>      size_t policy_size = 0;
>  
>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
> @@ -191,11 +184,15 @@ int __init xsm_dt_init(void)
>      if ( policy_file_required )
>      {
>          ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
> -        if ( ret )
> -        {
> -            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
> -            return -EINVAL;
> -        }
> +        if ( ret == -ENOENT )
> +            /*
> +             * The XSM module needs a policy file but one was not located.
> +             * Report as a warning and continue as the XSM module may late
> +             * load a policy file.
> +             */
> +            printk(XENLOG_WARNING "xsm: starting without a policy loaded!\n");
> +        else
> +            panic("Error %d initializing XSM policy\n", ret);
>      }
>  
>      ret = xsm_core_init(policy_buffer, policy_size);
> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 8dafbc9381..690fd23e9f 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -8,7 +8,7 @@
>   *  Contributors:
>   *  Michael LeMay, <mdlemay@epoch.ncsc.mil>
>   *  George Coker, <gscoker@alpha.ncsc.mil>
> - *  
> + *
>   *  This program is free software; you can redistribute it and/or modify
>   *  it under the terms of the GNU General Public License version 2,
>   *  as published by the Free Software Foundation.
> @@ -32,14 +32,21 @@
>  #ifdef CONFIG_MULTIBOOT
>  int __init xsm_multiboot_policy_init(
>      unsigned long *module_map, const multiboot_info_t *mbi,
> -    void **policy_buffer, size_t *policy_size)
> +    const unsigned char **policy_buffer, size_t *policy_size)
>  {
>      int i;
>      module_t *mod = (module_t *)__va(mbi->mods_addr);
> -    int rc = 0;
> +    int rc = -ENOENT;
>      u32 *_policy_start;
>      unsigned long _policy_len;
>  
> +#ifdef CONFIG_XSM_FLASK_POLICY
> +    /* Initially set to builtin policy, overriden if boot module is found. */
> +    *policy_buffer = xsm_flask_init_policy;
> +    *policy_size = xsm_flask_init_policy_size;
> +    rc = 0;
> +#endif
> +
>      /*
>       * Try all modules and see whichever could be the binary policy.
>       * Adjust module_map for the module that is the binary policy.
> @@ -54,13 +61,14 @@ int __init xsm_multiboot_policy_init(
>  
>          if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
>          {
> -            *policy_buffer = _policy_start;
> +            *policy_buffer = (unsigned char *)_policy_start;
>              *policy_size = _policy_len;
>  
>              printk("Policy len %#lx, start at %p.\n",
>                     _policy_len,_policy_start);
>  
>              __clear_bit(i, module_map);
> +            rc = 0;
>              break;
>  
>          }
> @@ -68,18 +76,31 @@ int __init xsm_multiboot_policy_init(
>          bootstrap_map(NULL);
>      }
>  
> +    if ( rc == -ENOENT )
> +        printk(XENLOG_ERR "xsm: Unable to locate policy file\n");
> +
>      return rc;
>  }
>  #endif
>  
>  #ifdef CONFIG_HAS_DEVICE_TREE
> -int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
> +int __init xsm_dt_policy_init(
> +    const unsigned char **policy_buffer, size_t *policy_size)

I just caught that I missed the matching header declaration. ( ._.) I
noticed there is a one-liner at the end of INSTALL for doing
cross-compile. I will see if I can get that to work to incorporate in my
build/test system.

>  {
>      struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
>      paddr_t paddr, len;
>  
>      if ( !mod || !mod->size )
> +    {
> +#ifdef CONFIG_XSM_FLASK_POLICY
> +        *policy_buffer = xsm_flask_init_policy;
> +        *policy_size = xsm_flask_init_policy_size;
>          return 0;
> +#else
> +        printk(XENLOG_ERR "xsm: Unable to locate policy file\n");
> +        return -ENOENT;
> +#endif
> +    }
>  
>      paddr = mod->start;
>      len = mod->size;
> @@ -95,7 +116,10 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
>  
>      *policy_buffer = xmalloc_bytes(len);
>      if ( !*policy_buffer )
> +    {
> +        printk(XENLOG_ERR "xsm: Unable to allocate memory for XSM policy\n");
>          return -ENOMEM;
> +    }
>  
>      copy_from_paddr(*policy_buffer, paddr, len);
>      *policy_size = len;

