Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D935E6F4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 21:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110112.210173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWOSn-0005AC-84; Tue, 13 Apr 2021 19:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110112.210173; Tue, 13 Apr 2021 19:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWOSn-00059n-4m; Tue, 13 Apr 2021 19:12:41 +0000
Received: by outflank-mailman (input) for mailman id 110112;
 Tue, 13 Apr 2021 19:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zkz=JK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lWOSl-00059i-Nz
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 19:12:39 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1fe3d49-a8bf-494f-b213-7f60c7e5eb3f;
 Tue, 13 Apr 2021 19:12:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so11327709wma.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Apr 2021 12:12:38 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id p16sm24398411wrt.54.2021.04.13.12.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 12:12:37 -0700 (PDT)
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
X-Inumbo-ID: f1fe3d49-a8bf-494f-b213-7f60c7e5eb3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UCAErql/3GJUYEPMVWfjyQstMGyTsmIR1XNUYPtAWYo=;
        b=FGl4Q82P6oyI9bGPAOBmg8PqSeOQD0Dd66S8UD4pI6IVwQ1e+hJLAC4ySP1pxTsnbr
         0PyBhhRqdZaCNxztxwlji33sdde/Mr9LeiiGyEu6yNV/YywdyAOStQbUtMr/lUI0fv0f
         FLIqOqinH9ZhlToeXv82PGnpC1kbUfWIEonzOnE1jUfEUh3WZkPrCY2mLb6x77H84B/j
         bc88jRZhh7Qmj1urPQ6yTb1SoHK2qJrHKJeTvXlVHGCgDR3HDoEYer9x3CUovgJCYpcn
         QMAMJyiuei6cYnLZHxXb4kPlP0ODbgVz21g85/tthXUsnhfgG34Ojp3zM4Feoou3NLF/
         EQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UCAErql/3GJUYEPMVWfjyQstMGyTsmIR1XNUYPtAWYo=;
        b=OykiJncezLc4f2Eb/NMg9wCP8KxRGi9wndpnx7qpkeXolMFKoKfbCQIXvy9qkmWe5e
         wNX9kEIZ5yucLdKZBVNn2MGeTfqjdK3DWPoZJRlHMHVUWLRXTwARCLZUQZ1FABtjDtEC
         8E7Sittq+TOGxYam+05Xx6ztd+7I35CqlJfwxDoOC4PdnFwW220ItgfGQzR9+nOd6mC9
         pOJHTwiHfTeALd2ihu5aaZ0aJGfbAxFqJPnU+vLUUMvTVv82nfNgWbbp8Gyrrm1LVLYq
         2vbu4X4OroST48RqbFFcGf9f4ZAJYB3InHx1QIKtPqOWlrGF/Tmo2YPWPMhwdfSKXpfx
         +L/w==
X-Gm-Message-State: AOAM5321zwBmtcl+OP9q0uo4QQekuJ0qa33aRUDU3ZP8YvcdhpodlrYT
	JGXNBp8HoD09nEwmShpeASY=
X-Google-Smtp-Source: ABdhPJzzQ4Dai6tUIzDN9x5kCNiwCsxb63EEAEQvCWXFt18S9htvBA3AIXd2zsZ5QgDN71rb4HH11w==
X-Received: by 2002:a1c:7707:: with SMTP id t7mr1437466wmi.76.1618341158022;
        Tue, 13 Apr 2021 12:12:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
To: Michael Brown <mbrown@fensystems.co.uk>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, wei.liu@kernel.org, pdurrant@amazon.com
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk>
Message-ID: <8bd038a2-b870-4f9b-733d-77efe7b9afe1@xen.org>
Date: Tue, 13 Apr 2021 20:12:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413152512.903750-1-mbrown@fensystems.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/04/2021 16:25, Michael Brown wrote:
> The logic in connect() is currently written with the assumption that
> xenbus_watch_pathfmt() will return an error for a node that does not
> exist.  This assumption is incorrect: xenstore does allow a watch to
> be registered for a nonexistent node (and will send notifications
> should the node be subsequently created).
> 
> As of commit 1f2565780 ("xen-netback: remove 'hotplug-status' once it
> has served its purpose"), this leads to a failure when a domU
> transitions into XenbusStateConnected more than once.  On the first
> domU transition into Connected state, the "hotplug-status" node will
> be deleted by the hotplug_status_changed() callback in dom0.  On the
> second or subsequent domU transition into Connected state, the
> hotplug_status_changed() callback will therefore never be invoked, and
> so the backend will remain stuck in InitWait.
> 
> This failure prevents scenarios such as reloading the xen-netfront
> module within a domU, or booting a domU via iPXE.  There is
> unfortunately no way for the domU to work around this dom0 bug.
> 
> Fix by explicitly checking for existence of the "hotplug-status" node,
> thereby creating the behaviour that was previously assumed to exist.
> 
> Signed-off-by: Michael Brown <mbrown@fensystems.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   drivers/net/xen-netback/xenbus.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
> index a5439c130130..d24b7a7993aa 100644
> --- a/drivers/net/xen-netback/xenbus.c
> +++ b/drivers/net/xen-netback/xenbus.c
> @@ -824,11 +824,15 @@ static void connect(struct backend_info *be)
>   	xenvif_carrier_on(be->vif);
>   
>   	unregister_hotplug_status_watch(be);
> -	err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch, NULL,
> -				   hotplug_status_changed,
> -				   "%s/%s", dev->nodename, "hotplug-status");
> -	if (!err)
> +	if (xenbus_exists(XBT_NIL, dev->nodename, "hotplug-status")) {
> +		err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch,
> +					   NULL, hotplug_status_changed,
> +					   "%s/%s", dev->nodename,
> +					   "hotplug-status");
> +		if (err)
> +			goto err;
>   		be->have_hotplug_status_watch = 1;
> +	}
>   
>   	netif_tx_wake_all_queues(be->vif->dev);
>   
> 


