Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839E853052
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 13:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679884.1057651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrgS-0008AM-G5; Tue, 13 Feb 2024 12:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679884.1057651; Tue, 13 Feb 2024 12:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrgS-000887-DS; Tue, 13 Feb 2024 12:14:44 +0000
Received: by outflank-mailman (input) for mailman id 679884;
 Tue, 13 Feb 2024 12:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZrgR-000881-0O
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 12:14:43 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 774d2e24-ca69-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 13:14:41 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0d7985dfdso58760021fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 04:14:41 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bu3-20020a056000078300b0033b46b1b6adsm9549152wrb.21.2024.02.13.04.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 04:14:41 -0800 (PST)
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
X-Inumbo-ID: 774d2e24-ca69-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707826481; x=1708431281; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WjeH00YjSJrsCeSkjG2978yTN0pqv0tSBf/xh0Gh5/E=;
        b=JqDCVc2KbmrHpKPZgFb75QFGEWvtyCqsLnASWD8NgJ/uQFGFW+zxdbYXQ8nDbER28x
         r4RYF+OT+cBPXyN6d05nEVpvYuRTXsqYfyhIBnFY3IAAF/0sPYwp5Z04pLR7bW21ldP2
         QEXULs593WxVvOzdnx+u6tfdroyBsEPeA4hNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707826481; x=1708431281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjeH00YjSJrsCeSkjG2978yTN0pqv0tSBf/xh0Gh5/E=;
        b=dzVyF9U5QUM8fhGa6bkE6uNJnsqQgV0Uy+cNLPUHYUKjwnON7OEEiQub6h5SXEaq3/
         nSDZpZ01Sm57DtT8I+dfEIQszdFSwzHh0OCnD7JH8eo+goACnJlTNwKfNLn7lasMoqU6
         vvLnmCb6+aboAbgxMEkR4XwhMSbHeeMb2Ocae41CF14HWSc+TqcI42HxWbe6ENMFTOkF
         5sVp3eo7urrQEq/uQa/gnWxljHOkDwRf9Hv9mCA7dNCWl9dCP+fB2j44f+OyKVJ7bx/b
         fDn0reraOyKH5Q30j7weocLbRB5+8yaTbwHnRHrrPQso1rX3n/cCbLCkK8zaA1rmrUav
         ERfg==
X-Gm-Message-State: AOJu0YxQa/OF0Eakab9+mIBKkWhWSaA3jaIF9vJOOpCIys8eu5N6dERS
	OB93vEyv5bty9qmPOtftACRB/jQA4tpXQYnFT0nd+sQEYyyCd8HYcPkklewS8SkGJ/zrDjNy5fz
	Q
X-Google-Smtp-Source: AGHT+IFoWK0rRjnCTM4tih7mKaCydZAU6wlay2sX/rQQlic0PdScjzmuUuTCJTh/XRynPEBmsWobUA==
X-Received: by 2002:a2e:a36e:0:b0:2d0:b646:3bc9 with SMTP id i14-20020a2ea36e000000b002d0b6463bc9mr5889870ljn.23.1707826481426;
        Tue, 13 Feb 2024 04:14:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPC1/zh/10KrCX/mdPTU2TXkzcOE11lYmSMk/IzDZqYQ+ueFsYp/qBjB97BmhYl3PtFm+YuPAGeCAoB+rmKn+HWsNzQ0OhGqR2F/efUa660QoAiS7QmBHgHagERI/ueaNpZbvdTaJfFb5hOq9Rtt+Ge+oXoI2FEVlKOE5JLPhZ3jFrWtTHncEs0piirTeck6ffnhyjXJYDn77y9CZ5U7Iu9mFchGvWohDuRWkqDNeK3ZiA
Date: Tue, 13 Feb 2024 12:14:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2] libxl: Add "grant_usage" parameter for virtio disk
 devices
Message-ID: <a12d924d-b570-4795-8ed6-f62f3604c361@perard>
References: <20240206123814.2308837-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206123814.2308837-1-olekstysh@gmail.com>

On Tue, Feb 06, 2024 at 02:38:14PM +0200, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Allow administrators to control whether Xen grant mappings for
> the virtio disk devices should be used. By default (when new
> parameter is not specified), the existing behavior is retained
> (we enable grants if backend-domid != 0).
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> In addition to "libxl: arm: Add grant_usage parameter for virtio devices"
> https://github.com/xen-project/xen/commit/c14254065ff4826e34f714e1790eab5217368c38
> 
> I wonder, whether I had to also include autogenerated changes to:
>  - tools/libs/util/libxlu_disk_l.c
>  - tools/libs/util/libxlu_disk_l.h

Well, that could be done on commit. The changes are going to be needed
to be committed as they may not be regenerated to include the new feature
in a build.

> ---
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index ea3623dd6f..ed02b655a3 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -623,6 +628,15 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
>              goto cleanup;
>          }
>          disk->irq = strtoul(tmp, NULL, 10);
> +
> +        tmp = libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/grant_usage", libxl_path));
> +        if (!tmp) {
> +            LOG(DEBUG, "Missing xenstore node %s/grant_usage, using default value", libxl_path);

Is this information useful for debugging?

It should be easy to find out if the grant_usage node is present or not
by looking at xenstore, and I don't think libxl is going to make use of
that information after this point, so I don't think that's going to be
very useful.

> +            libxl_defbool_set(&disk->grant_usage,
> +                              disk->backend_domid != LIBXL_TOOLSTACK_DOMID);
> +        } else
> +            libxl_defbool_set(&disk->grant_usage, strtoul(tmp, NULL, 0));

Per coding style, it's better to have both side of an if..else to have
{}-block or none of them. So could you add a {} block in the else, or
remove the {} from the true side if we remove the LOG()?

Thanks,

-- 
Anthony PERARD

