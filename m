Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6F2D0D3E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 10:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46022.81630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmD3X-0000HU-8V; Mon, 07 Dec 2020 09:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46022.81630; Mon, 07 Dec 2020 09:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmD3X-0000H6-5F; Mon, 07 Dec 2020 09:43:43 +0000
Received: by outflank-mailman (input) for mailman id 46022;
 Mon, 07 Dec 2020 09:43:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmD3V-0000Gz-00
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:43:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0fd3c4c-a6f4-4abd-b89b-63d584135db3;
 Mon, 07 Dec 2020 09:43:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6088AC55;
 Mon,  7 Dec 2020 09:43:38 +0000 (UTC)
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
X-Inumbo-ID: e0fd3c4c-a6f4-4abd-b89b-63d584135db3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607334219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voCy+AsKpL7inwILDFJHM4hQ45aLTGWqmoLq9FWqy1I=;
	b=tzturytpDLVswWM6Ta1vWypw/M1u4DsLnd6C2f5yQiMaeGi5qvqp0n1CqdlZesHa55ISxI
	JLYL+BRipeOYL3JemUq7hRcdWsMxJVUsg50VrBHhVWxR9ojCuB5quBOSf2FTx02+/Hx0EQ
	FUbEbHQH1Ujb5bgpr0dTBQCxLZJynoo=
Subject: Re: [PATCH v3 1/2] x86/IRQ: make max number of guests for a shared
 IRQ configurable
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc023b15-9e28-322c-aa86-165459e65d77@suse.com>
Date: Mon, 7 Dec 2020 10:43:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.12.2020 18:43, Igor Druzhinin wrote:
> ... and increase the default to 16.
> 
> Current limit of 7 is too restrictive for modern systems where one GSI
> could be shared by potentially many PCI INTx sources where each of them
> corresponds to a device passed through to its own guest. Some systems do not
> apply due dilligence in swizzling INTx links in case e.g. INTA is declared as
> interrupt pin for the majority of PCI devices behind a single router,
> resulting in overuse of a GSI.
> 
> Introduce a new command line option to configure that limit and dynamically
> allocate an array of the necessary size. Set the default size now to 16 which
> is higher than 7 but could later be increased even more if necessary.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> 
> Changes in v2:
> - introduced a command line option as suggested
> - set initial default limit to 16
> 
> Changes in v3:
> - changed option name to us - instead of _
> - used uchar instead of uint to utilize integer_param overflow handling logic

Which now means rather than saturating at UINT8_MAX you'll get
-EOVERFLOW. Just as a remark, not as a strict request to change
anything.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -42,6 +42,10 @@ integer_param("nr_irqs", nr_irqs);
>  int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
>  custom_param("irq_vector_map", parse_irq_vector_map_param);
>  
> +/* Max number of guests IRQ could be shared with */
> +static unsigned char __read_mostly irq_max_guests;
> +integer_param("irq-max-guests", irq_max_guests);

There's an implied assumption now that sizeof(irq_max_guests)
<= sizeof_field(irq_guest_action_t, nr_guests). Sadly a
respective BUILD_BUG_ON() can't ...

> @@ -435,6 +439,9 @@ int __init init_irq_data(void)
>      for ( ; irq < nr_irqs; irq++ )
>          irq_to_desc(irq)->irq = irq;
>  
> +    if ( !irq_max_guests )
> +        irq_max_guests = 16;

... go here, because the type gets defined only ...

> @@ -1028,7 +1035,6 @@ int __init setup_irq(unsigned int irq, unsigned int irqflags,
>   * HANDLING OF GUEST-BOUND PHYSICAL IRQS
>   */
>  
> -#define IRQ_MAX_GUESTS 7
>  typedef struct {
>      u8 nr_guests;
>      u8 in_flight;
> @@ -1039,7 +1045,7 @@ typedef struct {
>  #define ACKTYPE_EOI    2     /* EOI on the CPU that was interrupted  */
>      cpumask_var_t cpu_eoi_map; /* CPUs that need to EOI this interrupt */
>      struct timer eoi_timer;
> -    struct domain *guest[IRQ_MAX_GUESTS];
> +    struct domain *guest[];
>  } irq_guest_action_t;

... here. The only later __init function is setup_dump_irqs(), so
it could be put there or in a new build_assertions() one.

> @@ -1633,11 +1640,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>          goto retry;
>      }
>  
> -    if ( action->nr_guests == IRQ_MAX_GUESTS )
> +    if ( action->nr_guests == irq_max_guests )
>      {
> -        printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
> -               "Already at max share.\n",
> -               pirq->pirq, v->domain->domain_id);
> +        printk(XENLOG_G_INFO
> +               "Cannot bind IRQ%d to dom%pd: already at max share %u ",
> +               pirq->pirq, v->domain, irq_max_guests);
> +        printk("(increase with irq-max-guests= option)\n");

Now two separate printk()s are definitely worse. Then putting the
part of the format string inside the parentheses on a separate line
would still be better (and perhaps a sensible compromise with the
grep-ability desire).

With suitable adjustments, which I'd be okay making while committing
as long as you agree,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

