Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47A48B7E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256073.439237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NUd-0004KX-Fx; Tue, 11 Jan 2022 20:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256073.439237; Tue, 11 Jan 2022 20:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NUd-0004Ic-CN; Tue, 11 Jan 2022 20:11:43 +0000
Received: by outflank-mailman (input) for mailman id 256073;
 Tue, 11 Jan 2022 20:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7NUb-0004GU-Cf
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:11:41 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7f0431-731a-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:11:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0DE81678;
 Tue, 11 Jan 2022 21:11:39 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USutWDA51RWx; Tue, 11 Jan 2022 21:11:37 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 9345A261;
 Tue, 11 Jan 2022 21:11:37 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7NUW-00FFQS-TL;
 Tue, 11 Jan 2022 21:11:36 +0100
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
X-Inumbo-ID: af7f0431-731a-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:11:36 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH v2 03/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in xs
Message-ID: <20220111201136.yqp274wyqju5zshs@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-4-jgross@suse.com>
 <20220111200615.b5tpi4faz3cak2ft@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111200615.b5tpi4faz3cak2ft@begin>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0DE81678
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

Samuel Thibault, le mar. 11 janv. 2022 21:06:15 +0100, a ecrit:
> Juergen Gross, le mar. 11 janv. 2022 16:12:06 +0100, a ecrit:
> > Allocate the needed file type via alloc_file_type().
> > 
> > Instead of directly accessing the files[] array use get_file_from_fd().
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> > ---
> >  include/lib.h   |  3 +--
> >  lib/sys.c       | 18 --------------
> >  lib/xs.c        | 64 +++++++++++++++++++++++++++++++++++++------------
> >  xenbus/xenbus.c |  1 +
> >  4 files changed, 51 insertions(+), 35 deletions(-)
> > 
> > diff --git a/include/lib.h b/include/lib.h
> > index 283abb8..05c7de5 100644
> > --- a/include/lib.h
> > +++ b/include/lib.h
> > @@ -167,8 +167,7 @@ void sanity_check(void);
> >  #define FTYPE_BLK        9
> >  #define FTYPE_TPMFRONT  10
> >  #define FTYPE_TPM_TIS   11
> > -#define FTYPE_XENBUS    12
> > -#define FTYPE_N         13
> > +#define FTYPE_N         12
> >  #define FTYPE_SPARE     16
> >  
> >  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> > diff --git a/lib/sys.c b/lib/sys.c
> > index 9540410..d213ae5 100644
> > --- a/lib/sys.c
> > +++ b/lib/sys.c
> > @@ -495,11 +495,6 @@ int close(int fd)
> >      switch (files[fd].type) {
> >          default:
> >              break;
> > -#ifdef CONFIG_XENBUS
> > -	case FTYPE_XENBUS:
> > -            xs_daemon_close((void*)(intptr_t) fd);
> > -            break;
> > -#endif
> >  #ifdef HAVE_LWIP
> >  	case FTYPE_SOCKET:
> >  	    res = lwip_close(files[fd].fd);
> > @@ -712,7 +707,6 @@ int closedir(DIR *dir)
> >  static const char *file_types[] = {
> >      [FTYPE_NONE]    = "none",
> >      [FTYPE_CONSOLE] = "console",
> > -    [FTYPE_XENBUS]  = "xenbus",
> >      [FTYPE_SOCKET]  = "socket",
> >      [FTYPE_TAP]     = "net",
> >      [FTYPE_BLK]     = "blk",
> > @@ -892,18 +886,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
> >                  n++;
> >  	    FD_CLR(i, exceptfds);
> >  	    break;
> > -#ifdef CONFIG_XENBUS
> > -	case FTYPE_XENBUS:
> > -	    if (FD_ISSET(i, readfds)) {
> > -                if (files[i].dev)
> > -		    n++;
> > -		else
> > -		    FD_CLR(i, readfds);
> > -	    }
> > -	    FD_CLR(i, writefds);
> > -	    FD_CLR(i, exceptfds);
> > -	    break;
> > -#endif
> >  	case FTYPE_TAP:
> >  	case FTYPE_BLK:
> >  	case FTYPE_KBD:
> > diff --git a/lib/xs.c b/lib/xs.c
> > index 4af0f96..ac830d2 100644
> > --- a/lib/xs.c
> > +++ b/lib/xs.c
> > @@ -18,23 +18,55 @@ static inline int _xs_fileno(struct xs_handle *h) {
> >      return (intptr_t) h;
> >  }
> >  
> > +static int xs_close_fd(int fd)
> > +{
> > +    struct xenbus_event *event, *next;
> > +    struct file *file = get_file_from_fd(fd);

This...

> > +    for (event = file->dev; event; event = next)
> > +    {
> > +        next = event->next;
> > +        free(event);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static bool xs_can_read(int fd)
> > +{
> > +    struct file *file = get_file_from_fd(fd);

... and that would be simplified by directly getting the file* from the
parameters.

> > +    return file && file->dev;
> > +}
> > +
> > +static struct file_ops xenbus_ops = {
> > +    .name = "xenbus",
> > +    .close = xs_close_fd,
> > +    .select_rd = xs_can_read,
> > +};
> > +
> >  struct xs_handle *xs_daemon_open()
> >  {
> > -    int fd = alloc_fd(FTYPE_XENBUS);
> > -    files[fd].dev = NULL;
> > -    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].dev);
> > +    int fd;
> > +    struct file *file;
> > +    static unsigned int ftype_xenbus;
> > +
> > +    if ( !ftype_xenbus )
> > +        ftype_xenbus = alloc_file_type(&xenbus_ops);
> > +
> > +    fd = alloc_fd(ftype_xenbus);
> > +    file = get_file_from_fd(fd);
> > +    if ( !file )
> > +        return NULL;
> > +
> > +    file->dev = NULL;
> > +    printk("xs_daemon_open -> %d, %p\n", fd, &file->dev);
> >      return (void*)(intptr_t) fd;
> >  }
> >  
> >  void xs_daemon_close(struct xs_handle *h)
> >  {
> > -    int fd = _xs_fileno(h);
> > -    struct xenbus_event *event, *next;
> > -    for (event = files[fd].dev; event; event = next)
> > -    {
> > -        next = event->next;
> > -        free(event);
> > -    }
> > +    close(_xs_fileno(h));
> >  }
> >  
> >  int xs_fileno(struct xs_handle *h)
> > @@ -169,18 +201,20 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
> >  
> >  bool xs_watch(struct xs_handle *h, const char *path, const char *token)
> >  {
> > -    int fd = _xs_fileno(h);
> > +    struct file *file = get_file_from_fd(_xs_fileno(h));
> > +
> >      printk("xs_watch(%s, %s)\n", path, token);
> >      return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
> > -                   (xenbus_event_queue *)&files[fd].dev));
> > +                   (xenbus_event_queue *)&file->dev));
> >  }
> >  
> >  char **xs_read_watch(struct xs_handle *h, unsigned int *num)
> >  {
> > -    int fd = _xs_fileno(h);
> >      struct xenbus_event *event;
> > -    event = files[fd].dev;
> > -    files[fd].dev = event->next;
> > +    struct file *file = get_file_from_fd(_xs_fileno(h));
> > +
> > +    event = file->dev;
> > +    file->dev = event->next;
> >      printk("xs_read_watch() -> %s %s\n", event->path, event->token);
> >      *num = 2;
> >      return (char **) &event->path;
> > diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> > index b687678..785389f 100644
> > --- a/xenbus/xenbus.c
> > +++ b/xenbus/xenbus.c
> > @@ -393,6 +393,7 @@ static int allocate_xenbus_id(void)
> >  void init_xenbus(void)
> >  {
> >      int err;
> > +
> >      DEBUG("init_xenbus called.\n");
> >      create_thread("xenstore", xenbus_thread_func, NULL);
> >      DEBUG("buf at %p.\n", xenstore_buf);
> > -- 
> > 2.26.2
> > 
> 
> -- 
> Samuel
> <y> muhahaha...
> <y> ya un train qui part de Perrache à 14h57
> <y> qui passe à Part-Dieu à 15h10
> <y> si je le prends à Perrache, je suis en zone bleue
> <y> si je le prends à Part-Dieu, je suis en zone blanche
> <y> donc je vais le prendre à Perrache *mais* à Part-Dieu ;-)
>  -+- #ens-mim - vive la SNCF -+-

-- 
Samuel
<c> hiri, le cri ici, c des marrants
<c> j'ai un rep ".uglyhackdirectorywithoutacls" ds mon home
 -+- #ens-mim en stage -+-

