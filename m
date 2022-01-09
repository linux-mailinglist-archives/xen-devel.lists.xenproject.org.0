Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D811488734
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254980.436949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Myc-00042m-9a; Sun, 09 Jan 2022 01:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254980.436949; Sun, 09 Jan 2022 01:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Myc-000400-5u; Sun, 09 Jan 2022 01:26:30 +0000
Received: by outflank-mailman (input) for mailman id 254980;
 Sun, 09 Jan 2022 01:26:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6Mya-0002fv-Jn
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:26:28 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29fec98f-70eb-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:26:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 378A5346;
 Sun,  9 Jan 2022 02:26:26 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sv4vUZ5LBzCD; Sun,  9 Jan 2022 02:26:25 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8DE4964;
 Sun,  9 Jan 2022 02:26:25 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6MyW-006iP0-S2;
 Sun, 09 Jan 2022 02:26:24 +0100
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
X-Inumbo-ID: 29fec98f-70eb-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:26:24 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 06/15] mini-os: eliminate blkfront union member in struct
 file
Message-ID: <20220109012624.zsd2agf7hhmcyd2r@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220106115741.3219-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 378A5346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:32 +0100, a ecrit:
> Replace the blkfront specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  blkfront.c    | 6 +++---
>  include/lib.h | 3 ---
>  lib/sys.c     | 2 +-
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/blkfront.c b/blkfront.c
> index 8137106..e3f42be 100644
> --- a/blkfront.c
> +++ b/blkfront.c
> @@ -562,13 +562,13 @@ int blkfront_open(struct blkfront_dev *dev)
>      }
>      dev->fd = alloc_fd(FTYPE_BLK);
>      printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
> -    files[dev->fd].blk.dev = dev;
> +    files[dev->fd].dev = dev;
>      return dev->fd;
>  }
>  
>  int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
>  {
> -   struct blkfront_dev* dev = files[fd].blk.dev;
> +   struct blkfront_dev* dev = files[fd].dev;
>     off_t offset = files[fd].offset;
>     struct blkfront_aiocb aiocb;
>     unsigned long long disksize = dev->info.sectors * dev->info.sector_size;
> @@ -718,7 +718,7 @@ int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
>  
>  int blkfront_posix_fstat(int fd, struct stat* buf)
>  {
> -   struct blkfront_dev* dev = files[fd].blk.dev;
> +   struct blkfront_dev* dev = files[fd].dev;
>  
>     buf->st_mode = dev->info.mode;
>     buf->st_uid = 0;
> diff --git a/include/lib.h b/include/lib.h
> index 60aaf1c..3a40634 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -196,9 +196,6 @@ struct file {
>  	struct {
>  	    struct netfront_dev *dev;
>  	} tap;
> -	struct {
> -	    struct blkfront_dev *dev;
> -	} blk;
>  	struct {
>  	    struct kbdfront_dev *dev;
>  	} kbd;
> diff --git a/lib/sys.c b/lib/sys.c
> index 1da7401..f2fdbdf 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -456,7 +456,7 @@ int close(int fd)
>  #endif
>  #ifdef CONFIG_BLKFRONT
>  	case FTYPE_BLK:
> -            shutdown_blkfront(files[fd].blk.dev);
> +            shutdown_blkfront(files[fd].dev);
>  	    files[fd].type = FTYPE_NONE;
>  	    return 0;
>  #endif
> -- 
> 2.26.2
> 

-- 
Samuel
Accroche-toi au terminal, j'enlève le shell...
 -+- nojhan -+-

