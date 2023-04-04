Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2346D5BAA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517687.803402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcmg-0006pS-MB; Tue, 04 Apr 2023 09:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517687.803402; Tue, 04 Apr 2023 09:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcmg-0006nH-Ii; Tue, 04 Apr 2023 09:16:58 +0000
Received: by outflank-mailman (input) for mailman id 517687;
 Tue, 04 Apr 2023 09:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xtki=73=redhat.com=quintela@srs-se1.protection.inumbo.net>)
 id 1pjcmf-0006nB-0w
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:16:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 709b7c78-d2c9-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:16:54 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-RJP9IdugPhGMvS-nWILlMw-1; Tue, 04 Apr 2023 05:16:50 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 d11-20020a05600c34cb00b003ee89ce8cc3so15786764wmq.7
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 02:16:50 -0700 (PDT)
Received: from redhat.com ([47.58.164.113]) by smtp.gmail.com with ESMTPSA id
 s17-20020a05600c45d100b003ed51cdb94csm21819628wmo.26.2023.04.04.02.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:16:48 -0700 (PDT)
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
X-Inumbo-ID: 709b7c78-d2c9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680599813;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=BSBmdTbfTkUl7Ea3VQh27DTaOioxkwyVdy28bzui4ZE=;
	b=hVh2hptaQSOC0hSoQw24A2g80Up/KyqVThSrXp2+tZG8e/YzKeUGj6mE8IA4xFLw6bVs3G
	83zsRHUP29HxSkk4RksOCOu5aE/Yio5NkGPqsbNqxR2VAkrKeH4Pj0tG0ksQ9wWWF7nppi
	+hZQ4LJdPPG07SFfv6ecOGRox3Vwqws=
X-MC-Unique: RJP9IdugPhGMvS-nWILlMw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680599809;
        h=mime-version:message-id:date:reply-to:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSBmdTbfTkUl7Ea3VQh27DTaOioxkwyVdy28bzui4ZE=;
        b=EA+4yCAkZ9kzkYE7qwDl0Rc1teg1CW2nk1WLN1ZMeENwbEFvhRB1bb1/XZwzvbknOo
         v2t+8YZPLSKIoLvZgelb06mzYowmhcbBnameUo3XZYJAwyByn8pyRRmOo/JHEa0UefCY
         LnonYyRAF0zNiTpoDrwzq+tk+n+CRkMzPsITrVFgRP7tnhzms9nn98ZCoSydV1FMF4QM
         LSNw77ancK/ofOWlf3By15snLmUhVWeE6KawoFetKm99XNr1P5CNImoVZGOEt1c7OTBp
         WIUMfRVqhojceu7oRH1q7YIy3L1Fvw1EPPUHhn52pmmegGiKC2oPOGKTAQ+l2+pCMas0
         5Z/A==
X-Gm-Message-State: AAQBX9d5mVWHvwhj45mhvVsD8ug2vvyV6GAxiYr/QcXkBjSE+jpQWFHq
	MjIb7wmn1NT8d2gy8nxoeo+a2HGKAviH6C6jYMJNsuE652L6CIhgLR0f306Vw9dro+ycyg3CJzJ
	v7njXO/k1ELZlClqdtqveSVqA7oU=
X-Received: by 2002:a05:6000:508:b0:2d7:89ce:8319 with SMTP id a8-20020a056000050800b002d789ce8319mr1013750wrf.27.1680599809116;
        Tue, 04 Apr 2023 02:16:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBjCYY8Gmu90141dU4yV/FMGGIfHstBOuovWY7hslWLD6VBET6tgmgZ4mx0XgXOelUMo6HKg==
X-Received: by 2002:a05:6000:508:b0:2d7:89ce:8319 with SMTP id a8-20020a056000050800b002d789ce8319mr1013723wrf.27.1680599808769;
        Tue, 04 Apr 2023 02:16:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Julia
 Suvorova <jusual@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Peter
 Lieven <pl@kamp.de>,  Coiby Xu <Coiby.Xu@gmail.com>,
  xen-devel@lists.xenproject.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Stefano Garzarella <sgarzare@redhat.com>,
  <qemu-block@nongnu.org>,  Eduardo Habkost <eduardo@habkost.net>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paul Durrant
 <paul@xen.org>,
  "Richard W.M. Jones" <rjones@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Aarushi Mehta <mehta.aaru20@gmail.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Fam Zheng <fam@euphon.net>,  David Woodhouse
 <dwmw2@infradead.org>,  Stefan Weil <sw@weilnetz.de>,  Xie Yongji
 <xieyongji@bytedance.com>,  Hanna Reitz <hreitz@redhat.com>,  Ronnie
 Sahlberg <ronniesahlberg@gmail.com>,  eesposit@redhat.com,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 13/13] aio: remove aio_disable_external() API
In-Reply-To: <20230403183004.347205-14-stefanha@redhat.com> (Stefan Hajnoczi's
	message of "Mon, 3 Apr 2023 14:30:04 -0400")
References: <20230403183004.347205-1-stefanha@redhat.com>
	<20230403183004.347205-14-stefanha@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 04 Apr 2023 11:16:46 +0200
Message-ID: <877cusroqp.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Stefan Hajnoczi <stefanha@redhat.com> wrote:
> All callers now pass is_external=false to aio_set_fd_handler() and
> aio_set_event_notifier(). The aio_disable_external() API that
> temporarily disables fd handlers that were registered is_external=true
> is therefore dead code.
>
> Remove aio_disable_external(), aio_enable_external(), and the
> is_external arguments to aio_set_fd_handler() and
> aio_set_event_notifier().
>
> The entire test-fdmon-epoll test is removed because its sole purpose was
> testing aio_disable_external().
>
> Parts of this patch were generated using the following coccinelle
> (https://coccinelle.lip6.fr/) semantic patch:
>
>   @@
>   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
>   @@
>   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
>   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)
>
>   @@
>   expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
>   @@
>   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
>   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

[....]

> diff --git a/migration/rdma.c b/migration/rdma.c
> index df646be35e..aee41ca43e 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3104,15 +3104,15 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
>  {
>      QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
>      if (io_read) {
> -        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> -        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
>      } else {
> -        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> -        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
>      }
>  }

Reviewed-by: Juan Quintela <quintela@redhat.com>

For the migration bits.
I don't even want to know why the RDMA code uses a low level block layer API.


