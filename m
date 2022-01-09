Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCA488745
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255015.437039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N2i-0000Sy-LM; Sun, 09 Jan 2022 01:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255015.437039; Sun, 09 Jan 2022 01:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N2i-0000R6-H1; Sun, 09 Jan 2022 01:30:44 +0000
Received: by outflank-mailman (input) for mailman id 255015;
 Sun, 09 Jan 2022 01:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N2h-000094-Jc
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:30:43 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1e083d3-70eb-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:30:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 3E5DD346;
 Sun,  9 Jan 2022 02:30:41 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPv3Ogv4G6aF; Sun,  9 Jan 2022 02:30:40 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C59D064;
 Sun,  9 Jan 2022 02:30:40 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N2e-006iTC-3h;
 Sun, 09 Jan 2022 02:30:40 +0100
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
X-Inumbo-ID: c1e083d3-70eb-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:30:40 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 12/15] mini-os: eliminate tpmfront union member in struct
 file
Message-ID: <20220109013040.rhljjzid44opt2fn@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-13-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-13-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 3E5DD346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:38 +0100, a ecrit:
> Replace the tpmfront specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h | 5 -----
>  lib/sys.c     | 2 +-
>  tpmfront.c    | 8 ++++----
>  3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index d740065..2ddc076 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -193,11 +193,6 @@ struct file {
>  	    struct evtchn_port_list ports;
>  	} evtchn;
>  	struct gntmap gntmap;
> -#ifdef CONFIG_TPMFRONT
> -	struct {
> -	   struct tpmfront_dev *dev;
> -	} tpmfront;
> -#endif
>  #ifdef CONFIG_TPM_TIS
>  	struct {
>  	   struct tpm_chip *dev;
> diff --git a/lib/sys.c b/lib/sys.c
> index b35e433..b042bf5 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -462,7 +462,7 @@ int close(int fd)
>  #endif
>  #ifdef CONFIG_TPMFRONT
>  	case FTYPE_TPMFRONT:
> -            shutdown_tpmfront(files[fd].tpmfront.dev);
> +            shutdown_tpmfront(files[fd].dev);
>  	    files[fd].type = FTYPE_NONE;
>  	    return 0;
>  #endif
> diff --git a/tpmfront.c b/tpmfront.c
> index be671c2..0a2fefc 100644
> --- a/tpmfront.c
> +++ b/tpmfront.c
> @@ -538,7 +538,7 @@ int tpmfront_open(struct tpmfront_dev* dev)
>  
>     dev->fd = alloc_fd(FTYPE_TPMFRONT);
>     printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
> -   files[dev->fd].tpmfront.dev = dev;
> +   files[dev->fd].dev = dev;
>     dev->respgot = false;
>     return dev->fd;
>  }
> @@ -547,7 +547,7 @@ int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count)
>  {
>     int rc;
>     struct tpmfront_dev* dev;
> -   dev = files[fd].tpmfront.dev;
> +   dev = files[fd].dev;
>  
>     if(count == 0) {
>        return 0;
> @@ -573,7 +573,7 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
>     size_t dummysz;
>     struct tpmfront_dev* dev;
>  
> -   dev = files[fd].tpmfront.dev;
> +   dev = files[fd].dev;
>  
>     if(count == 0) {
>        return 0;
> @@ -606,7 +606,7 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
>     uint8_t* dummybuf;
>     size_t dummysz;
>     int rc;
> -   struct tpmfront_dev* dev = files[fd].tpmfront.dev;
> +   struct tpmfront_dev* dev = files[fd].dev;
>  
>     /* If we have a response waiting, then read it now from the backend
>      * so we can get its length*/
> -- 
> 2.26.2
> 

-- 
Samuel
/* Halley */

	(Halley's comment.)

