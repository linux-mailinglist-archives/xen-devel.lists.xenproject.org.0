Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971BD1CB0BA
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 15:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX3KU-0000Ft-OG; Fri, 08 May 2020 13:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX3KT-0000Fo-Fw
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:46:17 +0000
X-Inumbo-ID: 49739602-9132-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49739602-9132-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 13:46:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69E39AF0C;
 Fri,  8 May 2020 13:46:17 +0000 (UTC)
Subject: Re: [PATCH] x86/idle: prevent entering C6 with in service interrupts
 on Intel
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200507132236.26010-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d147b74-81dd-83b8-7035-67c5ceb72c5f@suse.com>
Date: Fri, 8 May 2020 15:46:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200507132236.26010-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 15:22, Roger Pau Monne wrote:
> Apply a workaround for Intel errata CLX30: "A Pending Fixed Interrupt
> May Be Dispatched Before an Interrupt of The Same Priority Completes".
> 
> It's not clear which models are affected, as the errata is listed in
> the "Second Generation Intel Xeon Scalable Processors" specification
> update, but the issue has been seen as far back as Nehalem processors.
> Apply the workaround to all Intel processors, the condition can be
> relaxed later.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  docs/misc/xen-command-line.pandoc |  8 ++++++++
>  xen/arch/x86/acpi/cpu_idle.c      | 22 +++++++++++++++++++++-
>  xen/arch/x86/cpu/mwait-idle.c     |  3 +++
>  xen/include/asm-x86/cpuidle.h     |  1 +
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index ee12b0f53f..6e868a2185 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -652,6 +652,14 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>  additionally a trace buffer of the specified size is allocated per cpu.
>  The debug trace feature is only enabled in debugging builds of Xen.
>  
> +### disable-c6-isr
> +> `= <boolean>`
> +
> +> Default: `true for Intel CPUs`
> +
> +Workaround for Intel errata CLX30. Prevent entering C6 idle states with in
> +service local APIC interrupts. Enabled by default for all Intel CPUs.
> +
>  ### dma_bits
>  > `= <integer>`
>  
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index b83446e77d..5023fea148 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -573,6 +573,25 @@ static bool errata_c6_eoi_workaround(void)
>      return (fix_needed && cpu_has_pending_apic_eoi());
>  }
>  
> +static int8_t __read_mostly disable_c6_isr = -1;
> +boolean_param("disable-c6-isr", disable_c6_isr);
> +
> +/*
> + * Errata CLX30: A Pending Fixed Interrupt May Be Dispatched Before an
> + * Interrupt of The Same Priority Completes.
> + *
> + * Prevent entering C6 if there are pending lapic interrupts, or else the
> + * processor might dispatch further pending interrupts before the first one has
> + * been completed.
> + */
> +bool errata_c6_isr_workaround(void)
> +{
> +    if ( unlikely(disable_c6_isr == -1) )
> +        disable_c6_isr = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
> +
> +    return disable_c6_isr && cpu_has_pending_apic_eoi();

This check being the same as in errata_c6_eoi_workaround(),
why don't you simply extend that function? (See also below.)
Also both variable and command line option descriptor could
go inside the function, to limit their scopes.

> @@ -676,7 +695,8 @@ static void acpi_processor_idle(void)
>          return;
>      }
>  
> -    if ( (cx->type == ACPI_STATE_C3) && errata_c6_eoi_workaround() )
> +    if ( (cx->type == ACPI_STATE_C3) &&
> +         (errata_c6_eoi_workaround() || errata_c6_isr_workaround()) )
>          cx = power->safe_state;

I realize you only add to existing code, but I'm afraid this
existing code cannot be safely added to. Already prior to
your change there was a curious mismatch of C3 and c6 on this
line, and I don't see how ACPI_STATE_C3 correlates with
"core C6" state. Now this may have been the convention for
Nehalem/Westmere systems, but already the mwait-idle entries
for these CPU models have 4 entries (albeit such that they
match this scheme). As a result I think this at the very
least needs to be >=, not ==, even more so now that you want
to cover all Intel CPUs.

Obviously (I think) it is a mistake that mwait-idle doesn't
also activate this workaround, which imo is another reason to
stick to just errata_c6_eoi_workaround().

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -770,6 +770,9 @@ static void mwait_idle(void)
>  		return;
>  	}
>  
> +	if (cx->type == ACPI_STATE_C3 && errata_c6_isr_workaround())
> +		cx = power->safe_state;

Here it becomes even more relevant I think that == not be
used, as the static tables list deeper C-states; it's just
that the SKX table, which also gets used for CLX afaict, has
no entries beyond C6-SKX. Others with deeper ones presumably
have the deeper C-states similarly affected (or not) by this
erratum.

For reference, mwait_idle_cpu_init() has

		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
		state = MWAIT_HINT2CSTATE(hint) + 1;
                ...
		cx->type = state;

i.e. the value you compare against is derived from the static
table entries. For Nehalem/Westmere this means that what goes
under ACPI_STATE_C3 is indeed C6-NHM, and this looks to match
for all the non-Atoms, but for none of the Atoms. Now Atoms
could easily be unaffected, but (just to take an example) if
C6-SNB was affected, surely C7-SNB would be, too.

Jan

