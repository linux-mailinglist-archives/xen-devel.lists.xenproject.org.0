Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE53ADF3AC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 19:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019361.1396152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRwXz-0003Ij-R3; Wed, 18 Jun 2025 17:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019361.1396152; Wed, 18 Jun 2025 17:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRwXz-0003Go-N4; Wed, 18 Jun 2025 17:26:03 +0000
Received: by outflank-mailman (input) for mailman id 1019361;
 Wed, 18 Jun 2025 17:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKfJ=ZB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRwXy-0003Gi-25
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 17:26:02 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cab4700-4c69-11f0-a30b-13f23c93f187;
 Wed, 18 Jun 2025 19:25:59 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54836cb7fso5149062f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 10:25:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4535ebd02basm3056645e9.39.2025.06.18.10.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 10:25:58 -0700 (PDT)
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
X-Inumbo-ID: 4cab4700-4c69-11f0-a30b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750267558; x=1750872358; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDgkxMYDVJTHvv5S/2KrkrBS+SQ+ZpLwE3G2lAfMf9A=;
        b=Bzp3sfhR6vZWeBtAJIQ84WfUj+HoAloWNq5Q2vybaCHEKoJAI74yo8bL90UuszxPBm
         XO+Kk5MFrSSTQ8qeXl53Ib9t+JP686rR+HnZ73BEpk3Je1QDvrQmxDj2Aruivz3XpEvA
         texQZnhJef0yRaQdGCcAej7jwJ0OllouIekqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267558; x=1750872358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDgkxMYDVJTHvv5S/2KrkrBS+SQ+ZpLwE3G2lAfMf9A=;
        b=qZDIuVCIKK/f2Sj3TLnpmN1RCQTggz1mhbZD03KC4XbUdCG/fsFKQ3UKwN9pZbgBr5
         EGRFz/YCVcMxhvU9qIXmmqWZ7ddHAazea8XtazYihiUf9TNSX1Xiicc8/ry2rGKNtjOk
         7Qz/J42DKRTzWwiSWPEX0Uio6E5Lq5EaWy5KPASW3R8ljPZ+4yFlH21m0vQ+SB+01eZu
         D4y38Q9vsQjnzJWPDfqAZDkr8ylkYYNjjIX/2KhtHU4w7T5Tw1BLo0Af8pb30PdyPHIU
         N52xrIcb0KXE1P8nCWTALEX6GHKwYxkWl1uC+UE/G+TcmuWeYH/4xDXdLTihhyDu4gv6
         LbNw==
X-Forwarded-Encrypted: i=1; AJvYcCXgg5lKoWTry9TpMPYW9vb5R/l943GrkklssZAJNchv30Hv5G8R33Zc90w1+vfWw0V7C1hX0k6OG68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhOavvrlHZysLz+sVaUxvumcn2Ct5RnsjuhxvpPNec0FumyGqF
	Zil3/blUUu4TspZBJMpFNwkuACkmj29zzIkLnFXlA0YxRtN8X4U7tyvpOjtbexlqOfk=
X-Gm-Gg: ASbGncvMYvTl4a+VrdLcS1NimNPY5jFwV441RynjcHl2V9rAs7dZfu6jaLd3qTHR3Mz
	enxmIIKI3xZLSm7/jkDXW4RJOPLoPwVQXOLQIxBQ23zrCHEyiEVOfZNLxkzLZMaFGb0jw7gu55t
	Ad7tte4Au0NKBRUGf0WhX/ULt7ovmE8d6HHzxMxDksN9GZZYqaikkF9S9mLfQjz5lRJopQ0b9RU
	UBpYqt22IfY1VpheJ2dlqi4VotegerBvBOwR0afANEr/odW7I1NBs+rALBo5hWvwpuGal/gM0Yb
	CmQC+GHB4cOwKhMicrP8vgKQdH4MAKxZLfv2R570PtEWa4JSLibV1qm7IEUFPMtlNBSsWf4QQCR
	qezk7psWcO5ekc6TxmRvbF8K9sX7zJg+l5Qc=
X-Google-Smtp-Source: AGHT+IGJ2YL/u884wzR9OEfA/yUI8w1O0IM1F/GdgDMFeLDeq0CD8pqh/OfIkjCGIkvew/ukZO0kOg==
X-Received: by 2002:a05:6000:4006:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a572367967mr17101692f8f.2.1750267558472;
        Wed, 18 Jun 2025 10:25:58 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:25:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 3/3] xen/x86: add missing noreturn attributes
Message-ID: <aFL2pVgOryqhnnYh@macbook.local>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
 <20250606212712.1901838-2-victorm.lira@amd.com>
 <20250606212712.1901838-3-victorm.lira@amd.com>
 <aFLYtSgt5b4lQwgv@macbook.local>
 <220ccb5869914c44cc2b1f7a152ee933@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <220ccb5869914c44cc2b1f7a152ee933@bugseng.com>

On Wed, Jun 18, 2025 at 06:16:30PM +0200, Nicola Vetrini wrote:
> On 2025-06-18 17:18, Roger Pau Monné wrote:
> > On Fri, Jun 06, 2025 at 02:27:09PM -0700, victorm.lira@amd.com wrote:
> > > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > 
> > > The marked functions never return to their caller, but lack the
> > > `noreturn' attribute.
> > > 
> > > Functions that never return should be declared with a `noreturn'
> > > attribute.
> > > 
> > > The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
> > > currently accepted in Xen), and also Rule 2.1: "A project shall not
> > > contain unreachable code". Depending on the compiler used and the
> > > compiler optimization used, the lack of `noreturn' might lead to the
> > > presence of unreachable code.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > One question below.
> > 
> > > ---
> > > Changes in v2:
> > > - improved commit message
> > > ---
> > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Cc: Anthony PERARD <anthony.perard@vates.tech>
> > > Cc: Michal Orzel <michal.orzel@amd.com>
> > > Cc: Jan Beulich <jbeulich@suse.com>
> > > Cc: Julien Grall <julien@xen.org>
> > > Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
> > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > Cc: Federico Serafini <federico.serafini@bugseng.com>
> > > Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> > > ---
> > >  xen/arch/x86/cpu/mcheck/mce.c | 3 ++-
> > >  xen/arch/x86/efi/efi-boot.h   | 2 +-
> > >  xen/arch/x86/smp.c            | 2 +-
> > >  xen/arch/x86/traps.c          | 2 +-
> > >  xen/arch/x86/x86_64/traps.c   | 2 +-
> > >  5 files changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/cpu/mcheck/mce.c
> > > b/xen/arch/x86/cpu/mcheck/mce.c
> > > index 1c348e557d..79214ce56b 100644
> > > --- a/xen/arch/x86/cpu/mcheck/mce.c
> > > +++ b/xen/arch/x86/cpu/mcheck/mce.c
> > > @@ -79,7 +79,8 @@ static int __init cf_check mce_set_verbosity(const
> > > char *str)
> > >  custom_param("mce_verbosity", mce_set_verbosity);
> > > 
> > >  /* Handle unconfigured int18 (should never happen) */
> > > -static void cf_check unexpected_machine_check(const struct
> > > cpu_user_regs *regs)
> > > +static void noreturn cf_check
> > > +unexpected_machine_check(const struct cpu_user_regs *regs)
> > >  {
> > >      console_force_unlock();
> > >      printk("Unexpected Machine Check Exception\n");
> > > diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> > > index 0ecf4ca53f..0194720003 100644
> > > --- a/xen/arch/x86/efi/efi-boot.h
> > > +++ b/xen/arch/x86/efi/efi-boot.h
> > > @@ -769,7 +769,7 @@ static void __init efi_arch_blexit(void)
> > >          efi_bs->FreePages(ucode.addr, PFN_UP(ucode.size));
> > >  }
> > > 
> > > -static void __init efi_arch_halt(void)
> > > +static void noreturn __init efi_arch_halt(void)
> > >  {
> > >      local_irq_disable();
> > >      for ( ; ; )
> > > diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> > > index 516dab5528..7936294f5f 100644
> > > --- a/xen/arch/x86/smp.c
> > > +++ b/xen/arch/x86/smp.c
> > > @@ -343,7 +343,7 @@ void __stop_this_cpu(void)
> > >      cpumask_clear_cpu(smp_processor_id(), &cpu_online_map);
> > >  }
> > > 
> > > -static void cf_check stop_this_cpu(void *dummy)
> > > +static void noreturn cf_check stop_this_cpu(void *dummy)
> > >  {
> > >      const bool *stop_aps = dummy;
> > > 
> > > diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> > > index 092c7e4197..34dc077cad 100644
> > > --- a/xen/arch/x86/traps.c
> > > +++ b/xen/arch/x86/traps.c
> > > @@ -805,7 +805,7 @@ void fatal_trap(const struct cpu_user_regs
> > > *regs, bool show_remote)
> > >            (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT
> > > CONTEXT");
> > >  }
> > > 
> > > -void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
> > > +void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs
> > > *regs)
> > >  {
> > >      fatal_trap(regs, false);
> > >  }
> > > diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
> > > index c77f304bb0..8460a4a1ae 100644
> > > --- a/xen/arch/x86/x86_64/traps.c
> > > +++ b/xen/arch/x86/x86_64/traps.c
> > > @@ -293,7 +293,7 @@ void show_page_walk(unsigned long addr)
> > >             l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
> > >  }
> > > 
> > > -void asmlinkage do_double_fault(struct cpu_user_regs *regs)
> > > +void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
> > 
> > Does noreturn matter for functions called from assembly (asmlinkage
> > ones)?  In that case the hint is not useful for code generation, since
> > it's hand written assembly already?  (it's arguably useful for the
> > developer writing the code)
> > 
> > Might be worth mentioning in the commit message if the above is
> > accurate.  For example by adding to the commit message: "noreturn is
> > not relevant for functions called from assembly, but can be used as a
> > hint for the developers writing the code".
> > 
> 
> Yes, it is relevant because the rule considers only the single function, not
> the context where it is called (that is orders of magnitude more difficult
> to check automatically). For my part, I'm ok with your suggestion.

Thanks, so if my understanding is correct the usage of the noreturn
attribute together with asmlinkage is only for the benefit of the
analysis tools, as from a code generation perspective it makes no
difference.

Roger.

