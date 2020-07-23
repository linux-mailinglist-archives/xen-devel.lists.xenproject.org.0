Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB38622ACAD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 12:38:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyYbY-0007lt-06; Thu, 23 Jul 2020 10:37:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyYbX-0007lo-A9
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 10:37:35 +0000
X-Inumbo-ID: 831fb442-ccd0-11ea-a273-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 831fb442-ccd0-11ea-a273-12813bfff9fa;
 Thu, 23 Jul 2020 10:37:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0A5CAC52;
 Thu, 23 Jul 2020 10:37:38 +0000 (UTC)
Subject: Re: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from
 guest_{rd,wr}msr()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200722101809.8389-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76851f30-2003-2fee-221a-df70907ee91c@suse.com>
Date: Thu, 23 Jul 2020 12:37:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722101809.8389-1-andrew.cooper3@citrix.com>
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

On 22.07.2020 12:18, Andrew Cooper wrote:
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -227,6 +227,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val = msrs->misc_features_enables.raw;
>          break;
>  
> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
> +    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
> +        if ( vmce_rdmsr(msr, val) < 0 )
> +            goto gp_fault;
> +        break;
> +
>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>          if ( !is_hvm_domain(d) || v != curr )
>              goto gp_fault;
> @@ -436,6 +444,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          break;
>      }
>  
> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
> +    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
> +        if ( vmce_wrmsr(msr, val) < 0 )
> +            goto gp_fault;
> +        break;
> +
>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>          if ( !is_hvm_domain(d) || v != curr )
>              goto gp_fault;

With this the two functions also possibly returning 0 or 1 becomes
meaningless. Would you think you can make then return bool at this
occasion, or would you prefer to leave this to whenever someone
gets to clean up this resulting anomaly? (I'm fine either way, but
would prefer to not see the then meaningless tristate return values
left in place.)

Jan

