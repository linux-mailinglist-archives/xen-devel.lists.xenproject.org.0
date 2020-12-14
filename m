Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F093B2D9644
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52101.91165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kol1o-00030z-GH; Mon, 14 Dec 2020 10:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52101.91165; Mon, 14 Dec 2020 10:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kol1o-00030a-Cz; Mon, 14 Dec 2020 10:24:28 +0000
Received: by outflank-mailman (input) for mailman id 52101;
 Mon, 14 Dec 2020 10:24:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kol1n-00030V-Hy
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:24:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kol1l-0002y2-GG; Mon, 14 Dec 2020 10:24:25 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kol1l-0005xh-6X; Mon, 14 Dec 2020 10:24:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=kUF7z5Be0I5ppXEQuBWcHR5q6dAPx7UEU72KWXIwxGY=; b=bbHy+Xn/PbzVrw4aB+CtVmZD9W
	9teNFFKO1TiNXiB4gOvEIuhaf8snjhp/53yJKc7LrWpPpFUiV0ceDoIr+LE1zMJpefWBvypfyP9JL
	flysVVb4sr2xY5u8En65l6EosXKCtfsPsmAcRw16jf4Ole9G5lIM1Z1YcvHdNY5u1zYw=;
Subject: Re: [PATCH v4 3/3] xen: add support for automatic debug key actions
 in case of crash
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8dc62a3f-db2d-51b9-1264-28af3a13052d@xen.org>
Date: Mon, 14 Dec 2020 10:24:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214075615.25038-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/12/2020 07:56, Juergen Gross wrote:
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index de120fa092..806355ed8b 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -3,7 +3,9 @@
>    */
>   
>   #include <asm/regs.h>
> +#include <xen/delay.h>
>   #include <xen/keyhandler.h>
> +#include <xen/param.h>
>   #include <xen/shutdown.h>
>   #include <xen/event.h>
>   #include <xen/console.h>
> @@ -519,6 +521,59 @@ void __init initialize_keytable(void)
>       }
>   }
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

Can you explain in the commit message why this is necessary (An example 
would be useful)?

Cheers,

-- 
Julien Grall

