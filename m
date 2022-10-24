Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757EF609F58
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428851.679406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omv3l-0004t5-CL; Mon, 24 Oct 2022 10:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428851.679406; Mon, 24 Oct 2022 10:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omv3l-0004qN-9E; Mon, 24 Oct 2022 10:51:57 +0000
Received: by outflank-mailman (input) for mailman id 428851;
 Mon, 24 Oct 2022 10:51:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omv3j-0004qF-OD
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:51:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omv3j-0000oo-FS; Mon, 24 Oct 2022 10:51:55 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.4.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omv3j-000437-8F; Mon, 24 Oct 2022 10:51:55 +0000
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
	bh=cju52zw+dZv9y0EgdTJ1AQtOfp6kqJoG8nPN6WmikNg=; b=emPfF5MSM4Pncf/6ZcEqybiSdu
	d9HswK15kKM8+cH946F2+qAfhWh1dG0Puy28G2eBxzfxW3guBs39OWJ35EYag4CID3XxzrOkfisMq
	UWrHxdN6wqwElUpysbXrOMEAq9mmL1qvuXqdYHIX7Pzgrw0whLFIF2trP3nc4mm2b1zg=;
Message-ID: <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
Date: Mon, 24 Oct 2022 11:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Deadcode discussion based on Arm NS phys timer
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2022 10:07, Michal Orzel wrote:
> Hello,

Hi Michal,

> Recently I came across a deadcode in Xen Arm arch timer code. Briefly speaking, we are routing
> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use of it (as it uses the hypervisor timer CNTHP).
> This timer is fully emulated, which means that there is nothing that can trigger such IRQ. This code is
> a left over from early days, where the CNTHP was buggy on some models and we had to use the CNTP instead.
> 
> As far as the problem itself is not really interesting, it raises a question of what to do with a deadcode,
> as there might be/are other deadcode places in Xen.

There are multiple definition of deadcode. Depending on which one you 
chose, then this could cover IS_ENABLED() and possibly #ifdef. So this 
would result to a lot of places impacted with the decision.

So can you clarify what you mean by deadcode?

> One may say that it is useful to keep it, because one day,
> someone might need it when dealing with yet another broken HW. Such person would still need to modify the other
> part of the code (e.g. reprogram_timer), but there would be less work required overall. Personally, I'm not in favor of
> such approach, because we should not really support possible scenarios with broken HW (except for erratas listing known issues).

The difference between "broken HW" and "HW with known errata" is a bit 
unclear to me. Can you clarify how you would make the difference here?

In particular, at which point do you consider that the HW should not be 
supported by Xen?

> Also, as part of the certification/FUSA process, there should be no deadcode and we should have explanation for every block of code.

See above. What are you trying to cover by deadcode? Would protecting 
code with IS_ENABLED() (or #ifdef) ok?

> 
> There are different ways to deal with a deadcode: > 1. Get rid of it completely
> 2. Leave it as it is
> 3. Admit that it can be useful one day and:
>    3.1. protect it with #if 0
>    3.2. protect it with a new Kconfig option (disabled by default) using #ifdef
>    3.3. protect it with a new Kconfig option (disabled by default) using IS_ENABLED (to make sure code always compile)
>    3.4. protect it with a command line option (allowing to choose the timer to be used by Xen)
> ...
> 
> Let me know what you think.

Before answering the question, I would need some clarifications on your aim.

Cheers,

-- 
Julien Grall

