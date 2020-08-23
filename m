Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C324EC9D
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mb3-0000Xc-5O; Sun, 23 Aug 2020 09:47:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ6o=CB=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1k9mb1-0000WW-PF
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:47:27 +0000
X-Inumbo-ID: 9b459455-d53e-463c-8e22-5211ba4fbcbd
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b459455-d53e-463c-8e22-5211ba4fbcbd;
 Sun, 23 Aug 2020 09:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 4A8CA4C17;
 Sun, 23 Aug 2020 11:47:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e8iaxit9eQA; Sun, 23 Aug 2020 11:47:24 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 550324BFF;
 Sun, 23 Aug 2020 11:47:24 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k9maw-00CJ7W-U1; Sun, 23 Aug 2020 11:47:22 +0200
Date: Sun, 23 Aug 2020 11:47:22 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 07/38] stubdom: add correct dependencies for Xen
 libraries
Message-ID: <20200823094722.o2o63bi2tb4vukqu@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200823093519.18386-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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

Juergen Gross, le dim. 23 août 2020 11:34:48 +0200, a ecrit:
> The stubdom Makefile is missing several dependencies between Xen
> libraries. Add them.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

In case another round of review is needed, perhaps you can just
factorize:

> @@ -387,6 +394,7 @@ $(TARGETS_MINIOS): mini-os-%:
>  
>  .PHONY: libxentoolcore
>  libxentoolcore: libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a
> +libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: $(LIBDEPS_toolcore)
>  libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
>  	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toolcore
>  
> @@ -396,6 +404,7 @@ libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH)
>  
>  .PHONY: libxentoollog
>  libxentoollog: libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a
> +libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: $(LIBDEPS_toollog)
>  libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
>  	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toollog

etc.
by iterating over LIBS_LIBS?  That'll make the maintenance easier.

Samuel

