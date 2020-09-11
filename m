Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112C265D4A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:02:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGfsF-0007qW-IF; Fri, 11 Sep 2020 10:01:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGfsD-0007qR-OU
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:01:41 +0000
X-Inumbo-ID: b3a0ece0-c26b-4092-8392-488abb4d2872
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3a0ece0-c26b-4092-8392-488abb4d2872;
 Fri, 11 Sep 2020 10:01:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EDB6B291;
 Fri, 11 Sep 2020 10:01:55 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86/pv: Simplify emulation for the 64bit base MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50039b2e-bd62-5948-10b4-4cbaeac7b555@suse.com>
Date: Fri, 11 Sep 2020 12:01:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909095920.25495-6-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.09.2020 11:59, Andrew Cooper wrote:
> is_pv_32bit_domain() is an expensive predicate, but isn't used for speculative
> safety in this case.  Swap to checking the Long Mode bit in the CPUID policy,
> which is the architecturally correct behaviour.
> 
> is_canonical_address() isn't a trivial predicate, but it will become more
> complicated when 5-level support is added.  Rearrange write_msr() to collapse
> the common checks.

Did you mean "is" instead of "isn't" or "and" instead of "but"? The
way it is it doesn't look very logical to me.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one more remark:

> @@ -991,22 +993,22 @@ static int write_msr(unsigned int reg, uint64_t val,
>          uint64_t temp;
>  
>      case MSR_FS_BASE:
> -        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
> -            break;
> -        write_fs_base(val);
> -        return X86EMUL_OKAY;
> -
>      case MSR_GS_BASE:
> -        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
> -            break;
> -        write_gs_base(val);
> -        return X86EMUL_OKAY;
> -
>      case MSR_SHADOW_GS_BASE:
> -        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
> +        if ( !cp->extd.lm || !is_canonical_address(val) )
>              break;
> -        write_gs_shadow(val);
> -        curr->arch.pv.gs_base_user = val;
> +
> +        if ( reg == MSR_FS_BASE )
> +            write_fs_base(val);
> +        else if ( reg == MSR_GS_BASE )
> +            write_gs_base(val);
> +        else if ( reg == MSR_SHADOW_GS_BASE )

With the three case labels just above, I think this "else if" and ...

> +        {
> +            write_gs_shadow(val);
> +            curr->arch.pv.gs_base_user = val;
> +        }
> +        else
> +            ASSERT_UNREACHABLE();

... this assertion are at least close to being superfluous. Their
dropping would then also make me less inclined to ask for an
inner switch().

Jan

