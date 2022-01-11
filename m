Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1548B88C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256097.439301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ndc-0008Rz-RU; Tue, 11 Jan 2022 20:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256097.439301; Tue, 11 Jan 2022 20:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ndc-0008PF-N5; Tue, 11 Jan 2022 20:21:00 +0000
Received: by outflank-mailman (input) for mailman id 256097;
 Tue, 11 Jan 2022 20:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7Ndb-0008P4-27
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:20:59 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc222808-731b-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:20:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id C830E678;
 Tue, 11 Jan 2022 21:20:56 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxJ_vLkRyhCo; Tue, 11 Jan 2022 21:20:55 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 1F285140;
 Tue, 11 Jan 2022 21:20:55 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7NdV-00FFTM-TO;
 Tue, 11 Jan 2022 21:20:53 +0100
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
X-Inumbo-ID: fc222808-731b-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:20:53 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 06/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in blkfront
Message-ID: <20220111202053.ii2sahyqgictpfqd@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: C830E678
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

Juergen Gross, le mar. 11 janv. 2022 16:12:09 +0100, a ecrit:
> Allocate the file type dynamically via alloc_file_type().
> 
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

modulo the int fd / file * thing,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  blkfront.c         | 92 ++++++++++++++++++++++++++++++++++------------
>  include/blkfront.h |  5 ---
>  include/lib.h      |  3 +-
>  lib/sys.c          | 24 ------------
>  4 files changed, 69 insertions(+), 55 deletions(-)
> 
> diff --git a/blkfront.c b/blkfront.c
> index e3f42be..b7ea1d7 100644
> --- a/blkfront.c
> +++ b/blkfront.c
> @@ -59,10 +59,10 @@ void blkfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
>  {
>  #ifdef HAVE_LIBC
>      struct blkfront_dev *dev = data;
> -    int fd = dev->fd;
> +    struct file *file = get_file_from_fd(dev->fd);
>  
> -    if (fd != -1)
> -        files[fd].read = true;
> +    if ( file )
> +        file->read = true;
>  #endif
>      wake_up(&blkfront_queue);
>  }
> @@ -483,9 +483,13 @@ int blkfront_aio_poll(struct blkfront_dev *dev)
>  
>  moretodo:
>  #ifdef HAVE_LIBC
> -    if (dev->fd != -1) {
> -        files[dev->fd].read = false;
> -        mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
> +    {
> +        struct file *file = get_file_from_fd(dev->fd);
> +
> +        if ( file ) {
> +            file->read = false;
> +            mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
> +        }
>      }
>  #endif
>  
> @@ -554,22 +558,11 @@ moretodo:
>  }
>  
>  #ifdef HAVE_LIBC
> -int blkfront_open(struct blkfront_dev *dev)
> -{
> -    /* Silently prevent multiple opens */
> -    if(dev->fd != -1) {
> -       return dev->fd;
> -    }
> -    dev->fd = alloc_fd(FTYPE_BLK);
> -    printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
> -    files[dev->fd].dev = dev;
> -    return dev->fd;
> -}
> -
> -int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
> +static int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
>  {
> -   struct blkfront_dev* dev = files[fd].dev;
> -   off_t offset = files[fd].offset;
> +   struct file *file = get_file_from_fd(fd);
> +   struct blkfront_dev* dev = file->dev;
> +   off_t offset = file->offset;
>     struct blkfront_aiocb aiocb;
>     unsigned long long disksize = dev->info.sectors * dev->info.sector_size;
>     unsigned int blocksize = dev->info.sector_size;
> @@ -711,14 +704,25 @@ int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
>     }
>  
>     free(copybuf);
> -   files[fd].offset += rc;
> +   file->offset += rc;
>     return rc;
>  
>  }
>  
> -int blkfront_posix_fstat(int fd, struct stat* buf)
> +static int blkfront_posix_read(int fd, void *buf, size_t nbytes)
> +{
> +    return blkfront_posix_rwop(fd, buf, nbytes, 0);
> +}
> +
> +static int blkfront_posix_write(int fd, const void *buf, size_t nbytes)
>  {
> -   struct blkfront_dev* dev = files[fd].dev;
> +    return blkfront_posix_rwop(fd, (void *)buf, nbytes, 1);
> +}
> +
> +static int blkfront_posix_fstat(int fd, struct stat *buf)
> +{
> +   struct file *file = get_file_from_fd(fd);
> +   struct blkfront_dev* dev = file->dev;
>  
>     buf->st_mode = dev->info.mode;
>     buf->st_uid = 0;
> @@ -728,4 +732,44 @@ int blkfront_posix_fstat(int fd, struct stat* buf)
>  
>     return 0;
>  }
> +
> +static int blkfront_close_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    shutdown_blkfront(file->dev);
> +
> +    return 0;
> +}
> +
> +static struct file_ops blk_ops = {
> +    .name = "blk",
> +    .read = blkfront_posix_read,
> +    .write = blkfront_posix_write,
> +    .lseek = lseek_default,
> +    .close = blkfront_close_fd,
> +    .fstat = blkfront_posix_fstat,
> +    .select_rd = select_read_flag,
> +};
> +
> +int blkfront_open(struct blkfront_dev *dev)
> +{
> +    struct file *file;
> +    static unsigned int ftype_blk;
> +
> +    /* Silently prevent multiple opens */
> +    if(dev->fd != -1) {
> +       return dev->fd;
> +    }
> +
> +    if ( !ftype_blk )
> +        ftype_blk = alloc_file_type(&blk_ops);
> +
> +    dev->fd = alloc_fd(ftype_blk);
> +    printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
> +    file = get_file_from_fd(dev->fd);
> +    file->dev = dev;
> +
> +    return dev->fd;
> +}
>  #endif
> diff --git a/include/blkfront.h b/include/blkfront.h
> index 3528af9..7f84a0a 100644
> --- a/include/blkfront.h
> +++ b/include/blkfront.h
> @@ -28,17 +28,12 @@ struct blkfront_info
>  };
>  struct blkfront_dev *init_blkfront(char *nodename, struct blkfront_info *info);
>  #ifdef HAVE_LIBC
> -#include <sys/stat.h>
>  /* POSIX IO functions:
>   * use blkfront_open() to get a file descriptor to the block device
>   * Don't use the other blkfront posix functions here directly, instead use
>   * read(), write(), lseek() and fstat() on the file descriptor
>   */
>  int blkfront_open(struct blkfront_dev *dev);
> -int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write);
> -#define blkfront_posix_write(fd, buf, count) blkfront_posix_rwop(fd, (uint8_t*)buf, count, 1)
> -#define blkfront_posix_read(fd, buf, count) blkfront_posix_rwop(fd, (uint8_t*)buf, count, 0)
> -int blkfront_posix_fstat(int fd, struct stat* buf);
>  #endif
>  void blkfront_aio(struct blkfront_aiocb *aiocbp, int write);
>  #define blkfront_aio_read(aiocbp) blkfront_aio(aiocbp, 0)
> diff --git a/include/lib.h b/include/lib.h
> index f6478de..05f5083 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -164,8 +164,7 @@ void sanity_check(void);
>  #define FTYPE_FB         6
>  #define FTYPE_KBD        7
>  #define FTYPE_TAP        8
> -#define FTYPE_BLK        9
> -#define FTYPE_N         10
> +#define FTYPE_N          9
>  #define FTYPE_SPARE     16
>  
>  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> diff --git a/lib/sys.c b/lib/sys.c
> index ff6be52..f84fedd 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -337,11 +337,6 @@ int read(int fd, void *buf, size_t nbytes)
>  	    }
>  	    return ret * sizeof(union xenfb_in_event);
>          }
> -#endif
> -#ifdef CONFIG_BLKFRONT
> -        case FTYPE_BLK: {
> -	    return blkfront_posix_read(fd, buf, nbytes);
> -        }
>  #endif
>  	default:
>  	    break;
> @@ -379,10 +374,6 @@ int write(int fd, const void *buf, size_t nbytes)
>  	case FTYPE_TAP:
>  	    netfront_xmit(files[fd].dev, (void*) buf, nbytes);
>  	    return nbytes;
> -#endif
> -#ifdef CONFIG_BLKFRONT
> -	case FTYPE_BLK:
> -	    return blkfront_posix_write(fd, buf, nbytes);
>  #endif
>  	default:
>  	    break;
> @@ -432,10 +423,6 @@ off_t lseek(int fd, off_t offset, int whence)
>          return ops->lseek(fd, offset, whence);
>  
>      switch(files[fd].type) {
> -#ifdef CONFIG_BLKFRONT
> -       case FTYPE_BLK:
> -          break;
> -#endif
>         case FTYPE_FILE:
>            break;
>         default:
> @@ -477,11 +464,6 @@ int close(int fd)
>  	    shutdown_netfront(files[fd].dev);
>              break;
>  #endif
> -#ifdef CONFIG_BLKFRONT
> -	case FTYPE_BLK:
> -            shutdown_blkfront(files[fd].dev);
> -            break;
> -#endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
>              shutdown_kbdfront(files[fd].dev);
> @@ -554,10 +536,6 @@ int fstat(int fd, struct stat *buf)
>  	    buf->st_ctime = time(NULL);
>  	    return 0;
>  	}
> -#ifdef CONFIG_BLKFRONT
> -	case FTYPE_BLK:
> -	   return blkfront_posix_fstat(fd, buf);
> -#endif
>  	default:
>  	    break;
>      }
> @@ -663,7 +641,6 @@ static const char *file_types[] = {
>      [FTYPE_CONSOLE] = "console",
>      [FTYPE_SOCKET]  = "socket",
>      [FTYPE_TAP]     = "net",
> -    [FTYPE_BLK]     = "blk",
>      [FTYPE_KBD]     = "kbd",
>      [FTYPE_FB]      = "fb",
>  };
> @@ -841,7 +818,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	    FD_CLR(i, exceptfds);
>  	    break;
>  	case FTYPE_TAP:
> -	case FTYPE_BLK:
>  	case FTYPE_KBD:
>  	case FTYPE_FB:
>  	    if (FD_ISSET(i, readfds)) {
> -- 
> 2.26.2
> 

-- 
Samuel
gawk; talk; nice; date; wine; grep; touch; unzip; strip;  \
touch; gasp; finger; gasp; lyx; gasp; latex; mount; fsck; \
more; yes; gasp; umount; make clean; make mrproper; sleep

