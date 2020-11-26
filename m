Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8A2C52D6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 12:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38437.71182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiFKB-000386-Ha; Thu, 26 Nov 2020 11:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38437.71182; Thu, 26 Nov 2020 11:20:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiFKB-00037h-Dq; Thu, 26 Nov 2020 11:20:31 +0000
Received: by outflank-mailman (input) for mailman id 38437;
 Thu, 26 Nov 2020 11:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EevG=FA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kiFKA-00037Z-IT
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 11:20:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79368db0-8bd5-4416-aac3-fbf7b067b746;
 Thu, 26 Nov 2020 11:20:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2846AE38;
 Thu, 26 Nov 2020 11:20:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EevG=FA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kiFKA-00037Z-IT
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 11:20:30 +0000
X-Inumbo-ID: 79368db0-8bd5-4416-aac3-fbf7b067b746
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79368db0-8bd5-4416-aac3-fbf7b067b746;
	Thu, 26 Nov 2020 11:20:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606389628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2HO8W78++dtjOUhVV1AqKnxQOikqYpyyy/sH+7IWvtA=;
	b=WsA9+GcRhpaGcy9SE5oQ8AJ3D5hkmWFJ3mSmHyw6WOe6GvGKtgbF7xcMxXR8VcbnqRmptj
	Zca971FxbKOjopOHH1psruq4pqq+EU0UiF++Mf/sdi55qFcOCwiIRJCfsvQhS2G4e6jPfa
	PmQ3bo3Omwz3+WpEZjb7YI2+wX1dQgk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A2846AE38;
	Thu, 26 Nov 2020 11:20:28 +0000 (UTC)
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20201126080340.6154-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
Date: Thu, 26 Nov 2020 12:20:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201126080340.6154-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.11.2020 09:03, Juergen Gross wrote:
> When the host crashes it would sometimes be nice to have additional
> debug data available which could be produced via debug keys, but
> halting the server for manual intervention might be impossible due to
> the need to reboot/kexec rather sooner than later.
> 
> Add support for automatic debug key actions in case of crashes which
> can be activated via boot- or runtime-parameter.
> 
> Depending on the type of crash the desired data might be different, so
> support different settings for the possible types of crashes.
> 
> The parameter is "crash-debug" with the following syntax:
> 
>   crash-debug-<type>=<string>
> 
> with <type> being one of:
> 
>   panic, hwdom, watchdog, kexeccmd, debugkey
> 
> and <string> a sequence of debug key characters with '+' having the
> special semantics of a 10 millisecond pause.
> 
> So "crash-debug-watchdog=0+0qr" would result in special output in case
> of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,
> domain info, run queues).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - switched special character '.' to '+' (Jan Beulich)
> - 10 ms instead of 1 s pause (Jan Beulich)
> - added more text to the boot parameter description (Jan Beulich)
> 
> V3:
> - added const (Jan Beulich)
> - thorough test of crash reason parameter (Jan Beulich)
> - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
> - added dummy get_irq_regs() helper on Arm
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Except for the Arm aspect, where I'm not sure using
guest_cpu_user_regs() is correct in all cases,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless ...

> @@ -507,6 +509,50 @@ void __init initialize_keytable(void)
>      }
>  }
>  
> +#define CRASHACTION_SIZE  32
> +static char crash_debug_panic[CRASHACTION_SIZE];
> +string_runtime_param("crash-debug-panic", crash_debug_panic);
> +static char crash_debug_hwdom[CRASHACTION_SIZE];
> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
> +static char crash_debug_watchdog[CRASHACTION_SIZE];
> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
> +#ifdef CONFIG_KEXEC
> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);
> +#endif

... to limit #ifdef-ary I'd have suggested to put

#else
# define crash_debug_kexeccmd NULL

right above here and ...

> +void keyhandler_crash_action(enum crash_reason reason)
> +{
> +    static const char *const crash_action[CRASHREASON_N] = {
> +        [CRASHREASON_PANIC] = crash_debug_panic,
> +        [CRASHREASON_HWDOM] = crash_debug_hwdom,
> +        [CRASHREASON_WATCHDOG] = crash_debug_watchdog,
> +#ifdef CONFIG_KEXEC
> +        [CRASHREASON_KEXECCMD] = crash_debug_kexeccmd,
> +#endif
> +        [CRASHREASON_DEBUGKEY] = crash_debug_debugkey,
> +    };
> +    const char *action;
> +    struct cpu_user_regs *regs = get_irq_regs() ? : guest_cpu_user_regs();
> +
> +    if ( (unsigned int)reason >= CRASHREASON_N )

... I'd have preferred ARRAY_SIZE() here, at which point the
array dimension also wouldn't need explicitly specifying.

Jan

