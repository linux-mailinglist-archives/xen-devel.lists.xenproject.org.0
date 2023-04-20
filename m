Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA356E95FF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 15:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524285.815110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppUW6-00085p-R6; Thu, 20 Apr 2023 13:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524285.815110; Thu, 20 Apr 2023 13:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppUW6-00084D-Nt; Thu, 20 Apr 2023 13:40:06 +0000
Received: by outflank-mailman (input) for mailman id 524285;
 Thu, 20 Apr 2023 13:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wBYt=AL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ppUW4-0007cA-FR
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 13:40:04 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da08e31d-df80-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 15:40:02 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 o29-20020a05600c511d00b003f1739de43cso1138575wms.4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 06:40:02 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm5547824wmq.35.2023.04.20.06.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:40:01 -0700 (PDT)
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
X-Inumbo-ID: da08e31d-df80-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681998002; x=1684590002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GiG+Nst/1MJjUfnBePcObQL8ovvkVXUYIAzxiDMAvw=;
        b=N01w+0tV15vawofusJhYNrRm5ORcEtfZ0ry9sdj4Pw02eBe4DdzvXjAumMEc7D5hjm
         QqpBF8AqT8NOA/bBR5G2chpRptcvD5tVJwSx9knt1hfLTAnB5ZwaIPYaP0gpyMW3Xy39
         Hq2hhmqtMcpvrwvcB7hTE/UpaMVLoewWn5MfNo5TMHOe6KvpQ25ag1IM3mgjwHqYwvSu
         ZaAXHVihzqQmg8jo8Q5kBnro8pwpCrADL2rc2uu87XQgafSiWUH5VtIs6fZiy4h1HGLM
         gGzVSp1Sk85w/LxzSWSPmfNrtDn2H+KvmA6KfH10aDrTLyek3Nq0f9GGVDTnXeNbsl0X
         TT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681998002; x=1684590002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GiG+Nst/1MJjUfnBePcObQL8ovvkVXUYIAzxiDMAvw=;
        b=kHI732TvzT9n7y7eflwq15zmPLFKVQhyZaL2ru0IHFw4LqmVDHNZpyJJWWQU9bLKMU
         5oVeZSIlsPNp81zcCw13P48qhAzoFDrUPDXb0PX+S65siR5sbxOGyjC7kbtPmABVEf3W
         i8bBaOXDTfz/FJ6JP35Jhknk1vnr4oXWI3Wv92IIRKwhsMXwVVnYpz3ut0x/JegFPTjr
         hFhka+to4EVzbDLgO7pkehafArBehf1jsKvgPfeblKg7T2xLPk5SUecWTQ3fLAWK8rNS
         Dp77OL3BCPjsg6jVaXIt/huBbBeRjzUfhXpT512QRss1QUqeXviuX3buFrwRdA4lkV34
         +Xug==
X-Gm-Message-State: AAQBX9dDIwhkAhdOF4KQeXDTaIDFJ1FeNpMiKwEMNTVrdSMw2zWfhZNY
	N0YFR1ZNaQeTfCWZVkgBRiLmqw==
X-Google-Smtp-Source: AKy350bCAvGEny4oQbcK6hW+EriPXZ9h1014EIUuUtSNCjgSOgE+vXvCzTLS1YG+SVNb9B5PGSUOYQ==
X-Received: by 2002:a7b:c8c9:0:b0:3f1:7b8d:38ec with SMTP id f9-20020a7bc8c9000000b003f17b8d38ecmr1157488wml.35.1681998002127;
        Thu, 20 Apr 2023 06:40:02 -0700 (PDT)
Message-ID: <1e1f3a54-7113-7929-38a1-23d97bfa4d45@linaro.org>
Date: Thu, 20 Apr 2023 15:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 00/20] block: remove aio_disable_external() API
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Hanna Reitz <hreitz@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, eesposit@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

On 20/4/23 13:37, Stefan Hajnoczi wrote:
> v3:
> - Resend full patch series. v2 was sent in the middle of a git rebase and was
>    missing patches. [Eric]
> - Apply Reviewed-by tags.

> Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)

It seems kevin/block-next got rebased and doesn't contain 087bc644b76.

Based on 3d1ba50c4b ("vmdk: make vmdk_is_cid_valid a coroutine_fn")
I get:

Applying: hw/qdev: introduce qdev_is_realized() helper
Applying: virtio-scsi: avoid race between unplug and transport event
Applying: virtio-scsi: stop using aio_disable_external() during unplug
Applying: block/export: only acquire AioContext once for 
vhost_user_server_stop()
error: patch failed: util/vhost-user-server.c:346
error: util/vhost-user-server.c: patch does not apply
Patch failed at 0004 block/export: only acquire AioContext once for 
vhost_user_server_stop()

Hmm patch #4 is already merged as commit 2957dc40a2, let's skip it:

$ git am --skip
Applying: util/vhost-user-server: rename refcount to in_flight counter
Applying: block/export: wait for vhost-user-blk requests when draining
Applying: block/export: stop using is_external in vhost-user-blk server
Applying: hw/xen: do not use aio_set_fd_handler(is_external=true) in 
xen_xenstore
Applying: block: add blk_in_drain() API
Applying: block: drain from main loop thread in bdrv_co_yield_to_drain()
Applying: xen-block: implement BlockDevOps->drained_begin()
Applying: hw/xen: do not set is_external=true on evtchn fds
Applying: block/export: rewrite vduse-blk drain code
Applying: block/export: don't require AioContext lock around 
blk_exp_ref/unref()
Applying: block/fuse: do not set is_external=true on FUSE fd
Applying: virtio: make it possible to detach host notifier from any thread
Applying: virtio-blk: implement BlockDevOps->drained_begin()
Applying: virtio-scsi: implement BlockDevOps->drained_begin()
Applying: virtio: do not set is_external=true on host notifiers
Applying: aio: remove aio_disable_external() API
error: patch failed: util/fdmon-epoll.c:131
error: util/fdmon-epoll.c: patch does not apply
Patch failed at 0020 aio: remove aio_disable_external() API

Now this clashes with commit e62da98527 ("aio-posix: fix race between 
epoll upgrade and aio_set_fd_handler()").

Indeed reverting both e62da98527 / 2957dc40a2, I can apply your
series.

