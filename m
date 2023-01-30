Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92937680D9B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 13:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486973.754430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMTGE-0001lX-PY; Mon, 30 Jan 2023 12:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486973.754430; Mon, 30 Jan 2023 12:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMTGE-0001ib-M6; Mon, 30 Jan 2023 12:27:46 +0000
Received: by outflank-mailman (input) for mailman id 486973;
 Mon, 30 Jan 2023 12:27:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMTGD-0001iV-6o
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 12:27:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMTGC-0008Vz-DG; Mon, 30 Jan 2023 12:27:44 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMTGC-0008AF-5l; Mon, 30 Jan 2023 12:27:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=9C7l2Z6QScVG9X3ZnVeJW7+yG1RaH7+/zJpR8ilHISw=; b=tP3subzomB73HZ+uJEcQRy+rsU
	jUQkdjknGSXxX/L8dVs7zWG6utXVHU9oaJorA6QjAfvAx6Qw8lFFKlfuLveFAShthOP9eC2Wo+s8L
	M7uVSkB/6DoQSY0JLL9tPdGljRa+IFcZRfE3BTECPl1Tm1M9INyLJeWdnCu+hAh8DGR8=;
Message-ID: <5a53d16a-8842-457b-612a-a3623a3a98ed@xen.org>
Date: Mon, 30 Jan 2023 12:27:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build
 system
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Apologies for the late reply.

On 12/01/2023 16:52, Jan Beulich wrote:
> (re-sending with REST on Cc, as requested at the community call)
> 
> At present we use a mix of Makefile and Kconfig driven capability checks for
> tool chain components involved in the building of the hypervisor.  What approach
> is used where is in some part a result of the relatively late introduction of
> Kconfig into the build system, but in other places also simply a result of
> different taste of different contributors.  Switching to a uniform model,
> however, has drawbacks as well:
>   - A uniformly Makefile based model is not in line with Linux, where Kconfig is
>     actually coming from (at least as far as we're concerned; there may be
>     earlier origins).  This model is also being disliked by some community
>     members.
>   - A uniformly Kconfig based model suffers from a weakness of Kconfig in that
>     dependent options are silently turned off when dependencies aren't met.  This
>     has the undesirable effect that a carefully crafted .config may be silently
>     converted to one with features turned off which were intended to be on.
>     While this could be deemed expected behavior when a dependency is also an
>     option which was selected by the person configuring the hypervisor, it
>     certainly can be surprising when the dependency is an auto-detected tool
>     chain capability.  Furthermore there's no automatic re-running of kconfig if
>     any part of the tool chain changed.  (Despite knowing of this in principle,
>     I've still been hit by this more than once in the past: If one rebuilds a
>     tree which wasn't touched for a while, and if some time has already passed
>     since the updating to the newer component, one may not immediately make the
>     connection.)
> 
> Therefore I'd like to propose that we use an intermediate model: Detected tool
> chain capabilities (and alike) may only be used to control optimization (i.e.
> including their use as dependencies for optimization controls) and to establish
> the defaults of options.  They may not be used to control functionality, i.e.
> they may in particular not be specified as a dependency of an option controlling
> functionality.  This way unless defaults were overridden things will build, and
> non-default settings will be honored (albeit potentially resulting in a build
> failure).
> 
> For example
> 
> config AS_VMX
> 	def_bool $(as-instr,vmcall)
> 
> would be okay (as long as we have fallback code to deal with the case of too
> old an assembler; raising the baseline there is a separate topic), but instead
> of what we have currently
> 
> config XEN_SHSTK
> 	bool "Supervisor Shadow Stacks"
> 	default HAS_AS_CET_SS
> 
> would be the way to go.

I think your intermediate model makes sense.

> 
> It was additionally suggested that, for a better user experience, unmet
> dependencies which are known to result in build failures (which at times may be
> hard to associate back with the original cause) would be re-checked by Makefile
> based logic, leading to an early build failure with a comprehensible error
> message.  Personally I'd prefer this to be just warnings (first and foremost to
> avoid failing the build just because of a broken or stale check), but I can see
> that they might be overlooked when there's a lot of other output. 

If we wanted the Makefile to check the available features, then I would 
prefer an early error rather than warning. That said...

> In any event
> we may want to try to figure an approach which would make sufficiently sure that
> Makefile and Kconfig checks don't go out of sync.

... this is indeed a concern. How incomprehensible would the error be if 
we don't check it in the Makefile?

Cheers,

-- 
Julien Grall

