Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A990DA165BB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 04:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874767.1285148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZiYv-0004X7-Sw; Mon, 20 Jan 2025 03:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874767.1285148; Mon, 20 Jan 2025 03:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZiYv-0004Vb-NG; Mon, 20 Jan 2025 03:34:53 +0000
Received: by outflank-mailman (input) for mailman id 874767;
 Mon, 20 Jan 2025 03:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri3r=UM=linux.dev=sui.jingfeng@srs-se1.protection.inumbo.net>)
 id 1tZiYr-0004VR-73
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 03:34:52 +0000
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [2001:41d0:1004:224b::b6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7de3ff81-d6df-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 04:34:45 +0100 (CET)
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
X-Inumbo-ID: 7de3ff81-d6df-11ef-99a4-01e77a169b0f
Message-ID: <3d4e4bda-f465-4c8a-97c4-846b2f3ecb54@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737344078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9tPeFJh3Z8KzRS9nqqf16JZtB2EUc5uK4Rq+n7DfNw=;
	b=YY0vmGRwrZUTBrUrgVqfAahrdf8E2LNioasg7jg8ibtK9oZUoF3Gyb6ENECPTEd6jx4ozD
	dCAprAdgpk+wCkRotDFwZGdWs/yRlXxl8a6R+PVCHx5z5L1Gon1hTd9+nMflzGPYruxiHZ
	vu7GbnHgrZEtNupovuNQyF4Ah1bgbyA=
Date: Mon, 20 Jan 2025 11:34:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/16 18:17, Geert Uytterhoeven wrote:
> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> On 16/01/2025 10:09, Thomas Zimmermann wrote:
>>> Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
>>> [...]
>>>> My point is that we have the current UAPI, and we have userspace using
>>>> it, but we don't have clear rules what the ioctl does with specific
>>>> parameters, and we don't document how it has to be used.
>>>>
>>>> Perhaps the situation is bad, and all we can really say is that
>>>> CREATE_DUMB only works for use with simple RGB formats, and the
>>>> behavior for all other formats is platform specific. But I think even
>>>> that would be valuable in the UAPI docs.
>>> To be honest, I would not want to specify behavior for anything but the
>>> linear RGB formats. If anything, I'd take Daniel's reply mail for
>>> documentation as-is. Anyone stretching the UAPI beyond RGB is on their own.
>>>
>>>> Thinking about this, I wonder if this change is good for omapdrm or
>>>> xilinx (probably other platforms too that support non-simple non-RGB
>>>> formats via dumb buffers): without this patch, in both drivers, the
>>>> pitch calculations just take the bpp as bit-per-pixels, align it up,
>>>> and that's it.
>>>>
>>>> With this patch we end up using drm_driver_color_mode_format(), and
>>>> aligning buffers according to RGB formats figured out via heuristics.
>>>> It does happen to work, for the formats I tested, but it sounds like
>>>> something that might easily not work, as it's doing adjustments based
>>>> on wrong format.
>>>>
>>>> Should we have another version of drm_mode_size_dumb() which just
>>>> calculates using the bpp, without the drm_driver_color_mode_format()
>>>> path? Or does the drm_driver_color_mode_format() path provide some
>>>> value for the drivers that do not currently do anything similar?
>>> With the RGB-only rule, using drm_driver_color_mode_format() makes
>>> sense. It aligns dumb buffers and video=, provides error checking, and
>>> overall harmonizes code. The fallback is only required because of the
>>> existing odd cases that already bend the UAPI's rules.
>> I have to disagree here.
>>
>> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
>> buffers are the only buffers you can get from the DRM driver. The dumb
>> buffers have been used to allocate linear and multiplanar YUV buffers
>> for a very long time on those platforms.
>>
>> I tried to look around, but I did not find any mentions that CREATE_DUMB
>> should only be used for RGB buffers. Is anyone outside the core
>> developers even aware of it?
>>
>> If we don't use dumb buffers there, where do we get the buffers? Maybe
>> from a v4l2 device or from a gpu device, but often you don't have those.
>> DMA_HEAP is there, of course.
> Why can't there be a variant that takes a proper fourcc format instead of
> an imprecise bpp value?

The 'flags' parameter of the 'struct drm_mode_create_dumb' doesn't gets
in used so far, I guess the situation will be much better if passing a
correct fourcc code from the user-space to kernel is allowed.


> Gr{oetje,eeting}s,
>
>                          Geert
>
-- 
Best regards,
Sui


