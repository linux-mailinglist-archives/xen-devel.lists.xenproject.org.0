Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOEIDhpNpWmt8AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 09:40:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D311D4BCD
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 09:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243999.1543473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwypR-00044d-SA; Mon, 02 Mar 2026 08:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243999.1543473; Mon, 02 Mar 2026 08:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwypR-00042Z-PD; Mon, 02 Mar 2026 08:40:37 +0000
Received: by outflank-mailman (input) for mailman id 1243999;
 Mon, 02 Mar 2026 08:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xYbC=BC=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vwypQ-00042T-MI
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 08:40:36 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab7dbb8-1613-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 09:40:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B1BAF60008;
 Mon,  2 Mar 2026 08:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0849CC19423;
 Mon,  2 Mar 2026 08:40:31 +0000 (UTC)
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
X-Inumbo-ID: 7ab7dbb8-1613-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772440833;
	bh=/Q5zfmMQXbJWAqYkNWhUOcCTSWBqGiUqOPv9rbR/Ibc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LuNm/tc3l7URqrTm6aEeseGI5PkQjzDhdAG0uL0yX6cNXmpBpCwdEGe7tlz2yXwHW
	 8fCZGkALcGj99mrBh8SRXYu2X2oRtO5clHc9cziOhiqTPhBjpPcThmjIEn532CLxDU
	 xVWrXAAHfZDZ6IpFcq/qENqO++4VQCh+9HzOxopPi4OZ7jGO5RjYkR8+gHF6epDya9
	 aouQuXwyUNK0JvXgsEvptUnouQMcTPpenddZK7OxW+oyMHCz+Q3HRWqD1Np2OSTLan
	 or4k9EAZoJtaB/mTm+9Kf/luKGsV8cVo3rCR3EhUM9cPJg8U1WC57a24krPaZJsc7r
	 H7fUOJ4ywkOIQ==
Message-ID: <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org>
Date: Mon, 2 Mar 2026 09:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[david@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 74D311D4BCD
X-Rspamd-Action: no action

On 3/2/26 07:36, Jürgen Groß wrote:
> On 01.03.26 16:04, Marek Marczykowski-Górecki wrote:
>> Hi,
>>
>> Some time ago I made a change to disable scrubbing pages that are
>> ballooned out during system boot. I'll paste the whole commit message as
>> it's relevant here:
>>
>>      197ecb3802c0 xen/balloon: add runtime control for scrubbing
>> ballooned out pages
>>
>>      Scrubbing pages on initial balloon down can take some time,
>> especially
>>      in nested virtualization case (nested EPT is slow). When HVM/PVH
>> guest is
>>      started with memory= significantly lower than maxmem=, all the extra
>>      pages will be scrubbed before returning to Xen. But since most of
>> them
>>      weren't used at all at that point, Xen needs to populate them first
>>      (from populate-on-demand pool). In nested virt case (Xen inside KVM)
>>      this slows down the guest boot by 15-30s with just 1.5GB needed
>> to be
>>      returned to Xen.
>>           Add runtime parameter to enable/disable it, to allow
>> initially disabling
>>      scrubbing, then enable it back during boot (for example in
>> initramfs).
>>      Such usage relies on assumption that a) most pages ballooned out
>> during
>>      initial boot weren't used at all, and b) even if they were, very few
>>      secrets are in the guest at that time (before any serious userspace
>>      kicks in).
>>      Convert CONFIG_XEN_SCRUB_PAGES to CONFIG_XEN_SCRUB_PAGES_DEFAULT
>> (also
>>      enabled by default), controlling default value for the new runtime
>>      switch.
>>
>> Now, I face the same issue with init_on_free/init_on_alloc (not sure
>> which one applies here, probably the latter one), which several
>> distributions enable by default. The result is (see timestamps):
>>
>>      [2026-02-24 01:12:55] [    7.485151] xen:balloon: Waiting for
>> initial ballooning down having finished.
>>      [2026-02-24 01:14:14] [   86.581510] xen:balloon: Initial
>> ballooning down finished.
>>
>> But here the situation is a bit more complicated:
>> init_on_free/init_on_alloc applies to any pages, not just those for
>> balloon driver. I see two approaches to solve the issue:
>> 1. Similar to xen_scrub_pages=, add a runtime switch for
>>     init_on_free/init_on_alloc, then force them off during boot, and
>>     re-enable early in initramfs.
>> 2. Somehow adjust balloon driver to bypass init_on_alloc when ballooning
>>     a page out.
>>
>> The first approach is likely easier to implement, but also has some
>> drawbacks: it may result in some kernel structures that are allocated
>> early to remain with garbage data in uninitialized places. While it may
>> not matter during early boot, such structures may survive for quite some
>> time, and maybe attacker can use them later on to exploit some other
>> bug. This wasn't really a concern with xen_scrub_pages, as those pages
>> were immediately ballooned out.
>>
>> The second approach sounds architecturally better, and maybe
>> init_on_alloc could be always bypassed during balloon out? The balloon
>> driver can scrub the page on its own already (which is enabled by
>> default). That of course assumes the issue is only about init_on_alloc,
>> not init_on_free (or both) - which I haven't really confirmed yet...
>> If going this way, I see the balloon driver does basically
>> alloc_page(GFP_BALLOON), where GFP_BALLOON is:
>>
>>      /* When ballooning out (allocating memory to return to Xen) we
>> don't really
>>         want the kernel to try too hard since that can trigger the oom
>> killer. */
>>      #define GFP_BALLOON \
>>          (GFP_HIGHUSER | __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC)
>>
>> Would that be about adding some new flag here? Or maybe there is already
>> one for this purpose?
> 
> There doesn't seem to be a flag for that.
> 
> But I think adding a new flag __GFP_NO_INIT and testing that in
> want_init_on_alloc() _before_ checking CONFIG_INIT_ON_ALLOC_DEFAULT_ON
> would be a sensible approach.

People argued against such flags in the past, because it will simply get
abused by arbitrary drivers that want to be smart.

Whatever leaves the buddy shall be zeroed out. If there is a
double-zeroing happen, the latter could get optimized out by checking
something like user_alloc_needs_zeroing().

See mm/huge_memory.c:vma_alloc_anon_folio_pmd() as an example where we
avoid double-zeroing.

> 
>> Any opinions?
> 
> You are aware of the "init_on_alloc" boot parameter? So if this is fine
> for you, you could just use approach 1 above without any kernel patches
> needed.

I don't think init_on_alloc can be enabled after boot. IIUC, 1) would
require a runtime switch.

-- 
Cheers,

David

