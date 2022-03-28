Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E588D4E9B36
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295507.502902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrQO-0000tZ-Bw; Mon, 28 Mar 2022 15:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295507.502902; Mon, 28 Mar 2022 15:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrQO-0000qU-8V; Mon, 28 Mar 2022 15:36:56 +0000
Received: by outflank-mailman (input) for mailman id 295507;
 Mon, 28 Mar 2022 15:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=adjj=UH=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nYrQM-0000qO-Ih
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:36:54 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e40e0566-aeac-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 17:36:53 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id j21so12689869qta.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 08:36:53 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm13118066qtw.65.2022.03.28.08.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:36:51 -0700 (PDT)
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
X-Inumbo-ID: e40e0566-aeac-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J2WgmBtmlR7QhmLnkMe4QU1O85FuVCgnDYsZysNmv3o=;
        b=JGsxSdJ4Tq7SHRYtKQN88tzNxTIUc4XCann5yK8UBqDayO3EMzg8tpFKLlHjrXbGtD
         5Jm46t1W+Zdyf+VViDkpElNwB+xnz4/yDX22vtPrHhaDwYH8VHqLjFCLzUA2Ev1duPSy
         +EsFaLPF4V81PafQz3adeZfj1y9a+bklAOChxTtrw99ETh60ybHvznyVnimfKPTV6y6A
         K7NF1L55D1VkN0Z5bHhmrHHqsq6J6gYHiiz43wbn6SI1ERPhd7mBPpFqEh4GwFH3/xoU
         YeTl8I6o7c93z3hvP31kJYK79TgW9x8oKT1PWrNYSoaaqFIxO5QsUxZL3bXzOpbGZtME
         cUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J2WgmBtmlR7QhmLnkMe4QU1O85FuVCgnDYsZysNmv3o=;
        b=IErTOS115HTBNkHdjgmHznLgDVxMJ8CkefFhHiUcvNhhq/DRDqg+LA6rMl9dsFQyI7
         oKU+2nZ1Kx/qYeexGkCzHohUdXpMMwtgKa5pEwl0oJvehOHEbNhV05cLpRzg5xmm0ewl
         iTQF3FGGNQH1vmLQRt6M1dG2Am6OY7BTditTXjzMKmvOtMyn9C+HxS1DBA4IEouAcrK4
         hfET2/EzHt60orI9y8KlIebVhVVpTFbIvkwucwXs/Eb+vLgbKuD6Rati89k7nQP8oWgC
         e4C8dpUoLeaQk4S6ItQQ7HWdJ7RmdKdBUtLk7z507ZJxJHAwxpTGPRZdKSXjZrRkRXLT
         o9CA==
X-Gm-Message-State: AOAM530rfjiKF/hdbodZw/vBeb/nsVoOJxGimi6GwE2Ywtf2UtoM4DqH
	p4rWHyCQYXrKDHKb1/3v/LdHgkwEmPA=
X-Google-Smtp-Source: ABdhPJyfuV7iF/e0FS5hOpa4dxWXG9zKG8OtZVZJrCMqU9nK9eB6xAzU7NzbqbiRpGbGPb6Z17N/Cw==
X-Received: by 2002:ac8:5815:0:b0:2e2:2d63:ac13 with SMTP id g21-20020ac85815000000b002e22d63ac13mr22655072qtg.469.1648481811988;
        Mon, 28 Mar 2022 08:36:51 -0700 (PDT)
Message-ID: <1244c48a-9d3d-488c-8614-643d4670773a@gmail.com>
Date: Mon, 28 Mar 2022 11:36:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/physdev: Call xsm_unmap_domain_irq earlier
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220325141826.16245-1-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
In-Reply-To: <20220325141826.16245-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/22 10:18, Jason Andryuk wrote:
> Pull the XSM check up out of unmap_domain_pirq into physdev_map_pirq.
> 
> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> complete_domain_destroy as an RCU callback.  The source context was an
> unexpected, random domain.  Since this is a xen-internal operation,
> going through the XSM hook is inapproriate.

To me this is the first problem that should be addressed. Why is current
pointing at a random domain and is it possible to ensure it gets
correctly set to the current domain, e.g. DOMID_IDLE or DOMID_XEN.

> Move the XSM hook up into physdev_unmap_pirq, which is the
> guest-accessible path.  This requires moving some of the sanity check
> upwards as well since the hook needs the additional data to make its
> decision.  Since complete_domain_destroy still calls unmap_domain_pirq,
> replace the moved runtime checking with assert.  Only valid pirqs should
> make their way into unmap_domain_pirq from complete_domain_destroy.

This is moving the time of check a way from the time of use. While today
it may be safe because it only gives guest access through a limited
interface, vpci_msi_disabled, this now introduces risk through the
assumption that no future code will make this call without making the
appropriate XSM call when coming processing a guest request. This is one
of many reasons why I would dissuade moving resource access checks away
from the resource access.

While it is related, in this thread I will not disagree with your point
that XSM calls on internal calls has no meaning at this point. Still we
should not weaken the protection, is there any other way we can
determine the call is being made internally, like I suggested above in
getting `current` set to a system domain and then update fix the default
policy to allow system domains to make the call and those using flask
just update their policy to allow system domains to make the call.

> This is mostly code movement, but one style change is to pull `irq =
> info->arch.irq` out of the if condition.
> 
> Label done is now unused and removed.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> unmap_domain_pirq is also called in vioapic_hwdom_map_gsi and
> vpci_msi_disable.  vioapic_hwdom_map_gsi is a cleanup path after going
> through map_domain_pirq, and I don't think the vpci code is directly
> guest-accessible.  So I think those are okay, but I not familiar with
> that code.  Hence, I am highlighting it.
> 
>  xen/arch/x86/irq.c     | 31 +++++++-----------------------
>  xen/arch/x86/physdev.c | 43 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 285ac399fb..ddd3194fba 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2310,41 +2310,25 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      struct pirq *info;
>      struct msi_desc *msi_desc = NULL;
>  
> -    if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
> -        return -EINVAL;
> -
> +    ASSERT(pirq >= 0);
> +    ASSERT(pirq < d->nr_pirqs);
>      ASSERT(pcidevs_locked());
>      ASSERT(spin_is_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> -    if ( !info || (irq = info->arch.irq) <= 0 )
> -    {
> -        dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
> -                d->domain_id, pirq);
> -        ret = -EINVAL;
> -        goto done;
> -    }
> +    ASSERT(info);
> +
> +    irq = info->arch.irq;
> +    ASSERT(irq > 0);
>  
>      desc = irq_to_desc(irq);
>      msi_desc = desc->msi_desc;
>      if ( msi_desc && msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
>      {
> -        if ( msi_desc->msi_attrib.entry_nr )
> -        {
> -            printk(XENLOG_G_ERR
> -                   "dom%d: trying to unmap secondary MSI pirq %d\n",
> -                   d->domain_id, pirq);
> -            ret = -EBUSY;
> -            goto done;
> -        }
> +        ASSERT(msi_desc->msi_attrib.entry_nr == 0);
>          nr = msi_desc->msi.nvec;
>      }
>  
> -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                               msi_desc ? msi_desc->dev : NULL);
> -    if ( ret )
> -        goto done;
> -
>      forced_unbind = pirq_guest_force_unbind(d, info);
>      if ( forced_unbind )
>          dprintk(XENLOG_G_WARNING, "dom%d: forcing unbind of pirq %d\n",
> @@ -2405,7 +2389,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      if (msi_desc)
>          msi_free_irq(msi_desc);
>  
> - done:
>      return ret;
>  }
>  
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 2ddcf44f33..a5ed257dca 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -140,8 +140,11 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>  
>  int physdev_unmap_pirq(domid_t domid, int pirq)
>  {
> +    struct msi_desc *msi_desc;
> +    struct irq_desc *desc;
> +    struct pirq *info;
>      struct domain *d;
> -    int ret = 0;
> +    int irq, ret = 0;
>  
>      d = rcu_lock_domain_by_any_id(domid);
>      if ( d == NULL )
> @@ -162,9 +165,47 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
>              goto free_domain;
>      }
>  
> +    if ( (pirq < 0) || (pirq >= d->nr_pirqs) ) {
> +        ret = -EINVAL;
> +        goto free_domain;
> +    }
> +
>      pcidevs_lock();
>      spin_lock(&d->event_lock);
> +
> +    info = pirq_info(d, pirq);
> +    irq = info ? info->arch.irq : 0;
> +    if ( !info || irq <= 0 )
> +    {
> +        dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
> +                d->domain_id, pirq);
> +        ret = -EINVAL;
> +        goto unlock;
> +    }
> +
> +    desc = irq_to_desc(irq);
> +    msi_desc = desc->msi_desc;
> +    if ( msi_desc && msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> +    {
> +        if ( msi_desc->msi_attrib.entry_nr )
> +        {
> +            printk(XENLOG_G_ERR
> +                   "dom%d: trying to unmap secondary MSI pirq %d\n",
> +                   d->domain_id, pirq);
> +            ret = -EBUSY;
> +            goto unlock;
> +        }
> +    }
> +
> +    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> +                               msi_desc ? msi_desc->dev : NULL);
> +    if ( ret )
> +        goto unlock;
> +
>      ret = unmap_domain_pirq(d, pirq);
> +
> + unlock:
> +
>      spin_unlock(&d->event_lock);
>      pcidevs_unlock();
>  

