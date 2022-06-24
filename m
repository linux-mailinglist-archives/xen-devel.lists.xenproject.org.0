Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08195595CD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 10:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355313.582897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4f3y-0000cA-FY; Fri, 24 Jun 2022 08:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355313.582897; Fri, 24 Jun 2022 08:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4f3y-0000a3-Cq; Fri, 24 Jun 2022 08:53:14 +0000
Received: by outflank-mailman (input) for mailman id 355313;
 Fri, 24 Jun 2022 08:53:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4f3w-0000Zw-3X
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 08:53:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4f3v-0001bk-9y; Fri, 24 Jun 2022 08:53:11 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4f3v-00047Q-3S; Fri, 24 Jun 2022 08:53:11 +0000
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
	bh=J3WM92tf+L1bkFnLmWQI2eBUEPRhPlBK1xk0qu5wSgM=; b=mO+BEdpmluWWR3YoX+QFMaI6u3
	jnAym9KD4Nmtb+vEFTtIqoHKXAI2J/vXZdwiL+N5E7I7a1jW2eyXgggePoSxDhpVBkjfA+P4LxD1B
	MwRuOFTbMUUuk/HDh8MOpCw2MQPnpXcGOva46mPEjI4GyJAV1ah4ZGUYc+QHUaGLYfu4=;
Message-ID: <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org>
Date: Fri, 24 Jun 2022 09:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
To: Stefano Stabellini <sstabellini@kernel.org>, dmitry.semenets@gmail.com
Cc: xen-devel@lists.xenproject.org, Dmytro Semenets
 <dmytro_semenets@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
 <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/06/2022 23:07, Stefano Stabellini wrote:
> On Thu, 23 Jun 2022, dmitry.semenets@gmail.com wrote:
>> From: Dmytro Semenets <dmytro_semenets@epam.com>
> So wouldn't it be better to remove the panic from the implementation of
> call_psci_cpu_off?

I have asked to keep the panic() in call_psci_cpu_off(). If you remove 
the panic() then we will hide the fact that the CPU was not properly 
turned off and will consume more energy than expected.

The WFI loop is fine when shutting down or rebooting because we know 
this will only happen for a short period of time.

> 
> The reason I am saying this is that stop_cpu is called in a number of
> places beyond halt_this_cpu and as far as I can tell any of them could
> trigger the panic. (I admit they are unlikely places but still.)

This is one of the example where the CPU will not be stopped for a short 
period of time. We should deal with them differently (i.e. migrating the 
trusted OS or else) so we give all the chance for the CPU to be fully 
powered.

IMHO, this is a different issue and hence why I didn't ask Dmitry to 
solve it.

> 
> 
> Also the PSCI spec explicitely mention CPU_OFF as a way to place CPUs in
> a "known state" and doesn't offer any other examples. So although what
> you wrote in the commit message is correct, using CPU_OFF seems to be
> the less error prone way (in the sense of triggering firmware errors) to
> place CPUs in a known state.

The section you are referring to is starting with "One way". This imply 
there are others methods.

FWIW, the spin loop above seems to be how Linux is dealing with the 
shutdown/reboot.

> 
> So I would simply remove the panic from call_psci_cpu_off, so that we
> try CPU_OFF first, and if it doesn't work, we use the WFI loop as
> backup. Also we get to fix all the other callers of stop_cpu this way.
This reads strange. In the previous paragraph you suggested the CPU off 
is a less error prone way to place CPUs in a known state. But here, you 
are softening the stance and suggesting to fallback to the WFI loop.

So to me this indicates that WFI loop is fine. Otherwise, wouldn't the 
user risk to see firmware errors (which BTW, I don't understand what 
sort of firmware errors you are worried)? If yes, why would it be 
acceptable?

For instance, Dmitry situation, the CPU0 would always WFI loop...

Cheers,

-- 
Julien Grall

