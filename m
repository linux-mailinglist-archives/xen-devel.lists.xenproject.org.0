Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65E26D68F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 10:28:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIpHf-0004ao-6F; Thu, 17 Sep 2020 08:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIpHd-0004ae-H0
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 08:28:49 +0000
X-Inumbo-ID: f7d2f3f8-c78a-4383-9c60-d8d8c5f08e06
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7d2f3f8-c78a-4383-9c60-d8d8c5f08e06;
 Thu, 17 Sep 2020 08:28:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600331317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuI/Z21T+Gy1DYCHxvfheYqm3XUJRugMIOuJEmuUcWM=;
 b=GFnDmwtHsYK/cFAbOGP31lvoPnmXG4UABd2fRyy46FnaNv50wGeZCMQbG/8n+DeEzJsWZQ
 Y26q9PqLLDFNC6lCrTyMM8kFFify3zb1QQb40Xsf0GaiysQ5POLCYtXzPECmdxpHHclbfL
 vRqHKsyKEoU4sTLTm+l7jK5lMiBtQ5zAX6Er3VgTpWoMMnZV+OKzrOyS+ExkdPkoKaNwcp
 Ac8uvE+ctP33p5YDZRVxms8/i6xcMuM9daeq5uHy8hMJV2h0uPBgc7Y7rkpMmZVKzvxyYh
 4Jn1Jc6PxuLbXezmHEYDKuHqZU99MPBLCCcpckhyRWT3rmSaEJJAsZHnLwMFOw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D789AEAA;
 Thu, 17 Sep 2020 08:29:08 +0000 (UTC)
Subject: Re: [PATCH 4/5] sched/arinc653: Reorganize function definition order
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
Date: Thu, 17 Sep 2020 10:12:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.09.2020 20:18, Jeff Kubascik wrote:
> @@ -517,27 +516,35 @@ static const struct scheduler sched_arinc653_def = {
>      .sched_id       = XEN_SCHEDULER_ARINC653,
>      .sched_data     = NULL,
>  
> +    .global_init    = NULL,
>      .init           = a653sched_init,
>      .deinit         = a653sched_deinit,
>  
> -    .free_udata     = a653sched_free_udata,
> -    .alloc_udata    = a653sched_alloc_udata,
> +    .alloc_pdata    = NULL,
> +    .switch_sched   = a653sched_switch_sched,
> +    .deinit_pdata   = NULL,
> +    .free_pdata     = NULL,
>  
> +    .alloc_domdata  = NULL,
> +    .free_domdata   = NULL,
> +
> +    .alloc_udata    = a653sched_alloc_udata,
>      .insert_unit    = NULL,
>      .remove_unit    = NULL,
> +    .free_udata     = a653sched_free_udata,
>  
>      .sleep          = a653sched_unit_sleep,
>      .wake           = a653sched_unit_wake,
>      .yield          = NULL,
>      .context_saved  = NULL,
>  
> -    .do_schedule    = a653sched_do_schedule,
> -
>      .pick_resource  = a653sched_pick_resource,
> +    .migrate        = NULL,
>  
> -    .switch_sched   = a653sched_switch_sched,
> +    .do_schedule    = a653sched_do_schedule,
>  
>      .adjust         = NULL,
> +    .adjust_affinity= NULL,

Adding all these not really needed NULL initializers looks to rather move
this scheduler away from all the others. (Oddly enough all of them
explicitly set .sched_data to NULL - for whatever reason.)

Jan

