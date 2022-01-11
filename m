Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708A48B897
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256106.439331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Net-0001H1-HN; Tue, 11 Jan 2022 20:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256106.439331; Tue, 11 Jan 2022 20:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Net-0001Dz-Dq; Tue, 11 Jan 2022 20:22:19 +0000
Received: by outflank-mailman (input) for mailman id 256106;
 Tue, 11 Jan 2022 20:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7Ner-00017B-CH
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:22:17 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a8678a0-731c-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:22:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id EE19440E;
 Tue, 11 Jan 2022 21:22:14 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAT_ODCsa4fw; Tue, 11 Jan 2022 21:22:14 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8AEF5261;
 Tue, 11 Jan 2022 21:22:13 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7Nem-00FFTk-Ru;
 Tue, 11 Jan 2022 21:22:12 +0100
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
X-Inumbo-ID: 2a8678a0-731c-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:22:12 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 07/12] mini-os: use get_file_from_fd() in netfront
Message-ID: <20220111202212.k5lvnnneihoqagnl@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: EE19440E
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

Juergen Gross, le mar. 11 janv. 2022 16:12:10 +0100, a ecrit:
> Instead of directly accessing the files[] array use get_file_from_fd().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

modulo the int fd / file * thing,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h |  3 +--
>  lib/sys.c     | 23 ------------------
>  netfront.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++-------
>  3 files changed, 57 insertions(+), 33 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 05f5083..aa8036e 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -163,8 +163,7 @@ void sanity_check(void);
>  #define FTYPE_SAVEFILE   5
>  #define FTYPE_FB         6
>  #define FTYPE_KBD        7
> -#define FTYPE_TAP        8
> -#define FTYPE_N          9
> +#define FTYPE_N          8
>  #define FTYPE_SPARE     16
>  
>  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> diff --git a/lib/sys.c b/lib/sys.c
> index f84fedd..7f2e11f 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -303,17 +303,6 @@ int read(int fd, void *buf, size_t nbytes)
>  	case FTYPE_SOCKET:
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
> @@ -369,11 +358,6 @@ int write(int fd, const void *buf, size_t nbytes)
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
> @@ -459,11 +443,6 @@ int close(int fd)
>  	    res = lwip_close(files[fd].fd);
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
> @@ -640,7 +619,6 @@ static const char *file_types[] = {
>      [FTYPE_NONE]    = "none",
>      [FTYPE_CONSOLE] = "console",
>      [FTYPE_SOCKET]  = "socket",
> -    [FTYPE_TAP]     = "net",
>      [FTYPE_KBD]     = "kbd",
>      [FTYPE_FB]      = "fb",
>  };
> @@ -817,7 +795,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>                  n++;
>  	    FD_CLR(i, exceptfds);
>  	    break;
> -	case FTYPE_TAP:
>  	case FTYPE_KBD:
>  	case FTYPE_FB:
>  	    if (FD_ISSET(i, readfds)) {
> diff --git a/netfront.c b/netfront.c
> index 7696451..f86c6a2 100644
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
> @@ -565,8 +565,54 @@ error:
>  }
>  
>  #ifdef HAVE_LIBC
> +static int netfront_read(int fd, void *buf, size_t nbytes)
> +{
> +    ssize_t ret;
> +    struct file *file = get_file_from_fd(fd);
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
> +static int netfront_write(int fd, const void *buf, size_t nbytes)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    netfront_xmit(file->dev, (void *)buf, nbytes);
> +
> +    return nbytes;
> +}
> +
> +static int netfront_close_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    shutdown_netfront(file->dev);
> +
> +    return 0;
> +}
> +
> +static struct file_ops netfront_ops = {
> +    .name = "net",
> +    .read = netfront_read,
> +    .write = netfront_write,
> +    .close = netfront_close_fd,
> +    .select_rd = select_read_flag,
> +};
> +
>  int netfront_tap_open(char *nodename) {
>      struct netfront_dev *dev;
> +    struct file *file;
> +    static unsigned int ftype_netfront;
> +
> +    if ( !ftype_netfront )
> +        ftype_netfront = alloc_file_type(&netfront_ops);
>  
>      dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL);
>      if (!dev) {
> @@ -574,9 +620,10 @@ int netfront_tap_open(char *nodename) {
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
> @@ -772,7 +819,8 @@ void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len)
>  ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t len)
>  {
>      unsigned long flags;
> -    int fd = dev->fd;
> +    struct file *file = get_file_from_fd(dev->fd);
> +
>      ASSERT(current == main_thread);
>  
>      dev->rlen = 0;
> @@ -781,9 +829,9 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
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
/*
 * [...] Note that 120 sec is defined in the protocol as the maximum
 * possible RTT.  I guess we'll have to use something other than TCP
 * to talk to the University of Mars.
 * PAWS allows us longer timeouts and large windows, so once implemented
 * ftp to mars will work nicely.
 */
(from /usr/src/linux/net/inet/tcp.c, concerning RTT [retransmission timeout])

