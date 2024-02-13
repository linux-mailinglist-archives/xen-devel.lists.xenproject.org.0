Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF57852FBF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679868.1057631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrBI-0001i7-Mj; Tue, 13 Feb 2024 11:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679868.1057631; Tue, 13 Feb 2024 11:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrBI-0001fM-K3; Tue, 13 Feb 2024 11:42:32 +0000
Received: by outflank-mailman (input) for mailman id 679868;
 Tue, 13 Feb 2024 11:42:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZrBG-0000fG-VD
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:42:30 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f838589c-ca64-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:42:30 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d073b54359so62895951fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:42:30 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c458b00b00410504b582csm11558849wmo.11.2024.02.13.03.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:42:29 -0800 (PST)
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
X-Inumbo-ID: f838589c-ca64-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707824550; x=1708429350; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SFOxlptOy6yPH4rsd8K2htw0DvvMc2uXfBIk/uVlwbs=;
        b=RShpAisH7H105h734oYjHnECSid7P82n+5EKyUyo9eBrQbXrrcgouEiW0h4h9SMeOW
         EgElGS06ioKF5lYK5mVkosRBxH9aB8aeiRtIgURRZrt0vzoxkOX3sgi/0vMs34DIj3D1
         /UWRJ65PaDZcQFqjp9m5EhUTcv6EnuKl6H+fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824550; x=1708429350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFOxlptOy6yPH4rsd8K2htw0DvvMc2uXfBIk/uVlwbs=;
        b=FsxUnQ5Cu4XY6Q+0Aasylo5t2Ulss3cBbwGiWQpyQANOfisxcFa9B7xjmSg793J38U
         DzMwlWVG5WEtLb6OIwEJRdOP2P3hzImDYIeg+mXt2ZfbQRn+rk3EGeR38uHNsx2QMDcZ
         YMm8lVJMZ+AQOf6PpA79ZIBD5ggvD4B1KqQ6ObrKgAes8+jafGNtt92HBsYztrvdPO3U
         pYjqhUjnfh7ANi8Zbf/K0pvxy2zWGKxbP5jBYG1tg4XBq8wS/GzJ/6BA0t2G4FijaLk5
         fCov3m8/rQcKIvqlsMU8NufZWN8hLRnptiYo/qqwTTHiaOnOMDE2TW3yDXxMl7qlG02v
         ExAg==
X-Gm-Message-State: AOJu0YzZHo/ZTr2onOnAdu3v+QJXt5CZAVBGN1AGy4+PA08v4fvXQO5s
	F+6/1iWC3DDWVxa8xxJk+alvxlSWI9L6azPAH9V7qTNlQooCVmxPNGCBQSw1Ou6HS05RHleHtFL
	O
X-Google-Smtp-Source: AGHT+IFupjNruEJrK6M00oYJtsFjanhK06mAzHaDcS7siv7Dz+vr+ljh9/JeONto5LOKC7c8sK48Vg==
X-Received: by 2002:a2e:a548:0:b0:2d0:be0f:96ff with SMTP id e8-20020a2ea548000000b002d0be0f96ffmr7808300ljn.17.1707824550099;
        Tue, 13 Feb 2024 03:42:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwInivjc+fhkoQTGh52mlruKbbsI5ah9NIG04rizDPVZ82wnE3qp4h6epP2fF30zUQkgMzYuUPzoYmsWtZ44XWKHxirhdbX7b0nFILI4bCAdFWAMyw2iqIaV9JK560kH+hftJdOKPniuBL0S0=
Date: Tue, 13 Feb 2024 11:42:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/3] libxl: Allow Phy backend for CDROM devices
Message-ID: <d1c987d1-1f2d-40bd-9e28-21415cdb84ce@perard>
References: <20240201214004.238858-1-jandryuk@gmail.com>
 <20240201214004.238858-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201214004.238858-3-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 04:40:03PM -0500, Jason Andryuk wrote:
> A Linux HVM domain ignores PV block devices with type cdrom.  The
> Windows PV drivers also ignore device-type != "disk".  Therefore QEMU's
> emulated CD-ROM support is used.  This allows ejection and other CD-ROM
> features to work.
> 
> With a stubdom, QEMU is running in the stubdom.  A PV disk is still
> connected into the stubdom, and then QEMU can emulate the CD-ROM into
> the guest.  Phy support has been enhanced to provide a placeholder file
> forempty disks, so it is usable as a CDROM backend as well.  Allow Phy
> to pass the check as well.
> 
> (Bypassing just for a linux-based stubdom doesn't work because
> libxl__device_disk_setdefault() gets called early in domain creation
> before xenstore is populated with relevant information for the stubdom
> type.  The build information isn't readily available and won't exist in
> some call trees, so it isn't usable either.)
> 
> Let disk_try_backend() allow format empty for Phy cdrom drives.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

