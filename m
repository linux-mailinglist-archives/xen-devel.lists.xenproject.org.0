Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF986D5C15
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517701.803433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjd7Z-00028f-0T; Tue, 04 Apr 2023 09:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517701.803433; Tue, 04 Apr 2023 09:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjd7Y-00025I-Tn; Tue, 04 Apr 2023 09:38:32 +0000
Received: by outflank-mailman (input) for mailman id 517701;
 Tue, 04 Apr 2023 09:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGS1=73=redhat.com=dgilbert@srs-se1.protection.inumbo.net>)
 id 1pjd7X-00025C-9e
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:38:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74b0c826-d2cc-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:38:30 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-4kZDA1kzP8OvR8XertBUoQ-1; Tue, 04 Apr 2023 05:38:25 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 t9-20020adfba49000000b002dd3986083bso3601087wrg.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 02:38:25 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c218500b003ed243222adsm14539157wme.42.2023.04.04.02.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:38:23 -0700 (PDT)
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
X-Inumbo-ID: 74b0c826-d2cc-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680601108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrhRpuE5PfYdyTK6FnQG64gKAkt74Bkdl20J+vUSjAY=;
	b=FCGjmNrGWmqVC6GsMsCbqwGSvXl+NyJS+9aMQ4g8aI6GWehtHWt1yIuOIdu1ubhi347BjA
	VXgzuL/f5SnK9PZD2bPsMA+griQj6gPlNnMTiwa1DQ2NQ9Jj2vTGivcyj9SwhBnbe+eKCL
	WdHKv9QBovcwgjsLoTpQMpQNTHOmbqo=
X-MC-Unique: 4kZDA1kzP8OvR8XertBUoQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601104; x=1683193104;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrhRpuE5PfYdyTK6FnQG64gKAkt74Bkdl20J+vUSjAY=;
        b=1kJDy+OxjQOX+xUYuwBsQUedTf5o+ipR1S+z5p79ZfV0w3dRcW7DAtv4mD54u6p62q
         IkAlEpnV7d7ITGnXjR1xyQFrj/GzFtDJIpROOhyYw91iHf/kSYJcUIeMAA1HxK1gbH9D
         nX9yiJCTymjUrEQlqC0K4YadqGHVkP9evkG8dqLfY3q7wpqz3Svyewd3sKGWfPGhQgN6
         3KrqJCEJEYf2iulrZ1hGH5vdL3L5cWoDlJ68Dh74PiSpCM+3DOaVBrjQIIflXIxNL5kk
         DDM9jqwhAr/Zwvw91l72OLmsewanIIUVwmThYSy+9Iscgh87z30LdtJcUW+HFKEqxy+q
         i/vQ==
X-Gm-Message-State: AAQBX9f8fYMXvTsIKVwW5urqyO232RlJniZW69YPgQH1nWoDiwEaaS87
	3ylo1ZTczkQsiKGWAwDTrGZNcpNlB7Wl1tZtU7OWmLdUV7rJ9Tyq22d8OZt0lHkN2zWUWQCO1Sx
	DGRW7OFs/jfY33qo+eMtTaefYiyE=
X-Received: by 2002:a7b:c38a:0:b0:3ed:e715:1784 with SMTP id s10-20020a7bc38a000000b003ede7151784mr1947188wmj.15.1680601104666;
        Tue, 04 Apr 2023 02:38:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350arlH3TpIuzppyhWEkgvJ11yISyREQNvnJp5gdw8zP6hTf84qhuHwXkNDKAhWVO4OJfBTXc1g==
X-Received: by 2002:a7b:c38a:0:b0:3ed:e715:1784 with SMTP id s10-20020a7bc38a000000b003ede7151784mr1947163wmj.15.1680601104292;
        Tue, 04 Apr 2023 02:38:24 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:38:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>, David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 13/13] aio: remove aio_disable_external() API
Message-ID: <ZCvwDVPTNS8VUtVb@work-vm>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-14-stefanha@redhat.com>
 <877cusroqp.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <877cusroqp.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Juan Quintela (quintela@redhat.com) wrote:
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > All callers now pass is_external=false to aio_set_fd_handler() and
> > aio_set_event_notifier(). The aio_disable_external() API that
> > temporarily disables fd handlers that were registered is_external=true
> > is therefore dead code.
> >
> > Remove aio_disable_external(), aio_enable_external(), and the
> > is_external arguments to aio_set_fd_handler() and
> > aio_set_event_notifier().
> >
> > The entire test-fdmon-epoll test is removed because its sole purpose was
> > testing aio_disable_external().
> >
> > Parts of this patch were generated using the following coccinelle
> > (https://coccinelle.lip6.fr/) semantic patch:
> >
> >   @@
> >   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
> >   @@
> >   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
> >   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)
> >
> >   @@
> >   expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
> >   @@
> >   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
> >   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> [....]
> 
> > diff --git a/migration/rdma.c b/migration/rdma.c
> > index df646be35e..aee41ca43e 100644
> > --- a/migration/rdma.c
> > +++ b/migration/rdma.c
> > @@ -3104,15 +3104,15 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
> >  {
> >      QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
> >      if (io_read) {
> > -        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > -        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> >      } else {
> > -        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > -        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> >      }
> >  }
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> For the migration bits.
> I don't even want to know why the RDMA code uses a low level block layer API.

I don't think it's block specific.
It looks like it's because qio_channel uses aio in the case where
something QIO_CHANNEL_ERR_BLOCK and then waits for the recovery; see
4d9f675 that added it.

Dave
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


