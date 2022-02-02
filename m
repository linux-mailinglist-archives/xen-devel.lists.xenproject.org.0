Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F34A73A1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264280.457321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGxx-0000zU-33; Wed, 02 Feb 2022 14:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264280.457321; Wed, 02 Feb 2022 14:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGxw-0000xC-V2; Wed, 02 Feb 2022 14:50:36 +0000
Received: by outflank-mailman (input) for mailman id 264280;
 Wed, 02 Feb 2022 14:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RYPV=SR=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1nFGxv-0000x6-Qz
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:50:35 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 79424c87-8437-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:50:34 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id z5so18464965plg.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Feb 2022 06:50:34 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id u18sm27070556pfi.185.2022.02.02.06.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 06:50:32 -0800 (PST)
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
X-Inumbo-ID: 79424c87-8437-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=IAkJ25VWGHpvo748Ps3jmA0wCxSeGiRhv8GghNIjjCc=;
        b=hs9vTLYzgYWsMhdo7W/FDStWSbFMCMMt9vdgv5sV/q3umnsqiQSEfCqrNim48rcYWQ
         WNUzTuvQAJ0sDihfOuWS0QOGzEsxWAr0Pnjrw3bWTt/51G0aCscpb7N28MkQRP+Ybw9U
         QUpyn0NBNkrO1Q8uaUOF4/JbxnMJQMYZShxwVUBk5pnNiEY/YiQ7cSsKkCnJMjsZFJ/R
         LprEgdjYCoVAPMbCYjcK+kwaAwkWQZ3f8+251u1es631aToqil8P8oY4xfroCSVLk1zW
         IhfRx5mM6vd7nGUMlO9XrmmP0F0ELYksOi6VL8XXDhWNI42+96xLTzvukOHXjddiZQYF
         NiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=IAkJ25VWGHpvo748Ps3jmA0wCxSeGiRhv8GghNIjjCc=;
        b=HGVlespg4a9xxHeVwJ6IGlhAtaADCoiBJ17wUtM7GXIAZCV16GuqK5rCsrvEBBtP3I
         39D9A575UZh8l9dzyhUbGvisPy1GfsPjqhWkC6DJv/UaUa56Ty9yEyONScOLuJwLdl8d
         WHSdNWPr6lTcuUNvsMT3wPpangw0fsoSc48T5ZbhedBO4wMQizEtj6p6EduZQknqVM/m
         yz1d6lFaAJGcVFXu9NIRfodUhqHmVTrUasROs5Ae6F3Q8/eJIEjHjRCrhEJDN/z8GKBW
         5KSnXpB2EBsGmWtulHt8exSiSfFnZk1MY0s1Sx41nVmG8BIlFdtSXl8HdYu9Z6ZbiGv3
         iiSA==
X-Gm-Message-State: AOAM532GOBRFf7Z0Pv67VCS5YcSRbQWyQI4ED8wlDQcM7X1AtOSjqJnr
	S+cO64uvFvtByG92z4YFulLmyMBELsNMAQ==
X-Google-Smtp-Source: ABdhPJwSLudBNjLMeTvPHLIsOXD+1k6FRXpLWDFks6w4HVgPtg5F+Tt+QBkGoHPVlgrjEzbfwYXf1A==
X-Received: by 2002:a17:903:2305:: with SMTP id d5mr30165640plh.122.1643813432532;
        Wed, 02 Feb 2022 06:50:32 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Ryusuke Konishi <konishi.ryusuke@gmail.com>, xen-devel@lists.xenproject.org, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, dm-devel@redhat.com, ntfs3@lists.linux.dev, linux-nilfs@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Roger Pau Monné <roger.pau@citrix.co>, linux-fsdevel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, linux-nfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>, Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
Subject: Re: improve the bio allocation interface v2
Message-Id: <164381343094.170143.694743005104706258.b4-ty@kernel.dk>
Date: Wed, 02 Feb 2022 07:50:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jan 2022 10:10:48 +0100, Christoph Hellwig wrote:
> this series is posted early because it has wide-ranging changes and could use some
> early ACKs before -rc1.
> 
> It changes the interface to the bio allocators to always pass a block_device and
> the operation, which is information needed for every bio submitted through
> bio_submit.  This means the fields can be directly initialized in bio_init instead
> of first being zeroed and thus should help to micro-optimize even better than the
> __bio_set_dev that Pavel proposed while also cleaning up code.
> 
> [...]

Applied, thanks!

[01/19] fs: remove mpage_alloc
        commit: d5f68a42da7a4516e7503c281a54a58727f07dc3
[02/19] nilfs2: remove nilfs_alloc_seg_bio
        commit: f0d911927b3c7cf5f9edb5941d0287144a602d0d
[03/19] nfs/blocklayout: remove bl_alloc_init_bio
        commit: 5d2ca2132f889bc2c90d6d07fc9fc129cfee8955
[04/19] ntfs3: remove ntfs_alloc_bio
        commit: 39146b6f66ba5c107d5c5758a17f290846165b4d
[05/19] dm: bio_alloc can't fail if it is allowed to sleep
        commit: 53db984e004c7116ce69e2f4a163664453336ae1
[06/19] dm-crypt: remove clone_init
        commit: 3f868c09ea8f40f800c4c644c072d91c9eee0d71
[07/19] dm-snap: use blkdev_issue_flush instead of open coding it
        commit: eba33b8ef1b90d8996eceb0569c06a4f784ef2b5
[08/19] dm-thin: use blkdev_issue_flush instead of open coding it
        commit: 28d7d128aad5cd2178b158900d58365d1fd3de94
[09/19] drbd: bio_alloc can't fail if it is allow to sleep
        commit: 4b1dc86d1857f1007865cab759f2285280692eee
[10/19] rnbd-srv: simplify bio mapping in process_rdma
        commit: 1fe0640ff94feae6d21417e2f4f2829b882274b1
[11/19] rnbd-srv: remove struct rnbd_dev_blk_io
        commit: d7b78de2b1552e3e7ce3a069f075cc2729aa5c34
[12/19] xen-blkback: bio_alloc can't fail if it is allow to sleep
        commit: 7d8d0c658d48705fca35238a8ff601b7c5cbc0de
[13/19] block: move blk_next_bio to bio.c
        commit: 3b005bf6acf009abd700e2c652c86e5c209cf63d
[14/19] block: pass a block_device and opf to blk_next_bio
        commit: 0a3140ea0fae377c9eaa031b7db1670ae422ed47
[15/19] block: pass a block_device and opf to bio_alloc_bioset
        commit: 609be1066731fea86436f5f91022f82e592ab456
[16/19] block: pass a block_device and opf to bio_alloc_kiocb
        commit: b77c88c2100ce6a5ec8126c13599b5a7f6663e32
[17/19] block: pass a block_device and opf to bio_alloc
        commit: 07888c665b405b1cd3577ddebfeb74f4717a84c4
[18/19] block: pass a block_device and opf to bio_init
        commit: 49add4966d79244013fce35f95c6833fae82b8b1
[19/19] block: pass a block_device and opf to bio_reset
        commit: a7c50c940477bae89fb2b4f51bd969a2d95d7512

Best regards,
-- 
Jens Axboe



