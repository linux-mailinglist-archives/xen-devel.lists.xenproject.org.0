Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4252FEFBB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 17:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72240.129925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cRA-0003Su-00; Thu, 21 Jan 2021 16:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72240.129925; Thu, 21 Jan 2021 16:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cR9-0003SV-So; Thu, 21 Jan 2021 16:03:55 +0000
Received: by outflank-mailman (input) for mailman id 72240;
 Thu, 21 Jan 2021 16:03:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2cR8-0003SQ-8o
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 16:03:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe541fe7-9d99-4e03-9c59-1fc4fc3b3259;
 Thu, 21 Jan 2021 16:03:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D97DAB7A;
 Thu, 21 Jan 2021 16:03:52 +0000 (UTC)
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
X-Inumbo-ID: fe541fe7-9d99-4e03-9c59-1fc4fc3b3259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611245032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mi2MdZQNOR03OElIIfIrrDl73zzZ3xuiTT6s5PI7Uc0=;
	b=X7/OO9VPH1q1dMpFZ0J4M16v+zltXlMNrsNcnufDjN9YDUrCwCmdhkrFpJIaE/YuXytgx5
	KitRkViGuyiKBhZZNc2OWttvAndAFfsUkHaXcoi1X5ZA+LMEADk7qWCEpVYEuPikKo3mfx
	4kdZE7JRwQcJORTdNmWdQRz1FmX8PV8=
Subject: Re: [PATCH v2 1/4] x86/vioapic: check IRR before attempting to inject
 interrupt after EOI
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cdc469f-5ccf-6c0c-157c-31abca5f089d@suse.com>
Date: Thu, 21 Jan 2021 17:03:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115142820.35224-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 15:28, Roger Pau Monne wrote:
> In vioapic_update_EOI the irq_lock will be dropped in order to forward
> the EOI to the dpci handler, so there's a window between clearing IRR
> and checking if the line is asserted where IRR can change behind our
> back.
> 
> Fix this by checking whether IRR is set before attempting to inject a
> new interrupt.
> 
> Fixes: 06e3f8f2766 ('vt-d: Do dpci eoi outside of irq_lock.')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

It's fine this way, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but how about a slightly different change:

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -526,7 +526,7 @@ void vioapic_update_EOI(struct domain *d, u8 vector)
>              }
>  
>              if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
> -                 !ent->fields.mask &&
> +                 !ent->fields.mask && !ent->fields.remote_irr &&
>                   hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
>              {
>                  ent->fields.remote_irr = 1;

The check is only needed if the lock was dropped intermediately,
which happens only conditionally. So an alternative would seem
to be

            if ( is_iommu_enabled(d) )
            {
                spin_unlock(&d->arch.hvm.irq_lock);
                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
                spin_lock(&d->arch.hvm.irq_lock);

                if ( ent->fields.remote_irr )
                    continue;
            }

in the code immediately above. Thoughts?

Jan

