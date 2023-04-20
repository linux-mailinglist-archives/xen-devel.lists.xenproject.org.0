Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA56E92A7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524107.814751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSTh-00078r-2c; Thu, 20 Apr 2023 11:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524107.814751; Thu, 20 Apr 2023 11:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSTg-00076s-UC; Thu, 20 Apr 2023 11:29:28 +0000
Received: by outflank-mailman (input) for mailman id 524107;
 Thu, 20 Apr 2023 11:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zYAX=AL=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppSTf-0004yB-6l
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:29:27 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a7bbd1f-df6e-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:29:25 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54f6a796bd0so34920817b3.12
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 04:29:25 -0700 (PDT)
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
X-Inumbo-ID: 9a7bbd1f-df6e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681990164; x=1684582164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjZ/RzcdZKkVa0/zTvijUOjpF3h3Jp+5IB6rgUeEN4w=;
        b=WM/+x+qYreWmVU9adHqM+UxWyC0/dM50XgkM+CW+H+0ve0pPwJnx1QlGcZM0a3l9UW
         76C8ueuGvXkZ7se81BFsKNQJRq2p7ETQbYA2HnjcUrZwmeNPAgR7vBiOlJGk5m1+AvRN
         IBZBeF+XQ4yx2nSk231PpYEPg+kY5jvlmGO+nGt3mUahvja5y2mBRnckgmG5qnC3bKZJ
         56V9fUsSnSDOFyJPKBLuIJLHoPvB+0zo4aTLHYnCqXvE+4VQfEq2vKMmWcmha9cCy1/S
         vJCghyT2lP4p3ZDveLapf+W5D4+eW3fCAlug0gz/URAzGTc85PavbG4pKCs/1OqjQzuk
         8ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681990164; x=1684582164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjZ/RzcdZKkVa0/zTvijUOjpF3h3Jp+5IB6rgUeEN4w=;
        b=ZAg7Ku0FCR0upMnJMZUKLlF9MAHHMa8zMwzehFE5eJnxekZP+fhUmmu+Ld1NGtGLSd
         k7b2Wkq5WmwJbkXpNftSKZCNbE52iQHXanNHeuY3mzq4WN188OHyKHo4lHUEsZ4xHiJd
         qSi2HwFmJbBYW6VqMOnuP1qmloFiT/XriZspn82nLf7zvimCNouYvCbWfkj+jUtalofU
         O5RP5EXfgyKrkHlNUmCAqIjcxfpweUqtnx1nnws7Gey8aOy5wyHGy5wFQ6BJ7VWJOcmJ
         PTRHEWrAA/2KFvTCxg5HuAly4rP0+Qy2L7RWsxv3siRye19BCn5U3oTIHHT+QHfQ9JOx
         cPdQ==
X-Gm-Message-State: AAQBX9eq7xbOrPJWoWzAa7qrBx6Tbsp8N0HQx/kU332hC5zOi0QkKoBd
	6j6MD2ARtzyWUiFEsN03LTrLmo+89xtk+AsxQU0=
X-Google-Smtp-Source: AKy350YixT78MM+0m6MWX93M4LzsNss7C/9AVyxLfCe7ytGhtrZgR5oTod2XZI+W20XYg1P6Z9PRr+6+RonHjuqDLAo=
X-Received: by 2002:a0d:dd82:0:b0:555:d4ad:8067 with SMTP id
 g124-20020a0ddd82000000b00555d4ad8067mr512290ywe.17.1681990164463; Thu, 20
 Apr 2023 04:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230419172817.272758-1-stefanha@redhat.com> <20230419172817.272758-17-stefanha@redhat.com>
 <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
In-Reply-To: <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 20 Apr 2023 07:29:12 -0400
Message-ID: <CAJSP0QVjFcicweDxVvLyhijmdQqQPTN_uhzP2wU7ZS4ZXxKkEQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] virtio: make it possible to detach host notifier
 from any thread
To: Eric Blake <eblake@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, Paul Durrant <paul@xen.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, 
	qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Peter Lieven <pl@kamp.de>, eesposit@redhat.com, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Apr 2023 at 14:52, Eric Blake <eblake@redhat.com> wrote:
>
> On Wed, Apr 19, 2023 at 01:28:17PM -0400, Stefan Hajnoczi wrote:
> > virtio_queue_aio_detach_host_notifier() does two things:
> > 1. It removes the fd handler from the event loop.
> > 2. It processes the virtqueue one last time.
> >
> > The first step can be peformed by any thread and without taking the
> > AioContext lock.
> >
> > The second step may need the AioContext lock (depending on the device
> > implementation) and runs in the thread where request processing takes
> > place. virtio-blk and virtio-scsi therefore call
> > virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> > AioContext
> >
> > Scheduling a BH is undesirable for .drained_begin() functions. The next
> > patch will introduce a .drained_begin() function that needs to call
> > virtio_queue_aio_detach_host_notifier().
> >
> > Move the virtqueue processing out to the callers of
> > virtio_queue_aio_detach_host_notifier() so that the function can be
> > called from any thread. This is in preparation for the next patch.
> >
>
> This mentions a next patch, but is 16/16 in the series.  Am I missing
> something?

Good thing you caught this. The patch series was truncated because I
was in the middle of git rebase -i :(.

I will send a v3 with the remaining patches.

Thanks,
Stefan

