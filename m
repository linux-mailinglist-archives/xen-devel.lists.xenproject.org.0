Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1748C250
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 11:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256446.440062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7atq-0005y1-5U; Wed, 12 Jan 2022 10:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256446.440062; Wed, 12 Jan 2022 10:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7atq-0005uW-09; Wed, 12 Jan 2022 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 256446;
 Wed, 12 Jan 2022 10:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR4C=R4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7ato-0005sd-G0
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 10:30:36 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac62ea03-7392-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 11:30:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 72F1540E;
 Wed, 12 Jan 2022 11:30:33 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOeJ9QxSmz-F; Wed, 12 Jan 2022 11:30:32 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id AA94E1A5;
 Wed, 12 Jan 2022 11:30:32 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7atk-00HPHR-A3;
 Wed, 12 Jan 2022 11:30:32 +0100
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
X-Inumbo-ID: ac62ea03-7392-11ec-bd6f-bfb69f65cdc7
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Wed, 12 Jan 2022 11:30:32 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 10/12] mini-os: add struct file_ops for file type
 socket
Message-ID: <20220112103032.y4sgydgj24jjiphl@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-11-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-11-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 72F1540E
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

Juergen Gross, le mar. 11 janv. 2022 16:12:13 +0100, a ecrit:
> Even with some special handling needed in select_poll(), add a struct
> file_ops for FTYPE_SOCKET. Due to the need of the special handling it
> isn't possible to use a dynamically allocated file type.
> 
> Most functions calling the file_ops methods can be simplified a lot now
> that no file type specific handling is left. Same applies to the file
> type name printing in debug/verbose mode.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

modulo the int fd / file * thing,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  lib/sys.c | 153 +++++++++++++++++++++++++-----------------------------
>  1 file changed, 70 insertions(+), 83 deletions(-)
> 
> diff --git a/lib/sys.c b/lib/sys.c
> index 3a8aa68..12deaed 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -99,11 +99,70 @@ static struct file_ops file_ops_none = {
>      .name = "none",
>  };
>  
> +#ifdef HAVE_LWIP
> +static int socket_read(int fd, void *buf, size_t nbytes)
> +{
> +    return lwip_read(fd, buf, nbytes);
> +}
> +
> +static int socket_write(int fd, const void *buf, size_t nbytes)
> +{
> +    return lwip_write(fd, (void *)buf, nbytes);
> +}
> +
> +static int close_socket_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    return lwip_close(file->fd);
> +}
> +
> +static int socket_fstat(int fd, struct stat *buf)
> +{
> +    buf->st_mode = S_IFSOCK | S_IRUSR | S_IWUSR;
> +    buf->st_atime = buf->st_mtime = buf->st_ctime = time(NULL);
> +
> +    return 0;
> +}
> +
> +static int socket_fcntl(int fd, int cmd, va_list args)
> +{
> +    long arg;
> +    struct file *file = get_file_from_fd(fd);
> +
> +    arg = va_arg(args, long);
> +
> +    if ( cmd == F_SETFL && !(arg & ~O_NONBLOCK) )
> +    {
> +        /* Only flag supported: non-blocking mode */
> +        uint32_t nblock = !!(arg & O_NONBLOCK);
> +
> +        return lwip_ioctl(file->fd, FIONBIO, &nblock);
> +    }
> +
> +    printk("fcntl(%d, %d, %lx/%lo)\n", fd, cmd, arg, arg);
> +    errno = ENOSYS;
> +    return -1;
> +}
> +
> +static struct file_ops socket_ops = {
> +    .name = "socket",
> +    .read = socket_read,
> +    .write = socket_write,
> +    .close = close_socket_fd,
> +    .fstat = socket_fstat,
> +    .fcntl = socket_fcntl,
> +};
> +#endif
> +
>  static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
>      [FTYPE_NONE] = &file_ops_none,
>  #ifdef CONFIG_CONSFRONT
>      [FTYPE_CONSOLE] = &console_ops,
>  #endif
> +#ifdef HAVE_LWIP
> +    [FTYPE_SOCKET] = &socket_ops,
> +#endif
>  };
>  
>  unsigned int alloc_file_type(struct file_ops *ops)
> @@ -282,14 +341,6 @@ int read(int fd, void *buf, size_t nbytes)
>      if ( ops->read )
>          return ops->read(fd, buf, nbytes);
>  
> -    switch (files[fd].type) {
> -#ifdef HAVE_LWIP
> -	case FTYPE_SOCKET:
> -	    return lwip_read(files[fd].fd, buf, nbytes);
> -#endif
> -	default:
> -	    break;
> -    }
>      printk("read(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
> @@ -302,14 +353,6 @@ int write(int fd, const void *buf, size_t nbytes)
>      if ( ops->write )
>          return ops->write(fd, buf, nbytes);
>  
> -    switch (files[fd].type) {
> -#ifdef HAVE_LWIP
> -	case FTYPE_SOCKET:
> -	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
> -#endif
> -	default:
> -	    break;
> -    }
>      printk("write(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
> @@ -378,26 +421,14 @@ int close(int fd)
>  
>      printk("close(%d)\n", fd);
>      if ( ops->close )
> -    {
>          res = ops->close(fd);
> -        goto out;
> -    }
> -
> -    switch (files[fd].type) {
> -        default:
> -            break;
> -#ifdef HAVE_LWIP
> -	case FTYPE_SOCKET:
> -	    res = lwip_close(files[fd].fd);
> -            break;
> -#endif
> -	case FTYPE_NONE:
> -            printk("close(%d): Bad descriptor\n", fd);
> -            errno = EBADF;
> -            return -1;
> +    else if ( files[fd].type == FTYPE_NONE )
> +    {
> +        printk("close(%d): Bad descriptor\n", fd);
> +        errno = EBADF;
> +        return -1;
>      }
>  
> - out:
>      memset(files + fd, 0, sizeof(struct file));
>      files[fd].type = FTYPE_NONE;
>      return res;
> @@ -429,21 +460,6 @@ int fstat(int fd, struct stat *buf)
>      if ( ops->fstat )
>          return ops->fstat(fd, buf);
>  
> -    switch (files[fd].type) {
> -	case FTYPE_SOCKET: {
> -            buf->st_mode = S_IFSOCK|S_IRUSR|S_IWUSR;
> -	    buf->st_uid = 0;
> -	    buf->st_gid = 0;
> -	    buf->st_size = 0;
> -	    buf->st_atime = 
> -	    buf->st_mtime = 
> -	    buf->st_ctime = time(NULL);
> -	    return 0;
> -	}
> -	default:
> -	    break;
> -    }
> -
>      printk("statf(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
> @@ -491,21 +507,9 @@ int fcntl(int fd, int cmd, ...)
>      arg = va_arg(ap, long);
>      va_end(ap);
>  
> -    switch (cmd) {
> -#ifdef HAVE_LWIP
> -	case F_SETFL:
> -	    if (files[fd].type == FTYPE_SOCKET && !(arg & ~O_NONBLOCK)) {
> -		/* Only flag supported: non-blocking mode */
> -		uint32_t nblock = !!(arg & O_NONBLOCK);
> -		return lwip_ioctl(files[fd].fd, FIONBIO, &nblock);
> -	    }
> -	    /* Fallthrough */
> -#endif
> -	default:
> -	    printk("fcntl(%d, %d, %lx/%lo)\n", fd, cmd, arg, arg);
> -	    errno = ENOSYS;
> -	    return -1;
> -    }
> +    printk("fcntl(%d, %d, %lx/%lo)\n", fd, cmd, arg, arg);
> +    errno = ENOSYS;
> +    return -1;
>  }
>  
>  DIR *opendir(const char *name)
> @@ -539,23 +543,6 @@ int closedir(DIR *dir)
>  
>  /* We assume that only the main thread calls select(). */
>  
> -#if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
> -static const char *file_types[] = {
> -    [FTYPE_NONE]    = "none",
> -    [FTYPE_SOCKET]  = "socket",
> -};
> -
> -static char *get_type_name(unsigned int type)
> -{
> -    if ( type < ARRAY_SIZE(file_ops) && file_ops[type] )
> -        return file_ops[type]->name;
> -
> -    if ( type < ARRAY_SIZE(file_types) && file_types[type] )
> -        return file_types[type];
> -
> -    return "none";
> -}
> -#endif
>  #ifdef LIBC_DEBUG
>  static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout)
>  {
> @@ -566,7 +553,7 @@ static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
>  	if (FD_ISSET(i, set)) { \
>  	    if (comma) \
>  		printk(", "); \
> -	    printk("%d(%s)", i, get_type_name(files[i].type)); \
> +	    printk("%d(%s)", i, get_file_ops(files[i].type)->name); \
>  	    comma = 1; \
>  	} \
>      } \
> @@ -600,7 +587,7 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
>          fd = pfd[i].fd;
>          if (comma)
>              printk(", ");
> -        printk("%d(%s)/%02x", fd, get_type_name(files[fd].type),
> +        printk("%d(%s)/%02x", fd, get_file_ops(files[fd].type)->name,
>              pfd[i].events);
>              comma = 1;
>      }
> @@ -754,7 +741,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	printk("%d(%d): ", nb, sock_n);
>  	for (i = 0; i < nfds; i++) {
>  	    if (nbread[i] || nbwrite[i] || nbexcept[i])
> -		printk(" %d(%c):", i, get_type_name(files[i].type));
> +		printk(" %d(%c):", i, get_file_ops(files[i].type)->name);
>  	    if (nbread[i])
>  	    	printk(" %dR", nbread[i]);
>  	    if (nbwrite[i])
> -- 
> 2.26.2
> 

-- 
Samuel
Running Windows on a Pentium is like having a brand new Porsche but only
be able to drive backwards with the handbrake on.
(Unknown source)

