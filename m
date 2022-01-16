Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DCF48FED4
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257926.443528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CDW-0003Hs-IN; Sun, 16 Jan 2022 20:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257926.443528; Sun, 16 Jan 2022 20:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CDW-0003Ew-F5; Sun, 16 Jan 2022 20:33:34 +0000
Received: by outflank-mailman (input) for mailman id 257926;
 Sun, 16 Jan 2022 20:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CDU-0003Cl-8y
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:33:32 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eb639fd-770b-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:33:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E95FB35D;
 Sun, 16 Jan 2022 21:33:25 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCMMYMqtZtvI; Sun, 16 Jan 2022 21:33:24 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8AD889E;
 Sun, 16 Jan 2022 21:33:24 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CDL-005uQa-HV;
 Sun, 16 Jan 2022 21:33:23 +0100
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
X-Inumbo-ID: 8eb639fd-770b-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:33:23 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 2/5] reset file type in close() in one place
 only
Message-ID: <20220116203323.ebf75ksyfvy4qoim@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116064527.23519-1-jgross@suse.com>
 <20220116064527.23519-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116064527.23519-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: E95FB35D
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

Juergen Gross, le dim. 16 janv. 2022 07:45:24 +0100, a ecrit:
> Today the file type in struct file is set to FTYPE_NONE for each
> file type individually. Do that at the end of close() handling for
> all types.
> 
> While at it wipe the complete struct file, too, in order to avoid
> old data creeping into a new allocated struct file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - new patch
> V3:
> - add error handling (Andrew Cooper)
> - use BUILD_BUG_ON() (Andrew Cooper)
> ---
>  lib/sys.c | 56 ++++++++++++++++++++++++++++---------------------------
>  lib/xs.c  |  1 -
>  2 files changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/lib/sys.c b/lib/sys.c
> index 9a03875c..7df77cc6 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -265,7 +265,7 @@ int read(int fd, void *buf, size_t nbytes)
>              return ret;
>          }
>  #ifdef HAVE_LWIP
> -	case FTYPE_SOCKET:
> +        case FTYPE_SOCKET:
>  	    return lwip_read(files[fd].fd, buf, nbytes);
>  #endif
>  #ifdef CONFIG_NETFRONT
> @@ -424,84 +424,86 @@ int fsync(int fd) {
>  
>  int close(int fd)
>  {
> +    int res = 0;
> +
> +    if ( fd < 0 || fd >= ARRAY_SIZE(files) )
> +        goto error;
> +
>      printk("close(%d)\n", fd);
>      switch (files[fd].type) {
>          default:
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #ifdef CONFIG_XENBUS
>  	case FTYPE_XENBUS:
>              xs_daemon_close((void*)(intptr_t) fd);
> -            return 0;
> +            break;
>  #endif
>  #ifdef HAVE_LWIP
> -	case FTYPE_SOCKET: {
> -	    int res = lwip_close(files[fd].fd);
> -	    files[fd].type = FTYPE_NONE;
> -	    return res;
> -	}
> +	case FTYPE_SOCKET:
> +            res = lwip_close(files[fd].fd);
> +            break;
>  #endif
>  #ifdef CONFIG_LIBXENCTRL
>  	case FTYPE_XC:
>  	    minios_interface_close_fd(fd);
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_LIBXENEVTCHN
>  	case FTYPE_EVTCHN:
>  	    minios_evtchn_close_fd(fd);
> -            return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_LIBXENGNTTAB
>  	case FTYPE_GNTMAP:
>  	    minios_gnttab_close_fd(fd);
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP:
>  	    shutdown_netfront(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_BLKFRONT
>  	case FTYPE_BLK:
>              shutdown_blkfront(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_TPMFRONT
>  	case FTYPE_TPMFRONT:
>              shutdown_tpmfront(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_TPM_TIS
>  	case FTYPE_TPM_TIS:
>              shutdown_tpm_tis(files[fd].dev);
> -	    files[fd].type = FTYPE_NONE;
> -	    return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
>              shutdown_kbdfront(files[fd].dev);
> -            files[fd].type = FTYPE_NONE;
> -            return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_FBFRONT
>  	case FTYPE_FB:
>              shutdown_fbfront(files[fd].dev);
> -            files[fd].type = FTYPE_NONE;
> -            return 0;
> +            break;
>  #endif
>  #ifdef CONFIG_CONSFRONT
>          case FTYPE_SAVEFILE:
>          case FTYPE_CONSOLE:
>              fini_consfront(files[fd].dev);
> -            files[fd].type = FTYPE_NONE;
> -            return 0;
> +            break;
>  #endif
>  	case FTYPE_NONE:
> -	    break;
> +            goto error;
>      }
> +
> +    memset(files + fd, 0, sizeof(struct file));
> +    BUILD_BUG_ON(FTYPE_NONE != 0);
> +
> +    return res;
> +
> + error:
>      printk("close(%d): Bad descriptor\n", fd);
>      errno = EBADF;
>      return -1;
> diff --git a/lib/xs.c b/lib/xs.c
> index 0459f52f..4af0f960 100644
> --- a/lib/xs.c
> +++ b/lib/xs.c
> @@ -35,7 +35,6 @@ void xs_daemon_close(struct xs_handle *h)
>          next = event->next;
>          free(event);
>      }
> -    files[fd].type = FTYPE_NONE;
>  }
>  
>  int xs_fileno(struct xs_handle *h)
> -- 
> 2.26.2
> 

-- 
Samuel
/*
 * [...] Note that 120 sec is defined in the protocol as the maximum
 * possible RTT.  I guess we'll have to use something other than TCP
 * to talk to the University of Mars.
 * PAWS allows us longer timeouts and large windows, so once implemented
 * ftp to mars will work nicely.
 */
(from /usr/src/linux/net/inet/tcp.c, concerning RTT [retransmission timeout])

