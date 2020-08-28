Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8606255DA7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgAS-0007VZ-1E; Fri, 28 Aug 2020 15:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQLo=CG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kBgAQ-0007VO-JA
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:19:50 +0000
X-Inumbo-ID: d5210c9d-ab45-439c-bfe1-163c98274c2f
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5210c9d-ab45-439c-bfe1-163c98274c2f;
 Fri, 28 Aug 2020 15:19:49 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id w2so542910qvh.12
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FRQfopwuX7HYbmPKXXnaTqbTDQHSfhdbA9ROlcaESOE=;
 b=KfInV/ads5ocn4lgz2t8vjb7sWI8VtUjtCTDx2kdgVo0mzya7/uXNbZxvddYljgehL
 hWQzRlaTaDfvqRbRmOlg98iqIF4bwAeS7wDXnJj1kKJwPyOmPaDJmW8nNF/iXGpxAhlb
 sILP3FT8zLBOijt3b8cYmcCH5E9EyRvSsm9kYOfvYXtbbEfCgAlLBMdRS1oAU/PqFpZq
 5Q3+DjETlhr8ErdkpgWpaAdmEqkcpkhEGihHNhMBgvn1sXSQ9hWv0NluAyRTVPwYhC+5
 8y6gvWDPFP2y6bjk71Wm/o5QNYHQHwHoW557qU+jJ6WPGw0CKmk6H057+blt8qdAgi4y
 oiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FRQfopwuX7HYbmPKXXnaTqbTDQHSfhdbA9ROlcaESOE=;
 b=XzGOTmkYh5vdLUKPPHoK/hfw4hx0Uf0GEaIoD2jPb0dbYn0JMN1k1gMpUy32/HydPa
 FcruiT38h6oXqU/3T8+NFbcTYPQCwX3ptcOnn/SiJUtYCHQsOJbaCgLXUV/aOBt/GuzR
 vSvu2QhtKljhh5/jD1n5B/0O0NG6/qyJbZqs51m0D2+2GoCQoCDvymcfR2E3O7J2+awb
 6ENeo5jGv1c3SUvv2ZJ/MJPkw8zgmegA6uBkdjdAcdjTosnprEbDGP2cCnrejIhsRXzt
 cjFZ81RNRpW1p9jjx1dtYWGLYDbRMIt6WW1L64Uy/pOJinoYosHc6MT0ImB0WXw/oI84
 bBCA==
X-Gm-Message-State: AOAM5309XbCkHyMjGNhADsjEM85ObJ7Ra+xtWLN0o69OdEiXH95IefAX
 Sjdi+dLWe4dRY55dea4doA8=
X-Google-Smtp-Source: ABdhPJy9ug+JbgY7irS7GOEgid3MYlPglGNv+qmKk7nyMrAEgwTZZa9aooGR8ArzGBcw8u47ZZctZg==
X-Received: by 2002:a05:6214:1910:: with SMTP id
 er16mr2276198qvb.228.1598627989336; 
 Fri, 28 Aug 2020 08:19:49 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id w27sm1158733qtv.68.2020.08.28.08.19.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Aug 2020 08:19:48 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:19:44 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] Revert "libxl: Generate golang bindings in libxl Makefile"
Message-ID: <20200828151944.GA21717@six>
References: <20200828144248.1970259-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828144248.1970259-1-george.dunlap@citrix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 28, 2020 at 03:42:48PM +0100, George Dunlap wrote:
> This reverts commit 60db5da62ac051aab0b217fa2d96acca1cd3ca3e.
> 
> This is in preparation for the planned move to hosting the xenlight
> package in a separate repo.
> 
> This also fixes a regression when building with a read-only source and
> an out-of-tree build.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> This is a candidate to backport for 4.14.
> 
> I was doing prep for writing the infrastructure to create or update an
> external repo, and figured I might as well send this out now.
> 
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Nick Rosbrook <rosbrookn@ainfosec.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/golang/xenlight/Makefile |  9 ---------
>  tools/libxl/Makefile           | 17 +----------------
>  2 files changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
> index eac9dbf12a..8d4d1e97ac 100644
> --- a/tools/golang/xenlight/Makefile
> +++ b/tools/golang/xenlight/Makefile
> @@ -13,15 +13,6 @@ LIBXL_SRC_DIR = ../../libxl
>  .PHONY: all
>  all: build
>  
> -GOXL_GEN_FILES = types.gen.go helpers.gen.go
The build target in golang/xenlight/Makefile still uses this variable
after reverting this patch. $(GOXL_GEN_FILES) will be empty now, meaning
`make build` will not re-generate *.gen.go if a change was made to
gengotypes.py.

-NR

