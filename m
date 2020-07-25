Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807822D299
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jul 2020 02:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz7dy-00019D-P3; Sat, 25 Jul 2020 00:02:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UE0=BE=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1jz7dx-000198-6o
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2020 00:02:25 +0000
X-Inumbo-ID: 1ca70e1e-ce0a-11ea-88d0-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ca70e1e-ce0a-11ea-88d0-bc764e2007e4;
 Sat, 25 Jul 2020 00:02:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 961C612756FEE;
 Fri, 24 Jul 2020 16:45:35 -0700 (PDT)
Date: Fri, 24 Jul 2020 17:02:20 -0700 (PDT)
Message-Id: <20200724.170220.1275270219725381485.davem@davemloft.net>
To: andrea.righi@canonical.com
Subject: Re: [PATCH v2] xen-netfront: fix potential deadlock in xennet_remove()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200724085910.GA1043801@xps-13>
References: <20200724085910.GA1043801@xps-13>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 24 Jul 2020 16:45:35 -0700 (PDT)
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
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kuba@kernel.org,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Andrea Righi <andrea.righi@canonical.com>
Date: Fri, 24 Jul 2020 10:59:10 +0200

> There's a potential race in xennet_remove(); this is what the driver is
> doing upon unregistering a network device:
> 
>   1. state = read bus state
>   2. if state is not "Closed":
>   3.    request to set state to "Closing"
>   4.    wait for state to be set to "Closing"
>   5.    request to set state to "Closed"
>   6.    wait for state to be set to "Closed"
> 
> If the state changes to "Closed" immediately after step 1 we are stuck
> forever in step 4, because the state will never go back from "Closed" to
> "Closing".
> 
> Make sure to check also for state == "Closed" in step 4 to prevent the
> deadlock.
> 
> Also add a 5 sec timeout any time we wait for the bus state to change,
> to avoid getting stuck forever in wait_event().
> 
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> ---
> Changes in v2:
>  - remove all dev_dbg() calls (as suggested by David Miller)

Applied, thank you.

