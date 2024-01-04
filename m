Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1721F824078
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661551.1031269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLkh-0005nC-53; Thu, 04 Jan 2024 11:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661551.1031269; Thu, 04 Jan 2024 11:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLkh-0005kc-26; Thu, 04 Jan 2024 11:19:07 +0000
Received: by outflank-mailman (input) for mailman id 661551;
 Thu, 04 Jan 2024 11:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Him7=IO=damsy.net=pierre-eric@srs-se1.protection.inumbo.net>)
 id 1rLLkf-0005io-9o
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:19:05 +0000
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ceb6c7-aaf3-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 12:19:03 +0100 (CET)
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
X-Inumbo-ID: 10ceb6c7-aaf3-11ee-9b0f-b553b5be7939
Message-ID: <4acdfad6-ae3d-4b83-918f-a01019085547@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1704367141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4b9ebvtppbjDbWObrdXgfDr/y7eRq4/3Oa5/eNGMebI=;
	b=YyKPTawc/yifINUeC4lQ8vTQD+4oB7T2tpkTXWm3QJYY/zoqJmfPTVUgQrYp/r/cBnpykh
	v/zs/Z2GeCyd3mD0vxBKRSj7DvyBCNZ7CsOel3DKBrBNRNCKUFZxUc/s1u0v//7QxZZHcv
	ak1UDhHs/hZxoYZuwqLPObG6PWmPPa+8lfihbgdzMy103HxIhsD1fTKdmXp8wq+aKrAqX1
	CXFWHYs0/+S7xRkZ9DIR5oMyAhBwRK0PQ7ByakxXzv5zSH1hdBjdkQcXU/sL6EcMAl0EJx
	POQdnE7YCa6V+Hxcfd3pNXJsKSY1t6UEhR0LX/6p2YbN9kYjjzzp8pyPnm5Ctw==
Date: Thu, 4 Jan 2024 12:19:00 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 11/11] virtio-gpu: make blob scanout use dmabuf fd
Content-Language: fr
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-12-ray.huang@amd.com>
 <a2c0a1f1-45a2-4957-9919-0d0cb19cd285@daynix.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <a2c0a1f1-45a2-4957-9919-0d0cb19cd285@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 21/12/2023 à 07:25, Akihiko Odaki a écrit :
> On 2023/12/19 16:53, Huang Rui wrote:
>> From: Robert Beckett <bob.beckett@collabora.com>
>>
>> This relies on a virglrenderer change to include the dmabuf fd when
>> returning resource info.
>>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> ---
>>
>> Changes in v6:
>> - Add scanout_blob function for virtio-gpu-virgl.
>> - Update for new virgl_gpu_resource.
>>
>>   hw/display/virtio-gpu-virgl.c  | 104 +++++++++++++++++++++++++++++++++
>>   hw/display/virtio-gpu.c        |   4 +-
>>   include/hw/virtio/virtio-gpu.h |   6 ++
>>   3 files changed, 112 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>> index c523a6717a..c384225a98 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -18,6 +18,7 @@
>>   #include "hw/virtio/virtio.h"
>>   #include "hw/virtio/virtio-gpu.h"
>>   #include "hw/virtio/virtio-gpu-bswap.h"
>> +#include "hw/virtio/virtio-gpu-pixman.h"
>>   #include "ui/egl-helpers.h"
>> @@ -726,6 +727,106 @@ static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
>>       object_unparent(OBJECT(mr));
>>   }
>> +static void virgl_cmd_set_scanout_blob(VirtIOGPU *g,
>> +                                       struct virtio_gpu_ctrl_command *cmd)
>> +{
>> +    struct virgl_gpu_resource *vres;
>> +    struct virtio_gpu_framebuffer fb = { 0 };
>> +    struct virtio_gpu_set_scanout_blob ss;
>> +    struct virgl_renderer_resource_info info;
>> +    uint64_t fbend;
>> +
>> +    VIRTIO_GPU_FILL_CMD(ss);
>> +    virtio_gpu_scanout_blob_bswap(&ss);
>> +    trace_virtio_gpu_cmd_set_scanout_blob(ss.scanout_id, ss.resource_id,
>> +                                          ss.r.width, ss.r.height, ss.r.x,
>> +                                          ss.r.y);
>> +
>> +    if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
>> +                      __func__, ss.scanout_id);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
>> +        return;
>> +    }
>> +
>> +    if (ss.resource_id == 0) {
>> +        virtio_gpu_disable_scanout(g, ss.scanout_id);
>> +        return;
>> +    }
>> +
>> +    if (ss.width < 16 ||
>> +        ss.height < 16 ||
>> +        ss.r.x + ss.r.width > ss.width ||
>> +        ss.r.y + ss.r.height > ss.height) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds for"
>> +                      " resource %d, rect (%d,%d)+%d,%d, fb %d %d\n",
>> +                      __func__, ss.scanout_id, ss.resource_id,
>> +                      ss.r.x, ss.r.y, ss.r.width, ss.r.height,
>> +                      ss.width, ss.height);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> +        return;
>> +    }
>> +
>> +    if (!console_has_gl(g->parent_obj.scanout[ss.scanout_id].con)) {
> 
> Shouldn't OpenGL always be available for virgl?
> 
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unable to scanout blot without GL!\n", __func__);
>> +        return;
>> +    }
>> +
>> +    vres = virgl_gpu_find_resource(g, ss.resource_id);
>> +    if (!vres) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: illegal resource specified %d\n",
>> +                      __func__, ss.resource_id);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>> +        return;
>> +    }
>> +    if (virgl_renderer_resource_get_info(ss.resource_id, &info)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: illegal virgl resource specified %d\n",
>> +                      __func__, ss.resource_id);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>> +        return;
>> +    }
>> +    if (!vres->res.dmabuf_fd && info.fd)
>> +        vres->res.dmabuf_fd = info.fd;
>> +
>> +    fb.format = virtio_gpu_get_pixman_format(ss.format);
>> +    if (!fb.format) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: host couldn't handle guest format %d\n",
>> +                      __func__, ss.format);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> +        return;
>> +    }
>> +
>> +    fb.bytes_pp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(fb.format), 8);
>> +    fb.width = ss.width;
>> +    fb.height = ss.height;
>> +    fb.stride = ss.strides[0];
>> +    fb.offset = ss.offsets[0] + ss.r.x * fb.bytes_pp + ss.r.y * fb.stride;
>> +
>> +    fbend = fb.offset;
>> +    fbend += fb.stride * (ss.r.height - 1);
>> +    fbend += fb.bytes_pp * ss.r.width;
>> +    if (fbend > vres->res.blob_size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: fb end out of range\n",
>> +                      __func__);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> +        return;
>> +    }
>> +
>> +    g->parent_obj.enable = 1;
>> +    if (virtio_gpu_update_dmabuf(g, ss.scanout_id, &vres->res,
>> +                                 &fb, &ss.r)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: failed to update dmabuf\n", __func__);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> +        return;
>> +    }
>> +    virtio_gpu_update_scanout(g, ss.scanout_id, &vres->res, &ss.r);
>> +}
>> +
>>   #endif /* HAVE_VIRGL_RESOURCE_BLOB */
>>   void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>> @@ -807,6 +908,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>>       case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
>>           virgl_cmd_resource_unmap_blob(g, cmd);
>>           break;
>> +    case VIRTIO_GPU_CMD_SET_SCANOUT_BLOB:
> 
> VIRTIO_GPU_CMD_SET_SCANOUT_BLOB support should be added before allowing the user to enable the resource blob support.

It seems that two patches were squashed together:

- "virtio-gpu: Handle set scanout blob command" by Antonio Caggiano
- "virtio-gpu: Handle set scanout blob command" by Bob Beckett

Restoring the original patches with the appropriate S-o-b tags seems the right thing to do.

Thanks,
Pierre-Eric
> 
> You should also check if virtio_vdev_has_feature(VIRTIO_DEVICE(g), VIRTIO_GPU_F_RESOURCE_BLOB). It also applies to other resource blob commands though I failed to note that for the earlier patch.
> 

