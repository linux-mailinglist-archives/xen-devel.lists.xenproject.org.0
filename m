Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15E88BCDE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 09:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697969.1089247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp2ZA-0008LE-K6; Tue, 26 Mar 2024 08:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697969.1089247; Tue, 26 Mar 2024 08:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp2ZA-0008Jh-Gx; Tue, 26 Mar 2024 08:53:56 +0000
Received: by outflank-mailman (input) for mailman id 697969;
 Tue, 26 Mar 2024 08:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DPpp=LA=damsy.net=pierre-eric@srs-se1.protection.inumbo.net>)
 id 1rp2Z7-0008Jb-Jw
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 08:53:54 +0000
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc1ba34-eb4e-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 09:53:51 +0100 (CET)
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
X-Inumbo-ID: 5dc1ba34-eb4e-11ee-a1ef-f123f15fe8a2
Message-ID: <20ca2a39-cf41-4a7b-8c94-c4e193018147@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1711443228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFjPbfFF8Mxh31f2Q1P0/8J/bltLrrx4Y06I0UEXuv8=;
	b=dnaIRgc23uUz3xOG60/r013Vp2tnh7Wlez3aTAw55DqebDQn1DXohc6w+WiJ7P9fqvUm3n
	ErhlNgNpy2Hwz6flWDNTXLr3nIIXrU9iTsHpXQiODCsRNfqVpI30wW8zVsA8sAg4V8n4yk
	b0nhMtG/5G3Pd2EFbgw9fwHwhSZ2xYfBJAVpKfbsw9yNGnBTGh9g3bo7ZczCj8D+jaVjPs
	lEkfVHNJNMQhykAbJm1fg5zwkB8ZNmWoxN08e7ANWkqJ/YiMvg9eHjOpMxVY3BWdM2GW0b
	P1Xm3wgh44ETKCBHNLg2G+KQpcVwKZQ0yEk//+xOVWxhjM620qw5kgdQAweJvw==
Date: Tue, 26 Mar 2024 09:53:47 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 10/11] virtio-gpu: Initialize Venus
To: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-11-ray.huang@amd.com>
 <CAJ+F1C+gQ7kwAD=Tv7uAgKtgA57wPkZcE_zadAogtMUEFUmFnQ@mail.gmail.com>
 <ZdhiO0ZEZS9lmAeo@amd.com>
Content-Language: fr
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <ZdhiO0ZEZS9lmAeo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/02/2024 à 10:15, Huang Rui a écrit :
> On Tue, Jan 02, 2024 at 09:33:11PM +0800, Marc-André Lureau wrote:
>> Hi
>>
>> On Tue, Dec 19, 2023 at 11:55 AM Huang Rui <ray.huang@amd.com> wrote:
>>>
>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>
>>> Request Venus when initializing VirGL.
>>>
>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>
>>> Changes in v6:
>>> - Remove the unstable API flags check because virglrenderer is already 1.0.
>>> - Squash the render server flag support into "Initialize Venus".
>>>
>>>   hw/display/virtio-gpu-virgl.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index f35a751824..c523a6717a 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -964,6 +964,10 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>>       }
>>>   #endif
>>>
>>> +#ifdef VIRGL_RENDERER_VENUS
>>> +    flags |= VIRGL_RENDERER_VENUS | VIRGL_RENDERER_RENDER_SERVER;
>>> +#endif
>>> +
>>
>> I wonder if it's a good idea to initialize venus by default. It
>> doesn't seem to require vulkan during initialization, but this may
>> evolve. Make it optional?
>>
> 
> I am fine. In fact, vulkan is widely used for graphic area such as gaming,
> compute, VR/AR, etc.

Actually, making it optional is useful because Venus support is optional in
virglrenderer (= having VIRGL_RENDERER_VENUS defined doesn't mean that
Venus is supported).

Thanks,
Pierre-Eric


> 
> Thanks,
> Ray
> 
>>>       ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
>>>       if (ret != 0) {
>>>           error_report("virgl could not be initialized: %d", ret);
>>> --
>>> 2.25.1
>>>
>>
>>
>> -- 
>> Marc-André Lureau
> 

