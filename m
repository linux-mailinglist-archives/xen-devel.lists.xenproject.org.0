Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32153B34C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 08:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340844.565969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwduc-0005jV-FC; Thu, 02 Jun 2022 06:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340844.565969; Thu, 02 Jun 2022 06:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwduc-0005gZ-Bf; Thu, 02 Jun 2022 06:02:26 +0000
Received: by outflank-mailman (input) for mailman id 340844;
 Thu, 02 Jun 2022 06:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk5x=WJ=bombadil.srs.infradead.org=BATV+b56869c198be7c3a2e83+6857+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nwdua-0005gT-2Y
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 06:02:24 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6515d4-e239-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 08:02:21 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nwduL-001bSd-8A; Thu, 02 Jun 2022 06:02:09 +0000
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
X-Inumbo-ID: 8f6515d4-e239-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h2ZY8VEFgpSaofTKAI8U3Wwg8+8pVIAh16eQkIT60+w=; b=eqmhX3QclN9MlaR/0mwyStXb9K
	NOfcklljy6MQ77D15aoesLM1/t5jG5lKjBAg+zjdCmOipjYeIwcMAt7c391tje9RzUCmz40ZUr8SD
	PkwWxPOcLvYoWgEN/5fzukgPf85mr7wPyo0x2Hd2fs0dFBprgWahMRCVfWbbBuFE1y+hVQNpNUhUV
	AfozbbnIKEaIMOubfcgJZgIwBi4JNMy7O36+tB2XoNgBRJ5q4QiGgIgYzXhWWy4sKEteuV5GeV0Mr
	fpc6Fuh5n1cq/iKxGb0E6G9KmKJLmmzyM3T6LurMLWWRhvyLFGVouXm3HQ0VY1hmfflcPHWfDCwz3
	vzc0SN2w==;
Date: Wed, 1 Jun 2022 23:02:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen-blkfront: Handle NULL gendisk
Message-ID: <YphSYfdzy8kekhTZ@infradead.org>
References: <20220601195341.28581-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601195341.28581-1-jandryuk@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 01, 2022 at 03:53:41PM -0400, Jason Andryuk wrote:
> When a VBD is not fully created and then closed, the kernel can have a
> NULL pointer dereference:
> 
> The reproducer is trivial:
> 
> [user@dom0 ~]$ sudo xl block-attach work backend=sys-usb vdev=xvdi target=/dev/sdz
> [user@dom0 ~]$ xl block-list work
> Vdev  BE  handle state evt-ch ring-ref BE-path
> 51712 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51712
> 51728 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51728
> 51744 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51744
> 51760 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51760
> 51840 3   241    3     -1     -1       /local/domain/3/backend/vbd/241/51840
>                  ^ note state, the /dev/sdz doesn't exist in the backend
> 
> [user@dom0 ~]$ sudo xl block-detach work xvdi
> [user@dom0 ~]$ xl block-list work
> Vdev  BE  handle state evt-ch ring-ref BE-path
> work is an invalid domain identifier
> 
> And its console has:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000050
> PGD 80000000edebb067 P4D 80000000edebb067 PUD edec2067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 52 Comm: xenwatch Not tainted 5.16.18-2.43.fc32.qubes.x86_64 #1
> RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
> Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
> RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
> RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
> RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
> R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
> R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
> FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
> Call Trace:
>  <TASK>
>  blkback_changed+0x95/0x137 [xen_blkfront]
>  ? read_reply+0x160/0x160
>  xenwatch_thread+0xc0/0x1a0
>  ? do_wait_intr_irq+0xa0/0xa0
>  kthread+0x16b/0x190
>  ? set_kthread_struct+0x40/0x40
>  ret_from_fork+0x22/0x30
>  </TASK>
> Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_counter nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nf_tables nfnetlink intel_rapl_msr intel_rapl_common crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel xen_netfront pcspkr xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler fuse bpf_preload ip_tables overlay xen_blkfront
> CR2: 0000000000000050
> ---[ end trace 7bc9597fd06ae89d ]---
> RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
> Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
> RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
> RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
> RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
> R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
> R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
> FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
> Kernel panic - not syncing: Fatal exception
> Kernel Offset: disabled
> 
> info->rq and info->gd are only set in blkfront_connect(), which is
> called for state 4 (XenbusStateConnected).  Guard against using NULL
> variables in blkfront_closing() to avoid the issue.
> 
> The rest of blkfront_closing looks okay.  If info->nr_rings is 0, then
> for_each_rinfo won't do anything.
> 
> blkfront_remove also needs to check for non-NULL pointers before
> cleaning up the gendisk and request queue.
> 
> Fixes: 05d69d950d9d "xen-blkfront: sanitize the removal state machine"
> Reported-by: Marek Marczykowski-G�recki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Tis looks ok, but do we have anything that prevents races between
blkfront_connect, blkfront_closing and blkfront_remove?

