Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A070F15E
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538892.839239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kAA-0007Is-Kh; Wed, 24 May 2023 08:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538892.839239; Wed, 24 May 2023 08:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kAA-0007Gq-Gz; Wed, 24 May 2023 08:48:06 +0000
Received: by outflank-mailman (input) for mailman id 538892;
 Wed, 24 May 2023 08:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1kA9-0007Gi-RC
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:48:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2014364-fa0f-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 10:48:04 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-yfskZc9gPxSUclOgW4g4cA-1; Wed, 24 May 2023 04:48:02 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f604687a23so3072045e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:48:02 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adfce8e000000b00306c5900c10sm13805227wrn.9.2023.05.24.01.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:47:59 -0700 (PDT)
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
X-Inumbo-ID: b2014364-fa0f-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684918083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ice5vyWLZIdFvZsU4KYca0HCuRNiy82oFSrQDE43eC4=;
	b=cQoD5sPLM1F3kKxTKZo+X13YmvgvLgLJ/4VXV3QWZUfSxOnt9UOYJuvThme6jIK+FJl60E
	hN/I4/tpW5Yrgytk+Hmpa5OErY/xKgoGBd+ps7xlMvQxJIgBWj9unu3TKZUDKb+sIWH7on
	lM6DMRriicAcc6TtPxNyP2LLuYH/058=
X-MC-Unique: yfskZc9gPxSUclOgW4g4cA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918081; x=1687510081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ice5vyWLZIdFvZsU4KYca0HCuRNiy82oFSrQDE43eC4=;
        b=kZwUwlrhMsuWMhORb1REWUtlKRanmIE0/9fkB5FMM/drUkhyMYITiSrVLcQw8F0gpj
         qW1zZ3L+xMQQl1XStdrOmE5H1ubymr0uzhFXnDVmCBPstB7qS+kAcAQC8MS1ejf3AtyR
         D7EzOgvhWvrhYqmT7J+4SmygfLvvjKtJF5MK2ipxKax/hQb31qp9A1VCA7SXPtX6jaLu
         VGYqgp0S5ZCfRBWmYQSoEAVAPv3F5lkAIhQOQ9bGuk3ITUNHtTQzZ21Lmbj5WSpaDg0S
         Fjs7z7f8lmRPSjd34xsRCBhKNU2f6K6vM3s+ECq7kiBqPZH8nTNHeeV5R+H9OhF2aoe+
         4Kaw==
X-Gm-Message-State: AC+VfDxoc+hlDhaWrRvcA13hWozm/RJNcUzFMCNYJiLN9Iy9/M3SJUzm
	3yuPu0jCwAVHr3HHmNwS8B0MZ4E38jVJflk14wyUw4uIy/K/EQWme3UZoASsAf39o5Y9aUXekeG
	qk5XGjDh8E1S3AuBzfj3zZ+3dBFg=
X-Received: by 2002:a7b:ce88:0:b0:3f6:c7b:d3b7 with SMTP id q8-20020a7bce88000000b003f60c7bd3b7mr3479825wmj.37.1684918080856;
        Wed, 24 May 2023 01:48:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UHT/Zh7wO+OH1Oxh3QT/tcrOrKhvVcbUbZ7TzycjShzVBmTQRbmnX0N1Gj6T5Sjrqzkd74Q==
X-Received: by 2002:a7b:ce88:0:b0:3f6:c7b:d3b7 with SMTP id q8-20020a7bce88000000b003f60c7bd3b7mr3479809wmj.37.1684918080585;
        Wed, 24 May 2023 01:48:00 -0700 (PDT)
Date: Wed, 24 May 2023 10:47:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	eblake@redhat.com, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 4/6] block/io_uring: convert to blk_io_plug_call() API
Message-ID: <qnl7sgmindnbs32daw44rhgbyhcw4lruecqgtctdbeiwc7yog2@yxuukgxwi4m3>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-5-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523171300.132347-5-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:58PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
>v2
>- Removed whitespace hunk [Eric]
>---
> include/block/raw-aio.h |  7 -------
> block/file-posix.c      | 10 ----------
> block/io_uring.c        | 44 ++++++++++++++++-------------------------
> block/trace-events      |  5 ++---
> 4 files changed, 19 insertions(+), 47 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


