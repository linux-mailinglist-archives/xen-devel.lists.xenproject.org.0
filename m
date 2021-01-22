Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFC3001FB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 12:52:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72710.130973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2uys-0002wt-V2; Fri, 22 Jan 2021 11:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72710.130973; Fri, 22 Jan 2021 11:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2uys-0002wU-Rk; Fri, 22 Jan 2021 11:51:58 +0000
Received: by outflank-mailman (input) for mailman id 72710;
 Fri, 22 Jan 2021 11:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2uyr-0002wP-7h
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 11:51:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f670ed33-d2ff-4bd6-94e5-796197d1be34;
 Fri, 22 Jan 2021 11:51:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 736D5AB9F;
 Fri, 22 Jan 2021 11:51:55 +0000 (UTC)
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
X-Inumbo-ID: f670ed33-d2ff-4bd6-94e5-796197d1be34
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611316315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akXlBs8h9mU4IZe9NohAMPTt5tKWnLX76cj5niFmnRg=;
	b=VXyCRoXS3YEZNi8qQFeclkasuCy18JxhPA3wh/IlLxObMPwI0AOaJ0oIzr7j+Yohsx2dVK
	WsaQ4AoW2GLy26M82hPidjFWx6ypSJEkZ1qDyLnCVoUa69P7qEpZsjmmppaBqYIwz8B9Pe
	lm9dOa0Jy4jy+0gkG2gMr2uzdMElDME=
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, andrew.cooper3@citrix.com
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 roger.pau@citrix.com, jun.nakajima@intel.com, kevin.tian@intel.com,
 xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba472bc6-a4e4-2e94-6388-0f9bf8eef3b3@suse.com>
Date: Fri, 22 Jan 2021 12:51:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.01.2021 23:49, Boris Ostrovsky wrote:
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -295,7 +295,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          }
>  
>          /* Fallthrough. */
> -    case 0x40000200 ... 0x400002ff:
> +    case 0x40000200 ... 0x400002fe:
>          ret = guest_rdmsr_xen(v, msr, val);
>          break;
>  
> @@ -514,7 +514,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          }
>  
>          /* Fallthrough. */
> -    case 0x40000200 ... 0x400002ff:
> +    case 0x40000200 ... 0x400002fe:
>          ret = guest_wrmsr_xen(v, msr, val);
>          break;

For both of these, we need some kind of connection to
MSR_UNHANDLED. Could be a BUILD_BUG_ON() or an explicit
"case MSR_UNHANDLED:" (preventing someone "correcting" the
apparent mistake) or yet something else.

> --- a/xen/include/xen/lib/x86/msr.h
> +++ b/xen/include/xen/lib/x86/msr.h
> @@ -2,8 +2,21 @@
>  #ifndef XEN_LIB_X86_MSR_H
>  #define XEN_LIB_X86_MSR_H
>  
> +/*
> + * Behavior on accesses to MSRs that are not handled by emulation:
> + *  0 = return #GP, warning emitted
> + *  1 = read as 0, writes are dropped, no warning
> + *  2 = read as 0, writes are dropped, warning emitted
> + */
> +#define MSR_UNHANDLED_NEVER     0
> +#define MSR_UNHANDLED_SILENT    1
> +#define MSR_UNHANDLED_VERBOSE   2
> +
> +/* MSR that is not explicitly processed by emulation */
> +#define MSR_UNHANDLED           0x400002ff

MSR indexes as well as definitions for MSR contents generally
live in asm-x86/msr-index.h. I think it would be better for
the above to also go there.

Additionally the comment on MSR_UNHANDLED should not only
say what will not happen for this index, but also what its
intended purpose is.

> @@ -45,6 +58,8 @@ struct msr_policy
>              bool taa_no:1;
>          };
>      } arch_caps;
> +
> +    uint8_t ignore_msrs;

Add a brief comment along the lines of /* MSR_UNHANDLED_* */
here to make the connection to intended values?

Also, Andrew, (I think I did say so before) - I definitely
would want your general consent with this model, as what gets
altered here is almost all relatively recent contributions
by you. Nor would I exclude the approach being controversial.

Jan

