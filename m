Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016861C3C73
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 16:11:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVbnb-00012z-8o; Mon, 04 May 2020 14:10:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVbna-00012t-2S
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 14:10:22 +0000
X-Inumbo-ID: fd466a12-8e10-11ea-9d24-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd466a12-8e10-11ea-9d24-12813bfff9fa;
 Mon, 04 May 2020 14:10:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E40A7AC6C;
 Mon,  4 May 2020 14:10:21 +0000 (UTC)
Subject: Re: [PATCH 06/16] x86/traps: Implement #CP handler and extend #PF for
 shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <561914ce-d076-8f1a-e74b-7c37567480a1@suse.com>
Date: Mon, 4 May 2020 16:10:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> @@ -1457,6 +1451,10 @@ void do_page_fault(struct cpu_user_regs *regs)
>      {
>          enum pf_type pf_type = spurious_page_fault(addr, regs);
>  
> +        /* Any fault on a shadow stack access is a bug in Xen. */
> +        if ( error_code & PFEC_shstk )
> +            goto fatal;

Not going through the full spurious_page_fault() in this case
would seem desirable, as would be at least a respective
adjustment to __page_fault_type(). Perhaps such an adjustment
could then avoid the change (and the need for goto) here?

> @@ -1906,6 +1905,43 @@ void do_debug(struct cpu_user_regs *regs)
>      pv_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
>  }
>  
> +void do_entry_CP(struct cpu_user_regs *regs)

If there's a plan to change other exception handlers to this naming
scheme too, I can live with the intermediate inconsistency.
Otherwise, though, I'd prefer a name closer to what other handlers
use, e.g. do_control_prot(). Same for the asm entry point then.

> @@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
>          entrypoint 1b
>  
>          /* Reserved exceptions, heading towards do_reserved_trap(). */
> -        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
> +        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || \
> +                vec == TRAP_virtualisation || (vec > X86_EXC_CP && vec < TRAP_nr)

Use the shorter X86_EXC_VE here, since you don't want/need to
retain what was there before? (I'd be fine with you changing
the two other TRAP_* too at this occasion.)

> --- a/xen/include/asm-x86/processor.h
> +++ b/xen/include/asm-x86/processor.h
> @@ -68,6 +68,7 @@
>  #define PFEC_reserved_bit   (_AC(1,U) << 3)
>  #define PFEC_insn_fetch     (_AC(1,U) << 4)
>  #define PFEC_prot_key       (_AC(1,U) << 5)
> +#define PFEC_shstk         (_AC(1,U) << 6)

One too few padding blanks?

Jan

