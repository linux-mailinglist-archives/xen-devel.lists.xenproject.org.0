Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE079D296
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 15:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600496.936140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg3hG-0000G0-Lh; Tue, 12 Sep 2023 13:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600496.936140; Tue, 12 Sep 2023 13:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg3hG-0000CY-J7; Tue, 12 Sep 2023 13:44:54 +0000
Received: by outflank-mailman (input) for mailman id 600496;
 Tue, 12 Sep 2023 13:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f83G=E4=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1qg3hF-0000CS-0J
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 13:44:53 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b1fd9ee-5172-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 15:44:50 +0200 (CEST)
Received: from [192.168.2.112] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE0926607327;
 Tue, 12 Sep 2023 14:44:47 +0100 (BST)
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
X-Inumbo-ID: 8b1fd9ee-5172-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694526289;
	bh=EHkKfcqe57CDCX9ziDQSu/VbRqDXV7EcPgLHzQgJnxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jRPAe+nhtgNxyMDTkHqXS+GRXWnK6XcdxqC+YvLEr+CRpkQThU97p3s/e0f0F6+xm
	 eL7XdGPLQoxmVnWgpBJDe1dxYX2lVwP9QPCRMCM5MYB4H7NBRDX28+dtmAQ//GlAdG
	 2eY8+qUcgBJrriFIUQxyJpCfPm9b8V2g+Ip3fc/LsHL+H8V9iIuUZ0OckI0yh7Nr7j
	 DI7d0CaKWZriF9NKfh5XD+RkDP4ZY+I/SsiYelZr9Np+b3zOvLU/6nd43UJOPqyVdv
	 IQNFPUBxQ/k5lotYBHy5DEzObPy83RfV7lP4/omn3VEO/uT1F4He0d9U+DMggx3bhg
	 9vfDPoMqf6fDg==
Message-ID: <d907fa61-6524-e673-6885-5abae21471e1@collabora.com>
Date: Tue, 12 Sep 2023 16:44:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [QEMU PATCH v4 12/13] virtio-gpu: Initialize Venus
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Antonio Caggiano <quic_acaggian@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-13-ray.huang@amd.com>
 <ca8bcf9a-2886-aed0-5229-4787808bd39c@quicinc.com>
 <5462a77f-c66d-af2d-fc07-df9f787558c2@collabora.com>
 <ZPxOuIryznYcGmLS@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZPxOuIryznYcGmLS@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/9/23 13:53, Huang Rui wrote:
> On Thu, Aug 31, 2023 at 11:51:50PM +0800, Dmitry Osipenko wrote:
>> On 8/31/23 13:40, Antonio Caggiano wrote:
>>> Hi Huang,
>>>
>>> Thank you for pushing this forward!
>>>
>>> On 31/08/2023 11:32, Huang Rui wrote:
>>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>
>>>> Request Venus when initializing VirGL.
>>>>
>>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>> ---
>>>>
>>>> v1->v2:
>>>>      - Rebase to latest version
>>>>
>>>>   hw/display/virtio-gpu-virgl.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/hw/display/virtio-gpu-virgl.c
>>>> b/hw/display/virtio-gpu-virgl.c
>>>> index 83cd8c8fd0..c5a62665bd 100644
>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>> @@ -887,6 +887,8 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>>>       }
>>>>   #endif
>>>>   +    flags |= VIRGL_RENDERER_VENUS;
>>>> +
>>>
>>> VIRGL_RENDERER_VENUS is a symbol only available from virglrenderer 0.9.1
>>> [0] and only if VIRGL_RENDERER_UNSTABLE_APIS is defined.
>>>
>>> Luckily for us, VIRGL_RENDERER_UNSTABLE_APIS is defined unconditionally
>>> from virglrenderer 0.9.0 [1], so we could check for that in
>>> qemu/meson.build
>>>
>>> e.g.
>>>
>>>
>>>   if virgl.version().version_compare('>= 0.9.0')
>>>     message('Enabling virglrenderer unstable APIs')
>>>     virgl = declare_dependency(compile_args:
>>> '-DVIRGL_RENDERER_UNSTABLE_APIS',
>>>                                dependencies: virgl)
>>>   endif
>>>
>>>
>>> Also, while testing this with various versions of virglrenderer, I
>>> realized there are no guarantees for Venus backend to be available in
>>> the linked library. Virglrenderer should be built with
>>> -Dvenus_experimental=true, and if that is not the case, the following
>>> virgl_renderer_init would fail for previous versions of virglrenderer or
>>> in case it has not been built with venus support.
>>>
>>> I would suggest another approach for that which tries initializing Venus
>>> only if VIRGL_RENDERER_VENUS is actually defined. Then, if it fails
>>> cause virglrenderer has not been built with venus support, try again
>>> falling back to virgl only.
>>
>> All the APIs will be stabilized with the upcoming virglrender 1.0
>> release that will happen soon. There is also a venus protocol bump, qemu
>> will have to bump virglrenderer's version dependency to 1.0 for venus
>> and other new features.
>>
> 
> Dmitry, do you know the timeline of virglrender 1.0?

Should be end of this week or next week

-- 
Best regards,
Dmitry


