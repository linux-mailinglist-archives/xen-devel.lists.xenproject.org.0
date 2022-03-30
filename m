Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248144ECC43
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296488.504704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZd3J-0005IQ-OW; Wed, 30 Mar 2022 18:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296488.504704; Wed, 30 Mar 2022 18:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZd3J-0005GD-La; Wed, 30 Mar 2022 18:28:17 +0000
Received: by outflank-mailman (input) for mailman id 296488;
 Wed, 30 Mar 2022 18:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZd3H-0005G7-Hy
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:28:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28012c1f-b057-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 20:28:13 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648664890410787.5940034050689;
 Wed, 30 Mar 2022 11:28:10 -0700 (PDT)
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
X-Inumbo-ID: 28012c1f-b057-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1648664891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=npZtWjcW4Y/J370lH6QVMiYy9WI+s2IOK+SeiAbizYO9bdln5eUaKsMeFGpPv0i1pSgb7gnBT0QmaUY48HgBkvrHKqRekcEPfjHCxY/XymldtDWqXQ9XRaqYWhLECfFbfR2BYg8rmMNHm2rP/lFi1cBgotu+i3n/hfYY26FFUDQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648664891; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=V2Cdfw3qsK6arRjmn+bz49KzU3r8AsJyQmv3h+FjNVo=; 
	b=Fyoy4bkvX0d8PKAk22h3RWjg6IeERLrmfY1TL29fNlGyhzn7qAXpT7Beq5J4L5MnhiPDXzZ/LWESgV5U8hHDZaa9vw/SIf6jidxo6+MtesKz4k47wlh4jLtaB+KoQ3esBRTJKFrYVXYUE7q4wyfHVHwwu/jh0O1bxMXeayn0pjI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648664891;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V2Cdfw3qsK6arRjmn+bz49KzU3r8AsJyQmv3h+FjNVo=;
	b=GgXdRQFmvwFwYqXRS2x5cQXQZRFTCNKRuVtQeClA1tko5xc//fks7g7/k1yWNd8J
	bllK8vzFTnY0/N6roXliDNZvkFm6enOoq2SdGQ8FAYZc0sJ23Osrhj1YWqWzK8m5R8W
	xWtOZrwkuZJyxefrjb8au2cIskbHgFApafhb2wKY=
Message-ID: <9817e3fc-b7a6-9f4d-79cf-dc32fabac2ba@apertussolutions.com>
Date: Wed, 30 Mar 2022 14:27:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/irq: Skip unmap_domain_pirq XSM during destruction
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220330181734.30319-1-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220330181734.30319-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/30/22 14:17, Jason Andryuk wrote:
> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> complete_domain_destroy as an RCU callback.  The source context was an
> unexpected, random domain.  Since this is a xen-internal operation,
> we don't want the XSM hook denying the operation.
> 
> Check d->is_dying and skip the check when the domain is dead.  The RCU
> callback runs when a domain is in that state.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Dan wants to change current to point at DOMID_IDLE when the RCU callback
> runs.  I think Juergen's commit 53594c7bd197 "rcu: don't use
> stop_machine_run() for rcu_barrier()" may have changed this since it
> mentions stop_machine_run scheduled the idle vcpus to run the callbacks
> for the old code.
> 
> Would that be as easy as changing rcu_do_batch() to do:
> 
> +        /* Run as "Xen" not a random domain's vcpu. */
> +        vcpu = get_current();
> +        set_current(idle_vcpu[smp_processor_id()]);
>          list->func(list);
> +        set_current(vcpu);
> 
> or is using set_current() only acceptable as part of context_switch?
> 
>  xen/arch/x86/irq.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 285ac399fb..16488d287c 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2340,10 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>          nr = msi_desc->msi.nvec;
>      }
>  
> -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                               msi_desc ? msi_desc->dev : NULL);
> -    if ( ret )
> -        goto done;
> +    /* When called by complete_domain_destroy via RCU, current is a random
> +     * domain.  Skip the XSM check since this is a Xen-initiated action. */
> +    if ( d->is_dying != DOMDYING_dead ) {
> +        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> +                                   msi_desc ? msi_desc->dev : NULL);
> +        if ( ret )
> +            goto done;
> +    }
>  
>      forced_unbind = pirq_guest_force_unbind(d, info);
>      if ( forced_unbind )

I think this is sufficient though IMHO it would make it stronger if
current accurately reflected the idle domain and the condition was added
to the if statement check this fact.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

