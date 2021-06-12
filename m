Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754713A512A
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jun 2021 00:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140865.260291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsCQC-0002C1-AT; Sat, 12 Jun 2021 22:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140865.260291; Sat, 12 Jun 2021 22:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsCQC-00029A-78; Sat, 12 Jun 2021 22:48:08 +0000
Received: by outflank-mailman (input) for mailman id 140865;
 Sat, 12 Jun 2021 22:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Cnc=LG=gmail.com=rob.townley@srs-us1.protection.inumbo.net>)
 id 1lsCQA-000294-Qs
 for xen-devel@lists.xenproject.org; Sat, 12 Jun 2021 22:48:06 +0000
Received: from mail-ua1-x92c.google.com (unknown [2607:f8b0:4864:20::92c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9da9d0a3-04bc-442a-91b9-ba250310bdad;
 Sat, 12 Jun 2021 22:48:02 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id z13so3974264uai.12
 for <xen-devel@lists.xenproject.org>; Sat, 12 Jun 2021 15:48:02 -0700 (PDT)
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
X-Inumbo-ID: 9da9d0a3-04bc-442a-91b9-ba250310bdad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=B5fDzRRIKZNFUKOQi7cQLXCkNdaHjgDxcL3Q4EG9Kr8=;
        b=VNZoM2r1B42hzWffFSWvmye8ljBkurJE2a6rLrY4nJ+FNgA+s7ezA3vZyE6iK2MTaj
         UZACiL6xqoXuOg53lGTLmEVCL1ysPqYyeH9Z0gQ3NlRB6EqNphkInelfe0iBUe3A/d1B
         SSi1G9Lp/erB+cvKvEUL1BvoEH9F6RLSDgpjNv3rVGgZSw/5vR/Euu2ngoZ2lweMrAog
         GmkJVBsmEEF3wYN8Ng2eYnpWmzIEQwirAgtjiICRUkVbfIIha7Dc/EjsmUA78LYxJ3nw
         16X1yxNm7ndNtpQBo7mBaMWa2Rd1J54DRjPW7JSn9ERZtq1PM/7OM7bz610KmKVECejq
         K5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=B5fDzRRIKZNFUKOQi7cQLXCkNdaHjgDxcL3Q4EG9Kr8=;
        b=VFMjTdNu9Mkq429ETuoRKqNq7C4XQ3Xvp56RaezgRZxWTP81hc4V/dKrC5MmrcnJ8a
         GRIc+vbPxwssVLeWweluo3ycv3thIGNjN3MsR1BZ6FaZ9GKqBomvgF2QnZ2b4k+8RAJU
         PXCQYJ2iJgOXWoJIyyKAkEXsrhAL6SdjzGv4bfht88+zcJ5vOqYLvlZRSH8+vhmyWpAG
         EKAS2dpzbsDeIO710IM/zmALxLhywX2BXiJlvkPml9KKvK0Y1y4CgubWeEdST0W8NDIu
         u6KmeZHMU3Qt9VCy+zOgyjruz6tJasaUO1vdlAcNj4L65fmV8ZOxP3OPKnMhlFLBc9kN
         0wGA==
X-Gm-Message-State: AOAM53203lRGSZIeEpPKYRXGEBFFnsiORyaEuPgbO3wI4JW6zrU3/XOx
	owioQPAsIVOtwnHAwdWbX6kDgiBC6hwKQhtFVvU=
X-Google-Smtp-Source: ABdhPJyQGZEOtOZpSUIEVeCb9KKGkScLYHbb2tcpS731/B9QUMcT+/5xNGVjVl3Lip1MU77a7xugGFJmteQ5ExAAiPQ=
X-Received: by 2002:ab0:a8c:: with SMTP id d12mr8264623uak.47.1623538081621;
 Sat, 12 Jun 2021 15:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210226223927.GQ29212@bitfolk.com> <20210612141132.rjtmvjv6377lz4tl@bitfolk.com>
In-Reply-To: <20210612141132.rjtmvjv6377lz4tl@bitfolk.com>
Reply-To: Rob.Townley@gmail.com
From: Rob Townley <rob.townley@gmail.com>
Date: Sat, 12 Jun 2021 17:47:49 -0500
Message-ID: <CA+VdTb8TQFu81S=s4n26NyBoZ2Lr-XQo6wWBrsN4hsv0_y-gcA@mail.gmail.com>
Subject: Re: dom0 suddenly blocking on all access to md device
To: Andy Smith <andy@strugglers.net>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a269d705c4996af1"

--000000000000a269d705c4996af1
Content-Type: text/plain; charset="UTF-8"

mdadm.conf has email reporting capabilities to alert to failing drives.
Test that you receive emails.

Use mdadm to run tests on the raid.

iostat may indicate a failing drive as well
smartctl -a /dev/


On Sat, Jun 12, 2021 at 9:12 AM Andy Smith <andy@strugglers.net> wrote:

> Hello,
>
> Unfortunately I'm still experiencing this problem as described in
> the earlier email below and I'm running out of ideas for things to
> test / try.
>
> What was fine for a long time (~5 years): Debian jessie dom0 kernel
> 4.9.x with Xen 4.10.
>
> Below issues started happening on same machines once dom0 was
> upgraded to Debian buster 4.19.x kernel (currently 4.19.0-16-amd64)
> and 4.12 hypervisor. Starting around December 2020.
>
> Since then I've also tried going to Xen 4.14.2 (plus latest XSA
> patches up to XSA377) and it's still happening. I've also tried
> switching to "credit" scheduler and that did not make a difference.
> It can be a month or two between incidents although one machine just
> had it happen twice in 3 days. Maybe half a dozen incidents so far
> on different machines, different hardware configs.
>
> Hypervisor command line is:
>
> dom0_mem=4096M dom0_max_vcpus=2 com1=115200,8n1,0x2f8,10 console=com1,vga
> ucode=scan serial_tx_buffer=256k smt=1
>
> There's a serial console but not much interesting is ever seen on
> it. If there are some debug keys you would like to see the output of
> please let me know. Pretty much the only sort of thing that gets
> logged in dom0 is the following and that could just be a symptom.
>
> Jun 12 12:04:40 clockwork kernel: [216427.246183] INFO: task md5_raid1:205
> blocked for more than 120 seconds.
> Jun 12 12:04:40 clockwork kernel: [216427.246995]       Not tainted
> 4.19.0-16-amd64 #1 Debian 4.19.181-1
> Jun 12 12:04:40 clockwork kernel: [216427.247852] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Jun 12 12:04:40 clockwork kernel: [216427.248674] md5_raid1       D 0
>  205      2 0x80000000
> Jun 12 12:04:40 clockwork kernel: [216427.249534] Call Trace:
> Jun 12 12:04:40 clockwork kernel: [216427.250368] __schedule+0x29f/0x840
> Jun 12 12:04:40 clockwork kernel: [216427.251788]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> Jun 12 12:04:40 clockwork kernel: [216427.253078] schedule+0x28/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.253945] md_super_wait+0x6e/0xa0
> [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.254812]  ? finish_wait+0x80/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.256139]
> md_bitmap_wait_writes+0x93/0xa0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.256994]  ?
> md_bitmap_get_counter+0x42/0xd0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.257787]
> md_bitmap_daemon_work+0x1f7/0x370 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.258608]  ?
> md_rdev_init+0xb0/0xb0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.259553]
> md_check_recovery+0x41/0x530 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.260304]  raid1d+0x5c/0xf10
> [raid1]
> Jun 12 12:04:40 clockwork kernel: [216427.261096]  ?
> lock_timer_base+0x67/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.261863]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> Jun 12 12:04:40 clockwork kernel: [216427.262659]  ?
> try_to_del_timer_sync+0x4d/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.263436]  ?
> del_timer_sync+0x37/0x40
> Jun 12 12:04:40 clockwork kernel: [216427.264189]  ?
> schedule_timeout+0x173/0x3b0
> Jun 12 12:04:40 clockwork kernel: [216427.264911]  ?
> md_rdev_init+0xb0/0xb0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.265664]  ? md_thread+0x94/0x150
> [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.266412]  ?
> process_checks+0x4a0/0x4a0 [raid1]
> Jun 12 12:04:40 clockwork kernel: [216427.267124] md_thread+0x94/0x150
> [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.267842]  ? finish_wait+0x80/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.268539] kthread+0x112/0x130
> Jun 12 12:04:40 clockwork kernel: [216427.269231]  ? kthread_bind+0x30/0x30
> Jun 12 12:04:40 clockwork kernel: [216427.269903] ret_from_fork+0x35/0x40
> Jun 12 12:04:40 clockwork kernel: [216427.270590] INFO: task md2_raid1:207
> blocked for more than 120 seconds.
> Jun 12 12:04:40 clockwork kernel: [216427.271260]       Not tainted
> 4.19.0-16-amd64 #1 Debian 4.19.181-1
> Jun 12 12:04:40 clockwork kernel: [216427.271942] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Jun 12 12:04:40 clockwork kernel: [216427.272721] md2_raid1       D 0
>  207      2 0x80000000
> Jun 12 12:04:40 clockwork kernel: [216427.273432] Call Trace:
> Jun 12 12:04:40 clockwork kernel: [216427.274172] __schedule+0x29f/0x840
> Jun 12 12:04:40 clockwork kernel: [216427.274869] schedule+0x28/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.275543] io_schedule+0x12/0x40
> Jun 12 12:04:40 clockwork kernel: [216427.276208] wbt_wait+0x205/0x300
> Jun 12 12:04:40 clockwork kernel: [216427.276861]  ? wbt_wait+0x300/0x300
> Jun 12 12:04:40 clockwork kernel: [216427.277503] rq_qos_throttle+0x31/0x40
> Jun 12 12:04:40 clockwork kernel: [216427.278193]
> blk_mq_make_request+0x111/0x530
> Jun 12 12:04:40 clockwork kernel: [216427.278876]
> generic_make_request+0x1a4/0x400
> Jun 12 12:04:40 clockwork kernel: [216427.279657]  ?
> try_to_wake_up+0x54/0x470
> Jun 12 12:04:40 clockwork kernel: [216427.280400] submit_bio+0x45/0x130
> Jun 12 12:04:40 clockwork kernel: [216427.281136]  ?
> md_super_write.part.63+0x90/0x120 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.281788]
> md_update_sb.part.65+0x3a8/0x8e0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.282480]  ?
> md_rdev_init+0xb0/0xb0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.283106]
> md_check_recovery+0x272/0x530 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.283738]  raid1d+0x5c/0xf10
> [raid1]
> Jun 12 12:04:40 clockwork kernel: [216427.284345]  ? __schedule+0x2a7/0x840
> Jun 12 12:04:40 clockwork kernel: [216427.284939]  ?
> md_rdev_init+0xb0/0xb0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.285522]  ? schedule+0x28/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.286121]  ?
> schedule_timeout+0x26d/0x3b0
> Jun 12 12:04:40 clockwork kernel: [216427.286702]  ? __schedule+0x2a7/0x840
> Jun 12 12:04:40 clockwork kernel: [216427.287279]  ?
> md_rdev_init+0xb0/0xb0 [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.287871]  ? md_thread+0x94/0x150
> [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.288458]  ?
> process_checks+0x4a0/0x4a0 [raid1]
> Jun 12 12:04:40 clockwork kernel: [216427.289062] md_thread+0x94/0x150
> [md_mod]
> Jun 12 12:04:40 clockwork kernel: [216427.289663]  ? finish_wait+0x80/0x80
> Jun 12 12:04:40 clockwork kernel: [216427.290288] kthread+0x112/0x130
> Jun 12 12:04:40 clockwork kernel: [216427.290858]  ? kthread_bind+0x30/0x30
> Jun 12 12:04:40 clockwork kernel: [216427.291433] ret_from_fork+0x35/0x40
>
> What I HAVEN'T yet tried is a much newer kernel. That will probably
> be what I try next having exhausted all ideas about upgrading or
> configuring Xen.
>
> Should I take a kernel from buster-backports which would currently
> be:
>
>
> https://packages.debian.org/buster-backports/linux-image-5.10.0-0.bpo.5-amd64
>
> or should I build a kernel package from a mainline release?
>
> Thanks,
> Andy
>
> On Fri, Feb 26, 2021 at 10:39:27PM +0000, Andy Smith wrote:
> > Hi,
> >
> > I suspect this might be an issue in the dom0 kernel (Debian buster,
> > kernel 4.19.0-13-amd64), but just lately I've been sporadically
> > having issues where dom0 blocks or severely slows down on all access
> > to the particular md device that hosts all domU block devices.
> >
> > Setup in dom0: an md RAID10 that is used as an LVM PV for an LVM volume
> > group, where all domU block devices are LVM logical volumes in that
> > group. So the relevant part of a domU config file might look like:
> >
> > disk = [ "phy:/dev/myvg/domu_debtest1_xvda,xvda,w",
> >          "phy:/dev/myvg/domu_debtest1_xvdb,xvdb,w" ]
> >
> > The guests are mostly PV, a sprinkling of PVH, no HVM.
> >
> > There's 5 of these servers but 3 of them have only recently been
> > upgraded to Xen 4.12.14 (on Debian buster) from Xen 4.10 (on Debian
> > jessie). The fact that all of them have been pretty stable in the
> > past, on differing hardware, makes me discount a hardware issue. The
> > fact that two of them have been buster / 4.12.x for a long time
> > without issue but are also now starting to see this does make me
> > think that it's a recent dom0 kernel issue.
> >
> > When the problem occurs, inside every domU I see things like this:
> >
> > Feb 26 20:02:34 backup4 kernel: [2530464.736085] INFO: task
> btrfs-transacti:333 blocked for more than 120 seconds.
> > Feb 26 20:02:34 backup4 kernel: [2530464.736107]       Not tainted
> 4.9.0-14-amd64 #1 Debian 4.9.246-2
> > Feb 26 20:02:34 backup4 kernel: [2530464.736117] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Feb 26 20:02:34 backup4 kernel: [2530464.736131] btrfs-transacti D    0
>  333      2 0x00000000
> > Feb 26 20:02:34 backup4 kernel: [2530464.736146]  0000000000000246
> ffff8800f4e0c400 0000000000000000 ffff8800f8a7f100
> > Feb 26 20:02:34 backup4 kernel: [2530464.736168]  ffff8800fad18a00
> ffff8800fa7dd000 ffffc90040b2f670 ffffffff8161a979
> > Feb 26 20:02:34 backup4 kernel: [2530464.736188]  ffff8800fa6d0200
> 0000000000000000 ffff8800fad18a00 0000000000000010
> > Feb 26 20:02:34 backup4 kernel: [2530464.736209] Call Trace:
> > Feb 26 20:02:34 backup4 kernel: [2530464.736223]  [<ffffffff8161a979>] ?
> __schedule+0x239/0x6f0
> > Feb 26 20:02:34 backup4 kernel: [2530464.736236]  [<ffffffff8161ae62>] ?
> schedule+0x32/0x80
> > Feb 26 20:02:34 backup4 kernel: [2530464.736248]  [<ffffffff8161e1fd>] ?
> schedule_timeout+0x1dd/0x380
> > Feb 26 20:02:34 backup4 kernel: [2530464.736263]  [<ffffffff8101c201>] ?
> xen_clocksource_get_cycles+0x11/0x20
> > Feb 26 20:02:34 backup4 kernel: [2530464.736275]  [<ffffffff8161a6dd>] ?
> io_schedule_timeout+0x9d/0x100
> > Feb 26 20:02:34 backup4 kernel: [2530464.736289]  [<ffffffff81367964>] ?
> __sbitmap_queue_get+0x24/0x90
> > Feb 26 20:02:34 backup4 kernel: [2530464.736302]  [<ffffffff81317f60>] ?
> bt_get.isra.6+0x160/0x220
> > Feb 26 20:02:34 backup4 kernel: [2530464.736338]  [<ffffffffc0148bf8>] ?
> __btrfs_map_block+0x6c8/0x11d0 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736353]  [<ffffffff810bf010>] ?
> prepare_to_wait_event+0xf0/0xf0
> > Feb 26 20:02:34 backup4 kernel: [2530464.736364]  [<ffffffff813182d3>] ?
> blk_mq_get_tag+0x23/0x90
> > Feb 26 20:02:34 backup4 kernel: [2530464.736377]  [<ffffffff81313b6a>] ?
> __blk_mq_alloc_request+0x1a/0x220
> > Feb 26 20:02:34 backup4 kernel: [2530464.736390]  [<ffffffff81314a39>] ?
> blk_mq_map_request+0xd9/0x170
> > Feb 26 20:02:34 backup4 kernel: [2530464.736402]  [<ffffffff8131726b>] ?
> blk_mq_make_request+0xbb/0x580
> > Feb 26 20:02:34 backup4 kernel: [2530464.736429]  [<ffffffffc0148bf8>] ?
> __btrfs_map_block+0x6c8/0x11d0 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736444]  [<ffffffff8130b0f5>] ?
> generic_make_request+0x115/0x2d0
> > Feb 26 20:02:34 backup4 kernel: [2530464.736456]  [<ffffffff8130b326>] ?
> submit_bio+0x76/0x140
> > Feb 26 20:02:34 backup4 kernel: [2530464.736481]  [<ffffffffc0149d9a>] ?
> btrfs_map_bio+0x19a/0x340 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736505]  [<ffffffffc0111635>] ?
> btree_submit_bio_hook+0xf5/0x110 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736535]  [<ffffffffc0138318>] ?
> submit_one_bio+0x68/0x90 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736561]  [<ffffffffc013fd4d>] ?
> read_extent_buffer_pages+0x1cd/0x300 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736587]  [<ffffffffc010fbe0>] ?
> free_root_pointers+0x60/0x60 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736609]  [<ffffffffc010ff9c>] ?
> btree_read_extent_buffer_pages+0x8c/0x100 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736635]  [<ffffffffc0111814>] ?
> read_tree_block+0x34/0x50 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736655]  [<ffffffffc00ef9f3>] ?
> read_block_for_search.isra.36+0x133/0x320 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736678]  [<ffffffffc00eabe4>] ?
> unlock_up+0xd4/0x180 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736700]  [<ffffffffc00f1b8d>] ?
> btrfs_search_slot+0x3ad/0xa00 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736723]  [<ffffffffc00f3a47>] ?
> btrfs_insert_empty_items+0x67/0xc0 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736748]  [<ffffffffc00ffe24>] ?
> __btrfs_run_delayed_refs+0xfc4/0x13a0 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736763]  [<ffffffff810164bd>] ?
> xen_mc_flush+0xdd/0x1d0
> > Feb 26 20:02:34 backup4 kernel: [2530464.736785]  [<ffffffffc01033ad>] ?
> btrfs_run_delayed_refs+0x9d/0x2b0 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736811]  [<ffffffffc0119817>] ?
> btrfs_commit_transaction+0x57/0xa10 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736837]  [<ffffffffc011a266>] ?
> start_transaction+0x96/0x480 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736861]  [<ffffffffc011464c>] ?
> transaction_kthread+0x1dc/0x200 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736886]  [<ffffffffc0114470>] ?
> btrfs_cleanup_transaction+0x590/0x590 [btrfs]
> > Feb 26 20:02:34 backup4 kernel: [2530464.736901]  [<ffffffff8109be69>] ?
> kthread+0xd9/0xf0
> > Feb 26 20:02:34 backup4 kernel: [2530464.736913]  [<ffffffff8109bd90>] ?
> kthread_park+0x60/0x60
> > Feb 26 20:02:34 backup4 kernel: [2530464.736926]  [<ffffffff8161f8f7>] ?
> ret_from_fork+0x57/0x70
> >
> > It's all kinds of guest kernel, and the processes are basically
> > anything that tries to access its block devices.
> >
> > Over in the dom0 at the time, I mostly haven't managed to get logs,
> > probably because its logging is on the same md device that is having
> > problems. Some of the servers are fortunate to have their dom0
> > operating system installed on separate devices to the guest devices,
> > and on one of those I got this:
> >
> > Feb 20 00:58:44 talisker kernel: [5876461.472590] INFO: task
> md5_raid10:226 blocked for more than 120 seconds.
> > Feb 20 00:58:44 talisker kernel: [5876461.473105]       Not tainted
> 4.19.0-13-amd64 #1 Debian 4.19.160-2
> > Feb 20 00:58:44 talisker kernel: [5876461.473523] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Feb 20 00:58:44 talisker kernel: [5876461.473936] md5_raid10      D
> 0   226      2 0x80000000
> > Feb 20 00:58:44 talisker kernel: [5876461.474341] Call Trace:
> > Feb 20 00:58:44 talisker kernel: [5876461.474743]  __schedule+0x29f/0x840
> > Feb 20 00:58:44 talisker kernel: [5876461.475142]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> > Feb 20 00:58:44 talisker kernel: [5876461.475554]  schedule+0x28/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.475964]
> md_super_wait+0x6e/0xa0 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.476372]  ?
> finish_wait+0x80/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.476817]
> md_bitmap_wait_writes+0x93/0xa0 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.477504]  ?
> md_bitmap_get_counter+0x42/0xd0 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.478248]
> md_bitmap_daemon_work+0x1f7/0x370 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.478904]
> md_check_recovery+0x41/0x530 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.479309]  raid10d+0x62/0x1460
> [raid10]
> > Feb 20 00:58:44 talisker kernel: [5876461.479722]  ?
> __switch_to_asm+0x41/0x70
> > Feb 20 00:58:44 talisker kernel: [5876461.480133]  ?
> finish_task_switch+0x78/0x280
> > Feb 20 00:58:44 talisker kernel: [5876461.480540]  ?
> _raw_spin_lock_irqsave+0x15/0x40
> > Feb 20 00:58:44 talisker kernel: [5876461.480987]  ?
> lock_timer_base+0x67/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.481719]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> > Feb 20 00:58:44 talisker kernel: [5876461.482358]  ?
> try_to_del_timer_sync+0x4d/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.482768]  ?
> del_timer_sync+0x37/0x40
> > Feb 20 00:58:44 talisker kernel: [5876461.483162]  ?
> schedule_timeout+0x173/0x3b0
> > Feb 20 00:58:44 talisker kernel: [5876461.483553]  ?
> md_rdev_init+0xb0/0xb0 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.483944]  ?
> md_thread+0x94/0x150 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.484345]  ?
> r10bio_pool_alloc+0x20/0x20 [raid10]
> > Feb 20 00:58:44 talisker kernel: [5876461.484777]  md_thread+0x94/0x150
> [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.485500]  ?
> finish_wait+0x80/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.486083]  kthread+0x112/0x130
> > Feb 20 00:58:44 talisker kernel: [5876461.486479]  ?
> kthread_bind+0x30/0x30
> > Feb 20 00:58:44 talisker kernel: [5876461.486870]
> ret_from_fork+0x35/0x40
> > Feb 20 00:58:44 talisker kernel: [5876461.487260] INFO: task
> 1.xvda-0:4237 blocked for more than 120 seconds.
> > Feb 20 00:58:44 talisker kernel: [5876461.487644]       Not tainted
> 4.19.0-13-amd64 #1 Debian 4.19.160-2
> > Feb 20 00:58:44 talisker kernel: [5876461.488027] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Feb 20 00:58:44 talisker kernel: [5876461.488422] 1.xvda-0        D
> 0  4237      2 0x80000000
> > Feb 20 00:58:44 talisker kernel: [5876461.488842] Call Trace:
> > Feb 20 00:58:44 talisker kernel: [5876461.489530]  __schedule+0x29f/0x840
> > Feb 20 00:58:44 talisker kernel: [5876461.490149]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> > Feb 20 00:58:44 talisker kernel: [5876461.490545]  schedule+0x28/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.490954]
> md_super_wait+0x6e/0xa0 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.491330]  ?
> finish_wait+0x80/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.491708]
> md_bitmap_wait_writes+0x93/0xa0 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.492101]
> md_bitmap_unplug+0xc5/0x120 [md_mod]
> > Feb 20 00:58:44 talisker kernel: [5876461.492490]
> raid10_unplug+0xd4/0x190 [raid10]
> > Feb 20 00:58:44 talisker kernel: [5876461.492926]
> blk_flush_plug_list+0xcf/0x240
> > Feb 20 00:58:44 talisker kernel: [5876461.493648]
> blk_finish_plug+0x21/0x2e
> > Feb 20 00:58:44 talisker kernel: [5876461.494277]
> dispatch_rw_block_io+0x696/0x990 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.494657]  ? inv_show+0x30/0x30
> > Feb 20 00:58:44 talisker kernel: [5876461.495043]
> __do_block_io_op+0x30f/0x610 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.495458]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> > Feb 20 00:58:44 talisker kernel: [5876461.495871]  ?
> try_to_del_timer_sync+0x4d/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.496264]
> xen_blkif_schedule+0xdb/0x650 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.496784]  ?
> finish_wait+0x80/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.497418]  ?
> xen_blkif_be_int+0x30/0x30 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.498041]  kthread+0x112/0x130
> > Feb 20 00:58:44 talisker kernel: [5876461.498668]  ?
> kthread_bind+0x30/0x30
> > Feb 20 00:58:44 talisker kernel: [5876461.499309]
> ret_from_fork+0x35/0x40
> > Feb 20 00:58:44 talisker kernel: [5876461.499960] INFO: task
> 1.xvda-1:4238 blocked for more than 120 seconds.
> > Feb 20 00:58:44 talisker kernel: [5876461.500518]       Not tainted
> 4.19.0-13-amd64 #1 Debian 4.19.160-2
> > Feb 20 00:58:44 talisker kernel: [5876461.500943] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Feb 20 00:58:44 talisker kernel: [5876461.501609] 1.xvda-1        D
> 0  4238      2 0x80000000
> > Feb 20 00:58:44 talisker kernel: [5876461.501992] Call Trace:
> > Feb 20 00:58:44 talisker kernel: [5876461.502372]  __schedule+0x29f/0x840
> > Feb 20 00:58:44 talisker kernel: [5876461.502747]  schedule+0x28/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.503121]  io_schedule+0x12/0x40
> > Feb 20 00:58:44 talisker kernel: [5876461.503494]  wbt_wait+0x205/0x300
> > Feb 20 00:58:44 talisker kernel: [5876461.503863]  ? wbt_wait+0x300/0x300
> > Feb 20 00:58:44 talisker kernel: [5876461.504237]
> rq_qos_throttle+0x31/0x40
> > Feb 20 00:58:44 talisker kernel: [5876461.504637]
> blk_mq_make_request+0x111/0x530
> > Feb 20 00:58:44 talisker kernel: [5876461.505319]
> generic_make_request+0x1a4/0x400
> > Feb 20 00:58:44 talisker kernel: [5876461.505999]
> raid10_unplug+0xfd/0x190 [raid10]
> > Feb 20 00:58:44 talisker kernel: [5876461.506402]
> blk_flush_plug_list+0xcf/0x240
> > Feb 20 00:58:44 talisker kernel: [5876461.506772]
> blk_finish_plug+0x21/0x2e
> > Feb 20 00:58:44 talisker kernel: [5876461.507140]
> dispatch_rw_block_io+0x696/0x990 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.507792]  ? inv_show+0x30/0x30
> > Feb 20 00:58:44 talisker kernel: [5876461.508166]
> __do_block_io_op+0x30f/0x610 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.508549]  ?
> _raw_spin_unlock_irqrestore+0x14/0x20
> > Feb 20 00:58:44 talisker kernel: [5876461.508967]  ?
> try_to_del_timer_sync+0x4d/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.509673]
> xen_blkif_schedule+0xdb/0x650 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.510304]  ?
> finish_wait+0x80/0x80
> > Feb 20 00:58:44 talisker kernel: [5876461.510678]  ?
> xen_blkif_be_int+0x30/0x30 [xen_blkback]
> > Feb 20 00:58:44 talisker kernel: [5876461.511049]  kthread+0x112/0x130
> > Feb 20 00:58:44 talisker kernel: [5876461.511413]  ?
> kthread_bind+0x30/0x30
> > Feb 20 00:58:44 talisker kernel: [5876461.511776]
> ret_from_fork+0x35/0x40
> >
> > Administrators of the guests notice problems and try to shutdown or
> > reboot, but that fails because dom0 can't write to its xenstore, so
> > mostly domains can't be managed after this happens and the server
> > has to be forcibly rebooted.
> >
> > These are all using the default scheduler, which I understand since
> > 4.12 is credit2. SMT is enabled and I've limited dom0 to 2 cores,
> > then pinned dom0 to cores 0 and 1, and pinned all other guests to
> > their choice out of the remaining cores. That is something I did
> > fairly recently though; for a long time there was no pinning yet
> > this still started happening.
> >
> > In a couple of cases I have found that I've been able to run
> > "xentop" and see a particular guest doing heavy block device reads.
> > I've done an "xl destroy" on that guest and then everything has
> > returned to normal. Unfortunately the times this has happened have
> > been on dom0s without useful logs. There's just a gap in logs
> > between when the problems started and when the (apparently)
> > problematic domU is destroyed. The problematic domU can then be
> > booted again and life goes on.
> >
> > So, it could be totally unrelated to Xen, and as I investigate
> > further I will try different kernels in dom0. But the way that
> > destroying a domU frees things up makes me wonder if it could be Xen
> > related, maybe scheduler related? Also, it's always the md device
> > that the guest block devices are on that is stalled - IO to other
> > devices in dom0
> >
> > Are there any hypervisor magic sysrq debug keys that could provide
> > useful information to you in ruling in / out a Xen issue?
> >
> > Should I try using the "credit" scheduler (instead of "credit2") at
> > next boot?
> >
> > I *think* this has only been seen with kernel version
> > 4.19.0-13-amd64. Some of these servers have now been rebooted into
> > 4.19.0-14-amd64 (the latest available package) due to the issue,
> > which has not yet re-occurred for them.
> >
> > If it does re-occur with 4.19.0-14-amd64 what kernel version would
> > you advise I try out at next reboot so as to take the Debian kernel
> > out of the picture? I will download an upstream kernel release and
> > build a Debian package out of it, using my existing kernel config as
> > a base.
> >
> > As Debian buster is on the 4.19 series should I pick the latest
> > 4.19.x longterm to be near to it, or the 5.10.x longterm, or the
> > 5.11.x stable?
> >
> > Thanks,
> > Andy
>
>

--000000000000a269d705c4996af1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">mdadm.conf has email reporting capabilities to alert=
 to failing drives.=C2=A0 Test that you receive emails. =C2=A0=C2=A0</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Use mdadm to run tests on the =
raid.</div><div dir=3D"auto"><br></div><div dir=3D"auto">iostat may indicat=
e a failing drive as well</div><div dir=3D"auto">smartctl -a /dev/ =C2=A0=
=C2=A0</div></div><div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></=
div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, Jun 12, 2021 at 9:12 AM Andy Smith &lt;<a href=3D"mailto:andy@strugg=
lers.net" target=3D"_blank">andy@strugglers.net</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hello,<br>
<br>
Unfortunately I&#39;m still experiencing this problem as described in<br>
the earlier email below and I&#39;m running out of ideas for things to<br>
test / try.<br>
<br>
What was fine for a long time (~5 years): Debian jessie dom0 kernel<br>
4.9.x with Xen 4.10.<br>
<br>
Below issues started happening on same machines once dom0 was<br>
upgraded to Debian buster 4.19.x kernel (currently 4.19.0-16-amd64)<br>
and 4.12 hypervisor. Starting around December 2020.<br>
<br>
Since then I&#39;ve also tried going to Xen 4.14.2 (plus latest XSA<br>
patches up to XSA377) and it&#39;s still happening. I&#39;ve also tried<br>
switching to &quot;credit&quot; scheduler and that did not make a differenc=
e.<br>
It can be a month or two between incidents although one machine just<br>
had it happen twice in 3 days. Maybe half a dozen incidents so far<br>
on different machines, different hardware configs.<br>
<br>
Hypervisor command line is:<br>
<br>
dom0_mem=3D4096M dom0_max_vcpus=3D2 com1=3D115200,8n1,0x2f8,10 console=3Dco=
m1,vga ucode=3Dscan serial_tx_buffer=3D256k smt=3D1<br>
<br>
There&#39;s a serial console but not much interesting is ever seen on<br>
it. If there are some debug keys you would like to see the output of<br>
please let me know. Pretty much the only sort of thing that gets<br>
logged in dom0 is the following and that could just be a symptom.<br>
<br>
Jun 12 12:04:40 clockwork kernel: [216427.246183] INFO: task md5_raid1:205 =
blocked for more than 120 seconds.<br>
Jun 12 12:04:40 clockwork kernel: [216427.246995]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0Not tainted 4.19.0-16-amd64 #1 Debian 4.19.181-1<br>
Jun 12 12:04:40 clockwork kernel: [216427.247852] &quot;echo 0 &gt; /proc/s=
ys/kernel/hung_task_timeout_secs&quot; disables this message.<br>
Jun 12 12:04:40 clockwork kernel: [216427.248674] md5_raid1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0D 0=C2=A0 =C2=A0205=C2=A0 =C2=A0 =C2=A0 2 0x80000000<br>
Jun 12 12:04:40 clockwork kernel: [216427.249534] Call Trace:<br>
Jun 12 12:04:40 clockwork kernel: [216427.250368] __schedule+0x29f/0x840<br=
>
Jun 12 12:04:40 clockwork kernel: [216427.251788]=C2=A0 ? _raw_spin_unlock_=
irqrestore+0x14/0x20<br>
Jun 12 12:04:40 clockwork kernel: [216427.253078] schedule+0x28/0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.253945] md_super_wait+0x6e/0xa0 [=
md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.254812]=C2=A0 ? finish_wait+0x80/=
0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.256139] md_bitmap_wait_writes+0x9=
3/0xa0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.256994]=C2=A0 ? md_bitmap_get_cou=
nter+0x42/0xd0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.257787] md_bitmap_daemon_work+0x1=
f7/0x370 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.258608]=C2=A0 ? md_rdev_init+0xb0=
/0xb0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.259553] md_check_recovery+0x41/0x=
530 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.260304]=C2=A0 raid1d+0x5c/0xf10 [=
raid1]<br>
Jun 12 12:04:40 clockwork kernel: [216427.261096]=C2=A0 ? lock_timer_base+0=
x67/0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.261863]=C2=A0 ? _raw_spin_unlock_=
irqrestore+0x14/0x20<br>
Jun 12 12:04:40 clockwork kernel: [216427.262659]=C2=A0 ? try_to_del_timer_=
sync+0x4d/0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.263436]=C2=A0 ? del_timer_sync+0x=
37/0x40<br>
Jun 12 12:04:40 clockwork kernel: [216427.264189]=C2=A0 ? schedule_timeout+=
0x173/0x3b0<br>
Jun 12 12:04:40 clockwork kernel: [216427.264911]=C2=A0 ? md_rdev_init+0xb0=
/0xb0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.265664]=C2=A0 ? md_thread+0x94/0x=
150 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.266412]=C2=A0 ? process_checks+0x=
4a0/0x4a0 [raid1]<br>
Jun 12 12:04:40 clockwork kernel: [216427.267124] md_thread+0x94/0x150 [md_=
mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.267842]=C2=A0 ? finish_wait+0x80/=
0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.268539] kthread+0x112/0x130<br>
Jun 12 12:04:40 clockwork kernel: [216427.269231]=C2=A0 ? kthread_bind+0x30=
/0x30<br>
Jun 12 12:04:40 clockwork kernel: [216427.269903] ret_from_fork+0x35/0x40<b=
r>
Jun 12 12:04:40 clockwork kernel: [216427.270590] INFO: task md2_raid1:207 =
blocked for more than 120 seconds.<br>
Jun 12 12:04:40 clockwork kernel: [216427.271260]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0Not tainted 4.19.0-16-amd64 #1 Debian 4.19.181-1<br>
Jun 12 12:04:40 clockwork kernel: [216427.271942] &quot;echo 0 &gt; /proc/s=
ys/kernel/hung_task_timeout_secs&quot; disables this message.<br>
Jun 12 12:04:40 clockwork kernel: [216427.272721] md2_raid1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0D 0=C2=A0 =C2=A0207=C2=A0 =C2=A0 =C2=A0 2 0x80000000<br>
Jun 12 12:04:40 clockwork kernel: [216427.273432] Call Trace:<br>
Jun 12 12:04:40 clockwork kernel: [216427.274172] __schedule+0x29f/0x840<br=
>
Jun 12 12:04:40 clockwork kernel: [216427.274869] schedule+0x28/0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.275543] io_schedule+0x12/0x40<br>
Jun 12 12:04:40 clockwork kernel: [216427.276208] wbt_wait+0x205/0x300<br>
Jun 12 12:04:40 clockwork kernel: [216427.276861]=C2=A0 ? wbt_wait+0x300/0x=
300<br>
Jun 12 12:04:40 clockwork kernel: [216427.277503] rq_qos_throttle+0x31/0x40=
<br>
Jun 12 12:04:40 clockwork kernel: [216427.278193] blk_mq_make_request+0x111=
/0x530<br>
Jun 12 12:04:40 clockwork kernel: [216427.278876] generic_make_request+0x1a=
4/0x400<br>
Jun 12 12:04:40 clockwork kernel: [216427.279657]=C2=A0 ? try_to_wake_up+0x=
54/0x470<br>
Jun 12 12:04:40 clockwork kernel: [216427.280400] submit_bio+0x45/0x130<br>
Jun 12 12:04:40 clockwork kernel: [216427.281136]=C2=A0 ? md_super_write.pa=
rt.63+0x90/0x120 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.281788] md_update_sb.part.65+0x3a=
8/0x8e0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.282480]=C2=A0 ? md_rdev_init+0xb0=
/0xb0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.283106] md_check_recovery+0x272/0=
x530 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.283738]=C2=A0 raid1d+0x5c/0xf10 [=
raid1]<br>
Jun 12 12:04:40 clockwork kernel: [216427.284345]=C2=A0 ? __schedule+0x2a7/=
0x840<br>
Jun 12 12:04:40 clockwork kernel: [216427.284939]=C2=A0 ? md_rdev_init+0xb0=
/0xb0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.285522]=C2=A0 ? schedule+0x28/0x8=
0<br>
Jun 12 12:04:40 clockwork kernel: [216427.286121]=C2=A0 ? schedule_timeout+=
0x26d/0x3b0<br>
Jun 12 12:04:40 clockwork kernel: [216427.286702]=C2=A0 ? __schedule+0x2a7/=
0x840<br>
Jun 12 12:04:40 clockwork kernel: [216427.287279]=C2=A0 ? md_rdev_init+0xb0=
/0xb0 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.287871]=C2=A0 ? md_thread+0x94/0x=
150 [md_mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.288458]=C2=A0 ? process_checks+0x=
4a0/0x4a0 [raid1]<br>
Jun 12 12:04:40 clockwork kernel: [216427.289062] md_thread+0x94/0x150 [md_=
mod]<br>
Jun 12 12:04:40 clockwork kernel: [216427.289663]=C2=A0 ? finish_wait+0x80/=
0x80<br>
Jun 12 12:04:40 clockwork kernel: [216427.290288] kthread+0x112/0x130<br>
Jun 12 12:04:40 clockwork kernel: [216427.290858]=C2=A0 ? kthread_bind+0x30=
/0x30<br>
Jun 12 12:04:40 clockwork kernel: [216427.291433] ret_from_fork+0x35/0x40<b=
r>
<br>
What I HAVEN&#39;T yet tried is a much newer kernel. That will probably<br>
be what I try next having exhausted all ideas about upgrading or<br>
configuring Xen.<br>
<br>
Should I take a kernel from buster-backports which would currently<br>
be:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://packages.debian.org/buster-backports/linux=
-image-5.10.0-0.bpo.5-amd64" rel=3D"noreferrer" target=3D"_blank">https://p=
ackages.debian.org/buster-backports/linux-image-5.10.0-0.bpo.5-amd64</a><br=
>
<br>
or should I build a kernel package from a mainline release?<br>
<br>
Thanks,<br>
Andy<br>
<br>
On Fri, Feb 26, 2021 at 10:39:27PM +0000, Andy Smith wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I suspect this might be an issue in the dom0 kernel (Debian buster,<br=
>
&gt; kernel 4.19.0-13-amd64), but just lately I&#39;ve been sporadically<br=
>
&gt; having issues where dom0 blocks or severely slows down on all access<b=
r>
&gt; to the particular md device that hosts all domU block devices.<br>
&gt; <br>
&gt; Setup in dom0: an md RAID10 that is used as an LVM PV for an LVM volum=
e<br>
&gt; group, where all domU block devices are LVM logical volumes in that<br=
>
&gt; group. So the relevant part of a domU config file might look like:<br>
&gt; <br>
&gt; disk =3D [ &quot;phy:/dev/myvg/domu_debtest1_xvda,xvda,w&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;phy:/dev/myvg/domu_debtest1_xv=
db,xvdb,w&quot; ]<br>
&gt; <br>
&gt; The guests are mostly PV, a sprinkling of PVH, no HVM.<br>
&gt; <br>
&gt; There&#39;s 5 of these servers but 3 of them have only recently been<b=
r>
&gt; upgraded to Xen 4.12.14 (on Debian buster) from Xen 4.10 (on Debian<br=
>
&gt; jessie). The fact that all of them have been pretty stable in the<br>
&gt; past, on differing hardware, makes me discount a hardware issue. The<b=
r>
&gt; fact that two of them have been buster / 4.12.x for a long time<br>
&gt; without issue but are also now starting to see this does make me<br>
&gt; think that it&#39;s a recent dom0 kernel issue.<br>
&gt; <br>
&gt; When the problem occurs, inside every domU I see things like this:<br>
&gt; <br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736085] INFO: task btrfs-tran=
sacti:333 blocked for more than 120 seconds.<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736107]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Not tainted 4.9.0-14-amd64 #1 Debian 4.9.246-2<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736117] &quot;echo 0 &gt; /pr=
oc/sys/kernel/hung_task_timeout_secs&quot; disables this message.<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736131] btrfs-transacti D=C2=
=A0 =C2=A0 0=C2=A0 =C2=A0333=C2=A0 =C2=A0 =C2=A0 2 0x00000000<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736146]=C2=A0 000000000000024=
6 ffff8800f4e0c400 0000000000000000 ffff8800f8a7f100<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736168]=C2=A0 ffff8800fad18a0=
0 ffff8800fa7dd000 ffffc90040b2f670 ffffffff8161a979<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736188]=C2=A0 ffff8800fa6d020=
0 0000000000000000 ffff8800fad18a00 0000000000000010<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736209] Call Trace:<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736223]=C2=A0 [&lt;ffffffff81=
61a979&gt;] ? __schedule+0x239/0x6f0<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736236]=C2=A0 [&lt;ffffffff81=
61ae62&gt;] ? schedule+0x32/0x80<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736248]=C2=A0 [&lt;ffffffff81=
61e1fd&gt;] ? schedule_timeout+0x1dd/0x380<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736263]=C2=A0 [&lt;ffffffff81=
01c201&gt;] ? xen_clocksource_get_cycles+0x11/0x20<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736275]=C2=A0 [&lt;ffffffff81=
61a6dd&gt;] ? io_schedule_timeout+0x9d/0x100<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736289]=C2=A0 [&lt;ffffffff81=
367964&gt;] ? __sbitmap_queue_get+0x24/0x90<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736302]=C2=A0 [&lt;ffffffff81=
317f60&gt;] ? bt_get.isra.6+0x160/0x220<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736338]=C2=A0 [&lt;ffffffffc0=
148bf8&gt;] ? __btrfs_map_block+0x6c8/0x11d0 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736353]=C2=A0 [&lt;ffffffff81=
0bf010&gt;] ? prepare_to_wait_event+0xf0/0xf0<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736364]=C2=A0 [&lt;ffffffff81=
3182d3&gt;] ? blk_mq_get_tag+0x23/0x90<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736377]=C2=A0 [&lt;ffffffff81=
313b6a&gt;] ? __blk_mq_alloc_request+0x1a/0x220<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736390]=C2=A0 [&lt;ffffffff81=
314a39&gt;] ? blk_mq_map_request+0xd9/0x170<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736402]=C2=A0 [&lt;ffffffff81=
31726b&gt;] ? blk_mq_make_request+0xbb/0x580<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736429]=C2=A0 [&lt;ffffffffc0=
148bf8&gt;] ? __btrfs_map_block+0x6c8/0x11d0 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736444]=C2=A0 [&lt;ffffffff81=
30b0f5&gt;] ? generic_make_request+0x115/0x2d0<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736456]=C2=A0 [&lt;ffffffff81=
30b326&gt;] ? submit_bio+0x76/0x140<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736481]=C2=A0 [&lt;ffffffffc0=
149d9a&gt;] ? btrfs_map_bio+0x19a/0x340 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736505]=C2=A0 [&lt;ffffffffc0=
111635&gt;] ? btree_submit_bio_hook+0xf5/0x110 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736535]=C2=A0 [&lt;ffffffffc0=
138318&gt;] ? submit_one_bio+0x68/0x90 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736561]=C2=A0 [&lt;ffffffffc0=
13fd4d&gt;] ? read_extent_buffer_pages+0x1cd/0x300 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736587]=C2=A0 [&lt;ffffffffc0=
10fbe0&gt;] ? free_root_pointers+0x60/0x60 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736609]=C2=A0 [&lt;ffffffffc0=
10ff9c&gt;] ? btree_read_extent_buffer_pages+0x8c/0x100 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736635]=C2=A0 [&lt;ffffffffc0=
111814&gt;] ? read_tree_block+0x34/0x50 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736655]=C2=A0 [&lt;ffffffffc0=
0ef9f3&gt;] ? read_block_for_search.isra.36+0x133/0x320 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736678]=C2=A0 [&lt;ffffffffc0=
0eabe4&gt;] ? unlock_up+0xd4/0x180 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736700]=C2=A0 [&lt;ffffffffc0=
0f1b8d&gt;] ? btrfs_search_slot+0x3ad/0xa00 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736723]=C2=A0 [&lt;ffffffffc0=
0f3a47&gt;] ? btrfs_insert_empty_items+0x67/0xc0 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736748]=C2=A0 [&lt;ffffffffc0=
0ffe24&gt;] ? __btrfs_run_delayed_refs+0xfc4/0x13a0 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736763]=C2=A0 [&lt;ffffffff81=
0164bd&gt;] ? xen_mc_flush+0xdd/0x1d0<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736785]=C2=A0 [&lt;ffffffffc0=
1033ad&gt;] ? btrfs_run_delayed_refs+0x9d/0x2b0 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736811]=C2=A0 [&lt;ffffffffc0=
119817&gt;] ? btrfs_commit_transaction+0x57/0xa10 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736837]=C2=A0 [&lt;ffffffffc0=
11a266&gt;] ? start_transaction+0x96/0x480 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736861]=C2=A0 [&lt;ffffffffc0=
11464c&gt;] ? transaction_kthread+0x1dc/0x200 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736886]=C2=A0 [&lt;ffffffffc0=
114470&gt;] ? btrfs_cleanup_transaction+0x590/0x590 [btrfs]<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736901]=C2=A0 [&lt;ffffffff81=
09be69&gt;] ? kthread+0xd9/0xf0<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736913]=C2=A0 [&lt;ffffffff81=
09bd90&gt;] ? kthread_park+0x60/0x60<br>
&gt; Feb 26 20:02:34 backup4 kernel: [2530464.736926]=C2=A0 [&lt;ffffffff81=
61f8f7&gt;] ? ret_from_fork+0x57/0x70<br>
&gt; <br>
&gt; It&#39;s all kinds of guest kernel, and the processes are basically<br=
>
&gt; anything that tries to access its block devices.<br>
&gt; <br>
&gt; Over in the dom0 at the time, I mostly haven&#39;t managed to get logs=
,<br>
&gt; probably because its logging is on the same md device that is having<b=
r>
&gt; problems. Some of the servers are fortunate to have their dom0<br>
&gt; operating system installed on separate devices to the guest devices,<b=
r>
&gt; and on one of those I got this:<br>
&gt; <br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.472590] INFO: task md5_raid1=
0:226 blocked for more than 120 seconds.<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.473105]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Not tainted 4.19.0-13-amd64 #1 Debian 4.19.160-2<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.473523] &quot;echo 0 &gt; /p=
roc/sys/kernel/hung_task_timeout_secs&quot; disables this message.<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.473936] md5_raid10=C2=A0 =C2=
=A0 =C2=A0 D=C2=A0 =C2=A0 0=C2=A0 =C2=A0226=C2=A0 =C2=A0 =C2=A0 2 0x8000000=
0<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.474341] Call Trace:<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.474743]=C2=A0 __schedule+0x2=
9f/0x840<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.475142]=C2=A0 ? _raw_spin_un=
lock_irqrestore+0x14/0x20<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.475554]=C2=A0 schedule+0x28/=
0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.475964]=C2=A0 md_super_wait+=
0x6e/0xa0 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.476372]=C2=A0 ? finish_wait+=
0x80/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.476817]=C2=A0 md_bitmap_wait=
_writes+0x93/0xa0 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.477504]=C2=A0 ? md_bitmap_ge=
t_counter+0x42/0xd0 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.478248]=C2=A0 md_bitmap_daem=
on_work+0x1f7/0x370 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.478904]=C2=A0 md_check_recov=
ery+0x41/0x530 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.479309]=C2=A0 raid10d+0x62/0=
x1460 [raid10]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.479722]=C2=A0 ? __switch_to_=
asm+0x41/0x70<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.480133]=C2=A0 ? finish_task_=
switch+0x78/0x280<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.480540]=C2=A0 ? _raw_spin_lo=
ck_irqsave+0x15/0x40<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.480987]=C2=A0 ? lock_timer_b=
ase+0x67/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.481719]=C2=A0 ? _raw_spin_un=
lock_irqrestore+0x14/0x20<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.482358]=C2=A0 ? try_to_del_t=
imer_sync+0x4d/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.482768]=C2=A0 ? del_timer_sy=
nc+0x37/0x40<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.483162]=C2=A0 ? schedule_tim=
eout+0x173/0x3b0<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.483553]=C2=A0 ? md_rdev_init=
+0xb0/0xb0 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.483944]=C2=A0 ? md_thread+0x=
94/0x150 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.484345]=C2=A0 ? r10bio_pool_=
alloc+0x20/0x20 [raid10]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.484777]=C2=A0 md_thread+0x94=
/0x150 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.485500]=C2=A0 ? finish_wait+=
0x80/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.486083]=C2=A0 kthread+0x112/=
0x130<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.486479]=C2=A0 ? kthread_bind=
+0x30/0x30<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.486870]=C2=A0 ret_from_fork+=
0x35/0x40<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.487260] INFO: task 1.xvda-0:=
4237 blocked for more than 120 seconds.<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.487644]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Not tainted 4.19.0-13-amd64 #1 Debian 4.19.160-2<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.488027] &quot;echo 0 &gt; /p=
roc/sys/kernel/hung_task_timeout_secs&quot; disables this message.<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.488422] 1.xvda-0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 D=C2=A0 =C2=A0 0=C2=A0 4237=C2=A0 =C2=A0 =C2=A0 2 0x80000=
000<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.488842] Call Trace:<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.489530]=C2=A0 __schedule+0x2=
9f/0x840<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.490149]=C2=A0 ? _raw_spin_un=
lock_irqrestore+0x14/0x20<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.490545]=C2=A0 schedule+0x28/=
0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.490954]=C2=A0 md_super_wait+=
0x6e/0xa0 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.491330]=C2=A0 ? finish_wait+=
0x80/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.491708]=C2=A0 md_bitmap_wait=
_writes+0x93/0xa0 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.492101]=C2=A0 md_bitmap_unpl=
ug+0xc5/0x120 [md_mod]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.492490]=C2=A0 raid10_unplug+=
0xd4/0x190 [raid10]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.492926]=C2=A0 blk_flush_plug=
_list+0xcf/0x240<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.493648]=C2=A0 blk_finish_plu=
g+0x21/0x2e<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.494277]=C2=A0 dispatch_rw_bl=
ock_io+0x696/0x990 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.494657]=C2=A0 ? inv_show+0x3=
0/0x30<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.495043]=C2=A0 __do_block_io_=
op+0x30f/0x610 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.495458]=C2=A0 ? _raw_spin_un=
lock_irqrestore+0x14/0x20<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.495871]=C2=A0 ? try_to_del_t=
imer_sync+0x4d/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.496264]=C2=A0 xen_blkif_sche=
dule+0xdb/0x650 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.496784]=C2=A0 ? finish_wait+=
0x80/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.497418]=C2=A0 ? xen_blkif_be=
_int+0x30/0x30 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.498041]=C2=A0 kthread+0x112/=
0x130<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.498668]=C2=A0 ? kthread_bind=
+0x30/0x30<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.499309]=C2=A0 ret_from_fork+=
0x35/0x40<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.499960] INFO: task 1.xvda-1:=
4238 blocked for more than 120 seconds.<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.500518]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Not tainted 4.19.0-13-amd64 #1 Debian 4.19.160-2<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.500943] &quot;echo 0 &gt; /p=
roc/sys/kernel/hung_task_timeout_secs&quot; disables this message.<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.501609] 1.xvda-1=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 D=C2=A0 =C2=A0 0=C2=A0 4238=C2=A0 =C2=A0 =C2=A0 2 0x80000=
000<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.501992] Call Trace:<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.502372]=C2=A0 __schedule+0x2=
9f/0x840<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.502747]=C2=A0 schedule+0x28/=
0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.503121]=C2=A0 io_schedule+0x=
12/0x40<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.503494]=C2=A0 wbt_wait+0x205=
/0x300<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.503863]=C2=A0 ? wbt_wait+0x3=
00/0x300<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.504237]=C2=A0 rq_qos_throttl=
e+0x31/0x40<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.504637]=C2=A0 blk_mq_make_re=
quest+0x111/0x530<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.505319]=C2=A0 generic_make_r=
equest+0x1a4/0x400<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.505999]=C2=A0 raid10_unplug+=
0xfd/0x190 [raid10]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.506402]=C2=A0 blk_flush_plug=
_list+0xcf/0x240<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.506772]=C2=A0 blk_finish_plu=
g+0x21/0x2e<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.507140]=C2=A0 dispatch_rw_bl=
ock_io+0x696/0x990 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.507792]=C2=A0 ? inv_show+0x3=
0/0x30<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.508166]=C2=A0 __do_block_io_=
op+0x30f/0x610 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.508549]=C2=A0 ? _raw_spin_un=
lock_irqrestore+0x14/0x20<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.508967]=C2=A0 ? try_to_del_t=
imer_sync+0x4d/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.509673]=C2=A0 xen_blkif_sche=
dule+0xdb/0x650 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.510304]=C2=A0 ? finish_wait+=
0x80/0x80<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.510678]=C2=A0 ? xen_blkif_be=
_int+0x30/0x30 [xen_blkback]<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.511049]=C2=A0 kthread+0x112/=
0x130<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.511413]=C2=A0 ? kthread_bind=
+0x30/0x30<br>
&gt; Feb 20 00:58:44 talisker kernel: [5876461.511776]=C2=A0 ret_from_fork+=
0x35/0x40<br>
&gt; <br>
&gt; Administrators of the guests notice problems and try to shutdown or<br=
>
&gt; reboot, but that fails because dom0 can&#39;t write to its xenstore, s=
o<br>
&gt; mostly domains can&#39;t be managed after this happens and the server<=
br>
&gt; has to be forcibly rebooted.<br>
&gt; <br>
&gt; These are all using the default scheduler, which I understand since<br=
>
&gt; 4.12 is credit2. SMT is enabled and I&#39;ve limited dom0 to 2 cores,<=
br>
&gt; then pinned dom0 to cores 0 and 1, and pinned all other guests to<br>
&gt; their choice out of the remaining cores. That is something I did<br>
&gt; fairly recently though; for a long time there was no pinning yet<br>
&gt; this still started happening.<br>
&gt; <br>
&gt; In a couple of cases I have found that I&#39;ve been able to run<br>
&gt; &quot;xentop&quot; and see a particular guest doing heavy block device=
 reads.<br>
&gt; I&#39;ve done an &quot;xl destroy&quot; on that guest and then everyth=
ing has<br>
&gt; returned to normal. Unfortunately the times this has happened have<br>
&gt; been on dom0s without useful logs. There&#39;s just a gap in logs<br>
&gt; between when the problems started and when the (apparently)<br>
&gt; problematic domU is destroyed. The problematic domU can then be<br>
&gt; booted again and life goes on.<br>
&gt; <br>
&gt; So, it could be totally unrelated to Xen, and as I investigate<br>
&gt; further I will try different kernels in dom0. But the way that<br>
&gt; destroying a domU frees things up makes me wonder if it could be Xen<b=
r>
&gt; related, maybe scheduler related? Also, it&#39;s always the md device<=
br>
&gt; that the guest block devices are on that is stalled - IO to other<br>
&gt; devices in dom0<br>
&gt; <br>
&gt; Are there any hypervisor magic sysrq debug keys that could provide<br>
&gt; useful information to you in ruling in / out a Xen issue?<br>
&gt; <br>
&gt; Should I try using the &quot;credit&quot; scheduler (instead of &quot;=
credit2&quot;) at<br>
&gt; next boot?<br>
&gt; <br>
&gt; I *think* this has only been seen with kernel version<br>
&gt; 4.19.0-13-amd64. Some of these servers have now been rebooted into<br>
&gt; 4.19.0-14-amd64 (the latest available package) due to the issue,<br>
&gt; which has not yet re-occurred for them.<br>
&gt; <br>
&gt; If it does re-occur with 4.19.0-14-amd64 what kernel version would<br>
&gt; you advise I try out at next reboot so as to take the Debian kernel<br=
>
&gt; out of the picture? I will download an upstream kernel release and<br>
&gt; build a Debian package out of it, using my existing kernel config as<b=
r>
&gt; a base.<br>
&gt; <br>
&gt; As Debian buster is on the 4.19 series should I pick the latest<br>
&gt; 4.19.x longterm to be near to it, or the 5.10.x longterm, or the<br>
&gt; 5.11.x stable?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Andy<br>
<br>
</blockquote></div></div>
</div>

--000000000000a269d705c4996af1--

