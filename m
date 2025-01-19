Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E372A162E5
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2025 17:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874695.1285118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZY8U-0003qZ-1Y; Sun, 19 Jan 2025 16:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874695.1285118; Sun, 19 Jan 2025 16:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZY8T-0003oG-V3; Sun, 19 Jan 2025 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 874695;
 Sun, 19 Jan 2025 16:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvz8=UL=linux.dev=sui.jingfeng@srs-se1.protection.inumbo.net>)
 id 1tZY8P-0003o3-BU
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2025 16:26:52 +0000
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d392488-d682-11ef-a0e2-8be0dac302b0;
 Sun, 19 Jan 2025 17:26:46 +0100 (CET)
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
X-Inumbo-ID: 2d392488-d682-11ef-a0e2-8be0dac302b0
Message-ID: <8234927e-0d12-4655-813d-8ec94179b737@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737304005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vk3LJPYAEJumDCHfvyn+0B3wt+JaPCGDzjEcWZxdF60=;
	b=rSN8t36GlcqKWcSry2NAS7uuPoSokjl/moVcZQqfvubYqsOYH01D0yN3RMsNHteHhtpLti
	kVL97c93wJmSXin/dBnch03Cy9RjtJi2PzJmt0HI9IluiFQUnxKcft+J/Ya7YtZG1krPc+
	YGBCQ0RrYcucM6qjwpDCjNrgG9sTpfk=
Date: Mon, 20 Jan 2025 00:26:30 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
 <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
 <b97fcd2f-516a-4172-aef3-631418564cfa@linux.dev>
 <ef52dab0-058f-408f-a298-c4b2453a3d2f@ideasonboard.com>
 <f4562dbf-b132-4cfd-8f7e-43cd69f2673f@linux.dev>
 <cf34be39-ce92-4ea5-b548-03008c163d31@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <cf34be39-ce92-4ea5-b548-03008c163d31@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/19 23:22, Tomi Valkeinen wrote:
> On 19/01/2025 16:59, Sui Jingfeng wrote:
>
>>>>> But userspace must be able to continue allocating YUV buffers through
>>>>> CREATE_DUMB.
>>>>
>>>> I think, allocating YUV buffers through CREATE_DUMB interface is just
>>>> an *abuse* and *misuse* of this API for now.
>>>>
>>>> Take the NV12 format as an example, NV12 is YUV420 planar format, have
>>>> two planar: the Y-planar and the UV-planar. The Y-planar appear first
>>>> in memory as an array of unsigned char values. The Y-planar is 
>>>> followed
>>>> immediately by the UV-planar, which is also an array of unsigned char
>>>> values that contains packed U (Cb) and V (Cr) samples.
>>>>
>>>> But the 'drm_mode_create_dumb' structure is only intend to provide
>>>> descriptions for *one* planar.
>>>>
>>>> struct drm_mode_create_dumb {
>>>>      __u32 height;
>>>>      __u32 width;
>>>>      __u32 bpp;
>>>>      __u32 flags;
>>>>      __u32 handle;
>>>>      __u32 pitch;
>>>>      __u64 size;
>>>> };
>>>>
>>>> An width x height NV12 image takes up width*height*(1 + 1/4 + 1/4) 
>>>> bytes.
>>>>
>>>> So we can allocate an *equivalent* sized buffer to store the NV12 
>>>> raw data.
>>>>
>>>> Either 'width * (height * 3/2)' where each pixel take up 8 bits,
>>>> or just 'with * height' where each pixels take up 12 bits.
>>>>
>>>> However, all those math are just equivalents description to the 
>>>> original
>>>> NV12 format, neither are concrete correct physical description.
>>>
>>> I don't see the problem. Allocating dumb buffers, if we don't have 
>>> any heuristics related to RGB behind it, is essentially just 
>>> allocating a specific amount of memory, defined by width, height and 
>>> bitsperpixel.
>>>
>> I think, the problem will be that the 'width', 'height' and 'bpp'
>> are originally used to describe one plane. Those three parameters
>> has perfectly defined physical semantics.
>>
>> But with multi planar formats, take NV12 image as an example,
>> for a 2×2 square of pixels, there are 4 Y samples but only 1 U
>> sample and 1 V sample. This format requires 4x8+1x8+1x8=48 bits
>> to store the 2x2 square.
>>
>> So its depth is 12 bits per pixel (48 / (2 * 2)).
>>
>> so my problem is that the mentioned 12bpp in this example only
>> make sense in mathematics, it doesn't has a good physical
>> interpret. Do you agree with me on this technique point?
>>
>>> If I want to create an NV12 framebuffer, I allocate two dumb 
>>> buffers, one for Y and one for UV planes, and size them accordingly. 
>>> And then create the DRM framebuffer with those.
>>>
>> Then how you fill the value of the 'width', 'height' and 'bpp' of 
>> each dumb buffers?
>
> For 640x480-NV12:
> plane 0: width = 640, height = 480, bpp = 8
> plane 1: width = 640 / 2, height = 480 / 2, bpp = 16
>
But i think this should be hardware dependent. The hardware I'm using
load NV12  raw data as a whole. I only need to feed gpuva of the backing
memory to the hardware register once.

Not familiar with your hardware, so I can't talk more on this software
design. Perhaps someone know more could have a comment on this.

>> Why not allocate storage for the whole on one shoot?
>
> You can, if you adjust the parameters accordingly. However, if the 
> strides of the planes are not equal, I guess it might cause problems 
> on some platforms.
>
> But I think it's usually simpler to allocate one buffer per plane, and 
> perhaps even better as it doesn't require as large contiguous memory 
> area.
>
>> The modetest in libdrm can be an good example, send it[1] to you as 
>> an reference.
>
> Right, so modetest already does it successfully. So... What is the issue?
>
But then, the problem will become that it override the 'height' parameter.
What's the physical interpretation of the 'height' parameter when creating
an NV12 image with the dump API then?

I guess, solving complex problems with simple APIs may see the limitation,
sooner or later. But I not very sure and might be wrong. So other peoples
can override me words.


> Everyone agrees that CREATE_DUMB is not the best ioctl to allocate 
> buffers, and one can't consider it to work identically across the 
> platforms. But it's what we have and what has been used for ages.
>
Yeah, your request are not unreasonable. It can be seen as a kind of rigid demand.
Since GEM DMA helpers doesn't export an more advanced interface to userspace so far.
As a result, drivers that employing GEM DMA has no other choice, but to abuse the
dumb buffer API to do allocation for the more complex format buffers.

The dumb buffer API doesn't support to specify buffer format, tile status and
placement etc. The more advance drivers has been exposed the xxx_create_gem()
to user-space. It seems that a few more experienced programmers hint us to
create an new ioctl at above thread, so that we can keep employing simple API
to do simple things and to suit complex needs with the more advanced APIs.


>  Tomi
>
-- 
Best regards,
Sui


