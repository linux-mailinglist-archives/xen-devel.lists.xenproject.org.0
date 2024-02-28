Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6E86B3FD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 17:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686729.1069122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMNc-0006xe-BK; Wed, 28 Feb 2024 16:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686729.1069122; Wed, 28 Feb 2024 16:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMNc-0006w0-7j; Wed, 28 Feb 2024 16:02:00 +0000
Received: by outflank-mailman (input) for mailman id 686729;
 Wed, 28 Feb 2024 16:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGB+=KF=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rfMNa-0006vu-EV
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 16:01:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b24944a0-d652-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 17:01:56 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so808727966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 08:01:56 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 lc15-20020a170906f90f00b00a4406929637sm648282ejb.162.2024.02.28.08.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 08:01:55 -0800 (PST)
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
X-Inumbo-ID: b24944a0-d652-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709136116; x=1709740916; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vCy/QJlmrqeXeGtfl6MixF44IvLE3ydHnEt5/a/0is=;
        b=gbnwB1/X4pBlaGk8Z3nVcZWd8eQQoCPCXlOqh6UWGNYLtZtCN8h6TlO0ODBSDY9EvR
         ACTT0eRiCoVZNklK9tHmYj0Puo1zPsoNjjuJ7qv/FMwFR2lzavxReFcAiW94I65X0QqM
         xnN5W4+mJWbyHyjcuGHaJz0YUAjkCwrxSQFmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136116; x=1709740916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vCy/QJlmrqeXeGtfl6MixF44IvLE3ydHnEt5/a/0is=;
        b=cNZFOpnjGFuvHxH/t23qOmmLG0+vZjkGREuxtFBCkRFc1PJW1chhSMyLcfIWsvJkqY
         nSTDDJ+FGGAHnkUj5peiSNgbdVcCLZ5xBPsdrk1sHU3eF2Vv2P/dCkSq7UaWMSeXivqE
         u4KfM+E0CCEoOYJ9oMtveLCSzSrqeeviSzbUbCt8klv6BiErx8oz9oFByFh0FCO1tcY6
         iPx5wWrEGDTa9aJO3OFOIKP6KX5DUSJq4TgLWpop5mIPP3BIgoDrsZMDLcm3NEQ+Iarx
         UuIUJw92ZB7/rCmFLBiZgIC4l/nIkETk2jmAjEKitGoYirh+/3fSBFGDL8qyVNHzkngC
         wU8A==
X-Gm-Message-State: AOJu0Yy7Hbz0FI5A6zZfcK5z6pIOGqns+AxDeop544kxP+/EllXmOdnK
	PYSMVWTBzqUGEGnrX93ArekBYVpI3uASwUhHDxwt23gb7T80H/NjbRhoVgcBbwI=
X-Google-Smtp-Source: AGHT+IFqLHTY/Uj7ignJTAgwYaxpWjsmZiSboUWzOFwnOD+Vot8CQ7Gjr/iGk+gnv57+A9xeg7oNrQ==
X-Received: by 2002:a17:906:44f:b0:a43:ef3d:e42e with SMTP id e15-20020a170906044f00b00a43ef3de42emr87688eja.18.1709136115773;
        Wed, 28 Feb 2024 08:01:55 -0800 (PST)
Date: Wed, 28 Feb 2024 16:01:54 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] libxl: devd: Spawn QEMU for 9pfs
Message-ID: <3d849b15-cfad-4d85-b2b8-11cd19027720@perard>
References: <20240109170540.38239-1-jandryuk@gmail.com>
 <20240109170540.38239-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109170540.38239-3-jandryuk@gmail.com>

On Tue, Jan 09, 2024 at 12:05:40PM -0500, Jason Andryuk wrote:
> @@ -3430,7 +3431,7 @@ void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
>       * because we will call this from unprivileged driver domains,
>       * so save it in the current domain libxl private dir.
>       */
> -    dmss->spawn.pidpath = GCSPRINTF("libxl/%u/qdisk-backend-pid", domid);
> +    dmss->spawn.pidpath = GCSPRINTF("libxl/%u/qemu-xenpv-backend-pid", domid);

This path is documented in "docs/misc/xenstore-paths.pandoc", I'm not
sure it's such a good idea to change it.

But maybe it's ok to change the path because xl devd is expected add
then remove this path? And that pid isn't going to be useful to anything
else?

I'd rather not change the path, but if you still think it's ok, we can
go for it. Thought?

Thanks,

-- 
Anthony PERARD

