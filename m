Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89F477BA2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 19:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248192.428110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvby-00035N-Ee; Thu, 16 Dec 2021 18:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248192.428110; Thu, 16 Dec 2021 18:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvby-00032s-Ba; Thu, 16 Dec 2021 18:36:14 +0000
Received: by outflank-mailman (input) for mailman id 248192;
 Thu, 16 Dec 2021 18:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxvbw-00032k-TC
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 18:36:12 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0927451b-5e9f-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 19:36:10 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47134)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxvbs-000SVO-n7 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 18:36:08 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DACF61FAC8;
 Thu, 16 Dec 2021 18:36:07 +0000 (GMT)
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
X-Inumbo-ID: 0927451b-5e9f-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1f7e6887-a1ef-ec08-6bbf-fa6ca3e83259@srcf.net>
Date: Thu, 16 Dec 2021 18:36:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 37/57] tools/xentop: rework makefile
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-38-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-38-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> diff --git a/tools/xentop/Makefile b/tools/xentop/Makefile
> index 0034114684..1e52b29b37 100644
> --- a/tools/xentop/Makefile
> +++ b/tools/xentop/Makefile
> @@ -13,24 +13,23 @@
>  XEN_ROOT=$(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -ifneq ($(XENSTAT_XENTOP),y)
> -.PHONY: all install xentop uninstall
> -all install xentop uninstall:
> -else
> -
>  CFLAGS += -DGCC_PRINTF -Werror $(CFLAGS_libxenstat)
>  LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
>  CFLAGS += -DHOST_$(XEN_OS)
>  
>  # Include configure output (config.h)
>  CFLAGS += -include $(XEN_ROOT)/tools/config.h
> -LDFLAGS += $(APPEND_LDFLAGS)
> +
> +TARGETS := xentop
>  
>  .PHONY: all
> -all: xentop
> +all: $(TARGETS)
> +
> +xentop: xentop.o
> +	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
>  
>  .PHONY: install
> -install: xentop
> +install: all
>  	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
>  	$(INSTALL_PROG) xentop $(DESTDIR)$(sbindir)/xentop

$(TARGETS) ?

>  
> @@ -38,11 +37,9 @@ install: xentop
>  uninstall:
>  	rm -f $(DESTDIR)$(sbindir)/xentop
>  
> -endif
> -
>  .PHONY: clean
>  clean:
> -	rm -f xentop xentop.o $(DEPS_RM)
> +	rm -f $(TARGETS) xentop.o $(DEPS_RM)

$(RM) *.o ?

~Andrew

>  
>  .PHONY: distclean
>  distclean: clean


