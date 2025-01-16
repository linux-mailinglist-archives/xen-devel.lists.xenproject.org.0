Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A39A137A6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 11:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873445.1284421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMx0-0000lX-2R; Thu, 16 Jan 2025 10:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873445.1284421; Thu, 16 Jan 2025 10:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMwz-0000iz-W7; Thu, 16 Jan 2025 10:18:09 +0000
Received: by outflank-mailman (input) for mailman id 873445;
 Thu, 16 Jan 2025 10:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpqP=UI=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1tYMwy-0000it-Pu
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 10:18:08 +0000
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cfa2714-d3f3-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 11:18:06 +0100 (CET)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4afefc876c6so133652137.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 02:18:06 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b608f86d6fsm5359863137.17.2025.01.16.02.18.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 02:18:02 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4affd0fb6adso122683137.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 02:18:02 -0800 (PST)
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
X-Inumbo-ID: 2cfa2714-d3f3-11ef-99a4-01e77a169b0f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022683; x=1737627483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEBC4YtYCJgyImQmIlExzdfeh9O+mJTPH+y0EtpZi1E=;
        b=cFlMQbca/9uuW0L+5UO8RweIm7QrdHkevAVxMd62FaepiMniJTCqTJo1P3QPo0wR1e
         M3pWB9hmoR4BcreDYotV1XsElKdRMaFUtZ+CdLTgWpoh3M0ZJVKDuYkqZfz/7E85jVh7
         jIDj/zfDXCclmxhxIywrr1Kv4TSo43LZTDFICooO4RZ+3wlSuMcBNzbzfDHBdh9YfWsu
         ge4/xbXlfKEMUDaxcQy0AM5VAtjz5HG6GgWw5eOjHAsc0JcWaE/vkkAWv/6Dim1a1rXP
         vEBfh76aNMy0wYLUeV6gMPh6I5APbvYnZlot668AhvpNjjBnsXezvywwnPjom2fraSj0
         hmgA==
X-Forwarded-Encrypted: i=1; AJvYcCX1wb5kCUl6+0XMsZK14abwrfsFRAHt+O41LgKIEgqvdzW3ZeuDy95ipmSTuBv4JHuEQehwpDnKKoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8Awl44702/Y3s1xllZsMGav+qTRuk5ot+sfgmeDBuZkZ3/1OP
	KpLHTDlehR4IkT0MOVGBH83oEaajRMqoklxqsqGSRsIInFpuopmEPIY5iqzV9yk=
X-Gm-Gg: ASbGncto4/HtG7RNp6fzWHRpOTLqofplLXQQjcLrSXIPB/8ncufHG3IkGLrRizFJLEq
	fSYLznS53jxwHTAKBOu98tFJmzSzyzYsdd+CA00ehBip+SFKdx170iLsM3oIPBUZMWxvJvrqAn3
	6N7TZuG9E1j8KvMA+lnJbjh91NwejifWTX2iLrLftOukjjOptHuMuBhiWvU5Zv3YSoKmhG2vK7k
	5OOghp296kqWqs2iorEnWIlpfK53RiHyW8ekbXcVYJ1JS2WUAogfkTIIkDm+dw5CvGzxq6F6xa0
	GhkdiTuyMgKPdq4TIWY=
X-Google-Smtp-Source: AGHT+IEn+DiK94AD97xFvkks8gZpvRgA07p5b9xhDrGOwReQZ/SSyXzq1uadt8SF6Fj5fM+mI7Ltqw==
X-Received: by 2002:a05:6102:512c:b0:4b4:bec1:7368 with SMTP id ada2fe7eead31-4b4bec1796dmr27795246137.8.1737022683307;
        Thu, 16 Jan 2025 02:18:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUC6FO6J9ldLWuJ7vJX+hAZDxyA+czGWyPsvqQLDzzB5Ty89uEq5i/ndqG8OeLfbl+LzbaPaiE6wxI=@lists.xenproject.org
X-Received: by 2002:a05:6102:3a14:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b3d0dc0215mr29032050137.16.1737022681773; Thu, 16 Jan 2025
 02:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de> <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com> <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com> <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com> <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com> <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com> <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
In-Reply-To: <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jan 2025 11:17:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
X-Gm-Features: AbW1kvbCtGVmgNJ1oRyFqRTMVO1bCUCk0WwRoRvrPqq521tQuGLKMDrWmAM4CG4
Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>, 
	Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 16/01/2025 10:09, Thomas Zimmermann wrote:
> > Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
> > [...]
> >>
> >> My point is that we have the current UAPI, and we have userspace using
> >> it, but we don't have clear rules what the ioctl does with specific
> >> parameters, and we don't document how it has to be used.
> >>
> >> Perhaps the situation is bad, and all we can really say is that
> >> CREATE_DUMB only works for use with simple RGB formats, and the
> >> behavior for all other formats is platform specific. But I think even
> >> that would be valuable in the UAPI docs.
> >
> > To be honest, I would not want to specify behavior for anything but the
> > linear RGB formats. If anything, I'd take Daniel's reply mail for
> > documentation as-is. Anyone stretching the UAPI beyond RGB is on their =
own.
> >
> >> Thinking about this, I wonder if this change is good for omapdrm or
> >> xilinx (probably other platforms too that support non-simple non-RGB
> >> formats via dumb buffers): without this patch, in both drivers, the
> >> pitch calculations just take the bpp as bit-per-pixels, align it up,
> >> and that's it.
> >>
> >> With this patch we end up using drm_driver_color_mode_format(), and
> >> aligning buffers according to RGB formats figured out via heuristics.
> >> It does happen to work, for the formats I tested, but it sounds like
> >> something that might easily not work, as it's doing adjustments based
> >> on wrong format.
> >>
> >> Should we have another version of drm_mode_size_dumb() which just
> >> calculates using the bpp, without the drm_driver_color_mode_format()
> >> path? Or does the drm_driver_color_mode_format() path provide some
> >> value for the drivers that do not currently do anything similar?
> >
> > With the RGB-only rule, using drm_driver_color_mode_format() makes
> > sense. It aligns dumb buffers and video=3D, provides error checking, an=
d
> > overall harmonizes code. The fallback is only required because of the
> > existing odd cases that already bend the UAPI's rules.
>
> I have to disagree here.
>
> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
> buffers are the only buffers you can get from the DRM driver. The dumb
> buffers have been used to allocate linear and multiplanar YUV buffers
> for a very long time on those platforms.
>
> I tried to look around, but I did not find any mentions that CREATE_DUMB
> should only be used for RGB buffers. Is anyone outside the core
> developers even aware of it?
>
> If we don't use dumb buffers there, where do we get the buffers? Maybe
> from a v4l2 device or from a gpu device, but often you don't have those.
> DMA_HEAP is there, of course.

Why can't there be a variant that takes a proper fourcc format instead of
an imprecise bpp value?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

