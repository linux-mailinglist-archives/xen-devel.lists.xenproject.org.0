Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA53C9F5A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 15:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156624.289033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m41FJ-0000xY-TW; Thu, 15 Jul 2021 13:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156624.289033; Thu, 15 Jul 2021 13:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m41FJ-0000uV-QC; Thu, 15 Jul 2021 13:17:45 +0000
Received: by outflank-mailman (input) for mailman id 156624;
 Thu, 15 Jul 2021 13:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0p9=MH=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1m41FH-0000uO-HG
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 13:17:43 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 08bcafa8-e56f-11eb-88d0-12813bfff9fa;
 Thu, 15 Jul 2021 13:17:41 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-SZ3CQVFEMF6xhntSqnFh4Q-1; Thu, 15 Jul 2021 09:17:40 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 eg53-20020a05640228b5b02903ad3cc35040so1721883edb.11
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 06:17:39 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id kb12sm1867346ejc.35.2021.07.15.06.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 06:17:38 -0700 (PDT)
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
X-Inumbo-ID: 08bcafa8-e56f-11eb-88d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626355061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEnFR9sLZg9aNWBfSV+Jjv4oijW9gGY7ZZ8SM1EhDyo=;
	b=YHQlsJUpfF3QI/9XcNIXyPa0W7pofD4/CsWhMvspCdwQvqhasFVHUV36oDXt7EqG1fPblS
	pDhsBhtZehOZlBLosTrK7DuBiYwbrJuU1v0XYOWIH6Qx3j1TwqEZqAxtNtIIBU6r5Aabrq
	iudcXqGxdejSA70z474ZJ3/GWjgGSmk=
X-MC-Unique: SZ3CQVFEMF6xhntSqnFh4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=fEnFR9sLZg9aNWBfSV+Jjv4oijW9gGY7ZZ8SM1EhDyo=;
        b=L9qbRto/77C+T9oRQJAfrwmI38rSNt6ctAcUk9+uQIUrPvrbTFmLHNC1tI0Z4ZSpvg
         Dw6MvlU0rXXmGdb353xk7yh3PD19ffr9oXLwemaTVtG3gO8OuvTY9xzz1BgNm2HI+bmu
         j6ukNTZJdjLYs2rb/tBGO35QpkUgZhuW97uhN/NGRhZixOJ2hZjeF7zXXgqyHuESeWaL
         D4g9v9+dnPZopnsTQkxbeTvQuKEBXOMwcyrDcL36q081Vp2IYEckYNlZQT46rK6drgkK
         tzlImMP7Z8LxxZ4FbZHW/iu0pltHXC3n53u8S69a1zMXkV8UOI7meUW1iPjt79SC7vbR
         imOg==
X-Gm-Message-State: AOAM533NtAdVreZr4nSd6NFivWPFEaU9sALHbAZ2+Hz0syjrwTgmlkMF
	4M4Iwg1oI7oDSWCi0fOPzjrxXgn9gl6oO/tw7xzaFzFxWuVoxrIjeURNdDNIM5p91xHFX6UYuzm
	lwPn9ajwQvaf1SWzmU+2BeeXq5Hc=
X-Received: by 2002:a17:907:7293:: with SMTP id dt19mr5642585ejc.122.1626355058777;
        Thu, 15 Jul 2021 06:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2vEkDU4ywXlhDnjL2xOkQcJAsMfg1xLGoIUohd2Oe+LOaHxUNb/4gntVHBypGHocKBtmQLw==
X-Received: by 2002:a17:907:7293:: with SMTP id dt19mr5642565ejc.122.1626355058533;
        Thu, 15 Jul 2021 06:17:38 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [BUG report] Deadlock in xen-blkfront upon device hot-unplug
In-Reply-To: <20210715124622.GA32693@lst.de>
References: <87pmvk0wep.fsf@vitty.brq.redhat.com>
 <20210715124622.GA32693@lst.de>
Date: Thu, 15 Jul 2021 15:17:37 +0200
Message-ID: <87k0lr1zta.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Christoph Hellwig <hch@lst.de> writes:

> On Thu, Jul 15, 2021 at 11:16:30AM +0200, Vitaly Kuznetsov wrote:
>> I'm observing a deadlock every time I try to unplug a xen-blkfront
>> device. With 5.14-rc1+ the deadlock looks like:
>
> I did actually stumble over this a few days ago just from code
> inspection.  Below is what I come up with, can you give it a spin?

This eliminates the deadlock, thanks! Unfortunately, this reveals the
same issue I observed when I just dropped taking the mutex from
blkfront_closing():

[   66.455122] general protection fault, probably for non-canonical address 0xf1af5e354e6da159: 0000 [#1] SMP PTI
[   66.462802] CPU: 4 PID: 145 Comm: xenwatch Not tainted 5.14.0-rc1+ #370
[   66.467486] Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
[   66.472817] RIP: 0010:del_timer+0x1f/0x80
[   66.476570] Code: 71 af a3 00 eb c1 31 c0 c3 66 90 0f 1f 44 00 00 41 55 41 54 45 31 e4 55 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 <48> 8b 47 08 48 85 c0 74 2d 48 89 e6 48 89 fd e8 dd e8 ff ff 48 89
[   66.493967] RSP: 0018:ffffb5c10426bcd8 EFLAGS: 00010086
[   66.499416] RAX: a49b3c9544841100 RBX: f1af5e354e6da101 RCX: 0000000000005ebf
[   66.506386] RDX: 0000000000005ec0 RSI: 0000000000000001 RDI: f1af5e354e6da151
[   66.512799] RBP: ffffb5c10426bd30 R08: 0000000000000001 R09: 0000000000000001
[   66.518372] R10: 0000000000000001 R11: 0000000000000002 R12: 0000000000000000
[   66.523681] R13: ffff9aba8df63e40 R14: 0000000000000000 R15: ffff9aba86f40000
[   66.529365] FS:  0000000000000000(0000) GS:ffff9af609200000(0000) knlGS:0000000000000000
[   66.536187] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.540806] CR2: 00007ff024600130 CR3: 000000010117a006 CR4: 00000000001706e0
[   66.546345] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   66.552322] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   66.558501] Call Trace:
[   66.561449]  try_to_grab_pending+0x13f/0x2e0
[   66.565658]  cancel_delayed_work+0x2e/0xd0
[   66.570012]  blk_mq_stop_hw_queues+0x2d/0x50
[   66.574110]  blkfront_remove+0x30/0x130 [xen_blkfront]
[   66.579049]  xenbus_dev_remove+0x6d/0xf0
[   66.582473]  __device_release_driver+0x180/0x240
[   66.586963]  device_release_driver+0x26/0x40
[   66.591050]  bus_remove_device+0xef/0x160
[   66.594805]  device_del+0x18c/0x3e0
[   66.598570]  ? xenbus_probe_devices+0x120/0x120
[   66.602987]  ? klist_iter_exit+0x14/0x20
[   66.606915]  device_unregister+0x13/0x60
[   66.611135]  xenbus_dev_changed+0x174/0x1e0
[   66.615104]  xenwatch_thread+0x94/0x190
[   66.619028]  ? do_wait_intr_irq+0xb0/0xb0
[   66.623052]  ? xenbus_dev_request_and_reply+0x90/0x90
[   66.628218]  kthread+0x149/0x170
[   66.631509]  ? set_kthread_struct+0x40/0x40
[   66.635355]  ret_from_fork+0x22/0x30
[   66.639162] Modules linked in: vfat fat i2c_piix4 xfs libcrc32c crct10dif_pclmul crc32_pclmul crc32c_intel xen_blkfront ghash_clmulni_intel ena
[   66.650868] ---[ end trace 7fa9da1e39697767 ]---
[   66.655490] RIP: 0010:del_timer+0x1f/0x80
[   66.659813] Code: 71 af a3 00 eb c1 31 c0 c3 66 90 0f 1f 44 00 00 41 55 41 54 45 31 e4 55 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 <48> 8b 47 08 48 85 c0 74 2d 48 89 e6 48 89 fd e8 dd e8 ff ff 48 89
[   66.681045] RSP: 0018:ffffb5c10426bcd8 EFLAGS: 00010086
[   66.685888] RAX: a49b3c9544841100 RBX: f1af5e354e6da101 RCX: 0000000000005ebf
[   66.692153] RDX: 0000000000005ec0 RSI: 0000000000000001 RDI: f1af5e354e6da151
[   66.698778] RBP: ffffb5c10426bd30 R08: 0000000000000001 R09: 0000000000000001
[   66.705175] R10: 0000000000000001 R11: 0000000000000002 R12: 0000000000000000
[   66.711696] R13: ffff9aba8df63e40 R14: 0000000000000000 R15: ffff9aba86f40000
[   66.718035] FS:  0000000000000000(0000) GS:ffff9af609200000(0000) knlGS:0000000000000000
[   66.725210] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.730291] CR2: 00007ff024600130 CR3: 000000010117a006 CR4: 00000000001706e0
[   66.736235] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   66.742373] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   66.749026] BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:49
[   66.756118] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 145, name: xenwatch
[   66.763473] INFO: lockdep is turned off.
[   66.767428] irq event stamp: 24256
[   66.770900] hardirqs last  enabled at (24255): [<ffffffff90c32aeb>] _raw_spin_unlock_irqrestore+0x4b/0x5d
[   66.779620] hardirqs last disabled at (24256): [<ffffffff900fe21c>] try_to_grab_pending+0x15c/0x2e0
[   66.787763] softirqs last  enabled at (24196): [<ffffffff900e0b11>] __irq_exit_rcu+0xe1/0x100
[   66.794519] softirqs last disabled at (24191): [<ffffffff900e0b11>] __irq_exit_rcu+0xe1/0x100
[   66.801953] CPU: 4 PID: 145 Comm: xenwatch Tainted: G      D           5.14.0-rc1+ #370
[   66.809315] Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
[   66.814924] Call Trace:
[   66.817461]  dump_stack_lvl+0x6a/0x9a
[   66.821171]  ___might_sleep.cold+0xb6/0xc6
[   66.825436]  exit_signals+0x1c/0x2d0
[   66.829328]  do_exit+0xc7/0xbb0
[   66.832364]  ? kthread+0x149/0x170
[   66.835039]  rewind_stack_do_exit+0x17/0x20
[   66.838710] RIP: 0000:0x0
[   66.841671] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[   66.847271] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
[   66.854271] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   66.860672] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   66.866687] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   66.872966] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   66.878410] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

-- 
Vitaly


