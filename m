Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F46CBC95
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515636.798711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6em-000810-GO; Tue, 28 Mar 2023 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515636.798711; Tue, 28 Mar 2023 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6em-0007yK-Co; Tue, 28 Mar 2023 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 515636;
 Tue, 28 Mar 2023 10:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DUVK=7U=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ph6ek-0007yC-Lw
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:34:22 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a17a31f-cd54-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:34:21 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id y35so9470906ljq.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 03:34:21 -0700 (PDT)
Received: from [192.168.0.106] ([91.123.150.38])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a2e9456000000b0029caabd3c7asm3754253ljh.54.2023.03.28.03.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 03:34:20 -0700 (PDT)
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
X-Inumbo-ID: 1a17a31f-cd54-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679999661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBJXkpYafqivBcbNlrQuUJmPyhRhZxAZpwT/By5GE8w=;
        b=p9qWyY2EK1v3QYhsmBzD8YVLpewv4/lw1ue1sdIACv5OgEFk9uirTqMMO5mzh+A2gc
         u5iKU8WxBOdw4Ts2ktB3677dF9vrThll2ObDxgS0ZMrkh+7ccZs83Vqq9kmK5pEtb5eg
         EJVSoyT0x64QjPnytXMKujaUAJJlAAmVNQs/zXPSlPtKxZa63ZaDo/BhLOAMIenQINTR
         ZpHOuC1w19cU7V8e3tyJKHgJGAkDXp/4SgxnuQ2TaKCOHFfROCirdLP3sfS+VAiosFOt
         VGXAA3asOpCiCk6xnFoW7trGUrUowAnO+FXSoaylypsmHvnohSAcH+7kDp8vHZvum2gC
         4ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679999661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBJXkpYafqivBcbNlrQuUJmPyhRhZxAZpwT/By5GE8w=;
        b=7eHgfGBktoIJmfAi75HkLnKewbS371vYD5HiB+tPobUDcNWr1pP+vfUupEud4YIujA
         CCzgNppUhF2vAouboxumgCTeYCa4QC4fv9w9ZQ+uR9HE+aahwy+yxuCnz5USBfc8+D1G
         gu4mvwKShs4hSlPCWVXzA+NhzkurIu/oXBfXvq+n4jdUfpBpV7pyui0wC8qgODSxE7eG
         Vcft/DR4IVp9/iikxYTgTyLkY+RTUc6qa9KZmdpEUgKZXo8nMTVeP/0yh44/8q1ypbmz
         DIfMb49D/TKG8VvGYVh8V95gMmt5Ri4Bmy+ksBJJp8IadWs9M1Bu6Xb5A+yS6QIVRRhI
         KtTg==
X-Gm-Message-State: AAQBX9ep9o8Atzj3aQ9bNY7PljC9y49d3fI34UtO7rgqPgdjwfQKgxIY
	GQst6iA2Tv2oOrlJEgJk4PM=
X-Google-Smtp-Source: AKy350bJGqbczSZTknHZ2qtR5hvBR/MKIbLAWmTKZVOxrO9lfjfd0j+EsUWfNQhawriVY4xpX6TZ1A==
X-Received: by 2002:a2e:9d83:0:b0:299:57eb:ef34 with SMTP id c3-20020a2e9d83000000b0029957ebef34mr4472155ljj.53.1679999661072;
        Tue, 28 Mar 2023 03:34:21 -0700 (PDT)
Message-ID: <a9799084-fef5-73b2-3631-6d61c713a18f@gmail.com>
Date: Tue, 28 Mar 2023 13:34:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/pvcalls: don't call bind_evtchn_to_irqhandler() under
 lock
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Dan Carpenter <error27@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20230328093924.12260-1-jgross@suse.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20230328093924.12260-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.03.23 12:39, Juergen Gross wrote:

Hello Juergen


> bind_evtchn_to_irqhandler() shouldn't be called under spinlock, as it
> can sleep.
> 
> This requires to move the calls of create_active() out of the locked
> regions. This is no problem, as the worst which could happen would be
> a spurious call of the interrupt handler, causing a spurious wake_up().
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/lkml/Y+JUIl64UDmdkboh@kadam/
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/xen/pvcalls-front.c | 46 ++++++++++++++++++++++---------------
>   1 file changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
> index d5d589bda243..6e5d712e3115 100644
> --- a/drivers/xen/pvcalls-front.c
> +++ b/drivers/xen/pvcalls-front.c
> @@ -227,22 +227,31 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
>   
>   static void free_active_ring(struct sock_mapping *map);
>   
> -static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
> -				   struct sock_mapping *map)
> +static void pvcalls_front_destroy_active(struct pvcalls_bedata *bedata,
> +					 struct sock_mapping *map)
>   {
>   	int i;
>   
>   	unbind_from_irqhandler(map->active.irq, map);
>   
> -	spin_lock(&bedata->socket_lock);
> -	if (!list_empty(&map->list))
> -		list_del_init(&map->list);
> -	spin_unlock(&bedata->socket_lock);
> +	if (bedata) {
> +		spin_lock(&bedata->socket_lock);
> +		if (!list_empty(&map->list))
> +			list_del_init(&map->list);
> +		spin_unlock(&bedata->socket_lock);
> +	}
>   
>   	for (i = 0; i < (1 << PVCALLS_RING_ORDER); i++)
>   		gnttab_end_foreign_access(map->active.ring->ref[i], NULL);
>   	gnttab_end_foreign_access(map->active.ref, NULL);
> +
>   	free_active_ring(map);
> +}
> +
> +static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
> +				   struct sock_mapping *map)
> +{
> +	pvcalls_front_destroy_active(bedata, map);
>   
>   	kfree(map);
>   }
> @@ -433,19 +442,18 @@ int pvcalls_front_connect(struct socket *sock, struct sockaddr *addr,
>   		pvcalls_exit_sock(sock);
>   		return ret;
>   	}
> -
> -	spin_lock(&bedata->socket_lock);
> -	ret = get_request(bedata, &req_id);
> +	ret = create_active(map, &evtchn);
>   	if (ret < 0) {
> -		spin_unlock(&bedata->socket_lock);
>   		free_active_ring(map);
>   		pvcalls_exit_sock(sock);
>   		return ret;
>   	}
> -	ret = create_active(map, &evtchn);
> +
> +	spin_lock(&bedata->socket_lock);
> +	ret = get_request(bedata, &req_id);
>   	if (ret < 0) {
>   		spin_unlock(&bedata->socket_lock);
> -		free_active_ring(map);
> +		pvcalls_front_destroy_active(NULL, map);
>   		pvcalls_exit_sock(sock);
>   		return ret;
>   	}
> @@ -821,28 +829,28 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
>   		pvcalls_exit_sock(sock);
>   		return ret;
>   	}
> -	spin_lock(&bedata->socket_lock);
> -	ret = get_request(bedata, &req_id);
> +	ret = create_active(map2, &evtchn);
>   	if (ret < 0) {
> +		free_active_ring(map2);
> +		kfree(map2);
>   		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
>   			  (void *)&map->passive.flags);
>   		spin_unlock(&bedata->socket_lock);


Looks like we also need to remove spin_unlock() above, correct?


> -		free_active_ring(map2);
> -		kfree(map2);
>   		pvcalls_exit_sock(sock);
>   		return ret;
>   	}
>   
> -	ret = create_active(map2, &evtchn);
> +	spin_lock(&bedata->socket_lock);
> +	ret = get_request(bedata, &req_id);
>   	if (ret < 0) {
> -		free_active_ring(map2);
> -		kfree(map2);
>   		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
>   			  (void *)&map->passive.flags);
>   		spin_unlock(&bedata->socket_lock);
> +		pvcalls_front_free_map(bedata, map2);
>   		pvcalls_exit_sock(sock);
>   		return ret;
>   	}
> +
>   	list_add_tail(&map2->list, &bedata->socket_mappings);
>   
>   	req = RING_GET_REQUEST(&bedata->ring, req_id);

