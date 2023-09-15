Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475897A23E3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 18:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603309.940264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhBzW-0001nW-AV; Fri, 15 Sep 2023 16:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603309.940264; Fri, 15 Sep 2023 16:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhBzW-0001kW-7Y; Fri, 15 Sep 2023 16:48:26 +0000
Received: by outflank-mailman (input) for mailman id 603309;
 Fri, 15 Sep 2023 16:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cweo=E7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhBzU-0001kJ-Sf
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 16:48:24 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf9c9f0-53e7-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 18:48:22 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68fbd5cd0ceso2040283b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 09:48:22 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090ab79100b00262eccfa29fsm4990545pjr.33.2023.09.15.09.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 09:48:20 -0700 (PDT)
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
X-Inumbo-ID: adf9c9f0-53e7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694796501; x=1695401301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ABFv1pK71RPcXpZmYjUJAjE3pR/vvyihnbU3LDvHYM=;
        b=i1390cPAXNtV3h2TxMComW+ybl5jYzmWeq6FU2hqcuxB0lo2duAap2XsQHdOSMRpcd
         RVM8pjZ3qm2Qxh82Okk81YI+TQaiyNljvnmo0wCE2VPezXcm2fN29RHLbrQPx+m4AwPo
         kS9GFHLsDqMzCOML3WrZ1DFpjkmBZgFZVCo/DyGfzfX2DaXtfxvqmJxw5FxZSyL1tQ6K
         l9VK1fsFvpgWMqEB0zCOs2ayrNPKjpucsZigfZ4nH6r9Ml0gjXSxOGg5j+3cLgVGxYnL
         jKKOEfLxSHK6nf8sIPyIsf3/t1mn/ucILO0HrHVnjz6I0bqfdgoR3Waf2IdYHEc37Q5E
         w0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694796501; x=1695401301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ABFv1pK71RPcXpZmYjUJAjE3pR/vvyihnbU3LDvHYM=;
        b=QVS6OqDubwPgYBfjCb61p4QNGh5WUJ12Y/5gfHlXQ9Gx5u/v5sROxrvA1rPgb4hg7l
         2QIs5F02cY6M3A1iPwmfdmCO0mn1Q5XiSrTMcdxohh1yiIMuZi1KmOqSaOvnA37yRrZz
         Jiy9BXD2mUxghOisf+Sb033dS8Gs1skWh+rfa/kVywPaEiT/8CN5arjLwITgVrA7FjXy
         YI6vxjrYhYsu3UOc1213hdjW08uj/CP3HjylBijfU8iAOPfUwqa56wJOXmbwePz1YuNz
         HQ96e3sIgD0vjCpRQFkAPzYaBzlRCKmUh+89YKxiGuoaebAYYaKhNraKNNF3KPeY1O21
         AzCQ==
X-Gm-Message-State: AOJu0YzKPyqUc/N3negddWuTzFlYC6dvHPX5lhMgMJJcxIx+YrkDus6N
	4wrVKgspI6VEdiaTnxULIM3nyA==
X-Google-Smtp-Source: AGHT+IHli99nSnZrzIK9dwMuLFLoTLYUlA60VSGUBhns+P/ipbmvVaqxTm9+cI83BiSH03TdQVZIsA==
X-Received: by 2002:a17:90a:fb92:b0:274:6a79:17c1 with SMTP id cp18-20020a17090afb9200b002746a7917c1mr2090131pjb.15.1694796500796;
        Fri, 15 Sep 2023 09:48:20 -0700 (PDT)
Message-ID: <a3a46b78-9feb-47f3-bd3e-519ebe899737@daynix.com>
Date: Sat, 16 Sep 2023 01:48:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 10/13] virtio-gpu: Resource UUID
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-11-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230915111130.24064-11-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/15 20:11, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Enable resource UUID feature and implement command resource assign UUID.
> This is done by introducing a hash table to map resource IDs to their
> UUIDs.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> V4 -> V5:
>      - Add virtio migration handling for uuid (Akihiko)
>      - Adjust sequence to allocate gpu resource before virglrender resource
>        creation (Akihiko)
>      - Clean up (Akihiko)
> 
>   hw/display/trace-events        |  1 +
>   hw/display/virtio-gpu-base.c   |  2 ++
>   hw/display/virtio-gpu-virgl.c  | 21 ++++++++++++
>   hw/display/virtio-gpu.c        | 58 ++++++++++++++++++++++++++++++++++
>   include/hw/virtio/virtio-gpu.h |  6 ++++
>   5 files changed, 88 insertions(+)
> 
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index 2336a0ca15..54d6894c59 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
>   virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
>   virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
>   virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
> +virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
>   virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
>   virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
>   virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index 4f2b0ba1f3..f44388715c 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -236,6 +236,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
>           features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
>       }
>   
> +    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
> +
>       return features;
>   }
>   
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 563a6f2f58..8a017dbeb4 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -36,11 +36,20 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
>   {
>       struct virtio_gpu_resource_create_2d c2d;
>       struct virgl_renderer_resource_create_args args;
> +    struct virtio_gpu_simple_resource *res;
>   
>       VIRTIO_GPU_FILL_CMD(c2d);
>       trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
>                                          c2d.width, c2d.height);
>   
> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> +    if (!res) {
> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> +        return;
> +    }
> +    res->resource_id = c2d.resource_id;
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> +

The struct virtio_gpu_simple_resource for a resource created with 
virgl_cmd_create_resource_2d() and virgl_resource_attach_backing() will 
not have iov and iov_cnt set, which is inconsistent with 
virgl_cmd_resource_create_blob().

>       args.handle = c2d.resource_id;
>       args.target = 2;
>       args.format = c2d.format;
> @@ -60,11 +69,20 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>   {
>       struct virtio_gpu_resource_create_3d c3d;
>       struct virgl_renderer_resource_create_args args;
> +    struct virtio_gpu_simple_resource *res;
>   
>       VIRTIO_GPU_FILL_CMD(c3d);
>       trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
>                                          c3d.width, c3d.height, c3d.depth);
>   
> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> +    if (!res) {
> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> +        return;
> +    }
> +    res->resource_id = c3d.resource_id;
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> +
>       args.handle = c3d.resource_id;
>       args.target = c3d.target;
>       args.format = c3d.format;
> @@ -682,6 +700,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>           /* TODO add security */
>           virgl_cmd_ctx_detach_resource(g, cmd);
>           break;
> +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> +        virtio_gpu_resource_assign_uuid(g, cmd);
> +        break;
>       case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
>           virgl_cmd_get_capset_info(g, cmd);
>           break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index cc4c1f81bb..44414c1c5e 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -966,6 +966,38 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
>       virtio_gpu_cleanup_mapping(g, res);
>   }
>   
> +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> +                                     struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_assign_uuid assign;
> +    struct virtio_gpu_resp_resource_uuid resp;
> +    QemuUUID *uuid;
> +
> +    VIRTIO_GPU_FILL_CMD(assign);
> +    virtio_gpu_bswap_32(&assign, sizeof(assign));
> +    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
> +
> +    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
> +    if (!res) {
> +        return;
> +    }
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
> +
> +    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
> +    if (!uuid) {
> +        uuid = g_new(QemuUUID, 1);
> +        qemu_uuid_generate(uuid);
> +        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
> +        res->has_uuid = true;
> +    }

What about embedding uuid into struct virtio_gpu_simple_resource? You 
will not need to maintain another table in this way.

