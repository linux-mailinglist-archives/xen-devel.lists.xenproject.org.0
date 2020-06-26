Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E5B20B307
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jootR-0005Wg-1R; Fri, 26 Jun 2020 13:59:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dO1b=AH=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1jootP-0005WN-Jd
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:59:47 +0000
X-Inumbo-ID: 486696a2-b7b5-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 486696a2-b7b5-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 13:59:42 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZNuWgLPMMUTnT0OoOhqZyb3JoJIG4atSQTUbivGxxO8y6N5ftTaM2IC3OKvawKfbyOdYBUT+Ri
 VZ8aIBxgoKJ0xkn5Zb+oZjfAORb2OpFEOjOULa7tD2k4O2tyvgfuK17h1390SYsa0Lbeu92U00
 rWBuRMBBa8kJZBhBVH/fkby60Dec9XVP2OyUo1gol1dc24ehy0We2/nTKTnVEOxgDNjmL3Inrp
 ftPbM7NGjyAznR4JdRHYp24pTHpMaqFrP+iJ+yhbkIgs5EjkoqO0vbdubxrTEGtJGFH939Bp8G
 QA4=
X-SBRS: 2.7
X-MesageID: 21369468
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21369468"
Subject: Re: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible
 with CET Shadow Stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20200626122408.19151-1-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <4bd8ab3e-37d0-fde9-10a3-b6b2f9ca4da6@citrix.com>
Date: Fri, 26 Jun 2020 14:59:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626122408.19151-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-26 13:24, Andrew Cooper wrote:
> Just like the alternatives infrastructure, the livepatch infrastructure
> disables CR0.WP to perform patching, which is not permitted with CET active.
> 
> Modify arch_livepatch_{quiesce,revive}() to disable CET before disabling WP,
> and reset the dirty bits on all virtual regions before re-enabling CET.
> 
> One complication is that arch_livepatch_revive() has to fix up the top of the
> shadow stack.  This depends on the functions not being inlined, even under
> LTO.  Another limitation is that reset_virtual_region_perms() may shatter the
> final superpage of .text depending on alignment.
> 
> This logic, and its downsides, are temporary until the patching infrastructure
> can be adjusted to not use CR0.WP.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Pawel Wieczorkiewicz <wipawel@amazon.de>
> CC: Paul Durrant <paul@xen.org>
> 
> For 4.14.  This is a bug in a 4.14 feature, with a very low risk to non-CET
> usecases.
> 
> v2:
>  * nolinline, and extra ifdefary
>  * Expand comments
> ---
>  xen/arch/x86/livepatch.c         | 35 +++++++++++++++++++++++++++++++++--
>  xen/common/virtual_region.c      | 15 +++++++++++++++
>  xen/include/xen/virtual_region.h |  1 +
>  3 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
> index 901fad96bf..49f0d902e5 100644
> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -12,6 +12,7 @@
>  #include <xen/livepatch.h>
>  #include <xen/sched.h>
>  #include <xen/vm_event.h>
> +#include <xen/virtual_region.h>
>  
>  #include <asm/fixmap.h>
>  #include <asm/nmi.h>
> @@ -56,18 +57,48 @@ int arch_livepatch_safety_check(void)
>      return -EBUSY;
>  }
>  
> -int arch_livepatch_quiesce(void)
> +int noinline arch_livepatch_quiesce(void)
>  {
> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
> +    if ( cpu_has_xen_shstk )

Should this be:
    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )

to match arch_livepatch_revive?

Ross

