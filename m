Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35B48B823
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256093.439290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NYQ-0006xC-2q; Tue, 11 Jan 2022 20:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256093.439290; Tue, 11 Jan 2022 20:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NYP-0006s6-VX; Tue, 11 Jan 2022 20:15:37 +0000
Received: by outflank-mailman (input) for mailman id 256093;
 Tue, 11 Jan 2022 20:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7NYO-0006rb-11
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:15:36 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aafe26c-731b-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:15:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 850A9261;
 Tue, 11 Jan 2022 21:15:32 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xM-gHFQcF9N5; Tue, 11 Jan 2022 21:15:31 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 5B9BF140;
 Tue, 11 Jan 2022 21:15:31 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7NYI-00FFRz-Dt;
 Tue, 11 Jan 2022 21:15:30 +0100
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
X-Inumbo-ID: 3aafe26c-731b-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:15:30 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 05/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in tpmfront
Message-ID: <20220111201530.7aa5m6s43tgntjbk@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-6-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 850A9261
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

Juergen Gross, le mar. 11 janv. 2022 16:12:08 +0100, a ecrit:
> Allocate a file type dynamically via alloc_file_type().
> 
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>


modulo the int fd / file * thing,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>


> ---
>  include/lib.h      |   3 +-
>  include/tpmfront.h |   5 ---
>  lib/sys.c          |  23 -----------
>  tpmfront.c         | 100 ++++++++++++++++++++++++++++++++-------------
>  4 files changed, 72 insertions(+), 59 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index d94d142..f6478de 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -165,8 +165,7 @@ void sanity_check(void);
>  #define FTYPE_KBD        7
>  #define FTYPE_TAP        8
>  #define FTYPE_BLK        9
> -#define FTYPE_TPMFRONT  10
> -#define FTYPE_N         11
> +#define FTYPE_N         10
>  #define FTYPE_SPARE     16
>  
>  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> diff --git a/include/tpmfront.h b/include/tpmfront.h
> index b7da50e..a527371 100644
> --- a/include/tpmfront.h
> +++ b/include/tpmfront.h
> @@ -81,7 +81,6 @@ int tpmfront_cmd(struct tpmfront_dev* dev, uint8_t* req, size_t reqlen, uint8_t*
>  int tpmfront_set_locality(struct tpmfront_dev* dev, int locality);
>  
>  #ifdef HAVE_LIBC
> -#include <sys/stat.h>
>  /* POSIX IO functions:
>   * use tpmfront_open() to get a file descriptor to the tpm device
>   * use write() on the fd to send a command to the backend. You must
> @@ -90,10 +89,6 @@ int tpmfront_set_locality(struct tpmfront_dev* dev, int locality);
>   * fstat() to get the size of the response and lseek() to seek on it.
>   */
>  int tpmfront_open(struct tpmfront_dev* dev);
> -int tpmfront_posix_read(int fd, uint8_t* buf, size_t count);
> -int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count);
> -int tpmfront_posix_fstat(int fd, struct stat* buf);
>  #endif
>  
> -
>  #endif
> diff --git a/lib/sys.c b/lib/sys.c
> index 4060b42..ff6be52 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -28,7 +28,6 @@
>  #include <netfront.h>
>  #include <blkfront.h>
>  #include <fbfront.h>
> -#include <tpmfront.h>
>  #include <xenbus.h>
>  #include <xenstore.h>
>  #include <poll.h>
> @@ -343,11 +342,6 @@ int read(int fd, void *buf, size_t nbytes)
>          case FTYPE_BLK: {
>  	    return blkfront_posix_read(fd, buf, nbytes);
>          }
> -#endif
> -#ifdef CONFIG_TPMFRONT
> -        case FTYPE_TPMFRONT: {
> -	    return tpmfront_posix_read(fd, buf, nbytes);
> -        }
>  #endif
>  	default:
>  	    break;
> @@ -389,10 +383,6 @@ int write(int fd, const void *buf, size_t nbytes)
>  #ifdef CONFIG_BLKFRONT
>  	case FTYPE_BLK:
>  	    return blkfront_posix_write(fd, buf, nbytes);
> -#endif
> -#ifdef CONFIG_TPMFRONT
> -	case FTYPE_TPMFRONT:
> -	    return tpmfront_posix_write(fd, buf, nbytes);
>  #endif
>  	default:
>  	    break;
> @@ -445,10 +435,6 @@ off_t lseek(int fd, off_t offset, int whence)
>  #ifdef CONFIG_BLKFRONT
>         case FTYPE_BLK:
>            break;
> -#endif
> -#ifdef CONFIG_TPMFRONT
> -       case FTYPE_TPMFRONT:
> -          break;
>  #endif
>         case FTYPE_FILE:
>            break;
> @@ -496,11 +482,6 @@ int close(int fd)
>              shutdown_blkfront(files[fd].dev);
>              break;
>  #endif
> -#ifdef CONFIG_TPMFRONT
> -	case FTYPE_TPMFRONT:
> -            shutdown_tpmfront(files[fd].dev);
> -            break;
> -#endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
>              shutdown_kbdfront(files[fd].dev);
> @@ -576,10 +557,6 @@ int fstat(int fd, struct stat *buf)
>  #ifdef CONFIG_BLKFRONT
>  	case FTYPE_BLK:
>  	   return blkfront_posix_fstat(fd, buf);
> -#endif
> -#ifdef CONFIG_TPMFRONT
> -	case FTYPE_TPMFRONT:
> -	   return tpmfront_posix_fstat(fd, buf);
>  #endif
>  	default:
>  	    break;
> diff --git a/tpmfront.c b/tpmfront.c
> index 0a2fefc..a19a052 100644
> --- a/tpmfront.c
> +++ b/tpmfront.c
> @@ -49,6 +49,10 @@
>  void tpmfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data) {
>     struct tpmfront_dev* dev = (struct tpmfront_dev*) data;
>     tpmif_shared_page_t *shr = dev->page;
> +#ifdef HAVE_LIBC
> +    struct file *file = get_file_from_fd(dev->fd);
> +#endif
> +
>     /*If we get a response when we didnt make a request, just ignore it */
>     if(!dev->waiting) {
>        return;
> @@ -65,8 +69,9 @@ void tpmfront_handler(evtchn_port_t port, struct pt_regs *regs, void *data) {
>  
>     dev->waiting = 0;
>  #ifdef HAVE_LIBC
> -   if(dev->fd >= 0) {
> -      files[dev->fd].read = true;
> +   if ( file )
> +   {
> +      file->read = true;
>     }
>  #endif
>     wake_up(&dev->waitq);
> @@ -405,6 +410,10 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
>  #ifdef TPMFRONT_PRINT_DEBUG
>     int i;
>  #endif
> +#ifdef HAVE_LIBC
> +    struct file *file = dev ? get_file_from_fd(dev->fd) : NULL;
> +#endif
> +
>     /* Error Checking */
>     if(dev == NULL || dev->state != XenbusStateConnected) {
>        TPMFRONT_ERR("Tried to send message through disconnected frontend\n");
> @@ -437,9 +446,10 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
>     dev->waiting = 1;
>     dev->resplen = 0;
>  #ifdef HAVE_LIBC
> -   if(dev->fd >= 0) {
> -      files[dev->fd].read = false;
> -      files[dev->fd].offset = 0;
> +   if ( file )
> +   {
> +      file->read = false;
> +      file->offset = 0;
>        dev->respgot = false;
>     }
>  #endif
> @@ -529,25 +539,14 @@ int tpmfront_set_locality(struct tpmfront_dev* dev, int locality)
>  
>  #ifdef HAVE_LIBC
>  #include <errno.h>
> -int tpmfront_open(struct tpmfront_dev* dev)
> -{
> -   /* Silently prevent multiple opens */
> -   if(dev->fd != -1) {
> -      return dev->fd;
> -   }
>  
> -   dev->fd = alloc_fd(FTYPE_TPMFRONT);
> -   printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
> -   files[dev->fd].dev = dev;
> -   dev->respgot = false;
> -   return dev->fd;
> -}
> -
> -int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count)
> +static int tpmfront_posix_write(int fd, const void *buf, size_t count)
>  {
>     int rc;
>     struct tpmfront_dev* dev;
> -   dev = files[fd].dev;
> +   struct file *file = get_file_from_fd(fd);
> +
> +   dev = file->dev;
>  
>     if(count == 0) {
>        return 0;
> @@ -566,14 +565,15 @@ int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count)
>     return count;
>  }
>  
> -int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
> +static int tpmfront_posix_read(int fd, void *buf, size_t count)
>  {
>     int rc;
>     uint8_t* dummybuf;
>     size_t dummysz;
>     struct tpmfront_dev* dev;
> +   struct file *file = get_file_from_fd(fd);
>  
> -   dev = files[fd].dev;
> +   dev = file->dev;
>  
>     if(count == 0) {
>        return 0;
> @@ -588,29 +588,33 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
>     }
>  
>     /* handle EOF case */
> -   if(files[dev->fd].offset >= dev->resplen) {
> +   if ( file->offset >= dev->resplen )
> +   {
>        return 0;
>     }
>  
>     /* Compute the number of bytes and do the copy operation */
> -   if((rc = min(count, dev->resplen - files[dev->fd].offset)) != 0) {
> -      memcpy(buf, dev->respbuf + files[dev->fd].offset, rc);
> -      files[dev->fd].offset += rc;
> +   if ( (rc = min(count, dev->resplen - file->offset)) != 0 )
> +   {
> +      memcpy(buf, dev->respbuf + file->offset, rc);
> +      file->offset += rc;
>     }
>  
>     return rc;
>  }
>  
> -int tpmfront_posix_fstat(int fd, struct stat* buf)
> +static int tpmfront_posix_fstat(int fd, struct stat *buf)
>  {
>     uint8_t* dummybuf;
>     size_t dummysz;
>     int rc;
> -   struct tpmfront_dev* dev = files[fd].dev;
> +   struct file *file = get_file_from_fd(fd);
> +   struct tpmfront_dev* dev = file->dev;
>  
>     /* If we have a response waiting, then read it now from the backend
>      * so we can get its length*/
> -   if(dev->waiting || (files[dev->fd].read && !dev->respgot)) {
> +   if ( dev->waiting || (file->read && !dev->respgot) )
> +   {
>        if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
>  	 errno = EIO;
>  	 return -1;
> @@ -626,5 +630,43 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
>     return 0;
>  }
>  
> +static int tpmfront_close_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    shutdown_tpmfront(file->dev);
> +
> +    return 0;
> +}
> +
> +static struct file_ops tpmfront_ops = {
> +    .name = "tpmfront",
> +    .read = tpmfront_posix_read,
> +    .write = tpmfront_posix_write,
> +    .lseek = lseek_default,
> +    .close = tpmfront_close_fd,
> +    .fstat = tpmfront_posix_fstat,
> +};
> +
> +int tpmfront_open(struct tpmfront_dev* dev)
> +{
> +   struct file *file;
> +   static unsigned int ftype_tpmfront;
> +
> +   /* Silently prevent multiple opens */
> +   if(dev->fd != -1) {
> +      return dev->fd;
> +   }
> +
> +   if ( !ftype_tpmfront )
> +       ftype_tpmfront = alloc_file_type(&tpmfront_ops);
> +
> +   dev->fd = alloc_fd(ftype_tpmfront);
> +   printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
> +   file = get_file_from_fd(dev->fd);
> +   file->dev = dev;
> +   dev->respgot = false;
> +   return dev->fd;
> +}
>  
>  #endif
> -- 
> 2.26.2
> 

-- 
Samuel
"...very few phenomena can pull someone out of Deep Hack Mode, with two
noted exceptions: being struck by lightning, or worse, your *computer*
being struck by lightning."
(By Matt Welsh)

