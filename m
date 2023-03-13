Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64586B7204
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 10:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509193.784517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbe8N-0007O9-06; Mon, 13 Mar 2023 09:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509193.784517; Mon, 13 Mar 2023 09:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbe8M-0007LE-Sz; Mon, 13 Mar 2023 09:06:22 +0000
Received: by outflank-mailman (input) for mailman id 509193;
 Mon, 13 Mar 2023 09:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mm2P=7F=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pbe8L-0006lE-0T
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 09:06:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51f2f34d-c17e-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 10:06:20 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso7277057wms.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 02:06:20 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c354a00b003ed29b332b8sm597530wmq.35.2023.03.13.02.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:06:19 -0700 (PDT)
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
X-Inumbo-ID: 51f2f34d-c17e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678698380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bhev4z8i7cRyDcQdQN1B0BbeMECVxNAmns4FuvOcp0I=;
        b=R79ynA+KmG8ZL2nRj6rCi8bulBRvvbLMJb0zK3oURLjHwssSi+Cq3ruaxEY/HBDZPF
         q4y+Cxgb3x4SgErHaXg1rTWmpz5oNYkNzkEfiy4seK67OgH5Q3r6/YQXQ6o7v376vC1G
         gNSd88Sr9h9qnpqN1Xd9cxAlZxhV2ZPf7WpR1VXMkC/1hB5K/jTaTQiBpG8ZCr4ydHyX
         TR7m51urv6S5c8Dpse3RIyf3mZVCw+/AG9GUqnexL/6B5v73LJSTFahy2izo5qvWWYwn
         xLxoE+aFxNAsJH58IraNHkCRFRhUAEk/Sc1RAP7I4siKELX8QBM0JpvtcloeCCXYnumu
         ZQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhev4z8i7cRyDcQdQN1B0BbeMECVxNAmns4FuvOcp0I=;
        b=jpsm5nlrKTPAYYBtJQG3HhdtZl7b0yjX4PhQKs9xDpPOYpFShWsaFwhSi0e55Ozhwy
         nscycrtHqM2SN5BMDhusPpvpTHwf6dMlzviqx+S4zd3W+RAy2G/+dtF6zQVPLzZiI2Dn
         mY1otmY/oN++plCQCRt68f+AFVnv+RQSOGikPKhewtz7CwcF/61UHgQ3TGjHsvIRUiT3
         fc122nhRqhY+iyIR+N2719x7ZrcOxhhse7oUC25RIGb7XQkFz7okWdqI66KrEnlNISO2
         AdNMQgDu0U64J/mmU/ErhsMDu+vGxjN56Ka3F/gmAn6pM3vNokZkuesC8rgE30ZYeg0w
         dTVQ==
X-Gm-Message-State: AO0yUKXtdbg3Fl8xXpBeeSKUquUckwleJei6hV1kvCB+AzaFFtMB44ez
	TxmFvWF2u8UbhqjZ5z5zSaXJLw==
X-Google-Smtp-Source: AK7set/9LGwLLsHSEdQCFoX+K/JYEpsrTNO9WYnzPVS0+vntTKb80sMxu7ZftvwHUNuTbXYaqrpK8w==
X-Received: by 2002:a05:600c:cc6:b0:3ed:2949:9847 with SMTP id fk6-20020a05600c0cc600b003ed29499847mr602775wmb.10.1678698379944;
        Mon, 13 Mar 2023 02:06:19 -0700 (PDT)
Message-ID: <32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org>
Date: Mon, 13 Mar 2023 10:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-5-ray.huang@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230312092244.451465-5-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/3/23 10:22, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Create virgl renderer context with flags using context_id when valid.
> The feature can be enabled via the context_init config option.
> A warning message will be emitted and the feature will not be used
> when linking with virglrenderer versions without context_init support.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/display/virtio-gpu-base.c   |  3 +++
>   hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
>   hw/display/virtio-gpu.c        |  2 ++
>   include/hw/virtio/virtio-gpu.h |  3 +++
>   meson.build                    |  4 ++++
>   5 files changed, 26 insertions(+), 2 deletions(-)


> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 9b5e3dc782..41712b79ee 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -99,8 +99,20 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
>   
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init) {
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#else
> +        qemu_log_mask(LOG_UNIMP,
> +                      "Linked virglrenderer does not support context-init\n");

This is dubious, almost nobody will notice this log.

Can this happen? If so, this void function doesn't create any context...

> +#endif
> +    }
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>   }


