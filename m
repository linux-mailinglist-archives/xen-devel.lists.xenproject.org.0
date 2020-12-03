Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA532CD1AF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 09:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43184.77680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkJM-0006Ds-Mr; Thu, 03 Dec 2020 08:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43184.77680; Thu, 03 Dec 2020 08:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkJM-0006DR-JK; Thu, 03 Dec 2020 08:50:00 +0000
Received: by outflank-mailman (input) for mailman id 43184;
 Thu, 03 Dec 2020 08:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkkJL-0006DM-1v
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 08:49:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 774c37ac-7ceb-4944-8d7f-e4daa1b993d6;
 Thu, 03 Dec 2020 08:49:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D26AACBA;
 Thu,  3 Dec 2020 08:49:57 +0000 (UTC)
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
X-Inumbo-ID: 774c37ac-7ceb-4944-8d7f-e4daa1b993d6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606985397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oB6rCDgg8B1sgsCMwdLFPglfZs3fw373XJvKsUkWt6k=;
	b=CGQu5kHGp/SXtnY9InkCPoW+JVRiYVewbbd9m/FEA+aGZeI2irT+jkL6HfCUs9agfgrr1R
	fSWVWkf3uvyDDvsiud1f007Sn2JVoEi3TuZeKX3MV4FdTSENPHxBEvjVsnfSrB7u5VkroB
	gk7o/XhKLZNHSruCEvHKYWUx6yEW3iw=
Subject: Re: [PATCH v2 2/2] x86/IRQ: allocate guest array of max size only for
 shareable IRQs
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
 <1606960706-21274-2-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b38480ab-7df1-5b5b-8d6a-141cb7b99682@suse.com>
Date: Thu, 3 Dec 2020 09:49:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606960706-21274-2-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.12.2020 02:58, Igor Druzhinin wrote:
> @@ -1540,6 +1540,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>      unsigned int        irq;
>      struct irq_desc         *desc;
>      irq_guest_action_t *action, *newaction = NULL;
> +    unsigned int        max_nr_guests = will_share ? irq_max_guests : 1;
>      int                 rc = 0;
>  
>      WARN_ON(!spin_is_locked(&v->domain->event_lock));
> @@ -1571,7 +1572,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>          {
>              spin_unlock_irq(&desc->lock);
>              if ( (newaction = xmalloc_bytes(sizeof(irq_guest_action_t) +
> -                  irq_max_guests * sizeof(action->guest[0]))) != NULL &&
> +                  max_nr_guests * sizeof(action->guest[0]))) != NULL &&
>                   zalloc_cpumask_var(&newaction->cpu_eoi_map) )
>                  goto retry;
>              xfree(newaction);
> @@ -1640,7 +1641,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>          goto retry;
>      }
>  
> -    if ( action->nr_guests == irq_max_guests )
> +    if ( action->nr_guests == max_nr_guests )
>      {
>          printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
>                 "Already at max share %u, increase with irq_max_guests= option.\n",

Just as a minor remark - I don't think this last hunk is necessary,
as the !will_share case won't make it here unless action->nr_guests
is still zero. At which point the need for the new local variable
would also disappear. But I'm not going to insist, as there may be
the view that the code is more clear this way. However, if clarity
(in the sense of "obviously correct") is the goal, then I think
using >= instead of == would now become preferable.

Jan

