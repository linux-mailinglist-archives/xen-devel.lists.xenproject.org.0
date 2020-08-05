Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FF23CB99
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 16:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3KoB-0006Fc-7p; Wed, 05 Aug 2020 14:54:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3Ko9-0006FX-Qs
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 14:54:21 +0000
X-Inumbo-ID: 44afce2c-2a43-4112-a806-20a68c5b0777
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44afce2c-2a43-4112-a806-20a68c5b0777;
 Wed, 05 Aug 2020 14:54:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA03DACA3;
 Wed,  5 Aug 2020 14:54:36 +0000 (UTC)
Subject: Re: [PATCH] x86/tsc: Fix diagnostics for TSC frequency
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200805141804.2585-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3123eedc-252d-7e9e-a4af-6f8bfae82f41@suse.com>
Date: Wed, 5 Aug 2020 16:54:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200805141804.2585-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.08.2020 16:18, Andrew Cooper wrote:
> A Gemini Lake platform prints:
> 
>   (XEN) CPU0: TSC: 19200000MHz * 279 / 3 = 1785600000MHz
>   (XEN) CPU0: 800..1800 MHz
> 
> during boot.  The units on the first line are Hz, not MHz, so correct that and
> add a space for clarity.
> 
> Also, for the min/max line, use three dots instead of two and add more spaces
> so that the line can't be mistaken for being a double decimal point typo.
> 
> Boot now reads:
> 
>   (XEN) CPU0: TSC: 19200000 Hz * 279 / 3 = 1785600000 Hz
>   (XEN) CPU0: 800 ... 1800 MHz
> 
> Extend these changes to the other TSC diagnostics.

I'm happy to see the unit mistake fixed, but the choice of
formatting was pretty deliberate when the code was introduced:
As dense as possible without making things unreadable or
ambiguous. (Considering "a double decimal point typo" looks
like a joke to me, really.)

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -396,14 +396,14 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>  
>              val *= ebx;
>              do_div(val, eax);
> -            printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
> +            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
>                     smp_processor_id(), ecx, ebx, eax, val);

For this one I wonder whether ecx wouldn't better be scaled down to
kHz, and val down to MHz.

>          }
>          else if ( ecx | eax | ebx )
>          {
>              printk("CPU%u: TSC:", smp_processor_id());
>              if ( ecx )
> -                printk(" core: %uMHz", ecx);
> +                printk(" core: %u MHz", ecx);

This one now clearly wants to say Hz too, or (as above) scaling
down to kHz. With at least this last issue addressed
Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit I'd much prefer if the formatting adjustments were dropped.

Jan

