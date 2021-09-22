Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98A4141CE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192139.342423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSviM-0000Ci-PD; Wed, 22 Sep 2021 06:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192139.342423; Wed, 22 Sep 2021 06:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSviM-00009p-Ld; Wed, 22 Sep 2021 06:26:42 +0000
Received: by outflank-mailman (input) for mailman id 192139;
 Wed, 22 Sep 2021 06:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSviK-00009c-HR
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:26:40 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 24565a95-85ae-4b3d-8836-86931cd91348;
 Wed, 22 Sep 2021 06:26:39 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-KQBiaRewM4miRd-zf4XPGA-1; Wed, 22 Sep 2021 02:26:36 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso1156199wrn.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:26:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm1326977wrx.81.2021.09.21.23.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:26:34 -0700 (PDT)
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
X-Inumbo-ID: 24565a95-85ae-4b3d-8836-86931cd91348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632291999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBiMg3FiniiEqjDXbzG5q84o5gFLCF2xYeMjdShm8Ns=;
	b=F2V3P24BT/xxBY6gNs2FwObv3qICDLKFVDwLtkMWRgVqHQCXyHQZNxz4grHhVpiuK2GGqU
	mYK7DgwsnvZnRgerMWzzX3XIMfn++KwHA2vPlvdxJ19fcP/5JskDxzYDieHG4NGbzYsrwP
	xm8w6shYOCDWmHycydwTtK/1xzi/swA=
X-MC-Unique: KQBiaRewM4miRd-zf4XPGA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MBiMg3FiniiEqjDXbzG5q84o5gFLCF2xYeMjdShm8Ns=;
        b=dZYOxr36q9SQAa0TolaaMoOL2g8y4TqG3dD61RT+///aRAiCz8vWznaPhr1c3d2o6D
         N89/UzKjVg7UrCqfyNxxXwkahyHpo/8zCt1fJOjJRwiM6UqxzG5ezicD15b16X5LNnW5
         jzUhvmXGosRHkeSi7t05kF7CrV2HHHB2mEobq0QxTK8SFHWAS6WHnjtRzCb+nnIyojXj
         T3k2ePJQVO9ga0kd5+56WGwGM1pUx3jI9Sse7d5quIfDru3z93wBJSkjvoftwwghP1Vd
         wpL5qnA5CkAdN+G6JToO7I2p4itopsS3sfvaoigBXAzSO899D+Ef19Ym4t2lGE2s8TjY
         23vA==
X-Gm-Message-State: AOAM532Tzm3laVnT6JWWZhBJ5nDD0NSEAGCj3rALCXjfP36ZMgbtoYbU
	gikbjPAj2R0ntrtkMpDH8VBsR11P5bIlM4lM8s8gD8vDFuL41QgUkbz9jxYqWj/nTXlFARXEa44
	sZuxY2XEN45W0n5C1BqPsMAUiB04=
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr39082840wru.243.1632291995509;
        Tue, 21 Sep 2021 23:26:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl20akxP3NXahRl1WcHnQKmZ1IfpNcPRYFb7QcuxtqBG6hCoEWyeXUt8EoPViJOjXQwzqFiA==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr39082789wru.243.1632291995216;
        Tue, 21 Sep 2021 23:26:35 -0700 (PDT)
Subject: Re: [PATCH v3 05/16] perf: Drop dead and useless guest "support" from
 arm, csky, nds32 and riscv
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-6-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2462bc44-64a5-8bac-7c3c-d837c4b3f743@redhat.com>
Date: Wed, 22 Sep 2021 08:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-6-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> Drop "support" for guest callbacks from architctures that don't implement
> the guest callbacks.  Future patches will convert the callbacks to
> static_call; rather than churn a bunch of arch code (that was presumably
> copy+pasted from x86), remove it wholesale as it's useless and at best
> wasting cycles.
> 
> A future patch will also add a Kconfig to force architcture to opt into
> the callbacks to make it more difficult for uses "support" to sneak in in
> the future.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm/kernel/perf_callchain.c   | 33 ++++-------------------------
>   arch/csky/kernel/perf_callchain.c  | 12 -----------
>   arch/nds32/kernel/perf_event_cpu.c | 34 ++++--------------------------
>   arch/riscv/kernel/perf_callchain.c | 13 ------------
>   4 files changed, 8 insertions(+), 84 deletions(-)
> 
> diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
> index 1626dfc6f6ce..bc6b246ab55e 100644
> --- a/arch/arm/kernel/perf_callchain.c
> +++ b/arch/arm/kernel/perf_callchain.c
> @@ -62,14 +62,8 @@ user_backtrace(struct frame_tail __user *tail,
>   void
>   perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct frame_tail __user *tail;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
> -
>   	perf_callchain_store(entry, regs->ARM_pc);
>   
>   	if (!current->mm)
> @@ -99,44 +93,25 @@ callchain_trace(struct stackframe *fr,
>   void
>   perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct stackframe fr;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
> -
>   	arm_get_current_stackframe(regs, &fr);
>   	walk_stackframe(&fr, callchain_trace, entry);
>   }
>   
>   unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
> -
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return guest_cbs->get_guest_ip();
> -
>   	return instruction_pointer(regs);
>   }
>   
>   unsigned long perf_misc_flags(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	int misc = 0;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		if (guest_cbs->is_user_mode())
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> +	if (user_mode(regs))
> +		misc |= PERF_RECORD_MISC_USER;
> +	else
> +		misc |= PERF_RECORD_MISC_KERNEL;
>   
>   	return misc;
>   }
> diff --git a/arch/csky/kernel/perf_callchain.c b/arch/csky/kernel/perf_callchain.c
> index 35318a635a5f..92057de08f4f 100644
> --- a/arch/csky/kernel/perf_callchain.c
> +++ b/arch/csky/kernel/perf_callchain.c
> @@ -86,13 +86,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
>   void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   			 struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	unsigned long fp = 0;
>   
> -	/* C-SKY does not support virtualization. */
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return;
> -
>   	fp = regs->regs[4];
>   	perf_callchain_store(entry, regs->pc);
>   
> @@ -111,15 +106,8 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   			   struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct stackframe fr;
>   
> -	/* C-SKY does not support virtualization. */
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		pr_warn("C-SKY does not support perf in guest mode!");
> -		return;
> -	}
> -
>   	fr.fp = regs->regs[4];
>   	fr.lr = regs->lr;
>   	walk_stackframe(&fr, entry);
> diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
> index f38791960781..a78a879e7ef1 100644
> --- a/arch/nds32/kernel/perf_event_cpu.c
> +++ b/arch/nds32/kernel/perf_event_cpu.c
> @@ -1363,7 +1363,6 @@ void
>   perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   		    struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	unsigned long fp = 0;
>   	unsigned long gp = 0;
>   	unsigned long lp = 0;
> @@ -1372,11 +1371,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   
>   	leaf_fp = 0;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
> -
>   	perf_callchain_store(entry, regs->ipc);
>   	fp = regs->fp;
>   	gp = regs->gp;
> @@ -1480,13 +1474,8 @@ void
>   perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   		      struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	struct stackframe fr;
>   
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		/* We don't support guest os callchain now */
> -		return;
> -	}
>   	fr.fp = regs->fp;
>   	fr.lp = regs->lp;
>   	fr.sp = regs->sp;
> @@ -1495,32 +1484,17 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   
>   unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
> -
> -	/* However, NDS32 does not support virtualization */
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return guest_cbs->get_guest_ip();
> -
>   	return instruction_pointer(regs);
>   }
>   
>   unsigned long perf_misc_flags(struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	int misc = 0;
>   
> -	/* However, NDS32 does not support virtualization */
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		if (guest_cbs->is_user_mode())
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> +	if (user_mode(regs))
> +		misc |= PERF_RECORD_MISC_USER;
> +	else
> +		misc |= PERF_RECORD_MISC_KERNEL;
>   
>   	return misc;
>   }
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index 8ecfc4c128bc..1fc075b8f764 100644
> --- a/arch/riscv/kernel/perf_callchain.c
> +++ b/arch/riscv/kernel/perf_callchain.c
> @@ -56,13 +56,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
>   void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>   			 struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
>   	unsigned long fp = 0;
>   
> -	/* RISC-V does not support perf in guest mode. */
> -	if (guest_cbs && guest_cbs->is_in_guest())
> -		return;
> -
>   	fp = regs->s0;
>   	perf_callchain_store(entry, regs->epc);
>   
> @@ -79,13 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
>   void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>   			   struct pt_regs *regs)
>   {
> -	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
> -
> -	/* RISC-V does not support perf in guest mode. */
> -	if (guest_cbs && guest_cbs->is_in_guest()) {
> -		pr_warn("RISC-V does not support perf in guest mode!");
> -		return;
> -	}
> -
>   	walk_stackframe(NULL, regs, fill_callchain, entry);
>   }
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


