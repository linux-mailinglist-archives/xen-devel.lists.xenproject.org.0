Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221C5A1626D
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2025 16:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874666.1285098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZWmK-0008F7-SR; Sun, 19 Jan 2025 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874666.1285098; Sun, 19 Jan 2025 14:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZWmK-0008DU-PG; Sun, 19 Jan 2025 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 874666;
 Sun, 19 Jan 2025 14:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvz8=UL=linux.dev=sui.jingfeng@srs-se1.protection.inumbo.net>)
 id 1tZWmG-0008DN-EM
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2025 14:59:55 +0000
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07d536f8-d676-11ef-a0e2-8be0dac302b0;
 Sun, 19 Jan 2025 15:59:50 +0100 (CET)
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
X-Inumbo-ID: 07d536f8-d676-11ef-a0e2-8be0dac302b0
Message-ID: <f4562dbf-b132-4cfd-8f7e-43cd69f2673f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737298788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNY9fo693oU2B1dKi7Yad0MtryDjxzNQa/7Ip1S7xnQ=;
	b=heGdHto3F+5K7JCqIvHDGXf1N0wnwZf1k6Vn1a+AfaN8emD7p116EZNmNhdoe3qOiN8MSL
	BAskCcm13dLRGLlnl2OBU60SLqXM+CELdtyiknyOyqOXKvH7THRFFzoAh4sZgSEp9q/ASO
	MFarzvKjz35Ws/S8kauuETysIOP9JiM=
Date: Sun, 19 Jan 2025 22:59:36 +0800
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ef52dab0-058f-408f-a298-c4b2453a3d2f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/19 20:18, Tomi Valkeinen wrote:
> Hi,
>
> On 19/01/2025 13:29, Sui Jingfeng wrote:
>> Hi,
>>
>> On 2025/1/16 18:35, Dmitry Baryshkov wrote:
>>> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
>>>> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
>>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>> On 16/01/2025 10:09, Thomas Zimmermann wrote:
>>>>>> Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
>>>>>> [...]
>>>>>>> My point is that we have the current UAPI, and we have userspace 
>>>>>>> using
>>>>>>> it, but we don't have clear rules what the ioctl does with specific
>>>>>>> parameters, and we don't document how it has to be used.
>>>>>>>
>>>>>>> Perhaps the situation is bad, and all we can really say is that
>>>>>>> CREATE_DUMB only works for use with simple RGB formats, and the
>>>>>>> behavior for all other formats is platform specific. But I think 
>>>>>>> even
>>>>>>> that would be valuable in the UAPI docs.
>>>>>> To be honest, I would not want to specify behavior for anything 
>>>>>> but the
>>>>>> linear RGB formats. If anything, I'd take Daniel's reply mail for
>>>>>> documentation as-is. Anyone stretching the UAPI beyond RGB is on 
>>>>>> their own.
>>>>>>
>>>>>>> Thinking about this, I wonder if this change is good for omapdrm or
>>>>>>> xilinx (probably other platforms too that support non-simple 
>>>>>>> non-RGB
>>>>>>> formats via dumb buffers): without this patch, in both drivers, the
>>>>>>> pitch calculations just take the bpp as bit-per-pixels, align it 
>>>>>>> up,
>>>>>>> and that's it.
>>>>>>>
>>>>>>> With this patch we end up using drm_driver_color_mode_format(), and
>>>>>>> aligning buffers according to RGB formats figured out via 
>>>>>>> heuristics.
>>>>>>> It does happen to work, for the formats I tested, but it sounds 
>>>>>>> like
>>>>>>> something that might easily not work, as it's doing adjustments 
>>>>>>> based
>>>>>>> on wrong format.
>>>>>>>
>>>>>>> Should we have another version of drm_mode_size_dumb() which just
>>>>>>> calculates using the bpp, without the 
>>>>>>> drm_driver_color_mode_format()
>>>>>>> path? Or does the drm_driver_color_mode_format() path provide some
>>>>>>> value for the drivers that do not currently do anything similar?
>>>>>> With the RGB-only rule, using drm_driver_color_mode_format() makes
>>>>>> sense. It aligns dumb buffers and video=, provides error 
>>>>>> checking, and
>>>>>> overall harmonizes code. The fallback is only required because of 
>>>>>> the
>>>>>> existing odd cases that already bend the UAPI's rules.
>>>>> I have to disagree here.
>>>>>
>>>>> On the platforms I have been using (omap, tidss, xilinx, rcar) the 
>>>>> dumb
>>>>> buffers are the only buffers you can get from the DRM driver. The 
>>>>> dumb
>>>>> buffers have been used to allocate linear and multiplanar YUV buffers
>>>>> for a very long time on those platforms.
>>>>>
>>>>> I tried to look around, but I did not find any mentions that 
>>>>> CREATE_DUMB
>>>>> should only be used for RGB buffers. Is anyone outside the core
>>>>> developers even aware of it?
>>>>>
>>>>> If we don't use dumb buffers there, where do we get the buffers? 
>>>>> Maybe
>>>>> from a v4l2 device or from a gpu device, but often you don't have 
>>>>> those.
>>>>> DMA_HEAP is there, of course.
>>>> Why can't there be a variant that takes a proper fourcc format 
>>>> instead of
>>>> an imprecise bpp value?
>>> Backwards compatibility. We can add an IOCTL for YUV / etc.
>>
>> [...]
>>
>>> But userspace must be able to continue allocating YUV buffers through
>>> CREATE_DUMB.
>>
>> I think, allocating YUV buffers through CREATE_DUMB interface is just
>> an *abuse* and *misuse* of this API for now.
>>
>> Take the NV12 format as an example, NV12 is YUV420 planar format, have
>> two planar: the Y-planar and the UV-planar. The Y-planar appear first
>> in memory as an array of unsigned char values. The Y-planar is followed
>> immediately by the UV-planar, which is also an array of unsigned char
>> values that contains packed U (Cb) and V (Cr) samples.
>>
>> But the 'drm_mode_create_dumb' structure is only intend to provide
>> descriptions for *one* planar.
>>
>> struct drm_mode_create_dumb {
>>      __u32 height;
>>      __u32 width;
>>      __u32 bpp;
>>      __u32 flags;
>>      __u32 handle;
>>      __u32 pitch;
>>      __u64 size;
>> };
>>
>> An width x height NV12 image takes up width*height*(1 + 1/4 + 1/4) 
>> bytes.
>>
>> So we can allocate an *equivalent* sized buffer to store the NV12 raw 
>> data.
>>
>> Either 'width * (height * 3/2)' where each pixel take up 8 bits,
>> or just 'with * height' where each pixels take up 12 bits.
>>
>> However, all those math are just equivalents description to the original
>> NV12 format, neither are concrete correct physical description.
>
> I don't see the problem. Allocating dumb buffers, if we don't have any 
> heuristics related to RGB behind it, is essentially just allocating a 
> specific amount of memory, defined by width, height and bitsperpixel.
>
I think, the problem will be that the 'width', 'height' and 'bpp'
are originally used to describe one plane. Those three parameters
has perfectly defined physical semantics.

But with multi planar formats, take NV12 image as an example,
for a 2×2 square of pixels, there are 4 Y samples but only 1 U
sample and 1 V sample. This format requires 4x8+1x8+1x8=48 bits
to store the 2x2 square.

So its depth is 12 bits per pixel (48 / (2 * 2)).

so my problem is that the mentioned 12bpp in this example only
make sense in mathematics, it doesn't has a good physical
interpret. Do you agree with me on this technique point?
     

> If I want to create an NV12 framebuffer, I allocate two dumb buffers, 
> one for Y and one for UV planes, and size them accordingly. And then 
> create the DRM framebuffer with those.
>
Then how you fill the value of the 'width', 'height' and 'bpp' of each dumb buffers?

Why not allocate storage for the whole on one shoot?

The modetest in libdrm can be an good example, send it[1] to you as an reference.

[1] https://gitlab.freedesktop.org/mesa/drm/-/blob/main/tests/modetest/buffers.c?ref_type=heads#L114

-- 

Best regards,
Sui


