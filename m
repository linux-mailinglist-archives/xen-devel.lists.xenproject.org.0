Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5879329EE12
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 15:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14204.35260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8oz-00014r-Qg; Thu, 29 Oct 2020 14:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14204.35260; Thu, 29 Oct 2020 14:22:33 +0000
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
	id 1kY8oz-00014S-N1; Thu, 29 Oct 2020 14:22:33 +0000
Received: by outflank-mailman (input) for mailman id 14204;
 Thu, 29 Oct 2020 14:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY8oy-00014N-NW
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:22:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50c411da-509c-4194-af80-5dd487e357ed;
 Thu, 29 Oct 2020 14:22:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28BAFB92B;
 Thu, 29 Oct 2020 14:22:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY8oy-00014N-NW
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:22:32 +0000
X-Inumbo-ID: 50c411da-509c-4194-af80-5dd487e357ed
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 50c411da-509c-4194-af80-5dd487e357ed;
	Thu, 29 Oct 2020 14:22:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603981350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Eg2OQdAP9+U2/kwKuC4NxzO8O+jhIpACCQZnbvM87k=;
	b=hcBnDtyxEIULA2qIuFZp+BZH2H/JTRGgo4vS1EN0zWR8gnVkJUVfHL0CaFzCQwVjxyzMEs
	TCrOCMD49bcOcKo1sqKp/4nin5L6Mp0OfnEdTH0XvlCxZIKgz7dVHR4GZSHqKOC4tdGxJR
	2FfJrkvt2VBUqPjYm3En85sBXOZ/Ys4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 28BAFB92B;
	Thu, 29 Oct 2020 14:22:30 +0000 (UTC)
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201022143905.11032-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
Date: Thu, 29 Oct 2020 15:22:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201022143905.11032-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 16:39, Juergen Gross wrote:
> When the host crashes it would sometimes be nice to have additional
> debug data available which could be produced via debug keys, but
> halting the server for manual intervention might be impossible due to
> the need to reboot/kexec rather sooner than later.
> 
> Add support for automatic debug key actions in case of crashes which
> can be activated via boot- or runtime-parameter.

While I can certainly see this possibly being a useful thing in
certain situations, I'm uncertain it's going to be helpful in at
least a fair set of cases. What output to request very much
depends on the nature of the problem one is running into, and
the more keys one adds "just in case", the longer the reboot
latency, and the higher the risk (see also below) of the output
generation actually causing further problems.

IOW I'm neither fully convinced that we want this, nor fully
opposed.

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
> and <string> a sequence of debug key characters with '.' having the
> special semantics of a 1 second pause.

1 second is a whole lot of time. To get two successive sets
of data, a much shorter delay (if any) would normally suffice.

Also, while '.' may seem like a good choice right now, with the
shortage of characters we may want to put a real handler behind
it at come point. The one character that clearly won't make much
sense to use in this context is 'h', but that's awful as a (kind
of) separator. Could we perhaps replace 'h' by '?', freeing up
'h' and allowing '?' to be used for this purpose here?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -574,6 +574,29 @@ reduction of features at Xen's disposal to manage guests.
>  ### cpuinfo (x86)
>  > `= <boolean>`
>  
> +### crash-debug-debugkey
> +### crash-debug-hwdom
> +### crash-debug-kexeccmd
> +### crash-debug-panic
> +### crash-debug-watchdog
> +> `= <string>`
> +
> +> Can be modified at runtime
> +
> +Specify debug-key actions in cases of crashes. Each of the parameters applies
> +to a different crash reason. The `<string>` is a sequence of debug key
> +characters, with `.` having the special meaning of a 1 second pause.
> +
> +So e.g. `crash-debug-watchdog=0.0r` would dump dom0 state twice with a
> +second between the two state dumps, followed by the run queues of the
> +hypervisor, if the system crashes due to a watchdog timeout.
> +
> +These parameters should be used carefully, as e.g. specifying
> +`crash-debug-debugkey=C` would result in an endless loop. Depending on the
> +reason of the system crash it might happen that triggering some debug key
> +action will result in a hang instead of dumping data and then doing a
> +reboot or crash dump.

I think it would be useful if the flavors were (briefly)
explained: At the very least "debugkey" doesn't directly fit "in
cases of crashes", as there's no crash involved. kexec_crash()
instead gets invoked without there having been any crash.

You may also want to point out that this is a best effort thing
only - system state at the point of a crash may be such that the
attempt of handling one or the debug keys would have further bad
effects on the system, including that the actual kexec may then
never occur.

> @@ -507,6 +509,41 @@ void __init initialize_keytable(void)
>      }
>  }
>  
> +#define CRASHACTION_SIZE  32
> +static char crash_debug_panic[CRASHACTION_SIZE];
> +static char crash_debug_hwdom[CRASHACTION_SIZE];
> +static char crash_debug_watchdog[CRASHACTION_SIZE];
> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
> +static char crash_debug_debugkey[CRASHACTION_SIZE];
> +
> +static char *crash_action[CRASHREASON_N] = {
> +    [CRASHREASON_PANIC] = crash_debug_panic,
> +    [CRASHREASON_HWDOM] = crash_debug_hwdom,
> +    [CRASHREASON_WATCHDOG] = crash_debug_watchdog,
> +    [CRASHREASON_KEXECCMD] = crash_debug_kexeccmd,
> +    [CRASHREASON_DEBUGKEY] = crash_debug_debugkey,
> +};
> +
> +string_runtime_param("crash-debug-panic", crash_debug_panic);
> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);
> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);

In general I'm not in favor of this (or similar) needing
five new command line options, instead of just one. The problem
with e.g.

crash-debug=panic:rq,watchdog:0d

is that ',' (or any other separator chosen) could in principle
also be a debug key. It would still be possible to use

crash-debug=panic:rq crash-debug=watchdog:0d

though. Thoughts?

> +void keyhandler_crash_action(enum crash_reason reason)
> +{
> +    const char *action = crash_action[reason];
> +    struct cpu_user_regs *regs = get_irq_regs() ? : guest_cpu_user_regs();
> +
> +    while ( *action ) {

Misplaced brace.

> +        if ( *action == '.' )
> +            mdelay(1000);
> +        else
> +            handle_keypress(*action, regs);
> +        action++;
> +    }
> +}

I think only diagnostic keys should be permitted here.

> --- a/xen/include/xen/kexec.h
> +++ b/xen/include/xen/kexec.h
> @@ -1,6 +1,8 @@
>  #ifndef __XEN_KEXEC_H__
>  #define __XEN_KEXEC_H__
>  
> +#include <xen/keyhandler.h>

Could we go without this, utilizing the gcc extension of forward
declared enums? Otoh ...

> @@ -82,7 +84,11 @@ void vmcoreinfo_append_str(const char *fmt, ...)
>  #define kexecing 0
>  
>  static inline void kexec_early_calculations(void) {}
> -static inline void kexec_crash(void) {}
> +static inline void kexec_crash(enum crash_reason reason)
> +{
> +    keyhandler_crash_action(reason);
> +}

... if this is to be an inline function and not just a #define,
it'll need the declaration of the function to have been seen.

Jan

