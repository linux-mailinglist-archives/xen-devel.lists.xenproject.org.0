Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BCF220CC3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:14:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgIR-0002uH-5o; Wed, 15 Jul 2020 12:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvgIP-0002u4-PG
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:13:57 +0000
X-Inumbo-ID: a80cdca4-c694-11ea-bca7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a80cdca4-c694-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 12:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594815237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=18xsUfIrITO/uLx/6yzDas52v/QFuFZM5fa1tNXshps=;
 b=MR9b2X3oMUszQw1W2fLscTeGZN1wZ40ZEmqdLN102tAxrUjI5fMKMXvR
 CrL1eyiuJBkILdJwagsQuqDK23ve+45QE/hmZGX/wc55ZIAl89LpGH6v9
 6WP/5iglLG4RZB9BhkgbVlGNTcwbOCEnmcaB4IfO9k9EH4RTC2syM5KjV c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f9ar1GRO/hivYYe9vK8tx2xxirWGSS/IArLK/iT2AycvlE88yiOwCqcQ9H3fZtQ76YleHU7r8M
 jBhs0RbiyGhyX+No+i7eViroXmV3KYtBNsgIX6KALqTjI6JxqC0UmwBwaWrQgdIFGQ8ohHGbP3
 BTY7UrHQ5cs3OnFGW1G6Zy5CZPSzEgA4WZVmgguIJH9lcH8h6sx72MZ2MtYP677lAJmmeESq+t
 R0tyM+9v5w73nsZsnE2W3wC8F84vwaGtIWM0pBaqPnyunWdLwbHMk8aBetP9gJqpce898pM2jP
 1w0=
X-SBRS: 2.7
X-MesageID: 22744247
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22744247"
Date: Wed, 15 Jul 2020 14:13:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
Message-ID: <20200715121347.GY7191@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 01:56:47PM +0200, Jan Beulich wrote:
> This was lost when making the logic accessible to PVH Dom0.
> 
> While doing so make the access to the global function pointer safe
> against races (as noticed by Roger): The only current user wants to be
> invoked just once (but can tolerate to be invoked multiple times),
> zapping the pointer at that point.
> 
> Fixes: 835d8d69d96a ("x86/rtc: provide mediated access to RTC for PVH dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks, sorry I have one comment below.

> ---
> v3: Latch pointer under lock.
> v2: New.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1148,6 +1148,8 @@ void rtc_guest_write(unsigned int port,
>  
>      switch ( port )
>      {
> +        typeof(pv_rtc_handler) hook;

Nit: FWIW, given the current structure of the function I would just have placed
it together with the rest of the top-level local variables.

> +
>      case RTC_PORT(0):
>          /*
>           * All PV domains (and PVH dom0) are allowed to write to the latched
> @@ -1160,6 +1162,14 @@ void rtc_guest_write(unsigned int port,
>      case RTC_PORT(1):
>          if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
>              break;
> +
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        hook = pv_rtc_handler;
> +        spin_unlock_irqrestore(&rtc_lock, flags);

Given that clearing the pv_rtc_handler variable in handle_rtc_once is
not done while holding the rtc_lock, I'm not sure there's much point
in holding the lock here, ie: just doing something like:

hook = pv_rtc_handler;
if ( hook )
    hook(currd->arch.cmos_idx & 0x7f, data);

Should be as safe as what you do.

We also assume that setting pv_rtc_handler to NULL is an atomic
operation.

Roger.

