Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F166F9908AC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810535.1223242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swkqY-0008JB-0u; Fri, 04 Oct 2024 16:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810535.1223242; Fri, 04 Oct 2024 16:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swkqX-0008Gn-UV; Fri, 04 Oct 2024 16:08:01 +0000
Received: by outflank-mailman (input) for mailman id 810535;
 Fri, 04 Oct 2024 16:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ey+f=RA=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1swkqX-0008Gh-0C
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:08:01 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2e6a853-826a-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 18:07:58 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fad0f66d49so36775091fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 09:07:58 -0700 (PDT)
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
X-Inumbo-ID: d2e6a853-826a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728058078; x=1728662878; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYjyGMnIxNup7gKRsx4s2998ILa01TuDEJqD/qsxzYE=;
        b=AS/2bpUJPcWUTGA+gPIhSk6OxsJQkizc8Q6tKMYaoRTfGCefB7W4JBDgUwun7Of1uI
         EdWKvjxCHGovQeYK9gPumqaHb08pJtQ6ySH4OVhssDZ6LT/MafW34rj4G6cuB3FuZ9lR
         Gx+7N1zA1kC7WuEv9rRoU/yg3zBXzqPfHOrRQTbQRtUuC0FxMtOLZBZt1ezfmPPSGD3x
         4HVOX3DVFSjTDDJQoFMykocpoCsO8W+tkJ6iUCBf0ZwPiuiEDvYFwqbz0JyRJl404oY/
         hwEwwyYscLLeNIglccSyHSx4+fnmel74+uhG7AvDmFVD6IGt1JxF1F+i1tnI/YFtDuqe
         8F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728058078; x=1728662878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYjyGMnIxNup7gKRsx4s2998ILa01TuDEJqD/qsxzYE=;
        b=drJHif2NgF2KhXNS8zn4VGtTVHvY7fhWFq6R4T+48XgGIU3ICQR+Euz73RKdDRBQlt
         nmofJC++iDmk5jLoNBGPPgYAes1iyrozeNhgtj36l6wZB5Lme2vEEpMSadq2/z+5zKV2
         uMukKhe2yD1X6NeHkGbrSzk65Vbuedn3L38vV5KDxUwCgc7DRrAVdk89Ecm21R2aOv9s
         ONMAYjskbh+buLUv5IEs6y4vxefH7J80M9ht3Py0uPfTfCpkJPZGisM06v1Oi0LSlk7P
         KXX5mBnuGQ88WqQQ3x5stfuq+tQO6GIaFtMAkdeX8UeuWzO5IyuuQmPj2T3oGyX0SBol
         EN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwfcogO3rIXGSxM0H40H0YU+OcY4aV+CiEiySZcPGc8FmSkW+wFNVSPDk+GgVV3LzcVkVYtZZhRM8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUhAuirADCDfEOM2CSzcXIx2FEf8mH3Scw5loa8W9ATn5XCLX1
	MqXDZXrjGtf66dtwtdaJajzrDql4chl8FK7vMSNnw9l+aXD4DPvirZsP1AI71ILETgmpyhGcKew
	mnRRNj4H359wVrvI3rP+ACtX57DfHs3XwPFfMjg==
X-Google-Smtp-Source: AGHT+IFQSSW1Qqbr+FutV4pww9x20cyMzPY/mKFV/3n2pOfi9CeNC1DV7dZFCXWo5Sf/N16k3K/dc3naDSjqLmf9IPE=
X-Received: by 2002:a2e:9e18:0:b0:2f3:f7cf:2f01 with SMTP id
 38308e7fff4ca-2faf3d71ab3mr13946611fa.41.1728058078036; Fri, 04 Oct 2024
 09:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 17:07:47 +0100
Message-ID: <CAFEAcA_NuLpau9KdKFGxa9yCMdgB9LSEB-3WVBAb=2aFwU2PxQ@mail.gmail.com>
Subject: Re: [PULL v2 0/5] Xen Queue
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Oct 2024 at 19:57, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> The following changes since commit 423be09ab9492735924e73a2d36069784441ebc6:
>
>   Merge tag 'warn-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2024-10-03 10:32:54 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-03-v2.for-upstream
>
> for you to fetch changes up to ca9275a4b11aced3074219d1712e29fce5036f72:
>
>   hw/arm: xenpvh: Enable PCI for ARM PVH (2024-10-03 19:37:35 +0200)
>
> ----------------------------------------------------------------
> Edgars Xen Queue.
>
> ----------------------------------------------------------------
>
> ChangeLog:
>
> v1 -> v2:
> * Removed left over trace call
>
> ----------------------------------------------------------------
>
> Dr. David Alan Gilbert (1):
>       hw/xen: Remove deadcode
>
> Edgar E. Iglesias (4):
>       hw/xen: Expose handle_bufioreq in xen_register_ioreq
>       hw/xen: xenpvh: Disable buffered IOREQs for ARM
>       hw/xen: xenpvh: Add pci-intx-irq-base property
>       hw/arm: xenpvh: Enable PCI for ARM PVH
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM

