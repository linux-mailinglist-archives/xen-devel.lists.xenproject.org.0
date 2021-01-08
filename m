Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E32EF441
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63598.112884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtB6-0000so-CH; Fri, 08 Jan 2021 14:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63598.112884; Fri, 08 Jan 2021 14:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtB6-0000sP-91; Fri, 08 Jan 2021 14:55:48 +0000
Received: by outflank-mailman (input) for mailman id 63598;
 Fri, 08 Jan 2021 14:55:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtB4-0000sK-Lb
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:55:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c3268a4-1605-488c-a286-d12a5a8d8b4d;
 Fri, 08 Jan 2021 14:55:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCFF7ACC6;
 Fri,  8 Jan 2021 14:55:44 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9c3268a4-1605-488c-a286-d12a5a8d8b4d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610117745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjPHfVrjgUAg7fKAFsBbnIlwJphQqPVYkVLWUuOTuco=;
	b=bHRTnmk1SBl5bN6CCFkwI2JVNgXiR1/sHh6Mb+wraMe8EnGVgCXX/Nv5/qOaS916O5QmS7
	DR/z8WIs2PoQt3Zw+XPu+AN98mbKGJmbiPm0W1lqyiHZzwdQN2ptEXnmO8k41+7Zw+tJGR
	t2BUbRTuUCfz2RmG+O+b3GMmy5DDra0=
Subject: Re: [PATCH 2/4] x86: Introduce MSR_UNHANDLED
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, boris.ostrvsky@oracle.com,
 xen-devel@lists.xenproject.org
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
 <1610051698-23675-3-git-send-email-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63813bfa-28d9-c590-1aeb-afbd4fc2b6b2@suse.com>
Date: Fri, 8 Jan 2021 15:55:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610051698-23675-3-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 21:34, Boris Ostrovsky wrote:
> --- a/xen/include/xen/lib/x86/msr.h
> +++ b/xen/include/xen/lib/x86/msr.h
> @@ -2,8 +2,21 @@
>  #ifndef XEN_LIB_X86_MSR_H
>  #define XEN_LIB_X86_MSR_H
>  
> +/*
> + * Behavior on accesses to MSRs that are not handled by emulation:

What about ones handled by emulation, when emulation decides to
raise #GP and this still causes trouble to a guest? (Slightly
orthogonal, so we may want to defer this aspect.)

> + *  0 = return #GP, warning emitted
> + *  1 = read as 0, writes are dropped, no warning
> + *  2 = read as 0, writes are dropped, warning emitted
> + */
> +#define MSR_UNHANDLED_NEVER     0
> +#define MSR_UNHANDLED_SILENT    1
> +#define MSR_UNHANDLED_VERBOSE   2
> +
> +/* MSR that is not explicitly processed by emulation */
> +#define MSR_UNHANDLED -1

Not sure about this choice: I'd consider an MSR index in the Xen
range more safe to use, not the least because this value
effectively becomes part of the migration ABI. Or if you use one
outside, then maybe a less prominent one than 0xffffffff (I
guess -1, irrespective of the missing parentheses, isn't
appropriate to use here).

> @@ -77,7 +78,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
>          if ( copy_from_buffer_offset(&data, msrs, i, 1) )
>              return -EFAULT;
>  
> -        if ( data.flags ) /* .flags MBZ */
> +        if ( data.idx != MSR_UNHANDLED && data.flags )

You permit all flags bits set here, but ...

> @@ -101,6 +102,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
>  
>          case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
>          case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
> +        case MSR_UNHANDLED:           p->ignore_msrs = data.flags & 0xff;       break;

... you use only the low 8 ones here. You want to forbid any we
don't know of, and even restrict the low two ones to just the
three values you define. E.g. for now

        if ( data.idx != MSR_UNHANDLED ? data.flags
                                       : data.flags > MSR_UNHANDLED_VERBOSE )
        {
            rc = -EINVAL;
            goto err;

Otoh I don't see why you need to use flags here - I think you
could as well use the MSR value to convey the setting. And if
you don't, you'd want to check the value to be zero.

Nit: You can shorten line length by omitting the "& 0xff" and
reducing the number of blanks ahead of "break;".

Jan

