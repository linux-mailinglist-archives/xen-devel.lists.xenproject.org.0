Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E248FEEB
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257965.443685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CZM-0004E8-QH; Sun, 16 Jan 2022 20:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257965.443685; Sun, 16 Jan 2022 20:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CZM-0004AY-MW; Sun, 16 Jan 2022 20:56:08 +0000
Received: by outflank-mailman (input) for mailman id 257965;
 Sun, 16 Jan 2022 20:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CZL-0004AK-8S
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:56:07 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8ef6927-770e-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 21:56:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 967C618A;
 Sun, 16 Jan 2022 21:56:05 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkK-BXapKSIo; Sun, 16 Jan 2022 21:56:04 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6E41F8B;
 Sun, 16 Jan 2022 21:56:04 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CZH-005uei-NW;
 Sun, 16 Jan 2022 21:56:03 +0100
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
X-Inumbo-ID: b8ef6927-770e-11ec-9bbc-9dff3e4ee8c5
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:56:03 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 04/12] use alloc_file_type() and
 get_file_from_fd() in tpm_tis
Message-ID: <20220116205603.xscu3yb4wrjxubeu@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220116083328.26524-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 967C618A
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

Juergen Gross, le dim. 16 janv. 2022 09:33:20 +0100, a ecrit:
> Allocate a file type dynamically via alloc_file_type().
> 
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> Make some now local functions static and modify their prototypes to
> match the file_ops requirements.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - switch to struct file * parameter for callbacks
> - use __attribute__((constructor))
> ---
>  include/lib.h     |   3 +-
>  include/tpm_tis.h |   6 ---
>  lib/sys.c         |  23 ---------
>  tpm_tis.c         | 121 +++++++++++++++++++++++++++++-----------------
>  4 files changed, 78 insertions(+), 75 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index c5e47786..9dfb4689 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -168,8 +168,7 @@ extern struct wait_queue_head event_queue;
>  #define FTYPE_TAP        8
>  #define FTYPE_BLK        9
>  #define FTYPE_TPMFRONT  10
> -#define FTYPE_TPM_TIS   11
> -#define FTYPE_N         12
> +#define FTYPE_N         11
>  #define FTYPE_SPARE     16
>  
>  struct file {
> diff --git a/include/tpm_tis.h b/include/tpm_tis.h
> index 86e83f13..2af974db 100644
> --- a/include/tpm_tis.h
> +++ b/include/tpm_tis.h
> @@ -37,14 +37,11 @@ struct tpm_chip;
>  
>  struct tpm_chip* init_tpm_tis(unsigned long baseaddr, int localities, unsigned int irq);
>  struct tpm_chip* init_tpm2_tis(unsigned long baseaddr, int localities, unsigned int irq);
> -void shutdown_tpm_tis(struct tpm_chip* tpm);
>  
>  int tpm_tis_request_locality(struct tpm_chip* tpm, int locality);
>  int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** resp, size_t* resplen);
>  
>  #ifdef HAVE_LIBC
> -#include <sys/stat.h>
> -#include <fcntl.h>
>  /* POSIX IO functions:
>   * use tpm_tis_open() to get a file descriptor to the tpm device
>   * use write() on the fd to send a command to the backend. You must
> @@ -53,9 +50,6 @@ int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** res
>   * fstat() to get the size of the response and lseek() to seek on it.
>   */
>  int tpm_tis_open(struct tpm_chip* tpm);
> -int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count);
> -int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count);
> -int tpm_tis_posix_fstat(int fd, struct stat* buf);
>  #endif
>  
>  #endif
> diff --git a/lib/sys.c b/lib/sys.c
> index 53870aa4..2fc81f20 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -29,7 +29,6 @@
>  #include <blkfront.h>
>  #include <fbfront.h>
>  #include <tpmfront.h>
> -#include <tpm_tis.h>
>  #include <xenbus.h>
>  #include <xenstore.h>
>  #include <poll.h>
> @@ -355,11 +354,6 @@ int read(int fd, void *buf, size_t nbytes)
>          case FTYPE_TPMFRONT: {
>  	    return tpmfront_posix_read(fd, buf, nbytes);
>          }
> -#endif
> -#ifdef CONFIG_TPM_TIS
> -        case FTYPE_TPM_TIS: {
> -	    return tpm_tis_posix_read(fd, buf, nbytes);
> -        }
>  #endif
>  	default:
>  	    break;
> @@ -412,10 +406,6 @@ int write(int fd, const void *buf, size_t nbytes)
>  #ifdef CONFIG_TPMFRONT
>  	case FTYPE_TPMFRONT:
>  	    return tpmfront_posix_write(fd, buf, nbytes);
> -#endif
> -#ifdef CONFIG_TPM_TIS
> -	case FTYPE_TPM_TIS:
> -	    return tpm_tis_posix_write(fd, buf, nbytes);
>  #endif
>  	default:
>  	    break;
> @@ -482,10 +472,6 @@ off_t lseek(int fd, off_t offset, int whence)
>  #ifdef CONFIG_TPMFRONT
>         case FTYPE_TPMFRONT:
>            break;
> -#endif
> -#ifdef CONFIG_TPM_TIS
> -       case FTYPE_TPM_TIS:
> -          break;
>  #endif
>         case FTYPE_FILE:
>            break;
> @@ -543,11 +529,6 @@ int close(int fd)
>              shutdown_tpmfront(files[fd].dev);
>              break;
>  #endif
> -#ifdef CONFIG_TPM_TIS
> -	case FTYPE_TPM_TIS:
> -            shutdown_tpm_tis(files[fd].dev);
> -            break;
> -#endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
>              shutdown_kbdfront(files[fd].dev);
> @@ -636,10 +617,6 @@ int fstat(int fd, struct stat *buf)
>  #ifdef CONFIG_TPMFRONT
>  	case FTYPE_TPMFRONT:
>  	   return tpmfront_posix_fstat(fd, buf);
> -#endif
> -#ifdef CONFIG_TPM_TIS
> -	case FTYPE_TPM_TIS:
> -	   return tpm_tis_posix_fstat(fd, buf);
>  #endif
>  	default:
>  	    break;
> diff --git a/tpm_tis.c b/tpm_tis.c
> index 477f5550..b88ec874 100644
> --- a/tpm_tis.c
> +++ b/tpm_tis.c
> @@ -792,6 +792,9 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
>     int status, burstcnt = 0;
>     int count = 0;
>     uint32_t ordinal;
> +#ifdef HAVE_LIBC
> +   struct file *file = get_file_from_fd(tpm->fd);
> +#endif
>  
>     if(tpm_tis_request_locality(tpm, tpm->locality) < 0) {
>        return -EBUSY;
> @@ -844,9 +847,10 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
>        }
>     }
>  #ifdef HAVE_LIBC
> -   if(tpm->fd >= 0) {
> -      files[tpm->fd].read = false;
> -      files[tpm->fd].offset = 0;
> +   if ( file )
> +   {
> +      file->read = false;
> +      file->offset = 0;
>     }
>  #endif
>     return len;
> @@ -1093,6 +1097,26 @@ ssize_t tpm_getcap(struct tpm_chip *chip, uint32_t subcap_id, cap_t *cap,
>          return rc;
>  }
>  
> +static void shutdown_tpm_tis(struct tpm_chip *tpm)
> +{
> +    int i;
> +
> +    printk("Shutting down tpm_tis device\n");
> +
> +    iowrite32(TPM_INT_ENABLE(tpm, tpm->locality), ~TPM_GLOBAL_INT_ENABLE);
> +
> +    /* Unmap all of the mmio pages */
> +    for ( i = 0; i < 5; ++i )
> +    {
> +        if ( tpm->pages[i] != NULL )
> +        {
> +            iounmap(tpm->pages[i], PAGE_SIZE);
> +            tpm->pages[i] = NULL;
> +        }
> +    }
> +    free(tpm);
> +    return;
> +}
>  
>  struct tpm_chip* init_tpm_tis(unsigned long baseaddr, int localities, unsigned int irq)
>  {
> @@ -1242,25 +1266,6 @@ abort_egress:
>     return NULL;
>  }
>  
> -void shutdown_tpm_tis(struct tpm_chip* tpm){
> -   int i;
> -
> -   printk("Shutting down tpm_tis device\n");
> -
> -   iowrite32(TPM_INT_ENABLE(tpm, tpm->locality), ~TPM_GLOBAL_INT_ENABLE);
> -
> -   /*Unmap all of the mmio pages */
> -   for(i = 0; i < 5; ++i) {
> -      if(tpm->pages[i] != NULL) {
> -	 iounmap(tpm->pages[i], PAGE_SIZE);
> -	 tpm->pages[i] = NULL;
> -      }
> -   }
> -   free(tpm);
> -   return;
> -}
> -
> -
>  int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** resp, size_t* resplen)
>  {
>     if(tpm->locality < 0) {
> @@ -1279,23 +1284,19 @@ int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** res
>  }
>  
>  #ifdef HAVE_LIBC
> -int tpm_tis_open(struct tpm_chip* tpm)
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +
> +static int tpm_tis_close(struct file *file)
>  {
> -   /* Silently prevent multiple opens */
> -   if(tpm->fd != -1) {
> -      return tpm->fd;
> -   }
> +    shutdown_tpm_tis(file->dev);
>  
> -   tpm->fd = alloc_fd(FTYPE_TPM_TIS);
> -   printk("tpm_tis_open() -> %d\n", tpm->fd);
> -   files[tpm->fd].dev = tpm;
> -   return tpm->fd;
> +    return 0;
>  }
>  
> -int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count)
> +static int tpm_tis_posix_write(struct file *file, const void *buf, size_t count)
>  {
> -   struct tpm_chip* tpm;
> -   tpm = files[fd].dev;
> +   struct tpm_chip *tpm = file->dev;
>  
>     if(tpm->locality < 0) {
>        printk("tpm_tis_posix_write() failed! locality not set!\n");
> @@ -1319,11 +1320,10 @@ int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count)
>     return count;
>  }
>  
> -int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
> +static int tpm_tis_posix_read(struct file *file, void *buf, size_t count)
>  {
>     int rc;
> -   struct tpm_chip* tpm;
> -   tpm = files[fd].dev;
> +   struct tpm_chip *tpm = file->dev;
>  
>     if(count == 0) {
>        return 0;
> @@ -1337,20 +1337,21 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
>  
>  
>     /* Handle EOF case */
> -   if(files[fd].offset >= tpm->data_len) {
> +   if ( file->offset >= tpm->data_len )
> +   {
>        rc = 0;
>     } else {
> -      rc = min(tpm->data_len - files[fd].offset, count);
> -      memcpy(buf, tpm->data_buffer + files[fd].offset, rc);
> +      rc = min(tpm->data_len - file->offset, count);
> +      memcpy(buf, tpm->data_buffer + file->offset, rc);
>     }
> -   files[fd].offset += rc;
> +   file->offset += rc;
>     /* Reset the data pending flag */
>     return rc;
>  }
> -int tpm_tis_posix_fstat(int fd, struct stat* buf)
> +
> +static int tpm_tis_posix_fstat(struct file *file, struct stat *buf)
>  {
> -   struct tpm_chip* tpm;
> -   tpm = files[fd].dev;
> +   struct tpm_chip *tpm = file->dev;
>  
>     buf->st_mode = O_RDWR;
>     buf->st_uid = 0;
> @@ -1360,6 +1361,38 @@ int tpm_tis_posix_fstat(int fd, struct stat* buf)
>     return 0;
>  }
>  
> +static const struct file_ops tpm_tis_ops = {
> +    .name = "tpm_tis",
> +    .read = tpm_tis_posix_read,
> +    .write = tpm_tis_posix_write,
> +    .lseek = lseek_default,
> +    .close = tpm_tis_close,
> +    .fstat = tpm_tis_posix_fstat,
> +};
> +
> +static unsigned int ftype_tis;
> +
> +__attribute__((constructor))
> +static void tpm_tis_initialize(void)
> +{
> +    ftype_tis = alloc_file_type(&tpm_tis_ops);
> +}
> +
> +int tpm_tis_open(struct tpm_chip *tpm)
> +{
> +    struct file *file;
> +
> +    /* Silently prevent multiple opens */
> +    if ( tpm->fd != -1 )
> +        return tpm->fd;
> +
> +    tpm->fd = alloc_fd(ftype_tis);
> +    printk("tpm_tis_open() -> %d\n", tpm->fd);
> +    file = get_file_from_fd(tpm->fd);
> +    file->dev = tpm;
> +    return tpm->fd;
> +}
> +
>  /* TPM 2.0 */
>  
>  /*TPM2.0 Selftest*/
> -- 
> 2.26.2
> 

-- 
Samuel
 > et sinon, quand on s'interesse a un media que l'on ne maitrise pas,
 > on essaye de le comprendre d'abord.
 (Suivi par l'intégralité du message initial de 45 lignes.)
 -+-BM in : GNU - La maîtrise est un long apprentissage petit scarabé -+-

