Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF2326A1E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 23:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90602.171556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFllk-0005zQ-Qi; Fri, 26 Feb 2021 22:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90602.171556; Fri, 26 Feb 2021 22:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFllk-0005z1-NT; Fri, 26 Feb 2021 22:39:32 +0000
Received: by outflank-mailman (input) for mailman id 90602;
 Fri, 26 Feb 2021 22:39:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e85+=H4=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1lFllj-0005yw-AN
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 22:39:31 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd234f42-7f1a-4e3d-bcb3-e9c19d6a3d23;
 Fri, 26 Feb 2021 22:39:28 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>) id 1lFllf-00033i-Ms
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 22:39:27 +0000
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
X-Inumbo-ID: dd234f42-7f1a-4e3d-bcb3-e9c19d6a3d23
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com; s=alpha;
	h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=YvoH1l9k9s0wx7FCW2R9QVvFEOQ66BCYK+5ppEQvY2Q=;
	b=KoqeHF/UbgxO6zmaFtKIiT3kbN9vDiCHIb7n5xDgQ28zgqW27BFVsS0DdTk39LYk2eh2Ao76HvoDB1QwVsF7/Cp6P7zsAESKRIV6VtDdVvA1tm1h/x/m3DWRJ8nDe+ibiqDl3ADwoeCUUts4jriDtc9aQbRDertt3f5QfEd43Q4YoJ/sj81VDHs7AAjwkhxFqHeVskxYioixf2cvuHN3qkNwmCrogxTG9PGxtMumpgv58apGkvGTCmUS0m8kzQZwFrQ2Xw6dFemVmQHVpoHtk/psjUjC8DNQkjOHIg8WVMwy6oqzLRNUoyCdMLeG/J8lBKm7eZ5gZEIE1J5M9lT6aw==;
Date: Fri, 26 Feb 2021 22:39:27 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: dom0 suddenly blocking on all access to md device
Message-ID: <20210226223927.GQ29212@bitfolk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi,

I suspect this might be an issue in the dom0 kernel (Debian buster,
kernel 4.19.0-13-amd64), but just lately I've been sporadically
having issues where dom0 blocks or severely slows down on all access
to the particular md device that hosts all domU block devices.

Setup in dom0: an md RAID10 that is used as an LVM PV for an LVM volume
group, where all domU block devices are LVM logical volumes in that
group. So the relevant part of a domU config file might look like:

disk = [ "phy:/dev/myvg/domu_debtest1_xvda,xvda,w",
         "phy:/dev/myvg/domu_debtest1_xvdb,xvdb,w" ]

The guests are mostly PV, a sprinkling of PVH, no HVM.

There's 5 of these servers but 3 of them have only recently been
upgraded to Xen 4.12.14 (on Debian buster) from Xen 4.10 (on Debian
jessie). The fact that all of them have been pretty stable in the
past, on differing hardware, makes me discount a hardware issue. The
fact that two of them have been buster / 4.12.x for a long time
without issue but are also now starting to see this does make me
think that it's a recent dom0 kernel issue.

When the problem occurs, inside every domU I see things like this:

Feb 26 20:02:34 backup4 kernel: [2530464.736085] INFO: task btrfs-transacti:333 blocked for more than 120 seconds.
Feb 26 20:02:34 backup4 kernel: [2530464.736107]       Not tainted 4.9.0-14-amd64 #1 Debian 4.9.246-2
Feb 26 20:02:34 backup4 kernel: [2530464.736117] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Feb 26 20:02:34 backup4 kernel: [2530464.736131] btrfs-transacti D    0   333      2 0x00000000
Feb 26 20:02:34 backup4 kernel: [2530464.736146]  0000000000000246 ffff8800f4e0c400 0000000000000000 ffff8800f8a7f100
Feb 26 20:02:34 backup4 kernel: [2530464.736168]  ffff8800fad18a00 ffff8800fa7dd000 ffffc90040b2f670 ffffffff8161a979
Feb 26 20:02:34 backup4 kernel: [2530464.736188]  ffff8800fa6d0200 0000000000000000 ffff8800fad18a00 0000000000000010
Feb 26 20:02:34 backup4 kernel: [2530464.736209] Call Trace:
Feb 26 20:02:34 backup4 kernel: [2530464.736223]  [<ffffffff8161a979>] ? __schedule+0x239/0x6f0
Feb 26 20:02:34 backup4 kernel: [2530464.736236]  [<ffffffff8161ae62>] ? schedule+0x32/0x80
Feb 26 20:02:34 backup4 kernel: [2530464.736248]  [<ffffffff8161e1fd>] ? schedule_timeout+0x1dd/0x380
Feb 26 20:02:34 backup4 kernel: [2530464.736263]  [<ffffffff8101c201>] ? xen_clocksource_get_cycles+0x11/0x20
Feb 26 20:02:34 backup4 kernel: [2530464.736275]  [<ffffffff8161a6dd>] ? io_schedule_timeout+0x9d/0x100
Feb 26 20:02:34 backup4 kernel: [2530464.736289]  [<ffffffff81367964>] ? __sbitmap_queue_get+0x24/0x90
Feb 26 20:02:34 backup4 kernel: [2530464.736302]  [<ffffffff81317f60>] ? bt_get.isra.6+0x160/0x220
Feb 26 20:02:34 backup4 kernel: [2530464.736338]  [<ffffffffc0148bf8>] ? __btrfs_map_block+0x6c8/0x11d0 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736353]  [<ffffffff810bf010>] ? prepare_to_wait_event+0xf0/0xf0
Feb 26 20:02:34 backup4 kernel: [2530464.736364]  [<ffffffff813182d3>] ? blk_mq_get_tag+0x23/0x90
Feb 26 20:02:34 backup4 kernel: [2530464.736377]  [<ffffffff81313b6a>] ? __blk_mq_alloc_request+0x1a/0x220
Feb 26 20:02:34 backup4 kernel: [2530464.736390]  [<ffffffff81314a39>] ? blk_mq_map_request+0xd9/0x170
Feb 26 20:02:34 backup4 kernel: [2530464.736402]  [<ffffffff8131726b>] ? blk_mq_make_request+0xbb/0x580
Feb 26 20:02:34 backup4 kernel: [2530464.736429]  [<ffffffffc0148bf8>] ? __btrfs_map_block+0x6c8/0x11d0 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736444]  [<ffffffff8130b0f5>] ? generic_make_request+0x115/0x2d0
Feb 26 20:02:34 backup4 kernel: [2530464.736456]  [<ffffffff8130b326>] ? submit_bio+0x76/0x140
Feb 26 20:02:34 backup4 kernel: [2530464.736481]  [<ffffffffc0149d9a>] ? btrfs_map_bio+0x19a/0x340 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736505]  [<ffffffffc0111635>] ? btree_submit_bio_hook+0xf5/0x110 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736535]  [<ffffffffc0138318>] ? submit_one_bio+0x68/0x90 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736561]  [<ffffffffc013fd4d>] ? read_extent_buffer_pages+0x1cd/0x300 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736587]  [<ffffffffc010fbe0>] ? free_root_pointers+0x60/0x60 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736609]  [<ffffffffc010ff9c>] ? btree_read_extent_buffer_pages+0x8c/0x100 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736635]  [<ffffffffc0111814>] ? read_tree_block+0x34/0x50 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736655]  [<ffffffffc00ef9f3>] ? read_block_for_search.isra.36+0x133/0x320 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736678]  [<ffffffffc00eabe4>] ? unlock_up+0xd4/0x180 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736700]  [<ffffffffc00f1b8d>] ? btrfs_search_slot+0x3ad/0xa00 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736723]  [<ffffffffc00f3a47>] ? btrfs_insert_empty_items+0x67/0xc0 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736748]  [<ffffffffc00ffe24>] ? __btrfs_run_delayed_refs+0xfc4/0x13a0 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736763]  [<ffffffff810164bd>] ? xen_mc_flush+0xdd/0x1d0
Feb 26 20:02:34 backup4 kernel: [2530464.736785]  [<ffffffffc01033ad>] ? btrfs_run_delayed_refs+0x9d/0x2b0 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736811]  [<ffffffffc0119817>] ? btrfs_commit_transaction+0x57/0xa10 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736837]  [<ffffffffc011a266>] ? start_transaction+0x96/0x480 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736861]  [<ffffffffc011464c>] ? transaction_kthread+0x1dc/0x200 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736886]  [<ffffffffc0114470>] ? btrfs_cleanup_transaction+0x590/0x590 [btrfs]
Feb 26 20:02:34 backup4 kernel: [2530464.736901]  [<ffffffff8109be69>] ? kthread+0xd9/0xf0
Feb 26 20:02:34 backup4 kernel: [2530464.736913]  [<ffffffff8109bd90>] ? kthread_park+0x60/0x60
Feb 26 20:02:34 backup4 kernel: [2530464.736926]  [<ffffffff8161f8f7>] ? ret_from_fork+0x57/0x70

It's all kinds of guest kernel, and the processes are basically
anything that tries to access its block devices.

Over in the dom0 at the time, I mostly haven't managed to get logs,
probably because its logging is on the same md device that is having
problems. Some of the servers are fortunate to have their dom0
operating system installed on separate devices to the guest devices,
and on one of those I got this:

Feb 20 00:58:44 talisker kernel: [5876461.472590] INFO: task md5_raid10:226 blocked for more than 120 seconds.
Feb 20 00:58:44 talisker kernel: [5876461.473105]       Not tainted 4.19.0-13-amd64 #1 Debian 4.19.160-2
Feb 20 00:58:44 talisker kernel: [5876461.473523] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Feb 20 00:58:44 talisker kernel: [5876461.473936] md5_raid10      D    0   226      2 0x80000000
Feb 20 00:58:44 talisker kernel: [5876461.474341] Call Trace:
Feb 20 00:58:44 talisker kernel: [5876461.474743]  __schedule+0x29f/0x840
Feb 20 00:58:44 talisker kernel: [5876461.475142]  ? _raw_spin_unlock_irqrestore+0x14/0x20
Feb 20 00:58:44 talisker kernel: [5876461.475554]  schedule+0x28/0x80
Feb 20 00:58:44 talisker kernel: [5876461.475964]  md_super_wait+0x6e/0xa0 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.476372]  ? finish_wait+0x80/0x80
Feb 20 00:58:44 talisker kernel: [5876461.476817]  md_bitmap_wait_writes+0x93/0xa0 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.477504]  ? md_bitmap_get_counter+0x42/0xd0 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.478248]  md_bitmap_daemon_work+0x1f7/0x370 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.478904]  md_check_recovery+0x41/0x530 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.479309]  raid10d+0x62/0x1460 [raid10]
Feb 20 00:58:44 talisker kernel: [5876461.479722]  ? __switch_to_asm+0x41/0x70
Feb 20 00:58:44 talisker kernel: [5876461.480133]  ? finish_task_switch+0x78/0x280
Feb 20 00:58:44 talisker kernel: [5876461.480540]  ? _raw_spin_lock_irqsave+0x15/0x40
Feb 20 00:58:44 talisker kernel: [5876461.480987]  ? lock_timer_base+0x67/0x80
Feb 20 00:58:44 talisker kernel: [5876461.481719]  ? _raw_spin_unlock_irqrestore+0x14/0x20
Feb 20 00:58:44 talisker kernel: [5876461.482358]  ? try_to_del_timer_sync+0x4d/0x80
Feb 20 00:58:44 talisker kernel: [5876461.482768]  ? del_timer_sync+0x37/0x40
Feb 20 00:58:44 talisker kernel: [5876461.483162]  ? schedule_timeout+0x173/0x3b0
Feb 20 00:58:44 talisker kernel: [5876461.483553]  ? md_rdev_init+0xb0/0xb0 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.483944]  ? md_thread+0x94/0x150 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.484345]  ? r10bio_pool_alloc+0x20/0x20 [raid10]
Feb 20 00:58:44 talisker kernel: [5876461.484777]  md_thread+0x94/0x150 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.485500]  ? finish_wait+0x80/0x80
Feb 20 00:58:44 talisker kernel: [5876461.486083]  kthread+0x112/0x130
Feb 20 00:58:44 talisker kernel: [5876461.486479]  ? kthread_bind+0x30/0x30
Feb 20 00:58:44 talisker kernel: [5876461.486870]  ret_from_fork+0x35/0x40
Feb 20 00:58:44 talisker kernel: [5876461.487260] INFO: task 1.xvda-0:4237 blocked for more than 120 seconds.
Feb 20 00:58:44 talisker kernel: [5876461.487644]       Not tainted 4.19.0-13-amd64 #1 Debian 4.19.160-2
Feb 20 00:58:44 talisker kernel: [5876461.488027] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Feb 20 00:58:44 talisker kernel: [5876461.488422] 1.xvda-0        D    0  4237      2 0x80000000
Feb 20 00:58:44 talisker kernel: [5876461.488842] Call Trace:
Feb 20 00:58:44 talisker kernel: [5876461.489530]  __schedule+0x29f/0x840
Feb 20 00:58:44 talisker kernel: [5876461.490149]  ? _raw_spin_unlock_irqrestore+0x14/0x20
Feb 20 00:58:44 talisker kernel: [5876461.490545]  schedule+0x28/0x80
Feb 20 00:58:44 talisker kernel: [5876461.490954]  md_super_wait+0x6e/0xa0 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.491330]  ? finish_wait+0x80/0x80
Feb 20 00:58:44 talisker kernel: [5876461.491708]  md_bitmap_wait_writes+0x93/0xa0 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.492101]  md_bitmap_unplug+0xc5/0x120 [md_mod]
Feb 20 00:58:44 talisker kernel: [5876461.492490]  raid10_unplug+0xd4/0x190 [raid10]
Feb 20 00:58:44 talisker kernel: [5876461.492926]  blk_flush_plug_list+0xcf/0x240
Feb 20 00:58:44 talisker kernel: [5876461.493648]  blk_finish_plug+0x21/0x2e
Feb 20 00:58:44 talisker kernel: [5876461.494277]  dispatch_rw_block_io+0x696/0x990 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.494657]  ? inv_show+0x30/0x30
Feb 20 00:58:44 talisker kernel: [5876461.495043]  __do_block_io_op+0x30f/0x610 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.495458]  ? _raw_spin_unlock_irqrestore+0x14/0x20
Feb 20 00:58:44 talisker kernel: [5876461.495871]  ? try_to_del_timer_sync+0x4d/0x80
Feb 20 00:58:44 talisker kernel: [5876461.496264]  xen_blkif_schedule+0xdb/0x650 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.496784]  ? finish_wait+0x80/0x80
Feb 20 00:58:44 talisker kernel: [5876461.497418]  ? xen_blkif_be_int+0x30/0x30 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.498041]  kthread+0x112/0x130
Feb 20 00:58:44 talisker kernel: [5876461.498668]  ? kthread_bind+0x30/0x30
Feb 20 00:58:44 talisker kernel: [5876461.499309]  ret_from_fork+0x35/0x40
Feb 20 00:58:44 talisker kernel: [5876461.499960] INFO: task 1.xvda-1:4238 blocked for more than 120 seconds.
Feb 20 00:58:44 talisker kernel: [5876461.500518]       Not tainted 4.19.0-13-amd64 #1 Debian 4.19.160-2
Feb 20 00:58:44 talisker kernel: [5876461.500943] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Feb 20 00:58:44 talisker kernel: [5876461.501609] 1.xvda-1        D    0  4238      2 0x80000000
Feb 20 00:58:44 talisker kernel: [5876461.501992] Call Trace:
Feb 20 00:58:44 talisker kernel: [5876461.502372]  __schedule+0x29f/0x840
Feb 20 00:58:44 talisker kernel: [5876461.502747]  schedule+0x28/0x80
Feb 20 00:58:44 talisker kernel: [5876461.503121]  io_schedule+0x12/0x40
Feb 20 00:58:44 talisker kernel: [5876461.503494]  wbt_wait+0x205/0x300
Feb 20 00:58:44 talisker kernel: [5876461.503863]  ? wbt_wait+0x300/0x300
Feb 20 00:58:44 talisker kernel: [5876461.504237]  rq_qos_throttle+0x31/0x40
Feb 20 00:58:44 talisker kernel: [5876461.504637]  blk_mq_make_request+0x111/0x530
Feb 20 00:58:44 talisker kernel: [5876461.505319]  generic_make_request+0x1a4/0x400
Feb 20 00:58:44 talisker kernel: [5876461.505999]  raid10_unplug+0xfd/0x190 [raid10]
Feb 20 00:58:44 talisker kernel: [5876461.506402]  blk_flush_plug_list+0xcf/0x240
Feb 20 00:58:44 talisker kernel: [5876461.506772]  blk_finish_plug+0x21/0x2e
Feb 20 00:58:44 talisker kernel: [5876461.507140]  dispatch_rw_block_io+0x696/0x990 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.507792]  ? inv_show+0x30/0x30
Feb 20 00:58:44 talisker kernel: [5876461.508166]  __do_block_io_op+0x30f/0x610 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.508549]  ? _raw_spin_unlock_irqrestore+0x14/0x20
Feb 20 00:58:44 talisker kernel: [5876461.508967]  ? try_to_del_timer_sync+0x4d/0x80
Feb 20 00:58:44 talisker kernel: [5876461.509673]  xen_blkif_schedule+0xdb/0x650 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.510304]  ? finish_wait+0x80/0x80
Feb 20 00:58:44 talisker kernel: [5876461.510678]  ? xen_blkif_be_int+0x30/0x30 [xen_blkback]
Feb 20 00:58:44 talisker kernel: [5876461.511049]  kthread+0x112/0x130
Feb 20 00:58:44 talisker kernel: [5876461.511413]  ? kthread_bind+0x30/0x30
Feb 20 00:58:44 talisker kernel: [5876461.511776]  ret_from_fork+0x35/0x40

Administrators of the guests notice problems and try to shutdown or
reboot, but that fails because dom0 can't write to its xenstore, so
mostly domains can't be managed after this happens and the server
has to be forcibly rebooted.

These are all using the default scheduler, which I understand since
4.12 is credit2. SMT is enabled and I've limited dom0 to 2 cores,
then pinned dom0 to cores 0 and 1, and pinned all other guests to
their choice out of the remaining cores. That is something I did
fairly recently though; for a long time there was no pinning yet
this still started happening.

In a couple of cases I have found that I've been able to run
"xentop" and see a particular guest doing heavy block device reads.
I've done an "xl destroy" on that guest and then everything has
returned to normal. Unfortunately the times this has happened have
been on dom0s without useful logs. There's just a gap in logs
between when the problems started and when the (apparently)
problematic domU is destroyed. The problematic domU can then be
booted again and life goes on.

So, it could be totally unrelated to Xen, and as I investigate
further I will try different kernels in dom0. But the way that
destroying a domU frees things up makes me wonder if it could be Xen
related, maybe scheduler related? Also, it's always the md device
that the guest block devices are on that is stalled - IO to other
devices in dom0

Are there any hypervisor magic sysrq debug keys that could provide
useful information to you in ruling in / out a Xen issue?

Should I try using the "credit" scheduler (instead of "credit2") at
next boot?

I *think* this has only been seen with kernel version
4.19.0-13-amd64. Some of these servers have now been rebooted into
4.19.0-14-amd64 (the latest available package) due to the issue,
which has not yet re-occurred for them.

If it does re-occur with 4.19.0-14-amd64 what kernel version would
you advise I try out at next reboot so as to take the Debian kernel
out of the picture? I will download an upstream kernel release and
build a Debian package out of it, using my existing kernel config as
a base.

As Debian buster is on the 4.19 series should I pick the latest
4.19.x longterm to be near to it, or the 5.10.x longterm, or the
5.11.x stable?

Thanks,
Andy

