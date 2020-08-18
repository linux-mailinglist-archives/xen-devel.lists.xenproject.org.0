Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CA2480ED
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:51:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xKY-0003kI-67; Tue, 18 Aug 2020 08:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7xKW-0003k6-Dj
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:50:52 +0000
X-Inumbo-ID: ce8b173e-559c-4223-87cb-8ffe41e1b67a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce8b173e-559c-4223-87cb-8ffe41e1b67a;
 Tue, 18 Aug 2020 08:50:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B906ABF4;
 Tue, 18 Aug 2020 08:51:15 +0000 (UTC)
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
 <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70f7a5c0-3f41-e3a7-00ea-0e620a5506e9@suse.com>
Date: Tue, 18 Aug 2020 10:50:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.08.2020 21:07, Julien Grall wrote:
> Hi Jan,
> 
> On 31/07/2020 12:36, Jan Beulich wrote:
>> On 30.07.2020 20:18, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Only a few places are actually including asm/guest_access.h. While this
>>> is fine today, a follow-up patch will want to move most of the helpers
>>> from asm/guest_access.h to xen/guest_access.h.
>>>
>>> To prepare the move, everyone should include xen/guest_access.h rather
>>> than asm/guest_access.h.
>>>
>>> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
>>> inclusion is now removed as no-one but the latter should include the
>>> former.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Is there any chance you could take measures to avoid new inclusions
>> of asm/guest_access.h to appear?
> 
> It should be possible.
> 
> How about this:
> 
> diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
> index b9a89c495527..d8dbc7c973b4 100644
> --- a/xen/include/asm-arm/guest_access.h
> +++ b/xen/include/asm-arm/guest_access.h
> @@ -1,3 +1,7 @@
> +#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
> +#error "asm/guest_access.h should not be included directly"
> +#endif
> +
>  #ifndef __ASM_ARM_GUEST_ACCESS_H__
>  #define __ASM_ARM_GUEST_ACCESS_H__
> 
> diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
> index 369676f31ac3..e665ca3a27af 100644
> --- a/xen/include/asm-x86/guest_access.h
> +++ b/xen/include/asm-x86/guest_access.h
> @@ -4,6 +4,10 @@
>   * Copyright (c) 2006, K A Fraser
>   */
> 
> +#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
> +#error "asm/guest_access.h should not be included directly"
> +#endif
> +
>  #ifndef __ASM_X86_GUEST_ACCESS_H__
>  #define __ASM_X86_GUEST_ACCESS_H__
> 
> diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
> index 75103d30c8be..814e31329de9 100644
> --- a/xen/include/xen/guest_access.h
> +++ b/xen/include/xen/guest_access.h
> @@ -7,7 +7,9 @@
>  #ifndef __XEN_GUEST_ACCESS_H__
>  #define __XEN_GUEST_ACCESS_H__
> 
> +#define ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>  #include <asm/guest_access.h>
> +#undef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>  #include <xen/types.h>
>  #include <public/xen.h>

One option. Personally I'd prefer to avoid introduction of yet another
constant, by leveraging __XEN_GUEST_ACCESS_H__ instead.

Jan

