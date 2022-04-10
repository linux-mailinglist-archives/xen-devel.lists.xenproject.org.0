Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AC4FADDA
	for <lists+xen-devel@lfdr.de>; Sun, 10 Apr 2022 14:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302445.516099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndWi6-0008AY-5N; Sun, 10 Apr 2022 12:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302445.516099; Sun, 10 Apr 2022 12:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndWi6-00087m-24; Sun, 10 Apr 2022 12:30:30 +0000
Received: by outflank-mailman (input) for mailman id 302445;
 Sun, 10 Apr 2022 12:30:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndWi5-00087g-43
 for xen-devel@lists.xenproject.org; Sun, 10 Apr 2022 12:30:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndWi4-00008y-P8; Sun, 10 Apr 2022 12:30:28 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndWi4-0000ee-JM; Sun, 10 Apr 2022 12:30:28 +0000
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
	bh=Pd57Yesd3M1f9mU19uIPKiS1BYZpw2E5kDkZpnsqjxs=; b=Tel+3wKpy3jtPfjgAQxufSvGMT
	iv7VLbeJhirLS5MpQhqlbldfNmSg3rWLLNPAQgPJHoxidiOx1ACf05bdaaSOfkN3jPN3BDHnTfexv
	J6vLpwm6SttvV2rt75taF88q08TP+EdI9qQXIIX19YwFrooCPDRPR3mE5w2M+iMFruQM=;
Message-ID: <97f7a205-9dc0-53cf-2b90-bda3f9868686@xen.org>
Date: Sun, 10 Apr 2022 13:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 06/19] xen/arm: mm: Avoid flushing the TLBs when
 mapping are inserted
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-7-julien@xen.org>
 <alpine.DEB.2.22.394.2204011657080.2910984@ubuntu-linux-20-04-desktop>
 <f0d3ed02-450f-9bd1-e8ab-5594234a835d@xen.org>
 <alpine.DEB.2.22.394.2204051348200.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204051348200.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/04/2022 21:49, Stefano Stabellini wrote:
> On Sat, 2 Apr 2022, Julien Grall wrote:
>> Maybe it would be clearer if I write:
>>
>>   !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN))
> 
> It is not much a matter of clarity -- I just wanted to check with you
> the reasons for the if condition because, as you wrote, wrong tlb
> flushes can have catastrophic effects.
> 
> That said, actually I prefer your second version:
> 
>    !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN))

I have updated the patch to use this switch.

Cheers,

-- 
Julien Grall

