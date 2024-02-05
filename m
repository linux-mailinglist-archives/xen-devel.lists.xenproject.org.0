Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A0849DB9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676175.1052115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0cl-0000m8-Lx; Mon, 05 Feb 2024 15:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676175.1052115; Mon, 05 Feb 2024 15:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0cl-0000ib-JJ; Mon, 05 Feb 2024 15:11:07 +0000
Received: by outflank-mailman (input) for mailman id 676175;
 Mon, 05 Feb 2024 15:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Hmw=JO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rX0ck-0000iV-2u
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:11:06 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d10498-c438-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:11:01 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea86so1550440f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:11:01 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b0040fbdd6f69bsm8975640wms.33.2024.02.05.07.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:11:00 -0800 (PST)
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
X-Inumbo-ID: c5d10498-c438-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707145861; x=1707750661; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rYXsl2v6e1LdNb7inNZK9lMEFl6jRhiXD/5FjT+twc=;
        b=pzS9EYaqXPKTaSfHNqJe3gYM2FgMQsBWNG0E6UzXzgrwFoyqRUOv9lJJbg1A2t28tP
         VdGo/RHoiCWM0xTYjaegXgXZKzGTgGEenfamMTHGhB3IJxgqXthed610TfpLWbtW/Lcn
         oNpWu4u3jCj2VrNYoDPPqJYMugjnmAxRYm7DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707145861; x=1707750661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rYXsl2v6e1LdNb7inNZK9lMEFl6jRhiXD/5FjT+twc=;
        b=U/lr4rLZuKTAqeHaeqpc0A0R5TkYxYvD8H8fo6zzue/SBAy5Gu1KCx/WrDY5/Pdp4/
         l9UxvXRkMhn63BebaGyuFQLDg+xIct2TnP4VOvqoADNy0ou7RENqB3E189LBFqOlh6go
         GCdN3kbIvBxn/bqMWGt6js4GBavTpENmJuGlg/nXZeCKmwmDa/FqTOfZVUWo8/33WVX9
         wZphTrPVGLsuyRH41T/iPdjRTg7GKB4CYbafX/3Cq7i9HhAsy67y0FG8LHmq7PobuOXf
         5Vw6t3RYtC8GTiqcSp0SiO7yaQbjt2go9/pm71PiitzcxGS1iq4KEM2pVbCpgIrXQC20
         NMbQ==
X-Gm-Message-State: AOJu0Yzin5xDHGDP1NsheC0n70kCAI1WKnmi826PBm0eSk9thGFr/c2R
	8icSQ51RquPzQihL7Dmk68GsHKvQ4gaP1s/GtsiM+8X/REOhhECmQy0DMy2VNIk=
X-Google-Smtp-Source: AGHT+IGxjpGAeWr26eoG7MKtxebnMikpGshyIMfh7v1Oh6sv5tvIdl96unujFnfOg5/A7vjB0BkAfg==
X-Received: by 2002:adf:f044:0:b0:33b:2262:ca61 with SMTP id t4-20020adff044000000b0033b2262ca61mr5997366wro.70.1707145860620;
        Mon, 05 Feb 2024 07:11:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVy61Gxs3FiqTm0ZmMJt8xgVOrn6Whl0g6mMG4YO9xX/Yldbr7K5uVy37k/nVJ1VnkfXarNnTPcY4IXJ4w7hxNQB+ridQm0xv0X51qLxYfUGzB1M1SM5CLntuCR6Yc2RvZNhj+Gbrskz/0K4KZJygv3ZoFk1csJt2+XJjnG0f6y0fIuw2hVj/J/6ZHbAIx0sasKwR0Qk3gdSZzQjuGvY61+0O+MHGzA2hNcTFdnj6B19vjL
Date: Mon, 5 Feb 2024 15:10:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Message-ID: <ace5b3c8-38e7-4661-9401-ac9ac77a5e9f@perard>
References: <20240202104903.1112772-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202104903.1112772-1-olekstysh@gmail.com>

On Fri, Feb 02, 2024 at 12:49:03PM +0200, Oleksandr Tyshchenko wrote:
> diff --git a/tools/libs/util/libxlu_disk_l.l b/tools/libs/util/libxlu_disk_l.l
> index 6d53c093a3..f37dd443bd 100644
> --- a/tools/libs/util/libxlu_disk_l.l
> +++ b/tools/libs/util/libxlu_disk_l.l
> @@ -220,6 +220,9 @@ hidden-disk=[^,]*,?	{ STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQU
>  trusted,?		{ libxl_defbool_set(&DPC->disk->trusted, true); }
>  untrusted,?		{ libxl_defbool_set(&DPC->disk->trusted, false); }
>  
> +grant_usage=1,?		{ libxl_defbool_set(&DPC->disk->grant_usage, true); }
> +grant_usage=0,?		{ libxl_defbool_set(&DPC->disk->grant_usage, false); }

For other boolean type for the disk, we have "trusted/untrusted",
"discard/no-discard", "direct-io-save/", but you are adding
"grant_usage=1/grant_usage=0". Is that fine? But I guess having the new
option spelled "grant_usage" might be better, so it match the other
virtio devices and the implementation. But maybe
"use-grant/no-use-grant" might be ok?

In any case, the implementation need to match the documentation, and
vice versa. See below.

> diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
> index bc945cc517..3c035456d5 100644
> --- a/docs/man/xl-disk-configuration.5.pod.in
> +++ b/docs/man/xl-disk-configuration.5.pod.in
> @@ -404,6 +404,31 @@ Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
> +=item B<grant_usage=BOOLEAN>
>
> +=over 4
> +
> +=item Description
> +
> +Specifies the usage of Xen grants for accessing guest memory. Only applicable
> +to specification "virtio".
> +
> +=item Supported values
> +
> +If this option is B<true>, the Xen grants are always enabled.
> +If this option is B<false>, the Xen grants are always disabled.

Unfortunately, this is wrong, the implementation in the patch only
support two values: 1 / 0, nothing else, and trying to write "true" or
"false" would lead to an error. (Well actually it's "grant_usage=1" or
"grant_usage=0", there's nothing that cut that string at the '='.)

Also, do we really need the extra verbal description of each value here?
Is simply having the following would be enough?

    =item Supported values

    1, 0

The description in "Description" section would hopefully be enough.

> +=item Mandatory
> +
> +No
> +
> +=item Default value
> +
> +If this option is missing, then the default grant setting will be used,
> +i.e. enable grants if backend-domid != 0.
> +
> +=back
> +
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index ea3623dd6f..f39f427091 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -181,6 +181,9 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
>              return ERROR_INVAL;
>          }
>          disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
> +
> +        libxl_defbool_setdefault(&disk->grant_usage,
> +                                 disk->backend_domid != LIBXL_TOOLSTACK_DOMID);
>      }
>  
>      if (hotplug && disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> @@ -429,6 +432,8 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>              flexarray_append(back, libxl__device_disk_string_of_transport(disk->transport));
>              flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
>              flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
> +            flexarray_append_pair(back, "grant_usage",
> +                                  libxl_defbool_val(disk->grant_usage) ? "1" : "0");
>          }
>  
>          flexarray_append(front, "backend-id");
> @@ -623,6 +628,14 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
>              goto cleanup;
>          }
>          disk->irq = strtoul(tmp, NULL, 10);
> +
> +        tmp = libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/grant_usage", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/grant_usage", libxl_path);
> +            goto cleanup;

I wonder if it's such a good idea to make this node mandatory. Could we
just apply the default value if the path is missing? I don't think the
value is going to be used anyway because I don't think from_xenstore() is
used during guest creation, and it looks like "grant_usage" is only
useful during guest creation. Also, the "grant_usage" node isn't
mandatory in "libxl_virtio.c", so no need to do something different
for disk.

> +        }
> +        libxl_defbool_set(&disk->grant_usage, strtoul(tmp, NULL, 0));
>      }
>  
>      disk->vdev = xs_read(ctx->xsh, XBT_NULL,

Thanks,

-- 
Anthony PERARD

