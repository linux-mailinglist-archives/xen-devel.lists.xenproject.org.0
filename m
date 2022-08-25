Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14605A1114
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 14:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393409.632344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCKf-00013o-3F; Thu, 25 Aug 2022 12:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393409.632344; Thu, 25 Aug 2022 12:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCKf-00011j-0K; Thu, 25 Aug 2022 12:51:37 +0000
Received: by outflank-mailman (input) for mailman id 393409;
 Thu, 25 Aug 2022 12:51:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRCKd-00011X-GZ
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 12:51:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRCKb-0006Bc-2b; Thu, 25 Aug 2022 12:51:33 +0000
Received: from [54.239.6.188] (helo=[192.168.11.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRCKa-0005bm-RK; Thu, 25 Aug 2022 12:51:32 +0000
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
	bh=TMrDtxAxd+IHdjS5xxag23FyxG3EAvQzyhKefPKc+kM=; b=XBFA/PsPHsnfLI5J6Jxvb3di2k
	oeX0IvLiLaM6u393RHi/9wn61LTSM4Oew7q7Drw47OXifUrq7uFLexMHPSYVYJ+xvT/34RsvcdVzj
	szSfA2etS9+3pSd9WuZNdck2KuMQtH0YiAMGgWlTAbqgVt/TMkaihPvIqrmqALQD+rqM=;
Message-ID: <f26ff59b-0a55-2bc4-9933-480c09e1587d@xen.org>
Date: Thu, 25 Aug 2022 13:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
To: Leo Yan <leo.yan@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org> <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdcBFmCQ4pU1kDi@leoy-huanghe>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <YwdcBFmCQ4pU1kDi@leoy-huanghe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

On 25/08/2022 12:24, Leo Yan wrote:
> On Thu, Aug 25, 2022 at 10:07:18AM +0100, Julien Grall wrote:
> 
> [...]
> 
>>> In other words, let's assume the Dom0 kernel panic and its secondary
>>> kernel is launched by kexec, is it necessarily for the secondary
>>> kernel to reuse the primary kernel's RD pending page?
>>
>> No.
> 
> If the answer is no, then I think it's feasible to pass the same ACPI
> table or DT binding for virtual GICv3 from primary kernel to secondary
> kernel, then the second kernel can initialize the VGIC and allocate a
> new RD tables (and trap to Xen in EL2 to handle the new allocated RD
> tables).  How about you think for this?

I think that would work.

Cheers,

-- 
Julien Grall

