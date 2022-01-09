Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72456488739
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254997.437005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N0p-0006eq-NN; Sun, 09 Jan 2022 01:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254997.437005; Sun, 09 Jan 2022 01:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N0p-0006cb-Ht; Sun, 09 Jan 2022 01:28:47 +0000
Received: by outflank-mailman (input) for mailman id 254997;
 Sun, 09 Jan 2022 01:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N0o-0005IG-4z
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:28:46 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c58fb31-70eb-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:28:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 910C2346;
 Sun,  9 Jan 2022 02:28:44 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3G50eid9-Hwv; Sun,  9 Jan 2022 02:28:43 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 7235964;
 Sun,  9 Jan 2022 02:28:43 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N0k-006iRq-QN;
 Sun, 09 Jan 2022 02:28:42 +0100
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
X-Inumbo-ID: 7c58fb31-70eb-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:28:42 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 10/15] mini-os: eliminate netfront union member in struct
 file
Message-ID: <20220109012842.6zdw7z6jbh52kd7a@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-11-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220106115741.3219-11-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 910C2346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:36 +0100, a ecrit:
> Replace the netfront specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h | 3 ---
>  lib/sys.c     | 6 +++---
>  netfront.c    | 2 +-
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 5201ed7..f2a124e 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -193,9 +193,6 @@ struct file {
>  	    struct evtchn_port_list ports;
>  	} evtchn;
>  	struct gntmap gntmap;
> -	struct {
> -	    struct netfront_dev *dev;
> -	} tap;
>  #ifdef CONFIG_TPMFRONT
>  	struct {
>  	   struct tpmfront_dev *dev;
> diff --git a/lib/sys.c b/lib/sys.c
> index 8c7ea3c..b35e433 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -263,7 +263,7 @@ int read(int fd, void *buf, size_t nbytes)
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP: {
>  	    ssize_t ret;
> -	    ret = netfront_receive(files[fd].tap.dev, buf, nbytes);
> +	    ret = netfront_receive(files[fd].dev, buf, nbytes);
>  	    if (ret <= 0) {
>  		errno = EAGAIN;
>  		return -1;
> @@ -339,7 +339,7 @@ int write(int fd, const void *buf, size_t nbytes)
>  #endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP:
> -	    netfront_xmit(files[fd].tap.dev, (void*) buf, nbytes);
> +	    netfront_xmit(files[fd].dev, (void*) buf, nbytes);
>  	    return nbytes;
>  #endif
>  #ifdef CONFIG_BLKFRONT
> @@ -450,7 +450,7 @@ int close(int fd)
>  #endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP:
> -	    shutdown_netfront(files[fd].tap.dev);
> +	    shutdown_netfront(files[fd].dev);
>  	    files[fd].type = FTYPE_NONE;
>  	    return 0;
>  #endif
> diff --git a/netfront.c b/netfront.c
> index a566e34..7696451 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -576,7 +576,7 @@ int netfront_tap_open(char *nodename) {
>      }
>      dev->fd = alloc_fd(FTYPE_TAP);
>      printk("tap_open(%s) -> %d\n", nodename, dev->fd);
> -    files[dev->fd].tap.dev = dev;
> +    files[dev->fd].dev = dev;
>      return dev->fd;
>  }
>  #endif
> -- 
> 2.26.2
> 

-- 
Samuel
<c> tiens, je suis déçu
<c> quand on clique sur le bouton random de http://xkcd.com/221/ on ne tombe pas (toujours) sur http://xkcd.com/4/
<c> bon, j'envoie un bug-report à l'auteur

