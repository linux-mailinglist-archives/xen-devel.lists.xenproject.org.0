Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54778A135B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873236.1284193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTk-0004RO-Su; Thu, 16 Jan 2025 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873236.1284193; Thu, 16 Jan 2025 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTk-0004Kj-NT; Thu, 16 Jan 2025 08:43:52 +0000
Received: by outflank-mailman (input) for mailman id 873236;
 Thu, 16 Jan 2025 08:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XGS=UI=ideasonboard.com=laurent.pinchart@srs-se1.protection.inumbo.net>)
 id 1tYLTi-0004BJ-BU
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:50 +0000
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc7e940-d3e5-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 09:43:46 +0100 (CET)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CDD7169;
 Thu, 16 Jan 2025 09:42:47 +0100 (CET)
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
X-Inumbo-ID: ffc7e940-d3e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737016967;
	bh=YBJYqGqQ2U3g/glMhqBtVA7c9PNcNKm2bF2hwWN3X/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEeZiJfRiaftp5JL3OuhSGJ31fbSk67YMrTfIULuryGPguJN8dhwOq+oPh23KD4oZ
	 oDgG9Q7qiklC025s5e31jn5W8DZrWY3XLnKdac3TlZaKlReDu0jJF+McdlL4rZbfey
	 vio2zbz4p7HYes9E+SH0Bj1kP+VRYA2cki8/bjIo=
Date: Thu, 16 Jan 2025 10:43:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250116084340.GF6754@pendragon.ideasonboard.com>
References: <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>

On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> > No disagreement there, we need CREATE_DUMB2.
> >
> > My point is that we have the current UAPI, and we have userspace using
> > it, but we don't have clear rules what the ioctl does with specific
> > parameters, and we don't document how it has to be used.
> >
> > Perhaps the situation is bad, and all we can really say is that
> > CREATE_DUMB only works for use with simple RGB formats, and the behavior
> > for all other formats is platform specific. But I think even that would
> > be valuable in the UAPI docs.
> 
> Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> linear layout. Not monochrome or YUV or tiled or displayed rotated or
> whatever.
> 
> If it happens to accidentally work for other uses, that's fine, but
> it's not generically reliable for anything other than simple linear
> RGB. It's intended to let you do splash screens, consoles, recovery
> password entries, and software-rendered compositors if you really
> want. Anything more than that isn't 'dumb'.

We have lots of software out there that rely on CREATE_DUMB supporting
YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
implement YUV support in CREATE_DUMB. I'm fine replacing it with
something better, but I think we need a standard ioctl that can create
linear YUV buffers. I've been told many times that DRM doesn't want to
standardize buffer allocation further than what CREATE_DUMB is made for.
Can we reconsider this rule then ?

-- 
Regards,

Laurent Pinchart

