Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E4654930
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 00:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468744.727931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Um9-0002H1-La; Thu, 22 Dec 2022 23:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468744.727931; Thu, 22 Dec 2022 23:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Um9-0002Er-I2; Thu, 22 Dec 2022 23:14:57 +0000
Received: by outflank-mailman (input) for mailman id 468744;
 Thu, 22 Dec 2022 23:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8Um8-0002Ei-8i
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 23:14:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7170ba42-824e-11ed-91b6-6bf2151ebd3b;
 Fri, 23 Dec 2022 00:14:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A202061D66;
 Thu, 22 Dec 2022 23:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E24C433EF;
 Thu, 22 Dec 2022 23:14:52 +0000 (UTC)
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
X-Inumbo-ID: 7170ba42-824e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671750893;
	bh=JA2bLvlEnV7mEWPSobqdn6WnIG1Hk0vKA9vXUhZr3r0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CmZ7q4WO0WV2j2CrZbQTU1MyVtB46zbwFfCmEE0gcJ2FYIX3EE8F8NweOSA5d62I4
	 OWJrQWeRRoK5b8544OUZYaSUkcEwqhd4vouoYgbCoMR4+X4Exi1iV5jGU38QAQKAHt
	 Je5eBnJgvRqnsaL/P7h8sGzeblmhexLBCvbVCIv0+d8/Udw0A40gJE3BXv7zA+lhf1
	 TFdkd773qTpa8Jch8TL355+ESbXVqO6q+Nc1aZsMVCgxlw5eYjUBB5lE2lXVldPy4g
	 Cnx/ev3Ix1Xdd4xdqndxGUVRGl7hHoKzoPxHZwQRlH5/SozEnCQYYe6IAGcDQxiQpq
	 aKV+XNRPjJIRg==
Date: Thu, 22 Dec 2022 15:14:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] xen/pvcalls: free active map buffer on
 pvcalls_front_free_map
In-Reply-To: <6a762ee32dd655cbb09a4aa0e2307e8919761311.1671531297.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2212221514360.4079@ubuntu-linux-20-04-desktop>
References: <6a762ee32dd655cbb09a4aa0e2307e8919761311.1671531297.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Dec 2022, Oleksii Moisieiev wrote:
> Data buffer for active map is allocated in alloc_active_ring and freed
> in free_active_ring function, which is used only for the error
> cleanup. pvcalls_front_release is calling pvcalls_front_free_map which
> ends foreign access for this buffer, but doesn't free allocated pages.
> Call free_active_ring to clean all allocated resources.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/pvcalls-front.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
> index 1826e8e67125..9b569278788a 100644
> --- a/drivers/xen/pvcalls-front.c
> +++ b/drivers/xen/pvcalls-front.c
> @@ -225,6 +225,8 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static void free_active_ring(struct sock_mapping *map);
> +
>  static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
>  				   struct sock_mapping *map)
>  {
> @@ -240,7 +242,7 @@ static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
>  	for (i = 0; i < (1 << PVCALLS_RING_ORDER); i++)
>  		gnttab_end_foreign_access(map->active.ring->ref[i], NULL);
>  	gnttab_end_foreign_access(map->active.ref, NULL);
> -	free_page((unsigned long)map->active.ring);
> +	free_active_ring(map);
>  
>  	kfree(map);
>  }
> -- 
> 2.25.1
> 

