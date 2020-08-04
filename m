Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7523BBDD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xkC-00048E-SW; Tue, 04 Aug 2020 14:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3j1i=BO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k2xkB-000489-Sz
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:16:43 +0000
X-Inumbo-ID: ffc58760-1966-421c-a441-c030c16ff223
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffc58760-1966-421c-a441-c030c16ff223;
 Tue, 04 Aug 2020 14:16:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g8so2841201wmk.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 07:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k1GAM4yGJRVX+IjsFYQxKWWU3oYsEc17L61GHIF+wPc=;
 b=dzqdjaIaVukJ9mEf3FISK6L68tFyRT77cE9cvzWKRIqkuf+7rbRgFvZltA6a+zxCeM
 /SGHAmL+TSbEWnMF8tWJe1Rw9mzaEhHboZA7m8/95RMtw5pLlQpVAvcC53YNPrt6qARJ
 K1aV9UP3Rosanm7e2yPOnPubZk/vLjBKcGlDsplA99lwe9HvcRmACIFgh960DRDLVZSG
 IH3O52EUZNxbI7x1hw7QeIPDiy+vOYLrIazRJ0Wquv31vcQFqWxdHkpTjG6zxF1AjdZt
 w8dIdyRGVGaScq8FJWlcgOj0LoO2m/Uv0pysed2bs7rcuJ87vFDP8440DTU+UE8lJDwQ
 3QhA==
X-Gm-Message-State: AOAM530CfjGVHksy1Kg50Am7JREVqjAXJeNWv8crZEJM8RgnJAsBhcuR
 km66dZetJwkmiwpVFvLjISY=
X-Google-Smtp-Source: ABdhPJwpr7tdJnbqlY4UQNBXiNrVbK4mSkw2DiB9ytf+3KXHekG/PpYkiWxNsQqWzjLgBuaSa7yvcw==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr4189443wmg.148.1596550602310; 
 Tue, 04 Aug 2020 07:16:42 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c14sm30601284wrw.85.2020.08.04.07.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 07:16:41 -0700 (PDT)
Date: Tue, 4 Aug 2020 14:16:39 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Message-ID: <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
> While this doesn't address the real problem I've run into (attempting to
> update r/o source files), not recursing into tools/golang/xenlight/ is
> enough to fix the build for me for the moment. I don't currently see why
> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
> it necessary to invoke this build step unconditionally.
> 

Perhaps an oversight?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

> ---
> I'm also having trouble to see why, besides the idl-gen target in
> tools/golang/xenlight/Makefile, the commit also adds such a target to
> (and mentions it in [only] a comment in) tools/libxl/Makefile.
> 
> --- a/tools/libxl/Makefile
> +++ b/tools/libxl/Makefile
> @@ -282,7 +282,9 @@ _libxl_type%.h _libxl_type%_json.h _libx
>  # about races with tools/golang/xenlight/Makefile:all
>  .PHONY: idl-external
>  idl-external:
> +ifeq ($(CONFIG_GOLANG),y)
>  	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen
> +endif
>  
>  LIBXL_IDLGEN_FILES = _libxl_types.h _libxl_types_json.h _libxl_types_private.h _libxl_types.c \
>  	_libxl_types_internal.h _libxl_types_internal_json.h _libxl_types_internal_private.h _libxl_types_internal.c

