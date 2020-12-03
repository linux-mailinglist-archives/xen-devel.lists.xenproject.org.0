Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584372CD16C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 09:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43169.77654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkBS-0005l2-FS; Thu, 03 Dec 2020 08:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43169.77654; Thu, 03 Dec 2020 08:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkkBS-0005kd-CR; Thu, 03 Dec 2020 08:41:50 +0000
Received: by outflank-mailman (input) for mailman id 43169;
 Thu, 03 Dec 2020 08:41:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkkBQ-0005kY-UH
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 08:41:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01522a0f-91a4-4cba-820b-5564c787c73f;
 Thu, 03 Dec 2020 08:41:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2000FAE95;
 Thu,  3 Dec 2020 08:41:46 +0000 (UTC)
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
X-Inumbo-ID: 01522a0f-91a4-4cba-820b-5564c787c73f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606984906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIRp1Sgm2T1K2iNUb2R8+gnpcvMSXg8rBvnNLo4h6Fw=;
	b=jsarj3sYnEHZux6//tHjkauK+3fWu1jGcUHNbux0O7F2GNlJRbJE03gp9ln2i5XvpvsHmF
	duAaUvdT0OCjcVj5i+WhpxTgBYU/iHjbd8B4XiFGHKbYTQYDI0DTovZILc4GgdPwAJWbA4
	QhgTIaNTztynwp/NS/36u7NS82omM3U=
Subject: Re: [PATCH v2 1/2] x86/IRQ: make max number of guests for a shared
 IRQ configurable
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4374579d-9cac-3500-7954-9cfa89e88f41@suse.com>
Date: Thu, 3 Dec 2020 09:41:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606960706-21274-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.12.2020 02:58, Igor Druzhinin wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1641,6 +1641,15 @@ This option is ignored in **pv-shim** mode.
>  ### nr_irqs (x86)
>  > `= <integer>`
>  
> +### irq_max_guests (x86)

As a rule of thumb, new options want to use - instead of _ as
separators. There was a respective discussion quite some time
ago. My patch to treat - and _ equally when parsing options
wasn't liked by Andrew ...

> @@ -435,6 +439,9 @@ int __init init_irq_data(void)
>      for ( ; irq < nr_irqs; irq++ )
>          irq_to_desc(irq)->irq = irq;
>  
> +    if ( !irq_max_guests || irq_max_guests > 255)

The 255 is a consequence of the struct field being u8, aiui?
There should be a direct connection between the two, i.e. when
changing the underlying property preferably only one place
should require touching (possible e.g. by converting to a bit
field with its width established via a #define), or comments
on either side should point at the other one.

Also as a nit, there's a blank missing ahead of the closing
paren.

> @@ -1564,7 +1570,8 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>          if ( newaction == NULL )
>          {
>              spin_unlock_irq(&desc->lock);
> -            if ( (newaction = xmalloc(irq_guest_action_t)) != NULL &&
> +            if ( (newaction = xmalloc_bytes(sizeof(irq_guest_action_t) +
> +                  irq_max_guests * sizeof(action->guest[0]))) != NULL &&

As said in the (later) reply to v1, please try to make use of
xmalloc_flex_struct() here.

> @@ -1633,11 +1640,11 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>          goto retry;
>      }
>  
> -    if ( action->nr_guests == IRQ_MAX_GUESTS )
> +    if ( action->nr_guests == irq_max_guests )
>      {
>          printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
> -               "Already at max share.\n",
> -               pirq->pirq, v->domain->domain_id);
> +               "Already at max share %u, increase with irq_max_guests= option.\n",
> +               pirq->pirq, v->domain->domain_id, irq_max_guests);

If you already need to largely redo this printk(), please
- switch to %pd at the same time,
- don't have the format string extend across multiple lines,
- preferably avoid to use full stops (we don't use any in the vast
  majority of log messages), e.g. by making it "cannot bind IRQ%d
  to %pd, already at max share %u (increase with irq-max-guests=
  option)", if you want to stay close to the original wording (I
  think this could be expressed more compactly as well).

Jan

