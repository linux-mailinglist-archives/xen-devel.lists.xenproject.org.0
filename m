Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61B48FEF1
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257976.443734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ccg-0006Ib-77; Sun, 16 Jan 2022 20:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257976.443734; Sun, 16 Jan 2022 20:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ccg-0006Fv-2A; Sun, 16 Jan 2022 20:59:34 +0000
Received: by outflank-mailman (input) for mailman id 257976;
 Sun, 16 Jan 2022 20:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9Cce-00069b-4X
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:59:32 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329fc830-770f-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 21:59:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B83F02BC;
 Sun, 16 Jan 2022 21:59:29 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ey5ZPJk3wMJ; Sun, 16 Jan 2022 21:59:28 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 826AB9E;
 Sun, 16 Jan 2022 21:59:28 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CcZ-005ufi-Qv;
 Sun, 16 Jan 2022 21:59:27 +0100
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
X-Inumbo-ID: 329fc830-770f-11ec-9bbc-9dff3e4ee8c5
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:59:27 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 07/12] use alloc_file_type() and
 get_file_from_fd() in netfront
Message-ID: <20220116205927.6rmacurejuvr6jdk@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220116083328.26524-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: B83F02BC
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

Juergen Gross, le dim. 16 janv. 2022 09:33:23 +0100, a ecrit:
> Allocate the file type dynamically via alloc_file_type().
> 
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - switch to struct file * parameter for callbacks
> - use __attribute__((constructor))
> ---
>  include/lib.h      |  3 +--
>  include/netfront.h |  3 ++-
>  lib/sys.c          | 23 ----------------
>  netfront.c         | 65 +++++++++++++++++++++++++++++++++++++++-------
>  4 files changed, 59 insertions(+), 35 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 2f472b00..b0d08807 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -165,8 +165,7 @@ extern struct wait_queue_head event_queue;
>  #define FTYPE_SAVEFILE   5
>  #define FTYPE_FB         6
>  #define FTYPE_KBD        7
> -#define FTYPE_TAP        8
> -#define FTYPE_N          9
> +#define FTYPE_N          8
>  #define FTYPE_SPARE     16
>  
>  struct file {
> diff --git a/include/netfront.h b/include/netfront.h
> index ec641c80..75080c26 100644
> --- a/include/netfront.h
> +++ b/include/netfront.h
> @@ -10,7 +10,8 @@ struct netfront_dev *init_netfront(char *nodename,
>                                     char **ip);
>  char *netfront_get_netmask(struct netfront_dev *dev);
>  char *netfront_get_gateway(struct netfront_dev *dev);
> -void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len);
> +void netfront_xmit(struct netfront_dev *dev, const unsigned char *data,
> +                   int len);
>  void shutdown_netfront(struct netfront_dev *dev);
>  void suspend_netfront(void);
>  void resume_netfront(void);
> diff --git a/lib/sys.c b/lib/sys.c
> index 90684335..44fe848c 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -309,17 +309,6 @@ int read(int fd, void *buf, size_t nbytes)
>          case FTYPE_SOCKET:
>  	    return lwip_read(files[fd].fd, buf, nbytes);
>  #endif
> -#ifdef CONFIG_NETFRONT
> -	case FTYPE_TAP: {
> -	    ssize_t ret;
> -	    ret = netfront_receive(files[fd].dev, buf, nbytes);
> -	    if (ret <= 0) {
> -		errno = EAGAIN;
> -		return -1;
> -	    }
> -	    return ret;
> -	}
> -#endif
>  #ifdef CONFIG_KBDFRONT
>          case FTYPE_KBD: {
>              int ret, n;
> @@ -382,11 +371,6 @@ int write(int fd, const void *buf, size_t nbytes)
>  #ifdef HAVE_LWIP
>  	case FTYPE_SOCKET:
>  	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
> -#endif
> -#ifdef CONFIG_NETFRONT
> -	case FTYPE_TAP:
> -	    netfront_xmit(files[fd].dev, (void*) buf, nbytes);
> -	    return nbytes;
>  #endif
>  	default:
>  	    break;
> @@ -487,11 +471,6 @@ int close(int fd)
>              res = lwip_close(files[fd].fd);
>              break;
>  #endif
> -#ifdef CONFIG_NETFRONT
> -	case FTYPE_TAP:
> -	    shutdown_netfront(files[fd].dev);
> -            break;
> -#endif
>  #ifdef CONFIG_KBDFRONT
>  	case FTYPE_KBD:
>              shutdown_kbdfront(files[fd].dev);
> @@ -687,7 +666,6 @@ static const char *const file_types[] = {
>      [FTYPE_NONE]    = "none",
>      [FTYPE_CONSOLE] = "console",
>      [FTYPE_SOCKET]  = "socket",
> -    [FTYPE_TAP]     = "net",
>      [FTYPE_KBD]     = "kbd",
>      [FTYPE_FB]      = "fb",
>  };
> @@ -872,7 +850,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>                  n++;
>  	    FD_CLR(i, exceptfds);
>  	    break;
> -	case FTYPE_TAP:
>  	case FTYPE_KBD:
>  	case FTYPE_FB:
>  	    if (FD_ISSET(i, readfds)) {
> diff --git a/netfront.c b/netfront.c
> index 76964514..164fdc66 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -248,14 +248,14 @@ void netfront_select_handler(evtchn_port_t port, struct pt_regs *regs, void *dat
>  {
>      int flags;
>      struct netfront_dev *dev = data;
> -    int fd = dev->fd;
> +    struct file *file = get_file_from_fd(dev->fd);
>  
>      local_irq_save(flags);
>      network_tx_buf_gc(dev);
>      local_irq_restore(flags);
>  
> -    if (fd != -1)
> -        files[fd].read = true;
> +    if ( file )
> +        file->read = true;
>      wake_up(&netfront_queue);
>  }
>  #endif
> @@ -565,8 +565,53 @@ error:
>  }
>  
>  #ifdef HAVE_LIBC
> +static int netfront_read(struct file *file, void *buf, size_t nbytes)
> +{
> +    ssize_t ret;
> +
> +    ret = netfront_receive(file->dev, buf, nbytes);
> +    if ( ret <= 0 )
> +    {
> +        errno = EAGAIN;
> +        return -1;
> +    }
> +
> +    return ret;
> +}
> +
> +static int netfront_write(struct file *file, const void *buf, size_t nbytes)
> +{
> +    netfront_xmit(file->dev, buf, nbytes);
> +
> +    return nbytes;
> +}
> +
> +static int netfront_close_fd(struct file *file)
> +{
> +    shutdown_netfront(file->dev);
> +
> +    return 0;
> +}
> +
> +static const struct file_ops netfront_ops = {
> +    .name = "net",
> +    .read = netfront_read,
> +    .write = netfront_write,
> +    .close = netfront_close_fd,
> +    .select_rd = select_read_flag,
> +};
> +
> +static unsigned int ftype_netfront;
> +
> +__attribute__((constructor))
> +static void netfront_initialize(void)
> +{
> +    ftype_netfront = alloc_file_type(&netfront_ops);
> +}
> +
>  int netfront_tap_open(char *nodename) {
>      struct netfront_dev *dev;
> +    struct file *file;
>  
>      dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL);
>      if (!dev) {
> @@ -574,9 +619,10 @@ int netfront_tap_open(char *nodename) {
>  	errno = EIO;
>  	return -1;
>      }
> -    dev->fd = alloc_fd(FTYPE_TAP);
> +    dev->fd = alloc_fd(ftype_netfront);
>      printk("tap_open(%s) -> %d\n", nodename, dev->fd);
> -    files[dev->fd].dev = dev;
> +    file = get_file_from_fd(dev->fd);
> +    file->dev = dev;
>      return dev->fd;
>  }
>  #endif
> @@ -720,7 +766,7 @@ void init_rx_buffers(struct netfront_dev *dev)
>  }
>  
>  
> -void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len)
> +void netfront_xmit(struct netfront_dev *dev, const unsigned char *data, int len)
>  {
>      int flags;
>      struct netif_tx_request *tx;
> @@ -772,7 +818,8 @@ void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len)
>  ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t len)
>  {
>      unsigned long flags;
> -    int fd = dev->fd;
> +    struct file *file = get_file_from_fd(dev->fd);
> +
>      ASSERT(current == main_thread);
>  
>      dev->rlen = 0;
> @@ -781,9 +828,9 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
>  
>      local_irq_save(flags);
>      network_rx(dev);
> -    if (!dev->rlen && fd != -1)
> +    if ( !dev->rlen && file )
>          /* No data for us, make select stop returning */
> -        files[fd].read = false;
> +        file->read = false;
>      /* Before re-enabling the interrupts, in case a packet just arrived in the
>       * meanwhile. */
>      local_irq_restore(flags);
> -- 
> 2.26.2
> 

-- 
Samuel
<O> Ça peut être une madeleine à sous munitions (avec des composants,
par exemple)
 -+- #runtime -+-

