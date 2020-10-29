Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA329E6CE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 10:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14061.34997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY3qd-0005Jd-Go; Thu, 29 Oct 2020 09:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14061.34997; Thu, 29 Oct 2020 09:03:55 +0000
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
	id 1kY3qd-0005JE-Da; Thu, 29 Oct 2020 09:03:55 +0000
Received: by outflank-mailman (input) for mailman id 14061;
 Thu, 29 Oct 2020 09:03:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY3qb-0005J9-8j
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:03:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1cd48e6-3838-4636-a1fa-03e120b04660;
 Thu, 29 Oct 2020 09:03:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A02A6B9AF;
 Thu, 29 Oct 2020 09:03:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY3qb-0005J9-8j
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:03:53 +0000
X-Inumbo-ID: e1cd48e6-3838-4636-a1fa-03e120b04660
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1cd48e6-3838-4636-a1fa-03e120b04660;
	Thu, 29 Oct 2020 09:03:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603962231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulVUtW4BNF2IuUgaF7SbMFhoXSDut/HECFdtzjrjyk0=;
	b=ShIAg2DTClkNGej+6vqRmHf8tPA+Yayz8VWduYlfzs9ZP5MrewRT5Cn71IDwKoogyeetCN
	uhzQWwjIx3Ti3i9ayblRpvtRzJyltmEr93PhlyN0jlWWAZaWZz4YLEfQQsu604b2Jp1EEP
	PHaUQbHal1JU0GZaLPYO+W4ukLFmTxc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A02A6B9AF;
	Thu, 29 Oct 2020 09:03:50 +0000 (UTC)
Subject: Re: [PATCH v3] x86/pv: inject #UD for entirely missing SYSCALL
 callbacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
 <0ac0f006-c529-2437-4286-62158c2c491b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fca003e-72d4-2f56-3180-6c39ba123a99@suse.com>
Date: Thu, 29 Oct 2020 09:53:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0ac0f006-c529-2437-4286-62158c2c491b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.10.2020 22:31, Andrew Cooper wrote:
> On 26/10/2020 09:40, Jan Beulich wrote:
>> In the case that no 64-bit SYSCALL callback is registered, the guest
>> will be crashed when 64-bit userspace executes a SYSCALL instruction,
>> which would be a userspace => kernel DoS.  Similarly for 32-bit
>> userspace when no 32-bit SYSCALL callback was registered either.
>>
>> This has been the case ever since the introduction of 64bit PV support,
>> but behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which
>> yield #GP/#UD in userspace before the callback is registered, and are
>> therefore safe by default.
>>
>> This change does constitute a change in the PV ABI, for the corner case
>> of a PV guest kernel not registering a 64-bit callback (which has to be
>> considered a defacto requirement of the unwritten PV ABI, considering
>> there is no PV equivalent of EFER.SCE).
>>
>> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
>> SYSENTER (safe by default, until explicitly enabled).
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <JBeulich@suse.com>
>> ---
>> v3:
>>  * Split this change off of "x86/pv: Inject #UD for missing SYSCALL
>>    callbacks", to allow the uncontroversial part of that change to go
>>    in. Add conditional "rex64" for UREGS_rip adjustment. (Is branching
>>    over just the REX prefix too much trickery even for an unlikely to be
>>    taken code path?)
> 
> I find this submission confusion seeing as my v3 is already suitably
> acked and ready to commit.  What I haven't had yet enough free time to
> do so.

My objection to the other half stands, and hence, I'm afraid, stands
in the way of your patch getting committed. Aiui Roger's ack doesn't
invalidate my objection, sorry.

>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -33,11 +33,27 @@ ENTRY(switch_to_kernel)
>>          cmoveq VCPU_syscall32_addr(%rbx),%rax
>>          testq %rax,%rax
>>          cmovzq VCPU_syscall_addr(%rbx),%rax
>> -        movq  %rax,TRAPBOUNCE_eip(%rdx)
>>          /* TB_flags = VGCF_syscall_disables_events ? TBF_INTERRUPT : 0 */
>>          btl   $_VGCF_syscall_disables_events,VCPU_guest_context_flags(%rbx)
>>          setc  %cl
>>          leal  (,%rcx,TBF_INTERRUPT),%ecx
>> +
>> +        test  %rax, %rax
>> +UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
>> +        mov   VCPU_trap_ctxt(%rbx), %rdi
>> +        movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
>> +        cmpw  $FLAT_USER_CS32, UREGS_cs(%rsp)
>> +        je    0f
>> +        rex64                           # subl => subq
>> +0:
>> +        subl  $2, UREGS_rip(%rsp)
> 
> There was deliberately not a 32bit sub here (see below).

Funny you should say this when what I've taken as input (v2; I
don't think I had seen a v3, or else I would have called this
one v4) had "subl", not "subq". Roger's comment was regarding
a "mov" with a 32-bit register destination, not this "sub". If
you had also noticed and fixed this one, without you having
posted v3 (or without me having seen the posting) I couldn't
have known.

> As to the construct, I'm having a hard time deciding whether this is an
> excellent idea, or far too clever for its own good.
> 
> Some basic perf testing shows that there is a visible difference in
> execution time of these two paths, which means there is some
> optimisation being missed in the frontend for the 32bit case.  However,
> the difference is tiny in the grand scheme of things (about 0.4%
> difference in aggregate time to execute a loop of this pattern with a
> fixed number of iterations.)
> 
> However, the 32bit case isn't actually interesting here.  A guest can't
> execute a SYSCALL instruction on/across the 4G->0 boundary because the
> M2P is mapped NX up to the 4G boundary, so we can never reach this point
> with %eip < 2.
> 
> Therefore, the 64bit-only form is the appropriate one to use, which
> solves any question of cleverness, or potential decode stalls it causes.

Good point.

Jan

