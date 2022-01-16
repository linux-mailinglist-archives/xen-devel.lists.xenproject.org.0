Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CC48FEE8
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257963.443673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CXs-0003Yo-Dm; Sun, 16 Jan 2022 20:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257963.443673; Sun, 16 Jan 2022 20:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CXs-0003Wt-Aq; Sun, 16 Jan 2022 20:54:36 +0000
Received: by outflank-mailman (input) for mailman id 257963;
 Sun, 16 Jan 2022 20:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CXq-0003Up-AH
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:54:34 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 812140a0-770e-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 21:54:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id BCA3018A;
 Sun, 16 Jan 2022 21:54:31 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJEEp-MXQuam; Sun, 16 Jan 2022 21:54:31 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id DC1F98B;
 Sun, 16 Jan 2022 21:54:30 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CXm-005ueK-6L;
 Sun, 16 Jan 2022 21:54:30 +0100
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
X-Inumbo-ID: 812140a0-770e-11ec-9bbc-9dff3e4ee8c5
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:54:30 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 03/12] use alloc_file_type() and
 get_file_from_fd() in xs
Message-ID: <20220116205430.k6xc6migl4c5iwcy@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220116083328.26524-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: BCA3018A
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

Juergen Gross, le dim. 16 janv. 2022 09:33:19 +0100, a ecrit:
> Allocate the needed file type via alloc_file_type().
> 
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - switch to struct file * parameter for callbacks
> - use __attribute__((constructor))
> ---
>  include/lib.h   |  3 +--
>  lib/sys.c       | 18 --------------
>  lib/xs.c        | 65 +++++++++++++++++++++++++++++++++++++------------
>  xenbus/xenbus.c |  1 +
>  4 files changed, 52 insertions(+), 35 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 5838b0d4..c5e47786 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -169,8 +169,7 @@ extern struct wait_queue_head event_queue;
>  #define FTYPE_BLK        9
>  #define FTYPE_TPMFRONT  10
>  #define FTYPE_TPM_TIS   11
> -#define FTYPE_XENBUS    12
> -#define FTYPE_N         13
> +#define FTYPE_N         12
>  #define FTYPE_SPARE     16
>  
>  struct file {
> diff --git a/lib/sys.c b/lib/sys.c
> index 6ba26294..53870aa4 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -523,11 +523,6 @@ int close(int fd)
>      switch (file->type) {
>          default:
>              break;
> -#ifdef CONFIG_LIBXS
> -	case FTYPE_XENBUS:
> -            xs_daemon_close((void*)(intptr_t) fd);
> -            break;
> -#endif
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
>              res = lwip_close(files[fd].fd);
> @@ -759,7 +754,6 @@ int closedir(DIR *dir)
>  static const char *const file_types[] = {
>      [FTYPE_NONE]    = "none",
>      [FTYPE_CONSOLE] = "console",
> -    [FTYPE_XENBUS]  = "xenbus",
>      [FTYPE_SOCKET]  = "socket",
>      [FTYPE_TAP]     = "net",
>      [FTYPE_BLK]     = "blk",
> @@ -947,18 +941,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>                  n++;
>  	    FD_CLR(i, exceptfds);
>  	    break;
> -#ifdef CONFIG_LIBXS
> -	case FTYPE_XENBUS:
> -	    if (FD_ISSET(i, readfds)) {
> -                if (files[i].dev)
> -		    n++;
> -		else
> -		    FD_CLR(i, readfds);
> -	    }
> -	    FD_CLR(i, writefds);
> -	    FD_CLR(i, exceptfds);
> -	    break;
> -#endif
>  	case FTYPE_TAP:
>  	case FTYPE_BLK:
>  	case FTYPE_KBD:
> diff --git a/lib/xs.c b/lib/xs.c
> index 4af0f960..c12341aa 100644
> --- a/lib/xs.c
> +++ b/lib/xs.c
> @@ -18,23 +18,56 @@ static inline int _xs_fileno(struct xs_handle *h) {
>      return (intptr_t) h;
>  }
>  
> +static int xs_close_fd(struct file *file)
> +{
> +    struct xenbus_event *event, *next;
> +
> +    for (event = file->dev; event; event = next)
> +    {
> +        next = event->next;
> +        free(event);
> +    }
> +
> +    return 0;
> +}
> +
> +static bool xs_can_read(struct file *file)
> +{
> +    return file && file->dev;
> +}
> +
> +static const struct file_ops xenbus_ops = {
> +    .name = "xenbus",
> +    .close = xs_close_fd,
> +    .select_rd = xs_can_read,
> +};
> +
> +static unsigned int ftype_xenbus;
> +
> +__attribute__((constructor))
> +static void xs_initialize(void)
> +{
> +    ftype_xenbus = alloc_file_type(&xenbus_ops);
> +}
> +
>  struct xs_handle *xs_daemon_open()
>  {
> -    int fd = alloc_fd(FTYPE_XENBUS);
> -    files[fd].dev = NULL;
> -    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].dev);
> +    int fd;
> +    struct file *file;
> +
> +    fd = alloc_fd(ftype_xenbus);
> +    file = get_file_from_fd(fd);
> +    if ( !file )
> +        return NULL;
> +
> +    file->dev = NULL;
> +    printk("xs_daemon_open -> %d, %p\n", fd, &file->dev);
>      return (void*)(intptr_t) fd;
>  }
>  
>  void xs_daemon_close(struct xs_handle *h)
>  {
> -    int fd = _xs_fileno(h);
> -    struct xenbus_event *event, *next;
> -    for (event = files[fd].dev; event; event = next)
> -    {
> -        next = event->next;
> -        free(event);
> -    }
> +    close(_xs_fileno(h));
>  }
>  
>  int xs_fileno(struct xs_handle *h)
> @@ -169,18 +202,20 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
>  
>  bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>  {
> -    int fd = _xs_fileno(h);
> +    struct file *file = get_file_from_fd(_xs_fileno(h));
> +
>      printk("xs_watch(%s, %s)\n", path, token);
>      return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
> -                   (xenbus_event_queue *)&files[fd].dev));
> +                   (xenbus_event_queue *)&file->dev));
>  }
>  
>  char **xs_read_watch(struct xs_handle *h, unsigned int *num)
>  {
> -    int fd = _xs_fileno(h);
>      struct xenbus_event *event;
> -    event = files[fd].dev;
> -    files[fd].dev = event->next;
> +    struct file *file = get_file_from_fd(_xs_fileno(h));
> +
> +    event = file->dev;
> +    file->dev = event->next;
>      printk("xs_read_watch() -> %s %s\n", event->path, event->token);
>      *num = 2;
>      return (char **) &event->path;
> diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> index b687678f..785389fb 100644
> --- a/xenbus/xenbus.c
> +++ b/xenbus/xenbus.c
> @@ -393,6 +393,7 @@ static int allocate_xenbus_id(void)
>  void init_xenbus(void)
>  {
>      int err;
> +
>      DEBUG("init_xenbus called.\n");
>      create_thread("xenstore", xenbus_thread_func, NULL);
>      DEBUG("buf at %p.\n", xenstore_buf);
> -- 
> 2.26.2
> 

-- 
Samuel
 RR> Ce que je cherche à démontrer, c'est qu'il est injuste de faire
 RR> l'amalgame entre du bulk mail et du courrier non-solicité très ciblé
 un suppositoire non reclamé, meme tres bien ciblé, reste un suppositoire.
 -+-OS in : Guide du Neuneu d'Usenet - Plein le cul de la pub à neuneu -+-

