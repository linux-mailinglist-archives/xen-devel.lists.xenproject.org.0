Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989E793426
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 05:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596171.929951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdjNz-0003LA-99; Wed, 06 Sep 2023 03:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596171.929951; Wed, 06 Sep 2023 03:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdjNz-0003Iu-5f; Wed, 06 Sep 2023 03:39:23 +0000
Received: by outflank-mailman (input) for mailman id 596171;
 Wed, 06 Sep 2023 03:39:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMkp=EW=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qdjNw-0003Io-Mi
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 03:39:20 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4bcb038-4c66-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 05:39:18 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-570e005c480so2002668eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 20:39:17 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a17090a599000b002630c9d78aasm9882458pji.5.2023.09.05.20.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 20:39:16 -0700 (PDT)
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
X-Inumbo-ID: f4bcb038-4c66-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693971556; x=1694576356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RK647TPei0/JRa8Nnw4F7PmDHS7tRWa+EVLcCk4e3Y=;
        b=qeILEIvp/TeTN5lkyjNcBd6mEECyYRhJxjiVIV2Q81NHSQPMZ9SDTk20WimL7tKFpy
         BvjliijC2q1wbu/3Md0A5IqzXGIS7ASBnhWMoifHSeG4LrUU9kCU6NpertL7y4v04Kn2
         7yRgO51J050BqEAr9QEKTwKn5oupWzVF9mJ35HlRQAZ1dp+H9vYZ5nglsWAhYhPlqzno
         ZnvJm2f9vv7Hg+8am7fIxpruXl7Mtz2ltKcpm2M9B+l74fRjOiUTlo7L82qTB2M+ZMAa
         Xfa7tvXCaNtxpdv84wnqCBcMwUubNV0T1xnC02MQXk8YUEk4yX3GPgdgccGRSZWRJO9G
         /gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693971556; x=1694576356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1RK647TPei0/JRa8Nnw4F7PmDHS7tRWa+EVLcCk4e3Y=;
        b=CWtF9MNZRMTNauP/1H0HPs5iEDs/D1bZkYuX4WMRt4k/BbmsaojeKVGKUoPBf7Owqf
         6zaMXa5Xozzc/GrKUwZNJaioX21Nt9C0hE3MCLifrE4Hlhp7kVx/92wD7nNcAWxinU/x
         NrARNJOzkcihSeHXqJUSqU8KxiJ8r3gLqK3vDc3A6AUmUpUfZjqday30cckiWpysrT2L
         PuTyFnr7WH95mX7o5d2i3A6taW2ncJ3tbdSVTuUrLtlTwobqFhUVQl6DbEuBWsRpPXq7
         oIRKKAJGKe0jByK5oWBRPDKqBbkdBrBqYehzdbDif59KOIfSfNoqZXjlwyqoyPMZGWUN
         189w==
X-Gm-Message-State: AOJu0Yyh+0LnKjr3mAvRdqlYV6jiMStoXR6DCPWzfTsOiuEGGdKLxT8x
	zNPmRZb4AdL1bmNT3SgWgiJaHQ==
X-Google-Smtp-Source: AGHT+IFmTjfxkCKTxteEIVq/a7vlVvxSoRG+U9S0V2E0ghKNvnwpNeGFb3pdSe1UTf3KK0/dnIKF/g==
X-Received: by 2002:a05:6358:c03:b0:135:ae78:56c9 with SMTP id f3-20020a0563580c0300b00135ae7856c9mr1580288rwj.6.1693971556451;
        Tue, 05 Sep 2023 20:39:16 -0700 (PDT)
Message-ID: <9d883490-3c82-4016-a290-6570f682908a@daynix.com>
Date: Wed, 6 Sep 2023 12:39:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 09/13] virtio-gpu: Handle resource blob commands
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
 <053ecca7-f76d-4289-9189-0c3600d4804b@daynix.com> <ZPftWfuwLKafLPah@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZPftWfuwLKafLPah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/06 12:09, Huang Rui wrote:
> On Tue, Sep 05, 2023 at 05:20:43PM +0800, Akihiko Odaki wrote:
>> On 2023/09/05 18:08, Huang Rui wrote:
>>> On Thu, Aug 31, 2023 at 06:24:32PM +0800, Akihiko Odaki wrote:
>>>> On 2023/08/31 18:32, Huang Rui wrote:
>>>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>>
>>>>> Support BLOB resources creation, mapping and unmapping by calling the
>>>>> new stable virglrenderer 0.10 interface. Only enabled when available and
>>>>> via the blob config. E.g. -device virtio-vga-gl,blob=true
>>>>>
>>>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>> ---
>>>>>
>>>>> v1->v2:
>>>>>        - Remove unused #include "hw/virtio/virtio-iommu.h"
>>>>>
>>>>>        - Add a local function, called virgl_resource_destroy(), that is used
>>>>>          to release a vgpu resource on error paths and in resource_unref.
>>>>>
>>>>>        - Remove virtio_gpu_virgl_resource_unmap from virtio_gpu_cleanup_mapping(),
>>>>>          since this function won't be called on blob resources and also because
>>>>>          blob resources are unmapped via virgl_cmd_resource_unmap_blob().
>>>>>
>>>>>        - In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
>>>>>          and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
>>>>>          has been fully initialized.
>>>>>
>>>>>        - Memory region has a different life-cycle from virtio gpu resources
>>>>>          i.e. cannot be released synchronously along with the vgpu resource.
>>>>>          So, here the field "region" was changed to a pointer that will be
>>>>>          released automatically once the memory region is unparented and all
>>>>>          of its references have been released.
>>>>>          Also, since the pointer can be used to indicate whether the blob
>>>>>          is mapped, the explicit field "mapped" was removed.
>>>>>
>>>>>        - In virgl_cmd_resource_map_blob(), add check on the value of
>>>>>          res->region, to prevent beeing called twice on the same resource.
>>>>>
>>>>>        - Remove direct references to parent_obj.
>>>>>
>>>>>        - Separate declarations from code.
>>>>>
>>>>>     hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
>>>>>     hw/display/virtio-gpu.c        |   4 +-
>>>>>     include/hw/virtio/virtio-gpu.h |   5 +
>>>>>     meson.build                    |   4 +
>>>>>     4 files changed, 225 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>> index 312953ec16..17b634d4ee 100644
>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>> @@ -17,6 +17,7 @@
>>>>>     #include "trace.h"
>>>>>     #include "hw/virtio/virtio.h"
>>>>>     #include "hw/virtio/virtio-gpu.h"
>>>>> +#include "hw/virtio/virtio-gpu-bswap.h"
>>>>>     
>>>>>     #include "ui/egl-helpers.h"
>>>>>     
>>>>> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>>>>>         virgl_renderer_resource_create(&args, NULL, 0);
>>>>>     }
>>>>>     
>>>>> +static void virgl_resource_destroy(VirtIOGPU *g,
>>>>> +                                   struct virtio_gpu_simple_resource *res)
>>>>> +{
>>>>> +    if (!res)
>>>>> +        return;
>>>>> +
>>>>> +    QTAILQ_REMOVE(&g->reslist, res, next);
>>>>> +
>>>>> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
>>>>> +    g_free(res->addrs);
>>>>> +
>>>>> +    g_free(res);
>>>>> +}
>>>>> +
>>>>>     static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>>>>                                          struct virtio_gpu_ctrl_command *cmd)
>>>>>     {
>>>>> +    struct virtio_gpu_simple_resource *res;
>>>>>         struct virtio_gpu_resource_unref unref;
>>>>>         struct iovec *res_iovs = NULL;
>>>>>         int num_iovs = 0;
>>>>> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>>>>         VIRTIO_GPU_FILL_CMD(unref);
>>>>>         trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>>>>>     
>>>>> +    res = virtio_gpu_find_resource(g, unref.resource_id);
>>>>> +
>>>>>         virgl_renderer_resource_detach_iov(unref.resource_id,
>>>>>                                            &res_iovs,
>>>>>                                            &num_iovs);
>>>>>         if (res_iovs != NULL && num_iovs != 0) {
>>>>>             virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
>>>>> +        if (res) {
>>>>> +            res->iov = NULL;
>>>>> +            res->iov_cnt = 0;
>>>>> +        }
>>>>>         }
>>>>> +
>>>>>         virgl_renderer_resource_unref(unref.resource_id);
>>>>> +
>>>>> +    virgl_resource_destroy(g, res);
>>>>>     }
>>>>>     
>>>>>     static void virgl_cmd_context_create(VirtIOGPU *g,
>>>>> @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>>>>>         g_free(resp);
>>>>>     }
>>>>>     
>>>>> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
>>>>> +
>>>>> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
>>>>> +                                           struct virtio_gpu_ctrl_command *cmd)
>>>>> +{
>>>>> +    struct virtio_gpu_simple_resource *res;
>>>>> +    struct virtio_gpu_resource_create_blob cblob;
>>>>> +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
>>>>> +    int ret;
>>>>> +
>>>>> +    VIRTIO_GPU_FILL_CMD(cblob);
>>>>> +    virtio_gpu_create_blob_bswap(&cblob);
>>>>> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
>>>>> +
>>>>> +    if (cblob.resource_id == 0) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
>>>>> +                      __func__);
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    res = virtio_gpu_find_resource(g, cblob.resource_id);
>>>>> +    if (res) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
>>>>> +                      __func__, cblob.resource_id);
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
>>>>> +    if (!res) {
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    res->resource_id = cblob.resource_id;
>>>>> +    res->blob_size = cblob.size;
>>>>> +
>>>>> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
>>>>> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
>>>>> +                                            cmd, &res->addrs, &res->iov,
>>>>> +                                            &res->iov_cnt);
>>>>> +        if (!ret) {
>>>>> +            g_free(res);
>>>>> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>>>> +            return;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>>>>> +
>>>>> +    virgl_args.res_handle = cblob.resource_id;
>>>>> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
>>>>> +    virgl_args.blob_mem = cblob.blob_mem;
>>>>> +    virgl_args.blob_id = cblob.blob_id;
>>>>> +    virgl_args.blob_flags = cblob.blob_flags;
>>>>> +    virgl_args.size = cblob.size;
>>>>> +    virgl_args.iovecs = res->iov;
>>>>> +    virgl_args.num_iovs = res->iov_cnt;
>>>>> +
>>>>> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
>>>>> +    if (ret) {
>>>>> +        virgl_resource_destroy(g, res);
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
>>>>> +                      __func__, strerror(-ret));
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
>>>>> +                                        struct virtio_gpu_ctrl_command *cmd)
>>>>> +{
>>>>> +    struct virtio_gpu_simple_resource *res;
>>>>> +    struct virtio_gpu_resource_map_blob mblob;
>>>>> +    int ret;
>>>>> +    void *data;
>>>>> +    uint64_t size;
>>>>> +    struct virtio_gpu_resp_map_info resp;
>>>>> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
>>>>> +
>>>>> +    VIRTIO_GPU_FILL_CMD(mblob);
>>>>> +    virtio_gpu_map_blob_bswap(&mblob);
>>>>> +
>>>>> +    if (mblob.resource_id == 0) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
>>>>> +                      __func__);
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    res = virtio_gpu_find_resource(g, mblob.resource_id);
>>>>> +    if (!res) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
>>>>> +                      __func__, mblob.resource_id);
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>>>> +        return;
>>>>> +    }
>>>>> +    if (res->region) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
>>>>> +		      __func__, mblob.resource_id);
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
>>>>> +    if (ret) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
>>>>> +                      __func__, strerror(-ret));
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    res->region = g_new0(MemoryRegion, 1);
>>>>> +    if (!res->region) {
>>>>> +        virgl_renderer_resource_unmap(res->resource_id);
>>>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>>>>> +        return;
>>>>> +    }
>>>>> +    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
>>>>
>>>> I think memory_region_init_ram_ptr() should be used instead.
>>>
>>> Would you mind to explain the reason?
>>
>> The documentation comment of memory_region_init_ram_device_ptr() says:
>>   > A RAM device represents a mapping to a physical device, such as to a
>>   > PCI MMIO BAR of an vfio-pci assigned device.  The memory region may be
>>   > mapped into the VM address space and access to the region will modify
>>   > memory directly.  However, the memory region should not be included in
>>   > a memory dump (device may not be enabled/mapped at the time of the
>>   > dump), and operations incompatible with manipulating MMIO should be
>>   > avoided.  Replaces skip_dump flag.
>>
>> In my understanding it's not MMIO so memory_region_init_ram_ptr() should
>> be used instead.
>>
> 
> It actually maybe the video memory (mmio) or system memory here. :-)
> 
> We will get the host memory for blob from host with
> virgl_renderer_resource_map() in virglrenderer. In virglrenderer, there are two
> types of VIRGL_RESOURCE_FD_DMABUF and VIRGL_RESOURCE_FD_SHM to indicate the
> memory types. The shmem is the system memory that won't need GPU
> accessible, and dmabuf is the memory that required GPU accessible. Host
> kernel amdgpu driver will register dma-buf to export the resource buffer
> for sharing, and here, it may have video memory that exposed by amdgpu pcie
> bar0 in the dma-buf buffers. And we also have system memory(gtt) that can
> be mapped as gpu page tables for gpu accessible.
> 
> 07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Renoir (rev c1) (prog-if 00 [VGA controller])
>          Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
>          Flags: bus master, fast devsel, latency 0, IRQ 56
>          Memory at fcc0000000 (64-bit, prefetchable) [size=256M]
>          Memory at fcd0000000 (64-bit, prefetchable) [size=2M]
>          I/O ports at 1000 [size=256]
>          Memory at d0400000 (32-bit, non-prefetchable) [size=512K]
>          Capabilities: <access denied>
>          Kernel driver in use: amdgpu
>          Kernel modules: amdgpu

In my understanding it is not relevant if the memory is backed by device 
or not. Here MMIO means memory-mapping I/O registers that has 
side-effects during accesses. Reading such a register may acknowledge an 
interrupt for example and the unit of writes may also matter. 
memory_region_init_ram_device_ptr() ensures no supurious memory read 
will not happen and word accesses are preserved.

They do not matter for video memory even if it lies in a separate device 
memory. In this sense the name "memory_region_init_ram_device_ptr" is 
somewhat misnomer.

Regards,
Akihiko Odaki

