Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B97A2F46
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 12:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603562.940599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhSkj-0001PL-Ti; Sat, 16 Sep 2023 10:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603562.940599; Sat, 16 Sep 2023 10:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhSkj-0001N3-PX; Sat, 16 Sep 2023 10:42:17 +0000
Received: by outflank-mailman (input) for mailman id 603562;
 Sat, 16 Sep 2023 10:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p/v=FA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhSki-0001Mv-TS
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 10:42:17 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b206892f-547d-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 12:42:13 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68fdd5c1bbbso2150910b3a.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 03:42:13 -0700 (PDT)
Received: from [192.168.159.125] ([157.82.206.1])
 by smtp.gmail.com with ESMTPSA id
 d24-20020aa78e58000000b0066a4e561beesm4429037pfr.173.2023.09.16.03.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 03:42:11 -0700 (PDT)
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
X-Inumbo-ID: b206892f-547d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694860932; x=1695465732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMlMz/YYNDZAhuao03JJ46ovHxuLEAGPhfUj85JSgJk=;
        b=WB0BYrSRFStvN1cfAFDk67P+2Gnj/jN/+p+p67vKABtAlm4qoRFM5l9mw0ah8Avj5E
         gVww+bpz/dzoD+eq2gLLai6p1MYnofCUXou51XzRnlWbzvFu7tE707P/PSff1fvLZQcD
         6DQZG7a6EcT/2ko7Q7xpM1RlMl6AJVQ3RVv5ee0zTHFgBKA6nN2Ymd8SRljbU91JlpN6
         unJKGcxTBkaKXjrjngBGmUjdwGD8eXyLohB24DE7g4BcFQpesG4M+MlhguAt8WzimLF9
         tuQTWZu72TNXAhMT9iZReOxQxEoUe8c0dNGktASmoBHOqKWaDi8eTr8tVlfc2AnAIWjJ
         23vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694860932; x=1695465732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMlMz/YYNDZAhuao03JJ46ovHxuLEAGPhfUj85JSgJk=;
        b=qQgMvqDEyXeEePZR/QlQ/ScMY3tZHGiiDZGyhcB434EdxiKHpFZRjkeLK3O+MwnlJ9
         jBaEzSlC/aDbbL2tkXXbKv1OsBM2wE1TQ5CZEfjlpqhn8ucAKL5KPqEOSGiYCYHLo1YW
         VKKtxOnBCwhKUNEtdK59ONfwJYzjYNahoiPBMHYMG9mrx2scLQgqGZxHeQzpbfOSfRAd
         Xl7tQ/DyXW7RVA0L0FasMUFuJNWR09M/B9qJ+ALTH/GQD0ykBppJecw46rkiYdraDgcA
         CeR5H0cU0AIzqU8bt5cErS1MgC13/Byo8n2DgUclabcZvd6h2BFoXBtdNhF3EIjCRdig
         7WFQ==
X-Gm-Message-State: AOJu0YzWIo4ZJgiZsK7DsdtpfFTKcFCguH6ysAyN6zYfAeMTG+QF34j7
	dwFsTeW4ZKwCJIDWl4btWL85qg==
X-Google-Smtp-Source: AGHT+IFfWi26tA9JRMHYNtmN9NsNcAFqAiwUz8BoV78jy4UsxqwdKDvn+41U5SbJAzRkO8+gt4iZgA==
X-Received: by 2002:a05:6a00:8086:b0:68e:16ce:f2e3 with SMTP id eh6-20020a056a00808600b0068e16cef2e3mr10213797pfb.0.1694860932313;
        Sat, 16 Sep 2023 03:42:12 -0700 (PDT)
Message-ID: <d671bfad-7d78-41cf-a6f4-e92bf6ce2bd5@daynix.com>
Date: Sat, 16 Sep 2023 19:42:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 06/13] virtio-gpu: Support context init feature
 with virglrenderer
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, "ernunes@redhat.com"
 <ernunes@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com> <ZQWEQ9ZHkokhKOSA@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZQWEQ9ZHkokhKOSA@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/16 19:32, Huang Rui wrote:
> On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
>> On 2023/09/15 20:11, Huang Rui wrote:
>>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
>>> feature flags.
>>> We would like to enable the feature with virglrenderer, so add to create
>>> virgl renderer context with flags using context_id when valid.
>>>
>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>
>>> V4 -> V5:
>>>       - Inverted patch 5 and 6 because we should configure
>>>         HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
>>>
>>>    hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>>>    hw/display/virtio-gpu.c       |  2 ++
>>>    2 files changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index 8bb7a2c21f..312953ec16 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>>>        trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>>>                                        cc.debug_name);
>>>    
>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>>> -                                  cc.debug_name);
>>> +    if (cc.context_init) {
>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>>> +                                                 cc.context_init,
>>> +                                                 cc.nlen,
>>> +                                                 cc.debug_name);
>>> +        return;
>>> +#endif
>>
>> This should deal with the case when context_init is set while
>> HAVE_VIRGL_CONTEXT_INIT is not defined.
> 
> Actually, I received the comment below before:
> 
> https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
> 
> At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
> but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
> the case that virgl_renderer_context_create_with_flags is not defined in
> virglrenderer early version. Should I bring the error message back?
> 
> Thanks,
> Ray

I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of 
reporting an error here. Perhaps it may be easier to add #ifdef around:
 > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
 > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),

