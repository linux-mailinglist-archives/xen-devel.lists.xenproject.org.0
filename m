Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60356E8C8A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523945.814387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPVE-000377-2f; Thu, 20 Apr 2023 08:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523945.814387; Thu, 20 Apr 2023 08:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPVE-00034y-02; Thu, 20 Apr 2023 08:18:52 +0000
Received: by outflank-mailman (input) for mailman id 523945;
 Thu, 20 Apr 2023 08:18:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wBYt=AL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ppPVC-00034i-NK
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:18:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa0591f1-df53-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 10:18:49 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so3145415e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 01:18:49 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d4f92000000b002c7163660a9sm1252678wru.105.2023.04.20.01.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:18:47 -0700 (PDT)
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
X-Inumbo-ID: fa0591f1-df53-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681978728; x=1684570728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LudFVx/kmb9nhOnpzQ2miKh295xVDuQ1UuHNRlYF5E8=;
        b=ZKvH4ZcWBUH/wCLtBz693lPtHcwRTD4bd932yhoiieRpluJcdneoiyJ88m2vBBZFoN
         Ijbn7atjnwH4cst2NNEcbt9dzwzAUuIW8O+bb6EQRkrSTAB+5khMOWc5rCA3mCcsUtf8
         fKK65BEau5W2824TUa1Ohd/Vqc3GcW1njv56LvA0yJKYWLuW5foU9kMfBeIi/BSkZlAw
         LpYyY1gY7MNisFs3dAqsjnyFMEPW5iJ0MISjV1Qlc5W+lr7/Zt2KeDvoY+13nPVkhVkf
         tkV82da0HgJE7NiRM4gmM+V9odZbEFTdRG9U30ZqqnGnkWLIxL06qACDZsly3QMLsh+y
         gZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681978728; x=1684570728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LudFVx/kmb9nhOnpzQ2miKh295xVDuQ1UuHNRlYF5E8=;
        b=dw9BUxSg1aIvqAwQKcm8n7yPMwFazjkOk9nmjrkEHfkdc5nYnaxjhkv1ej/wkbGtTy
         Ta4zr4oUvzG9ZScyVGOXL8Tij8m8gvq3+KLOjw99t285Ozsn0+srPJpmJQf331C2Amhv
         x2kUloGfphP1JyL6MaTHO4nFc6d+NRtT40SV/CuyBYSllAQwTwy+m6pJeXvAQxhI0Niu
         PzZc3WLUYRVHYTuk4gUFs8yVUalawI9dB8ej+6QDHGb6KCfD+byMDcrFbaWVaT5Fe7gX
         6oEPoIl3YOGZJtBhrfNz9S2YYcyze9lDvuT2k1Oh5kk/AV4OfcjmVFxAYcFVUqn+UlTq
         P/0Q==
X-Gm-Message-State: AAQBX9cHJKJlzULY5VaNpzcq3RL2NVGYEffNmlGqtSa1KADTLznNX7Qk
	V2hCGNskT1zkhCGq+6iNhauRkw==
X-Google-Smtp-Source: AKy350YVxN5lhmruZ0zTbMvn34EXb83NU6+ImB/xmwIw6S7TfcXRxCS0cGTACE75Tjyv4xAwd3Bvkw==
X-Received: by 2002:a5d:6592:0:b0:2e5:56f8:61fc with SMTP id q18-20020a5d6592000000b002e556f861fcmr578070wru.15.1681978728456;
        Thu, 20 Apr 2023 01:18:48 -0700 (PDT)
Message-ID: <f25c43d7-2924-b739-ec65-a10523d4e566@linaro.org>
Date: Thu, 20 Apr 2023 10:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/16] util/vhost-user-server: rename refcount to
 in_flight counter
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Lieven <pl@kamp.de>,
 eesposit@redhat.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-6-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419172817.272758-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/4/23 19:28, Stefan Hajnoczi wrote:
> The VuServer object has a refcount field and ref/unref APIs. The name is
> confusing because it's actually an in-flight request counter instead of
> a refcount.
> 
> Normally a refcount destroys the object upon reaching zero. The VuServer
> counter is used to wake up the vhost-user coroutine when there are no
> more requests.
> 
> Avoid confusing by renaming refcount and ref/unref to in_flight and
> inc/dec.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/vhost-user-server.h     |  6 +++---
>   block/export/vhost-user-blk-server.c | 11 +++++++----
>   util/vhost-user-server.c             | 14 +++++++-------
>   3 files changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


