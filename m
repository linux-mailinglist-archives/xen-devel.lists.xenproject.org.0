Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D5488736
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254987.436964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mzf-0004mu-NJ; Sun, 09 Jan 2022 01:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254987.436964; Sun, 09 Jan 2022 01:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mzf-0004kl-JG; Sun, 09 Jan 2022 01:27:35 +0000
Received: by outflank-mailman (input) for mailman id 254987;
 Sun, 09 Jan 2022 01:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6Mzd-0004i1-OY
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:27:33 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c76975-70eb-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:27:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7BC69331;
 Sun,  9 Jan 2022 02:27:31 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3emtEJI6slJ; Sun,  9 Jan 2022 02:27:30 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3587D64;
 Sun,  9 Jan 2022 02:27:30 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6MzZ-006iPj-HL;
 Sun, 09 Jan 2022 02:27:29 +0100
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
X-Inumbo-ID: 50c76975-70eb-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:27:29 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 07/15] mini-os: eliminate consfront union member in
 struct file
Message-ID: <20220109012729.kyt3ksnyq3wu6edb@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 7BC69331
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:33 +0100, a ecrit:
> Replace the consfront specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h |  3 ---
>  lib/sys.c     | 31 +++++++++++++++++--------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 3a40634..0cedae6 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -202,9 +202,6 @@ struct file {
>  	struct {
>  	    struct fbfront_dev *dev;
>  	} fb;
> -	struct {
> -	    struct consfront_dev *dev;
> -	} cons;
>  #ifdef CONFIG_TPMFRONT
>  	struct {
>  	   struct tpmfront_dev *dev;
> diff --git a/lib/sys.c b/lib/sys.c
> index f2fdbdf..62c2020 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -179,7 +179,7 @@ int posix_openpt(int flags)
>  
>      dev = init_consfront(NULL);
>      dev->fd = alloc_fd(FTYPE_CONSOLE);
> -    files[dev->fd].cons.dev = dev;
> +    files[dev->fd].dev = dev;
>  
>      printk("fd(%d) = posix_openpt\n", dev->fd);
>      return(dev->fd);
> @@ -194,7 +194,7 @@ int open_savefile(const char *path, int save)
>  
>      dev = init_consfront(nodename);
>      dev->fd = alloc_fd(FTYPE_SAVEFILE);
> -    files[dev->fd].cons.dev = dev;
> +    files[dev->fd].dev = dev;
>  
>      printk("fd(%d) = open_savefile\n", dev->fd);
>      return(dev->fd);
> @@ -248,7 +248,7 @@ int read(int fd, void *buf, size_t nbytes)
>              DEFINE_WAIT(w);
>              while(1) {
>                  add_waiter(w, console_queue);
> -                ret = xencons_ring_recv(files[fd].cons.dev, buf, nbytes);
> +                ret = xencons_ring_recv(files[fd].dev, buf, nbytes);
>                  if (ret)
>                      break;
>                  schedule();
> @@ -324,14 +324,14 @@ int write(int fd, const void *buf, size_t nbytes)
>          case FTYPE_SAVEFILE: {
>                  int ret = 0, tot = nbytes;
>                  while (nbytes > 0) {
> -                    ret = xencons_ring_send(files[fd].cons.dev, (char *)buf, nbytes);
> +                    ret = xencons_ring_send(files[fd].dev, (char *)buf, nbytes);
>                      nbytes -= ret;
>                      buf = (char *)buf + ret;
>                  }
>                  return tot - nbytes;
>              }
>  	case FTYPE_CONSOLE:
> -	    console_print(files[fd].cons.dev, (char *)buf, nbytes);
> +	    console_print(files[fd].dev, (char *)buf, nbytes);
>  	    return nbytes;
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
> @@ -487,7 +487,7 @@ int close(int fd)
>  #ifdef CONFIG_CONSFRONT
>          case FTYPE_SAVEFILE:
>          case FTYPE_CONSOLE:
> -            fini_consfront(files[fd].cons.dev);
> +            fini_consfront(files[fd].dev);
>              files[fd].type = FTYPE_NONE;
>              return 0;
>  #endif
> @@ -764,7 +764,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	    /* Fallthrough.  */
>  	case FTYPE_CONSOLE:
>  	    if (FD_ISSET(i, readfds)) {
> -                if (xencons_ring_avail(files[i].cons.dev))
> +                if (xencons_ring_avail(files[i].dev))
>  		    n++;
>  		else
>  		    FD_CLR(i, readfds);
> @@ -1447,6 +1447,8 @@ const struct termios default_termios = {0,             /* iflag */
>  
>  int tcsetattr(int fildes, int action, const struct termios *tios)
>  {
> +    struct consfront_dev *dev;
> +
>      if (fildes < 0 || fildes >= NOFILE) {
>          errno = EBADF;
>          return -1;
> @@ -1472,21 +1474,21 @@ int tcsetattr(int fildes, int action, const struct termios *tios)
>              return -1;
>      }
>  
> -    if (files[fildes].cons.dev == NULL) {
> +    dev = files[fildes].dev;
> +    if (dev == NULL) {
>          errno = ENOSYS;
>          return -1;
>      }
>  
> -    if (tios->c_oflag & OPOST)
> -        files[fildes].cons.dev->is_raw = false;
> -    else
> -        files[fildes].cons.dev->is_raw = true;
> +    dev->is_raw = !(tios->c_oflag & OPOST);
>  
>      return 0;
>  }
>  
>  int tcgetattr(int fildes, struct termios *tios)
>  {
> +    struct consfront_dev *dev;
> +
>      if (fildes < 0 || fildes >= NOFILE) {
>          errno = EBADF;
>          return -1;
> @@ -1497,7 +1499,8 @@ int tcgetattr(int fildes, struct termios *tios)
>          return -1;
>      }
>  
> -    if (files[fildes].cons.dev == NULL) {
> +    dev = files[fildes].dev;
> +    if (dev == NULL) {
>          errno = ENOSYS;
>          return 0;
>      }
> @@ -1509,7 +1512,7 @@ int tcgetattr(int fildes, struct termios *tios)
>  
>      memcpy(tios, &default_termios, sizeof(struct termios));
>  
> -    if (files[fildes].cons.dev->is_raw)
> +    if (dev->is_raw)
>          tios->c_oflag &= ~OPOST;
>  
>      return 0;
> -- 
> 2.26.2
> 

-- 
Samuel
<s> on se croirait en cool : Some browsers close comments on the first ">" character, so to hide script content from such browsers, you can transpose operands for relational and shift operators (e.g., use "y < x" rather than "x > y") or use scripting language-dependent escapes for ">".
 -+- #ens-mim -+-

