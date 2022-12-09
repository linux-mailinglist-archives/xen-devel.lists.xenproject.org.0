Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B156664871F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 17:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458112.715981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gi4-0004Wt-VD; Fri, 09 Dec 2022 16:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458112.715981; Fri, 09 Dec 2022 16:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gi4-0004UC-Rn; Fri, 09 Dec 2022 16:58:52 +0000
Received: by outflank-mailman (input) for mailman id 458112;
 Fri, 09 Dec 2022 16:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YXUj=4H=tibco.com=rlagerwall@srs-se1.protection.inumbo.net>)
 id 1p3geG-0004PJ-1G
 for xen-devel@lists.xen.org; Fri, 09 Dec 2022 16:54:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33b6dba6-77e2-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 17:54:55 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id h12so5779711wrv.10
 for <xen-devel@lists.xen.org>; Fri, 09 Dec 2022 08:54:53 -0800 (PST)
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
X-Inumbo-ID: 33b6dba6-77e2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hiNiRveniIWTlNkwBA6N2LNiLksGBI1cCad1zUOeWnE=;
        b=WOsgh38z6j7gFDAceqkxkSW6O6ZuyNPfjglT8VR1hJKCMHp2iR9rJ36L5TD2uKpCDz
         UbJeJDRfLK/Tff/ADrBnRbDwXXNgHd+4aHGp7Cu1gjpfR51lnPqqPfxjuZ/vdXQJLtxq
         zgzRr8DDnEPqDZ4sgH6SR7Y4HeZqh3IAz45Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiNiRveniIWTlNkwBA6N2LNiLksGBI1cCad1zUOeWnE=;
        b=2RA8PE2TdV6FcnhEOetNwhHmqLGpQ4rEs01G8yUQl8b5SVkYViQ4xEOk/oCshYGHd/
         CSfkCKsZIZMqyKfkw0d+vmZ0LuDI4icchFhssPz9FhNq/PtpVwk5uba4fV7uRNahLhR1
         VE9vW/nGImUruGZOtzIgY0G+uhEnVeoHUFkarOJ8Y+tzVvC5B661TBKoTgO7bnnrXrzg
         MQvEresZ/ZFeWMi99PaWFDeYPdvAJjGXgl2LtOxRFb2TQ5wEgbVE2qhUjkZ7H1x5EX1B
         8H9QVcHiqfjQ0hvKrlKjJFJ50HhprXWaMSkbWPK33432joZs1ahNuOkPJduq9pRht1yT
         ptMA==
X-Gm-Message-State: ANoB5pk7JpJinw60dn1P/jZ2xzEEcQ+97Vw33hk/mqPIxJuBxctuZgPu
	/OzsgUXDeSudUMpSFiqvXiSu/mWAD/3aTo0INW0D
X-Google-Smtp-Source: AA0mqf7C3IMgsXlgkMbT3SaqvkqMqsDa3dsKnjbCPyBzbfny337eZqsvVJkqMH6sfdgXpakEtCYPD6Azh09KKf1ozkk=
X-Received: by 2002:a5d:6243:0:b0:236:6b05:a8be with SMTP id
 m3-20020a5d6243000000b002366b05a8bemr55657657wrv.346.1670604892899; Fri, 09
 Dec 2022 08:54:52 -0800 (PST)
MIME-Version: 1.0
References: <E1p2ZhW-0005Xe-FG@xenbits.xenproject.org> <mafs0lenhlwcv.fsf@dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com>
 <e22fcdce-f029-de46-81a6-60f5ffc9c9a2@suse.com>
In-Reply-To: <e22fcdce-f029-de46-81a6-60f5ffc9c9a2@suse.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 9 Dec 2022 16:54:41 +0000
Message-ID: <CAG7k0EpOz=X8AFw-wE-0OEA98_w77PNmVg_AE-R8mc7sBcsr9w@mail.gmail.com>
Subject: Re: Xen Security Advisory 424 v1 (CVE-2022-42328,CVE-2022-42329) -
 Guests can trigger deadlock in Linux netback driver
To: Juergen Gross <jgross@suse.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>, "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org, 
	xen-devel@lists.xen.org, xen-users@lists.xen.org, 
	oss-security@lists.openwall.com, 
	"Xen.org security team" <security-team-members@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 4:13 PM Juergen Gross <jgross@suse.com> wrote:
>
> On 08.12.22 16:59, Pratyush Yadav wrote:
> >
> > Hi,
> >
> > I noticed one interesting thing about this patch but I'm not familiar
> > enough with the driver to say for sure what the right thing is.
> >
> > On Tue, Dec 06 2022, Xen.org security team wrote:
> >
> > [...]
> >>
> >>  From cfdf8fd81845734b6152b4617746c1127ec52228 Mon Sep 17 00:00:00 2001
> >> From: Juergen Gross <jgross@suse.com>
> >> Date: Tue, 6 Dec 2022 08:54:24 +0100
> >> Subject: [PATCH] xen/netback: don't call kfree_skb() with interrupts disabled
> >>
> >> It is not allowed to call kfree_skb() from hardware interrupt
> >> context or with interrupts being disabled. So remove kfree_skb()
> >> from the spin_lock_irqsave() section and use the already existing
> >> "drop" label in xenvif_start_xmit() for dropping the SKB. At the
> >> same time replace the dev_kfree_skb() call there with a call of
> >> dev_kfree_skb_any(), as xenvif_start_xmit() can be called with
> >> disabled interrupts.
> >>
> >> This is XSA-424 / CVE-2022-42328 / CVE-2022-42329.
> >>
> >> Fixes: be81992f9086 ("xen/netback: don't queue unlimited number of packages")
> >> Reported-by: Yang Yingliang <yangyingliang@huawei.com>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >>   drivers/net/xen-netback/common.h    | 2 +-
> >>   drivers/net/xen-netback/interface.c | 6 ++++--
> >>   drivers/net/xen-netback/rx.c        | 8 +++++---
> >>   3 files changed, 10 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
> >> index 1545cbee77a4..3dbfc8a6924e 100644
> >> --- a/drivers/net/xen-netback/common.h
> >> +++ b/drivers/net/xen-netback/common.h
> >> @@ -386,7 +386,7 @@ int xenvif_dealloc_kthread(void *data);
> >>   irqreturn_t xenvif_ctrl_irq_fn(int irq, void *data);
> >>
> >>   bool xenvif_have_rx_work(struct xenvif_queue *queue, bool test_kthread);
> >> -void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb);
> >> +bool xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb);
> >>
> >>   void xenvif_carrier_on(struct xenvif *vif);
> >>
> >> diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
> >> index 650fa180220f..f3f2c07423a6 100644
> >> --- a/drivers/net/xen-netback/interface.c
> >> +++ b/drivers/net/xen-netback/interface.c
> >> @@ -254,14 +254,16 @@ xenvif_start_xmit(struct sk_buff *skb, struct net_device *dev)
> >>      if (vif->hash.alg == XEN_NETIF_CTRL_HASH_ALGORITHM_NONE)
> >>              skb_clear_hash(skb);
> >>
> >> -    xenvif_rx_queue_tail(queue, skb);
> >> +    if (!xenvif_rx_queue_tail(queue, skb))
> >> +            goto drop;
> >> +
> >>      xenvif_kick_thread(queue);
> >>
> >>      return NETDEV_TX_OK;
> >>
> >>    drop:
> >>      vif->dev->stats.tx_dropped++;
> >
> > Now tx_dropped is incremented on packet drop...
> >
> >> -    dev_kfree_skb(skb);
> >> +    dev_kfree_skb_any(skb);
> >>      return NETDEV_TX_OK;
> >>   }
> >>
> >> diff --git a/drivers/net/xen-netback/rx.c b/drivers/net/xen-netback/rx.c
> >> index 932762177110..0ba754ebc5ba 100644
> >> --- a/drivers/net/xen-netback/rx.c
> >> +++ b/drivers/net/xen-netback/rx.c
> >> @@ -82,9 +82,10 @@ static bool xenvif_rx_ring_slots_available(struct xenvif_queue *queue)
> >>      return false;
> >>   }
> >>
> >> -void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
> >> +bool xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
> >>   {
> >>      unsigned long flags;
> >> +    bool ret = true;
> >>
> >>      spin_lock_irqsave(&queue->rx_queue.lock, flags);
> >>
> >> @@ -92,8 +93,7 @@ void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
> >>              struct net_device *dev = queue->vif->dev;
> >>
> >>              netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));
> >> -            kfree_skb(skb);
> >> -            queue->vif->dev->stats.rx_dropped++;
> >
> > ... but earlier rx_dropped was incremented.
> >
> > Which one is actually correct? This line was added by be81992f9086b
> > ("xen/netback: don't queue unlimited number of packages"), which was the
> > fix for XSA-392. I think incrementing tx_dropped is the right thing to
> > do, as was done before XSA-392 but it would be nice if someone else
> > takes a look at this as well.
>
> Yes, I think the XSA-392 patch was wrong in this regard.
>

Netback calls this rx (to-guest) traffic so rx_dropped seems better. On the
other hand, the networking stack thinks of this as tx since the packet is going
from the networking stack to the NIC driver...

Regardless, it is currently inconsistent since to-guest traffic increments
tx_dropped if it is dropped because the rx queue len is too long but it
increments rx_dropped if those same packets are dropped when they expire in the
rx queue.

I also see that the tx path (from-guest) doesn't increment any dropped counters
when it drops a packet.

Ross

