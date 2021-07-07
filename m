Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40113BE8EF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152272.281327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17oo-0005Kh-0j; Wed, 07 Jul 2021 13:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152272.281327; Wed, 07 Jul 2021 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17on-0005Ip-Tp; Wed, 07 Jul 2021 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 152272;
 Wed, 07 Jul 2021 13:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPPN=L7=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1m17om-0005Hz-BJ
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:42:24 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baf12199-dc83-4084-824e-0a4eb225fd14;
 Wed, 07 Jul 2021 13:42:23 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id g4so1951266qkl.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 06:42:23 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id j22sm6519486qtj.60.2021.07.07.06.42.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jul 2021 06:42:23 -0700 (PDT)
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
X-Inumbo-ID: baf12199-dc83-4084-824e-0a4eb225fd14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=j4p0u0fuhtdIpJ0E0HqO2KkD+dV8LnlYdEq+XUDIrHs=;
        b=CR+QAEyv24VaUwdY7sY0x9Tcjaz/jwaPYr7wZtkl11l2cKE4/wpZg5ukSUEWszB/vF
         XizqFAb/S6BqSArWDXWxMMPYBfhjpMumnS4hSbJMc8Y8cdd25K7yZZrVOoB+dMSsl9kg
         k5Qw/paXPUrtHSz1yiXXBqIiPpS3+DrBTuWQukzN4v0XhbyWq5KOR0bukmhKRN6MVX7i
         a8OE6M8dwqEyrd9X0+QePry/Z1GLtVhBNAKtQ91Y0PrTAGw75O3rPuXB09qt7yFxs7lO
         WlDhgHuCCbYNQTeog7aCoM0PvR2WTJ/elsg6DDjwR4jwYVoe9oG+4gWeuGh9LSx3glyv
         dtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=j4p0u0fuhtdIpJ0E0HqO2KkD+dV8LnlYdEq+XUDIrHs=;
        b=EKhWaBsSRG8XsHUrh769Bhr8WL1lef6Yob3Dt02cwB/wAy2I7rbHHawOP57ugbwT5Z
         PiUbxf1PZNjTf1kzla7CbMpsskQuFnkioHD9zQoKcTnSmQV/dQsa6CBMKw422FyBAmzd
         E8ljZuc9kc5JzDcryhZCk7GdUIvj3ymcnOHGNltgiB/2xdYMq+/I0In5fg1agHTC17aU
         bfQ5a4jYVagucvwj/psTwiEouQTkBO3HyB3ghZrw9znQ+/0mCyb2Pj/32UGtlaExwQhq
         /kTaA9+FbsyasfDz2apHwbWQ4LD7HrD+vib6t7hdA/fM0BQt+LS8pV++Cfy70MY5m8Ow
         K2GA==
X-Gm-Message-State: AOAM530pZentU8mcsqv/eiIMUUjiTamZwToFHCMUPh6beieE7N7C+jnT
	uPkxA0vGWwiUvFmwdGFEjyM=
X-Google-Smtp-Source: ABdhPJwblpdm84+mNFg4BXAmuVqmiKyPArt8qmfTJKZomyUEnVzbURjjj/MsPAPQ6KuuPPBhO9IGpA==
X-Received: by 2002:a05:620a:1094:: with SMTP id g20mr25283101qkk.379.1625665343499;
        Wed, 07 Jul 2021 06:42:23 -0700 (PDT)
Date: Wed, 7 Jul 2021 09:42:20 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Ting-Wei Lan <lantw44@gmail.com>
Subject: Re: [PATCH] tools/go: honor append build flags
Message-ID: <YOWvPLcQywmEIPdI@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20210707071531.69001-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210707071531.69001-1-roger.pau@citrix.com>

On Wed, Jul 07, 2021 at 09:15:31AM +0200, Roger Pau Monne wrote:
> Make the go build use APPEND_{C/LD}FLAGS when necessary, just like
> other parts of the build.
> 
> Reported-by: Ting-Wei Lan <lantw44@gmail.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Note sure if it's the best way to add the appended flags, I'm not
> familiar with the go build system. In any case this fixes the build
> when required libraries (ie: yajl) are not part of the system search
> path and instead passed in APPEND_{C/LD}FLAGS.

This is right. The CGO_{C,LD}FLAGS environment variables basically work
just like regular {C,LD}FLAGS.

> ---
>  tools/golang/xenlight/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
> index e394ef9b2b..64671f246c 100644
> --- a/tools/golang/xenlight/Makefile
> +++ b/tools/golang/xenlight/Makefile
> @@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
>  # so that it can find the actual library.
>  .PHONY: build
>  build: xenlight.go $(GOXL_GEN_FILES)
> -	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog)" $(GO) build -x
> +	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
>  
>  .PHONY: install
>  install: build
> -- 
> 2.31.1
> 
> 
Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Thanks,
NR

