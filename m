Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51891E33E4
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 01:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdjS1-0008CV-Li; Tue, 26 May 2020 23:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LE0D=7I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jdjRz-0008CQ-Jy
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 23:57:39 +0000
X-Inumbo-ID: ae099c64-9fac-11ea-9dbe-bc764e2007e4
Received: from mail-qv1-xf31.google.com (unknown [2607:f8b0:4864:20::f31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae099c64-9fac-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 23:57:39 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id z9so10349556qvi.12
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 16:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4l5IN1Cyll7yznAYyy5s4ZQut9n46ETYfEZJFeYnMGw=;
 b=EmZuxg9ricpPdFMhg4Vh+a1FpmGfUWEppKNUW1Mg9PZ3rOTDW9twgAjEnlpCs34lV8
 TrsI7imnzTQpKQbxVdXTTpT49mDaO2tkivIl/bx/PAeU8D//uhJFo3hO9afvCjZM2Bxi
 sxMmfZ6z1PVj1UTDUvrBzIVX4rYCDI148NUVleDzF8IpmeA9igjC9Kmrow7v2nmZuu0V
 8DtBn080fnL/ss1s9PQWME8XP+ugx3bnyFi6VQCJQCI3FtAQQcxd7Hu506FDLQAAuq9M
 /PsDrw4SAWSDfIFnsLXMSV75yoiEKIUkmnyQYaiW10LwyFs6x5LIWRyO3qQM0GPXf12P
 TkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4l5IN1Cyll7yznAYyy5s4ZQut9n46ETYfEZJFeYnMGw=;
 b=V1Zuy2OfkBOwqrB++VDkODhw5qJL1C9ZuDcvPgfMv4f5fZE9OlbhJy429pcOmm9Zvs
 oxGVvuhxuK/4EAgW4xklp1uPX3ihFYCWANceKHofJS4tt0plA+RrpYqqU4FGQgfZxd7I
 z6MZLgpB1hX2mlgSut2Hm89B2GPbB0N3xdDgLFHaAnuR6RsWmBIP+tufUF4MTTR+9re/
 oCu1D2HWauwP7YhS3dFtx/G83hgeud+kxCabxxeR5xGvSgXMJhN2Dk4b0ydMuVTmKNjI
 rAcKV6SZ8FqdkQOGHnShHsLdt94C2S1b2FZR52Xxx/j1wmQB+fkKsUgQkmg940EiUAPF
 gqBA==
X-Gm-Message-State: AOAM533v93Qw+IV4YFDxdZ4Pi/5KA/pcnM1lsBAODc+U/DERhpzkt9VI
 hrRIcH0HbWWcxL7AuSFTA8w=
X-Google-Smtp-Source: ABdhPJyJr73tQv4tl5NSa5CfCVYL//2P/Bh0KkB3oftZwnAo8seL/fhTwiJU8fGqgc2AOzX155BAiA==
X-Received: by 2002:ad4:57a1:: with SMTP id g1mr21703794qvx.27.1590537458788; 
 Tue, 26 May 2020 16:57:38 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id m94sm1084893qtd.29.2020.05.26.16.57.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 May 2020 16:57:37 -0700 (PDT)
Date: Tue, 26 May 2020 19:57:35 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 2/5] golang/xenlight: Get rid of GOPATH-based build
 artefacts
Message-ID: <20200526235735.GA2978@six>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-3-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526221612.900922-3-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
> index 8ab4cb5665..f8d8047524 100644
> --- a/tools/golang/xenlight/Makefile
> +++ b/tools/golang/xenlight/Makefile
> @@ -14,17 +14,8 @@ LIBXL_SRC_DIR = ../../libxl
>  .PHONY: all
>  all: build
>  
> -.PHONY: package
> -package: $(XEN_GOPATH)$(GOXL_PKG_DIR)
> -
>  GOXL_GEN_FILES = types.gen.go helpers.gen.go
>  
> -$(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go $(GOXL_GEN_FILES)
> -	$(INSTALL_DIR) $(XEN_GOPATH)$(GOXL_PKG_DIR)
> -	$(INSTALL_DATA) xenlight.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
> -	$(INSTALL_DATA) types.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
> -	$(INSTALL_DATA) helpers.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
> -

I think the GOXL_PKG_DIR variable can be removed all together too. With
these changes it's only used to initialize GOXL_INSTALL_DIR.

-NR

