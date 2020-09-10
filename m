Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BC264839
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:47:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNqu-0006WD-IE; Thu, 10 Sep 2020 14:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGNqs-0006W8-TA
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:47:06 +0000
X-Inumbo-ID: aa7fb40c-591e-4c6f-a556-285c4b61b4e5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa7fb40c-591e-4c6f-a556-285c4b61b4e5;
 Thu, 10 Sep 2020 14:47:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC17DAD77;
 Thu, 10 Sep 2020 14:47:20 +0000 (UTC)
Subject: Re: [PATCH 2/5] x86/asm: Split __wr{fs,gs}base() out of
 write_{fs,gs}_base()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83dadf8d-f5ea-bd76-86bc-19f3cd1f6a21@suse.com>
Date: Thu, 10 Sep 2020 16:47:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909095920.25495-3-andrew.cooper3@citrix.com>
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
> To match the read side which is already split out.  A future change will want
> to use them.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
Of course ...

> --- a/xen/include/asm-x86/msr.h
> +++ b/xen/include/asm-x86/msr.h
> @@ -156,6 +156,24 @@ static inline unsigned long __rdgsbase(void)
>      return base;
>  }
>  
> +static inline void __wrfsbase(unsigned long base)
> +{
> +#ifdef HAVE_AS_FSGSBASE
> +    asm volatile ( "wrfsbase %0" :: "r" (base) );
> +#else
> +    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd0" :: "a" (base) );
> +#endif
> +}
> +
> +static inline void __wrgsbase(unsigned long base)
> +{
> +#ifdef HAVE_AS_FSGSBASE
> +    asm volatile ( "wrgsbase %0" :: "r" (base) );
> +#else
> +    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd8" :: "a" (base) );
> +#endif
> +}

... I'd have preferred if you had used just a single leading
underscore, despite realizing this would introduce an inconsistency
with the read sides.

Jan

