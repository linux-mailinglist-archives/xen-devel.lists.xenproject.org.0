Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9756D52FF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 23:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517609.803212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjRKw-0003dB-6T; Mon, 03 Apr 2023 21:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517609.803212; Mon, 03 Apr 2023 21:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjRKw-0003aq-2V; Mon, 03 Apr 2023 21:03:34 +0000
Received: by outflank-mailman (input) for mailman id 517609;
 Mon, 03 Apr 2023 21:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/kjH=72=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1pjRKv-0003ak-8J
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 21:03:33 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [2a00:1098:0:82:1000:25:2eeb:e5ab])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fac0cbc5-d262-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 23:03:28 +0200 (CEST)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru
 [109.252.124.32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E46C66003B2;
 Mon,  3 Apr 2023 22:03:25 +0100 (BST)
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
X-Inumbo-ID: fac0cbc5-d262-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680555807;
	bh=Q2hdVjNQTK+EUWtWpCirhufnEV7FHiF9pY75Mt779/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lSLI99hnfSoTDZNCbIO7NvqqKE1AY7Sp3cn/LgehMOJ5vXw5XO2KoBa+lQQeCO5bd
	 OP+7K5/00TbABp2dHoU+RS6AigJN09CS3ANla0f8/Ycdu4YQQTVffyIxOm2rn67//I
	 uuBD4Pky5TjcN6f8kBfyO/KOfc2OxUZiLi2+6MvH/KkQo74OlVTA7Pj2rLL6UmB8+4
	 y/+dHo2GKHOnrS4U0MRoUBwrVm2gDVgC68qQ+kEmhY5XN0vHKOSHUSYUdxrAy8Pr2p
	 uwjs8vaYrkGffNsznnM+mFxL1ctoxvapXD7xQ0I/d5xRelHCPUTmnPYMSupsYY9C17
	 9g5F+KZcB8LzA==
Message-ID: <626c649b-e82c-d660-5015-6dd64e48a4a0@collabora.com>
Date: Tue, 4 Apr 2023 00:03:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
 <ZA9HWRYxPUk1OeGe@amd.com>
 <53c25304-bc30-b5af-846e-b247aab67be9@collabora.com>
 <ZB2kGABHUKc+Bk5H@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZB2kGABHUKc+Bk5H@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/23 16:22, Huang Rui wrote:
> On Thu, Mar 16, 2023 at 07:14:47AM +0800, Dmitry Osipenko wrote:
>> On 3/13/23 18:55, Huang Rui wrote:
>>> On Mon, Mar 13, 2023 at 01:51:03AM +0800, Dmitry Osipenko wrote:
>>>> On 3/12/23 12:22, Huang Rui wrote:
>>>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>>
>>>>> Request Venus when initializing VirGL.
>>>>>
>>>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>> ---
>>>>>  hw/display/virtio-gpu-virgl.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>> index fe03dc916f..f5ce206b93 100644
>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>>>>  {
>>>>>      int ret;
>>>>>  
>>>>> +#ifdef VIRGL_RENDERER_VENUS
>>>>> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
>>>>> +#else
>>>>>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
>>>>> +#endif
>>>>
>>>> Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
>>>> set. Please test the patches with the latest virglrenderer and etc.
>>>>
>>>> The #ifdef also doesn't allow adding new flags, it should look like:
>>>>
>>>> #ifdef VIRGL_RENDERER_VENUS
>>>>     flags |= VIRGL_RENDERER_RENDER_SERVER;
>>>> #endif
>>>>
>>>>     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
>>>
>>> In fact, we have rebased to the latest virglrenderer:
>>>
>>> We check both VIRGL_RENDERER_RENDER_SERVER or VIRGL_RENDERER_VENUS in
>>> virglrenderer, alternative of them works.
>>>
>>> https://gitlab.freedesktop.org/rui/virglrenderer/-/commit/c1322a8a84379b1ef7939f56c6761b0114716f45
>>
>> All the extra changes you made to virglrenderer that Qemu depends on
>> need to go upstream. Please open all the relevant merge requests. Thanks!
>>
> 
> Dmitry, sorry to late response, I have created relevant merge requests
> below:
> 
> Virglrenderer:
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1068
> 
> Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22108
> 
> I'd appreciate any comments. :-)

Thanks, Ray. I'll try to get to the patches soon.


-- 
Best regards,
Dmitry


