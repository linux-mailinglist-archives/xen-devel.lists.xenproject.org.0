Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB637FEB94
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644488.1005556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8d64-000800-Bf; Thu, 30 Nov 2023 09:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644488.1005556; Thu, 30 Nov 2023 09:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8d64-0007y9-91; Thu, 30 Nov 2023 09:12:36 +0000
Received: by outflank-mailman (input) for mailman id 644488;
 Thu, 30 Nov 2023 09:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r8d62-0007y3-VA
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:12:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98e4ff40-8f60-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 10:12:34 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso5605285e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 01:12:34 -0800 (PST)
Received: from [192.168.17.21] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c474300b0040b36050f1bsm1227874wmo.44.2023.11.30.01.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 01:12:32 -0800 (PST)
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
X-Inumbo-ID: 98e4ff40-8f60-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701335553; x=1701940353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siaYtfcd1nV01H+dRdqoPqqRzYarxavISfuT4qVZzyM=;
        b=KCuQ4gL2INSaS9jGLTrUCQcuDh+hURLJe1cCHLlWN5JygxWBDmHbVqyeVHLZ3IQ7bq
         +WixgJsBzr+dNaobJW836KU8tltX3Z4DJ+VaBZZaI5i7p50KKbZd3vhlU/ngm1rtAaEi
         FNKWXL28bHRcMkjvFZ2Hkrysx+HLEC3M80/rGH8chwBv98ZlM6ImY8sHi+NHMjZjEaMS
         1tnF0HqMcfI3E4ONJD4FmDW98l3HhwouWY0obc7jfKe953Sj66oS3cq33ZjpHe2mPD8S
         TtwTGVQ3aTTSGH6iPGmc2q/Q52MJQHWPtFgzl6G156YevCMZ45poolCX/bar9bCbVeCH
         JnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701335553; x=1701940353;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siaYtfcd1nV01H+dRdqoPqqRzYarxavISfuT4qVZzyM=;
        b=sccnEaXAmQJIgneaWtLNXpUUUZG9ZdmiSW32Ll8zTFkqTFTfn/wwTofhUQPreRqTQW
         T7kSMQ2wdSGk7dRSk6ehZZOkqm5Oa/nDbs+ZMFw85nG2RaC5uxqY3kCBSwaOp0A8bYwR
         8cJ3x2mwtBBg6KsT2w53Vq3+x1j+sRKGFrEOem+Q+WiKaGdTCRLtHVgSnOR5TtpIRydR
         +7p4PUxM5AKjhI3x4FKWJVrKm4o2FvbYyHH5gkbyAwScJtCbV+/RwFVP4psnQnWdJtF8
         U/l614DuNGYnWsRnHkJhFh8cLjIGfbxlUMJnJf3JfJyNz2Ki90YhpGU06zdC9DNSUr3l
         ci2g==
X-Gm-Message-State: AOJu0YybXHtTjzirdP8rYL1hhD5siZI7aD0V5URrFeNVdsf175HkS4Pq
	OZSGjnLWDvgCntMiNzPLESs=
X-Google-Smtp-Source: AGHT+IHK+u82BOt6ta4eeN8cUN9H4SuoQH8m39Aqnj8S1aTgEt3vYUylXWxM8EvP4Mg+jRJiQRSjlA==
X-Received: by 2002:a05:600c:3110:b0:3f5:fff8:d4f3 with SMTP id g16-20020a05600c311000b003f5fff8d4f3mr15366829wmo.7.1701335553272;
        Thu, 30 Nov 2023 01:12:33 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bc173dc3-1cdf-43d2-8ab5-9df4dd0a6a51@xen.org>
Date: Thu, 30 Nov 2023 09:12:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 05/12] block: remove AioContext locking
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Xie Changlong <xiechanglong.d@gmail.com>, Ari Sundholm <ari@tuxera.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Cleber Rosa <crosa@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Leonardo Bras <leobras@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Fabiano Rosas <farosas@suse.de>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-6-stefanha@redhat.com>
Organization: Xen Project
In-Reply-To: <20231129195553.942921-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 19:55, Stefan Hajnoczi wrote:
> This is the big patch that removes
> aio_context_acquire()/aio_context_release() from the block layer and
> affected block layer users.
> 
> There isn't a clean way to split this patch and the reviewers are likely
> the same group of people, so I decided to do it in one patch.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/block-global-state.h |   9 +-
>   include/block/block-io.h           |   3 +-
>   include/block/snapshot.h           |   2 -
>   block.c                            | 234 +---------------------
>   block/block-backend.c              |  14 --
>   block/copy-before-write.c          |  22 +--
>   block/export/export.c              |  22 +--
>   block/io.c                         |  45 +----
>   block/mirror.c                     |  19 --
>   block/monitor/bitmap-qmp-cmds.c    |  20 +-
>   block/monitor/block-hmp-cmds.c     |  29 ---
>   block/qapi-sysemu.c                |  27 +--
>   block/qapi.c                       |  18 +-
>   block/raw-format.c                 |   5 -
>   block/replication.c                |  58 +-----
>   block/snapshot.c                   |  22 +--
>   block/write-threshold.c            |   6 -
>   blockdev.c                         | 307 +++++------------------------
>   blockjob.c                         |  18 --
>   hw/block/dataplane/virtio-blk.c    |  10 -
>   hw/block/dataplane/xen-block.c     |  17 +-
>   hw/block/virtio-blk.c              |  45 +----
>   hw/core/qdev-properties-system.c   |   9 -
>   job.c                              |  16 --
>   migration/block.c                  |  33 +---
>   migration/migration-hmp-cmds.c     |   3 -
>   migration/savevm.c                 |  22 ---
>   net/colo-compare.c                 |   2 -
>   qemu-img.c                         |   4 -
>   qemu-io.c                          |  10 +-
>   qemu-nbd.c                         |   2 -
>   replay/replay-debugging.c          |   4 -
>   tests/unit/test-bdrv-drain.c       |  51 +----
>   tests/unit/test-bdrv-graph-mod.c   |   6 -
>   tests/unit/test-block-iothread.c   |  31 ---
>   tests/unit/test-blockjob.c         | 137 -------------
>   tests/unit/test-replication.c      |  11 --
>   util/async.c                       |   4 -
>   util/vhost-user-server.c           |   3 -
>   scripts/block-coroutine-wrapper.py |   3 -
>   tests/tsan/suppressions.tsan       |   1 -
>   41 files changed, 102 insertions(+), 1202 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


