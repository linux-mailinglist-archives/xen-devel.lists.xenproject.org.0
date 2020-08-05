Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9423CBA2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:08:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3L1T-0007OC-Ng; Wed, 05 Aug 2020 15:08:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3L1S-0007O7-A3
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:08:06 +0000
X-Inumbo-ID: 2f524f99-b9f5-4538-8df4-5e5e98e2d2bd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f524f99-b9f5-4538-8df4-5e5e98e2d2bd;
 Wed, 05 Aug 2020 15:08:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88212AC7F;
 Wed,  5 Aug 2020 15:08:21 +0000 (UTC)
Subject: Re: [PATCH] x86/ioapic: Fix style in io_apic.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200805125124.7763-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c4174dcf-b103-e2d9-b2f6-27020103f515@suse.com>
Date: Wed, 5 Aug 2020 17:08:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200805125124.7763-1-andrew.cooper3@citrix.com>
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

On 05.08.2020 14:51, Andrew Cooper wrote:
> This file is a mix of Xen and Linux styles.  Switch it fully to Xen style.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a suggestion and, I'm afraid, a few more adjustments:

> --- a/xen/include/asm-x86/io_apic.h
> +++ b/xen/include/asm-x86/io_apic.h
> @@ -13,9 +13,9 @@
>   * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
>   */
>  
> -#define IO_APIC_BASE(idx) \
> -		((volatile int *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + idx) \
> -		+ (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
> +#define IO_APIC_BASE(idx)                                               \
> +    ((volatile int *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + idx)           \
> +                      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))

As you touch this anyway, would you mind parenthesizing idx when
used as a, operand of + ?

> @@ -135,28 +135,28 @@ unsigned int io_apic_gsi_base(unsigned int apic);
>  
>  static inline unsigned int __io_apic_read(unsigned int apic, unsigned int reg)
>  {
> -	*IO_APIC_BASE(apic) = reg;
> -	return *(IO_APIC_BASE(apic)+4);
> +    *IO_APIC_BASE(apic) = reg;
> +    return *(IO_APIC_BASE(apic)+4);

Here and below + wants to be framed by spaces.

Jan

