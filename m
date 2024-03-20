Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0588168F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 18:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696065.1086649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzi7-0003hS-QG; Wed, 20 Mar 2024 17:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696065.1086649; Wed, 20 Mar 2024 17:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzi7-0003fG-Mz; Wed, 20 Mar 2024 17:26:43 +0000
Received: by outflank-mailman (input) for mailman id 696065;
 Wed, 20 Mar 2024 17:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmzi6-0003f6-EA
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 17:26:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 040c3d59-e6df-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 18:26:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4146a1b6faaso641025e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 10:26:41 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 bd7-20020a05600c1f0700b004146ece5cf1sm1465612wmb.34.2024.03.20.10.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 10:26:40 -0700 (PDT)
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
X-Inumbo-ID: 040c3d59-e6df-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710955601; x=1711560401; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdCRJa+U6ncczwulAwFsu6+kl26hXYbYFKcPPENVGjw=;
        b=gPrF4auBMjOT5zlV/AlMt8Zt5U3UmstZrXk8I5BZhsI6GTQFVbi4cizflQ+oFmIYTL
         diqIZsKxJ5gOyI/3Vy5bBZPO63O30loEDovMXdjjLuNkwoRA+lnG+qlwcGM5ctREtCIa
         DtdTkzduowd4t2JxOIgbto0i0WyXQ3gjeXlEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710955601; x=1711560401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdCRJa+U6ncczwulAwFsu6+kl26hXYbYFKcPPENVGjw=;
        b=U/pYwEzXv3ZuoUE/9p9lQ3Px7r/Fgo/s7DCHZDF1fn8oo+R/cEKBiTgVq4XzLNyKH6
         rb+haw7L8bI4gd5VW1Ivrf0nVFI7nJyEUdjmQafKZTWoftJRgWHExbu42Orz5btfGDa5
         gfMTyoJu7+5YuqfcsoWzk2JdTErvoHgy2X06nOisN4cdZ2E5y2lxEXEBT3o7ePSJNjwW
         FUAgWRiKd5OUp9QGckV0Ah7yhTW1ei+sLGvd1PSBkRHPJuVwhdF/excAUeJqirO7IZMd
         0gaZ2Tu9K23+jB9scUFG5q929Y7tMa9O69muMikTWs2DM/diGjeGa6MmJjEZDxIfdtHY
         N8qg==
X-Gm-Message-State: AOJu0Yy7HiG6Y4QbUTtdDYOjjF6ZMbE2FaIwFtIalBLFgZXGHfxkLAaG
	KklhFtTp8Xc7ZqFgaDqe+SonrZe1uV4netDN0ETFA9bZhnagpQZ126bOp4/6WVjlcv/zRIS1OdO
	K
X-Google-Smtp-Source: AGHT+IFAUiA9SbdG9DSwqwxiKUiVAqqFz6VeaFH3+f4BvkQWkutTfnZU86k67U6x4Fc2XrxO8vfuqQ==
X-Received: by 2002:a05:600c:a0b:b0:414:21b:9a92 with SMTP id z11-20020a05600c0a0b00b00414021b9a92mr12150552wmp.8.1710955601046;
        Wed, 20 Mar 2024 10:26:41 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:26:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 35/36] Switch to Debian Bookworm as default suite
Message-ID: <ZfscUGqEs5U1e2yO@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-36-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318165545.3898-36-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:44PM +0000, Anthony PERARD wrote:
> Xen 4.17 doesn't build with Debian Bookworm. It fails to build
> IPXE/etherboot, on "amd64". So we keep using Debian Buster on Xen 4.18
> and earlier branches. Xen 4.18 builds 4.17 via job "build-amd64-prev".
> 
> Xen 4.17 would needs 18a36b4a9b08 ("tools: ipxe: update for fixing
> build with GCC12") which is only in Xen 4.18.

I would request the backport to 4.17.

Thanks, Roger.

