Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFED488747
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255026.437068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N4Q-0001qV-Eq; Sun, 09 Jan 2022 01:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255026.437068; Sun, 09 Jan 2022 01:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N4Q-0001pI-AK; Sun, 09 Jan 2022 01:32:30 +0000
Received: by outflank-mailman (input) for mailman id 255026;
 Sun, 09 Jan 2022 01:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N4O-0001mv-M8
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:32:28 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 009b7c19-70ec-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:32:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 391E4368;
 Sun,  9 Jan 2022 02:32:26 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3vO7bERRuhm; Sun,  9 Jan 2022 02:32:25 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 538DA283;
 Sun,  9 Jan 2022 02:32:25 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N4K-006iUf-LB;
 Sun, 09 Jan 2022 02:32:24 +0100
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
X-Inumbo-ID: 009b7c19-70ec-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:32:24 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 14/15] mini-os: eliminate xenbus union member in struct
 file
Message-ID: <20220109013224.c4nv77dayhlg3z5o@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-15-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-15-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 391E4368
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le jeu. 06 janv. 2022 12:57:40 +0100, a ecrit:
> Replace the xenbus specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h |  7 -------
>  lib/sys.c     |  2 +-
>  lib/xs.c      | 13 +++++++------
>  3 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index d6a29ba..91364ba 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -193,13 +193,6 @@ struct file {
>  	    struct evtchn_port_list ports;
>  	} evtchn;
>  	struct gntmap gntmap;
> -#ifdef CONFIG_XENBUS
> -        struct {
> -            /* To each xenbus FD is associated a queue of watch events for this
> -             * FD.  */
> -            xenbus_event_queue events;
> -        } xenbus;
> -#endif
>      };
>  };
>  
> diff --git a/lib/sys.c b/lib/sys.c
> index 96fc769..6f2b026 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -776,7 +776,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  #ifdef CONFIG_XENBUS
>  	case FTYPE_XENBUS:
>  	    if (FD_ISSET(i, readfds)) {
> -                if (files[i].xenbus.events)
> +                if (files[i].dev)
>  		    n++;
>  		else
>  		    FD_CLR(i, readfds);
> diff --git a/lib/xs.c b/lib/xs.c
> index 324bd05..0459f52 100644
> --- a/lib/xs.c
> +++ b/lib/xs.c
> @@ -21,8 +21,8 @@ static inline int _xs_fileno(struct xs_handle *h) {
>  struct xs_handle *xs_daemon_open()
>  {
>      int fd = alloc_fd(FTYPE_XENBUS);
> -    files[fd].xenbus.events = NULL;
> -    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].xenbus.events);
> +    files[fd].dev = NULL;
> +    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].dev);
>      return (void*)(intptr_t) fd;
>  }
>  
> @@ -30,7 +30,7 @@ void xs_daemon_close(struct xs_handle *h)
>  {
>      int fd = _xs_fileno(h);
>      struct xenbus_event *event, *next;
> -    for (event = files[fd].xenbus.events; event; event = next)
> +    for (event = files[fd].dev; event; event = next)
>      {
>          next = event->next;
>          free(event);
> @@ -172,15 +172,16 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>  {
>      int fd = _xs_fileno(h);
>      printk("xs_watch(%s, %s)\n", path, token);
> -    return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token, &files[fd].xenbus.events));
> +    return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
> +                   (xenbus_event_queue *)&files[fd].dev));
>  }
>  
>  char **xs_read_watch(struct xs_handle *h, unsigned int *num)
>  {
>      int fd = _xs_fileno(h);
>      struct xenbus_event *event;
> -    event = files[fd].xenbus.events;
> -    files[fd].xenbus.events = event->next;
> +    event = files[fd].dev;
> +    files[fd].dev = event->next;
>      printk("xs_read_watch() -> %s %s\n", event->path, event->token);
>      *num = 2;
>      return (char **) &event->path;
> -- 
> 2.26.2
> 

-- 
Samuel
"I don't know why, but first C programs tend to look a lot worse than
first programs in any other language (maybe except for fortran, but then
I suspect all fortran programs look like `firsts')"
(By Olaf Kirch)

