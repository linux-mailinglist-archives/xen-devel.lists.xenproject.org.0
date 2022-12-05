Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E06422ED
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 07:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453169.710828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p24lD-0007dk-HH; Mon, 05 Dec 2022 06:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453169.710828; Mon, 05 Dec 2022 06:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p24lD-0007bG-Dy; Mon, 05 Dec 2022 06:15:27 +0000
Received: by outflank-mailman (input) for mailman id 453169;
 Mon, 05 Dec 2022 06:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g57r=4D=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p24lB-0007bA-4y
 for xen-devel@lists.xen.org; Mon, 05 Dec 2022 06:15:25 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32b1ed6b-7464-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 07:15:23 +0100 (CET)
Received: by mail-pf1-x42f.google.com with SMTP id 140so10386381pfz.6
 for <xen-devel@lists.xen.org>; Sun, 04 Dec 2022 22:15:22 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902e9d100b0018997f6fc88sm9661220plk.34.2022.12.04.22.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 22:15:20 -0800 (PST)
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
X-Inumbo-ID: 32b1ed6b-7464-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SsoYa/VutTlLiSJw8acFAJ4p+uTIbjMiyVoY6bcFBdY=;
        b=lm2J7knO8XiK+rF9epwDL6Q+jT/Tkhh6NNFIWkkEiwOqvtkyZjqcKxa5EHvqQorg1j
         YNEcrirsQPY37u0bbtiFe9aroKfdlccm0JY73j9aCAKFMK5PNXe4hWwp/XfuywiB11Qg
         e3+1/SuQ+gwJLtxqEOAniYv7xWycZlykJMcZ5d02umsCBhFr0OwtjkLG8QutOtrYotSa
         tSI8OZaulbu4AozOuSjTeDAWOAp2bJokvbv7xLiq2n1ECAMJ/ycfaYu+QtLe4an4hgSu
         mDk1w/t2s5VC++HDUpJuZd+OkApkQMdmlDosw353KpKmBW/X9uqz3UDQbUhgWVq6MF3M
         Dvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsoYa/VutTlLiSJw8acFAJ4p+uTIbjMiyVoY6bcFBdY=;
        b=zer5GuFyaE2+my3e0LiFCZL+G8B6T/rVphHKmbCj304MOiVCQYM/Qn72udAY13T9OZ
         tWPZMKUFJovhNnC47t6OsNAlVMM62DKexeurX+dAHxcBLgleDsuZ9HqPUoVqkZ54Gu1/
         PecrggZOa2pTU4cAZFVy0u6/yp75fC0WyjDrI1pPxODWjgRxt2s/8Kicn1w6sjA5cQPL
         qDwK2d9HAmP3/8ZuwDmnDRHrxxbi5cuuvElpIgweHhJ+WAXr4aZsw2VY3a1Ikgp17iMP
         vgSDCMbIvyNaSE9g4oM2+LzFMip8FHEniLSlWMwgyA77FzO+PGQhlwL4mcGd+xFmWrmT
         df1w==
X-Gm-Message-State: ANoB5pk6OJbvwllWpixQ45igZwivWDQ3a3FIdTFw9oBBMEZFt7IrluEo
	FgFnHITWKwauLhvA328sSA7WmA==
X-Google-Smtp-Source: AA0mqf63zvJldlgic2m0PGb9jTZx/Ndi95lIac7/9LIzc6T35JgEzxEegxqE6lTq3f7K/7wV59g65w==
X-Received: by 2002:a65:5b0c:0:b0:477:a17d:5fe1 with SMTP id y12-20020a655b0c000000b00477a17d5fe1mr54629323pgq.437.1670220920856;
        Sun, 04 Dec 2022 22:15:20 -0800 (PST)
Date: Mon, 5 Dec 2022 11:45:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xen.org, Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 1/3] libxl: Add support for generic virtio device
Message-ID: <20221205061518.l2i4kqkzcivpxaxl@vireshk-i7>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
 <6a546552-d71d-a262-5981-8058dc37ae26@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a546552-d71d-a262-5981-8058dc37ae26@gmail.com>

Hi Oleksandr,

On 02-12-22, 16:52, Oleksandr Tyshchenko wrote:
> > This patch adds basic support for configuring and assisting generic
> > Virtio backend which could run in any domain.
> > 
> > An example of domain configuration for mmio based Virtio I2C device is:
> > virtio = ["type=virtio,device22,transport=mmio"]
> > 
> > Also to make this work on Arm, allocate Virtio MMIO params (IRQ and
> > memory region) and pass them to the backend. Update guest device-tree as
> > well to create a DT node for the Virtio devices.
> 
> 
> Some NITs regarding the commit description:
> 1. Besides making generic things current patch also adds i2c/gpio device
> nodes, I would mention that in the description.
> 2. I assume current patch is not enough to make this work on Arm, at least
> the subsequent patch is needed, I would mention that as well.
> 3. I understand where "virtio,device22"/"virtio,device29" came from, but I
> think that links to the corresponding device-tree bindings should be
> mentioned here (and/or maybe in the code).

Agree to all.
 
> > +static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
> > +                                        uint32_t irq, const char *type,
> > +                                        uint32_t backend_domid)
> > +{
> > +    int res, len = strlen(type);
> > +
> > +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
> > +    if (res) return res;
> > +
> > +    /* Add device specific nodes */
> > +    if (!strncmp(type, "virtio,device22", len)) {
> > +        res = make_virtio_mmio_node_i2c(gc, fdt);
> > +        if (res) return res;
> > +    } else if (!strncmp(type, "virtio,device29", len)) {
> > +        res = make_virtio_mmio_node_gpio(gc, fdt);
> > +        if (res) return res;
> > +    } else {
> > +        LOG(ERROR, "Invalid type for virtio device: %s", type);
> > +        return -EINVAL;
> > +    }
> 
> I am not sure whether it is the best place to ask, but I will try anyway. So
> I assume that with the whole series applied it would be possible to
> configure only two specific device types ("22" and "29").

Right.

> But what to do if user, for example, is interested in usual virtio device
> (which doesn't require specific device-tree sub node with specific
> compatible in it). For these usual virtio devices just calling
> make_virtio_mmio_node_common() would be enough.
> 
> 
> Maybe we should introduce something like type "common" which would mean we
> don't need any additional device-tree sub nodes?
> 
> virtio = ["type=common,transport=mmio"]

I am fine with this. Maybe, to keep it aligned with compatibles, we
can write it as
 
virtio = ["type=virtio,device,transport=mmio"]

and document that "virtio,device" type is special and we won't add
compatible property to the DT node.

> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index 612eacfc7fac..15a32c75c045 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -1802,6 +1802,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
> >                                 &d_config->vkbs[i]);
> >           }
> > +        for (i = 0; i < d_config->num_virtios; i++) {
> > +            libxl__device_add(gc, domid, &libxl__virtio_devtype,
> > +                              &d_config->virtios[i]);
> > +        }
> 
> 
> I am wondering whether this is the best place to put this call. This gets
> called for LIBXL_DOMAIN_TYPE_PV and LIBXL_DOMAIN_TYPE_PVH (our Arm case),
> and not for LIBXL_DOMAIN_TYPE_HVM. Is it what we want?

Can you suggest where should I move this ?
 
> > +libxl_virtioinfo = Struct("virtioinfo", [
> > +    ("backend", string),
> > +    ("backend_id", uint32),
> > +    ("frontend", string),
> > +    ("frontend_id", uint32),
> > +    ("devid", libxl_devid),
> > +    ("state", integer),
> > +    ], dir=DIR_OUT)
> 
> I failed to find where libxl_virtioinfo is used within the series. Why do we
> need it?

Looks like leftover that I missed. Will remove it.
 
> > +static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
> > +                                       libxl_devid devid,
> > +                                       libxl_device_virtio *virtio)
> > +{
> > +    const char *be_path, *fe_path, *tmp;
> > +    libxl__device dev;
> > +    int rc;
> > +
> > +    virtio->devid = devid;
> > +
> > +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> > +                                  GCSPRINTF("%s/backend", libxl_path),
> > +                                  &be_path);
> > +    if (rc) goto out;
> > +
> > +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> > +                                  GCSPRINTF("%s/frontend", libxl_path),
> > +                                  &fe_path);
> > +    if (rc) goto out;
> 
> fe_path is not used anywhere down the code even within the series, why do we
> need it? Or we just read it to make sure that corresponding entry is present
> in Xenstore (some kind of sanity check)?

I copied it from libxl_vkb.c and it isn't using it either. So I assume
it is a sanity check, though can be removed if that's what makes
sense.
 
> > +
> > +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
> > +    if (rc) goto out;
> > +
> > +    rc = libxl__parse_backend_path(gc, be_path, &dev);
> > +    if (rc) goto out;
> 
> The same question for dev variable.

Hmm, this we aren't using at all, which KBD does use it. Maybe we
should even call libxl__parse_backend_path() ?

-- 
viresh

