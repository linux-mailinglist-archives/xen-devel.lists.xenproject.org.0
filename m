Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16948872F
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254967.436899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6MvU-00023D-SY; Sun, 09 Jan 2022 01:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254967.436899; Sun, 09 Jan 2022 01:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6MvU-00020p-PL; Sun, 09 Jan 2022 01:23:16 +0000
Received: by outflank-mailman (input) for mailman id 254967;
 Sun, 09 Jan 2022 01:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6MvT-00020e-8L
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:23:15 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b711d1c4-70ea-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:23:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 851FA3A7;
 Sun,  9 Jan 2022 02:23:13 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pqr1WHjmhjWY; Sun,  9 Jan 2022 02:23:12 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 4090E331;
 Sun,  9 Jan 2022 02:23:12 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6MvP-006iIv-Eq;
 Sun, 09 Jan 2022 02:23:11 +0100
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
X-Inumbo-ID: b711d1c4-70ea-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:23:11 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 03/15] mini-os: make offset a common struct file member
 for all types
Message-ID: <20220109012311.hzqr2pganyngte5b@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 851FA3A7
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:29 +0100, a ecrit:
> Currently 4 file types have an offset member in their private struct
> file part. Make offset a common struct member shared by all file types.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  blkfront.c    |  5 ++---
>  include/lib.h |  5 +----
>  lib/sys.c     | 14 +++++---------
>  tpm_tis.c     | 11 +++++------
>  tpmfront.c    | 11 +++++------
>  5 files changed, 18 insertions(+), 28 deletions(-)
> 
> diff --git a/blkfront.c b/blkfront.c
> index 7c8eb74..8137106 100644
> --- a/blkfront.c
> +++ b/blkfront.c
> @@ -563,14 +563,13 @@ int blkfront_open(struct blkfront_dev *dev)
>      dev->fd = alloc_fd(FTYPE_BLK);
>      printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
>      files[dev->fd].blk.dev = dev;
> -    files[dev->fd].blk.offset = 0;
>      return dev->fd;
>  }
>  
>  int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
>  {
>     struct blkfront_dev* dev = files[fd].blk.dev;
> -   off_t offset = files[fd].blk.offset;
> +   off_t offset = files[fd].offset;
>     struct blkfront_aiocb aiocb;
>     unsigned long long disksize = dev->info.sectors * dev->info.sector_size;
>     unsigned int blocksize = dev->info.sector_size;
> @@ -712,7 +711,7 @@ int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
>     }
>  
>     free(copybuf);
> -   files[fd].blk.offset += rc;
> +   files[fd].offset += rc;
>     return rc;
>  
>  }
> diff --git a/include/lib.h b/include/lib.h
> index df2de9e..4d9b14b 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -185,6 +185,7 @@ struct evtchn_port_info {
>  struct file {
>      enum fd_type type;
>      bool read;	/* maybe available for read */
> +    off_t offset;
>      union {
>  	struct {
>              /* lwIP fd */
> @@ -193,7 +194,6 @@ struct file {
>  	struct {
>              /* FS import fd */
>  	    int fd;
> -	    off_t offset;
>  	} file;
>  	struct {
>  	    struct evtchn_port_list ports;
> @@ -204,7 +204,6 @@ struct file {
>  	} tap;
>  	struct {
>  	    struct blkfront_dev *dev;
> -            off_t offset;
>  	} blk;
>  	struct {
>  	    struct kbdfront_dev *dev;
> @@ -219,14 +218,12 @@ struct file {
>  	struct {
>  	   struct tpmfront_dev *dev;
>  	   int respgot;
> -	   off_t offset;
>  	} tpmfront;
>  #endif
>  #ifdef CONFIG_TPM_TIS
>  	struct {
>  	   struct tpm_chip *dev;
>  	   int respgot;
> -	   off_t offset;
>  	} tpm_tis;
>  #endif
>  #ifdef CONFIG_XENBUS
> diff --git a/lib/sys.c b/lib/sys.c
> index e8d5eb2..e1cea70 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -107,6 +107,7 @@ int alloc_fd(enum fd_type type)
>      for (i=0; i<NOFILE; i++) {
>  	if (files[i].type == FTYPE_NONE) {
>  	    files[i].type = type;
> +            files[i].offset = 0;
>  	    pthread_mutex_unlock(&fd_lock);
>  	    return i;
>  	}
> @@ -363,25 +364,20 @@ int write(int fd, const void *buf, size_t nbytes)
>  
>  off_t lseek(int fd, off_t offset, int whence)
>  {
> -    off_t* target = NULL;
>      switch(files[fd].type) {
>  #ifdef CONFIG_BLKFRONT
>         case FTYPE_BLK:
> -          target = &files[fd].blk.offset;
>            break;
>  #endif
>  #ifdef CONFIG_TPMFRONT
>         case FTYPE_TPMFRONT:
> -          target = &files[fd].tpmfront.offset;
>            break;
>  #endif
>  #ifdef CONFIG_TPM_TIS
>         case FTYPE_TPM_TIS:
> -          target = &files[fd].tpm_tis.offset;
>            break;
>  #endif
>         case FTYPE_FILE:
> -          target = &files[fd].file.offset;
>            break;
>         default:
>            /* Not implemented for this filetype */
> @@ -391,10 +387,10 @@ off_t lseek(int fd, off_t offset, int whence)
>  
>      switch (whence) {
>         case SEEK_SET:
> -          *target = offset;
> +          files[fd].offset = offset;
>            break;
>         case SEEK_CUR:
> -          *target += offset;
> +          files[fd].offset += offset;
>            break;
>         case SEEK_END:
>            {
> @@ -403,14 +399,14 @@ off_t lseek(int fd, off_t offset, int whence)
>               ret = fstat(fd, &st);
>               if (ret)
>                  return -1;
> -             *target = st.st_size + offset;
> +             files[fd].offset = st.st_size + offset;
>               break;
>            }
>         default:
>            errno = EINVAL;
>            return -1;
>      }
> -    return *target;
> +    return files[fd].offset;
>  }
>  
>  int fsync(int fd) {
> diff --git a/tpm_tis.c b/tpm_tis.c
> index 4a51027..8a632b1 100644
> --- a/tpm_tis.c
> +++ b/tpm_tis.c
> @@ -847,7 +847,7 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
>     if(tpm->fd >= 0) {
>        files[tpm->fd].read = false;
>        files[tpm->fd].tpm_tis.respgot = 0;
> -      files[tpm->fd].tpm_tis.offset = 0;
> +      files[tpm->fd].offset = 0;
>     }
>  #endif
>     return len;
> @@ -1290,7 +1290,6 @@ int tpm_tis_open(struct tpm_chip* tpm)
>     tpm->fd = alloc_fd(FTYPE_TPM_TIS);
>     printk("tpm_tis_open() -> %d\n", tpm->fd);
>     files[tpm->fd].tpm_tis.dev = tpm;
> -   files[tpm->fd].tpm_tis.offset = 0;
>     files[tpm->fd].tpm_tis.respgot = 0;
>     return tpm->fd;
>  }
> @@ -1340,13 +1339,13 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
>  
>  
>     /* Handle EOF case */
> -   if(files[fd].tpm_tis.offset >= tpm->data_len) {
> +   if(files[fd].offset >= tpm->data_len) {
>        rc = 0;
>     } else {
> -      rc = min(tpm->data_len - files[fd].tpm_tis.offset, count);
> -      memcpy(buf, tpm->data_buffer + files[fd].tpm_tis.offset, rc);
> +      rc = min(tpm->data_len - files[fd].offset, count);
> +      memcpy(buf, tpm->data_buffer + files[fd].offset, rc);
>     }
> -   files[fd].tpm_tis.offset += rc;
> +   files[fd].offset += rc;
>     /* Reset the data pending flag */
>     return rc;
>  }
> diff --git a/tpmfront.c b/tpmfront.c
> index d825b49..8b2a910 100644
> --- a/tpmfront.c
> +++ b/tpmfront.c
> @@ -440,7 +440,7 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
>     if(dev->fd >= 0) {
>        files[dev->fd].read = false;
>        files[dev->fd].tpmfront.respgot = 0;
> -      files[dev->fd].tpmfront.offset = 0;
> +      files[dev->fd].offset = 0;
>     }
>  #endif
>     wmb();
> @@ -539,7 +539,6 @@ int tpmfront_open(struct tpmfront_dev* dev)
>     dev->fd = alloc_fd(FTYPE_TPMFRONT);
>     printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
>     files[dev->fd].tpmfront.dev = dev;
> -   files[dev->fd].tpmfront.offset = 0;
>     files[dev->fd].tpmfront.respgot = 0;
>     return dev->fd;
>  }
> @@ -589,14 +588,14 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
>     }
>  
>     /* handle EOF case */
> -   if(files[dev->fd].tpmfront.offset >= dev->resplen) {
> +   if(files[dev->fd].offset >= dev->resplen) {
>        return 0;
>     }
>  
>     /* Compute the number of bytes and do the copy operation */
> -   if((rc = min(count, dev->resplen - files[dev->fd].tpmfront.offset)) != 0) {
> -      memcpy(buf, dev->respbuf + files[dev->fd].tpmfront.offset, rc);
> -      files[dev->fd].tpmfront.offset += rc;
> +   if((rc = min(count, dev->resplen - files[dev->fd].offset)) != 0) {
> +      memcpy(buf, dev->respbuf + files[dev->fd].offset, rc);
> +      files[dev->fd].offset += rc;
>     }
>  
>     return rc;
> -- 
> 2.26.2
> 

-- 
Samuel
`When you say "I wrote a program that crashed Windows", people just stare at
you blankly and say "Hey, I got those with the system, *for free*".'
(By Linus Torvalds)

