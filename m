Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180A873AFE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 16:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689381.1074275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhtQe-0006OK-7j; Wed, 06 Mar 2024 15:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689381.1074275; Wed, 06 Mar 2024 15:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhtQe-0006Lv-4L; Wed, 06 Mar 2024 15:43:36 +0000
Received: by outflank-mailman (input) for mailman id 689381;
 Wed, 06 Mar 2024 15:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzOk=KM=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rhtQc-0006Lp-Aa
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 15:43:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 490a3a8a-dbd0-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 16:43:32 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412f988d552so3724815e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 07:43:32 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fa26-20020a05600c519a00b00412f698af9esm2109959wmb.17.2024.03.06.07.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 07:43:30 -0800 (PST)
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
X-Inumbo-ID: 490a3a8a-dbd0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709739811; x=1710344611; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOmtTVfGZfmyP3Z2U9Aye9gisuKvmOWpAI+mJklhUz4=;
        b=Mbm9vN6XnvvQz0AUkrqwR5ZpTx5t3qeBb6tZ1H5ISmBQZI1ZCS4ffeaX/kdDouuTV3
         d/hZ3mmXH8cJYtY84F7BiJbn4pU3BX2tvTth0l5vBTmQvKY17YnItGfYWXSweCo3Hc8A
         5A/5dqLy+GAYJN832A77YQ1ULTdqa/CqpVt/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739811; x=1710344611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOmtTVfGZfmyP3Z2U9Aye9gisuKvmOWpAI+mJklhUz4=;
        b=B6bHJQ5n0AwSuKjYxbwhPYbnHzxtEIrvZ0A7T0KYRQKHORhhHQL8QIn9eqo0Y+oNTi
         q14EXo5aVUMWJ1nVkXCOQja0TYzRAzIFADgmnWDjklUZ5B+fIIa6hVTHacK+mK+wbtde
         OrtQjARNeNzmEW38x3h9eph+ZguUgPnhqc4P077kTND5BwRtqIhfCWSzuPDjwb/tinWD
         VFaOm6MyERUqR7zR2HDg5Jvz+3/s54zGQ4oxaM+kriFiDoE6dzEPEWt0ZNGihyCdrfMG
         7/RJ6bdLeo23ojlc0IUEkKCA4zcnKZAhedCqqvu2CGGWppQNR5lOUtnpW4aZiSYo1JOX
         u4qw==
X-Gm-Message-State: AOJu0YzdCraOL8Nu22WDq68TfoQaAy1B452TiNW3J/wNMRGLuJ30mWzs
	9Dxan+blr8Hqw66QsE1SsGBumJi9ok61QvDOTzj8JXhOiI1ajRTOIUrzrhxc44o=
X-Google-Smtp-Source: AGHT+IEhczkt+rPg5pLHJTIbY7c1Lr8OrlaVUDBAZBdEAQMw0ZSUx1fWK1Mii++8Y3VF5wCWA6j0gg==
X-Received: by 2002:a05:600c:3151:b0:412:fc6f:e578 with SMTP id h17-20020a05600c315100b00412fc6fe578mr906060wmo.9.1709739811554;
        Wed, 06 Mar 2024 07:43:31 -0800 (PST)
Date: Wed, 6 Mar 2024 15:43:30 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: zithro / Cyril =?iso-8859-1?Q?R=E9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs/man: add shutdown reasons to xl (list) man page
Message-ID: <5e8987de-36b1-4e00-876c-79a93e5334a9@perard>
References: <019602d6da2ff78e6582b9b6aae6d76216e150c3.1709678713.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <019602d6da2ff78e6582b9b6aae6d76216e150c3.1709678713.git.slack@rabbit.lu>

On Tue, Mar 05, 2024 at 11:45:13PM +0100, zithro / Cyril Rébert wrote:
> Add the shutdown reasons to the paragraph of "xl list" concerning the
> shutdown status.
> I have copy/pasted the explanations from the source code :
> 
>  - tools/xl/xl_info.c (L379)

Instead of a line number, how about the function name?
 - tools/xl/xl_info.c (list_domains())

>  - xen/include/public/sched.h (starting L158)

And here, I think that would be "sched_shutdown_reason".

Line number tend to change as we add more code, which mean that the line
number is only valid at the time it is written into the patch
description. But functions and struct name are less likely to be
renamed.

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Cyril Rébert / zithro <slack@rabbit.lu>
> ---
>  docs/man/xl.1.pod.in | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index bed8393473..2b046f97f1 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -370,6 +370,40 @@ scheduling by the Xen hypervisor.
>  The guest OS has shut down (SCHEDOP_shutdown has been called) but the
>  domain is not dying yet.
>  
> +There are six shutdown reasons, which will be displayed after the "s" : B<-rscwS>.
> +
> +=over 4
> +
> +=over 4
> +
> +=item s- : poweroff

It might look nicer to keep using B<> like the other states, that is
B<s- : poweroff>.

> +
> +Domain exited normally. Clean up and kill.

I don't think we should copy the explanation from "sched.h", they seems
mostly been written for someone writing a toolstack.

A user of `xl` isn't expected to "clean up" an domain in that state,
beside maybe running `xl destroy` because they've added
"on_poweroff=preserve".

> +
> +=item sr : reboot
> +
> +Clean up, kill, and then restart.

Same thing here as an other example, the only action a user can do I
think is `xl destroy`. The "restart" bit is definitely targeted at the
toolstack. There's no way to restart a vm, beside `xl destroy; xl
create`.

> +=item ss : suspend
> +
> +The domain is suspended. Clean up, save suspend info, kill.
> +
> +=item sc : crash
> +
> +Tell controller we've crashed.
> +
> +=item sw : watchdog
> +
> +Restart because watchdog time expired.
> +
> +=item sS : soft_reset
> +
> +Domain asked to perform 'soft reset' for it. The expected behavior is to reset internal Xen state for the domain returning it to the point where it was created but leaving the domain's memory contents and vCPU contexts intact. This will allow the domain to start over and set up all Xen specific interfaces again.
> +
> +=back
> +
> +=back
> +
>  =item B<c - crashed>

This entry is now a duplicate of "sc", I think we can remove it. And
probably keep the explanation.

>  The domain has crashed, which is always a violent ending.  Usually

Thanks,

-- 
Anthony PERARD

