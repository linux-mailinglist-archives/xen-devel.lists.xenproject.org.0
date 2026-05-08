Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAamMAqz/WkXhwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:55:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694044F48CE
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303391.1576820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHub-0007u9-3B; Fri, 08 May 2026 09:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303391.1576820; Fri, 08 May 2026 09:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHub-0007rY-06; Fri, 08 May 2026 09:54:25 +0000
Received: by outflank-mailman (input) for mailman id 1303391;
 Fri, 08 May 2026 09:54:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wLHuZ-0007rS-Ke
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 09:54:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLHuZ-00FKkc-1O
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:54:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fdb2b9-2eae-0a2a0a5409dd-0a2a450cbdaa-36
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:54:22 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fdb2ce-62f1-0a2a450c0019-d98c6eacc006-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:54:22 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53F741BCA;
 Fri,  8 May 2026 02:54:16 -0700 (PDT)
Received: from [10.57.35.71] (unknown [10.57.35.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A97A3F836;
 Fri,  8 May 2026 02:54:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778234061; bh=UKXz8qe6CYYl8KXHQkBSeLcEXveBk25zWF0FLtT+yKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ut8+a+EPP3X/dGPsnJmH2XWvwOLX3QKyFPxb/dXyfTZ15exwUseKgJi4fk74OstOH
	 MTTVJGJv2XIha/tcFrEOG6KBdbcohMz6tRbsgYxppTIqOXj65xlm7yD4toUkI5IznK
	 dFuDW1ZHsf/TF0D6F/GH2OqG/w7Bu4yxSVWkVolQ=
Message-ID: <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>
Date: Fri, 8 May 2026 11:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
 <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
 <15645d19-f19d-4955-8315-0188aa834eb6@suse.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <15645d19-f19d-4955-8315-0188aa834eb6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778234062-E0D63CF5-133CD4DB/0/0
X-purgate-type: clean
X-purgate-size: 2334
X-Rspamd-Queue-Id: 694044F48CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08/05/2026 10:53, Juergen Gross wrote:
> [...]
>
> But now I think I have found the real culprit in lazy_mmu_mode_enable():
>
> static inline void lazy_mmu_mode_enable(void)
> {
>         struct lazy_mmu_state *state = &current->lazy_mmu_state;
>
>         if (in_interrupt() || state->pause_count > 0)
>                 return;
>
>         VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
>
>         if (state->enable_count++ == 0)
>                 arch_enter_lazy_mmu_mode();
> }
>
> Consider a preemption just before calling arch_enter_lazy_mmu_mode(). The
> enable_count will be 1 now, but there was no switch to lazy mode yet.
>
> When the task becomes active again, context switch handling will see lazy
> mode enabled (enable_count > 0), so it will call
> arch_enter_lazy_mmu_mode().
> And then the task resumes and is calling arch_enter_lazy_mmu_mode()
> another
> time.

Agreed, this must be the problem. I did wonder whether the lack of
atomicity would cause trouble...

arm64 isn't impacted because it tracks related state in task_struct
only. powerpc and sparc do use percpu variables but that shouldn't
matter as they disable preemption in the entire lazy MMU section.

>
> The only chance I'm seeing to avoid that would be to disable preemption
> around all instances of testing a condition and then enabling or
> disabling
> lazy mmu mode.

I don't immediately see why we would need such a big hammer. If we
revert commit 291b3abed657 ("x86/xen: use lazy_mmu_state when
context-switching"), then arch_{start,end}_context_switch() should once
again do the right thing for Xen since the TIF_LAZY_MMU_UPDATES flag is
separate from lazy_mmu_state. I think it looks like this:

lazy_mmu_mode_enable()
    state->enable_count++
    <PREEMPT>
        arch_start_context_switch() 
            xen_lazy_mode == XEN_LAZY_NONE -> do nothing
        
        <other task runs; this task is scheduled again>

        arch_end_context_switch() 
            TIF_LAZY_MMU_UPDATES not set -> do nothing

        <exception return>
    enter_lazy(XEN_LAZY_MMU)

Nothing else should be checking lazy MMU state during the context switch.

Does that make sense?

- Kevin

