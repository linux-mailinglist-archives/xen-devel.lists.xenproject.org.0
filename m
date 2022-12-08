Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A626473BC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 17:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457263.715161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3JJb-0003zB-L1; Thu, 08 Dec 2022 16:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457263.715161; Thu, 08 Dec 2022 16:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3JJb-0003vn-G3; Thu, 08 Dec 2022 16:00:03 +0000
Received: by outflank-mailman (input) for mailman id 457263;
 Thu, 08 Dec 2022 16:00:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcKw=4G=amazon.de=prvs=334cfc16b=ptyadav@srs-se1.protection.inumbo.net>)
 id 1p3JJa-0003D2-81
 for xen-devel@lists.xen.org; Thu, 08 Dec 2022 16:00:02 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b5ba39e-7711-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 16:59:59 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 15:59:46 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com (Postfix)
 with ESMTPS id 886EB416B5; Thu,  8 Dec 2022 15:59:46 +0000 (UTC)
Received: from EX19D048UWB003.ant.amazon.com (10.13.138.72) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 8 Dec 2022 15:59:46 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D048UWB003.ant.amazon.com (10.13.138.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Thu, 8 Dec 2022 15:59:45 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1497.42 via Frontend Transport; Thu, 8 Dec 2022 15:59:45 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix,
 from userid 23027615)
 id 445C820D77; Thu,  8 Dec 2022 16:59:44 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5b5ba39e-7711-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1670515199; x=1702051199;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=uZt9FDPyGpeMgirEaYToW81GcKPBxSxydsE89IilZUM=;
  b=fhtFiovOLnRKGe5KrOeVIEKA8Svt+4t8mNX/K6oOz9qK9IgNazj4oDVJ
   k6e5NHMKQ9ZJ9TScQ37j5ZbUF4GLWfI8wMpjB98kx7UyZkhf5Ci4xYYi+
   WqN957GUy8oe4Cg0zxU+QDOM0mTbkhv5IJOVf1+oomp7v5ZkdWlJth4wj
   U=;
X-IronPort-AV: E=Sophos;i="5.96,227,1665446400"; 
   d="scan'208";a="1081611174"
From: Pratyush Yadav <ptyadav@amazon.de>
To: Xen.org security team <security@xen.org>
CC: <xen-announce@lists.xen.org>, <xen-devel@lists.xen.org>,
	<xen-users@lists.xen.org>, <oss-security@lists.openwall.com>, "Xen.org
 security team" <security-team-members@xen.org>
Subject: Re: Xen Security Advisory 424 v1 (CVE-2022-42328,CVE-2022-42329) -
 Guests can trigger deadlock in Linux netback driver
References: <E1p2ZhW-0005Xe-FG@xenbits.xenproject.org>
Date: Thu, 8 Dec 2022 16:59:44 +0100
In-Reply-To: <E1p2ZhW-0005Xe-FG@xenbits.xenproject.org> (Xen org security
	team's message of "Tue, 06 Dec 2022 15:17:42 +0000")
Message-ID: <mafs0lenhlwcv.fsf@dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk


Hi,

I noticed one interesting thing about this patch but I'm not familiar
enough with the driver to say for sure what the right thing is.

On Tue, Dec 06 2022, Xen.org security team wrote:

[...]
>
> From cfdf8fd81845734b6152b4617746c1127ec52228 Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> Date: Tue, 6 Dec 2022 08:54:24 +0100
> Subject: [PATCH] xen/netback: don't call kfree_skb() with interrupts disabled
>
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with interrupts being disabled. So remove kfree_skb()
> from the spin_lock_irqsave() section and use the already existing
> "drop" label in xenvif_start_xmit() for dropping the SKB. At the
> same time replace the dev_kfree_skb() call there with a call of
> dev_kfree_skb_any(), as xenvif_start_xmit() can be called with
> disabled interrupts.
>
> This is XSA-424 / CVE-2022-42328 / CVE-2022-42329.
>
> Fixes: be81992f9086 ("xen/netback: don't queue unlimited number of packages")
> Reported-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
>  drivers/net/xen-netback/common.h    | 2 +-
>  drivers/net/xen-netback/interface.c | 6 ++++--
>  drivers/net/xen-netback/rx.c        | 8 +++++---
>  3 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
> index 1545cbee77a4..3dbfc8a6924e 100644
> --- a/drivers/net/xen-netback/common.h
> +++ b/drivers/net/xen-netback/common.h
> @@ -386,7 +386,7 @@ int xenvif_dealloc_kthread(void *data);
>  irqreturn_t xenvif_ctrl_irq_fn(int irq, void *data);
>
>  bool xenvif_have_rx_work(struct xenvif_queue *queue, bool test_kthread);
> -void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb);
> +bool xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb);
>
>  void xenvif_carrier_on(struct xenvif *vif);
>
> diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
> index 650fa180220f..f3f2c07423a6 100644
> --- a/drivers/net/xen-netback/interface.c
> +++ b/drivers/net/xen-netback/interface.c
> @@ -254,14 +254,16 @@ xenvif_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  	if (vif->hash.alg == XEN_NETIF_CTRL_HASH_ALGORITHM_NONE)
>  		skb_clear_hash(skb);
>
> -	xenvif_rx_queue_tail(queue, skb);
> +	if (!xenvif_rx_queue_tail(queue, skb))
> +		goto drop;
> +
>  	xenvif_kick_thread(queue);
>
>  	return NETDEV_TX_OK;
>
>   drop:
>  	vif->dev->stats.tx_dropped++;

Now tx_dropped is incremented on packet drop...

> -	dev_kfree_skb(skb);
> +	dev_kfree_skb_any(skb);
>  	return NETDEV_TX_OK;
>  }
>
> diff --git a/drivers/net/xen-netback/rx.c b/drivers/net/xen-netback/rx.c
> index 932762177110..0ba754ebc5ba 100644
> --- a/drivers/net/xen-netback/rx.c
> +++ b/drivers/net/xen-netback/rx.c
> @@ -82,9 +82,10 @@ static bool xenvif_rx_ring_slots_available(struct xenvif_queue *queue)
>  	return false;
>  }
>
> -void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
> +bool xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
>  {
>  	unsigned long flags;
> +	bool ret = true;
>
>  	spin_lock_irqsave(&queue->rx_queue.lock, flags);
>
> @@ -92,8 +93,7 @@ void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
>  		struct net_device *dev = queue->vif->dev;
>
>  		netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));
> -		kfree_skb(skb);
> -		queue->vif->dev->stats.rx_dropped++;

... but earlier rx_dropped was incremented.

Which one is actually correct? This line was added by be81992f9086b
("xen/netback: don't queue unlimited number of packages"), which was the
fix for XSA-392. I think incrementing tx_dropped is the right thing to
do, as was done before XSA-392 but it would be nice if someone else
takes a look at this as well.

> +		ret = false;
>  	} else {
>  		if (skb_queue_empty(&queue->rx_queue))
>  			xenvif_update_needed_slots(queue, skb);
> @@ -104,6 +104,8 @@ void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
>  	}
>
>  	spin_unlock_irqrestore(&queue->rx_queue.lock, flags);
> +
> +	return ret;
>  }
>
>  static struct sk_buff *xenvif_rx_dequeue(struct xenvif_queue *queue)

--
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




