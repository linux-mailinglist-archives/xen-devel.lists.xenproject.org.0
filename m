Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E58A16160
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2025 12:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874607.1285078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZTUi-0007rw-Uv; Sun, 19 Jan 2025 11:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874607.1285078; Sun, 19 Jan 2025 11:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZTUi-0007ph-Pw; Sun, 19 Jan 2025 11:29:32 +0000
Received: by outflank-mailman (input) for mailman id 874607;
 Sun, 19 Jan 2025 11:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvz8=UL=linux.dev=sui.jingfeng@srs-se1.protection.inumbo.net>)
 id 1tZTUe-0007pb-Va
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2025 11:29:32 +0000
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [2001:41d0:203:375::ad])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38c4fee-d658-11ef-a0e2-8be0dac302b0;
 Sun, 19 Jan 2025 12:29:26 +0100 (CET)
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
X-Inumbo-ID: a38c4fee-d658-11ef-a0e2-8be0dac302b0
Message-ID: <b97fcd2f-516a-4172-aef3-631418564cfa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737286164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuK0LkbEgQqPgK0yPnR5LzoggyynezSlKlKR/CKdeTY=;
	b=xMqoqpXwM+10B3buteMukau9UQmlGuAXyj0ur9aXSA7WbWzwRnMniPiQaxTWp6qqTY2fRw
	kdeVaGsloeyKfqel8VbZAIHcFFD77zLC4uiMyod2/pw8443jMEAy0AngMSBb8Lp3KLn9lX
	baphMPg1zk5Qs828ODB8iVWTCpuol5w=
Date: Sun, 19 Jan 2025 19:29:14 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/16 18:35, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
>> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com> wrote:
>>> On 16/01/2025 10:09, Thomas Zimmermann wrote:
>>>> Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
>>>> [...]
>>>>> My point is that we have the current UAPI, and we have userspace using
>>>>> it, but we don't have clear rules what the ioctl does with specific
>>>>> parameters, and we don't document how it has to be used.
>>>>>
>>>>> Perhaps the situation is bad, and all we can really say is that
>>>>> CREATE_DUMB only works for use with simple RGB formats, and the
>>>>> behavior for all other formats is platform specific. But I think even
>>>>> that would be valuable in the UAPI docs.
>>>> To be honest, I would not want to specify behavior for anything but the
>>>> linear RGB formats. If anything, I'd take Daniel's reply mail for
>>>> documentation as-is. Anyone stretching the UAPI beyond RGB is on their own.
>>>>
>>>>> Thinking about this, I wonder if this change is good for omapdrm or
>>>>> xilinx (probably other platforms too that support non-simple non-RGB
>>>>> formats via dumb buffers): without this patch, in both drivers, the
>>>>> pitch calculations just take the bpp as bit-per-pixels, align it up,
>>>>> and that's it.
>>>>>
>>>>> With this patch we end up using drm_driver_color_mode_format(), and
>>>>> aligning buffers according to RGB formats figured out via heuristics.
>>>>> It does happen to work, for the formats I tested, but it sounds like
>>>>> something that might easily not work, as it's doing adjustments based
>>>>> on wrong format.
>>>>>
>>>>> Should we have another version of drm_mode_size_dumb() which just
>>>>> calculates using the bpp, without the drm_driver_color_mode_format()
>>>>> path? Or does the drm_driver_color_mode_format() path provide some
>>>>> value for the drivers that do not currently do anything similar?
>>>> With the RGB-only rule, using drm_driver_color_mode_format() makes
>>>> sense. It aligns dumb buffers and video=, provides error checking, and
>>>> overall harmonizes code. The fallback is only required because of the
>>>> existing odd cases that already bend the UAPI's rules.
>>> I have to disagree here.
>>>
>>> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
>>> buffers are the only buffers you can get from the DRM driver. The dumb
>>> buffers have been used to allocate linear and multiplanar YUV buffers
>>> for a very long time on those platforms.
>>>
>>> I tried to look around, but I did not find any mentions that CREATE_DUMB
>>> should only be used for RGB buffers. Is anyone outside the core
>>> developers even aware of it?
>>>
>>> If we don't use dumb buffers there, where do we get the buffers? Maybe
>>> from a v4l2 device or from a gpu device, but often you don't have those.
>>> DMA_HEAP is there, of course.
>> Why can't there be a variant that takes a proper fourcc format instead of
>> an imprecise bpp value?
> Backwards compatibility. We can add an IOCTL for YUV / etc.

[...]

> But userspace must be able to continue allocating YUV buffers through
> CREATE_DUMB.

I think, allocating YUV buffers through CREATE_DUMB interface is just
an *abuse* and *misuse* of this API for now.

Take the NV12 format as an example, NV12 is YUV420 planar format, have
two planar: the Y-planar and the UV-planar. The Y-planar appear first
in memory as an array of unsigned char values. The Y-planar is followed
immediately by the UV-planar, which is also an array of unsigned char
values that contains packed U (Cb) and V (Cr) samples.

But the 'drm_mode_create_dumb' structure is only intend to provide
descriptions for *one* planar.

struct drm_mode_create_dumb {
     __u32 height;
     __u32 width;
     __u32 bpp;
     __u32 flags;
     __u32 handle;
     __u32 pitch;
     __u64 size;
};

An width x height NV12 image takes up width*height*(1 + 1/4 + 1/4) bytes.

So we can allocate an *equivalent* sized buffer to store the NV12 raw data.

Either 'width * (height * 3/2)' where each pixel take up 8 bits,
or just 'with * height' where each pixels take up 12 bits.

However, all those math are just equivalents description to the original
NV12 format, neither are concrete correct physical description.

Therefore, allocating YUV buffers through the dumb interface is just an
abuse for that API. We certainly can abuse more by allocating two dumb
buffers, one for Y-planer, another one for the UV-planer. But again,dumb buffers can be (and must be) used for *scanout* directly. What will yield if I commit the YUV buffers you allocated to the CRTC directly?

In other words, You can allocated buffers via the dumb APIs to store anything,
but the key point is that how can we interpret it.

As Daniel puts it, the semantics of that API is well defined for simple RGB
formats. Usages on non linear RGB dumb buffers are considered as undefined
behavior.

Peoples can still abusing it at the user-space though, but the kernel don't
have to guarantee that the user-space *must* to be able to continue doing
balabala..., That's it.


Best regards,
Sui

>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds

-- 
Best regards,
Sui


