Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C2F19D7BB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 15:37:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKMVJ-0007vx-7d; Fri, 03 Apr 2020 13:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKMVH-0007vs-EK
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 13:36:59 +0000
X-Inumbo-ID: 30c385ec-75b0-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c385ec-75b0-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 13:36:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 497B8AC53;
 Fri,  3 Apr 2020 13:36:56 +0000 (UTC)
Subject: Re: [PATCH 1/5] x86/ucode/intel: Remove CPUID from collect_cpu_info()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200402101902.28234-1-andrew.cooper3@citrix.com>
 <20200402101902.28234-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <471c3ec6-ba9a-add7-aa9a-77bb800c01ad@suse.com>
Date: Fri, 3 Apr 2020 15:36:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402101902.28234-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 02.04.2020 12:18, Andrew Cooper wrote:
> The CPUID instruction is expensive.  No point executing it twice when once
> will do fine.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -121,14 +121,12 @@ static int collect_cpu_info(struct cpu_signature *csig)
>  
>      memset(csig, 0, sizeof(*csig));
>  
> -    csig->sig = cpuid_eax(0x00000001);
> -
>      rdmsrl(MSR_IA32_PLATFORM_ID, msr_content);
>      csig->pf = 1 << ((msr_content >> 50) & 7);
>  
>      wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
>      /* As documented in the SDM: Do a CPUID 1 here */
> -    cpuid_eax(1);
> +    csig->sig = cpuid_eax(1);

... with this, perhaps make the title say "remove one CPUID ..."
or some such?

Jan

