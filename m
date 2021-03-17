Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43333ECF5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 10:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98599.187108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMSS6-0007sN-PV; Wed, 17 Mar 2021 09:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98599.187108; Wed, 17 Mar 2021 09:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMSS6-0007ry-MQ; Wed, 17 Mar 2021 09:26:54 +0000
Received: by outflank-mailman (input) for mailman id 98599;
 Wed, 17 Mar 2021 09:26:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nS5B=IP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMSS5-0007rt-Mb
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 09:26:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 516989ac-021a-4eaf-8c96-6aea65d1b6dc;
 Wed, 17 Mar 2021 09:26:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F2B5AB8C;
 Wed, 17 Mar 2021 09:26:51 +0000 (UTC)
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
X-Inumbo-ID: 516989ac-021a-4eaf-8c96-6aea65d1b6dc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615973211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXmDT6Of9ce644ypGmVsd0TWrzwGbJJ4Xnkb4B9HVoQ=;
	b=mAVjqkt6Kti/Nf1yMXoVBmTEHUKI+AlJsIfEeT6bnqg6bLj3K8eo00Jhm1plSM7uRlRiVa
	R/i+idQi8AYxq0z70OtYO3i3lNi2AhfOaQdpdDeISqwGNtqZe7ucZxF8J76BDgAvP7eDOn
	LooUqksUMyRA43gWWPQp+XfUbHRwgWk=
Subject: Re: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ded526ad-ac88-32aa-3ece-27308dbc9772@suse.com>
Date: Wed, 17 Mar 2021 10:26:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316161844.1658-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.03.2021 17:18, Andrew Cooper wrote:
> @@ -284,6 +283,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>              goto gp_fault;
>          break;
>  
> +    case MSR_RAPL_POWER_UNIT:
> +        /*
> +         * This MSR is non-architectural.  However, some versions of Solaris
> +         * blindly reads it without a #GP guard, and some versions of
> +         * turbostat crash after expecting a read of /proc/cpu/0/msr not to
> +         * fail.  Read as zero on Intel hardware.
> +         */
> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> +            goto gp_fault;
> +        *val = 0;
> +        break;
> +
>          /*
>           * These MSRs are not enumerated in CPUID.  They have been around
>           * since the Pentium 4, and implemented by other vendors.
> 

I find all of this confusing, at best: I'd expect any entity reading
this MSR to - when successful - go on and read further MSRs. I have a
hard time seeing why those subsequent reads would be any less prone
to being unguarded. In fact I went and looked at the turbostat
sources. From its introduction the read of this MSR was done with -
afaict - appropriate error handling. There are anomalies (do_rapl
getting set prior to the probing of this MSR), but they look to not
matter stability-wise as the respective MSR reads are similarly
guarded. Were the observed crashes perhaps just in some private
versions of the tool? If so, I guess saying so in the comment (or
description) would be appropriate, but this still wouldn't invalidate
the general aspect of my remark.

On the good side the value of zero isn't entirely invalid, at least
as far as defined bitfields of the MSR go.

While looking around I also came across MSR_PLATFORM_ENERGY_COUNTER.
This one has specific precautions in the SDM: "This MSR is valid only
if both platform vendor hardware implementation and BIOS enablement
support it. This MSR will read 0 if not valid." Isn't this a fairly
strong suggestion that instead of raising #GP for it, we'd better
return zero as well? Because of the remark, unlike for certain other
MSRs, consumers have to expect zero possibly coming back.

Jan

