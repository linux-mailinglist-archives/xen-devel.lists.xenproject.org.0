Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F241ED3C9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVh6-0004eu-Uc; Wed, 03 Jun 2020 15:52:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vfig=7Q=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1jgVh5-0004ep-7V
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:52:43 +0000
X-Inumbo-ID: 41bf58ee-a5b2-11ea-ad55-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41bf58ee-a5b2-11ea-ad55-12813bfff9fa;
 Wed, 03 Jun 2020 15:52:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f185so2629086wmf.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 08:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GshwwJK66k7h/1UU+52GCjHZuAKqpljzNfx76xeZPt4=;
 b=enT8HCI9OMw2joljmRdGfAU788Emf5KObjrcpW8S7gDnaIfPCHFuvTy86QFHevtnhJ
 mWCLqL8qg1Akkip8oKdD9QdyMVjdBMeMmui/QyK2NlLgxBCoUu4Z9FBZGNtvaJJrVwAP
 tS3uC/gQ6busJ8VPjAIX+NXCMNphEi0h1hMg51/OW1TomNkB7Zu5yEB5J38XJ7LfspMl
 VDDh815+Whli7U37bmUxB6BtGli9jr3qRLa5+WRJoRdSO7OOT7jVHt67jJEMQizSsDIr
 tH/EpArN1iyBw0q+2R4o3y1bVqV/4ccupDAPksfj3Eqd1xH9wj41qH6pafde8Y21/AUT
 mUzA==
X-Gm-Message-State: AOAM531ouwqzV3GBCjFYJEqB6EjJIA0Q0/8eFxKbrZI6KlkbTTL5xLKl
 2gZJ5hy8gOu0BEJPWKdaHvk=
X-Google-Smtp-Source: ABdhPJy45eTUcvKlAMQ1mw383qBdgAbYNBqftkPcf5LN6qB0nnXU+RkkQ6r2u0ExFdKJmaCb6WDfng==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr9537000wmj.149.1591199531131; 
 Wed, 03 Jun 2020 08:52:11 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q4sm3439264wma.47.2020.06.03.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 08:52:10 -0700 (PDT)
Date: Wed, 3 Jun 2020 15:52:08 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH] xen-netback: use kstrdup() in connect_data_rings()
Message-ID: <20200603155208.qmko4nd5on76k7c4@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200603152643.18215-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603152643.18215-1-efremov@linux.com>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 06:26:43PM +0300, Denis Efremov wrote:
> Use kstrdup() instead of opencoded alloc and copy. kzalloc() is
> excessive here.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

> ---
>  drivers/net/xen-netback/xenbus.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
> index 286054b60d47..69352154a51b 100644
> --- a/drivers/net/xen-netback/xenbus.c
> +++ b/drivers/net/xen-netback/xenbus.c
> @@ -839,13 +839,12 @@ static int connect_data_rings(struct backend_info *be,
>  	 * queue-N.
>  	 */
>  	if (num_queues == 1) {
> -		xspath = kzalloc(strlen(dev->otherend) + 1, GFP_KERNEL);
> +		xspath = kstrdup(dev->otherend, GFP_KERNEL);
>  		if (!xspath) {
>  			xenbus_dev_fatal(dev, -ENOMEM,
>  					 "reading ring references");
>  			return -ENOMEM;
>  		}
> -		strcpy(xspath, dev->otherend);
>  	} else {
>  		xspathsize = strlen(dev->otherend) + xenstore_path_ext_size;
>  		xspath = kzalloc(xspathsize, GFP_KERNEL);
> -- 
> 2.26.2
> 

