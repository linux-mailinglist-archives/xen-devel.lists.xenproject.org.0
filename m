Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC1488738
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254996.436993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N0Q-00061a-BJ; Sun, 09 Jan 2022 01:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254996.436993; Sun, 09 Jan 2022 01:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N0Q-0005ys-8C; Sun, 09 Jan 2022 01:28:22 +0000
Received: by outflank-mailman (input) for mailman id 254996;
 Sun, 09 Jan 2022 01:28:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N0P-0005IG-Gb
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:28:21 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d4f76c0-70eb-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:28:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 5997D346;
 Sun,  9 Jan 2022 02:28:19 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W77v-MeaXf17; Sun,  9 Jan 2022 02:28:18 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C3EE0331;
 Sun,  9 Jan 2022 02:28:18 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N0M-006iRA-Bp;
 Sun, 09 Jan 2022 02:28:18 +0100
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
X-Inumbo-ID: 6d4f76c0-70eb-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:28:18 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 09/15] mini-os: eliminate kbdfront union member in struct
 file
Message-ID: <20220109012818.fvdt6mjv65itsocw@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-10-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-10-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 5997D346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:35 +0100, a ecrit:
> Replace the kbdfront specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  fbfront.c     | 2 +-
>  include/lib.h | 3 ---
>  lib/sys.c     | 4 ++--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fbfront.c b/fbfront.c
> index c8410af..1e055fb 100644
> --- a/fbfront.c
> +++ b/fbfront.c
> @@ -302,7 +302,7 @@ int kbdfront_open(struct kbdfront_dev *dev)
>  {
>      dev->fd = alloc_fd(FTYPE_KBD);
>      printk("kbd_open(%s) -> %d\n", dev->nodename, dev->fd);
> -    files[dev->fd].kbd.dev = dev;
> +    files[dev->fd].dev = dev;
>      return dev->fd;
>  }
>  #endif
> diff --git a/include/lib.h b/include/lib.h
> index 2a9a01c..5201ed7 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -196,9 +196,6 @@ struct file {
>  	struct {
>  	    struct netfront_dev *dev;
>  	} tap;
> -	struct {
> -	    struct kbdfront_dev *dev;
> -	} kbd;
>  #ifdef CONFIG_TPMFRONT
>  	struct {
>  	   struct tpmfront_dev *dev;
> diff --git a/lib/sys.c b/lib/sys.c
> index 2d48657..8c7ea3c 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -275,7 +275,7 @@ int read(int fd, void *buf, size_t nbytes)
>          case FTYPE_KBD: {
>              int ret, n;
>              n = nbytes / sizeof(union xenkbd_in_event);
> -            ret = kbdfront_receive(files[fd].kbd.dev, buf, n);
> +            ret = kbdfront_receive(files[fd].dev, buf, n);
>  	    if (ret <= 0) {
>  		errno = EAGAIN;
>  		return -1;
> @@ -474,7 +474,7 @@ int close(int fd)
>  #endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
> -            shutdown_kbdfront(files[fd].kbd.dev);
> +            shutdown_kbdfront(files[fd].dev);
>              files[fd].type = FTYPE_NONE;
>              return 0;
>  #endif
> -- 
> 2.26.2
> 

-- 
Samuel
X-Favorit-Cartoon: Calvin and Hobbes
 -+- Mail header of Wim van Dorst -+-

