Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56B48FED8
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257933.443558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CJ1-0004ic-LD; Sun, 16 Jan 2022 20:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257933.443558; Sun, 16 Jan 2022 20:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CJ1-0004gl-I6; Sun, 16 Jan 2022 20:39:15 +0000
Received: by outflank-mailman (input) for mailman id 257933;
 Sun, 16 Jan 2022 20:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CJ0-0004ej-A5
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:39:14 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c90f37c-770c-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 402A835D;
 Sun, 16 Jan 2022 21:39:11 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCzniMKdUBPS; Sun, 16 Jan 2022 21:39:10 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 794E89E;
 Sun, 16 Jan 2022 21:39:09 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CIt-005uTB-JB;
 Sun, 16 Jan 2022 21:39:07 +0100
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
X-Inumbo-ID: 5c90f37c-770c-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:39:07 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 4/5] use function vectors instead of switch for
 file operations
Message-ID: <20220116203907.7nr3f42rl6gnwi3k@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116064527.23519-1-jgross@suse.com>
 <20220116064527.23519-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116064527.23519-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 402A835D
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

Juergen Gross, le dim. 16 janv. 2022 07:45:26 +0100, a ecrit:
> Introduce file type specific function vectors for all the needed file
> operations which are file type specific in order to prepare replacing
> the large switch statements in each generic file function.
> 
> Add a function to allocate a new file type dynamically in order to
> prepare removing direct dependencies to external components in the
> future. For this reason switch the file type from an enum to an
> unsigned int. Prepare removal of some statically defines file types
> by putting them at the end of the defined list.
> 
> Change the debug output for the file type from a single character to
> a string in order to support a future removal of the file_types[]
> array.
> 
> Provide some functions useful for file_ops in future patches.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - new patch
> V3:
> - drop typedefs for callbacks (Andrew Cooper)
> - const (Andrew Cooper)
> - drop loop from alloc_file_type() (Andrew Cooper)
> - switch to struct file * as first parameter of callbacks (Andrew Cooper)
> ---
>  include/lib.h |  57 +++++++----
>  lib/sys.c     | 268 ++++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 263 insertions(+), 62 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 7ca90768..44696806 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -66,6 +66,7 @@
>  
>  #ifdef HAVE_LIBC
>  #include <sys/queue.h>
> +#include <sys/stat.h>
>  #include <stdio.h>
>  #include <string.h>
>  #else
> @@ -154,23 +155,23 @@ do {                                                           \
>  void sanity_check(void);
>  
>  #ifdef HAVE_LIBC
> -enum fd_type {
> -    FTYPE_NONE = 0,
> -    FTYPE_CONSOLE,
> -    FTYPE_FILE,
> -    FTYPE_XENBUS,
> -    FTYPE_EVTCHN,
> -    FTYPE_GNTMAP,
> -    FTYPE_SOCKET,
> -    FTYPE_TAP,
> -    FTYPE_BLK,
> -    FTYPE_KBD,
> -    FTYPE_FB,
> -    FTYPE_MEM,
> -    FTYPE_SAVEFILE,
> -    FTYPE_TPMFRONT,
> -    FTYPE_TPM_TIS,
> -};
> +#define FTYPE_NONE       0
> +#define FTYPE_CONSOLE    1
> +#define FTYPE_FILE       2
> +#define FTYPE_SOCKET     3
> +#define FTYPE_MEM        4
> +#define FTYPE_SAVEFILE   5
> +#define FTYPE_FB         6
> +#define FTYPE_KBD        7
> +#define FTYPE_TAP        8
> +#define FTYPE_BLK        9
> +#define FTYPE_TPMFRONT  10
> +#define FTYPE_TPM_TIS   11
> +#define FTYPE_XENBUS    12
> +#define FTYPE_GNTMAP    13
> +#define FTYPE_EVTCHN    14
> +#define FTYPE_N         15
> +#define FTYPE_SPARE     16
>  
>  LIST_HEAD(evtchn_port_list, evtchn_port_info);
>  
> @@ -182,7 +183,7 @@ struct evtchn_port_info {
>  };
>  
>  struct file {
> -    enum fd_type type;
> +    unsigned int type;
>      bool read;	/* maybe available for read */
>      off_t offset;
>      union {
> @@ -197,8 +198,26 @@ struct file {
>  
>  extern struct file files[];
>  
> +struct file_ops {
> +    const char *name;
> +    int (*read)(struct file *file, void *buf, size_t nbytes);
> +    int (*write)(struct file *file, const void *buf, size_t nbytes);
> +    off_t (*lseek)(struct file *file, off_t offset, int whence);
> +    int (*close)(struct file *file);
> +    int (*fstat)(struct file *file, struct stat *buf);
> +    int (*fcntl)(struct file *file, int cmd, va_list args);
> +    bool (*select_rd)(struct file *file);
> +    bool (*select_wr)(struct file *file);
> +};
> +
> +unsigned int alloc_file_type(const struct file_ops *ops);
> +
> +off_t lseek_default(struct file *file, off_t offset, int whence);
> +bool select_yes(struct file *file);
> +bool select_read_flag(struct file *file);
> +
>  struct file *get_file_from_fd(int fd);
> -int alloc_fd(enum fd_type type);
> +int alloc_fd(unsigned int type);
>  void close_all_files(void);
>  extern struct thread *main_thread;
>  void sparse(unsigned long data, size_t size);
> diff --git a/lib/sys.c b/lib/sys.c
> index a24687b7..7be01fd3 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -97,6 +97,40 @@ struct file files[NOFILE] = {
>      { .type = FTYPE_CONSOLE }, /* stderr */
>  };
>  
> +static const struct file_ops file_ops_none = {
> +    .name = "none",
> +};
> +
> +static const struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
> +    [FTYPE_NONE] = &file_ops_none,
> +};
> +
> +unsigned int alloc_file_type(const struct file_ops *ops)
> +{
> +    static unsigned int i = FTYPE_N;
> +    unsigned int ret;
> +
> +    pthread_mutex_lock(&fd_lock);
> +
> +    BUG_ON(i == ARRAY_SIZE(file_ops));
> +    ret = i++;
> +    file_ops[ret] = ops;
> +
> +    pthread_mutex_unlock(&fd_lock);
> +
> +    printk("New file type \"%s\"(%u) allocated\n", ops->name, ret);
> +
> +    return ret;
> +}
> +
> +static const struct file_ops *get_file_ops(unsigned int type)
> +{
> +    if ( type >= ARRAY_SIZE(file_ops) || !file_ops[type] )
> +        return &file_ops_none;
> +
> +    return file_ops[type];
> +}
> +
>  struct file *get_file_from_fd(int fd)
>  {
>      if ( fd < 0 || fd >= ARRAY_SIZE(files) )
> @@ -107,7 +141,7 @@ struct file *get_file_from_fd(int fd)
>  
>  DECLARE_WAIT_QUEUE_HEAD(event_queue);
>  
> -int alloc_fd(enum fd_type type)
> +int alloc_fd(unsigned int type)
>  {
>      int i;
>      pthread_mutex_lock(&fd_lock);
> @@ -248,7 +282,17 @@ int isatty(int fd)
>  
>  int read(int fd, void *buf, size_t nbytes)
>  {
> -    switch (files[fd].type) {
> +    struct file *file = get_file_from_fd(fd);
> +    const struct file_ops *ops;
> +
> +    if ( !file )
> +        goto error;
> +
> +    ops = get_file_ops(file->type);
> +    if ( ops->read )
> +        return ops->read(file, buf, nbytes);
> +
> +    switch (file->type) {
>          case FTYPE_SAVEFILE:
>  	case FTYPE_CONSOLE: {
>  	    int ret;
> @@ -320,6 +364,8 @@ int read(int fd, void *buf, size_t nbytes)
>  	default:
>  	    break;
>      }
> +
> + error:
>      printk("read(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
> @@ -327,7 +373,17 @@ int read(int fd, void *buf, size_t nbytes)
>  
>  int write(int fd, const void *buf, size_t nbytes)
>  {
> -    switch (files[fd].type) {
> +    struct file *file = get_file_from_fd(fd);
> +    const struct file_ops *ops;
> +
> +    if ( !file )
> +        goto error;
> +
> +    ops = get_file_ops(file->type);
> +    if ( ops->write )
> +        return ops->write(file, buf, nbytes);
> +
> +    switch (file->type) {
>          case FTYPE_SAVEFILE: {
>                  int ret = 0, tot = nbytes;
>                  while (nbytes > 0) {
> @@ -364,14 +420,61 @@ int write(int fd, const void *buf, size_t nbytes)
>  	default:
>  	    break;
>      }
> +
> + error:
>      printk("write(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
>  }
>  
> +off_t lseek_default(struct file *file, off_t offset, int whence)
> +{
> +    switch ( whence )
> +    {
> +    case SEEK_SET:
> +        file->offset = offset;
> +        break;
> +
> +    case SEEK_CUR:
> +        file->offset += offset;
> +        break;
> +
> +    case SEEK_END:
> +    {
> +        struct stat st;
> +        int ret;
> +
> +        ret = fstat(file - files, &st);
> +        if ( ret )
> +            return -1;
> +        file->offset = st.st_size + offset;
> +        break;
> +    }
> +
> +    default:
> +        errno = EINVAL;
> +        return -1;
> +    }
> +
> +    return file->offset;
> +}
> +
>  off_t lseek(int fd, off_t offset, int whence)
>  {
> -    switch(files[fd].type) {
> +    struct file *file = get_file_from_fd(fd);
> +    const struct file_ops *ops;
> +
> +    if ( !file )
> +    {
> +        errno = EBADF;
> +        return (off_t)-1;
> +    }
> +
> +    ops = get_file_ops(file->type);
> +    if ( ops->lseek )
> +        return ops->lseek(file, offset, whence);
> +
> +    switch(file->type) {
>  #ifdef CONFIG_BLKFRONT
>         case FTYPE_BLK:
>            break;
> @@ -392,28 +495,7 @@ off_t lseek(int fd, off_t offset, int whence)
>            return (off_t) -1;
>      }
>  
> -    switch (whence) {
> -       case SEEK_SET:
> -          files[fd].offset = offset;
> -          break;
> -       case SEEK_CUR:
> -          files[fd].offset += offset;
> -          break;
> -       case SEEK_END:
> -          {
> -             struct stat st;
> -             int ret;
> -             ret = fstat(fd, &st);
> -             if (ret)
> -                return -1;
> -             files[fd].offset = st.st_size + offset;
> -             break;
> -          }
> -       default:
> -          errno = EINVAL;
> -          return -1;
> -    }
> -    return files[fd].offset;
> +    return lseek_default(file, offset, whence);
>  }
>  
>  int fsync(int fd) {
> @@ -424,12 +506,21 @@ int fsync(int fd) {
>  int close(int fd)
>  {
>      int res = 0;
> +    struct file *file = get_file_from_fd(fd);
> +    const struct file_ops *ops;
>  
> -    if ( fd < 0 || fd >= ARRAY_SIZE(files) )
> +    if ( !file )
>          goto error;
>  
> +    ops = get_file_ops(file->type);
>      printk("close(%d)\n", fd);
> -    switch (files[fd].type) {
> +    if ( ops->close )
> +    {
> +        res = ops->close(file);
> +        goto out;
> +    }
> +
> +    switch (file->type) {
>          default:
>              break;
>  #ifdef CONFIG_XENBUS
> @@ -492,6 +583,7 @@ int close(int fd)
>              goto error;
>      }
>  
> + out:
>      memset(files + fd, 0, sizeof(struct file));
>      BUILD_BUG_ON(FTYPE_NONE != 0);
>  
> @@ -522,8 +614,19 @@ int stat(const char *path, struct stat *buf)
>  
>  int fstat(int fd, struct stat *buf)
>  {
> +    struct file *file = get_file_from_fd(fd);
> +    const struct file_ops *ops;
> +
> +    if ( !file )
> +        goto error;
> +
>      init_stat(buf);
> -    switch (files[fd].type) {
> +
> +    ops = get_file_ops(file->type);
> +    if ( ops->fstat )
> +        return ops->fstat(file, buf);
> +
> +    switch (file->type) {
>  	case FTYPE_SAVEFILE:
>  	case FTYPE_CONSOLE:
>  	case FTYPE_SOCKET: {
> @@ -557,6 +660,7 @@ int fstat(int fd, struct stat *buf)
>  	    break;
>      }
>  
> + error:
>      printk("statf(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
> @@ -588,6 +692,27 @@ int fcntl(int fd, int cmd, ...)
>  {
>      long arg;
>      va_list ap;
> +    int res;
> +    struct file *file = get_file_from_fd(fd);
> +    const struct file_ops *ops;
> +
> +    if ( !file )
> +    {
> +        errno = EBADF;
> +        return -1;
> +    }
> +
> +    ops = get_file_ops(files[fd].type);
> +
> +    if ( ops->fcntl )
> +    {
> +        va_start(ap, cmd);
> +        res = ops->fcntl(file, cmd, ap);
> +        va_end(ap);
> +
> +        return res;
> +    }
> +
>      va_start(ap, cmd);
>      arg = va_arg(ap, long);
>      va_end(ap);
> @@ -641,17 +766,28 @@ int closedir(DIR *dir)
>  /* We assume that only the main thread calls select(). */
>  
>  #if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
> -static const char file_types[] = {
> -    [FTYPE_NONE]	= 'N',
> -    [FTYPE_CONSOLE]	= 'C',
> -    [FTYPE_XENBUS]	= 'S',
> -    [FTYPE_EVTCHN]	= 'E',
> -    [FTYPE_SOCKET]	= 's',
> -    [FTYPE_TAP]		= 'T',
> -    [FTYPE_BLK]		= 'B',
> -    [FTYPE_KBD]		= 'K',
> -    [FTYPE_FB]		= 'G',
> +static const char *const file_types[] = {
> +    [FTYPE_NONE]    = "none",
> +    [FTYPE_CONSOLE] = "console",
> +    [FTYPE_XENBUS]  = "xenbus",
> +    [FTYPE_EVTCHN]  = "evtchn",
> +    [FTYPE_SOCKET]  = "socket",
> +    [FTYPE_TAP]     = "net",
> +    [FTYPE_BLK]     = "blk",
> +    [FTYPE_KBD]     = "kbd",
> +    [FTYPE_FB]      = "fb",
>  };
> +
> +static const char *get_type_name(unsigned int type)
> +{
> +    if ( type < ARRAY_SIZE(file_ops) && file_ops[type] )
> +        return file_ops[type]->name;
> +
> +    if ( type < ARRAY_SIZE(file_types) && file_types[type] )
> +        return file_types[type];
> +
> +    return "none";
> +}
>  #endif
>  #ifdef LIBC_DEBUG
>  static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout)
> @@ -663,7 +799,7 @@ static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
>  	if (FD_ISSET(i, set)) { \
>  	    if (comma) \
>  		printk(", "); \
> -	    printk("%d(%c)", i, file_types[files[i].type]); \
> +            printk("%d(%s)", i, get_type_name(files[i].type)); \
>  	    comma = 1; \
>  	} \
>      } \
> @@ -697,7 +833,7 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
>          fd = pfd[i].fd;
>          if (comma)
>              printk(", ");
> -        printk("%d(%c)/%02x", fd, file_types[files[fd].type],
> +        printk("%d(%s)/%02x", fd, get_type_name(files[fd].type),
>              pfd[i].events);
>              comma = 1;
>      }
> @@ -709,6 +845,16 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
>  #define dump_pollfds(pfds, nfds, timeout)
>  #endif
>  
> +bool select_yes(struct file *file)
> +{
> +    return true;
> +}
> +
> +bool select_read_flag(struct file *file)
> +{
> +    return file->read;
> +}
> +
>  /* Just poll without blocking */
>  static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds)
>  {
> @@ -760,11 +906,47 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  
>      /* Then see others as well. */
>      for (i = 0; i < nfds; i++) {
> -	switch(files[i].type) {
> +        struct file *file = get_file_from_fd(i);
> +
> +        if ( !file )
> +        {
> +            FD_CLR(i, readfds);
> +            FD_CLR(i, writefds);
> +            FD_CLR(i, exceptfds);
> +            continue;
> +        }
> +
> +        switch(file->type) {
>  	default:
> +        {
> +            const struct file_ops *ops = file_ops[file->type];
> +
> +            if ( ops )
> +            {
> +                if ( FD_ISSET(i, readfds) )
> +                {
> +                    if ( ops->select_rd && ops->select_rd(file) )
> +                        n++;
> +                    else
> +                        FD_CLR(i, readfds);
> +                }
> +                if ( FD_ISSET(i, writefds) )
> +                {
> +                    if ( ops->select_wr && ops->select_wr(file) )
> +                        n++;
> +                    else
> +                        FD_CLR(i, writefds);
> +                }
> +                FD_CLR(i, exceptfds);
> +
> +                break;
> +            }
> +
>  	    if (FD_ISSET(i, readfds) || FD_ISSET(i, writefds) || FD_ISSET(i, exceptfds))
>  		printk("bogus fd %d in select\n", i);
>  	    /* Fallthrough.  */
> +        }
> +
>  	case FTYPE_CONSOLE:
>  	    if (FD_ISSET(i, readfds)) {
>                  if (xencons_ring_avail(files[i].dev))
> @@ -842,7 +1024,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	printk("%d(%d): ", nb, sock_n);
>  	for (i = 0; i < nfds; i++) {
>  	    if (nbread[i] || nbwrite[i] || nbexcept[i])
> -		printk(" %d(%c):", i, file_types[files[i].type]);
> +                printk(" %d(%c):", i, get_type_name(files[i].type));
>  	    if (nbread[i])
>  	    	printk(" %dR", nbread[i]);
>  	    if (nbwrite[i])
> -- 
> 2.26.2
> 

-- 
Samuel
* D a decide de peter un cable dans son rapport de pfp
<c> et il a bien raison ;-)
<c> tu vas dire quoi ?
<D> j'ai mis les paroles de "le coq est mort" en en-tete
 -+- #ens-mim et la peufeupeu -+-

