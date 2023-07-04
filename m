Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB57473A0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558378.872416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgfq-0005lg-K3; Tue, 04 Jul 2023 14:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558378.872416; Tue, 04 Jul 2023 14:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgfq-0005ij-H0; Tue, 04 Jul 2023 14:06:34 +0000
Received: by outflank-mailman (input) for mailman id 558378;
 Tue, 04 Jul 2023 14:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U0S6=CW=gmail.com=bart.vanassche@srs-se1.protection.inumbo.net>)
 id 1qGgfp-0005id-Jv
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:06:33 +0000
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f98b8bce-1a73-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:06:31 +0200 (CEST)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1b89bda02ebso13665035ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jul 2023 07:06:31 -0700 (PDT)
Received: from [192.168.50.14] ([98.51.102.78])
 by smtp.gmail.com with ESMTPSA id
 jk4-20020a170903330400b001b672af624esm13083569plb.164.2023.07.04.07.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 07:06:29 -0700 (PDT)
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
X-Inumbo-ID: f98b8bce-1a73-11ee-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479590; x=1691071590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JV2SCOEdB9t0w6tigDexjJMYhGF54ZwsLlYmJ1gE7wU=;
        b=STgVxKubhKFXFR/0SG2VGwjeMGvGTPSKgdHelGhM7R1cmxEng5CwxQ+949RTd1LW8g
         YFOBs5rBQp3aEo0XvF7MPAT7XXCneN+XVpxX5Snuz8mpBpEQdyJaceEODGA1bt4SFVaV
         nGP76XHESoWY2esDLySFBNSf5Zttuc4Qr3d7H2RYOGylFgXG+8gq/Fa5Ajhf9oG7LSLT
         1bLb2Nhr6eRceNvJ73j17fCmf7aUMHXDO07H7ZYV69eSwl9Z8xITMCylmnFSENncBvSN
         /XKBkgaRap0A/u0+JcyKdMVrT/yUXr1qu1JlNFuXzSiMjkeboGWIGJMfwNsBknaOJ8qL
         T5xA==
X-Gm-Message-State: ABy/qLYm/THb2FhcUrz/8oHkswrynCHJ7Q2Lr1AnuvlxGAKs6+SNgTUB
	kTlFZEZ3birMFJu3prYW0ec=
X-Google-Smtp-Source: APBJJlEESj5502hCCjnCrW5aNdhMviGxH5NXIz8SFwBF+614aVB6e0+1hJtWMTw8TJzZNuQy8olTNg==
X-Received: by 2002:a17:903:447:b0:1b8:a31b:ac85 with SMTP id iw7-20020a170903044700b001b8a31bac85mr2719760plb.41.1688479589749;
        Tue, 04 Jul 2023 07:06:29 -0700 (PDT)
Message-ID: <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
Date: Tue, 4 Jul 2023 07:06:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Content-Language: en-US
To: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@infradead.org>, Alasdair Kergon <agk@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anna Schumaker <anna@kernel.org>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
 dm-devel@redhat.com, drbd-dev@lists.linbit.com, Gao Xiang
 <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Joern Engel <joern@lazybastard.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Kent Overstreet <kent.overstreet@gmail.com>,
 linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-xfs@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
 ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Song Liu <song@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, target-devel@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 xen-devel@lists.xenproject.org
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230704122224.16257-1-jack@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/23 05:21, Jan Kara wrote:
> +struct bdev_handle {
> +	struct block_device *bdev;
> +	void *holder;
> +};

Please explain in the patch description why a holder pointer is 
introduced in struct bdev_handle and how it relates to the bd_holder 
pointer in struct block_device. Is one of the purposes of this patch 
series perhaps to add support for multiple holders per block device?

Thanks,

Bart.


