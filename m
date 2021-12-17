Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6B478927
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 11:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248530.428675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAkE-00065R-Ie; Fri, 17 Dec 2021 10:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248530.428675; Fri, 17 Dec 2021 10:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAkE-00063d-FY; Fri, 17 Dec 2021 10:45:46 +0000
Received: by outflank-mailman (input) for mailman id 248530;
 Fri, 17 Dec 2021 10:45:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myAkC-00063X-Lx
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 10:45:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myAkB-0000qj-SH; Fri, 17 Dec 2021 10:45:43 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myAkB-0000Qa-ME; Fri, 17 Dec 2021 10:45:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZImgGO/brywYhb+ZeCGEPyjUyTuRi+12VbxmFZXUN9A=; b=loc0p02E0QjiX0dk44JFSW83ya
	wL/+Ydk0sdrep0AwETMVv+TfT5amyaTMp1bC1eF3fpnUzwqD7W6WwR61wqqp4Yg/KYLFA6WYtbko/
	eGUV1L+FG4MZ5/VvD+IPwacMKkqx50uROMYE+F9yYVqyjNQhcZRH7bl6TgCo9Z8Jho9k=;
Message-ID: <a7523051-267c-1ac5-e160-25f4d903420a@xen.org>
Date: Fri, 17 Dec 2021 10:45:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] tools/xenstore: drop support for running under SunOS
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20211217075059.14466-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211217075059.14466-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/12/2021 07:50, Juergen Gross wrote:
> Since several years now xenstored is no longer capable to run under
> SunOS, as the needed libxengnttab interfaces are not available there.
> 
> Several attempts to let the SunOS maintainers address this situation
> didn't change anything in this regard.
> 
> For those reasons drop SunOS support in xenstored by removing the SunOS
> specific code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   tools/xenstore/Makefile            |  15 +--
>   tools/xenstore/xenstored_core.c    |   7 --
>   tools/xenstore/xenstored_core.h    |   4 -
>   tools/xenstore/xenstored_minios.c  |   4 -
>   tools/xenstore/xenstored_posix.c   |   6 --
>   tools/xenstore/xenstored_probes.d  |  28 -----
>   tools/xenstore/xenstored_solaris.c | 168 -----------------------------
>   7 files changed, 1 insertion(+), 231 deletions(-)
>   delete mode 100644 tools/xenstore/xenstored_probes.d
>   delete mode 100644 tools/xenstore/xenstored_solaris.c
> 
> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
> index 292b478fa1..c86278fdb1 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -27,7 +27,6 @@ XENSTORED_OBJS += xenstored_transaction.o xenstored_control.o
>   XENSTORED_OBJS += xs_lib.o talloc.o utils.o tdb.o hashtable.o
>   
>   XENSTORED_OBJS_$(CONFIG_Linux) = xenstored_posix.o
> -XENSTORED_OBJS_$(CONFIG_SunOS) = xenstored_solaris.o xenstored_posix.o xenstored_probes.o
>   XENSTORED_OBJS_$(CONFIG_NetBSD) = xenstored_posix.o
>   XENSTORED_OBJS_$(CONFIG_FreeBSD) = xenstored_posix.o
>   XENSTORED_OBJS_$(CONFIG_MiniOS) = xenstored_minios.o
> @@ -50,18 +49,6 @@ all: $(ALL_TARGETS)
>   .PHONY: clients
>   clients: xenstore $(CLIENTS) xenstore-control
>   
> -ifeq ($(CONFIG_SunOS),y)
> -xenstored_probes.h: xenstored_probes.d
> -	dtrace -C -h -s xenstored_probes.d
> -
> -xenstored_solaris.o: xenstored_probes.h
> -
> -xenstored_probes.o: xenstored_solaris.o
> -	dtrace -C -G -s xenstored_probes.d xenstored_solaris.o
> -
> -CFLAGS += -DHAVE_DTRACE=1
> -endif
> -
>   ifeq ($(CONFIG_SYSTEMD),y)
>   $(XENSTORED_OBJS): CFLAGS += $(SYSTEMD_CFLAGS)
>   xenstored: LDFLAGS += $(SYSTEMD_LIBS)
> @@ -89,7 +76,7 @@ xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
>   
>   .PHONY: clean
>   clean:
> -	rm -f *.a *.o xenstored_probes.h
> +	rm -f *.a *.o
>   	rm -f xenstored
>   	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
>   	rm -f xenstore $(CLIENTS)
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 91d093a12e..c386ae6129 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -146,10 +146,6 @@ static void trace_io(const struct connection *conn,
>   	time_t now;
>   	struct tm *tm;
>   
> -#ifdef HAVE_DTRACE
> -	dtrace_io(conn, data, out);
> -#endif
> -
>   	if (tracefd < 0)
>   		return;
>   
> @@ -2337,9 +2333,6 @@ int main(int argc, char *argv[])
>   	/* Get ready to listen to the tools. */
>   	initialize_fds(&sock_pollfd_idx, &timeout);
>   
> -	/* Tell the kernel we're up and running. */
> -	xenbus_notify_running();
> -
>   #if defined(XEN_SYSTEMD_ENABLED)
>   	if (!live_update) {
>   		sd_notify(1, "READY=1");
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 07d861d924..190d2447cd 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -225,7 +225,6 @@ int delay_request(struct connection *conn, struct buffered_data *in,
>   void trace_create(const void *data, const char *type);
>   void trace_destroy(const void *data, const char *type);
>   void trace(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));
> -void dtrace_io(const struct connection *conn, const struct buffered_data *data, int out);
>   void reopen_log(void);
>   void close_log(void);
>   
> @@ -250,9 +249,6 @@ static inline int xenbus_master_domid(void) { return dom0_domid; }
>   /* Return the event channel used by xenbus. */
>   evtchn_port_t xenbus_evtchn(void);
>   
> -/* Tell the kernel xenstored is running. */
> -void xenbus_notify_running(void);
> -
>   /* Write out the pidfile */
>   void write_pidfile(const char *pidfile);
>   
> diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstore/xenstored_minios.c
> index c94493e52a..aa384e50c8 100644
> --- a/tools/xenstore/xenstored_minios.c
> +++ b/tools/xenstore/xenstored_minios.c
> @@ -38,10 +38,6 @@ void init_pipe(int reopen_log_pipe[2])
>   	reopen_log_pipe[1] = -1;
>   }
>   
> -void xenbus_notify_running(void)
> -{
> -}
> -
>   evtchn_port_t xenbus_evtchn(void)
>   {
>   	return dom0_event;
> diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstored_posix.c
> index 48c37ffe3e..b20504d1b6 100644
> --- a/tools/xenstore/xenstored_posix.c
> +++ b/tools/xenstore/xenstored_posix.c
> @@ -111,7 +111,6 @@ void unmap_xenbus(void *interface)
>   	munmap(interface, getpagesize());
>   }
>   
> -#ifndef __sun__
>   evtchn_port_t xenbus_evtchn(void)
>   {
>   	int fd;
> @@ -158,8 +157,3 @@ void *xenbus_map(void)
>   
>   	return addr;
>   }
> -
> -void xenbus_notify_running(void)
> -{
> -}
> -#endif /* !__sun__ */
> diff --git a/tools/xenstore/xenstored_probes.d b/tools/xenstore/xenstored_probes.d
> deleted file mode 100644
> index f72d38f935..0000000000
> --- a/tools/xenstore/xenstored_probes.d
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/*
> - * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
> - * Use is subject to license terms.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation, version 2 of the License.
> - */
> -
> -#include <sys/types.h>
> -
> -provider xenstore {
> -	/* tx id, dom id, pid, type, msg */
> -	probe msg(uint32_t, unsigned int, pid_t, int, const char *);
> -	/* tx id, dom id, pid, type, reply */
> -	probe reply(uint32_t, unsigned int, pid_t, int, const char *);
> -	/* tx id, dom id, pid, reply */
> -	probe error(uint32_t, unsigned int, pid_t, const char *);
> -	/* dom id, pid, watch details */
> -	probe watch_event(unsigned int, pid_t, const char *);
> -};
> -
> -#pragma D attributes Evolving/Evolving/Common provider xenstore provider
> -#pragma D attributes Private/Private/Unknown provider xenstore module
> -#pragma D attributes Private/Private/Unknown provider xenstore function
> -#pragma D attributes Evolving/Evolving/Common provider xenstore name
> -#pragma D attributes Evolving/Evolving/Common provider xenstore args
> -
> diff --git a/tools/xenstore/xenstored_solaris.c b/tools/xenstore/xenstored_solaris.c
> deleted file mode 100644
> index 06052d124a..0000000000
> --- a/tools/xenstore/xenstored_solaris.c
> +++ /dev/null
> @@ -1,168 +0,0 @@
> -/******************************************************************************
> - *
> - * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
> - * Use is subject to license terms.
> - *
> - * Copyright (C) 2005 Rusty Russell IBM Corporation
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation, version 2 of the
> - * License.
> - */
> -
> -#include <fcntl.h>
> -#include <unistd.h>
> -#include <stdlib.h>
> -#include <stdarg.h>
> -#include <sys/mman.h>
> -#include <strings.h>
> -#include <ucred.h>
> -#include <stdio.h>
> -
> -#include <xen/sys/xenbus.h>
> -
> -#include "talloc.h"
> -#include "xenstored_core.h"
> -#include "xenstored_probes.h"
> -
> -evtchn_port_t xenbus_evtchn(void)
> -{
> -	int fd;
> -	evtchn_port_t port;
> -
> -	fd = open("/dev/xen/xenbus", O_RDONLY);
> -	if (fd == -1)
> -		return -1;
> -
> -	port = ioctl(fd, IOCTL_XENBUS_XENSTORE_EVTCHN);
> -
> -	close(fd);
> -	return port;
> -}
> -
> -void *xenbus_map(void)
> -{
> -	int fd;
> -	void *addr;
> -
> -	fd = open("/dev/xen/xenbus", O_RDWR);
> -	if (fd == -1)
> -		return NULL;
> -
> -	addr = mmap(NULL, getpagesize(), PROT_READ|PROT_WRITE,
> -		MAP_SHARED, fd, 0);
> -
> -	if (addr == MAP_FAILED)
> -		addr = NULL;
> -
> -	close(fd);
> -
> -	return addr;
> -}
> -
> -void xenbus_notify_running(void)
> -{
> -	int fd;
> -
> -	fd = open("/dev/xen/xenbus", O_RDONLY);
> -
> -	(void) ioctl(fd, IOCTL_XENBUS_NOTIFY_UP);
> -
> -	close(fd);
> -}
> -
> -static pid_t cred(const struct connection *conn)
> -{
> -	ucred_t *ucred = NULL;
> -	pid_t pid;
> -
> -	if (conn->domain)
> -		return (0);
> -
> -	if (getpeerucred(conn->fd, &ucred) == -1)
> -		return (0);
> -
> -	pid = ucred_getpid(ucred);
> -
> -	ucred_free(ucred);
> -	return (pid);
> -}
> -
> -/*
> - * The strings are often a number of nil-separated strings. We'll just
> - * replace the separators with spaces - not quite right, but good
> - * enough.
> - */
> -static char *
> -mangle(const struct connection *conn, const struct buffered_data *in)
> -{
> -	char *str;
> -	int i;
> -
> -	if (in->hdr.msg.len == 0)
> -		return (talloc_strdup(conn, ""));
> -
> -	if ((str = talloc_zero_size(conn, in->hdr.msg.len + 1)) == NULL)
> -		return (NULL);
> -
> -	memcpy(str, in->buffer, in->hdr.msg.len);
> -	
> -	/*
> -	 * The protocol is absurdly inconsistent in whether the length
> -	 * includes the terminating nil or not; replace all nils that
> -	 * aren't the last one.
> -	 */
> -	for (i = 0; i < (in->hdr.msg.len - 1); i++) {
> -		if (str[i] == '\0')
> -			str[i] = ' ';
> -	}
> -
> -	return (str);
> -}
> -
> -void
> -dtrace_io(const struct connection *conn, const struct buffered_data *in,
> -    int io_out)
> -{
> -	if (!io_out) {
> -		if (XENSTORE_MSG_ENABLED()) {
> -			char *mangled = mangle(conn, in);
> -			XENSTORE_MSG(in->hdr.msg.tx_id, conn->id, cred(conn),
> -			    in->hdr.msg.type, mangled);
> -		}
> -
> -		goto out;
> -	}
> -
> -	switch (in->hdr.msg.type) {
> -	case XS_ERROR:
> -		if (XENSTORE_ERROR_ENABLED()) {
> -			char *mangled = mangle(conn, in);
> -			XENSTORE_ERROR(in->hdr.msg.tx_id, conn->id,
> -			    cred(conn), mangled);
> -		}
> -		break;
> -
> -	case XS_WATCH_EVENT:
> -		if (XENSTORE_WATCH_EVENT_ENABLED()) {
> -			char *mangled = mangle(conn, in);
> -			XENSTORE_WATCH_EVENT(conn->id, cred(conn), mangled);
> -		}
> -		break;
> -
> -	default:
> -		if (XENSTORE_REPLY_ENABLED()) {
> -			char *mangled = mangle(conn, in);
> -			XENSTORE_REPLY(in->hdr.msg.tx_id, conn->id, cred(conn),
> -			    in->hdr.msg.type, mangled);
> -		}
> -		break;
> -	}
> -
> -out:
> -	/*
> -	 * 6589130 dtrace -G fails for certain tail-calls on x86
> -	 */
> -	asm("nop");
> -}

-- 
Julien Grall

