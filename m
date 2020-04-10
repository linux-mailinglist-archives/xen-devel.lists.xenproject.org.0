Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82821A47D5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 17:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMvW8-0007wY-HY; Fri, 10 Apr 2020 15:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PXqy=52=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jMvW6-0007wT-Ib
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 15:24:26 +0000
X-Inumbo-ID: 5cd1e086-7b3f-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cd1e086-7b3f-11ea-b58d-bc764e2007e4;
 Fri, 10 Apr 2020 15:24:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4565C206F7;
 Fri, 10 Apr 2020 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586532265;
 bh=YAh7F8xqHYA/YYq63Fw4pG/inlVkd2YY4Y0mqVN0Y9w=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=k70eLZfHUtQ2Pbb5jyVkNmqTFx2MpQUakHbDZZpZWO2N4NBDibqs0LkdKrIzhFHZ3
 Rf30ZtpeU9sXmnwd+wMYlsXOscYDGX4MEWNvnTLSChicge4pmgTiZ6Bm1dGPca4P/s
 iMni8Bwaz8wnaZa4Gw4hCgjc0MW876J1QILgRfBw=
Date: Fri, 10 Apr 2020 08:24:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] xen/pvcalls: Make pvcalls_back_global static
In-Reply-To: <20200410115620.33024-1-yuehaibing@huawei.com>
Message-ID: <alpine.DEB.2.21.2004100824020.19608@sstabellini-ThinkPad-T480s>
References: <20200410115620.33024-1-yuehaibing@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 10 Apr 2020, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/xen/pvcalls-back.c:30:3: warning:
>  symbol 'pvcalls_back_global' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/pvcalls-back.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
> index cf4ce3e9358d..4807704f8d69 100644
> --- a/drivers/xen/pvcalls-back.c
> +++ b/drivers/xen/pvcalls-back.c
> @@ -24,7 +24,7 @@
>  #define PVCALLS_VERSIONS "1"
>  #define MAX_RING_ORDER XENBUS_MAX_RING_GRANT_ORDER
>  
> -struct pvcalls_back_global {
> +static struct pvcalls_back_global {
>  	struct list_head frontends;
>  	struct semaphore frontends_lock;
>  } pvcalls_back_global;
> -- 
> 2.17.1
> 
> 

