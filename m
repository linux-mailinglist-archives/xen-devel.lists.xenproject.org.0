Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D6818640
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656643.1025114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYBI-0004MU-80; Tue, 19 Dec 2023 11:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656643.1025114; Tue, 19 Dec 2023 11:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYBI-0004Jr-5P; Tue, 19 Dec 2023 11:22:36 +0000
Received: by outflank-mailman (input) for mailman id 656643;
 Tue, 19 Dec 2023 10:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pd1e=H6=damsy.net=pierre-eric@srs-se1.protection.inumbo.net>)
 id 1rFXY8-0005Cg-I9
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 10:42:09 +0000
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40a0d39b-9e5b-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 11:42:06 +0100 (CET)
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
X-Inumbo-ID: 40a0d39b-9e5b-11ee-9b0f-b553b5be7939
Message-ID: <31891dcd-d72a-4d81-8bb1-579c6a8e6365@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1702982523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3575rjkDpAj2qDIT9c9EXnf7PqaPnB51hWsSon8Voos=;
	b=bJd2yQAW9oaHXk5iTSIzLjsmuhJZxrxpEUIMh345UF3XZS3+xAsl1GPXy8Y6NAfwp1Pm7i
	YD4yTTxMEaDPJwhl4b5oSt7E6MR9zQUqhBaAaAWGLv8D6v65dtEdOMVt+LT9z0ER164xMq
	Pl5gqgbDRJxvJkBYmBNkbjZ3ZpvIKYJJAa6kZYU87GWTaUuYumbX/no+X5NWmd08+T1z07
	SLrCdWIBMP6sJRPVRt4CXgTsyN1lDL0Dz1jzkjcSt0Jae8eYQRB1zIeRkH7ORn7DrgQ9r4
	HdZq8cHOIX+y60mDkvkNCzmnzRGIl/800IOb1seWgdhqpeod75eXqE0jykUwiA==
Date: Tue, 19 Dec 2023 11:42:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 09/11] virtio-gpu: Support Venus capset
To: Huang Rui <ray.huang@amd.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
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
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-10-ray.huang@amd.com>
Content-Language: fr
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20231219075320.165227-10-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ray, Antonio,


Le 19/12/2023 à 08:53, Huang Rui a écrit :
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Add support for the Venus capset, which enables Vulkan support through
> the Venus Vulkan driver for virtio-gpu.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> No change in v6.
> 
>   hw/display/virtio-gpu-virgl.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index be9da6e780..f35a751824 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -506,6 +506,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
>           virgl_renderer_get_cap_set(resp.capset_id,
>                                      &resp.capset_max_version,
>                                      &resp.capset_max_size);
> +    } else if (info.capset_index == 2) {
> +        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
> +        virgl_renderer_get_cap_set(resp.capset_id,
> +                                   &resp.capset_max_version,
> +                                   &resp.capset_max_size);
>       } else {
>           resp.capset_max_version = 0;
>           resp.capset_max_size = 0;
> @@ -978,10 +983,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>   
>   int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
>   {
> -    uint32_t capset2_max_ver, capset2_max_size;
> +    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
> +    num_capsets = 1;
> +
>       virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
> -                              &capset2_max_ver,
> -                              &capset2_max_size);
> +                               &capset2_max_ver,
> +                               &capset2_max_size);
> +    num_capsets += capset2_max_ver ? 1 : 0;
> +
> +    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
> +                               &capset2_max_ver,
> +                               &capset2_max_size);
> +    num_capsets += capset2_max_size ? 1 : 0;

IMHO the logic here doesn't work.

The kernel will use num_capset like this:

	for (i = 0; i < num_capsets; i++) {
		virtio_gpu_cmd_get_capset_info(vgdev, i);

So if num_capset = 2, it will query the capset info of index 0 and 1.
Capset 0 is alway VIRGL so it's fine. But since VIRL2 support is optional,
QEMU has no way to know if index 1 is VIRGL2 (if it's supported)
or VENUS (if VIRGL2 support is missing).
And it'll get worse when we will want to support CAPSET_DRM.

Ray: we have a patch internally for this (virtio-gpu: fix capset query), you
may want to add it to this series, before this patch.

Regards,
Pierre-Eric



>   
> -    return capset2_max_ver ? 2 : 1;
> +    return num_capsets;
>   }

