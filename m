Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D809477B21
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248166.428045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuye-0003eQ-1Q; Thu, 16 Dec 2021 17:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248166.428045; Thu, 16 Dec 2021 17:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuyd-0003cL-UJ; Thu, 16 Dec 2021 17:55:35 +0000
Received: by outflank-mailman (input) for mailman id 248166;
 Thu, 16 Dec 2021 17:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxuyd-0003cF-4v
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:55:35 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c84aafd-5e99-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 18:55:32 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47118)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxuyY-000ERh-oO (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 17:55:30 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5F3281FAC8;
 Thu, 16 Dec 2021 17:55:30 +0000 (GMT)
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
X-Inumbo-ID: 5c84aafd-5e99-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ec048161-a117-36cf-b84f-e537a300d35b@srcf.net>
Date: Thu, 16 Dec 2021 17:55:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-25-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [XEN PATCH 24/57] tools/debugger/gdbsx: Fix and cleanup makefiles
In-Reply-To: <20211206170241.13165-25-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> diff --git a/tools/debugger/gdbsx/Makefile b/tools/debugger/gdbsx/Makefile
> index 8d7cd94a31..4aaf427c45 100644
> --- a/tools/debugger/gdbsx/Makefile
> +++ b/tools/debugger/gdbsx/Makefile
> @@ -28,7 +28,7 @@ uninstall:
>  gdbsx: gx/gx_all.a xg/xg_all.a 
>  	$(CC) $(LDFLAGS) -o $@ $^
>  
> -xg/xg_all.a:
> +xg/xg_all.a: FORCE
>  	$(MAKE) -C xg
> -gx/gx_all.a:
> +gx/gx_all.a: FORCE
>  	$(MAKE) -C gx

Shouldn't these be in the sub Make's ?

> diff --git a/tools/debugger/gdbsx/gx/Makefile b/tools/debugger/gdbsx/gx/Makefile
> index 3b8467f799..ff5c8e9e6e 100644
> --- a/tools/debugger/gdbsx/gx/Makefile
> +++ b/tools/debugger/gdbsx/gx/Makefile
> @@ -2,21 +2,20 @@ XEN_ROOT = $(CURDIR)/../../../..
>  include ../Rules.mk
>  
>  GX_OBJS := gx_comm.o gx_main.o gx_utils.o gx_local.o
> -GX_HDRS := $(wildcard *.h)
> +
> +TARGETS := gx_all.a
>  
>  .PHONY: all
> -all: gx_all.a
> +all: $(TARGETS)
>  
>  .PHONY: clean
>  clean:
> -	rm -rf gx_all.a *.o .*.d
> +	rm -f *.o $(TARGETS) $(DEPS_RM)

$(RM)

>  
>  .PHONY: distclean
>  distclean: clean
>  
> -#%.o: %.c $(GX_HDRS) Makefile
> -#	$(CC) -c $(CFLAGS) -o $@ $<
> -
> -gx_all.a: $(GX_OBJS) Makefile $(GX_HDRS)
> -	ar cr $@ $(GX_OBJS)        # problem with ld using -m32 
> +gx_all.a: $(GX_OBJS) Makefile
> +	ar cr $@ $(GX_OBJS)

There's probably an $(AR) we ought to be using.

~Andrew

