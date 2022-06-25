Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72855AB10
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jun 2022 16:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355999.583975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o572Q-00065f-6V; Sat, 25 Jun 2022 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355999.583975; Sat, 25 Jun 2022 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o572Q-00062k-3V; Sat, 25 Jun 2022 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 355999;
 Sat, 25 Jun 2022 14:45:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o572O-00062e-GA
 for xen-devel@lists.xenproject.org; Sat, 25 Jun 2022 14:45:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o572N-0002UD-Oo; Sat, 25 Jun 2022 14:45:27 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o572N-0005Ra-Ge; Sat, 25 Jun 2022 14:45:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=GeFbfIa+gtCTy2aaanL3LieGAJaOgijYwGr8EpZ6OsY=; b=thgPxKFxPk6ijTzbLpCSom85ul
	Zslm3TK2rj9GgMAq3JcugDMEJJywThtFbnJT+15JcOi1re3YlEHjXSnVdUoiIrT1dV9YdR49DJyrJ
	y5NCOZWTNSTu/sKGXXHmN6kwL+vVkzaXK6IIkkDEZHtfsYkYluHxowgcl9EB4L8ksFzs=;
Message-ID: <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org>
Date: Sat, 25 Jun 2022 15:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org,
 Dmytro Semenets <dmytro_semenets@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
 <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
 <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org>
 <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
In-Reply-To: <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/06/2022 22:31, Stefano Stabellini wrote:
> On Fri, 24 Jun 2022, Julien Grall wrote:
>> On 23/06/2022 23:07, Stefano Stabellini wrote:
>>> On Thu, 23 Jun 2022, dmitry.semenets@gmail.com wrote:
>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>>> So wouldn't it be better to remove the panic from the implementation of
>>> call_psci_cpu_off?
>>
>> I have asked to keep the panic() in call_psci_cpu_off(). If you remove the
>> panic() then we will hide the fact that the CPU was not properly turned off
>> and will consume more energy than expected.
>>
>> The WFI loop is fine when shutting down or rebooting because we know this will
>> only happen for a short period of time.
> 
> Yeah, I don't think we should hide that CPU_OFF failed. I think we
> should print a warning. However, given that we know CPU_OFF can
> reasonably fail in normal conditions returning DENIED when a Trusted OS
> is present, then I think we should not panic.

We know how to detect this condition (see section 5.9 in DEN0022D.b). So 
I would argue we should fix it properly rather than removing the panic().

> 
> If there was a way to distinguish a failure because a Trusted OS is
> present (the "normal" failure) from other failures, I would suggest to:
> - print a warning if failed due to a Trusted OS being present
> - panic in other cases
> 
> Unfortunately it looks like in all cases the return code is DENIED :-(
I am confused. Per the spec, the only reason CPU_OFF can return DENIED 
is because the Trusted OS is resident. So what other cases are you 
talking about?

> 
> 
> Given that, I would not panic and only print a warning in all cases. Or
> we could ASSERT which at least goes away in !DEBUG builds.

ASSERT() is definitely not way to deal with external input. I could 
possibly accept a WARN(), but see above.

>>> The reason I am saying this is that stop_cpu is called in a number of
>>> places beyond halt_this_cpu and as far as I can tell any of them could
>>> trigger the panic. (I admit they are unlikely places but still.)
>>
>> This is one of the example where the CPU will not be stopped for a short
>> period of time. We should deal with them differently (i.e. migrating the
>> trusted OS or else) so we give all the chance for the CPU to be fully powered.
>>
>> IMHO, this is a different issue and hence why I didn't ask Dmitry to solve it.
> 
> I see your point now. I was seeing the two things as one.
> 
> I think it is true that the WFI loop is likely to work. Also it is true
> that from a power perspective it makes no different on power down or
> reboot.  From that point of view this patch is OK.
> 
> But even on shut-down/reboot, why not do that as a fallback in case
> CPU_OFF didn't work? It is going to work most of the times anyway, why
> change the default for the few cases that doesn't work?

Because we would not be consistent how we would turn off a CPU on a 
system supporting PSCI. I would prefer to use the same method everywhere 
so it is easier to reason about.

I am also not sure how you define "most of the time". Yes it is possible 
that the boards we aware of will not have this issue, but how about the 
one we don't know?

> 
> Given that this patch would work, I don't want to insist on this and let
> you decide.
> 
> 
> But even if we don't want to remove the panic as part of this patch, I
> think we should remove the panic in a separate patch anyway, at least
> until someone investigates and thinks of a strategy how to migrate the
> TrustedOS as you suggested.
If we accept this patch, then we remove the immediate pain. The other 
uses of stop_cpu() are in:
	1) idle_loop(), this is reachable when turning off a CPU after boot 
(not supported on Arm)
         2) start_secondary(), this is only used during boot (CPU 
hot-unplug is not supported)

Even if it would be possible to trigger the panic() in 2), I am not 
aware of an immediate issue there. So I think it would be the wrong 
approach to remove the panic() first and then investigate.

The advantage of the panic() is it will remind us that some needs to be 
fixed. With a warning (or WARN()) people will tend to ignore it.

Cheers,

-- 
Julien Grall

