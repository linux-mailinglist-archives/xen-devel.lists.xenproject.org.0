Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D14792164
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595518.929110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSEv-0004Bp-GD; Tue, 05 Sep 2023 09:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595518.929110; Tue, 05 Sep 2023 09:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSEv-00049K-D0; Tue, 05 Sep 2023 09:20:53 +0000
Received: by outflank-mailman (input) for mailman id 595518;
 Tue, 05 Sep 2023 09:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5vf=EV=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qdSEu-000499-8G
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:20:52 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80eddaa9-4bcd-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 11:20:50 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c06f6f98c0so17123935ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 02:20:50 -0700 (PDT)
Received: from [157.82.204.253] ([157.82.204.253])
 by smtp.gmail.com with ESMTPSA id
 ju20-20020a170903429400b001b672af624esm8931499plb.164.2023.09.05.02.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 02:20:48 -0700 (PDT)
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
X-Inumbo-ID: 80eddaa9-4bcd-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693905649; x=1694510449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noZcTROyvKGLT7OS+tdoVzmRn0DMVveNoAJHiI7S8hA=;
        b=Eozk6DT6vgH2eIjyaLDiXiXWhqp2LGOQ2YZKE7wGqt2u6hpi5P9Kj3prNpNLiXO3AG
         DZGiLXO3q7RaLY5uxWQFDjM+/AkzENkBGrRkekA8YSeozUThkdTAzU/DmriNRZD48+PE
         6zhuijzPNnHWMr0SOLS0ryl2+HlLtfv58OD+t71YB2wf/q+bjhhrLmSuSSQA8W1flWmi
         xXlWWbx4gQsonpQo46VZcBYkN4keSoJq7K+99PN3pPqZ9Z2aVYiy7kMGznCXn0/K3iYQ
         ANNoqcXKNlL3jj5ToY48gHk7wGnNuVtr+YuDbjuJKZ6CeslFbu35t27DxG67AVMvneYF
         CyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693905649; x=1694510449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noZcTROyvKGLT7OS+tdoVzmRn0DMVveNoAJHiI7S8hA=;
        b=h5H459/bwnJI2V9FEWPgoZ69SouO93BLrivXsc3UusB3BjAr+PKyvs5+6dv1Lzucfx
         9ksoxnVHywjDXbleTLrKQXatBCneHJAhB7iAU3icHvBRtnhmHEkdoRxXmXcNIbxcOmWr
         rH1nZHCZIsGRfnspdQUNf7I86Sl65tZfnjNPhoBp2BLwDvdzw0qAOCk/43Fem0WF8JDp
         RzjMJPB/vaSZHdgcS+9j6oibJWNJD+Bwh8i8diuOLuPOeuUuKivTOb8Idkf495SEqBLt
         Z8bKUXXf8seceBIhtteNtvNYLGQhOe0QhotdaTm8Zv5lr2EPpzDf5nlz44jkm/6zJqbY
         yoig==
X-Gm-Message-State: AOJu0Yxm1HKmUauug/Ctdkckzw7TA/+jgTH21VBQKoAI4o242J+P4AAJ
	b496c15UtbnNyLFtevQuv6wybg==
X-Google-Smtp-Source: AGHT+IFen8AN/Q9ef6hgMdPtr3VaUTRz2tC5gD2pyhrsBICbeDQj1dG7i6bKZTSjkHSDp79ReDyy8g==
X-Received: by 2002:a17:902:e84e:b0:1c3:4565:225 with SMTP id t14-20020a170902e84e00b001c345650225mr3760241plg.10.1693905649240;
        Tue, 05 Sep 2023 02:20:49 -0700 (PDT)
Message-ID: <053ecca7-f76d-4289-9189-0c3600d4804b@daynix.com>
Date: Tue, 5 Sep 2023 18:20:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 09/13] virtio-gpu: Handle resource blob commands
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-10-ray.huang@amd.com>
 <ba478789-5db0-4011-bed1-7dd6901eccd6@daynix.com> <ZPbwGA3apjQTtCeu@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZPbwGA3apjQTtCeu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/05 18:08, Huang Rui wrote:
> On Thu, Aug 31, 2023 at 06:24:32PM +0800, Akihiko Odaki wrote:
>> On 2023/08/31 18:32, Huang Rui wrote:
>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>
>>> Support BLOB resources creation, mapping and unmapping by calling the
>>> new stable virglrenderer 0.10 interface. Only enabled when available and
>>> via the blob config. E.g. -device virtio-vga-gl,blob=true
>>>
>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>
>>> v1->v2:
>>>       - Remove unused #include "hw/virtio/virtio-iommu.h"
>>>
>>>       - Add a local function, called virgl_resource_destroy(), that is used
>>>         to release a vgpu resource on error paths and in resource_unref.
>>>
>>>       - Remove virtio_gpu_virgl_resource_unmap from virtio_gpu_cleanup_mapping(),
>>>         since this function won't be called on blob resources and also because
>>>         blob resources are unmapped via virgl_cmd_resource_unmap_blob().
>>>
>>>       - In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
>>>         and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
>>>         has been fully initialized.
>>>
>>>       - Memory region has a different life-cycle from virtio gpu resources
>>>         i.e. cannot be released synchronously along with the vgpu resource.
>>>         So, here the field "region" was changed to a pointer that will be
>>>         released automatically once the memory region is unparented and all
>>>         of its references have been released.
>>>         Also, since the pointer can be used to indicate whether the blob
>>>         is mapped, the explicit field "mapped" was removed.
>>>
>>>       - In virgl_cmd_resource_map_blob(), add check on the value of
>>>         res->region, to prevent beeing called twice on the same resource.
>>>
>>>       - Remove direct references to parent_obj.
>>>
>>>       - Separate declarations from code.
>>>
>>>    hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
>>>    hw/display/virtio-gpu.c        |   4 +-
>>>    include/hw/virtio/virtio-gpu.h |   5 +
>>>    meson.build                    |   4 +
>>>    4 files changed, 225 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index 312953ec16..17b634d4ee 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -17,6 +17,7 @@
>>>    #include "trace.h"
>>>    #include "hw/virtio/virtio.h"
>>>    #include "hw/virtio/virtio-gpu.h"
>>> +#include "hw/virtio/virtio-gpu-bswap.h"
>>>    
>>>    #include "ui/egl-helpers.h"
>>>    
>>> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>>>        virgl_renderer_resource_create(&args, NULL, 0);
>>>    }
>>>    
>>> +static void virgl_resource_destroy(VirtIOGPU *g,
>>> +                                   struct virtio_gpu_simple_resource *res)
>>> +{
>>> +    if (!res)
>>> +        return;
>>> +
>>> +    QTAILQ_REMOVE(&g->reslist, res, next);
>>> +
>>> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
>>> +    g_free(res->addrs);
>>> +
>>> +    g_free(res);
>>> +}
>>> +
>>>    static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>>                                         struct virtio_gpu_ctrl_command *cmd)
>>>    {
>>> +    struct virtio_gpu_simple_resource *res;
>>>        struct virtio_gpu_resource_unref unref;
>>>        struct iovec *res_iovs = NULL;
>>>        int num_iovs = 0;
>>> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>>        VIRTIO_GPU_FILL_CMD(unref);
>>>        trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>>>    
>>> +    res = virtio_gpu_find_resource(g, unref.resource_id);
>>> +
>>>        virgl_renderer_resource_detach_iov(unref.resource_id,
>>>                                           &res_iovs,
>>>                                           &num_iovs);
>>>        if (res_iovs != NULL && num_iovs != 0) {
>>>            virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
>>> +        if (res) {
>>> +            res->iov = NULL;
>>> +            res->iov_cnt = 0;
>>> +        }
>>>        }
>>> +
>>>        virgl_renderer_resource_unref(unref.resource_id);
>>> +
>>> +    virgl_resource_destroy(g, res);
>>>    }
>>>    
>>>    static void virgl_cmd_context_create(VirtIOGPU *g,
>>> @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>>>        g_free(resp);
>>>    }
>>>    
>>> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
>>> +
>>> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
>>> +                                           struct virtio_gpu_ctrl_command *cmd)
>>> +{
>>> +    struct virtio_gpu_simple_resource *res;
>>> +    struct virtio_gpu_resource_create_blob cblob;
>>> +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
>>> +    int ret;
>>> +
>>> +    VIRTIO_GPU_FILL_CMD(cblob);
>>> +    virtio_gpu_create_blob_bswap(&cblob);
>>> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
>>> +
>>> +    if (cblob.resource_id == 0) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
>>> +                      __func__);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> +        return;
>>> +    }
>>> +
>>> +    res = virtio_gpu_find_resource(g, cblob.resource_id);
>>> +    if (res) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
>>> +                      __func__, cblob.resource_id);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> +        return;
>>> +    }
>>> +
>>> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
>>> +    if (!res) {
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>>> +        return;
>>> +    }
>>> +
>>> +    res->resource_id = cblob.resource_id;
>>> +    res->blob_size = cblob.size;
>>> +
>>> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
>>> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
>>> +                                            cmd, &res->addrs, &res->iov,
>>> +                                            &res->iov_cnt);
>>> +        if (!ret) {
>>> +            g_free(res);
>>> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>> +            return;
>>> +        }
>>> +    }
>>> +
>>> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>>> +
>>> +    virgl_args.res_handle = cblob.resource_id;
>>> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
>>> +    virgl_args.blob_mem = cblob.blob_mem;
>>> +    virgl_args.blob_id = cblob.blob_id;
>>> +    virgl_args.blob_flags = cblob.blob_flags;
>>> +    virgl_args.size = cblob.size;
>>> +    virgl_args.iovecs = res->iov;
>>> +    virgl_args.num_iovs = res->iov_cnt;
>>> +
>>> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
>>> +    if (ret) {
>>> +        virgl_resource_destroy(g, res);
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
>>> +                      __func__, strerror(-ret));
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>> +    }
>>> +}
>>> +
>>> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
>>> +                                        struct virtio_gpu_ctrl_command *cmd)
>>> +{
>>> +    struct virtio_gpu_simple_resource *res;
>>> +    struct virtio_gpu_resource_map_blob mblob;
>>> +    int ret;
>>> +    void *data;
>>> +    uint64_t size;
>>> +    struct virtio_gpu_resp_map_info resp;
>>> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
>>> +
>>> +    VIRTIO_GPU_FILL_CMD(mblob);
>>> +    virtio_gpu_map_blob_bswap(&mblob);
>>> +
>>> +    if (mblob.resource_id == 0) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
>>> +                      __func__);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> +        return;
>>> +    }
>>> +
>>> +    res = virtio_gpu_find_resource(g, mblob.resource_id);
>>> +    if (!res) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
>>> +                      __func__, mblob.resource_id);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> +        return;
>>> +    }
>>> +    if (res->region) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
>>> +		      __func__, mblob.resource_id);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> +        return;
>>> +    }
>>> +
>>> +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
>>> +    if (ret) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
>>> +                      __func__, strerror(-ret));
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> +        return;
>>> +    }
>>> +
>>> +    res->region = g_new0(MemoryRegion, 1);
>>> +    if (!res->region) {
>>> +        virgl_renderer_resource_unmap(res->resource_id);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>>> +        return;
>>> +    }
>>> +    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
>>
>> I think memory_region_init_ram_ptr() should be used instead.
> 
> Would you mind to explain the reason?

The documentation comment of memory_region_init_ram_device_ptr() says:
 > A RAM device represents a mapping to a physical device, such as to a
 > PCI MMIO BAR of an vfio-pci assigned device.  The memory region may be
 > mapped into the VM address space and access to the region will modify
 > memory directly.  However, the memory region should not be included in
 > a memory dump (device may not be enabled/mapped at the time of the
 > dump), and operations incompatible with manipulating MMIO should be
 > avoided.  Replaces skip_dump flag.

In my understanding it's not MMIO so memory_region_init_ram_ptr() should 
be used instead.

Regards,
Akihiko Odaki

