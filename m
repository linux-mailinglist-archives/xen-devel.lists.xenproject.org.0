Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F67505330
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307246.522568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQsC-0001ei-Vr; Mon, 18 Apr 2022 12:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307246.522568; Mon, 18 Apr 2022 12:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQsC-0001ck-Sf; Mon, 18 Apr 2022 12:52:56 +0000
Received: by outflank-mailman (input) for mailman id 307246;
 Mon, 18 Apr 2022 12:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HB8F=U4=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1ngQsB-0001ce-Ak
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:52:55 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75bada36-bf16-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 14:52:53 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id t12so12260061pll.7
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 05:52:53 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 s24-20020a17090a441800b001ca9b5724a6sm12663301pjg.36.2022.04.18.05.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 05:52:51 -0700 (PDT)
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
X-Inumbo-ID: 75bada36-bf16-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=F9FMycteyYrs8wEiBExwTDtAcc/2JBQ5GQqodkswvTM=;
        b=zqMJx9kEO/syGgh/jfUujcMdgZO1Zk4th79yyPJcsdnvdIDI8Xk864jrHuyarDgv8c
         gBt2ez+Ym/+EaLgC6MfWMHx5OVcgB54eOfckx7Cmdvf3bmGVDc/T0aLwM9rpN+nKDwcO
         dWklV+ARMeZbUO1+GrFCqFc/xZjiULaGiN1ll1DVCyoNwgzG1P+0Y9ZhUcwBpI/7WQx/
         gN/pYZdJuI935bVWCVcjkTqu2k20R+5oG6mGhil2uYi4X3QtR1zxXemtHM8NZ8XUvixz
         3tQXFtvzqXbRCXIajCtyaq1nqo4kcpEpLyzsTyB3FvSvWQd/rTixV4XGHzsBwq9Bu/vV
         stDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=F9FMycteyYrs8wEiBExwTDtAcc/2JBQ5GQqodkswvTM=;
        b=q8rVGxRdAxYpfZKGrl91sZijpvjwmdYpezOqmvh91LiPGJJLARrPlhdjSfLvk+XZgR
         xmUzkW8KSp5+KERNIvYVw1w75DfUCd1I2Ey/OpGY2ZJpl465I1HZZG74gTa5bWXD5bHC
         XNq3/qUNVObAVQ1aFVto+Sn/sIo6v0j+JGG+hBtVL/pyPqroNDFcgOIR2yKtMJ7cItHx
         iG05xM38tqM8xh4ohFbdc6H8nkhSbxdPkK+Lc5a0D8WBLeCVbzEj0sdw3ZnkBxhwylN0
         hn6VBtcK2n/YhEsEO28ey9A36sJDcJbw7EVp3+fidLavvF8OpH8awNWyClQl6nMzVJ8V
         I/Nw==
X-Gm-Message-State: AOAM531MSXGkY/gNgtFe3SWMB2Br6z1u8UZ+XG0OK4HBWgK12QbFv7ED
	FSW2g8rf14KISc1DX2vbmkJbAw==
X-Google-Smtp-Source: ABdhPJyPDIaLEewZhdBb/81ulQRxH4lnSCW72QYENTWzgjKzLqW/EIFRVhnHg8tc4oCKtNOZ6kDuRg==
X-Received: by 2002:a17:902:6b44:b0:154:4bee:c434 with SMTP id g4-20020a1709026b4400b001544beec434mr10858040plt.43.1650286372060;
        Mon, 18 Apr 2022 05:52:52 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-f2fs-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, linux-raid@vger.kernel.org, linux-fsdevel@vger.kernel.org, drbd-dev@lists.linbit.com, xen-devel@lists.xenproject.org, nbd@other.debian.org, linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org, linux-s390@vger.kernel.org, linux-block@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, linux-ext4@vger.kernel.org, dm-devel@redhat.com, linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com, linux-scsi@vger.kernel.org, linux-xfs@vger.kernel.org, cluster-devel@redhat.com, linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org, linux-bcache@vger.kernel.org, ceph-devel@vger.kernel.org, ntfs3@lists.linux.dev, linux-um@lists.infradead.org, target-devel@vger.kernel.org
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
Subject: Re: use block_device based APIs in block layer consumers v3
Message-Id: <165028636949.14872.7589996414521818725.b4-ty@kernel.dk>
Date: Mon, 18 Apr 2022 06:52:49 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Apr 2022 06:52:31 +0200, Christoph Hellwig wrote:
> this series cleanups up the block layer API so that APIs consumed
> by file systems are (almost) only struct block_devic based, so that
> file systems don't have to poke into block layer internals like the
> request_queue.
> 
> I also found a bunch of existing bugs related to partition offsets
> and discard so these are fixed while going along.
> 
> [...]

Applied, thanks!

[01/27] target: remove an incorrect unmap zeroes data deduction
        commit: 179d8609d8424529e95021df939ed7b0b82b37f1
[02/27] target: pass a block_device to target_configure_unmap_from_queue
        commit: 817e8b51eb3d927ce6d56ecf9f48bc3c5b26168b
[03/27] target: fix discard alignment on partitions
        commit: 968786b9ef56e75e0109158a4936ffffea962c1e
[04/27] drbd: remove assign_p_sizes_qlim
        commit: 40349d0e16cedd0de561f59752c3249780fb749b
[05/27] drbd: use bdev based limit helpers in drbd_send_sizes
        commit: 7a38acce229685968b770d1d9e64e01396b93643
[06/27] drbd: use bdev_alignment_offset instead of queue_alignment_offset
        commit: c6f23b1a05441a26f765e59dd95e8ba7354f9388
[07/27] drbd: cleanup decide_on_discard_support
        commit: 998e9cbcd615e5e6a7baa69e673ee845f812744e
[08/27] btrfs: use bdev_max_active_zones instead of open coding it
        commit: c1e7b24416400ef13ff92a1c60c336c9a2834d7b
[09/27] ntfs3: use bdev_logical_block_size instead of open coding it
        commit: f09dac9afb8e3ce4b6485dbc091a9b9c742db023
[10/27] mm: use bdev_is_zoned in claim_swapfile
        commit: 9964e674559b02619fee2012a56839624143d02e
[11/27] block: add a bdev_nonrot helper
        commit: 10f0d2a517796b8f6dc04fb0cc3e49003ae6b0bc
[12/27] block: add a bdev_write_cache helper
        commit: 08e688fdb8f7e862092ae64cee20bc8b463d1046
[13/27] block: add a bdev_fua helper
        commit: a557e82e5a01826f902bd94fc925c03f253cb712
[14/27] block: add a bdev_stable_writes helper
        commit: 36d254893aa6a6e204075c3cce94bb572ac32c04
[15/27] block: add a bdev_max_zone_append_sectors helper
        commit: 2aba0d19f4d8c8929b4b3b94a9cfde2aa20e6ee2
[16/27] block: use bdev_alignment_offset in part_alignment_offset_show
        commit: 64dcc7c2717395b7c83ffb10f040d3be795d03c1
[17/27] block: use bdev_alignment_offset in disk_alignment_offset_show
        commit: 640f2a23911b8388989547f89d055afbb910b88e
[18/27] block: move bdev_alignment_offset and queue_limit_alignment_offset out of line
        commit: 89098b075cb74a80083bc4ed6b71d0ee18b6898f
[19/27] block: remove queue_discard_alignment
        commit: 4e1462ffe8998749884d61f91be251a7a8719677
[20/27] block: use bdev_discard_alignment in part_discard_alignment_show
        commit: f0f975a4dde890bfe25ce17bf07a6495453988a4
[21/27] block: move {bdev,queue_limit}_discard_alignment out of line
        commit: 5c4b4a5c6f11c869a57c6bd977143430bc9dc43d
[22/27] block: refactor discard bio size limiting
        commit: e3cc28ea28b5f8794db2aed24f8a0282ad2e85a2
[23/27] block: add a bdev_max_discard_sectors helper
        commit: cf0fbf894bb543f472f682c486be48298eccf199
[24/27] block: remove QUEUE_FLAG_DISCARD
        commit: 70200574cc229f6ba038259e8142af2aa09e6976
[25/27] block: add a bdev_discard_granularity helper
        commit: 7b47ef52d0a2025fd1408a8a0990933b8e1e510f
[26/27] block: decouple REQ_OP_SECURE_ERASE from REQ_OP_DISCARD
        commit: 44abff2c0b970ae3d310b97617525dc01f248d7c
[27/27] direct-io: remove random prefetches
        commit: c22198e78d523c8fa079bbb70b2523bb6aa51849

Best regards,
-- 
Jens Axboe



