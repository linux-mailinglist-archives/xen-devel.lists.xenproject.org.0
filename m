Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA070F03A
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538818.839079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jXr-0004Y6-8Y; Wed, 24 May 2023 08:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538818.839079; Wed, 24 May 2023 08:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jXr-0004VE-5I; Wed, 24 May 2023 08:08:31 +0000
Received: by outflank-mailman (input) for mailman id 538818;
 Wed, 24 May 2023 08:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1jXp-0004Uz-B1
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:08:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29037790-fa0a-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:08:27 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-SZjLovacMxmjtGVxjpIsCw-1; Wed, 24 May 2023 04:08:25 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f60f085cd2so2514725e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:08:23 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1c6a08000000b003f41bb52834sm1408937wmc.38.2023.05.24.01.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:08:21 -0700 (PDT)
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
X-Inumbo-ID: 29037790-fa0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684915706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtyDgeve/qnGaPE92shW9EZgBMKYja34N8neosaUrjA=;
	b=aSrXYIItHG0SoAUbNOmeN30HihO2b7AF42xMOeuepq5cynjIpb3h+EWgOYWcTK8ukFeupI
	sYknpFcZDbmXeLYYPbiGgLRQ+WjZAgj8YPP2ffiYH9qx6zFj01yhIu02mGdUgoJw1ATLgW
	E0O8W3v0TiUFLDn0OQ2dOS7h6roQlZE=
X-MC-Unique: SZjLovacMxmjtGVxjpIsCw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684915703; x=1687507703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtyDgeve/qnGaPE92shW9EZgBMKYja34N8neosaUrjA=;
        b=LTTLaAOQlKP66u3w30ijqCz8tLIyjcckRCUzrN767Iwkzx1URVIVY1D709gQ2H/42U
         mlMBXhChT4XIeveb8iXR9jeAa3lTPZ4kgj0yAYgeT5KKx0H2F3MTd2UaxUB4L9SfyPrb
         41XevQiGu3/JOkxOGkMrb1514nCdbmVbJut0ETJ7ATPaUZ+09td7TjcKqgYXmVcYyLi6
         EYro0pZGpnijRZ/LwwLegxWqDfY+UB6dmTV+JL+CvQ7jDkdHg311DxPC23JkEU5jJQ1S
         kGKuzqtdt0/xGlGU0ajCW9GGxXs2bLKKz3CQazrDzCwFbHW/iPlPkYlIPrx1TErP3l49
         v/Xw==
X-Gm-Message-State: AC+VfDxJRTD8TEt+/ACQaCJqVc9UpvYAQKKvZpHGl1HF2mO5naC1Q/Pd
	WJye3tW7qghfEmsq+sdtNlT3vFquerwcMdYQjRX2f3sR4y58bWbMwQF5cZbEvC539iaMKcAbvCI
	gxIbEx+iYOK3rO20+P/0v5GHVE3o=
X-Received: by 2002:a05:600c:2152:b0:3f6:938:1001 with SMTP id v18-20020a05600c215200b003f609381001mr4316374wml.8.1684915702808;
        Wed, 24 May 2023 01:08:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OZ1cIk0Dqc8AIrN6VBJlUyMvP0RkdvvnqSAdc1TcTNBSiUtLIy6saUk6qZOkQyyZ9l92FHg==
X-Received: by 2002:a05:600c:2152:b0:3f6:938:1001 with SMTP id v18-20020a05600c215200b003f609381001mr4316360wml.8.1684915702550;
        Wed, 24 May 2023 01:08:22 -0700 (PDT)
Date: Wed, 24 May 2023 10:08:18 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	eblake@redhat.com, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 1/6] block: add blk_io_plug_call() API
Message-ID: <dpbl4aehbrgii34tibg3pzgkdsi56vxtvk66657ksqedho3cnv@fhbd2jozlhdp>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523171300.132347-2-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:55PM -0400, Stefan Hajnoczi wrote:
>Introduce a new API for thread-local blk_io_plug() that does not
>traverse the block graph. The goal is to make blk_io_plug() multi-queue
>friendly.
>
>Instead of having block drivers track whether or not we're in a plugged
>section, provide an API that allows them to defer a function call until
>we're unplugged: blk_io_plug_call(fn, opaque). If blk_io_plug_call() is
>called multiple times with the same fn/opaque pair, then fn() is only
>called once at the end of the function - resulting in batching.
>
>This patch introduces the API and changes blk_io_plug()/blk_io_unplug().
>blk_io_plug()/blk_io_unplug() no longer require a BlockBackend argument
>because the plug state is now thread-local.
>
>Later patches convert block drivers to blk_io_plug_call() and then we
>can finally remove .bdrv_co_io_plug() once all block drivers have been
>converted.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
>v2
>- "is not be freed" -> "is not freed" [Eric]
>---
> MAINTAINERS                       |   1 +
> include/sysemu/block-backend-io.h |  13 +--
> block/block-backend.c             |  22 -----
> block/plug.c                      | 159 ++++++++++++++++++++++++++++++
> hw/block/dataplane/xen-block.c    |   8 +-
> hw/block/virtio-blk.c             |   4 +-
> hw/scsi/virtio-scsi.c             |   6 +-
> block/meson.build                 |   1 +
> 8 files changed, 173 insertions(+), 41 deletions(-)
> create mode 100644 block/plug.c

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


