Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1848FEF6
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 22:03:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257986.443779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Cg2-0000h9-IJ; Sun, 16 Jan 2022 21:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257986.443779; Sun, 16 Jan 2022 21:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Cg2-0000eI-CZ; Sun, 16 Jan 2022 21:03:02 +0000
Received: by outflank-mailman (input) for mailman id 257986;
 Sun, 16 Jan 2022 21:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9Cg0-0000bW-7v
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 21:03:00 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad62e8af-770f-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 22:02:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 9B3499E;
 Sun, 16 Jan 2022 22:02:55 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWsA_aW_kQ2u; Sun, 16 Jan 2022 22:02:54 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 562A818A;
 Sun, 16 Jan 2022 22:02:54 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9Cft-005ugm-Mo;
 Sun, 16 Jan 2022 22:02:53 +0100
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
X-Inumbo-ID: ad62e8af-770f-11ec-9bbc-9dff3e4ee8c5
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 22:02:53 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 10/12] add struct file_ops for file type socket
Message-ID: <20220116210253.7yze4z7uqma4pk33@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-11-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116083328.26524-11-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 9B3499E
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

Juergen Gross, le dim. 16 janv. 2022 09:33:26 +0100, a ecrit:
> Even with some special handling needed in select_poll(), add a struct
> file_ops for FTYPE_SOCKET. Due to the need of the special handling it
> isn't possible to use a dynamically allocated file type.
> 
> Most functions calling the file_ops methods can be simplified a lot now
> that no file type specific handling is left. Same applies to the file
> type name printing in debug/verbose mode.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - switch to struct file * parameter for callbacks
> ---
>  lib/sys.c | 148 +++++++++++++++++++++++-------------------------------
>  1 file changed, 64 insertions(+), 84 deletions(-)
> 
> diff --git a/lib/sys.c b/lib/sys.c
> index 74c82b2a..538d6e7b 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -99,11 +99,67 @@ static const struct file_ops file_ops_none = {
>      .name = "none",
>  };
>  
> +#ifdef HAVE_LWIP
> +static int socket_read(struct file *file, void *buf, size_t nbytes)
> +{
> +    return lwip_read(file->fd, buf, nbytes);
> +}
> +
> +static int socket_write(struct file *file, const void *buf, size_t nbytes)
> +{
> +    return lwip_write(file->fd, buf, nbytes);
> +}
> +
> +static int close_socket_fd(struct file *file)
> +{
> +    return lwip_close(file->fd);
> +}
> +
> +static int socket_fstat(struct file *file, struct stat *buf)
> +{
> +    buf->st_mode = S_IFSOCK | S_IRUSR | S_IWUSR;
> +    buf->st_atime = buf->st_mtime = buf->st_ctime = time(NULL);
> +
> +    return 0;
> +}
> +
> +static int socket_fcntl(struct file *file, int cmd, va_list args)
> +{
> +    long arg;
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
> +    printk("socket fcntl(fd, %d, %lx/%lo)\n", cmd, arg, arg);
> +    errno = ENOSYS;
> +    return -1;
> +}
> +
> +static const struct file_ops socket_ops = {
> +    .name = "socket",
> +    .read = socket_read,
> +    .write = socket_write,
> +    .close = close_socket_fd,
> +    .fstat = socket_fstat,
> +    .fcntl = socket_fcntl,
> +};
> +#endif
> +
>  static const struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
>      [FTYPE_NONE] = &file_ops_none,
>  #ifdef CONFIG_CONSFRONT
>      [FTYPE_CONSOLE] = &console_ops,
>  #endif
> +#ifdef HAVE_LWIP
> +    [FTYPE_SOCKET] = &socket_ops,
> +#endif
>  };
>  
>  unsigned int alloc_file_type(const struct file_ops *ops)
> @@ -288,15 +344,6 @@ int read(int fd, void *buf, size_t nbytes)
>      if ( ops->read )
>          return ops->read(file, buf, nbytes);
>  
> -    switch (file->type) {
> -#ifdef HAVE_LWIP
> -        case FTYPE_SOCKET:
> -	    return lwip_read(files[fd].fd, buf, nbytes);
> -#endif
> -	default:
> -	    break;
> -    }
> -
>   error:
>      printk("read(%d): Bad descriptor\n", fd);
>      errno = EBADF;
> @@ -315,15 +362,6 @@ int write(int fd, const void *buf, size_t nbytes)
>      if ( ops->write )
>          return ops->write(file, buf, nbytes);
>  
> -    switch (file->type) {
> -#ifdef HAVE_LWIP
> -	case FTYPE_SOCKET:
> -	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
> -#endif
> -	default:
> -	    break;
> -    }
> -
>   error:
>      printk("write(%d): Bad descriptor\n", fd);
>      errno = EBADF;
> @@ -406,24 +444,10 @@ int close(int fd)
>      ops = get_file_ops(file->type);
>      printk("close(%d)\n", fd);
>      if ( ops->close )
> -    {
>          res = ops->close(file);
> -        goto out;
> -    }
> -
> -    switch (file->type) {
> -        default:
> -            break;
> -#ifdef HAVE_LWIP
> -	case FTYPE_SOCKET:
> -            res = lwip_close(files[fd].fd);
> -            break;
> -#endif
> -	case FTYPE_NONE:
> -            goto error;
> -    }
> +    else if ( file->type == FTYPE_NONE )
> +        goto error;
>  
> - out:
>      memset(files + fd, 0, sizeof(struct file));
>      BUILD_BUG_ON(FTYPE_NONE != 0);
>  
> @@ -466,21 +490,6 @@ int fstat(int fd, struct stat *buf)
>      if ( ops->fstat )
>          return ops->fstat(file, buf);
>  
> -    switch (file->type) {
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
>   error:
>      printk("statf(%d): Bad descriptor\n", fd);
>      errno = EBADF;
> @@ -538,21 +547,9 @@ int fcntl(int fd, int cmd, ...)
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
> @@ -586,23 +583,6 @@ int closedir(DIR *dir)
>  
>  /* We assume that only the main thread calls select(). */
>  
> -#if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
> -static const char *const file_types[] = {
> -    [FTYPE_NONE]    = "none",
> -    [FTYPE_SOCKET]  = "socket",
> -};
> -
> -static const char *get_type_name(unsigned int type)
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
> @@ -613,7 +593,7 @@ static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
>  	if (FD_ISSET(i, set)) { \
>  	    if (comma) \
>  		printk(", "); \
> -            printk("%d(%s)", i, get_type_name(files[i].type)); \
> +            printk("%d(%s)", i, get_file_ops(files[i].type)->name); \
>  	    comma = 1; \
>  	} \
>      } \
> @@ -647,7 +627,7 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
>          fd = pfd[i].fd;
>          if (comma)
>              printk(", ");
> -        printk("%d(%s)/%02x", fd, get_type_name(files[fd].type),
> +        printk("%d(%s)/%02x", fd, get_file_ops(files[fd].type)->name,
>              pfd[i].events);
>              comma = 1;
>      }
> @@ -809,7 +789,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	printk("%d(%d): ", nb, sock_n);
>  	for (i = 0; i < nfds; i++) {
>  	    if (nbread[i] || nbwrite[i] || nbexcept[i])
> -                printk(" %d(%c):", i, get_type_name(files[i].type));
> +                printk(" %d(%c):", i, get_file_ops(files[i].type)->name);
>  	    if (nbread[i])
>  	    	printk(" %dR", nbread[i]);
>  	    if (nbwrite[i])
> -- 
> 2.26.2
> 

-- 
Samuel
*** s has joined channel #ens-mim
<N> re 
<s> pfff 
<s> mare de la pfp. 
<s> pas commencer et j'en ai deja marre. 
<s> bon ct juste un cou de gueule ++ 
*** s has left channel #ens-mim (s)
 -+- #ens-mim et la peufeupeu -+-

