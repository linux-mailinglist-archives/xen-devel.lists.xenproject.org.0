Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE52CA136CD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 10:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873381.1284346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYML9-0006VU-RK; Thu, 16 Jan 2025 09:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873381.1284346; Thu, 16 Jan 2025 09:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYML9-0006U1-OQ; Thu, 16 Jan 2025 09:39:03 +0000
Received: by outflank-mailman (input) for mailman id 873381;
 Thu, 16 Jan 2025 09:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XGS=UI=ideasonboard.com=laurent.pinchart@srs-se1.protection.inumbo.net>)
 id 1tYML8-0006Tv-FL
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 09:39:02 +0000
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [2001:4b98:dc2:55:216:3eff:fef7:d647])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b745a5c7-d3ed-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 10:39:01 +0100 (CET)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12F276B5;
 Thu, 16 Jan 2025 10:38:01 +0100 (CET)
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
X-Inumbo-ID: b745a5c7-d3ed-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737020281;
	bh=Sz7XGsB0jJiCVcgAYNC5ZZi+VkFA4hXqTcdj3HBGvi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0BH+gjPklcJM4K7npyiN+OizL+So166OYOAFCGwmyI31sasdC0hnhksHO/5bLnfw
	 HMc/eoseS5N2gVokQXXsjM5itCkOuGjpNUxwyWy3Ek6SdEbjqi0yC6yW0imGRrqVj1
	 1fRnvPVpWPsdUJLy5MKa4eyuKZRKjUpaQVwa4Knc=
Date: Thu, 16 Jan 2025 11:38:54 +0200
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
Message-ID: <20250116093854.GG6754@pendragon.ideasonboard.com>
References: <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
 <20250116084340.GF6754@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116084340.GF6754@pendragon.ideasonboard.com>

On Thu, Jan 16, 2025 at 10:43:40AM +0200, Laurent Pinchart wrote:
> On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> > On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> > > No disagreement there, we need CREATE_DUMB2.
> > >
> > > My point is that we have the current UAPI, and we have userspace using
> > > it, but we don't have clear rules what the ioctl does with specific
> > > parameters, and we don't document how it has to be used.
> > >
> > > Perhaps the situation is bad, and all we can really say is that
> > > CREATE_DUMB only works for use with simple RGB formats, and the behavior
> > > for all other formats is platform specific. But I think even that would
> > > be valuable in the UAPI docs.
> > 
> > Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> > linear layout. Not monochrome or YUV or tiled or displayed rotated or
> > whatever.
> > 
> > If it happens to accidentally work for other uses, that's fine, but
> > it's not generically reliable for anything other than simple linear
> > RGB. It's intended to let you do splash screens, consoles, recovery
> > password entries, and software-rendered compositors if you really
> > want. Anything more than that isn't 'dumb'.
> 
> We have lots of software out there that rely on CREATE_DUMB supporting
> YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
> implement YUV support in CREATE_DUMB. I'm fine replacing it with
> something better, but I think we need a standard ioctl that can create
> linear YUV buffers. I've been told many times that DRM doesn't want to
> standardize buffer allocation further than what CREATE_DUMB is made for.
> Can we reconsider this rule then ?

Actually... Instead of adding a CREATE_DUMB2, it would be best on trying
to leverage DMA heaps and deprecate allocating from the KMS device.

-- 
Regards,

Laurent Pinchart

