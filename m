Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BFD9EE6BD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855993.1268759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLiJa-00044j-MI; Thu, 12 Dec 2024 12:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855993.1268759; Thu, 12 Dec 2024 12:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLiJa-00042E-Iy; Thu, 12 Dec 2024 12:29:10 +0000
Received: by outflank-mailman (input) for mailman id 855993;
 Thu, 12 Dec 2024 12:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLiJZ-000428-TF
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:29:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0b09f7-b884-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 13:29:08 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso679411a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:29:08 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ec8ef816sm6784363a12.59.2024.12.12.04.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:29:07 -0800 (PST)
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
X-Inumbo-ID: af0b09f7-b884-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734006548; x=1734611348; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BdtAM5a0jtp+NJMY45ybX9EcbJQMLM5aL0o0xw5Fk0g=;
        b=fVL/afH9A1kDXhjNSti9lqlUZnOiQVw5pf7lx0ENd++J7uHzxUcuIRb05kVB4VT6tV
         f0K6cPloeKtdLRlNi94r5Kn5CykwM1PmJvGQzTo/11Gu6q5O98JRl2r/XEju5b/+K7kp
         cFPhRduzEJZaifNMrIaD6vaUmTA+vbzh657w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734006548; x=1734611348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdtAM5a0jtp+NJMY45ybX9EcbJQMLM5aL0o0xw5Fk0g=;
        b=ot+N1G5RcDzQUPhQtXDquPW9Kv0vkluKU7s/HkHnJt8zcpjE8q7hoQ9SK/42RFm0nz
         +cvlvlXk5+g+OHHnWsPZ7ikrB98OO67pEGvru6vYQm8AyQQMzQxX7tv/8Tz/6/oonKS8
         TF4jjW1FO0fJxL9W7gN2J4f/dfCQl4kLJbdozCtsNk8sMWjc4asPD6TmI4xVZjoRoraw
         5Y/WbdK4gkgvTU/rlXl+TBCt4Df0tQ2q0W2iweLJFjlSJlUyH3x4iB2PCkEzQ4m72EYO
         tPic8DpTCnbN3HawDKG3g3yN5qZimLD8nKcooku8qmM0r7dNmw3d22j8ulvxTG7DGoZa
         +aFw==
X-Gm-Message-State: AOJu0YxOAHDz3OYgv8TUq+iw7r5a4URZAsBh0jPZnMnDh1Q8/UwSiev0
	gDNR5yQkBG2jR2letex0VLns/2rt+qF21XDw19Tq3/ZLv9I6IgcP15RZqDLbZCarNDFhFl00pGO
	R
X-Gm-Gg: ASbGncu4tJ4SgWXuJXbCVuKsWP/4sHs3g15TiUX9Zx/KaQMTowL9xkxnM7Y0DmYOR3t
	41wPCs9S1FYUv3HM295zYmwyuAHjHlB/w9QttMfvFWmSFfJG6OCi7xFP0hOja3wl6YJc+3s8Y6X
	ej2w0Zbed+KpNy/6LfwsPwITdd0BF1TboE9axhuWa2epi46KrJPz7Ev0c9829N0TDW4hIR/+2Ah
	1cnYRlp44A2zmjUm9aD6tZZxzzFWvQCOhNvtTjJGEilO7sUaPW56WsIyF2uSJL9+g==
X-Google-Smtp-Source: AGHT+IHj2y0jWvbWEy51Hc3hZIJr+pfTdYN1K2U6JlgTdDfO77r4owG8ZVFsgIokvO7fDeUnJ46mRw==
X-Received: by 2002:a05:6402:2807:b0:5d4:4143:c082 with SMTP id 4fb4d7f45d1cf-5d6337dffb8mr51558a12.21.1734006547857;
        Thu, 12 Dec 2024 04:29:07 -0800 (PST)
Date: Thu, 12 Dec 2024 13:29:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 24/35] xen/console: introduce hwdom_crashconsole=
Message-ID: <Z1rXEtHPjjjEPKw3@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-24-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-24-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:54PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> The new command line switch `hwdom_crashconsole=BOOL` allows to switch serial
> console input focus to xen for machine state inspection using keyhandler
> mechanism after the hardware domain crashes.
> 
> The new command line switch is aliased via `dom0=...,crashconsole` knob.
> 
> Such functionality can be useful while debugging dom0 bringup.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  docs/misc/xen-command-line.pandoc |  5 +++++
>  xen/arch/x86/dom0_build.c         |  2 ++
>  xen/common/domain.c               | 14 +++++++++++++-
>  xen/include/xen/domain.h          |  1 +
>  4 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 293dbc1a957ba6e668fd4d55d58e84f643822126..fb77d7dca1ea517f79d6713aa6909422f31e7724 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -806,6 +806,7 @@ Specify the bit width of the DMA heap.
>  
>  ### dom0
>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> +                crashconsole=<bool>,
>                  cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
>  
>      = List of [ sve=<integer> ] (Arm64)
> @@ -839,6 +840,10 @@ Controls for how dom0 is constructed on x86 systems.
>      information during the dom0 build.  It defaults to the compile time choice
>      of `CONFIG_VERBOSE_DEBUG`.
>  
> +*   The `crashconsole` boolean instructs Xen to drop into emergency console
> +    in case of dom0 crash. May be useful for dom0 bringup on a custom

I think the 'a' is unneeded -> "on custom hardware."

I think however this would be clearer as:

"The `crashconsole` boolean instructs Xen to switch input console
focus to the hypervisor when dom0 shuts down and avoid performing
dom0 domain destruction.  Should only be used for debugging
purposes."

It's IMO not clear what "instructs Xen to drop into emergency console"
implies for Xen.

> +    hardware.
> +
>  *   The `cpuid-faulting` boolean is an interim option, is only applicable to
>      PV dom0, and defaults to true.
>  
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index e8f5bf5447bc47a6daa3d95787106a4c11e80d31..706aeec0ecbb565a415edbfb33ca2fd72967c560 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -286,6 +286,8 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>          opt_dom0_cpuid_faulting = val;
>      else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
>          opt_dom0_msr_relaxed = val;
> +    else if ( (val = parse_boolean("crashconsole", s, e)) >= 0 )
> +        opt_hwdom_crashconsole = !!val;
>      else
>          return -EINVAL;
>  
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index aab546c0a8535e4f007cbbc9c5c552bcf66b5807..4fe69f294158dda7b2e0b9d98d49c34e04131cb8 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -56,6 +56,13 @@ unsigned int xen_processor_pmbits = XEN_PROCESSOR_PM_PX;
>  bool opt_dom0_vcpus_pin;
>  boolean_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
>  
> +/*
> + * Hardware domain crash handler: if true, do not halt machine, but switch to
> + * Xen console for debugging.
> + */
> +bool opt_hwdom_crashconsole;

__ro_after_init.

> +boolean_param("hwdom_crashconsole", opt_hwdom_crashconsole);

This option doesn't seem to be documented at all in
xen-command-line.pandoc?

> +
>  /* Protect updates/reads (resp.) of domain_list and domain_hash. */
>  DEFINE_SPINLOCK(domlist_update_lock);
>  DEFINE_RCU_READ_LOCK(domlist_read_lock);
> @@ -1138,7 +1145,12 @@ int domain_shutdown(struct domain *d, u8 reason)
>      reason = d->shutdown_code;
>  
>      if ( is_hardware_domain(d) )
> -        hwdom_shutdown(reason);
> +    {
> +        if ( opt_hwdom_crashconsole )
> +            console_set_owner(DOMID_XEN);

Don't you need to pause all domain vCPUs and return early here to
avoid executing the rest of the function, that will likely destroy the
domain?

Maybe there's something I'm missing that prevents the hardware domain
destruction.

Thanks, Roger.

