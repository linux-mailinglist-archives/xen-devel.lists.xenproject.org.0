Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D314FA614
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 10:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302084.515632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd6s7-0003fu-J0; Sat, 09 Apr 2022 08:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302084.515632; Sat, 09 Apr 2022 08:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd6s7-0003ZZ-Dv; Sat, 09 Apr 2022 08:55:07 +0000
Received: by outflank-mailman (input) for mailman id 302084;
 Sat, 09 Apr 2022 08:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhEE=UT=linbit.com=christoph.boehmwalder@srs-se1.protection.inumbo.net>)
 id 1nd6HJ-0006oL-D9
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 08:17:05 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee64244-b7dd-11ec-8fbc-03012f2f19d4;
 Sat, 09 Apr 2022 10:17:02 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id d29so16011450wra.10
 for <xen-devel@lists.xenproject.org>; Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
Received: from [192.168.169.127] (178.115.52.210.wireless.dyn.drei.com.
 [178.115.52.210]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0038c9f469979sm12169802wmq.40.2022.04.09.01.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
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
X-Inumbo-ID: 6ee64244-b7dd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ga61vN/TMGQoWv5pdVva9yHEVEk7JvDu8SvkqTkiHOU=;
        b=16VWXfTcecI6vKD89hlxEi4M1sM+lDWraPFKcdJek4zYvKgcUI+UTTfswq4WTG3pUA
         DwGdvejVPHmGbB6WxyxpG5RxCDgxrI8ELqeSKx9xnWZSuDqFsfTR7C0q23UBJ4NTUUke
         9rs/lGq9PScZMcSAS9SHkk+s8lIoFrVgzxTJ9NRLUES2XsBvbZXGJskPHSy0jdzHruaB
         iGqoe9YksSt5XleGcAhaVmv2OHki/8AO1/zdgDuyMqAmL6dyveVZDyPGB/rY+7+4UaaK
         b7o7nIN/SrEk1fy76OtZuySau99YX+Sryl6fYO8t+jUUvribl7KiF9nqytVWelfdH+Mk
         O4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ga61vN/TMGQoWv5pdVva9yHEVEk7JvDu8SvkqTkiHOU=;
        b=6CVTgH6fsGTu4MSkTOiLWzSj5avz+zddMwJheLKz3bDrWDNcKUqCfZpVD4Qw5aEAty
         7bhfpuCPI1qY/6TDySiwTZg+Z6Htmb81X9ho2KCxceofOiECWCq2EKV9pUytWoBl0Jr0
         4kHPeuqelgc0G7WvdM31uEgyCJf9erm9ZoatVQM0tJx630gObI5NKBK/dCBWxxC2bRpt
         mmlu1aaq4eECFrkdSZLIfrYAee8K1Za/eg/CBYFO6tZZw730bRHqo5b9i8hFnDiLqZkH
         rmhhKm5Ul5Or8xUJZRg8kwQkGeW8C8d9v5GuevKCjNyk/vCgqOJcb1TEUqZx+7YlIXRI
         Oakg==
X-Gm-Message-State: AOAM530fvBtEACWz9kGUUkP02iKvRiGoSUMq0HGHXKcrZdDiVUm1mji4
	h0w1pbQYEqCmA5ruIQQzWUB54A==
X-Google-Smtp-Source: ABdhPJyMl7hUdRWB67QUv24ZWK8mJRwBaxhnGq09ejE28bU5zjvkHivlidIC/JIf/EdWqVvIZNI6nA==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id p1-20020adf9581000000b001edc3414ed1mr16998132wrp.299.1649492221449;
        Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
Message-ID: <5a26cdb1-b63b-8d35-640b-bc0e0f78a181@linbit.com>
Date: Sat, 9 Apr 2022 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Drbd-dev] [PATCH 04/27] drbd: remove assign_p_sizes_qlim
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-5-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220409045043.23593-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.04.22 06:50, Christoph Hellwig wrote:
> Fold each branch into its only caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/block/drbd/drbd_main.c | 47 +++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 9676a1d214bc5..1262fe1c33618 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -903,31 +903,6 @@ void drbd_gen_and_send_sync_uuid(struct drbd_peer_device *peer_device)
>   	}
>   }
>   
> -/* communicated if (agreed_features & DRBD_FF_WSAME) */
> -static void
> -assign_p_sizes_qlim(struct drbd_device *device, struct p_sizes *p,
> -					struct request_queue *q)
> -{
> -	if (q) {
> -		p->qlim->physical_block_size = cpu_to_be32(queue_physical_block_size(q));
> -		p->qlim->logical_block_size = cpu_to_be32(queue_logical_block_size(q));
> -		p->qlim->alignment_offset = cpu_to_be32(queue_alignment_offset(q));
> -		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> -		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> -		p->qlim->discard_enabled = blk_queue_discard(q);
> -		p->qlim->write_same_capable = 0;
> -	} else {
> -		q = device->rq_queue;
> -		p->qlim->physical_block_size = cpu_to_be32(queue_physical_block_size(q));
> -		p->qlim->logical_block_size = cpu_to_be32(queue_logical_block_size(q));
> -		p->qlim->alignment_offset = 0;
> -		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> -		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> -		p->qlim->discard_enabled = 0;
> -		p->qlim->write_same_capable = 0;
> -	}
> -}
> -
>   int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enum dds_flags flags)
>   {
>   	struct drbd_device *device = peer_device->device;
> @@ -957,14 +932,32 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
>   		q_order_type = drbd_queue_order_type(device);
>   		max_bio_size = queue_max_hw_sectors(q) << 9;
>   		max_bio_size = min(max_bio_size, DRBD_MAX_BIO_SIZE);
> -		assign_p_sizes_qlim(device, p, q);
> +		p->qlim->physical_block_size =
> +			cpu_to_be32(queue_physical_block_size(q));
> +		p->qlim->logical_block_size =
> +			cpu_to_be32(queue_logical_block_size(q));
> +		p->qlim->alignment_offset =
> +			cpu_to_be32(queue_alignment_offset(q));
> +		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> +		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> +		p->qlim->discard_enabled = blk_queue_discard(q);
>   		put_ldev(device);
>   	} else {
> +		struct request_queue *q = device->rq_queue;
> +
> +		p->qlim->physical_block_size =
> +			cpu_to_be32(queue_physical_block_size(q));
> +		p->qlim->logical_block_size =
> +			cpu_to_be32(queue_logical_block_size(q));
> +		p->qlim->alignment_offset = 0;
> +		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
> +		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
> +		p->qlim->discard_enabled = 0;
> +
>   		d_size = 0;
>   		u_size = 0;
>   		q_order_type = QUEUE_ORDERED_NONE;
>   		max_bio_size = DRBD_MAX_BIO_SIZE; /* ... multiple BIOs per peer_request */
> -		assign_p_sizes_qlim(device, p, NULL);
>   	}
>   
>   	if (peer_device->connection->agreed_pro_version <= 94)

LGTM now, thanks.

Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>

