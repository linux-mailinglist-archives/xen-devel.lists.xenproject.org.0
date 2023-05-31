Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2331717278
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 02:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541531.844393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q49lb-0006zc-TZ; Wed, 31 May 2023 00:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541531.844393; Wed, 31 May 2023 00:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q49lb-0006wH-Qa; Wed, 31 May 2023 00:32:43 +0000
Received: by outflank-mailman (input) for mailman id 541531;
 Wed, 31 May 2023 00:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVj=BU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q49la-0006wB-An
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 00:32:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5161961-ff4a-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 02:32:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7E2E63519;
 Wed, 31 May 2023 00:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA04C433D2;
 Wed, 31 May 2023 00:32:36 +0000 (UTC)
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
X-Inumbo-ID: a5161961-ff4a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685493157;
	bh=qGXhzhHGIOxUqjuFhB8ssq9HbdjoYQKfzSCesG0rW3I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hpWZhbV6Hq0Z51S8SgS+pvig8nCrrpnVuBqRKTZkb2h7cUeIcgMXCJ5volTyAuznr
	 2lGXDyyEMNnKdke0Lh3lnCqgTGmslcAkcz0CK2gPoLARjB/CkMT5W07pUQxfo6jEsU
	 GBSmTrr7Bdr58cXebHx7uIj0IqgWXyvshblVaZkDbkVtI/aZBx58dK2xRjrmrncjmt
	 hFCQG6a8+bp0AaDRiUgmnvPfAHx7qJjEDKnJzz8jAK0yA679TXHQnYcKCjAWUgrCsr
	 IaWsRrYFU0lswdor3tM1wNud8JyL6PEjzJSExoSeJRG6rjDFA1rIYboJ7OwhmEWlqO
	 Qi3D+wMsq/MGw==
Date: Tue, 30 May 2023 17:32:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    xenia.ragiadakou@amd.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
In-Reply-To: <c143dc69-20bd-da87-3d01-d405c358fc67@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305301729230.44000@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop> <ZGzFnE2w/YqYT35c@Air-de-Roger> <ZGzSnu8m/IqjmyHx@Air-de-Roger> <alpine.DEB.2.22.394.2305241646520.44000@ubuntu-linux-20-04-desktop> <6790d5ae-9742-f5f3-bd8c-62602ee9cb1d@suse.com>
 <alpine.DEB.2.22.394.2305251248000.44000@ubuntu-linux-20-04-desktop> <c143dc69-20bd-da87-3d01-d405c358fc67@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 May 2023, Jan Beulich wrote:
> On 25.05.2023 21:54, Stefano Stabellini wrote:
> > On Thu, 25 May 2023, Jan Beulich wrote:
> >> On 25.05.2023 01:51, Stefano Stabellini wrote:
> >>> xen/irq: fix races between send_cleanup_vector and _clear_irq_vector
> >>
> >> This title is, I'm afraid, already misleading. No such race can occur
> >> afaict, as both callers of _clear_irq_vector() acquire the IRQ
> >> descriptor lock first, and irq_complete_move() (the sole caller of
> >> send_cleanup_vector()) is only ever invoked as or by an ->ack()
> >> hook, which in turn is only invoked with, again, the descriptor lock
> >> held.
> > 
> > Yes I see that you are right about the locking, and thank you for taking
> > the time to look into it.
> > 
> > One last question: could it be that a second interrupt arrives while
> > ->ack() is being handled?  do_IRQ() is running with interrupts disabled?
> 
> It is, at least as far as the invocation of ->ack() is concerned. Else
> the locking scheme would be broken. You may not that around ->handler()
> invocation we enable interrupts.

OK. FYI, we were able to repro a problem after 250+ suspend/resume Dom0
cycles with my patch applied. So unfortunately there is no extra
information as my patch removes the ASSERTs.

However I can tell you that the symptom is the below. I am not sure if
it tells you anything but FYI. So clearly my patch makes the problem
harder to repro but doesn't fix it.


May 23 22:47:31 amd-saravana-crater kernel: [17881.744986] INFO: task kworker/u8:1:45 blocked for more than 120 seconds.
May 23 22:47:31 amd-saravana-crater kernel: [17881.745048]       Not tainted 6.1.0-rtc-s3 #1
May 23 22:47:31 amd-saravana-crater kernel: [17881.745089] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 22:47:31 amd-saravana-crater kernel: [17881.745144] task:kworker/u8:1    state:D stack:0     pid:45    ppid:2      flags:0x00004000
May 23 22:47:31 amd-saravana-crater kernel: [17881.745154] Workqueue: writeback wb_workfn (flush-259:0)
May 23 22:47:31 amd-saravana-crater kernel: [17881.745170] Call Trace:
May 23 22:47:31 amd-saravana-crater kernel: [17881.745174]  <TASK>
May 23 22:47:31 amd-saravana-crater kernel: [17881.745182]  __schedule+0x2d5/0x920
May 23 22:47:31 amd-saravana-crater kernel: [17881.745192]  ? preempt_count_add+0x7c/0xc0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745202]  schedule+0x63/0xd0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745208]  __bio_queue_enter+0xeb/0x230
May 23 22:47:31 amd-saravana-crater kernel: [17881.745217]  ? prepare_to_wait_event+0x130/0x130
May 23 22:47:31 amd-saravana-crater kernel: [17881.745226]  blk_mq_submit_bio+0x358/0x570
May 23 22:47:31 amd-saravana-crater kernel: [17881.745237]  __submit_bio+0xfa/0x170
May 23 22:47:31 amd-saravana-crater kernel: [17881.745243]  submit_bio_noacct_nocheck+0x229/0x2b0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745250]  ? ktime_get+0x47/0xb0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745256]  submit_bio_noacct+0x1e4/0x5a0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745261]  ? submit_bio_noacct+0x1e4/0x5a0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745268]  submit_bio+0x47/0x80
May 23 22:47:31 amd-saravana-crater kernel: [17881.745273]  ext4_io_submit+0x24/0x40
May 23 22:47:31 amd-saravana-crater kernel: [17881.745282]  ext4_writepages+0x57f/0xdd0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745288]  ? _raw_read_lock_bh+0x20/0x40
May 23 22:47:31 amd-saravana-crater kernel: [17881.745296]  ? update_sd_lb_stats.constprop.148+0x11e/0x960
May 23 22:47:31 amd-saravana-crater kernel: [17881.745308]  do_writepages+0xbf/0x1a0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745314]  ? __enqueue_entity+0x6c/0x80
May 23 22:47:31 amd-saravana-crater kernel: [17881.745321]  ? enqueue_entity+0x1a9/0x370
May 23 22:47:31 amd-saravana-crater kernel: [17881.745327]  __writeback_single_inode+0x44/0x360
May 23 22:47:31 amd-saravana-crater kernel: [17881.745332]  ? _raw_spin_unlock+0x19/0x40
May 23 22:47:31 amd-saravana-crater kernel: [17881.745339]  writeback_sb_inodes+0x203/0x4e0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745350]  __writeback_inodes_wb+0x66/0xd0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745358]  wb_writeback+0x23d/0x2d0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745366]  wb_workfn+0x20b/0x490
May 23 22:47:31 amd-saravana-crater kernel: [17881.745372]  ? _raw_spin_unlock+0x19/0x40
May 23 22:47:31 amd-saravana-crater kernel: [17881.745381]  process_one_work+0x227/0x440
May 23 22:47:31 amd-saravana-crater kernel: [17881.745389]  worker_thread+0x31/0x3e0
May 23 22:47:31 amd-saravana-crater kernel: [17881.745395]  ? process_one_work+0x440/0x440
May 23 22:47:31 amd-saravana-crater kernel: [17881.745400]  kthread+0xfe/0x130
May 23 22:47:31 amd-saravana-crater kernel: [17881.745406]  ? kthread_complete_and_exit+0x20/0x20
May 23 22:47:31 amd-saravana-crater kernel: [17881.745413]  ret_from_fork+0x22/0x30
May 23 22:47:31 amd-saravana-crater kernel: [17881.745425]  </TASK>

