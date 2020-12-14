Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A372D94B9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52006.90983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojy3-0003Ob-HR; Mon, 14 Dec 2020 09:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52006.90983; Mon, 14 Dec 2020 09:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojy3-0003OC-EA; Mon, 14 Dec 2020 09:16:31 +0000
Received: by outflank-mailman (input) for mailman id 52006;
 Mon, 14 Dec 2020 09:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kojy1-0003O6-NM
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:16:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e491a757-f6ee-48a3-b21b-d0b2d6d5f93a;
 Mon, 14 Dec 2020 09:16:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 235BAAC90;
 Mon, 14 Dec 2020 09:16:28 +0000 (UTC)
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
X-Inumbo-ID: e491a757-f6ee-48a3-b21b-d0b2d6d5f93a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607937388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUTLxvfNb2x61zLlroHHPCUhp4WT7na87ACH224Q9a8=;
	b=LkSAjiB6wvKctiXwWrMQU7J5DpUOq19WWCPX+ba0ihQajEqPAmCv9+ofpvcU0lKEoyAX2X
	7hCclX27wUQV4OiJgDYRceJ1rqFyDNOHmXYbkKOLcDde7M24be8k0k5z4n53rnhJpDWxCt
	iIVN8NiG4+rtI/5VDaGXyMvKKBF92mU=
Subject: Re: [PATCH v4 3/3] xen: add support for automatic debug key actions
 in case of crash
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1b33e7f-2dd8-9d44-62c9-86ec46d919fe@suse.com>
Date: Mon, 14 Dec 2020 10:16:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214075615.25038-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.12.2020 08:56, Juergen Gross wrote:
> @@ -519,6 +521,59 @@ void __init initialize_keytable(void)
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
> +#else
> +#define crash_debug_kexeccmd NULL
> +#endif
> +static char crash_debug_debugkey[CRASHACTION_SIZE];
> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);
> +
> +void keyhandler_crash_action(enum crash_reason reason)
> +{
> +    static const char *const crash_action[] = {
> +        [CRASHREASON_PANIC] = crash_debug_panic,
> +        [CRASHREASON_HWDOM] = crash_debug_hwdom,
> +        [CRASHREASON_WATCHDOG] = crash_debug_watchdog,
> +        [CRASHREASON_KEXECCMD] = crash_debug_kexeccmd,
> +        [CRASHREASON_DEBUGKEY] = crash_debug_debugkey,
> +    };
> +    static bool ignore;
> +    const char *action;
> +
> +    /* Some handlers are not functional too early. */
> +    if ( system_state < SYS_STATE_smp_boot )
> +        return;
> +
> +    /* Avoid recursion. */
> +    if ( ignore )
> +        return;
> +    ignore = true;
> +
> +    if ( (unsigned int)reason >= ARRAY_SIZE(crash_action) )
> +        return;
> +    action = crash_action[reason];
> +    if ( !action )
> +        return;

If we consider either of the last two "return"s to possibly be
taken, I think the "ignore" logic wants to live below them, not
above, avoiding no output at all when a recursive invocation
turns out to be a "good" one. Then, as before,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

