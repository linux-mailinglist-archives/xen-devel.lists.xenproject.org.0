Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9182DC27
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667462.1038743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOf5-0006Fe-UL; Mon, 15 Jan 2024 15:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667462.1038743; Mon, 15 Jan 2024 15:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOf5-0006E5-Qv; Mon, 15 Jan 2024 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 667462;
 Mon, 15 Jan 2024 15:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tunR=IZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rPOf4-0006Dz-L0
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:14:02 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c13732-b3b8-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 16:14:01 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e80046246so2949455e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:14:01 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040d8eca092esm20244013wmq.47.2024.01.15.07.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:14:01 -0800 (PST)
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
X-Inumbo-ID: b6c13732-b3b8-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705331641; x=1705936441; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hzePe3fUFW6Q7NvaSwYvslxeKT/vQ8h/FWEisb5kGQ=;
        b=peu09xLw/EhcmgdrcBxzILeZIuE3MFGjS24Kx+lPnRD6X6u1eltYu+f2tYIQhEBKKw
         paKOGTdBLG+ajcc1iScGbM/Zr/EhCpegWCrA2xKOFZJiQb3kymP6xsPcYLoBMxRMD9/O
         TkmDS1oTIcT5/S/drOE9fq+UqPsCZP9N1wIAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705331641; x=1705936441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hzePe3fUFW6Q7NvaSwYvslxeKT/vQ8h/FWEisb5kGQ=;
        b=qJPgVQNcwmTf+mzKThtN48QxE2kV4ImrQTCPTEEKKSY7nFISVFdN7JFB4XzBxb1O4R
         t/04zMo5aYyVtPtHQ1Hiyb5NVLNj1FektUARh4jeku5raLvRm33WqCSnAnH+Igw0/Yz4
         MmIxGuYSQWMPuO5dfH/7kjXWfubvdm5Huh7+ulAKw0KxIXLe4iMPJFfnWf6jFAbodUYh
         9CAvjM48GJ8bf2jIMtL7eDDQIzGPZhRfSMxMlovz1K+tcvsg6KGcGnaIVaL527w2w7za
         vsegkFidYVW3KTaVNC9EjNfd8R4uU1GD5dWan+l7CvpUIO8ZfUzsDfNZmgARP66wg1Do
         egPQ==
X-Gm-Message-State: AOJu0YwqiCf/iV9n+tzcGDXlvMUKd6nRilv5+o/VFj48by18d5DvLWiu
	ZwbawwSJocih+68pFdZzxzK0dZlI2kSuXA==
X-Google-Smtp-Source: AGHT+IGng3lKWQ40PQR8nFimpuYG2bWbdlp/ufA/x+UJXbvAbom1GkwdcEorQC40nMa8OLtgtCm7vQ==
X-Received: by 2002:a7b:cbd4:0:b0:40e:6529:37d with SMTP id n20-20020a7bcbd4000000b0040e6529037dmr2571675wmi.119.1705331641307;
        Mon, 15 Jan 2024 07:14:01 -0800 (PST)
Date: Mon, 15 Jan 2024 15:14:00 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v3 17/33] tools/xl: support new 9pfs backend xen-9pfsd
Message-ID: <43cb6d28-34da-47b9-b61f-0be8298f9d8b@perard>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-18-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104090055.27323-18-jgross@suse.com>

On Thu, Jan 04, 2024 at 10:00:39AM +0100, Juergen Gross wrote:
> @@ -2242,6 +2256,28 @@ void parse_config_data(const char *config_source,
>  
>              libxl_string_list_dispose(&pairs);
>  
> +            if (p9->type == LIBXL_P9_TYPE_UNKNOWN) {
> +                p9->type = LIBXL_P9_TYPE_QEMU;

The defaulting is normally done in libxl, so that it works for all users
of libxl. Can this be done instead in libxl? Hopefully, it's enough to
do it in libxl__device_p9_setdefault().

Same question for the followup checks and default values.

> +            }
> +            if (p9->type == LIBXL_P9_TYPE_QEMU &&
> +                (p9->max_files || p9->max_open_files || p9->max_space ||
> +                 p9->auto_delete)) {
> +                fprintf(stderr, "Illegal 9pfs parameter combination\n");
> +                exit(1);
> +            }
> +            if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD) {
> +                if (!p9->tag) {
> +                    replace_string(&p9->tag, "Xen");
> +                }
> +                if (!p9->path) {
> +                    char *path;
> +
> +                    xasprintf(&path, XEN_LOG_DIR "/guests/%s", c_info->name);
> +                    replace_string(&p9->path, path);
> +                    free(path);
> +                }
> +            }

Thanks,

-- 
Anthony PERARD

