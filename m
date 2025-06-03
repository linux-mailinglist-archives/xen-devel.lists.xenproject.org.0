Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E3ACCB48
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004690.1384411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUVz-0001x7-1m; Tue, 03 Jun 2025 16:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004690.1384411; Tue, 03 Jun 2025 16:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUVy-0001un-Ul; Tue, 03 Jun 2025 16:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1004690;
 Tue, 03 Jun 2025 16:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMUVx-0001ug-GJ
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:29:25 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e859b0ba-4097-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 18:29:23 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451e24dfe1aso14803405e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 09:29:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009ff7asm19032368f8f.90.2025.06.03.09.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 09:29:22 -0700 (PDT)
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
X-Inumbo-ID: e859b0ba-4097-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748968162; x=1749572962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eOAGv+DXtkAwgB8ZfO5WdaLO/ElcOtPmyp2YWSWX+go=;
        b=JALqNNf2IpPu75lOdL4dkhXf5QRQ6ETURw72z3O20VBSPkUj3j0WYzgdw84uoMvmyE
         a/s8x9xQTmiLQGYKW0tgftM3qTqTfGsHHjoef19U08KJSETbFPFSKDwPPXSfvFSYVHKu
         XdiBo8FjQF5bXnOElkwG7G7FdGF3Rsxgfs3wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748968162; x=1749572962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOAGv+DXtkAwgB8ZfO5WdaLO/ElcOtPmyp2YWSWX+go=;
        b=SUOLxhj5/+3UrFmhUTStUtwGJS1TuVECyXq+tjsf8AGhN0PxIrsGe78GnRhcM+xvMF
         kUme0PtYnI4sgGzINhBnPxLEInACMXEQAbhDDkq4deSWvKl6FGwvyod3og+wL/i0QPs0
         +TBttpGNbaVjBz6+Yo6eZl5Svm5GulTytD7T+mQ1BE2l8GKD7E88X5xOGgSFOUehPJCL
         J1p5WI30PAOMTzLzzEpAieC46EJfreDAp9pFcLHjAmlrHd1PPQm0NntmtFPXGCyfdtcu
         ilgBj5irPF/pPtIYKshavCvp+K9yYJDOJa7rAaY0KhVj9A/cqDclsnCJUOG+9xuRW8JS
         thnw==
X-Forwarded-Encrypted: i=1; AJvYcCWhxX59DU1kiC1GAHavF3BSgOHw3tvohMvmzxATDkmpJs4LUYy5fKXA73eBVZVTCGvQf4QlytKweg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybKscjiXHltkUzivvXHcIR4US9fo/6KyXClsuy25cOogClWSl0
	MfgRZTpjbPyvrEgYgNY3o8GI40iDVPcK+HaxG9B13MnkGSQy0N9Tlz63dVaT9PMNRVc=
X-Gm-Gg: ASbGnctawVYsI+F/XD/iZMYNNI+E8dIIx8slGoX0pwn30+LAe+TmsMTPKuB0GnDYjVC
	PXvqEpqxqcHdwVoALjo6AE+y92AvrQq02wq5ADkOVCtKWKoYYBAN3Wr4fdWAiOlVZfDGD2qqr24
	IwvgF3IeyYJtWPJVWZLnmhKIZ2PF+cwME+YDoO5jIHdaXgXx/nMuRoBZj7pYASDZm8wHd/bankc
	xJwEX3UP5d27wQAMK2ov4JBRC3qACH5vxOdR+hOVl6yRdqotVX0cVwNALlrUHwhkug03vpP8U5x
	LuQ3AEL6kpcSdVYHMT+xBVJvDi9PNKZS50FPwFgbq7xt6q4dAkpBq8jWjhS+TLxuQPxwg1/gwvW
	VFbL1d2aaoRABgy9PjjhwGmoSvpw=
X-Google-Smtp-Source: AGHT+IFxCwsclOtFy9LTloapBe9cTt9eVIrLThmbZt9gil8qhmsEDj1UsVEMtN5xk9CU03voA40k3Q==
X-Received: by 2002:a05:600c:620f:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-450d64bdccemr166185545e9.5.1748968162523;
        Tue, 03 Jun 2025 09:29:22 -0700 (PDT)
Message-ID: <32e3df0b-9ce2-4de7-9f48-d68aab8f2177@citrix.com>
Date: Tue, 3 Jun 2025 17:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-3-kevin.lampis@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250602134656.3836280-3-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 2:46 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 1f5cb67bd0..efeed5eafc 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -15,6 +15,7 @@
>  #include <xen/kexec.h>
>  #include <xen/keyhandler.h>
>  #include <xen/lib.h>
> +#include <xen/lockdown.h>
>  #include <xen/multiboot.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>

As the only modification to setup.c, this hunk surely isn't in the right
patch.

> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0951d4c2f2..33cd669110 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -587,4 +587,12 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +config LOCKDOWN_DEFAULT
> +       bool "Enable lockdown mode by default"
> +       default n

default n is redundant.  Please drop it.

> +       help
> +         Lockdown mode prevents attacks from a rogue dom0 userspace from
> +         compromising the system. This is automatically enabled when Secure
> +         Boot is enabled.

It's more than just rogue dom0 userspace.  But, are we using lockdown
mode for anything more than just cmdline filtering?

> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 8b63ca55f1..7280da987d 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -199,6 +200,8 @@ static int parse_params(const char *cmdline, const struct kernel_param *start,
>              printk("parameter \"%s\" unknown!\n", key);
>              final_rc = -EINVAL;
>          }
> +
> +        lockdown_clear_first_flag();

You're calling an __init function from a non-__init one.

I've submitted
https://lore.kernel.org/xen-devel/20250603125215.2716132-1-andrew.cooper3@citrix.com/T/#u
to fix it.

But honestly, given 3 function calls for trivial operations but with
complicated semantics, I'm not sure splitting out lockdown.c out of
kernel.c is a good move.

>      }
>  
>      return final_rc;
> @@ -216,6 +219,9 @@ static void __init _cmdline_parse(const char *cmdline)
>   */
>  void __init cmdline_parse(const char *cmdline)
>  {
> +    /* Call this early since it affects command-line parsing */
> +    lockdown_init(cmdline);
> +
>      if ( opt_builtin_cmdline[0] )
>      {
>          printk("Built-in command line: %s\n", opt_builtin_cmdline);

Even from just this hunk, the positioning looks suspicious.  Existing
UEFI-SB support in Xen relies on the builtin cmdline to provide
configuration, seeing as it ends up part of the signed whole.

Beyond that, I don't see what the fuss is over argument order.  The only
case where it matters is if Xen defaults to 0 and a user explicitly
wants to activate lockdown mode on the cmdline, at which point warning
them that their order of arguments was problematic is a) a problem in an
of itself, and b) unworkable when e.g. placeholder is in use.

> @@ -227,6 +233,7 @@ void __init cmdline_parse(const char *cmdline)
>          return;
>  
>      safe_strcpy(saved_cmdline, cmdline);
> +    lockdown_set_first_flag();
>      _cmdline_parse(cmdline);
>  #endif
>  }
> diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
> new file mode 100644
> index 0000000000..84eabe9c83
> --- /dev/null
> +++ b/xen/common/lockdown.c
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/efi.h>
> +#include <xen/lockdown.h>
> +#include <xen/param.h>
> +
> +#define FIRST_ARG_FLAG 2
> +
> +static int __ro_after_init lockdown = IS_ENABLED(CONFIG_LOCKDOWN_DEFAULT);
> +
> +void __init lockdown_set_first_flag(void)
> +{
> +    lockdown |= FIRST_ARG_FLAG;
> +}
> +
> +void __init lockdown_clear_first_flag(void)
> +{
> +    lockdown &= ~FIRST_ARG_FLAG;
> +}
> +
> +static int __init parse_lockdown_opt(const char *s)

You need a cf_check attribute too.  This only doesn't explode in XenRT
because it runs before activating CET, but it will fail in CI.

> +{
> +    if ( strncmp("no", s, 2) == 0 )
> +        if ( efi_secure_boot )
> +            printk("lockdown can't be disabled because Xen booted in Secure Boot mode\n");
> +        else
> +            lockdown = 0;

Braces please.  This is dangerously close to being a buggy expression.

> +    else
> +    {
> +        if ( !(lockdown & FIRST_ARG_FLAG) )
> +            printk("lockdown was not the first argument, unsafe arguments may have been already processed\n");
> +
> +        lockdown = 1;
> +    }
> +
> +    return 0;
> +}
> +custom_param("lockdown", parse_lockdown_opt);
> +
> +bool is_locked_down(void)
> +{
> +    return lockdown & ~FIRST_ARG_FLAG;
> +}
> +
> +void __init lockdown_init(const char *cmdline)
> +{
> +    if ( efi_secure_boot )
> +    {
> +        printk("Enabling lockdown mode because Secure Boot is enabled\n");
> +        lockdown = 1;
> +    }

This wants setting by init_secure_boot_mode().  Nothing good can come of
there being a window where efi_secure_boot is set but lockdown is not.

Why is there a cmdline parameter?  It doesn't appear to be used.

> +
> +    printk("Lockdown mode is %s\n", is_locked_down() ? "enabled" : "disabled");
> +}

~Andrew

