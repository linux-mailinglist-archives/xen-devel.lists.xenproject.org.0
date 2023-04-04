Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F36D6379
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517866.803783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgsu-0002uJ-F0; Tue, 04 Apr 2023 13:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517866.803783; Tue, 04 Apr 2023 13:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgsu-0002rl-Bg; Tue, 04 Apr 2023 13:39:40 +0000
Received: by outflank-mailman (input) for mailman id 517866;
 Tue, 04 Apr 2023 13:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8slJ=73=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1pjgst-0002po-9E
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:39:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23f4759e-d2ee-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:39:37 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-6Lp5ym6kPTCntbQ4WZMqJg-1; Tue, 04 Apr 2023 09:39:34 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 n6-20020a5099c6000000b00502c2f26133so1037639edb.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 06:39:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 gv19-20020a1709072bd300b00931db712768sm5987531ejc.4.2023.04.04.06.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:39:32 -0700 (PDT)
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
X-Inumbo-ID: 23f4759e-d2ee-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680615576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fw7/8SirqBr4X2qtQdxLuMPR3GvOcViyBmOU340OWg=;
	b=abfSQhgaYtzYpsQ6Rnh+lCpLuRkHbswRSzvuRSvhDXXxvi4ca8/57IokU611F8OvMTEHdt
	ndEIEJLfAVib4Zc2VIjRYQZ3COnR830XjvAxZVYqEegXHTr7CxqWXkAGOImlaaZGUx7ofy
	XtDFVsigw4y8zV2Jpnsw38pU7snn5yk=
X-MC-Unique: 6Lp5ym6kPTCntbQ4WZMqJg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615574; x=1683207574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fw7/8SirqBr4X2qtQdxLuMPR3GvOcViyBmOU340OWg=;
        b=LB+SM2z/jixszcC4S+kU/T+5kPythdG193JJuhyjXTFlk5xHQCw7+BJpagOMTeoUrh
         CCi9YUMB1lPkte5FoCYtvXUQP4/pAAtSfQQPWq2mGANRP+pruJbSD88tkUqcqLD5BnEt
         Y6iszod9UKM7AHL71sojZfNlWuOaD2UEUNNgnp/WE3CdGtP1NCd3KqmNI0KlJS7HY29I
         XFabsI3IfeAZ8BYelHjVUPAm8ogLbzreXfJHWycckaBwWv4Vp5hzubPRpKj9Fie7H/tH
         2k9IsS9apxXcRZA/z5dY2HCYQKbFpc++T3OHpiwZnCDK+zdxsdKM8IHJE+1ccv0fnh4M
         9HGA==
X-Gm-Message-State: AAQBX9euaW3OLVE3BFrbnRj85lEq+Cld+jkG6qDNvryEUb2sYyBgXvVz
	jzuEJTTurKMdq+1rufFwpLuXPPb/0pSjfzWyhaWkl7LQnmex39ISZmgkrl13TWB4fyU8vGi1yoc
	Q3uDzUJrvygqsGdnqbUDIZoopW1o=
X-Received: by 2002:a17:906:aad3:b0:921:5cce:6599 with SMTP id kt19-20020a170906aad300b009215cce6599mr2419094ejb.41.1680615573825;
        Tue, 04 Apr 2023 06:39:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aaCkFAzW7d1iA6E5boAcJaqOBPLxKcd5Wvt9uXai5VAMRolWR6H8rwuM6Bp4D7FgjG04Wj5g==
X-Received: by 2002:a17:906:aad3:b0:921:5cce:6599 with SMTP id kt19-20020a170906aad300b009215cce6599mr2419071ejb.41.1680615573528;
        Tue, 04 Apr 2023 06:39:33 -0700 (PDT)
Message-ID: <c6ba263d-25e5-fde4-e46d-12929b2cd080@redhat.com>
Date: Tue, 4 Apr 2023 15:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/13] util/vhost-user-server: rename refcount to
 in_flight counter
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-5-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230403183004.347205-5-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/23 20:29, Stefan Hajnoczi wrote:
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
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/vhost-user-server.h     |  6 +++---
>   block/export/vhost-user-blk-server.c | 11 +++++++----
>   util/vhost-user-server.c             | 14 +++++++-------
>   3 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
> index 25c72433ca..bc0ac9ddb6 100644
> --- a/include/qemu/vhost-user-server.h
> +++ b/include/qemu/vhost-user-server.h
> @@ -41,7 +41,7 @@ typedef struct {
>       const VuDevIface *vu_iface;
>   
>       /* Protected by ctx lock */
> -    unsigned int refcount;
> +    unsigned int in_flight;
>       bool wait_idle;
>       VuDev vu_dev;
>       QIOChannel *ioc; /* The I/O channel with the client */
> @@ -60,8 +60,8 @@ bool vhost_user_server_start(VuServer *server,
>   
>   void vhost_user_server_stop(VuServer *server);
>   
> -void vhost_user_server_ref(VuServer *server);
> -void vhost_user_server_unref(VuServer *server);
> +void vhost_user_server_inc_in_flight(VuServer *server);
> +void vhost_user_server_dec_in_flight(VuServer *server);
>   
>   void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
>   void vhost_user_server_detach_aio_context(VuServer *server);
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 3409d9e02e..e93f2ed6b4 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -49,7 +49,10 @@ static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
>       free(req);
>   }
>   
> -/* Called with server refcount increased, must decrease before returning */
> +/*
> + * Called with server in_flight counter increased, must decrease before
> + * returning.
> + */
>   static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>   {
>       VuBlkReq *req = opaque;
> @@ -67,12 +70,12 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>                                       in_num, out_num);
>       if (in_len < 0) {
>           free(req);
> -        vhost_user_server_unref(server);
> +        vhost_user_server_dec_in_flight(server);
>           return;
>       }
>   
>       vu_blk_req_complete(req, in_len);
> -    vhost_user_server_unref(server);
> +    vhost_user_server_dec_in_flight(server);
>   }
>   
>   static void vu_blk_process_vq(VuDev *vu_dev, int idx)
> @@ -94,7 +97,7 @@ static void vu_blk_process_vq(VuDev *vu_dev, int idx)
>           Coroutine *co =
>               qemu_coroutine_create(vu_blk_virtio_process_req, req);
>   
> -        vhost_user_server_ref(server);
> +        vhost_user_server_inc_in_flight(server);
>           qemu_coroutine_enter(co);
>       }
>   }
> diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> index 5b6216069c..1622f8cfb3 100644
> --- a/util/vhost-user-server.c
> +++ b/util/vhost-user-server.c
> @@ -75,16 +75,16 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
>       error_report("vu_panic: %s", buf);
>   }
>   
> -void vhost_user_server_ref(VuServer *server)
> +void vhost_user_server_inc_in_flight(VuServer *server)
>   {
>       assert(!server->wait_idle);
> -    server->refcount++;
> +    server->in_flight++;
>   }
>   
> -void vhost_user_server_unref(VuServer *server)
> +void vhost_user_server_dec_in_flight(VuServer *server)
>   {
> -    server->refcount--;
> -    if (server->wait_idle && !server->refcount) {
> +    server->in_flight--;
> +    if (server->wait_idle && !server->in_flight) {
>           aio_co_wake(server->co_trip);
>       }
>   }
> @@ -192,13 +192,13 @@ static coroutine_fn void vu_client_trip(void *opaque)
>           /* Keep running */
>       }
>   
> -    if (server->refcount) {
> +    if (server->in_flight) {
>           /* Wait for requests to complete before we can unmap the memory */
>           server->wait_idle = true;
>           qemu_coroutine_yield();
>           server->wait_idle = false;
>       }
> -    assert(server->refcount == 0);
> +    assert(server->in_flight == 0);
>   
>       vu_deinit(vu_dev);
>   

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


