Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D0854F9C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 18:14:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681088.1059667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raIoi-0004EI-Vv; Wed, 14 Feb 2024 17:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681088.1059667; Wed, 14 Feb 2024 17:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raIoi-0004Cp-TG; Wed, 14 Feb 2024 17:13:04 +0000
Received: by outflank-mailman (input) for mailman id 681088;
 Wed, 14 Feb 2024 17:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hroU=JX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raIoh-0004Cj-9J
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 17:13:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e639de0-cb5c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 18:13:01 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-411d231ea71so12515475e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 09:13:01 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d684e000000b0033cf4727a46sm762932wrw.25.2024.02.14.09.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 09:13:00 -0800 (PST)
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
X-Inumbo-ID: 4e639de0-cb5c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707930780; x=1708535580; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UKpQCyWcv7wnt3+/fGe9aC//4icjIiWztF/pEJGKqQ=;
        b=NeuySOY+IW7w8TLslWg4XDZ9XenIBjvMuhy3jtwg5P76oWqjJOMH5/OH4P6I/LrA3K
         FRl3inxK3ytCb6H6HBeS4X46VE5yne+042IiPEE7kU5KY8Wnx2Ro9+ez4YR0fDcKIPcE
         GS/AOaS/7T66jw5ueBZeRVZAZGvJlMccYQt7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707930780; x=1708535580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UKpQCyWcv7wnt3+/fGe9aC//4icjIiWztF/pEJGKqQ=;
        b=V12eU/XhPZfseDFRDdRJCLy3CEP6mylt/6C4az5pHD2bfGVPxun7f74h33qI5n0e1/
         W5PgloF97FdVkzyGnw9ZtITfP9qKOEunWmV17517VB8wdAbXZmAtZE4tbCJigFo/KXJk
         ZPiN+gIM/TKJWb4FDJyN1kyGzMcYsbKsU7509YbgsUEpwt2IrI8ul4HI8xzmJYu7ZqdZ
         3dQOvuT6o+HGeSHtIa7rdQqOwvFosw39x4+n2gpUsw06lyILvmD7PW8ppH60kqME7fUd
         tS4VSz2FSJhtsjMiJh3/hRhQPE0QQcYRtdlroprIYbM4JCR7rn/xNliE+8JexhNxxW2l
         T5Tg==
X-Gm-Message-State: AOJu0YxERbuxPGTd2C85oxzB3viSgnM0h8fLOd1D2ujDQGO1DZbD1p8q
	MQ4we0z2DQe+yc14vkMev1hyBO4Dw8dxwofHgoe2y94pjNb1PRnbk40JjyivmwU=
X-Google-Smtp-Source: AGHT+IEA51Z61t8WM/hpI8eJDUqTxNiktdX0cB8JdpQY3OlFQRL15XPUPegiOA2JpRjggIqgeY4WKg==
X-Received: by 2002:a05:600c:474c:b0:411:de5c:8abe with SMTP id w12-20020a05600c474c00b00411de5c8abemr2524354wmo.1.1707930780427;
        Wed, 14 Feb 2024 09:13:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsJrmCaeEK8Y8dL0icIRmymZrxFKqsIq7ZcExI9SAB795YcH4FqO2We5lt/lGhdFNsHAgnnz+NMAi6GsxKIVjXpje883JySx/RQEXCqJc=
Date: Wed, 14 Feb 2024 17:12:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 16/22] tools/xl: support new 9pfs backend xen_9pfsd
Message-ID: <678e5655-8f17-48b6-9a87-a3647aa61de9@perard>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-17-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208165546.5715-17-jgross@suse.com>

On Thu, Feb 08, 2024 at 05:55:40PM +0100, Juergen Gross wrote:
> Add support for the new 9pfs backend "xen_9pfsd". For this backend type
> the tag defaults to "Xen" and the host side path to
> "/var/log/xen/guests/<dom-name>".
> 
> Do most of the default settings in libxl. Unfortunately the default
> path can't easily be set in libxl, as the domain name isn't available
> in the related 9pfs specific function.

It might be possible to do that in libxl__domain_config_setdefault(), or
maybe in initiate_domain_create(), but I guess that's fine to set the
default path in xl. Users of libxl might want to have a different
default path.

> Settings the defaults in libxl requires to move the sanity checking
> of 9pfs parameters from xl to libxl, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> V2:
> - test max_files and max_open_files, too (Jason Andryuk)
> V4:
> - fix man page to use the "xen_9pfsd" type due to idl limitation
>   (Jason Andryuk)
> - set (most of) the defaults in libxl (Anthony Perard)

Patch looks good to me now:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

