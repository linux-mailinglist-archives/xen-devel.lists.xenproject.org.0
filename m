Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF11ABB5B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 10:36:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOzzv-0007cu-C7; Thu, 16 Apr 2020 08:35:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOzzu-0007co-94
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:35:46 +0000
X-Inumbo-ID: 43b92f28-7fbd-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43b92f28-7fbd-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 08:35:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A635CAC4D;
 Thu, 16 Apr 2020 08:35:43 +0000 (UTC)
Subject: Re: [PATCH] x86/boot: Fix early exception handling with
 CONFIG_PERF_COUNTERS
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200415173911.13286-1-andrew.cooper3@citrix.com>
 <72b35bfa-e795-72c0-d925-924ca18711df@suse.com>
 <4c418f62-14b5-1f77-9bf3-979b5d1f56d9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88658e82-e38a-6230-e6ab-7cfd00e4f19f@suse.com>
Date: Thu, 16 Apr 2020 10:35:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4c418f62-14b5-1f77-9bf3-979b5d1f56d9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 10:19, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -679,7 +679,11 @@ handle_exception_saved:
>  1:      movq  %rsp,%rdi
>          movzbl UREGS_entry_vector(%rsp),%eax
>          leaq  exception_table(%rip),%rdx
> -        PERFC_INCR(exceptions, %rax, %rbx)
> +#ifdef CONFIG_PERF_COUNTERS
> +        lea   per_cpu__perfcounters(%rip), %rdi
> +        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rdi
> +        incl  ASM_PERFC_exceptions * 4(%rdi, %rax, 4)
> +#endif
>          mov   (%rdx, %rax, 8), %rdx
>          INDIRECT_CALL %rdx
>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
> 
> 
> If you're happy with that?

I'm afraid I'm not - you can't use %rdi here, it already holds the
called function's argument. I'd be fine with %rcx used instead.

Jan

