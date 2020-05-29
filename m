Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2B1E7E0D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:09:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeel3-0006Yf-Fb; Fri, 29 May 2020 13:09:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeel1-0006Ya-L6
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:09:07 +0000
X-Inumbo-ID: 933b59d8-a1ad-11ea-a8b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 933b59d8-a1ad-11ea-a8b4-12813bfff9fa;
 Fri, 29 May 2020 13:09:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B1D1AD63;
 Fri, 29 May 2020 13:09:05 +0000 (UTC)
Subject: Re: [PATCH v2 14/14] x86/shstk: Activate Supervisor Shadow Stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-15-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <886eccd3-e2d4-fdc5-f1cd-e8671a5271e2@suse.com>
Date: Fri, 29 May 2020 15:09:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-15-andrew.cooper3@citrix.com>
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

On 27.05.2020 21:18, Andrew Cooper wrote:
> With all other plumbing in place, activate shadow stacks when possible.  Note
> that this requires prohibiting the use of PV32.  Compatibility can be
> maintained if necessary via PV-Shim.

In the revision log you say "Discuss CET-SS disabling PV32", and I
agree both here and in the command line doc you mention the "that"
aspect. But what about the "why"? Aiui "is incompatible" or
"requires" are too strong statements: It could be made work (by
disabling / enabling CET on the way out of / back into Xen), but
besides losing some of the intended protection that way, it would
be quite a bit of overhead. So it's more like a design decision,
and it would be nice to express it like this at least in the
commit message.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -664,6 +664,13 @@ static void __init noreturn reinit_bsp_stack(void)
>      stack_base[0] = stack;
>      memguard_guard_stack(stack);
>  
> +    if ( cpu_has_xen_shstk )
> +    {
> +        wrmsrl(MSR_PL0_SSP, (unsigned long)stack + 0x5ff8);

Please replace this remaining literal number accordingly.

> @@ -1801,6 +1823,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      alternative_branches();
>  
> +    /* Defer CR4.CET until alternatives have finished playing with CR4.WP */
> +    if ( cpu_has_xen_shstk )
> +        set_in_cr4(X86_CR4_CET);

Nit: The comment still wants changing to CR0.WP.

With these taken care of in some form
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

