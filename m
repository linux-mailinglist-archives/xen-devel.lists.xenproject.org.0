Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2002ACEDF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 06:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22945.49544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcLz3-0006ja-WF; Tue, 10 Nov 2020 05:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22945.49544; Tue, 10 Nov 2020 05:14:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcLz3-0006j5-S1; Tue, 10 Nov 2020 05:14:21 +0000
Received: by outflank-mailman (input) for mailman id 22945;
 Mon, 09 Nov 2020 23:28:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSbr=EP=gmail.com=sagigrim@srs-us1.protection.inumbo.net>)
 id 1kcGao-0004dR-1H
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 23:28:58 +0000
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed551f5a-5b92-48c9-ad0b-2ab809b51429;
 Mon, 09 Nov 2020 23:28:54 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v5so1250725wmh.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 15:28:53 -0800 (PST)
Received: from ?IPv6:2601:647:4802:9070:f26a:270b:f54c:37eb?
 ([2601:647:4802:9070:f26a:270b:f54c:37eb])
 by smtp.gmail.com with ESMTPSA id c17sm6900728wro.19.2020.11.09.15.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 15:28:51 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zSbr=EP=gmail.com=sagigrim@srs-us1.protection.inumbo.net>)
	id 1kcGao-0004dR-1H
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 23:28:58 +0000
X-Inumbo-ID: ed551f5a-5b92-48c9-ad0b-2ab809b51429
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ed551f5a-5b92-48c9-ad0b-2ab809b51429;
	Mon, 09 Nov 2020 23:28:54 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v5so1250725wmh.1
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 15:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uVd85Bl4q22td+3jSMit0FtxZJ1sJtChRiPRn7GLPMw=;
        b=ItqUNnW7P/7fOaEsC1OzM9lAYP5jEIhhrLVvElDpkuZTt9sEOyqt1R32W+BzIstSPj
         gl3xm2oDjjN/xYsFu6RmxDo3stq2iEp3HjhaZJkQQ9Q+rG0xAHsB15nMiNDYFpDCayXg
         dudwYDbyaf9P9O9x8lB186FNKrrdRsxofxp9OZo2cfn7cvCXne6VbhSojcHQEgJlPRzU
         0HlhqiIdxQaPA3rjxCz90UCzkHhwtQDaUF9zQv41bYCXh3PagaC6JeWRRHYAL2EopCaM
         6ph/leqxGothBhus8Oxe+az/fQIydxnhrM9gih5DEi4iq/vBN7wdaRu8ZRmVihLPRI56
         kYGQ==
X-Gm-Message-State: AOAM5326ark+57qhl+xcXOhBF9ROqwTvMbrChskFV5+XfKoDqVlRVxg9
	8jt2X6xYos/9UPon6m1QXM0=
X-Google-Smtp-Source: ABdhPJyLfZWJAVtXVvWavay6Dkz/YKClz0bIC5QMERvUePaULd58OWlCLidmjNr2cN/ZVx4HfgINbw==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr1575766wmk.100.1604964532362;
        Mon, 09 Nov 2020 15:28:52 -0800 (PST)
Received: from ?IPv6:2601:647:4802:9070:f26a:270b:f54c:37eb? ([2601:647:4802:9070:f26a:270b:f54c:37eb])
        by smtp.gmail.com with ESMTPSA id c17sm6900728wro.19.2020.11.09.15.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 15:28:51 -0800 (PST)
Subject: Re: [PATCH 03/24] nvme: let set_capacity_revalidate_and_notify update
 the bdev size
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
 Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201106190337.1973127-1-hch@lst.de>
 <20201106190337.1973127-4-hch@lst.de>
 <1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
 <20201109085340.GB27483@lst.de>
 <e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <d28042e3-3123-5dfc-d0a2-aab0012150c8@grimberg.me>
Date: Mon, 9 Nov 2020 15:28:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


> [ .. ]
>>> Originally nvme multipath would update/change the size of the multipath
>>> device according to the underlying path devices.
>>> With this patch the size of the multipath device will _not_ change if 
>>> there
>>> is a change on the underlying devices.
>>
>> Yes, it will.  Take a close look at nvme_update_disk_info and how it is
>> called.
>>
> Okay, then: What would be the correct way of handling a size update for 
> NVMe multipath?
> Assuming we're getting an AEN for each path signalling the size change
> (or a controller reset leading to a size change).
> So if we're updating the size of the multipath device together with the 
> path device at the first AEN/reset we'll end up with the other paths 
> having a different size than the multipath device (and the path we've 
> just been updating).
> - Do we care, or cross fingers and hope for the best?
> - Shouldn't we detect the case where we won't get a size update for the 
> other paths, or, indeed, we have a genuine device size mismatch due to a 
> misconfiguration on the target?
> 
> IE shouldn't we have a flag 'size update pending' for the other paths,, 
> to take them out ouf use temporarily until the other AENs/resets have 
> been processed?

the mpath device will take the minimum size from all the paths, that is
what blk_stack_limits does. When the AEN for all the paths will arrive
the mpath size will update.

Not sure how this is different than what we have today...

