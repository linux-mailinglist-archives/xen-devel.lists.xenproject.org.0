Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB926258D6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 11:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442440.696599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otRfs-0005Q6-Mc; Fri, 11 Nov 2022 10:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442440.696599; Fri, 11 Nov 2022 10:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otRfs-0005Ny-JW; Fri, 11 Nov 2022 10:54:16 +0000
Received: by outflank-mailman (input) for mailman id 442440;
 Fri, 11 Nov 2022 10:54:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1otRfq-0005Ns-Rw
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 10:54:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otRff-0004Kl-Tm; Fri, 11 Nov 2022 10:54:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otRff-0005YS-M4; Fri, 11 Nov 2022 10:54:03 +0000
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
	bh=ZQpJo21zs1i55Uy36nEz1DJotTrs5ORqnBzNy5wV+mw=; b=k9qmDmdKX3ZD4p4YiNvt/oVaNk
	1ChWHLomiRv9Io3OscEJWlJ1qOd/wcf/pLYY63sGTqm4536FSO5ErNhXTzC/wBWfvNA//c4JwOCLR
	71X2Lj2kHlDemOWxG/jC6Pjs7OIjwgac8KecOjc6cMY7fgjPMsK/rpWUr1gn6v/S1ZR0=;
Message-ID: <b2a1b0b9-b5a9-4d7a-a52f-1a20c9e5c470@xen.org>
Date: Fri, 11 Nov 2022 10:54:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 4/4] xen/arm: Correct the p2m pool size calculations
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen Security Team <security@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-5-andrew.cooper3@citrix.com>
 <AS8PR08MB7991D6139BEF9ABE43F1B3C492009@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991D6139BEF9ABE43F1B3C492009@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/2022 10:11, Henry Wang wrote:
>> -----Original Message-----
>> Subject: [PATCH 4/4] xen/arm: Correct the p2m pool size calculations
>>
>> Allocating or freeing p2m pages doesn't alter the size of the mempool; only
>> the split between free and used pages.
>>
>> Right now, the hypercalls operate on the free subset of the pool, meaning
>> that
>> XEN_DOMCTL_get_p2m_mempool_size varies with time as the guest shuffles
>> its
>> physmap, and XEN_DOMCTL_set_p2m_mempool_size ignores the used
>> subset of the
>> pool and lets the guest grow unbounded.
>>
>> This fixes test-p2m-pool on ARM so that the behaviour matches x86.
>>
>> This is part of XSA-409 / CVE-2022-33747.
>>
>> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M
>> pool")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> 
> Hi Arm maintainers, may I ask for a reviewed-by/ack from you for the
> correctness of the code in the release? Thank you very much!

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

