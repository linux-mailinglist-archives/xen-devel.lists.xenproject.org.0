Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5A488732
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254972.436915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mxm-0002jE-C9; Sun, 09 Jan 2022 01:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254972.436915; Sun, 09 Jan 2022 01:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mxm-0002g6-8i; Sun, 09 Jan 2022 01:25:38 +0000
Received: by outflank-mailman (input) for mailman id 254972;
 Sun, 09 Jan 2022 01:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6Mxk-0002fv-IK
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:25:36 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b59b941-70eb-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:25:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id EAC5B346;
 Sun,  9 Jan 2022 02:25:34 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bE8UVSb-c4mp; Sun,  9 Jan 2022 02:25:33 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 66036331;
 Sun,  9 Jan 2022 02:25:33 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6Mxg-006iNc-FY;
 Sun, 09 Jan 2022 02:25:32 +0100
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
X-Inumbo-ID: 0b59b941-70eb-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:25:32 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 04/15] mini-os: replace multiple fd elements in struct
 file by common one
Message-ID: <20220109012532.3xggmswcyfgs2xiq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: EAC5B346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:30 +0100, a ecrit:
> The type specific union in struct files contains two instances of
> "int fd". Replace them by a common one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h |  9 +--------
>  lib/sys.c     | 28 ++++++++++++++--------------
>  2 files changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 4d9b14b..dc56f52 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -187,14 +187,7 @@ struct file {
>      bool read;	/* maybe available for read */
>      off_t offset;
>      union {
> -	struct {
> -            /* lwIP fd */
> -	    int fd;
> -	} socket;
> -	struct {
> -            /* FS import fd */
> -	    int fd;
> -	} file;
> +        int fd; /* Any fd from an upper layer. */
>  	struct {
>  	    struct evtchn_port_list ports;
>  	} evtchn;
> diff --git a/lib/sys.c b/lib/sys.c
> index e1cea70..1da7401 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -258,7 +258,7 @@ int read(int fd, void *buf, size_t nbytes)
>          }
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
> -	    return lwip_read(files[fd].socket.fd, buf, nbytes);
> +	    return lwip_read(files[fd].fd, buf, nbytes);
>  #endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP: {
> @@ -335,7 +335,7 @@ int write(int fd, const void *buf, size_t nbytes)
>  	    return nbytes;
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
> -	    return lwip_write(files[fd].socket.fd, (void*) buf, nbytes);
> +	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
>  #endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP:
> @@ -428,7 +428,7 @@ int close(int fd)
>  #endif
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET: {
> -	    int res = lwip_close(files[fd].socket.fd);
> +	    int res = lwip_close(files[fd].fd);
>  	    files[fd].type = FTYPE_NONE;
>  	    return res;
>  	}
> @@ -594,7 +594,7 @@ int fcntl(int fd, int cmd, ...)
>  	    if (files[fd].type == FTYPE_SOCKET && !(arg & ~O_NONBLOCK)) {
>  		/* Only flag supported: non-blocking mode */
>  		uint32_t nblock = !!(arg & O_NONBLOCK);
> -		return lwip_ioctl(files[fd].socket.fd, FIONBIO, &nblock);
> +		return lwip_ioctl(files[fd].fd, FIONBIO, &nblock);
>  	    }
>  	    /* Fallthrough */
>  #endif
> @@ -732,15 +732,15 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>      for (i = 0; i < nfds; i++) {
>  	if (files[i].type == FTYPE_SOCKET) {
>  	    if (FD_ISSET(i, readfds)) {
> -		FD_SET(files[i].socket.fd, &sock_readfds);
> +		FD_SET(files[i].fd, &sock_readfds);
>  		sock_nfds = i+1;
>  	    }
>  	    if (FD_ISSET(i, writefds)) {
> -		FD_SET(files[i].socket.fd, &sock_writefds);
> +		FD_SET(files[i].fd, &sock_writefds);
>  		sock_nfds = i+1;
>  	    }
>  	    if (FD_ISSET(i, exceptfds)) {
> -		FD_SET(files[i].socket.fd, &sock_exceptfds);
> +		FD_SET(files[i].fd, &sock_exceptfds);
>  		sock_nfds = i+1;
>  	    }
>  	}
> @@ -803,19 +803,19 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	case FTYPE_SOCKET:
>  	    if (FD_ISSET(i, readfds)) {
>  	        /* Optimize no-network-packet case.  */
> -		if (sock_n && FD_ISSET(files[i].socket.fd, &sock_readfds))
> +		if (sock_n && FD_ISSET(files[i].fd, &sock_readfds))
>  		    n++;
>  		else
>  		    FD_CLR(i, readfds);
>  	    }
>              if (FD_ISSET(i, writefds)) {
> -		if (sock_n && FD_ISSET(files[i].socket.fd, &sock_writefds))
> +		if (sock_n && FD_ISSET(files[i].fd, &sock_writefds))
>  		    n++;
>  		else
>  		    FD_CLR(i, writefds);
>              }
>              if (FD_ISSET(i, exceptfds)) {
> -		if (sock_n && FD_ISSET(files[i].socket.fd, &sock_exceptfds))
> +		if (sock_n && FD_ISSET(files[i].fd, &sock_exceptfds))
>  		    n++;
>  		else
>  		    FD_CLR(i, exceptfds);
> @@ -1112,7 +1112,7 @@ int socket(int domain, int type, int protocol)
>  	return -1;
>      res = alloc_fd(FTYPE_SOCKET);
>      printk("socket -> %d\n", res);
> -    files[res].socket.fd = fd;
> +    files[res].fd = fd;
>      return res;
>  }
>  
> @@ -1124,11 +1124,11 @@ int accept(int s, struct sockaddr *addr, socklen_t *addrlen)
>  	errno = EBADF;
>  	return -1;
>      }
> -    fd = lwip_accept(files[s].socket.fd, addr, addrlen);
> +    fd = lwip_accept(files[s].fd, addr, addrlen);
>      if (fd < 0)
>  	return -1;
>      res = alloc_fd(FTYPE_SOCKET);
> -    files[res].socket.fd = fd;
> +    files[res].fd = fd;
>      printk("accepted on %d -> %d\n", s, res);
>      return res;
>  }
> @@ -1141,7 +1141,7 @@ ret name proto \
>  	errno = EBADF; \
>  	return -1; \
>      } \
> -    s = files[s].socket.fd; \
> +    s = files[s].fd; \
>      return lwip_##name args; \
>  }
>  
> -- 
> 2.26.2
> 

-- 
Samuel
<c> xlnt comme sujet de stage je peux essayer de donner une description formelle de automake
 -+- #ens-mim -+-

