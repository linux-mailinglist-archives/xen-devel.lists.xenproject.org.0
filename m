Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D3B89E0BF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 18:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702534.1097640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEc9-0005yH-0q; Tue, 09 Apr 2024 16:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702534.1097640; Tue, 09 Apr 2024 16:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEc8-0005vi-UQ; Tue, 09 Apr 2024 16:46:28 +0000
Received: by outflank-mailman (input) for mailman id 702534;
 Tue, 09 Apr 2024 16:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruEc7-0005vc-0f
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 16:46:27 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b347bfab-f690-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 18:46:24 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d718ee7344so67422771fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 09:46:23 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b00343300a4eb8sm11830459wro.49.2024.04.09.09.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 09:46:22 -0700 (PDT)
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
X-Inumbo-ID: b347bfab-f690-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712681183; x=1713285983; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew4xNTMER6FcNBl8NvmpYgwC8GEh9JTHCYmFqfvT1Mw=;
        b=ejqlcfm7iUSgRUMXxgBlm03rRosRjTtp5OlhXiEIEPTAD1e7ennHSLd4eKlwn4tZx5
         ic53kt6IknCiZxVdUm2jgx5ysChGBmiFsIoaE9PPv540X+Vs5Oiq0CTntRMwSp+PXti2
         Ros37sFlUxsh+hzMuK0+iHuhdoE3dHwXGyMzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712681183; x=1713285983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew4xNTMER6FcNBl8NvmpYgwC8GEh9JTHCYmFqfvT1Mw=;
        b=e7uNgXBXzZ2fXPCbC/IhB2LNKqqnDeYbeJeAGvj+3Mne4KtWkz9Fu91+s1+wP9q+3r
         Env7gL0O1sBwURPhpi3fqxstXbqb7cyUZWm59Jf28S1pFtUI7e4welycxLp4PnBcoepo
         GzB+H5AG0wDA/rN1rD0Bm0SR6ODrjFrzk9BWsHNqHtwJ+XfMOWwo68fRItlMJp1ZyDzG
         z/wH/i3yZLdZuIDTb75v8rkKXVE1Hxux7b2++LCzCK5Ev80t68fMxsthiIIKkEyvosQ5
         SUYApEim6cch522B+cnrZZmTHLXSZMMNVb28Mcibdwj9ho9M3KHVP8ZDqzdJY/CrsN+F
         mKwg==
X-Gm-Message-State: AOJu0YzssYwU6WVhTVAy31R/aNkUvwt5oHKgx1h5R4Lnw4xDggjBxHyw
	WNgEuniXZErqXBG6CAb6a9fW9r7Loz/8QENdxYA+I/AnQHov/InNEoQg957kdsM=
X-Google-Smtp-Source: AGHT+IGAQI36grRyTUp7hRB9aT/dhAmC4VFo7F8WiaYkY8jF7upO5ko/3lFRjdqMLH4Gmu002+vqkg==
X-Received: by 2002:a2e:3e1a:0:b0:2d7:b78:4109 with SMTP id l26-20020a2e3e1a000000b002d70b784109mr224280lja.53.1712681183112;
        Tue, 09 Apr 2024 09:46:23 -0700 (PDT)
Date: Tue, 9 Apr 2024 17:46:21 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 5/6] tools/misc: xenwatchdogd enhancements
Message-ID: <ba23ee1e-6cd5-469b-902f-d5feac4d1cdd@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-6-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-6-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:55AM +0000, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Add enhanced parameter parsing and validation, making use of
> getopt_long(). Adds usage() function, ability to run in the foreground,
> and the ability to disarm the watchdog timer when exiting.  Now checks
> the number of parameters are correct, that timeout is at least two
> seconds (to allow a minimum sleep time of one second), and that the
> sleep time is at least one and less than the watchdog timeout. After
> these changes, the daemon will no longer instantly reboot the domain
> if you enter a zero timeout (or non-numeric parameter), and prevent
> the daemon consuming 100% of a CPU. Add a copyright message. This is
> based on the previous commits which were from Citrix email addresses.

This to me is really hard to read, it just looks like a blob of text,
where it supposed to be a list with several modification listed. The
part about the copyright should be in its own paragraph for example.


> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> ---
>  tools/misc/xenwatchdogd.c | 111 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 101 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
> index 19ec4c5359..b78320f86d 100644
> --- a/tools/misc/xenwatchdogd.c
> +++ b/tools/misc/xenwatchdogd.c
> @@ -1,3 +1,20 @@
> +/*
> + * xenwatchdogd.c
> + *
> + * Watchdog based on Xen hypercall watchdog interface
> + *
> + * Copyright 2010-2024 Citrix Ltd and other contributors

This is probably more like:
Copyright (C) 2010 Citrix Ltd.
Copyright (C) 2024 *** your copyright here ***

Because it's looks like the only contribution from us was in 2010, and I
suppose it's fine to have more than one copyright line.

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.

This might be the wrong license, the default license we use is GPL 2.0
only, not LGPL. See :/COPYING .

These days, we prefer SPDX tags instead of the full licence text.

So overall, the header of the file should look something like:

/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * xenwatchdogd.c
 * 
 * Watchdog based on Xen hypercall watchdog interface
 * 
 * Copyright (C) 2010 Citrix Ltd.
 * Copyright (C) 2024 *** your copyright here ***
 */

I don't know if adding the file name in that header is very useful, but
I don't mind either way.

Also, could you do this in a separate patch?

> + */
>  
>  #include <err.h>
>  #include <limits.h>

Nice change overall, it's just the license part that need fixing.

Thanks,

-- 
Anthony PERARD

