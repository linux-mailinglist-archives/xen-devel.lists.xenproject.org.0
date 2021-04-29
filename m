Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2736ECC9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120117.227136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc82S-0003Pb-5I; Thu, 29 Apr 2021 14:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120117.227136; Thu, 29 Apr 2021 14:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc82S-0003PB-0S; Thu, 29 Apr 2021 14:53:12 +0000
Received: by outflank-mailman (input) for mailman id 120117;
 Thu, 29 Apr 2021 14:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc82Q-0003P6-Bt
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:53:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 975a48b9-01ac-431a-a293-d32427b3c153;
 Thu, 29 Apr 2021 14:53:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D241B14D;
 Thu, 29 Apr 2021 14:53:08 +0000 (UTC)
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
X-Inumbo-ID: 975a48b9-01ac-431a-a293-d32427b3c153
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619707988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adXf7HtP868fYunjNDwKNqaEg8tQ5pEWsSpuZOoMxE4=;
	b=sQtftRAxkQUgrCJITKkmwK61qR8sKmIaOCGWHAI/uNjsjuSOpx2ERORHYSz+cWiFAslvkD
	v6eCeqJ0Dgwg6DpZ+7SeDEcDJzEkxSlLADddHYg0+HAzqPNaY6Nr7RUlm6MBiA/kJQkGAJ
	iIrYithIhQ+gAnjaEYFz9hGhTwTiAyM=
Subject: Re: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
Date: Thu, 29 Apr 2021 16:53:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -46,15 +46,6 @@
>  #define epoch_year     1900
>  #define get_year(x)    (x + epoch_year)
>  
> -enum rtc_mode {
> -   rtc_mode_no_ack,
> -   rtc_mode_strict
> -};
> -
> -/* This must be in sync with how hvmloader sets the ACPI WAET flags. */
> -#define mode_is(d, m) ((void)(d), rtc_mode_##m == rtc_mode_no_ack)
> -#define rtc_mode_is(s, m) mode_is(vrtc_domain(s), m)

Leaving aside my concerns about this removal, I think some form of
reference to hvmloader and its respective behavior should remain
here, presumably in form of a (replacement) comment.

> @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
>      {
>          if ( pt->pending_intr_nr )
>          {
> -            /* RTC code takes care of disabling the timer itself. */
> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
> +            if ( pt_irq_masked(pt) &&
>                   /* Level interrupts should be asserted even if masked. */
>                   !pt->level )
>              {

I'm struggling to relate this to any other part of the patch. In
particular I can't find the case where a periodic timer would be
registered with RTC_IRQ and a NULL private pointer. The only use
I can find is with a non-NULL pointer, which would mean the "else"
path is always taken at present for the RTC case (which you now
change).

Jan

