Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C050982DC5D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667472.1038762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOwT-0004jI-I7; Mon, 15 Jan 2024 15:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667472.1038762; Mon, 15 Jan 2024 15:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOwT-0004hA-FU; Mon, 15 Jan 2024 15:32:01 +0000
Received: by outflank-mailman (input) for mailman id 667472;
 Mon, 15 Jan 2024 15:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tunR=IZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rPOwR-0004h4-DS
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:31:59 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37dd0e5a-b3bb-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:31:57 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso7601975f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:31:57 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dr3-20020a5d5f83000000b00336ca349bdesm12274649wrb.47.2024.01.15.07.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:31:56 -0800 (PST)
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
X-Inumbo-ID: 37dd0e5a-b3bb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705332717; x=1705937517; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JHAWqQkH6zAOHcspM8GtHmviVe+n90/bHhVj77LgGcI=;
        b=HoXcgdqpt46B658UquKFrIPI/H0Lwz7Jw7Dd5aK2OvXxtpKgaxxZNGjpekWvyMT4/r
         VE7mlY2MacYOv0NAcb5bOgVy/r2pbadeyQsPtGaR0x08aI14CtZitwveMzO49yVJxiJh
         A1hdcY0v1nI9l3D0sk0Fxx65ruHLAlO07zJIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705332717; x=1705937517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHAWqQkH6zAOHcspM8GtHmviVe+n90/bHhVj77LgGcI=;
        b=oPS9PW8rf2d4InAPudM6pzPvlfeMkWzirwMijMs+049ZGdIF2Z9WcQw4QwA6lS9grx
         KlB/XtJr9l6E5tYGfhflD2MuP+aT0mI7qx1ZEc4uZSi5WCnm4siukF6GSVE3fYh7ryKv
         9JVPVknuO01bgOOdgnd9ui75udYi8bgJL94urV+tx4JhfmnkHIeULlK25sSgGb0YRD7q
         9xrAo/D170bLbQllsQJyaY1LsuXbQ1Cyooyr8Or+sNVjhmpbKSNtROi3hZWZ2KeLIsHz
         kDc5w7Ru30KlNIZtgV6WxELoSh7sJfdge5/92ZSddcQyb+DoiGfaR4GZtRwCqTAfdnFI
         b7zA==
X-Gm-Message-State: AOJu0YwwOfXLOYJzWKhY/bl4zh5SnoNBgfIT3HqMsX22JKc2rlYbUl6a
	vzJsHwFYwhgWQ/DSgNPUiy8ndCI7qNAMfA==
X-Google-Smtp-Source: AGHT+IGlOdlyj8u0ybHIAKRHtsQImammuEo3VF2mbljoDLhYHbq++Am8ABi+1d0z0Ww/AZnKN37V2w==
X-Received: by 2002:a5d:4403:0:b0:337:9fc0:67df with SMTP id z3-20020a5d4403000000b003379fc067dfmr1745106wrq.22.1705332716875;
        Mon, 15 Jan 2024 07:31:56 -0800 (PST)
Date: Mon, 15 Jan 2024 15:31:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v3 21/33] tools: add 9pfs device to xenstore-stubdom
Message-ID: <55c49bed-4039-449c-bb79-412ea9c2b5e2@perard>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104090055.27323-22-jgross@suse.com>

On Thu, Jan 04, 2024 at 10:00:43AM +0100, Juergen Gross wrote:
> Add a 9pfs device to Xenstore stubdom in order to allow it to do e.g.
> logging into a dom0 file.
> 
> Use the following parameters for the new device:
> 
> - tag = "xen"

Is it ok to have here tag "xen" when the default tag is "Xen" ?

> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 907aa0a330..00693264f7 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -2060,6 +2067,16 @@ int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
>                                 const libxl_asyncop_how *ao_how)
>                                 LIBXL_EXTERNAL_CALLERS_ONLY;
>  
> +/* libxl_p9_add_xenstore writes the Xenstore entries for a domain's
> + * primary 9pfs device based on domid, backend type and device parameters.
> + */
> +int libxl_p9_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
> +                          libxl_p9_type type, char *tag, char *path,
> +                          char *security_model, unsigned int max_space,
> +                          unsigned int max_files, unsigned int max_open_files,
> +                          bool auto_delete, const libxl_asyncop_how *ao_how)

Could we simply pass a "libxl_device_p9*" instead of all these
parameters? It would also mean that we can update the list of parameters
without having to change the function prototype.

These functions tend to be called "libxl_device_*_add()", is it possible
to follow the same schema? In particular, I don't see anything xenstore
specific in the function.

Thanks,

-- 
Anthony PERARD

