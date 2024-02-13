Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24FA852BFF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 10:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679818.1057522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZooK-0000op-Df; Tue, 13 Feb 2024 09:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679818.1057522; Tue, 13 Feb 2024 09:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZooK-0000me-AA; Tue, 13 Feb 2024 09:10:40 +0000
Received: by outflank-mailman (input) for mailman id 679818;
 Tue, 13 Feb 2024 09:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m+vO=JW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rZooJ-0000mY-1R
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 09:10:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc5c15a-ca4f-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 10:10:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB412211A3;
 Tue, 13 Feb 2024 09:10:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59BDC13404;
 Tue, 13 Feb 2024 09:10:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vXMTFAoyy2UvVAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 13 Feb 2024 09:10:34 +0000
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
X-Inumbo-ID: bfc5c15a-ca4f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707815435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dBHyPlf5pqwHmlpBwT/zIVP0+EJA4iC+DUxlKWaHfo=;
	b=IAj6MF1EgCsSh15iPa9hS0zQwWHahdobn0sXraThyI/Gn+L1/Iy46uSfvw3XG+Q8GQ1y7V
	YFMpQSmXkcZfcf/vhPE221h9MvV3zOTXuDsPKtg42KQtPnuLw+LtDotnJ0OmECOz1seJyp
	MlF2Bo5TgjNCGErnVMTW0kkEsOH52Og=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707815434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dBHyPlf5pqwHmlpBwT/zIVP0+EJA4iC+DUxlKWaHfo=;
	b=ScCDbNo+7YVxtanr4RTnJ3Kh5K8Ou9076cv3r2+jRgjTXLBEsnVFk3/OX2Zaylpe0nQFex
	bexyFOoR0ufhcNF0md8VJitf7Fu6H86qOUjY7zcA+Gh+gV9SstaDsM+kKHMB0kMr/zDBZc
	TFLu57g9WDc2jKKx2NMxT6N/ScTUks0=
Message-ID: <49c3795f-7827-4e30-90d6-e49b2aa1a5bc@suse.com>
Date: Tue, 13 Feb 2024 10:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: close evtchn after mapping cleanup
Content-Language: en-US
To: Maximilian Heyne <mheyne@amazon.de>
Cc: Julien Grall <jgrall@amazon.com>, stable@vger.kernel.org,
 Andrew Panyakin <apanyaki@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20240124163130.31324-1-mheyne@amazon.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240124163130.31324-1-mheyne@amazon.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.38
X-Spamd-Result: default: False [-3.38 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[11.amazon:url,amazon.de:email,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.91)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 24.01.24 17:31, Maximilian Heyne wrote:
> shutdown_pirq and startup_pirq are not taking the
> irq_mapping_update_lock because they can't due to lock inversion. Both
> are called with the irq_desc->lock being taking. The lock order,
> however, is first irq_mapping_update_lock and then irq_desc->lock.
> 
> This opens multiple races:
> - shutdown_pirq can be interrupted by a function that allocates an event
>    channel:
> 
>    CPU0                        CPU1
>    shutdown_pirq {
>      xen_evtchn_close(e)
>                                __startup_pirq {
>                                  EVTCHNOP_bind_pirq
>                                    -> returns just freed evtchn e
>                                  set_evtchn_to_irq(e, irq)
>                                }
>      xen_irq_info_cleanup() {
>        set_evtchn_to_irq(e, -1)
>      }
>    }
> 
>    Assume here event channel e refers here to the same event channel
>    number.
>    After this race the evtchn_to_irq mapping for e is invalid (-1).
> 
> - __startup_pirq races with __unbind_from_irq in a similar way. Because
>    __startup_pirq doesn't take irq_mapping_update_lock it can grab the
>    evtchn that __unbind_from_irq is currently freeing and cleaning up. In
>    this case even though the event channel is allocated, its mapping can
>    be unset in evtchn_to_irq.
> 
> The fix is to first cleanup the mappings and then close the event
> channel. In this way, when an event channel gets allocated it's
> potential previous evtchn_to_irq mappings are guaranteed to be unset already.
> This is also the reverse order of the allocation where first the event
> channel is allocated and then the mappings are setup.
> 
> On a 5.10 kernel prior to commit 3fcdaf3d7634 ("xen/events: modify internal
> [un]bind interfaces"), we hit a BUG like the following during probing of NVMe
> devices. The issue is that during nvme_setup_io_queues, pci_free_irq
> is called for every device which results in a call to shutdown_pirq.
> With many nvme devices it's therefore likely to hit this race during
> boot because there will be multiple calls to shutdown_pirq and
> startup_pirq are running potentially in parallel.
> 
>    ------------[ cut here ]------------
>    blkfront: xvda: barrier or flush: disabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
>    kernel BUG at drivers/xen/events/events_base.c:499!
>    invalid opcode: 0000 [#1] SMP PTI
>    CPU: 44 PID: 375 Comm: kworker/u257:23 Not tainted 5.10.201-191.748.amzn2.x86_64 #1
>    Hardware name: Xen HVM domU, BIOS 4.11.amazon 08/24/2006
>    Workqueue: nvme-reset-wq nvme_reset_work
>    RIP: 0010:bind_evtchn_to_cpu+0xdf/0xf0
>    Code: 5d 41 5e c3 cc cc cc cc 44 89 f7 e8 2b 55 ad ff 49 89 c5 48 85 c0 0f 84 64 ff ff ff 4c 8b 68 30 41 83 fe ff 0f 85 60 ff ff ff <0f> 0b 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 0f 1f 44 00 00
>    RSP: 0000:ffffc9000d533b08 EFLAGS: 00010046
>    RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000006
>    RDX: 0000000000000028 RSI: 00000000ffffffff RDI: 00000000ffffffff
>    RBP: ffff888107419680 R08: 0000000000000000 R09: ffffffff82d72b00
>    R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000001ed
>    R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000002
>    FS:  0000000000000000(0000) GS:ffff88bc8b500000(0000) knlGS:0000000000000000
>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>    CR2: 0000000000000000 CR3: 0000000002610001 CR4: 00000000001706e0
>    DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>    DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>    Call Trace:
>     ? show_trace_log_lvl+0x1c1/0x2d9
>     ? show_trace_log_lvl+0x1c1/0x2d9
>     ? set_affinity_irq+0xdc/0x1c0
>     ? __die_body.cold+0x8/0xd
>     ? die+0x2b/0x50
>     ? do_trap+0x90/0x110
>     ? bind_evtchn_to_cpu+0xdf/0xf0
>     ? do_error_trap+0x65/0x80
>     ? bind_evtchn_to_cpu+0xdf/0xf0
>     ? exc_invalid_op+0x4e/0x70
>     ? bind_evtchn_to_cpu+0xdf/0xf0
>     ? asm_exc_invalid_op+0x12/0x20
>     ? bind_evtchn_to_cpu+0xdf/0xf0
>     ? bind_evtchn_to_cpu+0xc5/0xf0
>     set_affinity_irq+0xdc/0x1c0
>     irq_do_set_affinity+0x1d7/0x1f0
>     irq_setup_affinity+0xd6/0x1a0
>     irq_startup+0x8a/0xf0
>     __setup_irq+0x639/0x6d0
>     ? nvme_suspend+0x150/0x150
>     request_threaded_irq+0x10c/0x180
>     ? nvme_suspend+0x150/0x150
>     pci_request_irq+0xa8/0xf0
>     ? __blk_mq_free_request+0x74/0xa0
>     queue_request_irq+0x6f/0x80
>     nvme_create_queue+0x1af/0x200
>     nvme_create_io_queues+0xbd/0xf0
>     nvme_setup_io_queues+0x246/0x320
>     ? nvme_irq_check+0x30/0x30
>     nvme_reset_work+0x1c8/0x400
>     process_one_work+0x1b0/0x350
>     worker_thread+0x49/0x310
>     ? process_one_work+0x350/0x350
>     kthread+0x11b/0x140
>     ? __kthread_bind_mask+0x60/0x60
>     ret_from_fork+0x22/0x30
>    Modules linked in:
>    ---[ end trace a11715de1eee1873 ]---
> 
> Fixes: d46a78b05c0e ("xen: implement pirq type event channels")
> Cc: stable@vger.kernel.org
> Co-debugged-by: Andrew Panyakin <apanyaki@amazon.com>
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


