Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07742A07FA4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 19:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869084.1280590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVx47-0001PU-M2; Thu, 09 Jan 2025 18:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869084.1280590; Thu, 09 Jan 2025 18:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVx47-0001N4-IW; Thu, 09 Jan 2025 18:15:31 +0000
Received: by outflank-mailman (input) for mailman id 869084;
 Thu, 09 Jan 2025 18:15:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJAI=UB=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tVx46-0001My-4n
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 18:15:30 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3104b02-ceb5-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 19:15:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5BEEC828562D;
 Thu,  9 Jan 2025 12:15:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SMwavqoX7enH; Thu,  9 Jan 2025 12:15:24 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9EBD18286810;
 Thu,  9 Jan 2025 12:15:24 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DxaI37PkEMZZ; Thu,  9 Jan 2025 12:15:24 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 62566828562D;
 Thu,  9 Jan 2025 12:15:23 -0600 (CST)
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
X-Inumbo-ID: b3104b02-ceb5-11ef-99a4-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 9EBD18286810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1736446524; bh=l9sclmhBkQtNo/07xKJ37QlYAFduRLqz1UUCTl8OFT8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=RKPUsW0CwA2JHvpqcnGlEdobqnpN14fBpDyOW1vvIVF4kU/RywmBonNYMi32eWxdZ
	 2/w2LPp+zzlKckI/p7/nYYzSfM2ra/3gWg38mva6zLjPsOhM9VC0Jo9NaunjF8iO73
	 583RN1lkDjVlYs9HYhHniv/7N5+Fv1xC9OiS2+Oc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <ddea2ca7-e676-4f40-9d2f-8318f7416654@raptorengineering.com>
Date: Thu, 9 Jan 2025 12:15:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Introduce per-arch pte_attr_t type for PTE flags
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <47babd3f9ec00c15738a81aa57926e8a1f08cbe6.1735669493.git.sanastasio@raptorengineering.com>
 <a769ef28-5794-45a0-bb3f-e3dc3e3bcef3@suse.com>
 <d1b55fc3-feac-47e8-beed-5905b67131e4@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <d1b55fc3-feac-47e8-beed-5905b67131e4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/25 4:56 AM, Andrew Cooper wrote:
> Either, arch/mm.h is required to provide the typedef,

This approach seems fine to me. I wanted to avoid changes to other
architectures where possible, but if this is acceptable then this is
probably the route I'd want to go down (see below).

For the reason outlined below, this would also probably mean that the
typedef would go before other includes at the top of arch/mm.h, and I'm
not sure if that would be an issue from a style perspective.
Alternatively, I could have arch/type.h define it on every architecture
if that would be acceptable.

> or we could have a common one as so:
> 
> #ifndef pte_attr_t
> typedef unsigned int pte_attr_t;
> #endif
> 
> which architectures can influence with:
> 
> typedef unsigned long pte_attr_t;
> #define pte_attr_t pte_attr_t
> 
> in the usual way.
>

There seems to be a pretty messy header dependency tree with xen/mm.h
where it #includes arch/mm.h halfway through the file after defining
(among other things) the prototypes for the functions that would need
pte_attr_t. Defining pte_attr_t this late in the file won't work since
the definition also needs to be visible to xen/vmap.h which gets
transitively included by the arch headers.

The kconfig route I went with sidesteps this by allowing the common
definition to not depend on previous header inclusions in its #ifndef
guard, but I agree with yours and Jan's comments about it not being the
best approach.

> 
> One thing however does occur to me.  ARM and RISC-V have systems with
> MPU protections rather than MMU, with Xen already starting to support
> this on ARM.
> 
> Therefore we might want to reconsider the name pte_attr_t to be
> something slightly less pagetable specific.  Then again, I'm not sure
> how much overlap there is between the map* functions and MPUs, where
> mapping is of course not possible.
> 

Without too much familiarity with ARM/RISC-V's MPU situation, at first
glance it seems to me that it would warrant a separate type, even if it
happened to coincide with the flag type used by the MMU on those arches.

> 
> Finally, this wants to be at least 2 patches.  One introducing
> pte_attr_t, and one changing PPC to be unsigned long.
>

Gotcha -- not a problem.

> ~Andrew

Thanks,
Shawn

