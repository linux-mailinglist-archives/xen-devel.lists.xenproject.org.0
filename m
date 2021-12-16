Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3EE477B99
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 19:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248188.428100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvaF-0002UQ-3Q; Thu, 16 Dec 2021 18:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248188.428100; Thu, 16 Dec 2021 18:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvaF-0002Sc-0I; Thu, 16 Dec 2021 18:34:27 +0000
Received: by outflank-mailman (input) for mailman id 248188;
 Thu, 16 Dec 2021 18:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxvaD-0002ST-L2
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 18:34:25 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c95be621-5e9e-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 19:34:23 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43986)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxva9-000Bqy-i4 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 18:34:21 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2B2201FB86;
 Thu, 16 Dec 2021 18:34:21 +0000 (GMT)
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
X-Inumbo-ID: c95be621-5e9e-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <42048d21-c02e-9fea-b228-7ffc60009be9@srcf.net>
Date: Thu, 16 Dec 2021 18:34:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-37-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [XEN PATCH 36/57] tools/xenstore: Cleanup makefile
In-Reply-To: <20211206170241.13165-37-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> Regroup *FLAGS together, use $(LDLIBS).
>
> Remove $(LDLIBS_xenstored) which was the wrong name name as it doesn't
> decribe how to link to a potential libxenstored.so, instead add the
> value to $(LDLIBS) of xenstored.
>
> Add SYSTEMD_LIBS into $(LDLIBS) instead of $(LDFLAGS).
>
> Remove the "-I." from $(CFLAGS), it shouldn't be needed.
>
> Removed $(CFLAGS-y) and $(LDFLAGS-y). $(CFLAGS-y) is already included
> in $(CFLAGS) and both aren't used anyway.
>
> Rename ALL_TARGETS to TARGETS.
> Only add programmes we want to build in $(TARGETS), not phony-targets
> (replace "clients").
>
> Store all `xenstored` objs into $(XENSTORED_OBJS-y).
>
> Replace one $< by $^ even if there's only one dependency,
> (xenstore-control).
>
> clean: "init-xenstore-domain" isn't built here, so stop trying to
> remove it, remove $(TARGETS).
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/xenstore/Makefile | 81 ++++++++++++++++++++++-------------------
>  1 file changed, 44 insertions(+), 37 deletions(-)
>
> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
> index 292b478fa1..7fe1d9c1e2 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -5,7 +5,6 @@ MAJOR = 3.0
>  MINOR = 3

Actually, shouldn't this MAJOR/MINOR be dropped now that libxenstore
moved to tools/libs ?

It's definitely wrong now, seeing as we bumped to 4.0 for Xen 4.16.

>  
>  CFLAGS += -Werror
> -CFLAGS += -I.
>  # Include configure output (config.h)
>  CFLAGS += -include $(XEN_ROOT)/tools/config.h
>  CFLAGS += -I./include
> @@ -16,36 +15,53 @@ CFLAGS += $(CFLAGS_libxentoolcore)
>  CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
>  CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
>  
> -CFLAGS  += $(CFLAGS-y)
> -LDFLAGS += $(LDFLAGS-y)
> +ifdef CONFIG_STUBDOM
> +CFLAGS += -DNO_SOCKETS=1
> +endif
>  
> -CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmod
> -CLIENTS += xenstore-write xenstore-ls xenstore-watch
> +XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
> +XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
> +XENSTORED_OBJS-y += xs_lib.o talloc.o utils.o tdb.o hashtable.o
>  
> -XENSTORED_OBJS = xenstored_core.o xenstored_watch.o xenstored_domain.o
> -XENSTORED_OBJS += xenstored_transaction.o xenstored_control.o
> -XENSTORED_OBJS += xs_lib.o talloc.o utils.o tdb.o hashtable.o
> +XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
> +XENSTORED_OBJS-$(CONFIG_SunOS) += xenstored_solaris.o xenstored_posix.o xenstored_probes.o
> +XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
> +XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
> +XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
>  
> -XENSTORED_OBJS_$(CONFIG_Linux) = xenstored_posix.o
> -XENSTORED_OBJS_$(CONFIG_SunOS) = xenstored_solaris.o xenstored_posix.o xenstored_probes.o
> -XENSTORED_OBJS_$(CONFIG_NetBSD) = xenstored_posix.o
> -XENSTORED_OBJS_$(CONFIG_FreeBSD) = xenstored_posix.o
> -XENSTORED_OBJS_$(CONFIG_MiniOS) = xenstored_minios.o
> +$(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
>  
> -XENSTORED_OBJS += $(XENSTORED_OBJS_y)
> -LDLIBS_xenstored += -lrt
> +xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
> +xenstored: LDLIBS += $(LDLIBS_libxengnttab)
> +xenstored: LDLIBS += $(LDLIBS_libxenctrl)
> +xenstored: LDLIBS += -lrt
> +xenstored: LDLIBS += $(SOCKET_LIBS)
>  
> -ALL_TARGETS = clients
> -ifeq ($(XENSTORE_XENSTORED),y)
> -ALL_TARGETS += xs_tdb_dump xenstored
> +ifeq ($(CONFIG_SYSTEMD),y)
> +$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
> +xenstored: LDLIBS += $(SYSTEMD_LIBS)
>  endif
>  
> -ifdef CONFIG_STUBDOM
> -CFLAGS += -DNO_SOCKETS=1
> +xenstore: LDLIBS += $(LDLIBS_libxenstore)
> +xenstore: LDLIBS += $(LDLIBS_libxentoolcore)
> +xenstore: LDLIBS += $(SOCKET_LIBS)
> +
> +xenstore-control: LDLIBS += $(LDLIBS_libxenstore)
> +xenstore-control: LDLIBS += $(LDLIBS_libxenctrl)
> +xenstore-control: LDLIBS += $(LDLIBS_libxenguest)
> +xenstore-control: LDLIBS += $(LDLIBS_libxentoolcore)
> +xenstore-control: LDLIBS += $(SOCKET_LIBS)
> +
> +CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmod
> +CLIENTS += xenstore-write xenstore-ls xenstore-watch
> +
> +TARGETS := xenstore $(CLIENTS) xenstore-control
> +ifeq ($(XENSTORE_XENSTORED),y)
> +TARGETS += xs_tdb_dump xenstored
>  endif
>  
>  .PHONY: all
> -all: $(ALL_TARGETS)
> +all: $(TARGETS)
>  
>  .PHONY: clients
>  clients: xenstore $(CLIENTS) xenstore-control
> @@ -62,37 +78,28 @@ xenstored_probes.o: xenstored_solaris.o

Urgh - there's a mess in here.

the `dtrace` line has trailing whitespace, but xenstored_probes.d is
going to be clobbered by the dependency file logic.

Given this is utterly broken, perhaps better to drop the CONFIG_SunOS
chunk entirely?

>  CFLAGS += -DHAVE_DTRACE=1
>  endif
>  
> -ifeq ($(CONFIG_SYSTEMD),y)
> -$(XENSTORED_OBJS): CFLAGS += $(SYSTEMD_CFLAGS)
> -xenstored: LDFLAGS += $(SYSTEMD_LIBS)
> -endif
> -
> -$(XENSTORED_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
> -
> -xenstored: $(XENSTORED_OBJS)
> -	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
> +xenstored: $(XENSTORED_OBJS-y)
> +	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
>  
> -xenstored.a: $(XENSTORED_OBJS)
> +xenstored.a: $(XENSTORED_OBJS-y)
>  	$(AR) cr $@ $^
>  
>  $(CLIENTS): xenstore
>  	ln -f xenstore $@
>  
>  xenstore: xenstore_client.o xs_lib.o
> -	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
> +	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
>  
>  xenstore-control: xenstore_control.o
> -	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
> +	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
>  
>  xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
> -	$(CC) $^ $(LDFLAGS) -o $@ $(APPEND_LDFLAGS)
> +	$(CC) $(LDFLAGS) $^ -o $@ $(APPEND_LDFLAGS)
>  
>  .PHONY: clean
>  clean:
>  	rm -f *.a *.o xenstored_probes.h

This header file looks wonky to be cleaning.

> -	rm -f xenstored
> -	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
> -	rm -f xenstore $(CLIENTS)
> +	rm -f $(TARGETS)
>  	$(RM) $(DEPS_RM)
>  
>  .PHONY: distclean

There is some abuse lower down too.  Another local TAGS, but also a
tarball rule too, and we probably don't want to be using .SECONDARY:
right at the bottom.

~Andrew

