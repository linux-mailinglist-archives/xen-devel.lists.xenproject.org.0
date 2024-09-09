Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C570E9713FC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794095.1202797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snasw-0001Ce-6u; Mon, 09 Sep 2024 09:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794095.1202797; Mon, 09 Sep 2024 09:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snasw-0001A6-4M; Mon, 09 Sep 2024 09:40:38 +0000
Received: by outflank-mailman (input) for mailman id 794095;
 Mon, 09 Sep 2024 09:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3F2=QH=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1snasu-00019z-Vw
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:40:36 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 901c57cd-6e8f-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 11:40:35 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2068bee21d8so40059275ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:40:35 -0700 (PDT)
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
X-Inumbo-ID: 901c57cd-6e8f-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725874834; x=1726479634; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OTeSKbd13UpZ8qI7LopC66Vws2elrpD4RlQ5sx/IQoQ=;
        b=LUd5kGpx0SsIUj1wcS/V/tq6RWfKi4Ucv5hU03S7/n6HERy19cH9A3u0TGrJnbQFWd
         7SUVUhxsTQRswLoRwEQ3m/i2MleAVGyGPbZr42ZAXhe8RxY+hgWOHp1D8j7HsM4w7sJ9
         8uvkad4qxREThiqXn8gLuvvvvAviFZfGgn5o/d5LLV81a6MW8Bx3FUWDxNVkkKVniGJU
         IJIV5pU8bafn4xHYAOJ7LR6s4CpEHp0gZ4TQFIIJFrf8ZDf0gOxuexiaD4cd1D1GHLIv
         izz4bNKM74hoZ/MtfKwzetOUTu6xpMU14PwCm38HuSmxFIcNJJ/oKp+3+ETcvkg7VVC/
         3toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874834; x=1726479634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTeSKbd13UpZ8qI7LopC66Vws2elrpD4RlQ5sx/IQoQ=;
        b=lMddtrlqpoH/PqFy/6RonEpZIa8VcEftWFjdfUiKYbdUYpz+2Yho1N8GWSotaWiAWp
         FWpJDBUjbwOmZWXCb2aanQl+CvIjPg6a3CY4S+C0TXjILl9Ih6VZWkBqKcbgIeETKpu+
         Ue08txsiG6EKYjTtu5LKRn/xgEOHbNSVkRzZB1wcrED5Wan3dwVDxhJK1A/ZoTVmxc3y
         0ZtzGsKpdRI4thv6wvAPXRZ0mxA4vRa0VDQHX6G2paF19MfYOI3MKrH1Pra1+lMG7h2B
         RBmZhkWKrmOqsMQUo/CUwsdketHoAh6CZhXK6e1a76gt2PaiLaa2/j1wjAJRiDSE2Ay3
         mYOw==
X-Forwarded-Encrypted: i=1; AJvYcCUwm19woGNWABgGOdjm9X78R2EDcEfFx3akSLTfw2LCd3IZPbxWlyjDwbAFyRNzJIjK4rvCvI+vPAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybwW1IZV5QW8WMfO18zDxRTwuAfP7jIi7S23kyieGolqJypKKg
	vm+Z7lG96dIUJFgKrLVA8Dvrd26KivwbTRw8PThy82EFPCxQhm5mRLYbrehtXfK+Njzsc+ZSO9x
	95StUFvQVXjJnGXsUy3hMcfBt9kg=
X-Google-Smtp-Source: AGHT+IEpdHWHxSKpCZUccSYOAO0tk5eEkI/Ok8RircErfWPBY96ntqbHCpVGjCix5Wz1cSiBCOgb0HN1IccEwKOqK+I=
X-Received: by 2002:a17:903:1252:b0:205:7db3:fdd1 with SMTP id
 d9443c01a7336-2070c0f8250mr111016685ad.36.1725874834138; Mon, 09 Sep 2024
 02:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com>
 <20240907134756.46949-1-jandryuk@gmail.com>
In-Reply-To: <20240907134756.46949-1-jandryuk@gmail.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Mon, 9 Sep 2024 11:40:18 +0200
Message-ID: <CALUcmUmMzJr=FGN9VArPLVJb0cA1e+QZxqA_nSBAU_9eTjOHng@mail.gmail.com>
Subject: Re: [xen_fbfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7
 results in crash
To: Jason Andryuk <jandryuk@gmail.com>
Cc: oleksandr_andrushchenko@epam.com, xen-devel@lists.xenproject.org, 
	Jason Andryuk <jason.andryuk@amd.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Sept 2024 at 15:48, Jason Andryuk <jandryuk@gmail.com> wrote:
>
> From: Jason Andryuk <jason.andryuk@amd.com>
>
> Hi Arthur,
>
> Can you give the patch below a try?  If it works, please respond with a
> Tested-by.  I'll then submit it with your Reported-by and Tested-by.

I have tested the following.

- Built and installed the Arch Linux AUR package linux-mainline:
6.11.0-rc6-1-mainline.
- Booted in PVH > failure: VM is inaccessible.
- Booted in HVM > success: VM is accessible.
- Applied the patch to the build above.
- Booted in PVH > success: VM is accessible.

From my point of view this patch works and resolves the issue.
Hereby:

Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>

Do you have an estimation in which kernel version this will land?

> Thanks,
> Jason
>
> [PATCH] fbdev/xen-fbfront: Assign fb_info->device
>
> Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> struct device is NULL since xen-fbfront doesn't assign it and the
> memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
>
> This was exposed by the conversion of fb_is_primary_device() to
> video_is_primary_device() which dropped a NULL check for struct device.
>
> Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> CC: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> The other option would be to re-instate the NULL check in
> video_is_primary_device()
> ---
>  drivers/video/fbdev/xen-fbfront.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
> index 66d4628a96ae..c90f48ebb15e 100644
> --- a/drivers/video/fbdev/xen-fbfront.c
> +++ b/drivers/video/fbdev/xen-fbfront.c
> @@ -407,6 +407,7 @@ static int xenfb_probe(struct xenbus_device *dev,
>         /* complete the abuse: */
>         fb_info->pseudo_palette = fb_info->par;
>         fb_info->par = info;
> +       fb_info->device = &dev->dev;
>
>         fb_info->screen_buffer = info->fb;
>
> --
> 2.43.0
>

