Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592A3328B0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95500.180311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdRu-00020v-Dj; Tue, 09 Mar 2021 14:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95500.180311; Tue, 09 Mar 2021 14:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdRu-00020W-Ad; Tue, 09 Mar 2021 14:35:02 +0000
Received: by outflank-mailman (input) for mailman id 95500;
 Tue, 09 Mar 2021 14:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWBa=IH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lJdRr-00020R-VM
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:35:00 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5c7b684-ed63-4554-a21f-ad3539ce4052;
 Tue, 09 Mar 2021 14:34:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b18so16031215wrn.6
 for <xen-devel@lists.xenproject.org>; Tue, 09 Mar 2021 06:34:58 -0800 (PST)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id b65sm4443957wmh.4.2021.03.09.06.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:34:57 -0800 (PST)
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
X-Inumbo-ID: f5c7b684-ed63-4554-a21f-ad3539ce4052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ykdKcwetsEeU37FFz/tVTnKAN0xhUHR88t1wWfcQWyU=;
        b=mhgUeHZuoQuRH8kFo5oGPpyk5NTo4PqmwKq3jW3b2ZTTVkQcx0C7PUpn+V5CQi0H/F
         XxlmjjRnGbJxhxY+hI+wTF/+JWZFQpzWyDtR7FRgo3OCQSCIIZN9NMZuf66XViD/O9KX
         3wdDPnFmxvyNioIe5lVcPUN3uOCuz5SDJOv+bYlbtTPtdNQ9BqK0RdrsJI6it+8IWIkB
         tnVRPeTgACeHigwfszCsOLIiSYi8SpL9MlcUNmdKpKJ/IBgQjy9Ol+7A/klT9SKc7kXv
         R5GDeBo1sXiRbrHrnMGsZu5ORUQZDywh/4Epvx84U1Hos0up5C0KyY7Z7bLPlyGgKHHf
         gJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:references:cc
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ykdKcwetsEeU37FFz/tVTnKAN0xhUHR88t1wWfcQWyU=;
        b=Dk+6nPIPJqbGYo8WcS/N+TeCqfbrpHuObER6tKhoXvF7Pox7sLWWR+ZTWjq1hSXCSn
         0AITeRBnqmnMz2+3OTFadvwvcEW5Ppu9WTU/n3tgMFgrncUmyqSfXhH4Hk8+T4VYQhVP
         E3y9UI7SqbgI+8xCMCC8Z+1fQYC8jd48AjnfGaZQhXQJyu26fI+b85aUjB1Us/2A/1tQ
         NfOtJ22MZ+RG2haQwNpnOxApWrh6aB62/kvGDm2SwfWWxXSxZ7SLkvD/hM+8Y7TDFpzU
         fshGT8BKZH2gUYOGxIaQrVRt3mhVcDzP/Y/M1TkvgyzKD/pGQoz2iX1ucd7cxlepXKGv
         bwqg==
X-Gm-Message-State: AOAM532FZfC8kpujfPX/BxtuQjzSn/emHRpxdKW6U91pNChbbk93R4eE
	NeTJeNbL5fCe0a6HwP1kB20wPZXOf0Q=
X-Google-Smtp-Source: ABdhPJygGFiNAPDkqYITUI9lc89Hyawt0GdntnVpjXdEtssej2edZEfAualjoS6vj7H3Iiy8F1XerQ==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr19849085wrj.391.1615300497786;
        Tue, 09 Mar 2021 06:34:57 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/2] xen-netback: add module parameter to disable
 ctrl-ring
To: xen-devel@lists.xenproject.org
References: <20210225122940.9310-1-andyhsu@amazon.com>
 <CEC939E8-3F18-46A0-B7B6-ECBE97678DAC@amazon.com>
Cc: wl@xen.org
Message-ID: <33c5f0f0-0e6e-a42c-46a5-405000715c1c@xen.org>
Date: Tue, 9 Mar 2021 14:34:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CEC939E8-3F18-46A0-B7B6-ECBE97678DAC@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/03/2021 14:10, Hsu, Chiahao wrote:
> ﻿On 25.02.21, 13:29, "Hsu, Chiahao" <andyhsu@amazon.com> wrote:
> 
>      In order to support live migration of guests between kernels
>      that do and do not support 'feature-ctrl-ring', we add a
>      module parameter that allows the feature to be disabled
>      at run time, instead of using hardcode value.
>      The default value is enable.
> 
>      Signed-off-by: ChiaHao Hsu <andyhsu@amazon.com>

You should directly CC maintainers, and also I don't see netdev in the 
To list... Did you send it there? I suspect not, since I don't see 
'net-next' in the prefix.

   Paul

>      ---
>       drivers/net/xen-netback/common.h  |  2 ++
>       drivers/net/xen-netback/netback.c |  6 ++++++
>       drivers/net/xen-netback/xenbus.c  | 13 ++++++++-----
>       3 files changed, 16 insertions(+), 5 deletions(-)
> 
>      diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
>      index 4a16d6e33c09..bfb7a3054917 100644
>      --- a/drivers/net/xen-netback/common.h
>      +++ b/drivers/net/xen-netback/common.h
>      @@ -276,6 +276,7 @@ struct backend_info {
>       	u8 have_hotplug_status_watch:1;
> 
>       	const char *hotplug_script;
>      +	bool ctrl_ring_enabled;
>       };
> 
>       struct xenvif {
>      @@ -413,6 +414,7 @@ static inline pending_ring_idx_t nr_pending_reqs(struct xenvif_queue *queue)
> 
>       irqreturn_t xenvif_interrupt(int irq, void *dev_id);
> 
>      +extern bool control_ring;
>       extern bool separate_tx_rx_irq;
>       extern bool provides_xdp_headroom;
> 
>      diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
>      index e5c73f819662..20d858f0456a 100644
>      --- a/drivers/net/xen-netback/netback.c
>      +++ b/drivers/net/xen-netback/netback.c
>      @@ -48,6 +48,12 @@
> 
>       #include <asm/xen/hypercall.h>
> 
>      +/* Provide an option to disable control ring which is used to pass
>      + * large quantities of data from frontend to backend.
>      + */
>      +bool control_ring = true;
>      +module_param(control_ring, bool, 0644);
>      +
>       /* Provide an option to disable split event channels at load time as
>        * event channels are limited resource. Split event channels are
>        * enabled by default.
>      diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
>      index a5439c130130..8a9169cff9c5 100644
>      --- a/drivers/net/xen-netback/xenbus.c
>      +++ b/drivers/net/xen-netback/xenbus.c
>      @@ -1123,11 +1123,14 @@ static int netback_probe(struct xenbus_device *dev,
>       	if (err)
>       		pr_debug("Error writing multi-queue-max-queues\n");
> 
>      -	err = xenbus_printf(XBT_NIL, dev->nodename,
>      -			    "feature-ctrl-ring",
>      -			    "%u", true);
>      -	if (err)
>      -		pr_debug("Error writing feature-ctrl-ring\n");
>      +	be->ctrl_ring_enabled = READ_ONCE(control_ring);
>      +	if (be->ctrl_ring_enabled) {
>      +		err = xenbus_printf(XBT_NIL, dev->nodename,
>      +				    "feature-ctrl-ring",
>      +				    "%u", true);
>      +		if (err)
>      +			pr_debug("Error writing feature-ctrl-ring\n");
>      +	}
> 
>       	backend_switch_state(be, XenbusStateInitWait);
> 
>      --
>      2.23.3
> 
> Gentle ping.
> 


