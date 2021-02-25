Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318F3252BD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89842.169634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFItx-0001Ue-8N; Thu, 25 Feb 2021 15:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89842.169634; Thu, 25 Feb 2021 15:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFItx-0001TI-4w; Thu, 25 Feb 2021 15:50:05 +0000
Received: by outflank-mailman (input) for mailman id 89842;
 Thu, 25 Feb 2021 15:50:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFItw-0001Kf-1a
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:50:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0571cfaf-47d8-457c-bad8-be2127c852a5;
 Thu, 25 Feb 2021 15:50:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E437AF6F;
 Thu, 25 Feb 2021 15:50:02 +0000 (UTC)
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
X-Inumbo-ID: 0571cfaf-47d8-457c-bad8-be2127c852a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614268202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMucLcc56VqB9XHOjU5pnfmJJn7cw8SR0wP2s0f41So=;
	b=m4E/THIfEmiLFUtrLisy3y4MulXF0Hn74tAG/ulYjoiWMHR8j7Kqr3yazdNAd7Xlvrxt6e
	IDWXmO0BW/9vX04082mZnyLtdqyUeqk65wddwHOC5BT6ZkXWnyQvhNdOOrS6uaLsE1cVIm
	4PivqC1PGRt1oxvss9LpdTAAEqmMmHY=
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4ad0f83-e071-49f8-17a8-7fec0e226b9a@suse.com>
Date: Thu, 25 Feb 2021 16:50:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 16:24, Connor Davis wrote:
> Return from cpu_schedule_up when either cpu is 0 or
> NR_CPUS == 1. This fixes the following:
> 
> core.c: In function 'cpu_schedule_up':
> core.c:2769:19: error: array subscript 1 is above array bounds
> of 'struct vcpu *[1]' [-Werror=array-bounds]
>  2769 |     if ( idle_vcpu[cpu] == NULL )
>       |
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  xen/common/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9745a77eee..f5ec65bf9b 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2763,7 +2763,7 @@ static int cpu_schedule_up(unsigned int cpu)
>      cpumask_set_cpu(cpu, &sched_res_mask);
>  
>      /* Boot CPU is dealt with later in scheduler_init(). */
> -    if ( cpu == 0 )
> +    if ( cpu == 0 || NR_CPUS == 1 )
>          return 0;
>  
>      if ( idle_vcpu[cpu] == NULL )

I'm not convinced a compiler warning is due here, and in turn
I'm not sure we want/need to work around this the way you do.
First question is whether that's just a specific compiler
version that's flawed. If it's not just a special case (e.g.
some unreleased version) we may want to think of possible
alternatives - the addition looks really odd to me.

Jan

