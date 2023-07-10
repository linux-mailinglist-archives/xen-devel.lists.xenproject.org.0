Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713874DF38
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 22:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561392.877812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxUh-0003gS-3X; Mon, 10 Jul 2023 20:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561392.877812; Mon, 10 Jul 2023 20:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxUg-0003en-Vr; Mon, 10 Jul 2023 20:28:26 +0000
Received: by outflank-mailman (input) for mailman id 561392;
 Mon, 10 Jul 2023 20:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c7NE=C4=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1qIxUf-0003ef-Rh
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 20:28:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 508c6358-1f60-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 22:28:23 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-WRs3s3g_O-6JV55ZazwumA-1; Mon, 10 Jul 2023 16:28:20 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so28054505e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 13:28:20 -0700 (PDT)
Received: from redhat.com ([2.52.3.112]) by smtp.gmail.com with ESMTPSA id
 12-20020a05600c020c00b003f819faff24sm11271958wmi.40.2023.07.10.13.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 13:28:18 -0700 (PDT)
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
X-Inumbo-ID: 508c6358-1f60-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689020902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jkwGuIFG1SK+UCnr46kX8hPtrp2iQsEAiNCq9TRDIhw=;
	b=eUNu67+Th9yBeskfA3tX5FMsgAnMFgJFpYndF5hCdtaqXWLTBduWzcaeC6wjNWIcQJGfxB
	xJQbjpTJcWZHn37AwrI/0UiE7r8o9oU7d/40IGxEnoO1JQLv0g8IlR/t+0+lwpoKGdLWGx
	TyG6PFgBKAdSTMIt1KCNxPEyiTQLm10=
X-MC-Unique: WRs3s3g_O-6JV55ZazwumA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689020899; x=1691612899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkwGuIFG1SK+UCnr46kX8hPtrp2iQsEAiNCq9TRDIhw=;
        b=SfiUDmCxLaKWKA8M4AttERu7wf5o/rpWBYFNQy6ErpDvDMAUCN9PJet4/htzbRHWv7
         xYZ6L0kxieKnbji/v17+aPKAHj7StanTcBu/OWqBiBT/xQr8jTtLEktZr+16S/KZCagT
         bTQIOjjfAEaTGmhVhf3WPYJpj1cBJyQDYT29fB+EzroI0MA5Q7wURwecK7g5HovrUyaj
         D5xwFm+UGz9LOqtJBaO5Zj1wnURL9tUeYxRUwW5UuhJ7PFLWt6vbldl/IuHF89D7qXim
         7ENZMpJ3ELauX7ulkEKtmf+WrNQqjrGWbNITYp/x5QbCjiNm9/02uTl6tUoFF2S8qEjS
         9IIA==
X-Gm-Message-State: ABy/qLZYywFQLbZzoxPDA2FYyzJvNcYVsJ43Gv1RL6Bppg0sySXiwvLk
	99liWoVY4r2uv8CYMkqGpOaNun51Fbk9Q1QHVkX1tz2XnTdRTZiQTVoEjLRJJPohRVp5UVezkWI
	irnpxQkE384tq2fyECbHpir93K1w=
X-Received: by 2002:a7b:ca56:0:b0:3f9:b7cc:723 with SMTP id m22-20020a7bca56000000b003f9b7cc0723mr12503525wml.21.1689020899672;
        Mon, 10 Jul 2023 13:28:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFn9MJIGZ5J7zvoOUSlngeHqYdlX4r3C3gtIWEX/wGiS84dSbvt+bv7qqt7jwtSoAbn/5mCyA==
X-Received: by 2002:a7b:ca56:0:b0:3f9:b7cc:723 with SMTP id m22-20020a7bca56000000b003f9b7cc0723mr12503501wml.21.1689020899294;
        Mon, 10 Jul 2023 13:28:19 -0700 (PDT)
Date: Mon, 10 Jul 2023 16:28:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>
Subject: Re: [QEMU PATCH v2 1/1] virtgpu: do not destroy resources when guest
 suspend
Message-ID: <20230710162702-mutt-send-email-mst@kernel.org>
References: <20230630070016.841459-1-Jiqian.Chen@amd.com>
 <20230630070016.841459-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230630070016.841459-2-Jiqian.Chen@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 30, 2023 at 03:00:16PM +0800, Jiqian Chen wrote:
> After suspending and resuming guest VM, you will get
> a black screen, and the display can't come back.
> 
> This is because when guest did suspending, it called
> into qemu to call virtio_gpu_gl_reset. In function
> virtio_gpu_gl_reset, it destroyed resources and reset
> renderer, which were used for display. As a result,
> guest's screen can't come back to the time when it was
> suspended and only showed black.
> 
> So, this patch adds a new ctrl message
> VIRTIO_GPU_CMD_STATUS_FREEZING to get notification from
> guest. If guest is during suspending, it sets freezing
> status of virtgpu to true, this will prevent destroying
> resources and resetting renderer when guest calls into
> virtio_gpu_gl_reset. If guest is during resuming, it sets
> freezing to false, and then virtio_gpu_gl_reset will keep
> its origin actions and has no other impaction.
> 
> Due to this implemention needs cooperation with guest, so
> it added a new feature flag VIRTIO_GPU_F_FREEZING, so
> that guest and host can negotiate whenever freezing is
> supported or not.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  hw/display/virtio-gpu-base.c                |  3 ++
>  hw/display/virtio-gpu-gl.c                  |  9 +++-
>  hw/display/virtio-gpu-virgl.c               |  7 +++
>  hw/display/virtio-gpu.c                     | 52 ++++++++++++++++++++-
>  hw/virtio/virtio.c                          |  3 ++
>  include/hw/virtio/virtio-gpu.h              |  6 +++
>  include/standard-headers/linux/virtio_gpu.h | 15 ++++++
>  7 files changed, 92 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index a29f191aa8..d55dc8fdfc 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
>      if (virtio_gpu_blob_enabled(g->conf)) {
>          features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>      }
> +    if (virtio_gpu_freezing_enabled(g->conf)) {
> +        features |= (1 << VIRTIO_GPU_F_FREEZING);
> +    }
>  
>      return features;
>  }
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index e06be60dfb..de108f1502 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -100,7 +100,14 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
>       */
>      if (gl->renderer_inited && !gl->renderer_reset) {
>          virtio_gpu_virgl_reset_scanout(g);
> -        gl->renderer_reset = true;
> +        /*
> +         * If guest is suspending, we shouldn't reset renderer,
> +         * otherwise, the display can't come back to the time when
> +         * it was suspended after guest resumed.
> +         */
> +        if (!virtio_gpu_freezing_enabled(g->parent_obj.conf) || !g->freezing) {
> +            gl->renderer_reset = true;
> +        }
>      }
>  }
>  
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 73cb92c8d5..547c4d98ad 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -464,6 +464,13 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_EDID:
>          virtio_gpu_get_edid(g, cmd);
>          break;
> +    case VIRTIO_GPU_CMD_STATUS_FREEZING:
> +        if (virtio_gpu_freezing_enabled(g->parent_obj.conf)) {
> +            virtio_gpu_cmd_status_freezing(g, cmd);
> +        } else {
> +            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> +        }
> +        break;
>      default:
>          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 5e15c79b94..54a5e2e57c 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -373,6 +373,16 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>      QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>  }
>  
> +void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
> +                         struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virtio_gpu_status_freezing sf;
> +
> +    VIRTIO_GPU_FILL_CMD(sf);
> +    virtio_gpu_bswap_32(&sf, sizeof(sf));
> +    g->freezing = sf.freezing;
> +}
> +
>  static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
>  {
>      struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
> @@ -986,6 +996,13 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
>          virtio_gpu_resource_detach_backing(g, cmd);
>          break;
> +    case VIRTIO_GPU_CMD_STATUS_FREEZING:
> +        if (virtio_gpu_freezing_enabled(g->parent_obj.conf)) {
> +            virtio_gpu_cmd_status_freezing(g, cmd);
> +        } else {
> +            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> +        }
> +        break;
>      default:
>          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> @@ -1344,6 +1361,27 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
>      QTAILQ_INIT(&g->reslist);
>      QTAILQ_INIT(&g->cmdq);
>      QTAILQ_INIT(&g->fenceq);
> +
> +    g->freezing = false;
> +}
> +
> +static void virtio_gpu_device_unrealize(DeviceState *qdev)
> +{
> +    VirtIOGPU *g = VIRTIO_GPU(qdev);
> +    struct virtio_gpu_simple_resource *res, *tmp;
> +
> +    /*
> +     * This is to prevent memory leak in the situation that qemu is
> +     * destroyed when guest is suspended. This also need hot-plug
> +     * support.
> +     */
> +    if (virtio_gpu_freezing_enabled(g->parent_obj.conf) && g->freezing) {
> +        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
> +            virtio_gpu_resource_destroy(g, res);
> +        }
> +        virtio_gpu_virgl_reset(g);
> +    }
> +
>  }
>  
>  void virtio_gpu_reset(VirtIODevice *vdev)
> @@ -1352,8 +1390,15 @@ void virtio_gpu_reset(VirtIODevice *vdev)
>      struct virtio_gpu_simple_resource *res, *tmp;
>      struct virtio_gpu_ctrl_command *cmd;
>  
> -    QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
> -        virtio_gpu_resource_destroy(g, res);
> +    /*
> +     * If guest is suspending, we shouldn't destroy resources,
> +     * otherwise, the display can't come back to the time when
> +     * it was suspended after guest resumed.
> +     */
> +    if (!virtio_gpu_freezing_enabled(g->parent_obj.conf) || !g->freezing) {
> +        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
> +            virtio_gpu_resource_destroy(g, res);
> +        }
>      }
>  
>      while (!QTAILQ_EMPTY(&g->cmdq)) {
> @@ -1425,6 +1470,8 @@ static Property virtio_gpu_properties[] = {
>                       256 * MiB),
>      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> +    DEFINE_PROP_BIT("freezing", VirtIOGPU, parent_obj.conf.flags,
> +                    VIRTIO_GPU_FLAG_FREEZING_ENABLED, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -1441,6 +1488,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
>      vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
>  
>      vdc->realize = virtio_gpu_device_realize;
> +    vdc->unrealize = virtio_gpu_device_unrealize;
>      vdc->reset = virtio_gpu_reset;
>      vdc->get_config = virtio_gpu_get_config;
>      vdc->set_config = virtio_gpu_set_config;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eb6347ab5d..e2ccf50a9e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -240,6 +240,9 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>      FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
>              "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
>              "timelines supported"),
> +    FEATURE_ENTRY(VIRTIO_GPU_F_FREEZING, \
> +            "VIRTIO_GPU_F_FREEZING: Freezing virtio-gpu and keeping resources"
> +            "alive is supported."),
>      FEATURE_ENTRY(VHOST_F_LOG_ALL, \
>              "VHOST_F_LOG_ALL: Logging write descriptors supported"),
>      FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 2e28507efe..53e06e47cb 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
>      VIRTIO_GPU_FLAG_EDID_ENABLED,
>      VIRTIO_GPU_FLAG_DMABUF_ENABLED,
>      VIRTIO_GPU_FLAG_BLOB_ENABLED,
> +    VIRTIO_GPU_FLAG_FREEZING_ENABLED,
>  };
>  
>  #define virtio_gpu_virgl_enabled(_cfg) \
> @@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
>  #define virtio_gpu_blob_enabled(_cfg) \
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> +#define virtio_gpu_freezing_enabled(_cfg) \
> +    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_FREEZING_ENABLED))
>  
>  struct virtio_gpu_base_conf {
>      uint32_t max_outputs;
> @@ -173,6 +176,7 @@ struct VirtIOGPU {
>  
>      uint64_t hostmem;
>  
> +    bool freezing;
>      bool processing_cmdq;
>      QEMUTimer *fence_poll;
>      QEMUTimer *print_stats;
> @@ -284,5 +288,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
>  void virtio_gpu_virgl_reset(VirtIOGPU *g);
>  int virtio_gpu_virgl_init(VirtIOGPU *g);
>  int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
> +void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
> +                         struct virtio_gpu_ctrl_command *cmd);
>  
>  #endif
> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
> index 2da48d3d4c..cc9286b30e 100644
> --- a/include/standard-headers/linux/virtio_gpu.h
> +++ b/include/standard-headers/linux/virtio_gpu.h
> @@ -65,6 +65,11 @@
>   */
>  #define VIRTIO_GPU_F_CONTEXT_INIT        4
>  
> +/*
> + * VIRTIO_GPU_CMD_STATUS_FREEZING
> + */
> +#define VIRTIO_GPU_F_FREEZING            5
> +
>  enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_UNDEFINED = 0,
>  
> @@ -100,6 +105,9 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
>  	VIRTIO_GPU_CMD_MOVE_CURSOR,
>  
> +	/* status */
> +	VIRTIO_GPU_CMD_STATUS_FREEZING = 0x0400,
> +
>  	/* success responses */
>  	VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
>  	VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
> @@ -116,6 +124,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID,
>  	VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID,
>  	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
> +
>  };
>  


???

>  enum virtio_gpu_shm_id {
> @@ -453,4 +462,10 @@ struct virtio_gpu_resource_unmap_blob {
>  	uint32_t padding;
>  };
>  
> +/* VIRTIO_GPU_CMD_STATUS_FREEZING */
> +struct virtio_gpu_status_freezing {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__u32 freezing;
> +};
> +


Fails build on mingw:

/scm/qemu/include/standard-headers/linux/virtio_gpu.h:468:9: error: unknown type name '__u32'
  468 |         __u32 freezing;
      |         ^~~~~


Reason is you are not supposed to edit this directly: it has to be edited
in linux then we import it.




>  #endif
> -- 
> 2.34.1


