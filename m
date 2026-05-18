Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL/FFJojC2p5DwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:35:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25EE56EED2
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311950.1582076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOz3a-0008MT-46; Mon, 18 May 2026 14:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311950.1582076; Mon, 18 May 2026 14:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOz3a-0008JZ-1M; Mon, 18 May 2026 14:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1311950;
 Mon, 18 May 2026 14:34:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wOz3X-0008JR-RC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOz3W-00ALOd-Vm
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:34:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 6a0b238c-bab6-0a2a0a5309dd-0a2a4505958c-4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:34:53 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 6a0b238c-aaa8-0a2a45050019-d98c6eacb590-1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:34:53 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A280E1C01;
 Mon, 18 May 2026 07:34:46 -0700 (PDT)
Received: from [10.57.34.29] (unknown [10.57.34.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83FA3F85F;
 Mon, 18 May 2026 07:34:47 -0700 (PDT)
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
	t=1779114891; bh=E15tHTNDpPdXPrfZ/GjSgBlqQkUxfFvGZeYUSNVaEFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FfFlZJz/BHU+RUZ+zar+T1XTybkuBlKG+zBJN9Lc0p2TtnrRSAXTy5gi7FXOzeQ11
	 mY/Lo4+ipdrf3BbwBgP0ZI1ULhXto98trvgvBFvkPDWQ8krOYIxKhkK0OF6SXRXSVc
	 9yRJlTlnM4EQjE/fv7eFTPVUaa4T8aERFuxVxXy0=
Message-ID: <10d4eaed-eaee-47b7-9ccf-7f1931b26b02@arm.com>
Date: Mon, 18 May 2026 16:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: marmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20260508143933.493013-1-jgross@suse.com>
 <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>
 <36fc4317-d7a0-410c-9d95-28858018053c@suse.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <36fc4317-d7a0-410c-9d95-28858018053c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779114893-DBF66443-FA9BA2F1/0/0
X-purgate-type: clean
X-purgate-size: 1732
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:marmarek@invisiblethingslab.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E25EE56EED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/05/2026 08:32, Jürgen Groß wrote:
> On 08.05.26 22:54, Kevin Brodsky wrote:
>> On 08/05/2026 16:39, Juergen Gross wrote:
>>> With the support of nested lazy mmu sections it can happen that
>>> arch_enter_lazy_mmu_mode() is being called twice without a call of
>>> arch_leave_lazy_mmu_mode() in between, as the lazy_mmu_*() helpers
>>> are not disabling preemption when checking for nested lazy mmu
>>> sections.
>>
>> I think this is a correct description of the issue, i.e. potentially we
>> have arch_enter_lazy_mmu_mode() called twice *sequentially*. Therefore I
>> don't think that disabling preemption inside arch_enter_lazy_mmu_mode()
>> is enough - we have a problem with preemption occurring inside
>> lazy_mmu_mode_enable() generally, not necessarily inside
>> arch_enter_lazy_mmu_mode().
>>
>> Preemption shouldn't matter if commit 291b3abed657 is reverted. AFAICT
>> this is the only easy fix.
> The description wasn't really complete, I think.
>
> The double call will only be possible if arch_end_context_switch() is
> calling arch_enter_lazy_mmu_mode(), and this is happening for Xen PV
> only.
> arch_end_context_switch() is a nop for all other cases.

Right, agreed. Would be good to update the commit message.

>
> So this can be handled completely internal of Xen (otherwise a revert of
> 291b3abed657 wouldn't help), and it is easy to do so as my patch is
> showing.
>
> As said, I'd like to get rid of the extra tracking by Xen regarding
> lazy mode.

Got it, that would be best.

This patch should ensure that xen_lazy_mode always has the correct value
regardless of preemption, which is what matters for Xen.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

