Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AB2749D5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 22:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKocP-0003oR-SW; Tue, 22 Sep 2020 20:10:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BMKS=C7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kKocP-0003oM-5J
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 20:10:29 +0000
X-Inumbo-ID: 7f6df8b7-e141-4628-860d-acb38605fae0
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f6df8b7-e141-4628-860d-acb38605fae0;
 Tue, 22 Sep 2020 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 999B3C30;
 Tue, 22 Sep 2020 22:10:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dp7Ncpw9qDYY; Tue, 22 Sep 2020 22:10:24 +0200 (CEST)
Received: from function (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr
 [90.50.148.204])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 69949BA6;
 Tue, 22 Sep 2020 22:10:24 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kKoaC-000Aa9-R3; Tue, 22 Sep 2020 22:08:12 +0200
Date: Tue, 22 Sep 2020 22:08:12 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Subject: Re: [PATCH 1/2] mini-os: netfront: retrieve netmask and gateway via
 extra function
Message-ID: <20200922200812.exxxucoxj27pe3ob@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200922105826.26274-1-jgross@suse.com>
 <20200922105826.26274-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200922105826.26274-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le mar. 22 sept. 2020 12:58:25 +0200, a ecrit:
> Commit 1b8ed31f4ce40 ("mini-os: netfront: Read netmask and gateway from
> Xenstore") modified init_netfront() to take two additional parameters.
> This broke the Xen build as init_netfront() is used in grub stubdom,
> too.
> 
> So instead of tightly coupling Mini-OS and Xen build via this interface
> modification undo this change of init_netfront() and add two other
> functions for retrieving the netmask and gateway for a network device.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/netfront.h |  4 +++-
>  lwip-net.c         |  4 +++-
>  netfront.c         | 21 +++++++++++++++------
>  test.c             |  2 +-
>  4 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/include/netfront.h b/include/netfront.h
> index bc3080e..ec641c8 100644
> --- a/include/netfront.h
> +++ b/include/netfront.h
> @@ -7,7 +7,9 @@ struct netfront_dev *init_netfront(char *nodename,
>                                     void (*netif_rx)(unsigned char *data,
>                                                      int len, void* arg),
>                                     unsigned char rawmac[6],
> -                                   char **ip, char **mask, char **gw);
> +                                   char **ip);
> +char *netfront_get_netmask(struct netfront_dev *dev);
> +char *netfront_get_gateway(struct netfront_dev *dev);
>  void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len);
>  void shutdown_netfront(struct netfront_dev *dev);
>  void suspend_netfront(void);
> diff --git a/lwip-net.c b/lwip-net.c
> index 80d1c8f..7e0d871 100644
> --- a/lwip-net.c
> +++ b/lwip-net.c
> @@ -347,7 +347,9 @@ void start_networking(void)
>  
>    tprintk("Waiting for network.\n");
>  
> -  dev = init_netfront(NULL, NULL, rawmac, &ip, &netmask_str, &gw_str);
> +  dev = init_netfront(NULL, NULL, rawmac, &ip);
> +  netmask_str = netfront_get_netmask(dev);
> +  gw_str = netfront_get_gateway(dev);
>    
>    if (ip) {
>      ipaddr.addr = inet_addr(ip);
> diff --git a/netfront.c b/netfront.c
> index 205484b..9057908 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -65,6 +65,8 @@ struct netfront_dev {
>  
>      void (*netif_rx)(unsigned char* data, int len, void* arg);
>      void *netif_rx_arg;
> +
> +    struct netfront_dev_list *ldev;
>  };
>  
>  struct netfront_dev_list {
> @@ -303,7 +305,7 @@ struct netfront_dev *init_netfront(char *_nodename,
>                                     void (*thenetif_rx)(unsigned char* data,
>                                                         int len, void* arg),
>                                     unsigned char rawmac[6],
> -                                   char **ip, char **mask, char **gw)
> +                                   char **ip)
>  {
>      char nodename[256];
>      struct netfront_dev *dev;
> @@ -347,6 +349,7 @@ struct netfront_dev *init_netfront(char *_nodename,
>      memset(ldev, 0, sizeof(struct netfront_dev_list));
>  
>      if (_init_netfront(dev, ldev->rawmac, &(ldev->ip), &(ldev->mask), &(ldev->gw))) {
> +        dev->ldev = ldev;
>          ldev->dev = dev;
>          ldev->refcount = 1;
>          ldev->next = NULL;
> @@ -376,15 +379,21 @@ out:
>  	}
>      if (ip)
>          *ip = strdup(ldev->ip);
> -    if (mask)
> -        *mask = strdup(ldev->mask);
> -    if (gw)
> -        *gw = strdup(ldev->gw);
>  
>  err:
>      return dev;
>  }
>  
> +char *netfront_get_netmask(struct netfront_dev *dev)
> +{
> +    return dev->ldev->mask ? strdup(dev->ldev->mask) : NULL;
> +}
> +
> +char *netfront_get_gateway(struct netfront_dev *dev)
> +{
> +    return dev->ldev->gw ? strdup(dev->ldev->gw) : NULL;
> +}
> +
>  static struct netfront_dev *_init_netfront(struct netfront_dev *dev,
>  					   unsigned char rawmac[6],
>  					   char **ip, char **mask, char **gw)
> @@ -576,7 +585,7 @@ error:
>  int netfront_tap_open(char *nodename) {
>      struct netfront_dev *dev;
>  
> -    dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL, NULL, NULL);
> +    dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL);
>      if (!dev) {
>  	printk("TAP open failed\n");
>  	errno = EIO;
> diff --git a/test.c b/test.c
> index 2e5f7f9..42a2666 100644
> --- a/test.c
> +++ b/test.c
> @@ -91,7 +91,7 @@ static struct semaphore net_sem = __SEMAPHORE_INITIALIZER(net_sem, 0);
>  
>  static void netfront_thread(void *p)
>  {
> -    net_dev = init_netfront(NULL, NULL, NULL, NULL, NULL, NULL);
> +    net_dev = init_netfront(NULL, NULL, NULL, NULL);
>      up(&net_sem);
>  }
>  #endif
> -- 
> 2.26.2
> 

-- 
Samuel
<k> faut en profiter, aujourd'hui, les blagues bidon sont à 100 dollars
 -+- #sos-bourse -+-

