Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD1488744
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255009.437024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N28-0008IJ-91; Sun, 09 Jan 2022 01:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255009.437024; Sun, 09 Jan 2022 01:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N28-0008Fg-5q; Sun, 09 Jan 2022 01:30:08 +0000
Received: by outflank-mailman (input) for mailman id 255009;
 Sun, 09 Jan 2022 01:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N25-0007T5-SC
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:30:05 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6f19c2-70eb-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:30:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 910F1346;
 Sun,  9 Jan 2022 02:30:03 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQj1Z03I4Q9A; Sun,  9 Jan 2022 02:30:03 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8D423331;
 Sun,  9 Jan 2022 02:30:02 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N21-006iSb-TU;
 Sun, 09 Jan 2022 02:30:01 +0100
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
X-Inumbo-ID: ab6f19c2-70eb-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:30:01 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 11/15] mini-os: move tpm respgot member of struct file to
 device specific data
Message-ID: <20220109013001.ba7i73tay366ipxg@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-12-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 910F1346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:37 +0100, a ecrit:
> Tpmfront has a "respgot" flag in struct file, which can be moved to the
> device specific data. While at it make it a bool.
> 
> The respgot flag of the tpm_tis member of struct file can be removed,
> as it is never read.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h      |  2 --
>  include/tpmfront.h |  2 ++
>  tpm_tis.c          |  2 --
>  tpmfront.c         | 10 +++++-----
>  4 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index f2a124e..d740065 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -196,13 +196,11 @@ struct file {
>  #ifdef CONFIG_TPMFRONT
>  	struct {
>  	   struct tpmfront_dev *dev;
> -	   int respgot;
>  	} tpmfront;
>  #endif
>  #ifdef CONFIG_TPM_TIS
>  	struct {
>  	   struct tpm_chip *dev;
> -	   int respgot;
>  	} tpm_tis;
>  #endif
>  #ifdef CONFIG_XENBUS
> diff --git a/include/tpmfront.h b/include/tpmfront.h
> index c489fae..b7da50e 100644
> --- a/include/tpmfront.h
> +++ b/include/tpmfront.h
> @@ -25,6 +25,7 @@
>  #ifndef TPMFRONT_H
>  #define TPMFRONT_H
>  
> +#include <stdbool.h>
>  #include <mini-os/types.h>
>  #include <mini-os/os.h>
>  #include <mini-os/events.h>
> @@ -53,6 +54,7 @@ struct tpmfront_dev {
>  
>  #ifdef HAVE_LIBC
>     int fd;
> +   bool respgot;
>  #endif
>  
>  };
> diff --git a/tpm_tis.c b/tpm_tis.c
> index 8a632b1..4127118 100644
> --- a/tpm_tis.c
> +++ b/tpm_tis.c
> @@ -846,7 +846,6 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
>  #ifdef HAVE_LIBC
>     if(tpm->fd >= 0) {
>        files[tpm->fd].read = false;
> -      files[tpm->fd].tpm_tis.respgot = 0;
>        files[tpm->fd].offset = 0;
>     }
>  #endif
> @@ -1290,7 +1289,6 @@ int tpm_tis_open(struct tpm_chip* tpm)
>     tpm->fd = alloc_fd(FTYPE_TPM_TIS);
>     printk("tpm_tis_open() -> %d\n", tpm->fd);
>     files[tpm->fd].tpm_tis.dev = tpm;
> -   files[tpm->fd].tpm_tis.respgot = 0;
>     return tpm->fd;
>  }
>  
> diff --git a/tpmfront.c b/tpmfront.c
> index 8b2a910..be671c2 100644
> --- a/tpmfront.c
> +++ b/tpmfront.c
> @@ -439,8 +439,8 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
>  #ifdef HAVE_LIBC
>     if(dev->fd >= 0) {
>        files[dev->fd].read = false;
> -      files[dev->fd].tpmfront.respgot = 0;
>        files[dev->fd].offset = 0;
> +      dev->respgot = false;
>     }
>  #endif
>     wmb();
> @@ -499,7 +499,7 @@ int i;
>  #endif
>  #ifdef HAVE_LIBC
>     if(dev->fd >= 0) {
> -      files[dev->fd].tpmfront.respgot = 1;
> +      dev->respgot = true;
>     }
>  #endif
>  quit:
> @@ -539,7 +539,7 @@ int tpmfront_open(struct tpmfront_dev* dev)
>     dev->fd = alloc_fd(FTYPE_TPMFRONT);
>     printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
>     files[dev->fd].tpmfront.dev = dev;
> -   files[dev->fd].tpmfront.respgot = 0;
> +   dev->respgot = false;
>     return dev->fd;
>  }
>  
> @@ -580,7 +580,7 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
>     }
>  
>     /* get the response if we haven't already */
> -   if(files[dev->fd].tpmfront.respgot == 0) {
> +   if (!dev->respgot) {
>        if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
>  	 errno = EIO;
>  	 return -1;
> @@ -610,7 +610,7 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
>  
>     /* If we have a response waiting, then read it now from the backend
>      * so we can get its length*/
> -   if(dev->waiting || (files[dev->fd].read && !files[dev->fd].tpmfront.respgot)) {
> +   if(dev->waiting || (files[dev->fd].read && !dev->respgot)) {
>        if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
>  	 errno = EIO;
>  	 return -1;
> -- 
> 2.26.2
> 

-- 
Samuel
I am the "ILOVEGNU" signature virus. Just copy me to your signature.
This email was infected under the terms of the GNU General Public License.

