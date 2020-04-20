Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB031B0E04
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:13:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXAM-0004v9-J5; Mon, 20 Apr 2020 14:12:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQXAK-0004v4-QH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:12:52 +0000
X-Inumbo-ID: 05883850-8311-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05883850-8311-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 14:12:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC2B2AC44;
 Mon, 20 Apr 2020 14:12:50 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/pv: Compile out compat_gdt in !CONFIG_PV builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c8eee8d-c2ce-d262-4056-a5d2c9f843cb@suse.com>
Date: Mon, 20 Apr 2020 16:12:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417155004.16806-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 17.04.2020 17:50, Andrew Cooper wrote:
> There is no need for the Compat GDT if there are no 32bit PV guests.  This
> saves 4k per online CPU
> 
> Bloat-o-meter reports the following savings in Xen itself:
> 
>   add/remove: 0/3 grow/shrink: 1/4 up/down: 7/-4612 (-4605)
>   Function                                     old     new   delta
>   cpu_smpboot_free                            1249    1256      +7
>   per_cpu__compat_gdt_l1e                        8       -      -8
>   per_cpu__compat_gdt                            8       -      -8
>   init_idt_traps                               442     420     -22
>   load_system_tables                           414     364     -50
>   trap_init                                    444     280    -164
>   cpu_smpboot_callback                        1255     991    -264
>   boot_compat_gdt                             4096       -   -4096
>   Total: Before=3062726, After=3058121, chg -0.15%
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> The increase in cpu_smpboot_free() appears to be a consequence of a totally
> different layout of basic blocks.
> ---
>  xen/arch/x86/cpu/common.c |  5 +++--
>  xen/arch/x86/desc.c       |  2 ++
>  xen/arch/x86/smpboot.c    |  5 ++++-
>  xen/arch/x86/traps.c      | 10 +++++++---
>  4 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 1b33f1ed71..7b093cb421 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -752,8 +752,9 @@ void load_system_tables(void)
>  
>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
> -	_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
> -			 sizeof(*tss) - 1, SYS_DESC_tss_busy);
> +	if ( IS_ENABLED(CONFIG_PV32) )
> +		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
> +				 sizeof(*tss) - 1, SYS_DESC_tss_busy);

Wouldn't this better be "if ( opt_pv32 )"? Also elsewhere then.

Jan

