Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BD7BFA49
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 13:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614691.955929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBEE-0001gT-Gg; Tue, 10 Oct 2023 11:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614691.955929; Tue, 10 Oct 2023 11:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBEE-0001eD-DV; Tue, 10 Oct 2023 11:48:46 +0000
Received: by outflank-mailman (input) for mailman id 614691;
 Tue, 10 Oct 2023 11:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rlhl=FY=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1qqBEC-0001e3-LK
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 11:48:44 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [2a00:1098:0:82:1000:25:2eeb:e5ab])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f643d21a-6762-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 13:48:43 +0200 (CEST)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C9F0566072B4;
 Tue, 10 Oct 2023 12:48:40 +0100 (BST)
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
X-Inumbo-ID: f643d21a-6762-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696938522;
	bh=g5jDLGrd4bhczzoKB2hcbsDdHVqqFGszi17qoFClguM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i2WbxqECpdQmDRhXT3GrjI+KJaSAOMjiHE/IK57JwqkNwsI+pdS0gkXdvTQlhMl41
	 bbO6KVcWJXBDUnmEdhygJpn+BfKgBxJKR2U3uSauPkGjshxnD1rtChyeEO3GeKJLKT
	 /lYwZTBKx5/yGKxsvcVR7DaGrsBrISdRleeXXJOmJ0Q5ZYblTqXi2lAexZ5QgkzUhH
	 OEBDQIXhhw6jB7TsNj7rMyXz+jMTusXJzRM6Ixl2qyi6D3OUV/usGa6StTpXLTzeVj
	 xgn8kdgEHZWywic/tSyQJ1GDmCPMEELALRIbzkd4jcwOv7LzWLbd05cH/8iYolREAt
	 1+LR91QFjEHfQ==
Message-ID: <6316694e-2adf-6655-583a-b59be309dccb@collabora.com>
Date: Tue, 10 Oct 2023 14:48:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [QEMU PATCH v5 13/13] virtio-gpu: Enable virglrenderer render
 server flag for venus
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-14-ray.huang@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230915111130.24064-14-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/23 14:11, Huang Rui wrote:
> Venus in virglrenderer has required render server support.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 39c04d730c..65ffce85a8 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -888,7 +888,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>  #endif
>  
>  #ifdef VIRGL_RENDERER_VENUS
> -    flags |= VIRGL_RENDERER_VENUS;
> +    flags |= VIRGL_RENDERER_VENUS | VIRGL_RENDERER_RENDER_SERVER;
>  #endif
>  
>      ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);

This change should be squashed into the previous "Initialize Venus" patch.

-- 
Best regards,
Dmitry


