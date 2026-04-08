Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABOODj0w1mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:38:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC53BAAB9
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275669.1561430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQIb-0004sL-R1; Wed, 08 Apr 2026 10:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275669.1561430; Wed, 08 Apr 2026 10:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQIb-0004pe-OQ; Wed, 08 Apr 2026 10:38:17 +0000
Received: by outflank-mailman (input) for mailman id 1275669;
 Wed, 08 Apr 2026 10:38:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wAQIa-0004pW-05
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:38:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQIV-001bk2-U1
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:38:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69d6300c-5cb7-0a2a0a5109dd-0a2a450c9eb8-22
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:38:11 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.0)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69d63012-f40c-0a2a450c0019-d98c6eacbd6a-1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:38:10 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E09153161;
 Wed,  8 Apr 2026 03:38:03 -0700 (PDT)
Received: from [10.57.32.84] (unknown [10.57.32.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F14B3F632;
 Wed,  8 Apr 2026 03:38:08 -0700 (PDT)
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
	t=1775644689; bh=RbEAcqkGAzhWYYGDpNUfMtQ/+eT1N+kit4vG5ASyXOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+msIMnXHv+BtqjbmyFmNQx/03MDaRVEtDG3zltALUtkZ6HtWowAYb6mAu7FhOGbe
	 kFfe5JkjGOIVvtG2js3xVrqJymQgLWp0h3I89vgh5kitbjMOZa80e5iJiA72gC8ZYl
	 4eUrwpkPNnIEZpEdrGkPDGbiR2CBz6aN+prqL3t0=
Message-ID: <756bcd3b-51c1-4ee4-bb09-4c0c0514764c@arm.com>
Date: Wed, 8 Apr 2026 12:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com> <adXBwU9KAdb2gNeB@mail-itl>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <adXBwU9KAdb2gNeB@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775644690-83F42A3D-C100407C/0/0
X-purgate-type: clean
X-purgate-size: 5523
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 9FCC53BAAB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 04:47, Marek Marczykowski-Górecki wrote:
>> That may well be the case - it seems that xen_enter_lazy_mmu() is called
>> while already in lazy MMU mode (first splat), and xen_leave_lazy_mmu()
>> is called without being in lazy MMU mode (second splat). I expect this
>> is something specific to Xen, which I didn't get the chance to test.
>>
>> Looking at the series again I don't see anything obviously wrong, but I
>> think the riskiest change is commit 291b3abed657 ("x86/xen: use
>> lazy_mmu_state when context-switching") - worth trying to revert it.
> With that reverted (on top of 7.0-rc6, didn't updated to rc7 yet), I
> still got panic, although might be a bit different one:
>
> [    8.099973] BUG: unable to handle page fault for address: ffff888008000670
> [    8.100004] #PF: supervisor write access in kernel mode
> [    8.100021] #PF: error_code(0x0003) - permissions violation
> [    8.100037] PGD 3a00067 P4D 3a00067 PUD 3a01067 PMD 7cd7063 PTE 8000000008000021
> [    8.100063] Oops: Oops: 0003 [#1] SMP PTI
> [    8.100079] CPU: 0 UID: 0 PID: 226 Comm: kworker/0:2 Not tainted 7.0.0-0.rc6.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full) 
> [    8.100110] Workqueue: events do_free_init
> [    8.100126] RIP: 0010:native_set_pte+0x4/0x10
> [    8.100145] Code: 00 03 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa <48> 89 37 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90
> [    8.100195] RSP: 0018:ffffc90000c97c48 EFLAGS: 00010287
> [    8.100212] RAX: e00c4f3d8b48c03e RBX: ffff888008000670 RCX: e00000000000003e
> [    8.100234] RDX: e00c4f3d8b48c13e RSI: e00c4f3d8b48c03e RDI: ffff888008000670
> [    8.100260] RBP: e00c4f3d8b48c13e R08: 0000000000000000 R09: 0000000000000001
> [    8.100282] R10: 0000003b0c274b73 R11: e00000000000013e R12: ffffc90000c97cf0
> [    8.100304] R13: ffffffffc04ce000 R14: fffc4f3d8b48cfff R15: e00000000000013e
> [    8.100327] FS:  0000000000000000(0000) GS:ffff888094e81000(0000) knlGS:0000000000000000
> [    8.100350] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    8.100369] CR2: ffff888008000670 CR3: 000000000242e003 CR4: 00000000001706f0
> [    8.100394] Call Trace:
> [    8.100404]  <TASK>
> [    8.100413]  __change_page_attr+0x24f/0x350
> [    8.100429]  __change_page_attr_set_clr+0x61/0xd0
> [    8.100446]  change_page_attr_set_clr+0x103/0x1a0
> [    8.100467]  set_memory_nx+0x39/0x50
> [    8.100481]  __execmem_cache_free+0x35/0xb0
> [    8.100496]  execmem_free+0x9f/0x180
> [    8.100510]  ? nft_chain_nat_exit+0xe70/0xe70 [nft_chain_nat]
> [    8.100531]  do_free_init+0x2e/0x60
> [    8.100545]  process_one_work+0x198/0x390
> [    8.100559]  worker_thread+0x1af/0x320
> [    8.100573]  ? __pfx_worker_thread+0x10/0x10
> [    8.103338]  kthread+0xe3/0x120
> [    8.103355]  ? __pfx_kthread+0x10/0x10
> [    8.103369]  ret_from_fork+0x19e/0x260
> [    8.103384]  ? __pfx_kthread+0x10/0x10
> [    8.103397]  ret_from_fork_asm+0x1a/0x30
> [    8.103412]  </TASK>
> [    8.103421] Modules linked in: xenfs nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_redir nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables binfmt_misc intel_rapl_msr intel_rapl_common ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xen_blkfront
> [    8.103529] CR2: ffff888008000670
> [    8.103542] ---[ end trace 0000000000000000 ]---
> [    8.103558] RIP: 0010:native_set_pte+0x4/0x10
> [    8.103576] Code: 00 03 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa <48> 89 37 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90
> [    8.103625] RSP: 0018:ffffc90000c97c48 EFLAGS: 00010287
> [    8.103641] RAX: e00c4f3d8b48c03e RBX: ffff888008000670 RCX: e00000000000003e
> [    8.103664] RDX: e00c4f3d8b48c13e RSI: e00c4f3d8b48c03e RDI: ffff888008000670
> [    8.103686] RBP: e00c4f3d8b48c13e R08: 0000000000000000 R09: 0000000000000001
> [    8.103708] R10: 0000003b0c274b73 R11: e00000000000013e R12: ffffc90000c97cf0
> [    8.103730] R13: ffffffffc04ce000 R14: fffc4f3d8b48cfff R15: e00000000000013e
> [    8.103753] FS:  0000000000000000(0000) GS:ffff888094e81000(0000) knlGS:0000000000000000
> [    8.103775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    8.103794] CR2: ffff888008000670 CR3: 000000000242e003 CR4: 00000000001706f0
> [    8.103820] Kernel panic - not syncing: Fatal exception
> [    8.103929] Kernel Offset: disabled

That is probably the same root cause indeed (lazy MMU appearing disabled
in __xet_set_pte() while it should be enabled).

>> If
>> that doesn't help, I'd suggest bisecting the following range:
>> 58852f24f956..291b3abed657
> It will take some time, as the issue doesn't happen every time.

Understood. Here are the commits that are expected to have a functional
effect on x86 (in reverse chronological order):
- 291b3abed657 ("x86/xen: use lazy_mmu_state when context-switching")
- 5ab246749569 ("mm: enable lazy_mmu sections to nest")
- 9273dfaeaca8 ("mm: bail out of lazy_mmu_mode_* in interrupt context")
- 66bdd779d344 ("x86/xen: simplify flush_lazy_mmu()")

Hope that helps, let me know if you have any further information. It
would be worth enabling CONFIG_DEBUG_VM and then checking if any WARN()
splat appears in the log.

- Kevin

