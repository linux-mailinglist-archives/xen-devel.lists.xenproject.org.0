Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F72749D6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 22:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKocj-0003sj-6W; Tue, 22 Sep 2020 20:10:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BMKS=C7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kKoch-0003sQ-Ce
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 20:10:47 +0000
X-Inumbo-ID: d1a4d7f5-1430-4614-b2b3-bb95a1cc6f1f
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1a4d7f5-1430-4614-b2b3-bb95a1cc6f1f;
 Tue, 22 Sep 2020 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 09D90C30;
 Tue, 22 Sep 2020 22:10:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxryrwfwi30i; Tue, 22 Sep 2020 22:10:39 +0200 (CEST)
Received: from function (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr
 [90.50.148.204])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id AF8B0BA6;
 Tue, 22 Sep 2020 22:10:39 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kKoaS-000AaP-7w; Tue, 22 Sep 2020 22:08:28 +0200
Date: Tue, 22 Sep 2020 22:08:28 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Subject: Re: [PATCH 2/2] mini-os: netfront: fix suspend/resume handling
Message-ID: <20200922200828.lh22kzmlgktbooma@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200922105826.26274-1-jgross@suse.com>
 <20200922105826.26274-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922105826.26274-3-jgross@suse.com>
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

Juergen Gross, le mar. 22 sept. 2020 12:58:26 +0200, a ecrit:
> Suspend/resume handling of netfront is completely broken from the
> beginning. Commit d225f4012d69a1 ("Save/Restore Support: Add
> suspend/restore support for netfront") introduced a new structure
> netfront_dev_list referencing the real struct netfront_dev elements.
> This list is used to setup the devices when resuming again.
> 
> Unfortunately the netfront_dev elements are released during suspend,
> so at resume time those references will be stale.
> 
> Fix this whole mess by dropping struct netfront_dev_list again and
> link the netfront_dev elements directly into a list. When suspending
> don't free those elements.
> 
> The ip-address, netmask and gateway strings can just be released when
> suspending and reread from xenstore at resume time.
> 
> Fixes: d225f4012d69a1 ("Save/Restore Support: Add suspend/restore support for netfront")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  netfront.c | 162 ++++++++++++++++++++++-------------------------------
>  1 file changed, 67 insertions(+), 95 deletions(-)
> 
> diff --git a/netfront.c b/netfront.c
> index 9057908..2075410 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -36,6 +36,8 @@ struct net_buffer {
>  };
>  
>  struct netfront_dev {
> +    int refcount;
> +
>      domid_t dom;
>  
>      unsigned short tx_freelist[NET_TX_RING_SIZE + 1];
> @@ -66,27 +68,19 @@ struct netfront_dev {
>      void (*netif_rx)(unsigned char* data, int len, void* arg);
>      void *netif_rx_arg;
>  
> -    struct netfront_dev_list *ldev;
> -};
> -
> -struct netfront_dev_list {
> -    struct netfront_dev *dev;
>      unsigned char rawmac[6];
>      char *ip;
>      char *mask;
>      char *gw;
>  
> -    int refcount;
> -
> -    struct netfront_dev_list *next;
> +    struct netfront_dev *next;
>  };
>  
> -static struct netfront_dev_list *dev_list = NULL;
> +static struct netfront_dev *dev_list = NULL;
>  
>  void init_rx_buffers(struct netfront_dev *dev);
> -static struct netfront_dev *_init_netfront(struct netfront_dev *dev,
> -                                           unsigned char rawmac[6], char **ip, char **mask, char **gw);
> -static void _shutdown_netfront(struct netfront_dev *dev);
> +static struct netfront_dev *_init_netfront(struct netfront_dev *dev);
> +static int _shutdown_netfront(struct netfront_dev *dev);
>  void netfront_set_rx_handler(struct netfront_dev *dev,
>                               void (*thenetif_rx)(unsigned char *data, int len,
>                                                   void *arg),
> @@ -276,6 +270,7 @@ static void free_netfront(struct netfront_dev *dev)
>      mask_evtchn(dev->evtchn);
>  
>      free(dev->mac);
> +    free(dev->ip);
>      free(dev->backend);
>  
>      gnttab_end_access(dev->rx_ring_ref);
> @@ -309,8 +304,7 @@ struct netfront_dev *init_netfront(char *_nodename,
>  {
>      char nodename[256];
>      struct netfront_dev *dev;
> -    struct netfront_dev_list *ldev = NULL;
> -    struct netfront_dev_list *list = NULL;
> +    struct netfront_dev *list;
>      static int netfrontends = 0;
>  
>      if (!_nodename)
> @@ -321,10 +315,9 @@ struct netfront_dev *init_netfront(char *_nodename,
>      }
>  
>      /* Check if the device is already initialized */
> -    for (list = dev_list; list != NULL; list = list->next) {
> -        if (strcmp(nodename, list->dev->nodename) == 0) {
> -            list->refcount++;
> -            dev = list->dev;
> +    for (dev = dev_list; dev != NULL; dev = dev->next) {
> +        if (strcmp(nodename, dev->nodename) == 0) {
> +            dev->refcount++;
>              if (thenetif_rx)
>                  netfront_set_rx_handler(dev, thenetif_rx, NULL);
>              goto out;
> @@ -345,40 +338,34 @@ struct netfront_dev *init_netfront(char *_nodename,
>      dev->netif_rx = thenetif_rx;
>      dev->netif_rx_arg = NULL;
>  
> -    ldev = malloc(sizeof(struct netfront_dev_list));
> -    memset(ldev, 0, sizeof(struct netfront_dev_list));
> -
> -    if (_init_netfront(dev, ldev->rawmac, &(ldev->ip), &(ldev->mask), &(ldev->gw))) {
> -        dev->ldev = ldev;
> -        ldev->dev = dev;
> -        ldev->refcount = 1;
> -        ldev->next = NULL;
> +    if (_init_netfront(dev)) {
> +        dev->refcount = 1;
> +        dev->next = NULL;
>  
>          if (!dev_list) {
> -            dev_list = ldev;
> +            dev_list = dev;
>          } else {
>              for (list = dev_list; list->next != NULL; list = list->next)
>                  ;
> -            list->next = ldev;
> -		}
> +            list->next = dev;
> +        }
>          netfrontends++;
>      } else {
> -        free(ldev);
>          dev = NULL;
>          goto err;
>      }
>  
>  out:
>      if (rawmac) {
> -        rawmac[0] = ldev->rawmac[0];
> -        rawmac[1] = ldev->rawmac[1];
> -        rawmac[2] = ldev->rawmac[2];
> -        rawmac[3] = ldev->rawmac[3];
> -        rawmac[4] = ldev->rawmac[4];
> -        rawmac[5] = ldev->rawmac[5];
> +        rawmac[0] = dev->rawmac[0];
> +        rawmac[1] = dev->rawmac[1];
> +        rawmac[2] = dev->rawmac[2];
> +        rawmac[3] = dev->rawmac[3];
> +        rawmac[4] = dev->rawmac[4];
> +        rawmac[5] = dev->rawmac[5];
>  	}
>      if (ip)
> -        *ip = strdup(ldev->ip);
> +        *ip = strdup(dev->ip);
>  
>  err:
>      return dev;
> @@ -386,17 +373,15 @@ err:
>  
>  char *netfront_get_netmask(struct netfront_dev *dev)
>  {
> -    return dev->ldev->mask ? strdup(dev->ldev->mask) : NULL;
> +    return dev->mask ? strdup(dev->mask) : NULL;
>  }
>  
>  char *netfront_get_gateway(struct netfront_dev *dev)
>  {
> -    return dev->ldev->gw ? strdup(dev->ldev->gw) : NULL;
> +    return dev->gw ? strdup(dev->gw) : NULL;
>  }
>  
> -static struct netfront_dev *_init_netfront(struct netfront_dev *dev,
> -					   unsigned char rawmac[6],
> -					   char **ip, char **mask, char **gw)
> +static struct netfront_dev *_init_netfront(struct netfront_dev *dev)
>  {
>      xenbus_transaction_t xbt;
>      char* err = NULL;
> @@ -518,6 +503,8 @@ done:
>      {
>          XenbusState state;
>          char path[strlen(dev->backend) + strlen("/state") + 1];
> +        char *p;
> +
>          snprintf(path, sizeof(path), "%s/state", dev->backend);
>  
>          xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
> @@ -532,26 +519,18 @@ done:
>              goto error;
>          }
>  
> -        if (ip) {
> -            char *p;
> -
> -            snprintf(path, sizeof(path), "%s/ip", dev->backend);
> -            xenbus_read(XBT_NIL, path, ip);
> -
> -            if (mask) {
> -                p = strchr(*ip, ' ');
> -                if (p) {
> -                    *p++ = '\0';
> -                    *mask = p;
> -
> -                    if (gw) {
> -                        p = strchr(p, ' ');
> -                        if (p) {
> -                            *p++ = '\0';
> -                            *gw = p;
> -                        }
> -                    }
> -                }
> +        snprintf(path, sizeof(path), "%s/ip", dev->backend);
> +        xenbus_read(XBT_NIL, path, &dev->ip);
> +
> +        p = strchr(dev->ip, ' ');
> +        if (p) {
> +            *p++ = '\0';
> +            dev->mask = p;
> +
> +            p = strchr(p, ' ');
> +            if (p) {
> +                *p++ = '\0';
> +                dev->gw = p;
>              }
>          }
>      }
> @@ -563,14 +542,13 @@ done:
>      /* Special conversion specifier 'hh' needed for __ia64__. Without
>       * this mini-os panics with 'Unaligned reference'.
>       */
> -    if (rawmac)
> -        sscanf(dev->mac,"%hhx:%hhx:%hhx:%hhx:%hhx:%hhx",
> -               &rawmac[0],
> -               &rawmac[1],
> -               &rawmac[2],
> -               &rawmac[3],
> -               &rawmac[4],
> -               &rawmac[5]);
> +    sscanf(dev->mac,"%hhx:%hhx:%hhx:%hhx:%hhx:%hhx",
> +           &dev->rawmac[0],
> +           &dev->rawmac[1],
> +           &dev->rawmac[2],
> +           &dev->rawmac[3],
> +           &dev->rawmac[4],
> +           &dev->rawmac[5]);
>  
>      return dev;
>  
> @@ -600,38 +578,33 @@ int netfront_tap_open(char *nodename) {
>  
>  void shutdown_netfront(struct netfront_dev *dev)
>  {
> -    struct netfront_dev_list *list = NULL;
> -    struct netfront_dev_list *to_del = NULL;
> +    struct netfront_dev *list;
>  
>      /* Check this is a valid device */
> -    for (list = dev_list; list != NULL; list = list->next) {
> -        if (list->dev == dev)
> -            break;
> -    }
> +    for (list = dev_list; list != NULL && list != dev; list = list->next);
>  
>      if (!list) {
>          printk("Trying to shutdown an invalid netfront device (%p)\n", dev);
>          return;
>      }
>  
> -    list->refcount--;
> -    if (list->refcount == 0) {
> -        _shutdown_netfront(dev);
> +    dev->refcount--;
> +    if (dev->refcount == 0) {
> +        if (_shutdown_netfront(dev))
> +            return;
>  
> -        to_del = list;
> -        if (to_del == dev_list) {
> -            free(to_del);
> -			dev_list = NULL;
> +        if (dev == dev_list) {
> +            dev_list = NULL;
>          } else {
> -            for (list = dev_list; list->next != to_del; list = list->next)
> +            for (list = dev_list; list->next != dev; list = list->next)
>                  ;
> -            list->next = to_del->next;
> -            free(to_del);
> +            list->next = dev->next;
>          }
> +        free_netfront(dev);
>      }
>  }
>  
> -static void _shutdown_netfront(struct netfront_dev *dev)
> +static int _shutdown_netfront(struct netfront_dev *dev)
>  {
>      char* err = NULL, *err2;
>      XenbusState state;
> @@ -692,24 +665,23 @@ close:
>      err2 = xenbus_rm(XBT_NIL, nodename);
>      free(err2);
>  
> -    if (!err)
> -        free_netfront(dev);
> +    return err ? -EBUSY : 0;
>  }
>  
>  void suspend_netfront(void)
>  {
> -    struct netfront_dev_list *list;
> +    struct netfront_dev *dev;
>  
> -    for (list = dev_list; list != NULL; list = list->next)
> -        _shutdown_netfront(list->dev);
> +    for (dev = dev_list; dev != NULL; dev = dev->next)
> +        _shutdown_netfront(dev);
>  }
>  
>  void resume_netfront(void)
>  {
> -    struct netfront_dev_list *list;
> +    struct netfront_dev *dev;
>  
> -    for (list = dev_list; list != NULL; list = list->next)
> -        _init_netfront(list->dev, NULL, NULL, NULL, NULL);
> +    for (dev = dev_list; dev != NULL; dev = dev->next)
> +        _init_netfront(dev);
>  }
>  
>  void init_rx_buffers(struct netfront_dev *dev)
> -- 
> 2.26.2
> 

-- 
Samuel
 tohi.cybercable.fr (212.198.0.3) si une personne se reconnait derriere
 cette adresse que ce soit un pirate ou une victime qu'il se manifeste,
 cette personne pourrait bien etre un petit malin
 -+- Fred in NPC : Mamaaaaan, y a le routeur qui veut me hacker -+-

