Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD1A31DA68
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 14:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86268.161827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCMtJ-00088K-TE; Wed, 17 Feb 2021 13:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86268.161827; Wed, 17 Feb 2021 13:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCMtJ-00087v-Pg; Wed, 17 Feb 2021 13:29:17 +0000
Received: by outflank-mailman (input) for mailman id 86268;
 Wed, 17 Feb 2021 13:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4zEa=HT=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1lCMtI-00087q-CS
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 13:29:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9880bbd2-ba38-45a0-a00b-2974685bad31;
 Wed, 17 Feb 2021 13:29:15 +0000 (UTC)
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
X-Inumbo-ID: 9880bbd2-ba38-45a0-a00b-2974685bad31
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613568555;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bp3fBtBumnQYDuMT4p4O4vegfrz8kk/nF90ppoE+EIQ=;
  b=GUGOGoBqzJ98mWrdB1Xf/t7r4p6w4QMXIW53oyws7NDPNqOuNDHuI5K9
   aAJwl2ZDakcWECFlcZIIfEEF91ICiYuGC7MHb/47Ld247wB3PPg7p9HqV
   Z8lzm4W9S7UTRoExQVRMfB+c2tAqFfRFA64QD1ZIxh4AqT2jimZaSOUh8
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o7LaJcbQT5QuBw1xPwkFm1kmmIpHK9sbb9lZj5IyJs4mA6AKdPwwmE6rjsZVBkmNqq+f1rg7v9
 LhPjd42AWS+GmnJwjqQu2oMcrOsirvyJVxH5cCnpbZzFpjLStPB9qB5/CJH5wL2kyX3hIiHH41
 BiJdvO1WYeF49G5IAxgFWe2Doce5WdQcFnPhB0gMWpqLGNUyZ04XS+fO43Jds6xWB/x8VdXjLc
 TVqBAY/waBGvsB5Nt+Gp+8G4G7JcUyHaEeserRUmk28EhENWIwM7fRM4ds93N++2/jeX9TnB7a
 ItU=
X-SBRS: 5.1
X-MesageID: 37785213
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37785213"
Subject: Re: [PATCH v2 8/8] xen/evtchn: use READ/WRITE_ONCE() for accessing
 ring indices
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-9-jgross@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <6818fcde-abab-1250-119c-d0ccb8c80488@citrix.com>
Date: Wed, 17 Feb 2021 13:29:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211101616.13788-9-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-02-11 10:16, Juergen Gross wrote:
> For avoiding read- and write-tearing by the compiler use READ_ONCE()
> and WRITE_ONCE() for accessing the ring indices in evtchn.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - modify all accesses (Julien Grall)
> ---
>  drivers/xen/evtchn.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
> index 421382c73d88..620008f89dbe 100644
> --- a/drivers/xen/evtchn.c
> +++ b/drivers/xen/evtchn.c
> @@ -162,6 +162,7 @@ static irqreturn_t evtchn_interrupt(int irq, void *data)
>  {
>  	struct user_evtchn *evtchn = data;
>  	struct per_user_data *u = evtchn->user;
> +	unsigned int prod, cons;
>  
>  	WARN(!evtchn->enabled,
>  	     "Interrupt for port %u, but apparently not enabled; per-user %p\n",
> @@ -171,10 +172,14 @@ static irqreturn_t evtchn_interrupt(int irq, void *data)
>  
>  	spin_lock(&u->ring_prod_lock);
>  
> -	if ((u->ring_prod - u->ring_cons) < u->ring_size) {
> -		*evtchn_ring_entry(u, u->ring_prod) = evtchn->port;
> +	prod = READ_ONCE(u->ring_prod);
> +	cons = READ_ONCE(u->ring_cons);
> +
> +	if ((prod - cons) < u->ring_size) {
> +		*evtchn_ring_entry(u, prod) = evtchn->port;
>  		smp_wmb(); /* Ensure ring contents visible */
> -		if (u->ring_cons == u->ring_prod++) {
> +		if (cons == prod++) {
> +			WRITE_ONCE(u->ring_prod, prod);
>  			wake_up_interruptible(&u->evtchn_wait);
>  			kill_fasync(&u->evtchn_async_queue,
>  				    SIGIO, POLL_IN);

This doesn't work correctly since now u->ring_prod is only updated if cons == prod++.

Ross

