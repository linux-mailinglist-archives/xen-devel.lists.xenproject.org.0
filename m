Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1F48C252
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 11:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256443.440047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7atU-0005S2-Hy; Wed, 12 Jan 2022 10:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256443.440047; Wed, 12 Jan 2022 10:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7atU-0005P1-Ec; Wed, 12 Jan 2022 10:30:16 +0000
Received: by outflank-mailman (input) for mailman id 256443;
 Wed, 12 Jan 2022 10:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR4C=R4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7atT-0005Mq-4S
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 10:30:15 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e581b47-7392-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 11:30:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7492040E;
 Wed, 12 Jan 2022 11:30:09 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UOZffL4rreGZ; Wed, 12 Jan 2022 11:30:08 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 5669F1A5;
 Wed, 12 Jan 2022 11:30:08 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7atL-00HOFv-Ej;
 Wed, 12 Jan 2022 11:30:07 +0100
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
X-Inumbo-ID: 9e581b47-7392-11ec-9c70-5536b2d1e4e1
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Wed, 12 Jan 2022 11:30:07 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd()
 for console
Message-ID: <20220112103007.7szlvucbyxfje6r7@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111151215.22955-10-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 7492040E
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

Juergen Gross, le mar. 11 janv. 2022 16:12:12 +0100, a ecrit:
> Add struct file_ops for the console related file types (FTYPE_CONSOLE
> and savefile). FTYPE_CONSOLE remains statically defined, as it is used
> to statically init stdin, stdout and stderr.
> 
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> With CONSOLE now handled via file_ops the bogus file descriptor case in
> select_poll() now needs to be handled more explicit instead of dropping
> into console handling, assuming that this case was basically meant to
> cover SAVEFILE.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

modulo the int fd / file * thing,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  console/xenbus.c       | 125 +++++++++++++++++++++++++++++++++++++++++
>  console/xencons_ring.c |   6 +-
>  include/console.h      |   5 ++
>  include/lib.h          |   3 +-
>  lib/sys.c              |  87 +++++++---------------------
>  5 files changed, 155 insertions(+), 71 deletions(-)
> 
> diff --git a/console/xenbus.c b/console/xenbus.c
> index 05fc31c..b856c84 100644
> --- a/console/xenbus.c
> +++ b/console/xenbus.c
> @@ -192,3 +192,128 @@ void fini_consfront(struct consfront_dev *dev)
>  {
>      if (dev) free_consfront(dev);
>  }
> +
> +#ifdef HAVE_LIBC
> +static int consfront_read(int fd, void *buf, size_t nbytes)
> +{
> +    int ret;
> +    struct file *file = get_file_from_fd(fd);
> +    DEFINE_WAIT(w);
> +
> +    while ( 1 )
> +    {
> +        add_waiter(w, console_queue);
> +        ret = xencons_ring_recv(file->dev, buf, nbytes);
> +        if ( ret )
> +            break;
> +        schedule();
> +    }
> +
> +    remove_waiter(w, console_queue);
> +
> +    return ret;
> +}
> +
> +static int savefile_write(int fd, const void *buf, size_t nbytes)
> +{
> +    int ret = 0, tot = nbytes;
> +    struct file *file = get_file_from_fd(fd);
> +
> +    while ( nbytes > 0 )
> +    {
> +        ret = xencons_ring_send(file->dev, (char *)buf, nbytes);
> +        nbytes -= ret;
> +        buf = (char *)buf + ret;
> +    }
> +
> +    return tot - nbytes;
> +}
> +
> +static int console_write(int fd, const void *buf, size_t nbytes)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    console_print(file->dev, (char *)buf, nbytes);
> +
> +    return nbytes;
> +}
> +
> +static int consfront_close_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    fini_consfront(file->dev);
> +
> +    return 0;
> +}
> +
> +static int consfront_fstat(int fd, struct stat *buf)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    buf->st_mode = S_IRUSR | S_IWUSR;
> +    buf->st_mode |= (file->type == FTYPE_CONSOLE) ? S_IFCHR : S_IFREG;
> +    buf->st_atime = buf->st_mtime = buf->st_ctime = time(NULL);
> +
> +    return 0;
> +}
> +
> +static bool consfront_select_rd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    return xencons_ring_avail(file->dev);
> +}
> +
> +static struct file_ops savefile_ops = {
> +    .name = "savefile",
> +    .read = consfront_read,
> +    .write = savefile_write,
> +    .close = consfront_close_fd,
> +    .fstat = consfront_fstat,
> +    .select_rd = consfront_select_rd,
> +    .select_wr = select_yes,
> +};
> +
> +struct file_ops console_ops = {
> +    .name = "console",
> +    .read = consfront_read,
> +    .write = console_write,
> +    .close = consfront_close_fd,
> +    .fstat = consfront_fstat,
> +    .select_rd = consfront_select_rd,
> +    .select_wr = select_yes,
> +};
> +
> +int open_consfront(char *nodename)
> +{
> +    struct consfront_dev *dev;
> +    static unsigned int ftype_savefile;
> +    unsigned int ftype;
> +    struct file *file;
> +
> +    dev = init_consfront(nodename);
> +    if ( !dev )
> +        return -1;
> +
> +    if ( nodename )
> +    {
> +        if ( !ftype_savefile )
> +            ftype_savefile = alloc_file_type(&savefile_ops);
> +        ftype = ftype_savefile;
> +    }
> +    else
> +        ftype = FTYPE_CONSOLE;
> +
> +    dev->fd = alloc_fd(ftype);
> +    file = get_file_from_fd(dev->fd);
> +    if ( !file )
> +    {
> +        fini_consfront(dev);
> +        return -1;
> +    }
> +    file->dev = dev;
> +
> +    return dev->fd;
> +}
> +#endif
> diff --git a/console/xencons_ring.c b/console/xencons_ring.c
> index c348f3c..efedf46 100644
> --- a/console/xencons_ring.c
> +++ b/console/xencons_ring.c
> @@ -99,10 +99,10 @@ void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data)
>  {
>  	struct consfront_dev *dev = (struct consfront_dev *) data;
>  #ifdef HAVE_LIBC
> -        int fd = dev ? dev->fd : -1;
> +        struct file *file = dev ? get_file_from_fd(dev->fd) : NULL;
>  
> -        if (fd != -1)
> -            files[fd].read = true;
> +        if ( file )
> +            file->read = true;
>  
>          wake_up(&console_queue);
>  #else
> diff --git a/include/console.h b/include/console.h
> index 0d7bf07..8c615d0 100644
> --- a/include/console.h
> +++ b/include/console.h
> @@ -39,6 +39,7 @@
>  #include <mini-os/os.h>
>  #include <mini-os/traps.h>
>  #include <mini-os/types.h>
> +#include <mini-os/lib.h>
>  #include <xen/grant_table.h>
>  #include <xenbus.h>
>  #include <xen/io/console.h>
> @@ -93,5 +94,9 @@ int xencons_ring_send_no_notify(struct consfront_dev *dev, const char *data, uns
>  int xencons_ring_avail(struct consfront_dev *dev);
>  int xencons_ring_recv(struct consfront_dev *dev, char *data, unsigned len);
>  void free_consfront(struct consfront_dev *dev);
> +#ifdef HAVE_LIBC
> +extern struct file_ops console_ops;
> +int open_consfront(char *nodename);
> +#endif
>  
>  #endif /* _LIB_CONSOLE_H_ */
> diff --git a/include/lib.h b/include/lib.h
> index 653a16e..c171fe8 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -160,8 +160,7 @@ void sanity_check(void);
>  #define FTYPE_FILE       2
>  #define FTYPE_SOCKET     3
>  #define FTYPE_MEM        4
> -#define FTYPE_SAVEFILE   5
> -#define FTYPE_N          6
> +#define FTYPE_N          5
>  #define FTYPE_SPARE     16
>  
>  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> diff --git a/lib/sys.c b/lib/sys.c
> index 4fb844f..3a8aa68 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -101,6 +101,9 @@ static struct file_ops file_ops_none = {
>  
>  static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
>      [FTYPE_NONE] = &file_ops_none,
> +#ifdef CONFIG_CONSFRONT
> +    [FTYPE_CONSOLE] = &console_ops,
> +#endif
>  };
>  
>  unsigned int alloc_file_type(struct file_ops *ops)
> @@ -211,31 +214,26 @@ int mkdir(const char *pathname, mode_t mode)
>  #ifdef CONFIG_CONSFRONT
>  int posix_openpt(int flags)
>  {
> -    struct consfront_dev *dev;
> +    int fd;
>  
>      /* Ignore flags */
> +    fd = open_consfront(NULL);
> +    printk("fd(%d) = posix_openpt\n", fd);
>  
> -    dev = init_consfront(NULL);
> -    dev->fd = alloc_fd(FTYPE_CONSOLE);
> -    files[dev->fd].dev = dev;
> -
> -    printk("fd(%d) = posix_openpt\n", dev->fd);
> -    return(dev->fd);
> +    return fd;
>  }
>  
>  int open_savefile(const char *path, int save)
>  {
> -    struct consfront_dev *dev;
> +    int fd;
>      char nodename[64];
>  
>      snprintf(nodename, sizeof(nodename), "device/console/%d", save ? SAVE_CONSOLE : RESTORE_CONSOLE);
>  
> -    dev = init_consfront(nodename);
> -    dev->fd = alloc_fd(FTYPE_SAVEFILE);
> -    files[dev->fd].dev = dev;
> +    fd = open_consfront(nodename);
> +    printk("fd(%d) = open_savefile\n", fd);
>  
> -    printk("fd(%d) = open_savefile\n", dev->fd);
> -    return(dev->fd);
> +    return fd;
>  }
>  #else
>  int posix_openpt(int flags)
> @@ -285,20 +283,6 @@ int read(int fd, void *buf, size_t nbytes)
>          return ops->read(fd, buf, nbytes);
>  
>      switch (files[fd].type) {
> -        case FTYPE_SAVEFILE:
> -	case FTYPE_CONSOLE: {
> -	    int ret;
> -            DEFINE_WAIT(w);
> -            while(1) {
> -                add_waiter(w, console_queue);
> -                ret = xencons_ring_recv(files[fd].dev, buf, nbytes);
> -                if (ret)
> -                    break;
> -                schedule();
> -            }
> -            remove_waiter(w, console_queue);
> -            return ret;
> -        }
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
>  	    return lwip_read(files[fd].fd, buf, nbytes);
> @@ -319,18 +303,6 @@ int write(int fd, const void *buf, size_t nbytes)
>          return ops->write(fd, buf, nbytes);
>  
>      switch (files[fd].type) {
> -        case FTYPE_SAVEFILE: {
> -                int ret = 0, tot = nbytes;
> -                while (nbytes > 0) {
> -                    ret = xencons_ring_send(files[fd].dev, (char *)buf, nbytes);
> -                    nbytes -= ret;
> -                    buf = (char *)buf + ret;
> -                }
> -                return tot - nbytes;
> -            }
> -	case FTYPE_CONSOLE:
> -	    console_print(files[fd].dev, (char *)buf, nbytes);
> -	    return nbytes;
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
>  	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
> @@ -418,12 +390,6 @@ int close(int fd)
>  	case FTYPE_SOCKET:
>  	    res = lwip_close(files[fd].fd);
>              break;
> -#endif
> -#ifdef CONFIG_CONSFRONT
> -        case FTYPE_SAVEFILE:
> -        case FTYPE_CONSOLE:
> -            fini_consfront(files[fd].dev);
> -            break;
>  #endif
>  	case FTYPE_NONE:
>              printk("close(%d): Bad descriptor\n", fd);
> @@ -464,15 +430,8 @@ int fstat(int fd, struct stat *buf)
>          return ops->fstat(fd, buf);
>  
>      switch (files[fd].type) {
> -	case FTYPE_SAVEFILE:
> -	case FTYPE_CONSOLE:
>  	case FTYPE_SOCKET: {
> -            if (files[fd].type == FTYPE_CONSOLE)
> -                buf->st_mode = S_IFCHR|S_IRUSR|S_IWUSR;
> -            else if (files[fd].type == FTYPE_SOCKET)
> -                buf->st_mode = S_IFSOCK|S_IRUSR|S_IWUSR;
> -            else if (files[fd].type == FTYPE_SAVEFILE)
> -                buf->st_mode = S_IFREG|S_IRUSR|S_IWUSR;
> +            buf->st_mode = S_IFSOCK|S_IRUSR|S_IWUSR;
>  	    buf->st_uid = 0;
>  	    buf->st_gid = 0;
>  	    buf->st_size = 0;
> @@ -583,7 +542,6 @@ int closedir(DIR *dir)
>  #if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
>  static const char *file_types[] = {
>      [FTYPE_NONE]    = "none",
> -    [FTYPE_CONSOLE] = "console",
>      [FTYPE_SOCKET]  = "socket",
>  };
>  
> @@ -744,21 +702,18 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>              }
>  
>  	    if (FD_ISSET(i, readfds) || FD_ISSET(i, writefds) || FD_ISSET(i, exceptfds))
> +            {
>  		printk("bogus fd %d in select\n", i);
> -	    /* Fallthrough.  */
> -        }
> -
> -	case FTYPE_CONSOLE:
> -	    if (FD_ISSET(i, readfds)) {
> -                if (xencons_ring_avail(files[i].dev))
> -		    n++;
> -		else
> -		    FD_CLR(i, readfds);
> +                if ( FD_ISSET(i, readfds) )
> +                    FD_CLR(i, readfds);
> +                if ( FD_ISSET(i, writefds) )
> +                    FD_CLR(i, writefds);
> +                if ( FD_ISSET(i, exceptfds) )
> +                    FD_CLR(i, exceptfds);
>              }
> -	    if (FD_ISSET(i, writefds))
> -                n++;
> -	    FD_CLR(i, exceptfds);
>  	    break;
> +        }
> +
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
>  	    if (FD_ISSET(i, readfds)) {
> -- 
> 2.26.2
> 

-- 
Samuel
<y> t1 faich
<y> les programmes ils segfaultent jamais quand on veut
 -+- #ens-mim en plein débogage -+-

