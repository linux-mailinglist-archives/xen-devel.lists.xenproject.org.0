Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD147372799
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 10:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122012.230119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldqoz-0007bn-NV; Tue, 04 May 2021 08:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122012.230119; Tue, 04 May 2021 08:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldqoz-0007bO-KB; Tue, 04 May 2021 08:54:25 +0000
Received: by outflank-mailman (input) for mailman id 122012;
 Tue, 04 May 2021 08:54:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldqox-0007bJ-LA
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 08:54:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df7881b7-04fb-496b-a336-321115daab1b;
 Tue, 04 May 2021 08:54:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45677AED7;
 Tue,  4 May 2021 08:54:21 +0000 (UTC)
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
X-Inumbo-ID: df7881b7-04fb-496b-a336-321115daab1b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620118461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSP9FYSdRM7WifVs0K5hQNwiRkkZf+HdtxO2eRrGRfI=;
	b=Goa7fDAAHu6bz4DmhUWPSWoqT1Gwu0DxihlvmcJO44ItT8uxlHrZJiJTSfIt4DO9N/tmxa
	npNaLDmIJnTrihgUSpYs+9TWi6/Xyr5lu5v3wf5gEZh0uNZqfGpdNACRT8CeJvRPJHW2jV
	frjhuGMJbLzO+Yy8pOIvribHMXt0CSY=
Subject: Re: [PATCH] x86/vhpet: fix RTC special casing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210504084208.62823-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <15dd7e21-0077-936f-740c-90c2ed991bdf@suse.com>
Date: Tue, 4 May 2021 10:54:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504084208.62823-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 10:42, Roger Pau Monne wrote:
> Restore setting the virtual timer callback private data to NULL if the
> timer is not level triggered. This fixes the special casing done in
> pt_update_irq so that the RTC interrupt when originating from the HPET
> is suspended if the interrupt source is masked.
> 
> Note the RTC special casing done in pt_update_irq should only apply to
> the RTC interrupt originating from the emulated RTC device (which does
> set the callback private data), as in that case the callback itself
> will destroy the virtual timer if the interrupt is ignored.
> 
> While there also use RTC_IRQ instead of 8 when the HPET is configured
> in LegacyReplacement Mode.
> 
> Fixes: be07023be115 ("x86/vhpet: add support for level triggered interrupts")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -318,7 +319,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>                           hpet_tick_to_ns(h, diff),
>                           oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
>                           irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
> -                         (void *)(unsigned long)tn, timer_level(h, tn));
> +                         timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
> +                         timer_level(h, tn));

Depending on what further changes to this call may be planned, it
may help readability if we split the call into a level and an edge
one.

Jan

